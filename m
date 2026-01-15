Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D26AD3CC92
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 00:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=roN4NcJtuzGWonO7OQ8fdkqgHT0peC+VlYJ/zBMgNDM=; b=T278/C80Gj3+BrJ/32fdKU9jrv
	dn62FTp28YF90zU4i1aNc8ruDqlsN04KcQCjtKdBazhFYDCkTHiX5z8YQB5Uinwm0RPq408RpH9UE
	4QzhDJGoRxuX/2OJleLhen6RWPE5eb/XHnaoo5FXJenCYrZcrcNdUBRIuVTV7lz3mZCkRHpDLfK8Z
	knJVZ9Oy5k0QW/ymVocV+dvwpNMEPbnp09pJD3UCffvgusXolXDIwXlB9V6AyljCK/L2RcCHU00Fn
	zG3Wmyx2HSCzcavqYs1pTeeCga8YpIFCkGQfcvH6tZVqbMeatronw2Y+GeZ60yd1ke3UxIZSYq7tN
	Anm7XfSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgBEf-0000000BEAu-2V2T;
	Thu, 15 Jan 2026 00:29:13 +0000
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgBEa-0000000BEA9-1SSa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 00:29:11 +0000
Received: by mail-dl1-x1234.google.com with SMTP id a92af1059eb24-11f1fb91996so842496c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 16:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1768436947; x=1769041747; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=roN4NcJtuzGWonO7OQ8fdkqgHT0peC+VlYJ/zBMgNDM=;
        b=TYYLeVXbAOTwt2VyhdRjhRHeTMVbIfLMJMsqDCe1wDz8jScd4xoaMDhs2In168Ppyn
         oAOdaLZxNfO5M564BUYklRrkLPtcBhggKdARrCWnpkJrexIlqPl8HSST5ZrGv9GWcd6C
         VhNvhMEIjpN2qps40iOYVw9O4W/XgKkplb0+sxD23qwxEqB0MaPTIiww1HCKTo5uSgG9
         31S/fpD52tygVCsSonu9ozpY59kuJ2t9trpb4ZBzM9WW4jedoYAhTLu1nZ3DHIYH2ATU
         LZh0vOiL/4bRr6y5u/237FwL153qj/xFAVOP+b4ivlLk6VldrlG4x+mWf9XqjaumchtF
         Id4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768436947; x=1769041747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=roN4NcJtuzGWonO7OQ8fdkqgHT0peC+VlYJ/zBMgNDM=;
        b=Zl35TLrMgOFjgADSSpymF35duvCB+kGu5jJbCf4yOhq1nyGF4ENBHam3RWx3TaCMPD
         XdCcF3rps2rGeTeqmD1K/jjVnyFx3mLjt9STHmBbr/qlllFDZcOPjh6AGsB7d6X5peqq
         ae1JfA5d0rlXmxqA4ZsFeEK++GORM12i9HmdeZhAmBz0p1tYtNrnkLlK+TT8aIbVZ76P
         wy69xNNvMCEczWWBZe0MSsn+cLVAlVOlk4OA822uNBsWZxnPrXGObmOV5QPhjAVm7Wb3
         WYWgy2XD8ZtujcxZL4JUmdU1O6PnOk2WBL2+E007NU73vwf0hep6ZsIwAV4cXyJVJPCX
         n0zQ==
X-Gm-Message-State: AOJu0Yx79YhUJ2pXtHP1iUt1yMKwv8SvVZQFmmajQZPFuWHUxZNDzj4M
	0D+NJ08ywx2tcahUtJD/3ucWsUFLSFMWgHazmxTPS5E94ISsnpvvkxV1Y6AbvmKxJWg=
X-Gm-Gg: AY/fxX52ZZgYaW5mhBPMRVNEy7SW1oPvX0J85JhDa5XPJ3fCTdKbIRNFg950NHwNY7M
	mQE2Vj3kHCWr8iwrir9gF61rMHg1E9A3rcN5FgnS/gC1g23UB2HTBX4vol7mCc/BRZMao25PjK+
	Qc++poiWweJnpYfpC7Oim9nZjwFukOHcTzLK5xqLuP5E2b1GnrFBR4PN3juPmgLdItgSr7Hkv+H
	cbJL5tNheVIQdCLr9R+KkICVa4G2CRR8qtsJewQAHunAbucGovr5ESaLQ1nzWY0iiI4iMfsNr1v
	O2MUWRaSRiMZjXN3sb98z3b1XLgwN0w77UtwmH1TSQyxQj5IF4BN9pTPEka7pVu1MghXqkxQST2
	4/G2AfUWhO4J6sDEvLWFN2u3yyzPg1ebXZ1D5ppjL14uQmfY57S5gpso3luz1+goehBxo4xmYSs
	keZ1IloHspCiS1u7o5zkPK/w==
