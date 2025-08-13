Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC45CA0EE7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 14:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EjEMKLh7TQe3vxal/iP/DnPXELFw8PnVAY7LzVMODV4=; b=EcnLTPRdwBMprbv52FsFqiFRbr
	uHyGreNrkq8W8VnpAm5XI7N/nX5JB4BIOerGKOhXCYk2PrUu2ZkLRePhpJszukSsolvawZqV5XVSH
	lqMqnjVy6FC8NOqt6HMmQ/HPkcszPZFI6UhyioCQVLC/4NreUJ1k2Rzt8aNXQVjjxgHKT6DQ4lx5t
	KHDuEUN0hLI4R4VgGrPQsHG+YyzUAgvIrpfRdQUdnZxfcPmzJGMjF6ziM6fFKuwlp81rlPYWCbGG0
	tlUGy3HgRq2G2TFkguRSocVUs8xKdGkE4Xk3nU4h/6vIYEEpki9lPZy5iPV1UgjBzF9BLWFlhPz9T
	JebeesAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umCMK-0000000DtWw-27Aj;
	Wed, 13 Aug 2025 14:21:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umBfD-0000000DmkR-3Q5h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 13:37:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 09710601F6;
	Wed, 13 Aug 2025 13:37:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CFBCC4CEF5;
	Wed, 13 Aug 2025 13:37:09 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] arm64: dts: renesas: Increase CANFD clock rates
Date: Wed, 13 Aug 2025 15:37:02 +0200
Message-ID: <cover.1755090456.git.geert+renesas@glider.be>
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

Currently, all R-Car Gen3 and RZ/G2 .dtsi files configure the CANFD core
clocks to 40 MHz, which limits CAN-FD data transfer rates to 4 Mbps.
However, all R-Car Gen3 and RZ/G2 SoCs except for R-Car D3 support CANFD
clock rates up to 80 MHz.

Now the R-Car CAN-FD driver has gained support for Transceiver Delay
Compensation in v6.17-rc1, increase all appropriate CANFD clock rates to
the documented maximum, to support data rates up to 8 Mbps.

The R-Car Gen3 boards that have CAN-FD enabled use CAN transceivers
that support transfer rates up to 8 (Ebisu) or 5 (Condor(-I), Eagle)
Mbps.  None of the RZ/G2 boards have CAN-FD enabled.

The Draak board, and some of the RZ/G2 boards have CAN enabled instead
of CAN-FD.  None of these are affected by this series, as they either
rely on the default value of zero for the "renesas,can-clock-select"
property, or configure it explicitly to zero, thus not using the CANFD
core clock as CAN clock source.

All .dtsi files for SoCs in the RZ/G2L family configure the P0_DIV2
clock to 50 Mhz, which should be sufficient for the maximum supported
transfer rates of 4 Mbps (my board has no CAN transceiver mounted...).
RZ/G3E already configures its can_clk to 80 MHz.

This series has been tested on Ebisu-4D (R-Car E3).
I plan to queue it in renesas-devel for v6.18.

Thanks for your comments!

Geert Uytterhoeven (2):
  arm64: dts: renesas: rcar-gen3: Increase CANFD clock rates
  arm64: dts: renesas: rzg2: Increase CANFD clock rates

 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a77951.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a77960.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a77970.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a77980.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

