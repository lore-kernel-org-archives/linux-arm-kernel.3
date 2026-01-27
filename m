Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E39FD2FED9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 21:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HqXACYQ0kaQ4xwVyquSuS4D0J5ZpbgE37/b0miQCmOA=; b=A6seeKi4+ZvMerA+m1QAaYcAaC
	5Zby2LXMkSeu6sT5pos+KiDX9T7MUdS5JhDBvkHV/j+8MYBwact4hE7Ozbcepi/ug0IyUXGh8XSQ6
	a+3jZJz3ky+ahWQdPBS3Wvu0jAZkwQ4GAJ+i9K2jeTa3N+gd+jRTWDj22O/l3wkbUWJe/O4OdS2j1
	X8+Hwm09OGANk2NNUJdLjBR/t00vX3yKKsFYkrs7xn/peDSjwxTYcfyiGMd28JkQQem/4SzhA2TzG
	pXPQZS7JFT71JgLqeK3pd90Sx0V5gRvWNTakgm4XZWu/W3bcbwAMbQMK2lXkuQxrka90tMpkHTBZQ
	CVXK61KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkqEd-0000000F2P4-2qAp;
	Tue, 27 Jan 2026 21:04:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkqEO-0000000F2MG-44Jy
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 27 Jan 2026 21:04:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=HqXACYQ0kaQ4xwVyquSuS4D0J5ZpbgE37/b0miQCmOA=; b=iCF6wyGjMU0Si1xW/72C+r36i7
	3CGl5mPkQYIJqrfKtrgBpdD7esfLlJt7CfTbw2ryFnXZY9Wiypy4znm/0BguHya1x8g5mq/qC+BMs
	OhAy0sXVNX5hxJKZApsTWHeK2y+bi0l+SC01RU7wD9VLsXV37dc++unzWqEotURPYx42YPl0USK1v
	iQnsi7af+AGNr08LwbkGWnHrgU2Tq9B7nPfekp6hdq9T9r8tHZscRQB8lBsNzVPwAvVwOYzFH3HwJ
	ZvayUjrjt3m1LqMtXUU3eO4VAFTyh92izy4j623VVXF7AtiEKQXtUcBHSzkB7lmlrueRD12t/76ge
	wYmx4Ysw==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkqEL-00000007cG9-3M2P
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 21:04:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2D37D44547;
	Tue, 27 Jan 2026 21:04:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0727AC2BCB3;
	Tue, 27 Jan 2026 21:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769547845;
	bh=0mC+GzegM3NUd5rZ8m6lJrPIK5v+NNpTjHvceYgA79I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=l/8NXCub5YbVJsI13yDNSioZhbp/JeIZiHAIsGfTkq7+QdSpe0oWiw0pJ3AZVA8J3
	 nXh0JJY1MzPeC67ppIlo1cCbe8fheKluFGLDTXa2bR5SiwK5JO9T6dKHMJ3vaPYXEm
	 jmp73NPUYY1VmhCM+3qfS1breJS5aUYioCmaFnL3OV0lq7vxefzaMyWro95kmO+QR4
	 ofomzSnNs4Wq1hQJdBzwKhhUvrzLuoPRsxEDDx6a6ut1INw2UztnhCF3+acveSks1W
	 myF3IHj7v4zp0T4n9Kt/znSc/x8g34eBM7nLetNfyWUQZi7VrSACqD1Q849XlBxSiD
	 odiy06O0ltudA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E956BD2FEDF;
	Tue, 27 Jan 2026 21:04:04 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Tue, 27 Jan 2026 21:03:59 +0000
Subject: [PATCH v6 5/7] i2c: xiic: switch to generic device property
 accessors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-i2c-xiic-v6-5-e82e2f6f657c@nexthop.ai>
References: <20260127-i2c-xiic-v6-0-e82e2f6f657c@nexthop.ai>
In-Reply-To: <20260127-i2c-xiic-v6-0-e82e2f6f657c@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, info@mocean-labs.com
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769547843; l=2930;
 i=abdurrahman@nexthop.ai; s=20260119; h=from:subject:message-id;
 bh=8LQGUBdxo4/y/3bZnRryJsF+5KUiwALWt7Kxrp3rDYo=;
 b=XBa7Y31qCX7MFBy9/EyxDvq+kUlW7UNEvsZ8Med6ED00xLT7N2SVnYOlLYJMjCIUY12ZUI7vU
 /PX9jssSgdXDmpAIk05nBUKIqMj6jmesKN23jag5CNyWaNI0RicDMdZ
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=S+ysnf+NwMcBdHBlyKIUEAtaFGSIhQwcJcgcXhq0osg=
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/20260119 with
 auth_id=608
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_210410_331676_1091086C 
X-CRM114-Status: GOOD (  14.13  )
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
index 95242d39f554..73fc8f8cb5d4 100644
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
 
-	match = of_match_node(xiic_of_match, pdev->dev.of_node);
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
 	i2c->adap.dev.parent = &pdev->dev;
-	i2c->adap.dev.of_node = pdev->dev.of_node;
+	device_set_node(&i2c->adap.dev, dev_fwnode(dev));
 	snprintf(i2c->adap.name, sizeof(i2c->adap.name),
 		 DRIVER_NAME " %s", pdev->name);
 
@@ -1482,8 +1476,7 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 
 	/* SCL frequency configuration */
 	i2c->input_clk = clk_get_rate(i2c->clk);
-	ret = of_property_read_u32(pdev->dev.of_node, "clock-frequency",
-				   &i2c->i2c_clk);
+	ret = device_property_read_u32(dev, "clock-frequency", &i2c->i2c_clk);
 	/* If clock-frequency not specified in DT, do not configure in SW */
 	if (ret || i2c->i2c_clk > I2C_MAX_FAST_MODE_PLUS_FREQ)
 		i2c->i2c_clk = 0;
@@ -1494,8 +1487,7 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	i2c->singlemaster =
-		of_property_read_bool(pdev->dev.of_node, "single-master");
+	i2c->singlemaster = device_property_read_bool(dev, "single-master");
 
 	/*
 	 * Detect endianness

-- 
2.52.0



