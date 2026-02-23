Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E688FEA4FC7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 15:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=catMFCOiQldBlsInL+ojl0dMUkj3QaeVQ8fS4npsljA=; b=lzgHdDMAxT6JZnbYbV1TwjCGGS
	cpOY6p6QSqOGT20ETzYNQcfop9RjM9irrPj/7mIFaGukNhpzYTGBcygMBuQbYJaZ2vwm+O/lSx6Cf
	tXap/PN1E+F6lncJdY6/gxPZ3n4hWt4M9d/w2VNRaopJGWQgQB3n0waNjLxdudMGdo2xqOcAIRqSD
	RiGtkUhUlBV0Iy2ihoF7biO2IywxqA1Qin6+CPCtdSZPEr3FcCcbFiuMmavLxdg0lbhF2gfmAAi3M
	FxS0Qi+G3a5jC8RNRl4M5AUINovUKeY4XArUuDUC94vYD7qJFOee5mihUiXsIG4kf4N/gTmVJ6SOA
	ybkI8yiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYLD-00000000cHM-1CJN;
	Mon, 23 Feb 2026 15:59:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYLB-00000000cGR-0V70
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 15:59:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0F27860127;
	Mon, 23 Feb 2026 15:59:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AE240C19424;
	Mon, 23 Feb 2026 15:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771862359;
	bh=odmV5niUZmpfJnRwHXoQMD5/apRHKE+2PCyK8AQML/I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ufMULU1Q1nU+iY5SbLAwKRFE/BGEl+MR0c8BBk2cCaVyvdurdu0l4Ptfe3Q8epKXb
	 WFjEuYV8rOtDy2ckKOXTWb+OD7Mxt+03pkSTbrd96EvjB0Mluhsp+7eoOllejiaqgm
	 1DyCeNmTXHS4FEGKBE/QFovjU1cZbV6s07jI2WPcb9NSpPIRguBf4mLtJIgzBjsRkP
	 /pDM4gKSrmltuOIf3rl9+b9qgHUsMtEHG0STs25rOqYHkjfwdvUJNhJN90T32kqL7w
	 AUpLe9Gw1N6+qSHVr9HzJk27ZSAF1cLvuP4JqjYpwbPYnIgk+PlFjB1U/PR/4Ugf7U
	 LwZpLILFSh3Bw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E86CE98E1E;
	Mon, 23 Feb 2026 15:59:19 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Mon, 23 Feb 2026 15:59:16 +0000
Subject: [PATCH v12 1/7] i2c: xiic: switch to devres managed APIs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-xiic-v12-1-b6c9ce4e4f3c@nexthop.ai>
References: <20260223-i2c-xiic-v12-0-b6c9ce4e4f3c@nexthop.ai>
In-Reply-To: <20260223-i2c-xiic-v12-0-b6c9ce4e4f3c@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771862359; l=2992;
 i=abdurrahman@nexthop.ai; s=20260119; h=from:subject:message-id;
 bh=xe5Qq7Si6KCzd0ih/kyZJPCw0i78NqZP8R5Fx1dBPLI=;
 b=dSWr0yb7yLam0ZeenJw4Q8x+zVLKvodtxjR4j7snA0Cpx8wy4SBYXzX9IU6GQ1X4EvMTyRhgM
 jPoKoS4tr5xD5+Hsxx0Ay32J1DWFTxS+2XlA1LfiDl0j9OdXERcht0c
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=S+ysnf+NwMcBdHBlyKIUEAtaFGSIhQwcJcgcXhq0osg=
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/20260119 with
 auth_id=608
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
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
Reply-To: abdurrahman@nexthop.ai
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Simplify the error code paths by switching to devres managed helper
functions.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/i2c/busses/i2c-xiic.c | 30 ++++++++++++------------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 28015d77599d..65aa280f6fd9 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1423,6 +1423,7 @@ MODULE_DEVICE_TABLE(of, xiic_of_match);
 
 static int xiic_i2c_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct xiic_i2c *i2c;
 	struct xiic_i2c_platform_data *pdata;
 	const struct of_device_id *match;
@@ -1461,7 +1462,10 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	snprintf(i2c->adap.name, sizeof(i2c->adap.name),
 		 DRIVER_NAME " %s", pdev->name);
 
-	mutex_init(&i2c->lock);
+	ret = devm_mutex_init(dev, &i2c->lock);
+	if (ret)
+		return ret;
+
 	spin_lock_init(&i2c->atomic_lock);
 
 	i2c->clk = devm_clk_get_enabled(&pdev->dev, NULL);
@@ -1472,8 +1476,9 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	i2c->dev = &pdev->dev;
 	pm_runtime_set_autosuspend_delay(i2c->dev, XIIC_PM_TIMEOUT);
 	pm_runtime_use_autosuspend(i2c->dev);
-	pm_runtime_set_active(i2c->dev);
-	pm_runtime_enable(i2c->dev);
+	ret = devm_pm_runtime_set_active_enabled(dev);
+	if (ret)
+		return ret;
 
 	/* SCL frequency configuration */
 	i2c->input_clk = clk_get_rate(i2c->clk);
@@ -1489,7 +1494,7 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 
 	if (ret < 0) {
 		dev_err_probe(&pdev->dev, ret, "Cannot claim IRQ\n");
-		goto err_pm_disable;
+		return ret;
 	}
 
 	i2c->singlemaster =
@@ -1508,16 +1513,14 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 		i2c->endianness = BIG;
 
 	ret = xiic_reinit(i2c);
-	if (ret < 0) {
-		dev_err_probe(&pdev->dev, ret, "Cannot xiic_reinit\n");
-		goto err_pm_disable;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Cannot xiic_reinit\n");
 
 	/* add i2c adapter to i2c tree */
 	ret = i2c_add_adapter(&i2c->adap);
 	if (ret) {
 		xiic_deinit(i2c);
-		goto err_pm_disable;
+		return ret;
 	}
 
 	if (pdata) {
@@ -1530,12 +1533,6 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 		(unsigned long)res->start, irq, i2c->i2c_clk);
 
 	return 0;
-
-err_pm_disable:
-	pm_runtime_disable(&pdev->dev);
-	pm_runtime_set_suspended(&pdev->dev);
-
-	return ret;
 }
 
 static void xiic_i2c_remove(struct platform_device *pdev)
@@ -1555,9 +1552,6 @@ static void xiic_i2c_remove(struct platform_device *pdev)
 		xiic_deinit(i2c);
 
 	pm_runtime_put_sync(i2c->dev);
-	pm_runtime_disable(&pdev->dev);
-	pm_runtime_set_suspended(&pdev->dev);
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
 }
 
 static const struct dev_pm_ops xiic_dev_pm_ops = {

-- 
2.52.0



