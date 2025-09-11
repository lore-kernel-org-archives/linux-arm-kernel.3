Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78AE2CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 14:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K69kgncGciGQZo0JXjJXKC6BvkMPaiJgLJglmZzL4cM=; b=sD34KqnoCyhwBlS8qLtPgTxfJ2
	0tAEAfgmL5xrw+pSgyrhz/k/6OF3GMZ4d4NW2hkgOTsTnj0QKleKvRdKRgozVZTWdR+ww2VxRIqK/
	ufrXkVli06xkrYiStuMn+ZZB1V0qbX5mOQGufPMUgUyt8T3vPHq8Qb7qIaH9HygHcMfO4Zc6FuEhs
	/KJx6c9QWXCkUmFnZlOzNxm4FSqhnaK9yFzfst9mzYaFNNuCdQHOoTwf+a3JXyD+tXxuFel4OV5bN
	W9dtDdH841hf4vEdfkdsTQT43OxzK0dBM7W4o75OsZYHTPCl7T5O4N2dSSxNUH7DAUKV8+ElRnK5x
	FHQ/zLeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwi73-00000003UgG-0C1U;
	Thu, 11 Sep 2025 14:17:25 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwi6x-00000003UcU-0PPx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 14:17:20 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250911141717epoutp04588b3d4b267cde4512b3d5dd4c2a0a8d~kQBp9jSA31985819858epoutp04E
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 14:17:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250911141717epoutp04588b3d4b267cde4512b3d5dd4c2a0a8d~kQBp9jSA31985819858epoutp04E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1757600237;
	bh=K69kgncGciGQZo0JXjJXKC6BvkMPaiJgLJglmZzL4cM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RGM1Hwq34Eh+BIhNJJSTYu+kN9RjqqGF/+z4QqIRGqah5I7L6MqsicFC1T02Z6Ttu
	 +urbOzmpH0gl9WyYKUW8dSojqr0apczlDYuJiu1enayc0qACKZR1mit/gpLxPyzEmC
	 E+9LgCmncmQDWY0OScWrQcXDMXUagdCugwpeNa5g=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250911141715epcas5p493e6a04e3f957c7589b55a2153801fa9~kQBo7E2ov3129231292epcas5p4G;
	Thu, 11 Sep 2025 14:17:15 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.91]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4cN04W1zmqz3hhT3; Thu, 11 Sep
	2025 14:17:15 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250911141714epcas5p29f591a1d645c9c69dc5b7d2c2d12af50~kQBndP0JP1801718017epcas5p2y;
	Thu, 11 Sep 2025 14:17:14 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250911141710epsmtip120b4dcf88bd4e7d7187d3e096f10cd67~kQBj6-TyE3273832738epsmtip1d;
	Thu, 11 Sep 2025 14:17:10 +0000 (GMT)
From: Ravi Patel <ravi.patel@samsung.com>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, jesper.nilsson@axis.com,
	lars.persson@axis.com, alim.akhtar@samsung.com, arnd@kernel.org,
	krzk@kernel.org
Cc: andriy.shevchenko@linux.intel.com, geert+renesas@glider.be,
	thierry.bultel.yh@bp.renesas.com, dianders@chromium.org,
	robert.marko@sartura.hr, schnelle@linux.ibm.com, kkartik@nvidia.com,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@axis.com,
	ksk4725@coasia.com, kenkim@coasia.com, smn1196@coasia.com,
	pjsin865@coasia.com, shradha.t@samsung.com, Ravi Patel
	<ravi.patel@samsung.com>
Subject: [PATCH 3/3] tty: serial: samsung: Remove unused artpec-8 specific
 code
Date: Thu, 11 Sep 2025 19:46:05 +0530
Message-ID: <20250911141605.13034-4-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250911141605.13034-1-ravi.patel@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250911141714epcas5p29f591a1d645c9c69dc5b7d2c2d12af50
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250911141714epcas5p29f591a1d645c9c69dc5b7d2c2d12af50
References: <20250911141605.13034-1-ravi.patel@samsung.com>
	<CGME20250911141714epcas5p29f591a1d645c9c69dc5b7d2c2d12af50@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_071719_465493_83C73C85 
X-CRM114-Status: GOOD (  16.66  )
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

Since ARTPEC-8 is using exynos8895 driver data, remove the unused
artpec-8 specific driver data.

ARTPEC-8 is using exynos4210 for earlycon, so earlycon code
for ARTPEC-8 is also not required.

Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
---
NOTE: This is exactly the revert of the below commit.
commit 1db536f95d0264a2b83fb032d5b057ba0113e622
Author: Vincent Whitchurch <vincent.whitchurch@axis.com>
Date:   Fri Mar 11 10:45:15 2022 +0100

