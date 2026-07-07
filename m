Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 708E8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 15:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wOBcKHJQyOMU4HZK6o3IdwDSoAOxpnL1hOf/TAAIhys=; b=yJQHuUF8EIk9z2MmiYymKFZKBo
	vNekDbPVBX8vtCCDVxeBFI+S+IaacKc9qD2bczEbt+QvS5+mlS2JmokwVmU+dKmcI/GrfFUx+APoi
	Xss2IuuBL5EzVVjrVaKzG92eUhUxQpVxE4vFg4/N50yeZ8pUlsfPLNAskrVaqRr5JX2N1EQvr9QTB
	xdZSkuQvMQ2bXBB2dRVnhdb9Af6um0DQJ46Zg6fiRu8QSHSw/QmRWfwEnJIv59apRSiF2yUDP/9GQ
	3b+VXEaMzsUfGrMg4d4gG6U9C8CutI+AIMcw/xyzLvJkLBn7uUip2pQGdUMVHZX06cdaXx+KzvTrh
	V3yqaMmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7I4-0000000FEY2-2bj9;
	Tue, 07 Jul 2026 15:00:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7I3-0000000FEXj-2yxo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 15:00:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E5B7060018;
	Tue,  7 Jul 2026 15:00:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 157531F000E9;
	Tue,  7 Jul 2026 15:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783436450;
	bh=wOBcKHJQyOMU4HZK6o3IdwDSoAOxpnL1hOf/TAAIhys=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Hgkafo9nh3j6b868H5hloDHa6TQeLPS8/oJuDEXLrC5YWas1t5XAJcfRDZ5wcOROR
	 suoJ7weC+FDxNwwzuR4ODiintZN15O8UU7UC9B+tQK9jblz1Eq9yT8e8JYzmMflLBU
	 6eFEGJrv6x1GP9Wwh2kbxqVJ97xlFJcmFBa0LN2dLOZIqTTb+Zb9kC1Xf0zRmKbbxQ
	 ZqdXOLFh2N0dcVlJRbZR3fKIsbX8B35OtssIfEL2Bcbegt4Xwcd9DhIBecnPACiTjM
	 WpVT8y4kyX6lVL91BH5YxfKYVjsS3AkDueAPa55oLvALNfsLWchBtIUYOseuevp1Z8
	 W+bZ4tyhbPn0g==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Qiang Zhao <qiang.zhao@nxp.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Paul Louvel <paul.louvel@bootlin.com>
Subject: [PATCH 2/2] powerpc: Move CONFIG_QE_GPIO to SoC
Date: Tue,  7 Jul 2026 17:00:45 +0200
Message-ID: <cd46aec4b325745d38ac7992e4d3d5b4f4c4e95f.1783435914.git.chleroy@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <b08f76c1d8ff864774246f1e2c2158c223c001be.1783435914.git.chleroy@kernel.org>
References: <b08f76c1d8ff864774246f1e2c2158c223c001be.1783435914.git.chleroy@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1808; i=chleroy@kernel.org; h=from:subject:message-id; bh=+904wY+BTglsrOGG1A3VF0W9Aan7cNN/y9nA+a4QttE=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWT5isy7O3/+S8/3321eHGYuipoe9bsxT9jiycEnf2ffD 9rp6rN0d0cpC4MYF4OsmCLL8f/cu2Z0fUnNn7pLH2YOKxPIEAYuTgGYyOLbDP+9WO6suHhFt2BH m8+28OXP9Y4bdvIwyz2wFXIqXtrNEreHkWFSiOlye27DkwcXyoTpCTvuPOaU8JThnVZd/vf4f+q LDRkA
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

Link: https://lore.kernel.org/r/16a187116511f5c844c43a12d09f263e77f4fd60.1780936729.git.chleroy@kernel.org
Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
---
 arch/powerpc/platforms/Kconfig | 8 --------
 drivers/soc/fsl/qe/Kconfig     | 8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/platforms/Kconfig b/arch/powerpc/platforms/Kconfig
index c4e61843d9d99..2f797ac6f1b3f 100644
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
index eb03f42ab9781..b35a8fd30ebfb 100644
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
-- 
2.54.0


