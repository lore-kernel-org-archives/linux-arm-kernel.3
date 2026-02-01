Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA96EE7C6F6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Feb 2026 02:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N95WV02uuu51tSHlW6bnl5xaP+XYN/jBPMLFI7/ump0=; b=SQgjmaeQ0dR74rt5j+tOt1qMcF
	cBheCnSt7Y+eMU751bQhQ8OvxH45mkeqIhkSafllU7G+O7Q3FxiH5oVo71v88lA5tURJga/3Oh2Oh
	L4zF7ASI6JtkAY0FEHm71+Fx0g3ktp0XEndQ2DHT/Deagd6m/UYcOTsytHbslqxFp2rMQLSwxj03z
	3Mv1bz9tMk8pdeON2PP9CzNeHpbJw3H/xG96cPk415J/tlw/IaVqa/Jq/qIeSbsF8Jo1CIYQ3CeCN
	957kbzpWATY9GoppViKTDBr21S2LEon3ulOEgy58eC8ZG2tWs+lpkwndsJ4O+FjnaXl60eZvLhH+9
	NQiTUxsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmNes-00000003CUq-2rvO;
	Sun, 01 Feb 2026 02:57:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmNeq-00000003CTb-3Ms5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Feb 2026 02:57:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 21CEC6013E;
	Sun,  1 Feb 2026 02:57:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 90538C16AAE;
	Sun,  1 Feb 2026 02:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769914669;
	bh=wzyK5C+7gEBOnnJZjSZxVGWBnuD0tO8LwZHYRLn2itQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aH+dxqWHm11+4fFKTK41QTxPFoArW4d8v3DM3TGVAx/XppTfQk/TWclS65gx+puDH
	 gFMxTT8e6o/D1ajrOAuZ1rdp/qx8pbQYPsVZDA+3OqWrFyw8EyFWBT3VSBKQfvjHcV
	 rXeLJy1gCSCeE6TbQY3GcuKiFQId7A3/Q82XHqxK0tCZd+z1XMz0w+xnLvxonL4f6S
	 Uk9FZcdkl9P9VRCxvzMPewIkqYnsVZYMSAl7dv9eYwZW+IoTNENEfjlIhIqO+YGIyV
	 jxkJJQxSRIwSRdNLRcxERaPmdBGmJxg58gzJBQQSX74vdki2EJmy30Cq8So8kON1ao
	 vkVFmwrktvHSA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81666E7C6FA;
	Sun,  1 Feb 2026 02:57:49 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Sun, 01 Feb 2026 02:57:45 +0000
Subject: [PATCH v8 1/6] i2c: xiic: switch to devres managed APIs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260201-i2c-xiic-v8-1-deb2dd158d1a@nexthop.ai>
References: <20260201-i2c-xiic-v8-0-deb2dd158d1a@nexthop.ai>
In-Reply-To: <20260201-i2c-xiic-v8-0-deb2dd158d1a@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769914668; l=2947;
 i=abdurrahman@nexthop.ai; s=20260119; h=from:subject:message-id;
 bh=W8zDDZw4EUzfrNuEoTOo05XNo8J4+DIsLswOSdxs308=;
 b=p/N6DbFWEE5maPZuVxaN7e+LkBE3NszZh9rGTh5MgaS4i18YtRnzrW6H59VIr4fM7bdUYnBAg
 Hees6mWVXYcCL7TgXlaSVp/YnM/yOStBi12dnRofnw4HCCSms40lBUQ
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
 drivers/i2c/busses/i2c-xiic.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 28015d77599d..16ff83fe280b 100644
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
@@ -1529,12 +1532,6 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	dev_dbg(&pdev->dev, "mmio %08lx irq %d scl clock frequency %d\n",
 		(unsigned long)res->start, irq, i2c->i2c_clk);
 
-	return 0;
-
-err_pm_disable:
-	pm_runtime_disable(&pdev->dev);
-	pm_runtime_set_suspended(&pdev->dev);
-
 	return ret;
 }
 
@@ -1555,8 +1552,6 @@ static void xiic_i2c_remove(struct platform_device *pdev)
 		xiic_deinit(i2c);
 
 	pm_runtime_put_sync(i2c->dev);
-	pm_runtime_disable(&pdev->dev);
-	pm_runtime_set_suspended(&pdev->dev);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 }
 

-- 
2.52.0



