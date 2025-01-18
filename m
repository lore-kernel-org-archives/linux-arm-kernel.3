Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE47C02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 16:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Mee3bjrx6LlpGO4Uf1mKDrnz5gNQ5ddtHsrB/CV711U=; b=r6jTkW0+TolIMVNRojNwnC5AVa
	J816Z0VzYU2HIxGLcmfcUiyNc3wc0LtIES4jhheYwFBJLKsY7nMcYxY2z8N2yr7eO26fwA+ftLjT1
	XRwe4taaLSx3sw6sEpPlzrnFUBa2eBPT7ABlmF5YPzqW1aAqTX7nOtTHm1SxIwPuA60I0p6cEYh/A
	iCRlDSBJE6PflT1tzNAM+MV3wO7xkNPeXTS2X02l+1A8JQzjzTX65yQsIA/gtWu47O1ffKoPbiywN
	JylllDoX1y+SBULdA8Jmo70Xb7gYNGrXVIpL+v7wsiFpVbiIChW0OI4kYfgry3bnLLN/KwQdfShXk
	Pu9uTN+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZBO3-00000002ghR-20mO;
	Sat, 18 Jan 2025 16:09:27 +0000
Received: from akranes.kaiser.cx ([2a0a:4cc0:1:11ef:4484:ccff:febf:ddfa])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZBMY-00000002gX2-0m3S
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jan 2025 16:07:55 +0000
Received: from ip-176-199-252-214.um44.pools.vodafone-ip.de ([176.199.252.214] helo=martin-debian-3.kaiser.cx)
	by akranes.kaiser.cx with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <martin@kaiser.cx>)
	id 1tZBMK-000YLX-2e;
	Sat, 18 Jan 2025 17:07:40 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH] hwrng: imx-rngc - add runtime pm
Date: Sat, 18 Jan 2025 17:07:02 +0100
Message-Id: <20250118160701.32624-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_080754_222185_56CB1331 
X-CRM114-Status: GOOD (  21.62  )
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

Add runtime power management to the imx-rngc driver. Disable the
peripheral clock when the rngc is idle.

The callback functions from struct hwrng wake the rngc up when they're
called and set it to idle on exit. Helper functions which are invoked
from the callbacks assume that the rngc is active.

Device init and probe are done before runtime pm is enabled. The
peripheral clock will be handled manually during these steps. Do not use
devres any more to enable/disable the peripheral clock, this conflicts
with runtime pm.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/char/hw_random/imx-rngc.c | 70 +++++++++++++++++++++++--------
 1 file changed, 53 insertions(+), 17 deletions(-)

diff --git a/drivers/char/hw_random/imx-rngc.c b/drivers/char/hw_random/imx-rngc.c
index 5adc4946d60f..726c6a058e3f 100644
--- a/drivers/char/hw_random/imx-rngc.c
+++ b/drivers/char/hw_random/imx-rngc.c
@@ -13,6 +13,8 @@
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/pm_runtime.h>
 #include <linux/interrupt.h>
 #include <linux/hw_random.h>
 #include <linux/completion.h>
@@ -53,6 +55,7 @@
 
 #define RNGC_SELFTEST_TIMEOUT 2500 /* us */
 #define RNGC_SEED_TIMEOUT      200 /* ms */
+#define RNGC_PM_TIMEOUT        500 /* ms */
 
 static bool self_test = true;
 module_param(self_test, bool, 0);
@@ -123,7 +126,11 @@ static int imx_rngc_read(struct hwrng *rng, void *data, size_t max, bool wait)
 {
 	struct imx_rngc *rngc = container_of(rng, struct imx_rngc, rng);
 	unsigned int status;
-	int retval = 0;
+	int err, retval = 0;
+
+	err = pm_runtime_resume_and_get(rngc->dev);
+	if (err)
+		return err;
 
 	while (max >= sizeof(u32)) {
 		status = readl(rngc->base + RNGC_STATUS);
@@ -141,6 +148,8 @@ static int imx_rngc_read(struct hwrng *rng, void *data, size_t max, bool wait)
 			max -= sizeof(u32);
 		}
 	}
+	pm_runtime_mark_last_busy(rngc->dev);
+	pm_runtime_put(rngc->dev);
 
 	return retval ? retval : -EIO;
 }
