Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8948DC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 14:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZqRo0xnVJ0Po4fomawgerlSqa+dCsT5m2tPaoMqXUuk=; b=32AALioo2Z/w7D1WjHdU3WwWQd
	jtvcLLt6ZPW1N0PivOfnaeRTP5G/rXiSuor89tjG08OeCLiyElgq9Oms6+L2WnTmT54utzX2Fgjhk
	i8bCvPz/y8bnE5uSPipwIQazj873A/pKOBRH7zxzKrbkt0XchEKuYfQwwfw8cqVebo8f/XBIMjOaC
	PG+nR8X/ZdHRE6ikP+x0K7/bmLDpCXdO5ifW7MpDcSzBph1Wi7uuJsx/6m0RvProqvMGga0LJbgu/
	nNHQ2ga4IaiHVNQORUQcc6oRU4U07PMSX2UdxdpgOCJZnHzEtbpFOnB5acgcz3dK66w490E3fcIJc
	qguF9+MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucPLC-0000000AKpf-1sFS;
	Thu, 17 Jul 2025 14:12:06 +0000
Received: from ni.piap.pl ([195.187.100.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucOHJ-0000000ACoR-1Pqd;
	Thu, 17 Jul 2025 13:04:03 +0000
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id B1AF0C3E4DEE;
	Thu, 17 Jul 2025 15:03:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl B1AF0C3E4DEE
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Dafna Hirschfeld <dafna@fastmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,  Heiko Stuebner
 <heiko@sntech.de>,  Paul Elder <paul.elder@ideasonboard.com>,  Jacopo
 Mondi <jacopo.mondi@ideasonboard.com>,  Ondrej Jirman <megi@xff.cz>,
  linux-media@vger.kernel.org,  linux-rockchip@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: FYI: i.MX8MP ISP (RKISP1) MI registers corruption
In-Reply-To: <m3h5zbxkc6.fsf@t19.piap.pl> ("Krzysztof =?utf-8?Q?Ha=C5=82as?=
 =?utf-8?Q?a=22's?= message of
	"Thu, 17 Jul 2025 11:00:57 +0200")
References: <m3h5zbxkc6.fsf@t19.piap.pl>
Date: Thu, 17 Jul 2025 15:03:54 +0200
Message-ID: <m38qknx939.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_060401_537471_DD5B5966 
X-CRM114-Status: UNSURE (   7.73  )
X-CRM114-Notice: Please train this message.
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

> The "reference" (NXP) VVCam driver simply does the operations twice
> (i.e., reads twice with the first result discarded, and writes twice).
> This fixes the problem on most accesses, but the problems still persist.

It appears the corruptions are quite frequent, though.
Using "ldp qXX, qYY, [x0]" (2 * 128-bit load pair) I get results like
this (each data row is a result of a single ldp):

addr:  32E21400 32E21404 32E21408 32E2140C 32E21410 32E21414 32E21418 32E21=
41C
---------------------------------------------------------------------------=
-----
values 3D000007       20 3C300000   1FA400        0        0        0 3C380=
000 count 99993097
values        0       20 3C300000   1FA400        0        0        0 3C380=
000 count 5930
values    7E900       20 3C300000   1FA400        0        0        0 3C380=
000 count 338
values    FD200       20 3C300000   1FA400        0        0        0 3C380=
000 count 223
values 3C380000       20 3C300000   1FA400        0        0        0 3C380=
000 count 220
values       40       20 3C300000   1FA400        0        0        0 3C380=
000 count 192

The valid value (in 0x32E21400 register) is 3D000007 only, the rest are
corruptions: ca. 6 errors per 100k reads. With other registers, 15 errors
per 100k reads etc.

I also got this:
addr:  32E213F0 32E213F4 32E213F8 32E213FC 32E21400 32E21404 32E21408 32E21=
40C
---------------------------------------------------------------------------=
-----
values        0        0        0        0 3D000007       20 3C300000   1FA=
400 count 98638773
values        0        0        0        0        0       20 3C300000   1FA=
400 count 1330227
values        0        0        0        0       40       20 3C300000   1FA=
400 count 3721
values        0        0        0        0 3C380000       20 3C300000   1FA=
400 count 314
values        0        0        0        0    7E900       20 3C300000   1FA=
400 count 572
values        0        0        0        0    FD200       20 3C300000   1FA=
400 count 428
values        0        0        0        0    4C010       20 3C300000   1FA=
400 count 25965

which is ca. 14 errors per 1k reads, though maybe it's special -
non-MI/MI boundary (at 0x32E21400), reserved addresses (0x32E213Fx) etc.

> The problems show themselves maybe in 5% or 10% of boots.

Well, now it appears more like 20%: e.g. in 41 system runs (soft reboots
only, no power-downs), I got problems 8 times.

Obviously I can post the tester source if anyone is interested.


Generally ISP MI register read accesses which can be corrupted are:
- first 32 bits read in a given transfer, and additionally
- every 32 bits on a 32-byte boundary (addresses 0x....00, ...20 etc.).

This means, in practice, on i.MX8MP only, RKISP1_CIF_MI_CTRL and
RKISP1_CIF_MI_MP_CB_SIZE_INIT (with the workaround).

What is this 32-byte boundary?

Writing is a bigger problem, though.
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

