Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9CEC53219
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 08:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SCmGYQYvTEf351a469pe44RgiJyCzUCfUVrveP/GI5I=; b=SMpoyWtqbQQUg890aAPay+1B+D
	SgKsp9UVDi7/eti/HboZCtOkSuYqg3S8/vRzo90L8OxZLBKIS8tCg3l6P8/fZWnir5sOTDhDpKVsE
	HWG38FNAluyoM/6IgOJQ9jip7RPAMw1rQ41xb6HilfhiPl6yhKYv5yxRWoo8ZjEOpVlxcawoouZVf
	dNhtlBB5kaQfK0C5OemzLXCdlVwZbfcpozZ2HimHM1/9O3iXMNjSG7Eic4/gEhAmGERMY76OmsM8x
	H1iRg2jbBcVI1cck26ne0kRpdRavLKG+GMN0e8Uwlu0SouW1QZUL1RfkMDLbmzgT7KWmF5zOhaLo6
	4wEfpg0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woGxz-00000002GN6-1U8S;
	Mon, 27 Jul 2026 08:45:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woGxx-00000002GMy-47UQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 08:45:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7ADFE43261;
	Mon, 27 Jul 2026 08:45:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F8A91F00A3A;
	Mon, 27 Jul 2026 08:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785141941;
	bh=SCmGYQYvTEf351a469pe44RgiJyCzUCfUVrveP/GI5I=;
	h=From:To:Cc:Subject:Date;
	b=HFN1D11DivCImlY0/SMRRS43msSnwEjSBsWPeJA40cDJ+sYtSMk5zZGVKALL/aKdU
	 UtUtFAZRFQUZgrHdPL6yjKsGwXuStdY5GzB1IPjU7UxNwadNXbuBhYNhUMfXNrTO6C
	 Xhia/lC1XEWQ+qIA3MWIESqK8LJCUu6ODBtcHm3BG9Q5ImBm7sKYPkK4NBiD1/dV33
	 jEO0vJul90izJcpGFSXXkLH19vpu5KgG7z6F09fMFQ4FZQXPeQFRvUD2r1PnYeNwdK
	 g5Nd7qgEd0kFJ2cQx5Knu2l7lIgKHK5eAcudSR11rDtXnqJdW1OH00CGoJtozNvAXZ
	 s2sIRZCFw9J0g==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2] powerpc: Move CONFIG_QE_GPIO to SoC
Date: Mon, 27 Jul 2026 10:45:37 +0200
Message-ID: <9a7131d15a94e2017877e628f0e97f9aa2e0aae9.1785140877.git.chleroy@kernel.org>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2442; i=chleroy@kernel.org; h=from:subject:message-id; bh=B4hOgD0R97s0zSf2lKkhvcdFwj3V1Wug4B7VlY2ZxuE=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWSlS229GLsr21EzqPmua63bu6XNpwWLtfwv7ot42Pxta ULxTI2pHaUsDGJcDLJiiizH/3PvmtH1JTV/6i59mDmsTCBDGLg4BWAi7EWMDM//Lg2rjf71ul1z 9/1Zm67yL7UOfsnCJFc+6bbMxMCMzNsM/0uL983c+T+eedXOxkl5mx+7+5zt2nbRZeLmVOE5Zs/ nybEDAA==
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
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

Commit 7aa1aa6ecec2 ("QE: Move QE from arch/powerpc to drivers/soc")
moved QE into drivers/soc including gpio.c but left CONFIG_QE_GPIO
in powerpc's Kconfig.

Move it to SoC as well as it is the only place it is used:

  drivers/soc/fsl/qe/Makefile:obj-$(CONFIG_QE_GPIO)       += gpio.o qe_ports_ic.o
  include/soc/fsl/qe/qe.h:#ifdef CONFIG_QE_GPIO
  include/soc/fsl/qe/qe.h:#endif /* CONFIG_QE_GPIO */

There is also a dependency in USB subsystem for CONFIG_USB_FHCI_HCD:

  drivers/usb/host/Kconfig:	depends on QE_GPIO && QUICC_ENGINE

Because that USB driver selects CONFIG_FSL_GTM which is specific to
powerpc, it has to depend on CONFIG_PPC.

Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
---
v2: Add a dependency on CONFIG_PPC for CONFIG_USB_FHCI_HCD
---
 arch/powerpc/platforms/Kconfig | 8 --------
 drivers/soc/fsl/qe/Kconfig     | 8 ++++++++
 drivers/usb/host/Kconfig       | 1 +
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/platforms/Kconfig b/arch/powerpc/platforms/Kconfig
index c4e61843d9d9..2f797ac6f1b3 100644
--- a/arch/powerpc/platforms/Kconfig
+++ b/arch/powerpc/platforms/Kconfig
@@ -228,14 +228,6 @@ config TAU_AVERAGE
 
 	  If in doubt, say N here.
 
-config QE_GPIO
-	bool "QE GPIO support"
-	depends on QUICC_ENGINE
-	select GPIOLIB
-	help
-	  Say Y here if you're going to use hardware that connects to the
-	  QE GPIOs.
-
 config CPM2
 	bool "Enable support for the CPM2 (Communications Processor Module)"
 	depends on (FSL_SOC_BOOKE && PPC32) || PPC_82xx
diff --git a/drivers/soc/fsl/qe/Kconfig b/drivers/soc/fsl/qe/Kconfig
index eb03f42ab978..b35a8fd30ebf 100644
--- a/drivers/soc/fsl/qe/Kconfig
+++ b/drivers/soc/fsl/qe/Kconfig
@@ -67,3 +67,11 @@ config QE_USB
 	default y if USB_FSL_QE
 	help
 	  QE USB Controller support
+
+config QE_GPIO
+	bool "QE GPIO support"
+	depends on QUICC_ENGINE
+	select GPIOLIB
+	help
+	  Say Y here if you're going to use hardware that connects to the
+	  QE GPIOs.
diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index b3b1ec696bf5..10cff12a3f31 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -611,6 +611,7 @@ config USB_UHCI_ASPEED
 config USB_FHCI_HCD
 	tristate "Freescale QE USB Host Controller support"
 	depends on QE_GPIO && QUICC_ENGINE
+	depends on PPC
 	select FSL_GTM
 	select QE_USB
 	help
-- 
2.54.0


