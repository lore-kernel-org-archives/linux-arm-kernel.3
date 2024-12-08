Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977CAE77173
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Dec 2024 13:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=92WH5HDc/CJvXu7YyH4zTShspkq/Skj2Ac6EnhxD+pM=; b=eX68Kl/zH1+RLM4UczkJ9bZHjU
	LUTbCfV3klVtD+PoSgj8+ZhzeODdp/SZiDk+tOzY0b9vQ1MFcDf6Dw5zPObZs8BrPk33fSrSFg0IV
	etKNgeRVl9fpz5Hx9uXSE+utN98Sa2T5P/MX6X88ZLLCo1phLAiwhlb2RlI1gCQAGOqF0y0c2FI2v
	1f15hiiilnFEQCtl4pfXsUAipgIkMRp2bacDhEpVx00VioeIHQe8Thyf+B6NQftGTWQCOCh79rijW
	Ry88xZikXGoZ/SgpUE3eHVs9sXhELWI0XO8LcXdgwiLbiUhyNCBPLPxg3h6mQ88waxWtgESuw1+JR
	FAunte4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKGxc-00000005I7g-3VcH;
	Sun, 08 Dec 2024 13:04:32 +0000
Received: from [44.216.146.169] (helo=ec2-44-216-146-169.compute-1.amazonaws.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKGwX-00000005Hrp-3hS3;
	Sun, 08 Dec 2024 13:03:29 +0000
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 508381e4;
	Sun, 8 Dec 2024 21:03:13 +0800 (GMT+08:00)
From: Jon Lin <jon.lin@rock-chips.com>
To: broonie@kernel.org
Cc: linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	heiko@sntech.de,
	jon.lin@rock-chips.com,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org
Subject: [PATCH] spi: rockchip-sfc: Support pm ops
Date: Sun,  8 Dec 2024 21:03:11 +0800
Message-Id: <20241208130311.1324024-1-jon.lin@rock-chips.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0lCH1ZLHU5ITh0aGR8dSUtWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a93a65dec9709d9kunm508381e4
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mwg6Eio4CTIeEU0jLwkQVk5K
	Dz9PCj9VSlVKTEhITU1JQkJPTkpNVTMWGhIXVREUFVUXEhU7CRQYEFYYExILCFUYFBZFWVdZEgtZ
	QVlOQ1VJSVVMVUpKT1lXWQgBWUFDTE5KNwY+
DKIM-Signature: a=rsa-sha256;
	b=MPrKiTy1whsn3XXyOXp+Sd/v81yFhRr+WZ9jGGq1j5mAsniFGVmU4NYryQ7idU/x5JgU8l55MmtE6ZGa3luNc3BtYt9JahAwwKkaOiCpB0s/mGRXE7BDArwPc+rdiwPVgdu9t9Cq62PESxW6uSdUrYfB8fqt6GA4cr2ZPaBV7JE=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=92WH5HDc/CJvXu7YyH4zTShspkq/Skj2Ac6EnhxD+pM=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_050327_315096_E63722B2 
X-CRM114-Status: GOOD (  21.25  )
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

Support system_sleep and runtime_pm ops.

Signed-off-by: Jon Lin <jon.lin@rock-chips.com>
---

 drivers/spi/spi-rockchip-sfc.c | 148 ++++++++++++++++++++++++++++-----
 1 file changed, 128 insertions(+), 20 deletions(-)

diff --git a/drivers/spi/spi-rockchip-sfc.c b/drivers/spi/spi-rockchip-sfc.c
index 14f5b9346050..9146b56713b6 100644
--- a/drivers/spi/spi-rockchip-sfc.c
+++ b/drivers/spi/spi-rockchip-sfc.c
@@ -13,12 +13,14 @@
 #include <linux/completion.h>
 #include <linux/dma-mapping.h>
 #include <linux/iopoll.h>
+#include <linux/interrupt.h>
 #include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/slab.h>
-#include <linux/interrupt.h>
 #include <linux/spi/spi-mem.h>
 
 /* System control */
@@ -150,11 +152,9 @@
 /* Data */
 #define SFC_DATA			0x108
 
-/* The controller and documentation reports that it supports up to 4 CS
- * devices (0-3), however I have only been able to test a single CS (CS 0)
- * due to the configuration of my device.
- */
-#define SFC_MAX_CHIPSELECT_NUM		4
+#define SFC_CS1_REG_OFFSET		0x200
+
+#define SFC_MAX_CHIPSELECT_NUM		2
 
 /* The SFC can transfer max 16KB - 1 at one time
  * we set it to 15.5KB here for alignment.
@@ -169,12 +169,14 @@
  */
 #define SFC_MAX_SPEED		(150 * 1000 * 1000)
 
+#define ROCKCHIP_AUTOSUSPEND_DELAY	2000
+
 struct rockchip_sfc {
 	struct device *dev;
 	void __iomem *regbase;
 	struct clk *hclk;
 	struct clk *clk;
-	u32 frequency;
+	u32 speed[SFC_MAX_CHIPSELECT_NUM];
 	/* virtual mapped addr for dma_buffer */
 	void *buffer;
 	dma_addr_t dma_buffer;
@@ -301,6 +303,7 @@ static int rockchip_sfc_xfer_setup(struct rockchip_sfc *sfc,
 				   u32 len)
 {
 	u32 ctrl = 0, cmd = 0;
+	u8 cs = spi_get_chipselect(mem->spi, 0);
 
 	/* set CMD */
 	cmd = op->cmd.opcode;
@@ -314,7 +317,8 @@ static int rockchip_sfc_xfer_setup(struct rockchip_sfc *sfc,
 			cmd |= SFC_CMD_ADDR_24BITS << SFC_CMD_ADDR_SHIFT;
 		} else {
 			cmd |= SFC_CMD_ADDR_XBITS << SFC_CMD_ADDR_SHIFT;
-			writel(op->addr.nbytes * 8 - 1, sfc->regbase + SFC_ABIT);
+			writel(op->addr.nbytes * 8 - 1,
+			       sfc->regbase + cs * SFC_CS1_REG_OFFSET + SFC_ABIT);
 		}
 
 		ctrl |= ((op->addr.buswidth >> 1) << SFC_CTRL_ADDR_BITS_SHIFT);
@@ -346,7 +350,7 @@ static int rockchip_sfc_xfer_setup(struct rockchip_sfc *sfc,
 
 	/* set the Controller */
 	ctrl |= SFC_CTRL_PHASE_SEL_NEGETIVE;
-	cmd |= spi_get_chipselect(mem->spi, 0) << SFC_CMD_CS_SHIFT;
+	cmd |= cs << SFC_CMD_CS_SHIFT;
 
 	dev_dbg(sfc->dev, "sfc addr.nbytes=%x(x%d) dummy.nbytes=%x(x%d)\n",
 		op->addr.nbytes, op->addr.buswidth,
@@ -354,7 +358,7 @@ static int rockchip_sfc_xfer_setup(struct rockchip_sfc *sfc,
 	dev_dbg(sfc->dev, "sfc ctrl=%x cmd=%x addr=%llx len=%x\n",
 		ctrl, cmd, op->addr.val, len);
 
-	writel(ctrl, sfc->regbase + SFC_CTRL);
+	writel(ctrl, sfc->regbase + cs * SFC_CS1_REG_OFFSET + SFC_CTRL);
 	writel(cmd, sfc->regbase + SFC_CMD);
 	if (op->addr.nbytes)
 		writel(op->addr.val, sfc->regbase + SFC_ADDR);
@@ -500,14 +504,22 @@ static int rockchip_sfc_exec_mem_op(struct spi_mem *mem, const struct spi_mem_op
 	struct rockchip_sfc *sfc = spi_controller_get_devdata(mem->spi->controller);
 	u32 len = op->data.nbytes;
 	int ret;
+	u8 cs = spi_get_chipselect(mem->spi, 0);
+
+	ret = pm_runtime_get_sync(sfc->dev);
+	if (ret < 0) {
+		pm_runtime_put_noidle(sfc->dev);
+		return ret;
+	}
 
-	if (unlikely(mem->spi->max_speed_hz != sfc->frequency) && !has_acpi_companion(sfc->dev)) {
+	if (unlikely(mem->spi->max_speed_hz != sfc->speed[cs]) &&
+	    !has_acpi_companion(sfc->dev)) {
 		ret = clk_set_rate(sfc->clk, mem->spi->max_speed_hz);
 		if (ret)
-			return ret;
-		sfc->frequency = mem->spi->max_speed_hz;
+			goto out;
+		sfc->speed[cs] = mem->spi->max_speed_hz;
 		dev_dbg(sfc->dev, "set_freq=%dHz real_freq=%ldHz\n",
-			sfc->frequency, clk_get_rate(sfc->clk));
+			sfc->speed[cs], clk_get_rate(sfc->clk));
 	}
 
 	rockchip_sfc_adjust_op_work((struct spi_mem_op *)op);
@@ -524,11 +536,17 @@ static int rockchip_sfc_exec_mem_op(struct spi_mem *mem, const struct spi_mem_op
 		if (ret != len) {
 			dev_err(sfc->dev, "xfer data failed ret %d dir %d\n", ret, op->data.dir);
 
-			return -EIO;
+			ret = -EIO;
+			goto out;
 		}
 	}
 
-	return rockchip_sfc_xfer_done(sfc, 100000);
+	ret = rockchip_sfc_xfer_done(sfc, 100000);
+out:
+	pm_runtime_mark_last_busy(sfc->dev);
+	pm_runtime_put_autosuspend(sfc->dev);
+
+	return ret;
 }
 
 static int rockchip_sfc_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op)
@@ -570,6 +588,7 @@ static int rockchip_sfc_probe(struct platform_device *pdev)
 	struct spi_controller *host;
 	struct rockchip_sfc *sfc;
 	int ret;
+	u32 i, val;
 
 	host = devm_spi_alloc_host(&pdev->dev, sizeof(*sfc));
 	if (!host)
@@ -602,9 +621,12 @@ static int rockchip_sfc_probe(struct platform_device *pdev)
 				     "Failed to get sfc ahb clk\n");
 
 	if (has_acpi_companion(&pdev->dev)) {
-		ret = device_property_read_u32(&pdev->dev, "clock-frequency", &sfc->frequency);
+		ret = device_property_read_u32(&pdev->dev, "clock-frequency", &val);
 		if (ret)
-			return dev_err_probe(&pdev->dev, ret, "Failed to find clock-frequency\n");
+			return dev_err_probe(&pdev->dev, ret,
+					     "Failed to find clock-frequency in ACPI\n");
+		for (i = 0; i < SFC_MAX_CHIPSELECT_NUM; i++)
+			sfc->speed[i] = val;
 	}
 
 	sfc->use_dma = !of_property_read_bool(sfc->dev->of_node, "rockchip,sfc-no-dma");
@@ -646,6 +668,8 @@ static int rockchip_sfc_probe(struct platform_device *pdev)
 		goto err_irq;
 	}
 
+	platform_set_drvdata(pdev, sfc);
+
 	ret = rockchip_sfc_init(sfc);
 	if (ret)
 		goto err_irq;
@@ -653,12 +677,27 @@ static int rockchip_sfc_probe(struct platform_device *pdev)
 	sfc->max_iosize = rockchip_sfc_get_max_iosize(sfc);
 	sfc->version = rockchip_sfc_get_version(sfc);
 
-	ret = spi_register_controller(host);
+	pm_runtime_set_autosuspend_delay(dev, ROCKCHIP_AUTOSUSPEND_DELAY);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+	pm_runtime_get_noresume(dev);
+
+	ret = devm_spi_register_controller(dev, host);
 	if (ret)
-		goto err_irq;
+		goto err_pm_runtime_free;
+
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
 
 	return 0;
 
+err_pm_runtime_free:
+	pm_runtime_get_sync(dev);
+	pm_runtime_put_noidle(dev);
+	pm_runtime_disable(dev);
+	pm_runtime_set_suspended(dev);
+	pm_runtime_dont_use_autosuspend(dev);
 err_irq:
 	clk_disable_unprepare(sfc->clk);
 err_clk:
@@ -678,6 +717,74 @@ static void rockchip_sfc_remove(struct platform_device *pdev)
 	clk_disable_unprepare(sfc->hclk);
 }
 
+#ifdef CONFIG_PM
+static int rockchip_sfc_runtime_suspend(struct device *dev)
+{
+	struct rockchip_sfc *sfc = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(sfc->clk);
+	clk_disable_unprepare(sfc->hclk);
+
+	return 0;
+}
+
+static int rockchip_sfc_runtime_resume(struct device *dev)
+{
+	struct rockchip_sfc *sfc = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(sfc->hclk);
+	if (ret < 0)
+		return ret;
+
+	ret = clk_prepare_enable(sfc->clk);
+	if (ret < 0)
+		clk_disable_unprepare(sfc->hclk);
+
+	return ret;
+}
+#endif /* CONFIG_PM */
+
+#ifdef CONFIG_PM_SLEEP
+static int rockchip_sfc_suspend(struct device *dev)
+{
+	pinctrl_pm_select_sleep_state(dev);
+
+	return pm_runtime_force_suspend(dev);
+}
+
+static int rockchip_sfc_resume(struct device *dev)
+{
+	struct rockchip_sfc *sfc = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pm_runtime_force_resume(dev);
+	if (ret < 0)
+		return ret;
+
+	pinctrl_pm_select_default_state(dev);
+
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0) {
+		pm_runtime_put_noidle(dev);
+		return ret;
+	}
+
+	rockchip_sfc_init(sfc);
+
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
+	return 0;
+}
+#endif /* CONFIG_PM_SLEEP */
+
+static const struct dev_pm_ops rockchip_sfc_pm_ops = {
+	SET_RUNTIME_PM_OPS(rockchip_sfc_runtime_suspend,
+			   rockchip_sfc_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(rockchip_sfc_suspend, rockchip_sfc_resume)
+};
+
 static const struct of_device_id rockchip_sfc_dt_ids[] = {
 	{ .compatible = "rockchip,sfc"},
 	{ /* sentinel */ }
@@ -688,6 +795,7 @@ static struct platform_driver rockchip_sfc_driver = {
 	.driver = {
 		.name	= "rockchip-sfc",
 		.of_match_table = rockchip_sfc_dt_ids,
+		.pm = &rockchip_sfc_pm_ops,
 	},
 	.probe	= rockchip_sfc_probe,
 	.remove = rockchip_sfc_remove,
-- 
2.34.1