@@ -169,7 +178,11 @@ static int imx_rngc_init(struct hwrng *rng)
 {
 	struct imx_rngc *rngc = container_of(rng, struct imx_rngc, rng);
 	u32 cmd, ctrl;
-	int ret;
+	int ret, err;
+
+	err = pm_runtime_resume_and_get(rngc->dev);
+	if (err)
+		return err;
 
 	/* clear error */
 	cmd = readl(rngc->base + RNGC_COMMAND);
@@ -186,15 +199,15 @@ static int imx_rngc_init(struct hwrng *rng)
 		ret = wait_for_completion_timeout(&rngc->rng_op_done,
 						  msecs_to_jiffies(RNGC_SEED_TIMEOUT));
 		if (!ret) {
-			ret = -ETIMEDOUT;
-			goto err;
+			err = -ETIMEDOUT;
+			goto out;
 		}
 
 	} while (rngc->err_reg == RNGC_ERROR_STATUS_STAT_ERR);
 
 	if (rngc->err_reg) {
-		ret = -EIO;
-		goto err;
+		err = -EIO;
+		goto out;
 	}
 
 	/*
@@ -205,23 +218,30 @@ static int imx_rngc_init(struct hwrng *rng)
 	ctrl |= RNGC_CTRL_AUTO_SEED;
 	writel(ctrl, rngc->base + RNGC_CONTROL);
 
+	err = 0;
+out:
 	/*
 	 * if initialisation was successful, we keep the interrupt
 	 * unmasked until imx_rngc_cleanup is called
 	 * we mask the interrupt ourselves if we return an error
 	 */
-	return 0;
+	if (err)
+		imx_rngc_irq_mask_clear(rngc);
 
-err:
-	imx_rngc_irq_mask_clear(rngc);
-	return ret;
+	pm_runtime_put(rngc->dev);
+	return err;
 }
 
 static void imx_rngc_cleanup(struct hwrng *rng)
 {
 	struct imx_rngc *rngc = container_of(rng, struct imx_rngc, rng);
+	int err;
 
-	imx_rngc_irq_mask_clear(rngc);
+	err = pm_runtime_resume_and_get(rngc->dev);
+	if (!err) {
+		imx_rngc_irq_mask_clear(rngc);
+		pm_runtime_put(rngc->dev);
+	}
 }
 
 static int __init imx_rngc_probe(struct platform_device *pdev)
@@ -240,7 +260,7 @@ static int __init imx_rngc_probe(struct platform_device *pdev)
 	if (IS_ERR(rngc->base))
 		return PTR_ERR(rngc->base);
 
-	rngc->clk = devm_clk_get_enabled(&pdev->dev, NULL);
+	rngc->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(rngc->clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(rngc->clk), "Cannot get rng_clk\n");
 
@@ -248,14 +268,18 @@ static int __init imx_rngc_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
+	clk_prepare_enable(rngc->clk);
+
 	ver_id = readl(rngc->base + RNGC_VER_ID);
 	rng_type = FIELD_GET(RNG_TYPE, ver_id);
 	/*
 	 * This driver supports only RNGC and RNGB. (There's a different
 	 * driver for RNGA.)
 	 */
-	if (rng_type != RNGC_TYPE_RNGC && rng_type != RNGC_TYPE_RNGB)
+	if (rng_type != RNGC_TYPE_RNGC && rng_type != RNGC_TYPE_RNGB) {
+		clk_disable_unprepare(rngc->clk);
 		return -ENODEV;
+	}
 
 	init_completion(&rngc->rng_op_done);
 
@@ -271,15 +295,24 @@ static int __init imx_rngc_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(&pdev->dev,
 			irq, imx_rngc_irq, 0, pdev->name, (void *)rngc);
-	if (ret)
+	if (ret) {
+		clk_disable_unprepare(rngc->clk);
 		return dev_err_probe(&pdev->dev, ret, "Can't get interrupt working.\n");
+	}
 
 	if (self_test) {
 		ret = imx_rngc_self_test(rngc);
-		if (ret)
+		if (ret) {
+			clk_disable_unprepare(rngc->clk);
 			return dev_err_probe(&pdev->dev, ret, "self test failed\n");
+		}
 	}
 
+	pm_runtime_set_autosuspend_delay(&pdev->dev, RNGC_PM_TIMEOUT);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_set_active(&pdev->dev);
+	devm_pm_runtime_enable(&pdev->dev);
+
 	ret = devm_hwrng_register(&pdev->dev, &rngc->rng);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "hwrng registration failed\n");
@@ -309,7 +342,10 @@ static int imx_rngc_resume(struct device *dev)
 	return 0;
 }
 
-static DEFINE_SIMPLE_DEV_PM_OPS(imx_rngc_pm_ops, imx_rngc_suspend, imx_rngc_resume);
+static const struct dev_pm_ops imx_rngc_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
+	RUNTIME_PM_OPS(imx_rngc_suspend, imx_rngc_resume, NULL)
+};
 
 static const struct of_device_id imx_rngc_dt_ids[] = {
 	{ .compatible = "fsl,imx25-rngb" },
@@ -320,7 +356,7 @@ MODULE_DEVICE_TABLE(of, imx_rngc_dt_ids);
 static struct platform_driver imx_rngc_driver = {
 	.driver = {
 		.name = KBUILD_MODNAME,
-		.pm = pm_sleep_ptr(&imx_rngc_pm_ops),
+		.pm = pm_ptr(&imx_rngc_pm_ops),
 		.of_match_table = imx_rngc_dt_ids,
 	},
 };
-- 
2.39.5


