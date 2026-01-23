Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D99EFD77881
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 16:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5G6lBfFahybJb9AH4IMZkKC8AkbCxQ8UJcYUcDqpRQI=; b=1SIECEElSOCmjDOMLUdCfdgfaD
	khQVmmJdALjfbO1u7/DNS4QtzUCZR7JRHK5kBgJDAhHz0tTc0eiN3RT7rZ7ILFXc4CWtm5leHVipH
	Uf0HRQMcI1K4HHn1klFP49woo+Du/xihj9zv7SLLlXQ8Ew6sTJrEUZ1gzBn0iabNf9zZ5cp2vrIAD
	lj2+UoQzPsW9/Ldb8Sp1aMCQ/E6JKJybzppktYGxTrhsPlmNaFUzHcYdCnTWJ17TBoctc0GdCoztt
	jtsM+iA05dYwnxTvXBoufJhiIq7yeSO/FRLAwYHXWy35WhP5f5Gu8RWgyr0znxiWMV9OPWR8shpEE
	zAlByzqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjK7E-00000009Cyj-2Dko;
	Fri, 23 Jan 2026 16:34:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjK70-00000009Crb-1YdQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 16:34:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 43DE743EF0;
	Fri, 23 Jan 2026 16:34:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0DCF4C2BC87;
	Fri, 23 Jan 2026 16:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769186057;
	bh=apN1b+EezFacC+qjuAQtj456Ag24dmmsc1OGhTskqs8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LaJ3WvO4tZ8UGQlTgvarZvYPJ1MAMSsfOJDcv8YPnp5cp9JqfJEWpzNVqcAG5XJEY
	 tH4SEXxeosYptq75HKkEMWDVrVWRwPWxjQWQYUaB6047vXvBrMZ0TmrNmhpO0ZKmlq
	 u7Ycaz17nGaLTI2D7C6936kqxINuGwU7wMgPN56sgs1XWnlSBxxUVQEYgQvR0ndia7
	 zy2XC0EkSCEsuUTF/8vwrTQcDByIBpFUfbzyXROwtbEMf06G7An97My4CPsteGG5Sh
	 U51UplPwrL/AaTMVIBM86mle+BT6LQfcisA22zkTrCyp8DNfJERJyUY7nlNwJ+UVVX
	 fsO3VX2qZY/qg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07076D7237B;
	Fri, 23 Jan 2026 16:34:17 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Fri, 23 Jan 2026 16:34:18 +0000
Subject: [PATCH v4 5/5] i2c: xiic: switch to generic device property
 accessors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-i2c-xiic-v4-5-4a3eba3510ce@nexthop.ai>
References: <20260123-i2c-xiic-v4-0-4a3eba3510ce@nexthop.ai>
In-Reply-To: <20260123-i2c-xiic-v4-0-4a3eba3510ce@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769186056; l=2907;
 i=abdurrahman@nexthop.ai; s=20260119; h=from:subject:message-id;
 bh=6N04KTIpIe9uMfd715SAHiqS6vRoJRqDBiumzlWnGDQ=;
 b=4oaNZy9uKbS3W4B/M27EwmlJ72yO2kLyR11GzJ+HcTLfSnqDmLfkC3V3I3rjq+VDwaJfDyZdX
 yGONqpiyZ47BSer8eLYvHi3AuVhJGMY9JK9bLYci/teeuapVcnn+Zz9
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=S+ysnf+NwMcBdHBlyKIUEAtaFGSIhQwcJcgcXhq0osg=
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/20260119 with
 auth_id=608
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_083418_480325_C31BCEB2 
X-CRM114-Status: GOOD (  13.48  )
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

Use generic device property accessors.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/i2c/busses/i2c-xiic.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 800a27413978..dfb8fa2787b2 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -27,7 +27,6 @@
 #include <linux/platform_data/i2c-xiic.h>
 #include <linux/io.h>
 #include <linux/slab.h>
-#include <linux/of.h>
 #include <linux/clk.h>
 #include <linux/pm_runtime.h>
 #include <linux/iopoll.h>
@@ -1408,7 +1407,6 @@ static const struct i2c_adapter xiic_adapter = {
 	.algo = &xiic_algorithm,
 };
 
-#if defined(CONFIG_OF)
 static const struct xiic_version_data xiic_2_00 = {
 	.quirks = DYNAMIC_MODE_READ_BROKEN_BIT,
 };
@@ -1419,14 +1417,13 @@ static const struct of_device_id xiic_of_match[] = {
 	{},
 };
 MODULE_DEVICE_TABLE(of, xiic_of_match);
-#endif
 
 static int xiic_i2c_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct xiic_i2c *i2c;
 	struct xiic_i2c_platform_data *pdata;
-	const struct of_device_id *match;
+	const struct xiic_version_data *data;
 	struct resource *res;
 	int ret, irq;
 	u8 i;
@@ -1436,12 +1433,9 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	if (!i2c)
 		return -ENOMEM;
 
-	match = of_match_node(xiic_of_match, dev->of_node);
-	if (match && match->data) {
-		const struct xiic_version_data *data = match->data;
-
+	data = device_get_match_data(dev);
+	if (data)
 		i2c->quirks = data->quirks;
-	}
 
 	i2c->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(i2c->base))
@@ -1458,7 +1452,7 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	i2c->adap = xiic_adapter;
 	i2c_set_adapdata(&i2c->adap, i2c);
 	i2c->adap.dev.parent = dev;
-	i2c->adap.dev.of_node = dev->of_node;
+	device_set_node(&i2c->adap.dev, dev_fwnode(dev));
 	snprintf(i2c->adap.name, sizeof(i2c->adap.name),
 		 DRIVER_NAME " %s", pdev->name);
 
@@ -1482,8 +1476,7 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 
 	/* SCL frequency configuration */
 	i2c->input_clk = clk_get_rate(i2c->clk);
-	ret = of_property_read_u32(dev->of_node, "clock-frequency",
-				   &i2c->i2c_clk);
+	ret = device_property_read_u32(dev, "clock-frequency", &i2c->i2c_clk);
 	/* If clock-frequency not specified in DT, do not configure in SW */
 	if (ret || i2c->i2c_clk > I2C_MAX_FAST_MODE_PLUS_FREQ)
 		i2c->i2c_clk = 0;
@@ -1494,8 +1487,7 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	i2c->singlemaster =
-		of_property_read_bool(dev->of_node, "single-master");
+	i2c->singlemaster = device_property_read_bool(dev, "single-master");
 
 	/*
 	 * Detect endianness

-- 
2.52.0



