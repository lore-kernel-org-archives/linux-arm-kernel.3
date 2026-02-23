Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C284CEC1100
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 15:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pOLRqwiFtZ1uavE8PpvwDdmfH//FF+lkC0yhGV/Rlgw=; b=HkGDDSL1m0SCYzKV6IgplPWeEd
	ATeOn+E+zM+rKIs3nD0M8UoMxTWOQ5R15dWMhhU7HoVbVqEmkfDlbR+QhcQRcjsW7JjJ3Bt1R22Ib
	uyZKRvh2tWHg1eIKZ/WCkpnTEeFtYakxKv9t4MQBr83KFTTpXuWd7HlMFXq7TJ7Ovfm/jucgDDVuc
	IJeQGt4NbP6Jza16edR3mS7t4rSOynRJeM4hSur9MnLybzOZ7duF237Ip03OWEXECNpAi6M8SS4aF
	GsSeJnsBRdakBB+oOvKXY+W5G/p3F3YLPm+ui1ei/FlEgjwRPxCmHeeAko9LqB/Az8asp5WtElpPq
	cuOPPIlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYLM-00000000cNb-1zYG;
	Mon, 23 Feb 2026 15:59:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYLJ-00000000cKI-3jHl
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Feb 2026 15:59:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=pOLRqwiFtZ1uavE8PpvwDdmfH//FF+lkC0yhGV/Rlgw=; b=em+Kz+dWbYYV+7rAfJMHHcKEbQ
	ktlhCC/D/wncNhbT1TDFE3Yw3JMaJ62h4KDyFQssTATiwzMUcSLpesR/mMt8Te3YbmEUV4G0cAV0F
	QKaulmfsdggmiZ2PRc+mVHQtXnI0z1byZlP+Swx6gacROUwslZiHcK0dOZ584dcCU1LOcJPxZHtDQ
	jNy80b1WCwjY1GqpAoanjZ1YLj6+QIMNIflO2iflUP6PjfCDnhBNHCrfFIVBYtjM77KaqkPkHVklm
	p+LO1qAn7rbnfFq2uloC0GtSv426aAswif4llxd6Khcx0AAeMG/mPMxjuTwicIwldnspgFbyIqq0U
	EWdoU5pw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYLF-00000005PNN-0Yg9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 15:59:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0D7B344561;
	Mon, 23 Feb 2026 15:59:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DF669C2BC87;
	Mon, 23 Feb 2026 15:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771862359;
	bh=BPWk7V6IosdqQatWb/+R1Zbr9KXhb6qDSmUpXNtngrc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LDwhHkLKG9KcD8jSRzplUoYde45EYwtAlkOLDsQgJ6hFdtkNZKXyLtXklMfbiUciV
	 XAon3Fp9dXWZ5dGid93ZWN5IGACgzCLoZhIv3euRM9glKwCvNNh295Ti5SXt2Y/p3s
	 M0jfw39TNBVSBp2airqjJng5hOdEsLtIGbqcw+V/I5ewr+LNNyoum1i4JzgVJkkT51
	 /KdQtRr7v7cjvhTtGMHS+aLPioXC/zjdWM6eTNFwlOz7S3ZAdGUzdcLoPPH7S6SR2f
	 Aa7Krl9RBLjgBwRI3LVGD/dsa61/geU/pn5jRFZQaXUKgYrioFzuTnw6QxOJ0vLRg4
	 UQr9gQNKaZK4w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8BA4EF5862;
	Mon, 23 Feb 2026 15:59:19 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Mon, 23 Feb 2026 15:59:19 +0000
Subject: [PATCH v12 4/7] i2c: xiic: cosmetic cleanup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-xiic-v12-4-b6c9ce4e4f3c@nexthop.ai>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771862359; l=2687;
 i=abdurrahman@nexthop.ai; s=20260119; h=from:subject:message-id;
 bh=WKrYUysErSt8JUMYxG926hSrEQ6AQxFlt9ypfj4o7Ls=;
 b=0xl97kExS2O1dCFZT7JYp7TvujhDRbiZfVq2+5xolj18xlWwOIv5wHYnOdMebT/aBdAwI3c5H
 fcWtjcT2wxgCSclCnrPIcwIr/DjQkEj0x6YWnEFgBsxR40QYWZgG4ad
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=S+ysnf+NwMcBdHBlyKIUEAtaFGSIhQwcJcgcXhq0osg=
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/20260119 with
 auth_id=608
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_155925_762304_9AE6554C 
X-CRM114-Status: GOOD (  12.75  )
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

Re-use dev pointer instead of referencing &pdev->dev everywhere.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/i2c/busses/i2c-xiic.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index c7f641e291a2..463a207c6a76 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1430,7 +1430,7 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	u8 i;
 	u32 sr;
 
-	i2c = devm_kzalloc(&pdev->dev, sizeof(*i2c), GFP_KERNEL);
+	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
 	if (!i2c)
 		return -ENOMEM;
 
@@ -1446,7 +1446,7 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	pdata = dev_get_platdata(&pdev->dev);
+	pdata = dev_get_platdata(dev);
 
 	/* hook up driver to tree */
 	platform_set_drvdata(pdev, i2c);
@@ -1468,9 +1468,10 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(i2c->clk),
 				     "failed to enable input clock.\n");
 
-	i2c->dev = &pdev->dev;
-	pm_runtime_set_autosuspend_delay(i2c->dev, XIIC_PM_TIMEOUT);
-	pm_runtime_use_autosuspend(i2c->dev);
+	i2c->dev = dev;
+
+	pm_runtime_set_autosuspend_delay(dev, XIIC_PM_TIMEOUT);
+	pm_runtime_use_autosuspend(dev);
 	ret = devm_pm_runtime_set_active_enabled(dev);
 	if (ret)
 		return ret;
@@ -1482,9 +1483,8 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	if (ret || i2c->i2c_clk > I2C_MAX_FAST_MODE_PLUS_FREQ)
 		i2c->i2c_clk = 0;
 
-	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
-					xiic_process, IRQF_ONESHOT,
-					pdev->name, i2c);
+	ret = devm_request_threaded_irq(dev, irq, NULL, xiic_process,
+					IRQF_ONESHOT, pdev->name, i2c);
 	if (ret)
 		return ret;
 
@@ -1527,21 +1527,21 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 
 static void xiic_i2c_remove(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct xiic_i2c *i2c = platform_get_drvdata(pdev);
 	int ret;
 
 	/* remove adapter & data */
 	i2c_del_adapter(&i2c->adap);
 
-	ret = pm_runtime_get_sync(i2c->dev);
-
+	ret = pm_runtime_get_sync(dev);
 	if (ret < 0)
-		dev_warn(&pdev->dev, "Failed to activate device for removal (%pe)\n",
+		dev_warn(dev, "Failed to activate device for removal (%pe)\n",
 			 ERR_PTR(ret));
 	else
 		xiic_deinit(i2c);
 
-	pm_runtime_put_sync(i2c->dev);
+	pm_runtime_put_sync(dev);
 }
 
 static const struct dev_pm_ops xiic_dev_pm_ops = {

-- 
2.52.0



