Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 541DEC02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 22:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vgnMG6pJBvdU2HUT93EP8LTpJb1730xDsO9aVBeLZE0=; b=u642UEJ7hivlScGtR6BTEb2ZIx
	jH9MSCGcNhADGLhZI+wXl8JsGYfYHU4xN4/XcJqXy8o2Kn7hj5WPwU8Wm9zs0Dgw1kkhkZjsSS0f0
	NpR0rmpgqNeWO99QUNT0iBo6kqC4Jc6OjLVYpmiMIE+uu0TFQHfKNlHWcdEVdK26U+C1v2aCbcX3O
	EOdC3w+mQh+pajcd2huGM/jP/hyWu5fHnyD564s7NEWsosKht2Af4SoVLkMhin+QowCNkMgowLPdC
	wRdz6iWuEz6bLUeEjA9saL9BPOUzkgb76AleqDcYeDBgfdClwi7nwPNRKdckrZ0tlfe9mbgzyFqHb
	XyYe6R4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYYpk-0000000GGfy-1CH3;
	Thu, 16 Jan 2025 22:59:28 +0000
Received: from out-186.mta0.migadu.com ([2001:41d0:1004:224b::ba])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYYm4-0000000GFzT-2tEW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 22:55:42 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737068138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vgnMG6pJBvdU2HUT93EP8LTpJb1730xDsO9aVBeLZE0=;
	b=HqSjS39sCx1/8b+P1gWd98wQX8dz5L7tEUVtHzPgZxCKdACiIywurRdbHDCUANiI67fMHq
	NWZXZI6UwmOW0/sByqg57FkK4umUM06xUhjCUna30sdmiXct32oAvCftbYnl8Xy0uygIru
	6IYiVj282sCb7U25m/QVyM+zRL9kzAY=
From: Sean Anderson <sean.anderson@linux.dev>
To: Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-spi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH 2/5] spi: zynqmp-gqspi: Reset device in probe
Date: Thu, 16 Jan 2025 17:55:18 -0500
Message-Id: <20250116225521.2688224-3-sean.anderson@linux.dev>
In-Reply-To: <20250116225521.2688224-1-sean.anderson@linux.dev>
References: <20250116225521.2688224-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_145540_867251_FEF9F48C 
X-CRM114-Status: GOOD (  16.39  )
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

Ensure we get a clean slate (without any bootloader settings) by
resetting the device before we initialize it.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 drivers/spi/spi-zynqmp-gqspi.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-zynqmp-gqspi.c b/drivers/spi/spi-zynqmp-gqspi.c
index 549a6e0c9654..7d138f45b692 100644
--- a/drivers/spi/spi-zynqmp-gqspi.c
+++ b/drivers/spi/spi-zynqmp-gqspi.c
@@ -17,6 +17,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/reset.h>
 #include <linux/spi/spi.h>
 #include <linux/spinlock.h>
 #include <linux/workqueue.h>
@@ -171,6 +172,7 @@ struct qspi_platform_data {
  * @regs:		Virtual address of the QSPI controller registers
  * @refclk:		Pointer to the peripheral clock
  * @pclk:		Pointer to the APB clock
+ * @reset:		Pointer to reset controller
  * @irq:		IRQ number
  * @dev:		Pointer to struct device
  * @txbuf:		Pointer to the TX buffer
@@ -193,6 +195,7 @@ struct zynqmp_qspi {
 	void __iomem *regs;
 	struct clk *refclk;
 	struct clk *pclk;
+	struct reset_control *reset;
 	int irq;
 	struct device *dev;
 	const void *txbuf;
@@ -351,10 +354,17 @@ static void zynqmp_qspi_set_tapdelay(struct zynqmp_qspi *xqspi, u32 baudrateval)
  *	- Set clock polarity and
  *	- Enable the QSPI controller
  */
-static void zynqmp_qspi_init_hw(struct zynqmp_qspi *xqspi)
+static int zynqmp_qspi_init_hw(struct zynqmp_qspi *xqspi)
 {
 	u32 config_reg, baud_rate_val = 0;
 	ulong clk_rate;
+	int ret;
+
+	ret = reset_control_reset(xqspi->reset);
+	if (ret) {
+		dev_err(xqspi->dev, "Unable to reset: %pe\n", &ret);
+		return ret;
+	}
 
 	/* Select the GQSPI mode */
 	zynqmp_gqspi_write(xqspi, GQSPI_SEL_OFST, GQSPI_SEL_MASK);
@@ -436,6 +446,8 @@ static void zynqmp_qspi_init_hw(struct zynqmp_qspi *xqspi)
 
 	/* Enable the GQSPI */
 	zynqmp_gqspi_write(xqspi, GQSPI_EN_OFST, GQSPI_EN_MASK);
+
+	return 0;
 }
 
 /**
@@ -1259,6 +1271,12 @@ static int zynqmp_qspi_probe(struct platform_device *pdev)
 	if (IS_ERR(xqspi->regs))
 		return PTR_ERR(xqspi->regs);
 
+	xqspi->reset =
+		devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
+	if (IS_ERR(xqspi->reset))
+		return dev_err_probe(dev, PTR_ERR(xqspi->reset),
+				     "could not get reset\n");
+
 	xqspi->pclk = devm_clk_get(&pdev->dev, "pclk");
 	if (IS_ERR(xqspi->pclk))
 		return dev_err_probe(dev, PTR_ERR(xqspi->pclk),
@@ -1300,7 +1318,9 @@ static int zynqmp_qspi_probe(struct platform_device *pdev)
 	xqspi->speed_hz = ctlr->max_speed_hz;
 
 	/* QSPI controller initializations */
-	zynqmp_qspi_init_hw(xqspi);
+	ret = zynqmp_qspi_init_hw(xqspi);
+	if (ret)
+		goto clk_dis_all;
 
 	xqspi->irq = platform_get_irq(pdev, 0);
 	if (xqspi->irq < 0) {
-- 
2.35.1.1320.gc452695387.dirty


