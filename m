Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD4F6CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 14:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uICoztKRdvTHeaU0ikk7XrilYFnxM/L3Ytx6iwL/ipw=; b=Ozjzie5Vyu7lurAuOH8eM1L09D
	02Jdpd3aw/bR8DJr/Tn0Qt5dnoX0ookrmQ+W6gMR7pPmWzIXTcCtYYKm/ymFjt6rFG5IzEUqqvLwS
	9mB8vexDnOQRQJ1It9Z0MxERJRdO4hXaSgy4OmF/FQtqtyjiWzJ2qP9BK23vocu9Wf6jJ37bOnlVn
	u3oUeaIJL6Q1UTnOEmTxQCK/OeRH/Qx6X5TEovR8Zu+bYi10YokhLBAiWxTN9Eo3G6yfOFr79dUUU
	9+VKwN6faxyl9UGxJY1BRGClCNybNQvIUOlbHxuHoPdcwCSNcD8KYAUIUmkuG5icZlDIwms1mLWw/
	RHygox1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4KUF-0000000AcfR-15cM;
	Thu, 02 Oct 2025 14:40:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4KUE-0000000AcfL-1R4t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 14:40:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BB50D60300;
	Thu,  2 Oct 2025 14:40:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C118C4CEF4;
	Thu,  2 Oct 2025 14:40:48 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 00/13] ARM: dts: renesas: Move interrupt-parent to root node
Date: Thu,  2 Oct 2025 16:40:28 +0200
Message-ID: <cover.1759414774.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This patch series is a follow-up to Morimoto-san's series[1] to move
interrupt-parent properties to the root nodes in Renesas ARM64
SoC-specific .dtsi files, which lets us replace several
interrupts-extended properties by the more concise interrupts
properties.  This series repeats the exercise for Renesas ARM32 SoCs.

Note that several .dtsi files predating the concept of the "soc" node
already had their GIC interrupt-parent properties at the root node.
Of the modified files, some had duplicate interrupt-parent properties.

I intend to queue this in renesas-devel for v6.19.

Thanks for your comments!

[1] "[PATCH 00/26] arm64: dts: renesas: move interrupt-parent to top
     node"
    https://lore.kernel.org/87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com/

Geert Uytterhoeven (13):
  ARM: dts: renesas: r7s72100: Move interrupt-parent to root node
  ARM: dts: renesas: r7s9210: Remove duplicate interrupt-parent
  ARM: dts: renesas: r8a7742: Move interrupt-parent to root node
  ARM: dts: renesas: r8a7743: Move interrupt-parent to root node
  ARM: dts: renesas: r8a7744: Move interrupt-parent to root node
  ARM: dts: renesas: r8a7745: Move interrupt-parent to root node
  ARM: dts: renesas: r8a77470: Move interrupt-parent to root node
  ARM: dts: renesas: r8a7790: Move interrupt-parent to root node
  ARM: dts: renesas: r8a7791: Move interrupt-parent to root node
  ARM: dts: renesas: r8a7792: Move interrupt-parent to root node
  ARM: dts: renesas: r8a7793: Move interrupt-parent to root node
  ARM: dts: renesas: r8a7794: Move interrupt-parent to root node
  ARM: dts: renesas: r9a06g032: Move interrupt-parent to root node

 arch/arm/boot/dts/renesas/r7s72100.dtsi  |  4 ++--
 arch/arm/boot/dts/renesas/r7s9210.dtsi   |  1 -
 arch/arm/boot/dts/renesas/r8a7742.dtsi   | 26 ++++++++++++------------
 arch/arm/boot/dts/renesas/r8a7743.dtsi   | 14 ++++++-------
 arch/arm/boot/dts/renesas/r8a7744.dtsi   | 14 ++++++-------
 arch/arm/boot/dts/renesas/r8a7745.dtsi   | 14 ++++++-------
 arch/arm/boot/dts/renesas/r8a77470.dtsi  | 14 ++++++-------
 arch/arm/boot/dts/renesas/r8a7790.dtsi   | 26 ++++++++++++------------
 arch/arm/boot/dts/renesas/r8a7791.dtsi   | 14 ++++++-------
 arch/arm/boot/dts/renesas/r8a7792.dtsi   | 14 ++++++-------
 arch/arm/boot/dts/renesas/r8a7793.dtsi   | 14 ++++++-------
 arch/arm/boot/dts/renesas/r8a7794.dtsi   | 14 ++++++-------
 arch/arm/boot/dts/renesas/r9a06g032.dtsi |  3 +--
 13 files changed, 85 insertions(+), 87 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

