Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99311C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 09:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w/ni5781VVr16bItXLKfgVIyKF//yxa+M0aaQwtqitw=; b=nX3FCRwY5j0RHZu2an7D4F2v/6
	819o0EJ+R94Y34yaDh6CdoSvEzaM/0jjSeq10UHBlv6IIKgRo+KzURAX66XUmv5u8oVwtR4x/Rinf
	lRfLBwHtAuZjoYSkYwZ26zAfF/cIauysFK617W6Hpp9qxxr62deFKbT2btCUVZoWvsoputWbeFPzg
	vJHt235V4wiS4tTsqdwpHKUJtfdIZlaOvo78y7Tpii34H7e00BG0xe9NdceOXb3TtCQXvq95yyxGU
	ivmkAVwjxo9u/UgL26ahjr59xUrLAQPjcLnHYo92jCkroXJBagjegMPR3jXdEvaOytuJefiJaDiaI
	ICJS09bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucL4F-00000009kIj-3vR8;
	Thu, 17 Jul 2025 09:38:19 +0000
Received: from [195.187.100.5] (helo=ni.piap.pl)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucKUC-00000009f3E-2QI5;
	Thu, 17 Jul 2025 09:01:09 +0000
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id AB776C3E4DE7;
	Thu, 17 Jul 2025 11:00:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl AB776C3E4DE7
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Dafna Hirschfeld <dafna@fastmail.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Heiko Stuebner <heiko@sntech.de>
Cc: Paul Elder <paul.elder@ideasonboard.com>, Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>, Ondrej Jirman <megi@xff.cz>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: FYI: i.MX8MP ISP (RKISP1) MI registers corruption
Date: Thu, 17 Jul 2025 11:00:57 +0200
Message-ID: <m3h5zbxkc6.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_020104_780604_72D6BE20 
X-CRM114-Status: GOOD (  13.17  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

there is a well-known issue in i.MX8MP ISP (Image Signal Processor)
implementation, resulting in a corruption on accesses to ISP MI (memory
interface) registers.

The "reference" (NXP) VVCam driver simply does the operations twice
(i.e., reads twice with the first result discarded, and writes twice).
This fixes the problem on most accesses, but the problems still persist.

It appears that it occurs only after certain system reboots. E.g. after
a boot the problems are present consistently, I can stop and restart the
camera application and they are still there, until the next boot. On the
next boot they can be gone for good. The problems show themselves maybe
in 5% or 10% of boots.

########### READ operations ###########
I have performed some tests and it appears that, at least in read case,
the corruption is caused by flipping bits in register address.

For example: I'm reading (in userspace, 32-bit transfers) 0x32E21478
(mi_mp_y_base_ad_shd) a million times. I get the following results (the
first 5 are valid):
value 0x3C300000 count 184163
value 0x3C3C0000 count 220357
value 0x3C0C0000 count 203534
value 0x3C180000 count 202677
value 0x3C240000 count 189240
value          0 count 23
value 0x1E2200E0 count 1 <<<< looks like register 32E21578
value 0x1E0A00E0 count 1 <<<< looks like register 32E21578
value 0x1E1000E0 count 1 <<<< looks like register 32E21578
value 0x1E1600E0 count 2 <<<< looks like register 32E21578
value 0x12B95456 count 1 <<<< looks like register 32E2153C

Apparently, the data can come from any MI register.

A possible partial workaround involves doing a "ldp wzr, %w0, [%x1]"
operation (this is good for xxx4 and xxxC registers). The first 32 bits
(from xxx0 or xxx8) are corrupted and ignored (in wzr register), but the
real data (xxx4 or xxxC) going to %w0 is ok.

Another one is "ldp xzr, %x0, [%x1]" and is needed for xxx8 registers.
The first transfer (xxx0 and xxx4) if corrupted, then xxx8 and xxxC is
valid (in %x0).

Unfortunately, the above doesn't work for xxx0, they can be corrupted
anyway. Tried 128-bit %v0 transfers, too. ATM I'm doing multiple reads
and pick the most frequent value.

Current values of the ISP MI registers for reference (all-zero rows not
shown):
               xx0      xx4      xx8      xxC
          -----------------------------------
32E21400:   7A2001       20 3C180000   1FA400
32E21410:        0        0        0 3C200000
32E21420:    FD200        0        0        0
32E21430:        0        0        0 B105488E
32E21470:        0    10001 3C0C0000   1FA400
32E21480:        0        0 3C140000    FD200
32E214F0:        0        0        1       3C
32E21500:        0        0        0        2 <<< corrupted write?
32E21530:        0        0        0 12B95456 <<< corrupted write
32E21540:        0        0        0  2000000
32E21550:      780        0        0      332
32E21560:        0      780      438   1FA400
32E21570:        0 1E1E00EF 1E2200E0        0


########### WRITE operations ###########
My current strategy is doing verify after write, then rinse and repeat
until success. This appears to have a side effect, though: the data can
go to a register different that requested. This manifests itself visibly
in registers which are usually 0 (like the 0x32E2153C above). Not very
frequent, though (but it's dangerous: certain registers contain RAM
addresses for video buffers and I guess ISP can corrupt large areas of
memory this way).


I wonder why it only occurs only after certain reboots.
It also appears (will have to verify) than on another identical(?)
device these problems don't show up at all. I'm still investigating.

The camera is a custom board using a Compulab UCM IMX8M PLUS module.
I guess I could try replicating this issue on a Hummingboard i.MX8MP
board.


I wonder if Rockchip ISP blocks (using a very similar ISP, which in both
cases comes from VeriSilicon) are free of these issues.


Any ideas maybe?
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