tty: serial: samsung: Add ARTPEC-8 support
---
 drivers/tty/serial/Kconfig       |  2 +-
 drivers/tty/serial/samsung_tty.c | 38 --------------------------------
 2 files changed, 1 insertion(+), 39 deletions(-)

diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index 44427415a80d..6f4d6f44d997 100644
--- a/drivers/tty/serial/Kconfig
+++ b/drivers/tty/serial/Kconfig
@@ -219,7 +219,7 @@ config SERIAL_CLPS711X_CONSOLE

 config SERIAL_SAMSUNG
 	tristate "Samsung SoC serial support"
-	depends on PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS || ARCH_APPLE || ARCH_ARTPEC || COMPILE_TEST
+	depends on PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS || ARCH_APPLE || COMPILE_TEST
 	select SERIAL_CORE
 	help
 	  Support for the on-chip UARTs on the Samsung
diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 2fb58c626daf..322ab280a59e 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -2577,37 +2577,6 @@ static const struct s3c24xx_serial_drv_data s5l_serial_drv_data = {
 #define S5L_SERIAL_DRV_DATA NULL
 #endif

-#if defined(CONFIG_ARCH_ARTPEC)
-static const struct s3c24xx_serial_drv_data artpec8_serial_drv_data = {
-	.info = {
-		.name		= "Axis ARTPEC-8 UART",
-		.type		= TYPE_S3C6400,
-		.port_type	= PORT_S3C6400,
-		.iotype		= UPIO_MEM,
-		.fifosize	= 64,
-		.has_divslot	= true,
-		.rx_fifomask	= S5PV210_UFSTAT_RXMASK,
-		.rx_fifoshift	= S5PV210_UFSTAT_RXSHIFT,
-		.rx_fifofull	= S5PV210_UFSTAT_RXFULL,
-		.tx_fifofull	= S5PV210_UFSTAT_TXFULL,
-		.tx_fifomask	= S5PV210_UFSTAT_TXMASK,
-		.tx_fifoshift	= S5PV210_UFSTAT_TXSHIFT,
-		.def_clk_sel	= S3C2410_UCON_CLKSEL0,
-		.num_clks	= 1,
-		.clksel_mask	= 0,
-		.clksel_shift	= 0,
-	},
-	.def_cfg = {
-		.ucon		= S5PV210_UCON_DEFAULT,
-		.ufcon		= S5PV210_UFCON_DEFAULT,
-		.has_fracval	= 1,
-	}
-};
-#define ARTPEC8_SERIAL_DRV_DATA (&artpec8_serial_drv_data)
-#else
-#define ARTPEC8_SERIAL_DRV_DATA (NULL)
-#endif
-
 static const struct platform_device_id s3c24xx_serial_driver_ids[] = {
 	{
 		.name		= "s3c6400-uart",
@@ -2627,9 +2596,6 @@ static const struct platform_device_id s3c24xx_serial_driver_ids[] = {
 	}, {
 		.name		= "exynos850-uart",
 		.driver_data	= (kernel_ulong_t)EXYNOS850_SERIAL_DRV_DATA,
-	}, {
-		.name		= "artpec8-uart",
-		.driver_data	= (kernel_ulong_t)ARTPEC8_SERIAL_DRV_DATA,
 	}, {
 		.name		= "gs101-uart",
 		.driver_data	= (kernel_ulong_t)GS101_SERIAL_DRV_DATA,
@@ -2655,8 +2621,6 @@ static const struct of_device_id s3c24xx_uart_dt_match[] = {
 		.data = S5L_SERIAL_DRV_DATA },
 	{ .compatible = "samsung,exynos850-uart",
 		.data = EXYNOS850_SERIAL_DRV_DATA },
-	{ .compatible = "axis,artpec8-uart",
-		.data = ARTPEC8_SERIAL_DRV_DATA },
 	{ .compatible = "google,gs101-uart",
 		.data = GS101_SERIAL_DRV_DATA },
 	{ .compatible = "samsung,exynos8895-uart",
@@ -2828,8 +2792,6 @@ OF_EARLYCON_DECLARE(s5pv210, "samsung,s5pv210-uart",
 			s5pv210_early_console_setup);
 OF_EARLYCON_DECLARE(exynos4210, "samsung,exynos4210-uart",
 			s5pv210_early_console_setup);
-OF_EARLYCON_DECLARE(artpec8, "axis,artpec8-uart",
-			s5pv210_early_console_setup);

 static int __init gs101_early_console_setup(struct earlycon_device *device,
 					    const char *opt)
--
2.17.1


