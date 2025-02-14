Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A0A2C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 09:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Rj0BEeq6E9KFGYVhlP6NhDdQL8AKa6TSv7nku0FsM5o=; b=dyVPMXblqZ1fNBpO3jhqeWxdQM
	gHVvOVIR6RohHYchI3RrzDWBDM3lbB/nAo4z0L7ViW6WD9kGpsKgn87mFIJy+DDnwpqmG/vvS6KyK
	CUK+awemfBUZ5CSvs5EIQ/EBr3mF57UQe8O/pg1Xa3IKZOW64p7v8h3uqgyCMSNITc4yoNP91/R6k
	xXjywbwQggYkM7dVpJVnCglfrwhUgaFvMse4BG/QULcXqBtI8CpSJ9RAkzsq2vCYdWqThoZRy/AQ1
	Df+zYZsbMY8+5qXlwIBCbHaSLlO1t7IM18Xj2nmWyhUFsLY5RarSi6QR47n2+lC9YPmkQYj7WQzmY
	mFz/TPig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tisG1-0000000ENIR-3bHN;
	Fri, 14 Feb 2025 09:45:13 +0000
Received: from laurent.telenet-ops.be ([2a02:1800:110:4::f00:19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tisD8-0000000EMuO-0AXy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 09:42:15 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:6395:73cc:7fc4:4cab])
	by laurent.telenet-ops.be with cmsmtp
	id DMi72E0061MuxXz01Mi7fK; Fri, 14 Feb 2025 10:42:09 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tisCj-00000006Xjh-3DM4;
	Fri, 14 Feb 2025 10:42:07 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tisD0-00000000ggU-407h;
	Fri, 14 Feb 2025 10:42:06 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] ARM: dts: renesas: r9a06g032: UART dtbs_check fixes
Date: Fri, 14 Feb 2025 10:42:02 +0100
Message-ID: <cover.1739525488.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_014214_218576_6E3035F8 
X-CRM114-Status: GOOD (  16.48  )
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

	Hi all,

This patch series fixes two "make dtbs_check" issues for the RZ/N1
UARTs.  As I do not have access to an RZ/N1 board, this was not tested
on actual hardware.

Thanks for your comments!

Geert Uytterhoeven (2):
  ARM: dts: renesas: r9a06g032: Fix UART dma channel order
  ARM: dts: renesas: r9a06g032: Drop snps,dw-apb-uart compatibility

 arch/arm/boot/dts/renesas/r9a06g032.dtsi | 26 ++++++++++++------------
 1 file changed, 13 insertions(+), 13 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

