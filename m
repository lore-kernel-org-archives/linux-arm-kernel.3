Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B689CD484E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 06:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x7xLKj3jn5BgrG2gYp7tL0CS9JcYELUGmYBKCxIYCh8=; b=rZf+gksbJyyv/7K4KcpijpaJby
	2SV3YYfY4/pP8UefsnI1HvlaNQFIEso/yi8jmc/XKh+l1S/SaEbaw6KDZyFrl0XjhUSKi1938jPru
	U/U3ufpzPLwZigLuNfvTud2XKE7qLXdXOGexTZfC3OLWTrT/3h1BIwsTdQenLYmBAi8D57Jv+B1vZ
	5ZMBJbraqocVadOnqTiMDPmN+bPa5VYWiW4E1hDrnZTbl8uCYc2hydEEI/Nx5hjAIhRRKzTNoyWpX
	tqor5HqplWhIZm4LX5uoJyLcfG5YOZ34XkITVX3fe0suDZ1QYtSWcoSE3Q89cRqath3F8RkjeoU6S
	w9EiLFJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMgrw-0000000FoPp-0lci;
	Tue, 12 May 2026 06:45:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMgru-0000000FoPO-3DLv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 06:45:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2626160120;
	Tue, 12 May 2026 06:45:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FCB9C2BCB0;
	Tue, 12 May 2026 06:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778568325;
	bh=dn/2TeYlo7UysBV7G8rvsmGFrF81gAfR8vsGzOKsmOg=;
	h=From:Date:Subject:To:Cc:From;
	b=Uc8tzNhBZd26dCinIzbLQ9bR4MSBCAAUI84key7CvBkAYpls6HPZloNedoeQNJX90
	 Z/PwTajwyZN3iNh6ckUdOGqN6tVq5bnTOTNNvi5uTrDfBOV/y/zPpq1rxYYwgBrso3
	 hH09/fWhX8jmu5QbkcOs6FlPSXrzTmqGKwY4yrEagpXj2IIKOuPEns67KSUkjmFTFv
	 IFhHx5jbc5gnbVPCanzejg6kIi/5WaVRvNBiwtiwKIUgTrS3cYzx57MolF5U1LRItJ
	 p6xhnoTD1Kw3T0XuIVeGJSqrQiYIPQyzBEJdqD5x/+vJmmaiuBippRuK18MA/YB32g
	 NXqwAxgBDNcqw==
From: Enric Balletbo i Serra <eballetbo@kernel.org>
Date: Tue, 12 May 2026 08:45:16 +0200
Subject: [PATCH RESEND] clocksource: move NXP timer selection to
 drivers/clocksource
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-fix-nxp-timer-v1-1-565e13ef3e46@redhat.com>
To: Russell King <linux@armlinux.org.uk>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Enric Balletbo i Serra <eballetb@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778568323; l=3279;
 i=eballetb@redhat.com; s=20260512; h=from:subject:message-id;
 bh=68CbHFHwy1Owac9bautnuLw3iIFo+9q/vUbZH0bPUhA=;
 b=JNJcUDnKmmycT4dmRC9T5sdyzh+Q/h5coXo04/9HNdAC11NQs7WREfrGKMNQLU8o8GTMrWwj6
 pHEaHSSssP5B4h/qeXEbzY6Pa8V6/ILgsL3hzK1apeDxxHaM4VMtnPj
X-Developer-Key: i=eballetb@redhat.com; a=ed25519;
 pk=HEWGfVmqrAZfJ4JLImY+V4jOfS+bkE5CQrdmm/kZq5Y=
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

From: Enric Balletbo i Serra <eballetb@redhat.com>

The Kconfig logic for selecting the scheduler clocksource on
NXP Vybrid (VF610) uses a `choice` block restricted to 32-bit ARM. This
prevents 64-bit architectures, such as the NXP S32 family, from enabling
the NXP Periodic Interrupt Timer (PIT) driver (CONFIG_NXP_PIT_TIMER).

Relocate the NXP clocksource selection from arch/arm/mach-imx/Kconfig to
drivers/clocksource/Kconfig. This allows the configuration to be shared
across different architectures.

Update the selection to include support for ARCH_S32 and add a "None"
option to allow using the standard ARM Architected Timer. The Vybrid
Global Timer option is now specifically restricted to 32-bit ARM SOC_VF610
platforms.

Fixes: bee33f22d7c3 ("clocksource/drivers/nxp-pit: Add NXP Automotive s32g2 / s32g3 support")
Signed-off-by: Enric Balletbo i Serra <eballetb@redhat.com>
---
 arch/arm/mach-imx/Kconfig   | 21 ---------------------
 drivers/clocksource/Kconfig | 31 +++++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+), 21 deletions(-)

diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
index 6ea1bd55acf8..a361840d7a04 100644
--- a/arch/arm/mach-imx/Kconfig
+++ b/arch/arm/mach-imx/Kconfig
@@ -227,27 +227,6 @@ config SOC_VF610
 	help
 	  This enables support for Freescale Vybrid VF610 processor.
 
-choice
-	prompt "Clocksource for scheduler clock"
-	depends on SOC_VF610
-	default VF_USE_ARM_GLOBAL_TIMER
-
-	config VF_USE_ARM_GLOBAL_TIMER
-		bool "Use ARM Global Timer"
-		depends on ARCH_MULTI_V7
-		select ARM_GLOBAL_TIMER
-		select CLKSRC_ARM_GLOBAL_TIMER_SCHED_CLOCK
-		help
-		  Use the ARM Global Timer as clocksource
-
-	config VF_USE_PIT_TIMER
-		bool "Use PIT timer"
-		select NXP_PIT_TIMER
-		help
-		  Use SoC Periodic Interrupt Timer (PIT) as clocksource
-
-endchoice
-
 endif
 
 endif
diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index fd9112706545..b5c88ec65802 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -794,4 +794,35 @@ config RTK_SYSTIMER
 	  this option only when building for a Realtek platform or for compilation
 	  testing.
 
+choice
+	prompt "NXP clocksource for scheduler clock"
+	depends on SOC_VF610 || ARCH_S32
+	# Default to Global Timer for Vybrid (32-bit)
+	default VF_USE_ARM_GLOBAL_TIMER if SOC_VF610
+	# Default to None for S32 (64-bit)
+	default VF_TIMER_NONE if ARCH_S32
+
+	config VF_USE_ARM_GLOBAL_TIMER
+		bool "Use NXP Vybrid Global Timer"
+		# This option is ONLY visible if we are on 32-bit ARM
+		depends on ARM && SOC_VF610
+		select ARM_GLOBAL_TIMER
+		select CLKSRC_ARM_GLOBAL_TIMER_SCHED_CLOCK
+		help
+		  Use the NXP Vybrid Global Timer as clocksource.
+
+	config VF_USE_PIT_TIMER
+		bool "Use NXP PIT timer"
+		select NXP_PIT_TIMER
+		help
+		  Use NXP Periodic Interrupt Timer (PIT) as clocksource.
+
+	config VF_TIMER_NONE
+		bool "None (Use standard Arch Timer)"
+		help
+		  Do not use any specific NXP timer driver. Use the standard
+		  ARM Architected Timer instead.
+
+endchoice
+
 endmenu

---
base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
change-id: 20260302-fix-nxp-timer-9cb1fbd7afcd

Best regards,
-- 
Enric Balletbo i Serra <eballetb@redhat.com>