X-Received: by 2002:a05:7022:660a:b0:11b:ceee:b78a with SMTP id a92af1059eb24-12336a64fcdmr4929101c88.19.1768436946763;
        Wed, 14 Jan 2026 16:29:06 -0800 (PST)
Received: from localhost ([50.145.100.178])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12331d95110sm4462526c88.8.2026.01.14.16.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 16:29:06 -0800 (PST)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: [PATCH] i2c: xiic: add ACPI support
Date: Thu, 15 Jan 2026 00:28:46 +0000
Message-ID: <20260115002846.25389-1-abdurrahman@nexthop.ai>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_162908_393986_B3B716EC 
X-CRM114-Status: GOOD (  13.29  )
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

Use generic device property accessors.
Make the clock optional assuming it's managed by firmware.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/i2c/busses/i2c-xiic.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 28015d77599d..ee4731570977 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1408,7 +1408,6 @@ static const struct i2c_adapter xiic_adapter = {
 	.algo = &xiic_algorithm,
 };
 
-#if defined(CONFIG_OF)
 static const struct xiic_version_data xiic_2_00 = {
 	.quirks = DYNAMIC_MODE_READ_BROKEN_BIT,
 };
@@ -1419,13 +1418,12 @@ static const struct of_device_id xiic_of_match[] = {
 	{},
 };
 MODULE_DEVICE_TABLE(of, xiic_of_match);
-#endif
 
 static int xiic_i2c_probe(struct platform_device *pdev)
 {
 	struct xiic_i2c *i2c;
 	struct xiic_i2c_platform_data *pdata;
-	const struct of_device_id *match;
+	const struct xiic_version_data *data;
 	struct resource *res;
 	int ret, irq;
 	u8 i;
@@ -1435,12 +1433,9 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	if (!i2c)
 		return -ENOMEM;
 
-	match = of_match_node(xiic_of_match, pdev->dev.of_node);
-	if (match && match->data) {
-		const struct xiic_version_data *data = match->data;
-
+	data = device_get_match_data(&pdev->dev);
+	if (data)
 		i2c->quirks = data->quirks;
-	}
 
 	i2c->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(i2c->base))
@@ -1458,13 +1453,14 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	i2c_set_adapdata(&i2c->adap, i2c);
 	i2c->adap.dev.parent = &pdev->dev;
 	i2c->adap.dev.of_node = pdev->dev.of_node;
+	ACPI_COMPANION_SET(&i2c->adap.dev, ACPI_COMPANION(&pdev->dev));
 	snprintf(i2c->adap.name, sizeof(i2c->adap.name),
 		 DRIVER_NAME " %s", pdev->name);
 
 	mutex_init(&i2c->lock);
 	spin_lock_init(&i2c->atomic_lock);
 
-	i2c->clk = devm_clk_get_enabled(&pdev->dev, NULL);
+	i2c->clk = devm_clk_get_optional_enabled(&pdev->dev, NULL);
 	if (IS_ERR(i2c->clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(i2c->clk),
 				     "failed to enable input clock.\n");
@@ -1477,8 +1473,8 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 
 	/* SCL frequency configuration */
 	i2c->input_clk = clk_get_rate(i2c->clk);
-	ret = of_property_read_u32(pdev->dev.of_node, "clock-frequency",
-				   &i2c->i2c_clk);
+	ret = device_property_read_u32(&pdev->dev, "clock-frequency",
+				       &i2c->i2c_clk);
 	/* If clock-frequency not specified in DT, do not configure in SW */
 	if (ret || i2c->i2c_clk > I2C_MAX_FAST_MODE_PLUS_FREQ)
 		i2c->i2c_clk = 0;
@@ -1493,7 +1489,7 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	}
 
 	i2c->singlemaster =
-		of_property_read_bool(pdev->dev.of_node, "single-master");
+		device_property_read_bool(&pdev->dev, "single-master");
 
 	/*
 	 * Detect endianness
-- 
2.52.0


