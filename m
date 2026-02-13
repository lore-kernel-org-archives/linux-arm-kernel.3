Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A1B6EEA86E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 00:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=catMFCOiQldBlsInL+ojl0dMUkj3QaeVQ8fS4npsljA=; b=LJg5C/SogbLb4EGFY0/+iq2Udk
	PjIe4GoV16qniSUwEAOMfHp4o5i12rSix0EkerBoqyTHBjAZ6EUkfDSNBg0m2ug23K5Bxsapnz0iN
	tYoau81mhkZJyZtB7vl0AglUyoooRqkVyNRUXbs2azYTJ2amTfRysc+ULkYd+EsmuDCix1s3hR3Ov
	MlDRnCRcQrGExqKS45FXPh/IiPBTj0GcN9YM3E9q+OSVlOoksyN3TRehJNzCVbArAjXiToojS2XKm
	dBrwxfofmcHOkSdtzGtpXa405oUsUig/PRx8e0y5Jq4iPyDOCFtgQnH3f+Wj+BSRaSQvJU7cxCW1G
	i3d0u5Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqgqJ-00000002lcn-0cnM;
	Fri, 13 Feb 2026 00:15:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqgqB-00000002lXE-3bil
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 00:15:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B521B445B9;
	Fri, 13 Feb 2026 00:15:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7C840C4CEF7;
	Fri, 13 Feb 2026 00:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770941722;
	bh=odmV5niUZmpfJnRwHXoQMD5/apRHKE+2PCyK8AQML/I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WfBxamJ/v4rzIhn4fsDBL2srK/hZQamO77VWOl2dssNtaxfNZwa6hdkdXQ4lv6f7O
	 h/i6ZlCQAJrIrfxkS9Clp6Y+b9CY81fq4Wcz++0od31q+ePvk7x933oyE5Ik27666S
	 lI6u7NBOK3SJt9nGDD4e346t+DOsS77tRi0p7h3BzMyGWYI0WvcQ4d8/No5zjSRoq2
	 pzdtsJYMkSPTMUdOJ84pmI+aRJYsSYMwvvS/hd9H3q/U9aI5+ftD4upcdtwUQTv7IF
	 OcKlMOJutNxNwjC+fMgx5O6WrUNtE7Jh/3rgD4B5DEM6Qf2tDYqH70hCiIhOQMrr4N
	 agJQPU+BHtULw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BC41EEA86E;
	Fri, 13 Feb 2026 00:15:22 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Fri, 13 Feb 2026 00:15:16 +0000
Subject: [PATCH v11 1/7] i2c: xiic: switch to devres managed APIs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-i2c-xiic-v11-1-5d18aea11bde@nexthop.ai>
References: <20260213-i2c-xiic-v11-0-5d18aea11bde@nexthop.ai>
In-Reply-To: <20260213-i2c-xiic-v11-0-5d18aea11bde@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770941721; l=2992;
 i=abdurrahman@nexthop.ai; s=20260119; h=from:subject:message-id;
 bh=xe5Qq7Si6KCzd0ih/kyZJPCw0i78NqZP8R5Fx1dBPLI=;
 b=qoaB1lNHbbTdBA5ZFW4APj4o2rrcGUF80x8qghPJ1pqxa0+McQMy5g10+ojZE32jgJTRE4UhV
 IXoeXoL4uzFAmCBHWCEolwBB3XxjzIcWqcBUbX2CGOUVrj9PwGrEA0z
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=S+ysnf+NwMcBdHBlyKIUEAtaFGSIhQwcJcgcXhq0osg=
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/20260119 with
 auth_id=608
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_161523_953944_8A4F0C87 
X-CRM114-Status: GOOD (  13.95  )
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



