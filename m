Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B4BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 16:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l91BGgbqr7YyneeHqPAOt3f1WHw2iUoAMT+4Nm81h9s=; b=N1jYAuEbnKwP4dCPSc/YrQ9z2B
	yesga4BorpYKp6yIZzXtaDAMewYjkNpzeyxsDpqyk45iwHX5dKMQnk09eOcHUr5WtFeGhpJz5/7CD
	dP00uPzbmK4YGIk5u2cfbBEP6Nfdm4flleVRlV488mjFIN4qKYK+2Is9ZWSSj+LodKjPctXp4d9+6
	pVu2E1mYal0c/O4hn1K7F5UyReKe3zLWyJGUnTZexEEi3g9GyE+Ivsp0iPi6cpSFC6HjlAqutw8Si
	WdMcx3AE7n3iGxhlfhRMDzcuuN5ffLOfQmIXLdpfkZstpZ08+eAgy8yYkZVRS0yjAdz97+mac+Gs1
	Byy2dLMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyFM-00000002dXj-3g3I;
	Wed, 01 Jul 2026 16:57:12 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyFJ-00000002dT4-1OCX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 16:57:10 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6976BC4FECC
	for <linux-arm-kernel@lists.infradead.org>; Wed,  1 Jul 2026 16:57:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 64D5B5FD9D;
	Wed,  1 Jul 2026 16:57:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ACB51104C9688;
	Wed,  1 Jul 2026 18:57:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782925026; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=l91BGgbqr7YyneeHqPAOt3f1WHw2iUoAMT+4Nm81h9s=;
	b=cAFbRxejJpMXZsBshzeGIRoLjmy+unEt7AR8qJHZg0CVhgA8yhHCuRhdFVkbx+IShmwWft
	ax7U1QxXfDyz7eqdiZQyJLRnkxA8USrk7Ui005NTjxORWk7URhOraO2w9OgEFqlrHnzBOm
	KrEt2wGqTsm2ZYoTK1Wvv4iXdRsEiGqaB57cEnKIw4YyCFIiKGEQb9ouRsst8CNkRCHyE9
	XXTknQAHLmcuvLAz8Jkhz0AfMFzlcmFo8q3Yi5S0wvIGnmnEeIvmh1zOnxBksWLi+/Ec+j
	nlrnd299qv/ujrGUwtsBoNBtP09JaQA+t+CKjtIr/x/6zv6wUlYlaUKXp+doaA==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 01 Jul 2026 18:57:01 +0200
Subject: [PATCH 4/5] gpio: nomadik: use dev_err_probe()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260701-gpio-nomadik-silent-v1-4-644d10316cef@bootlin.com>
References: <20260701-gpio-nomadik-silent-v1-0-644d10316cef@bootlin.com>
In-Reply-To: <20260701-gpio-nomadik-silent-v1-0-644d10316cef@bootlin.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_095709_567124_1F3CCCB0 
X-CRM114-Status: GOOD (  11.68  )
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

gpio-nomadik depends on a few resources. In one case the reset is taking
time to show up leading to a boot log containing:

[    0.544230] nomadik-gpio 1400000.gpio: failed getting reset control: -EPROBE_DEFER

Fix by replacing all dev_err() calls that might be made at probe with
dev_err_probe().

On nomadik platforms, the nmk_gpio_populate_chip() log calls might
attach their reasons to the gpio or pinctrl device depending on boot
order.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/gpio/gpio-nomadik.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-nomadik.c b/drivers/gpio/gpio-nomadik.c
index eba095eeb3d6..1ee46f59d708 100644
--- a/drivers/gpio/gpio-nomadik.c
+++ b/drivers/gpio/gpio-nomadik.c
@@ -520,21 +520,22 @@ struct nmk_gpio_chip *nmk_gpio_populate_chip(struct fwnode_handle *fwnode,
 
 	gpio_dev = bus_find_device_by_fwnode(&platform_bus_type, fwnode);
 	if (!gpio_dev) {
-		dev_err(dev, "populate \"%pfwP\": device not found\n", fwnode);
-		return ERR_PTR(-ENODEV);
+		ret = -ENODEV;
+		dev_err_probe(dev, ret, "populate \"%pfwP\": device not found\n", fwnode);
+		return ERR_PTR(ret);
 	}
 	gpio_pdev = to_platform_device(gpio_dev);
 
 	if (device_property_read_u32(gpio_dev, "gpio-bank", &id)) {
-		dev_err(dev, "populate: gpio-bank property not found\n");
 		ret = -EINVAL;
+		dev_err_probe(dev, ret, "populate: gpio-bank property not found\n");
 		goto err_put_pdev;
 	}
 
 #ifdef CONFIG_PINCTRL_NOMADIK
 	if (id >= ARRAY_SIZE(nmk_gpio_chips)) {
-		dev_err(dev, "populate: invalid id: %u\n", id);
 		ret = -EINVAL;
+		dev_err_probe(dev, ret, "populate: invalid id: %u\n", id);
 		goto err_put_pdev;
 	}
 	/* Already populated? */
@@ -578,7 +579,7 @@ struct nmk_gpio_chip *nmk_gpio_populate_chip(struct fwnode_handle *fwnode,
 	clk = clk_get_optional(gpio_dev, NULL);
 	if (IS_ERR(clk)) {
 		ret = PTR_ERR(clk);
-		dev_err(dev, "failed getting clock: %d\n", ret);
+		dev_err_probe(dev, ret, "failed getting clock\n");
 		goto err_put_pdev;
 	}
 	clk_prepare(clk);
@@ -587,8 +588,8 @@ struct nmk_gpio_chip *nmk_gpio_populate_chip(struct fwnode_handle *fwnode,
 	/* NOTE: do not use devm_ here! */
 	reset = reset_control_get_optional_shared(gpio_dev, NULL);
 	if (IS_ERR(reset)) {
-		dev_err(dev, "failed getting reset control: %pe\n", reset);
 		ret = PTR_ERR(reset);
+		dev_err_probe(dev, ret, "failed getting reset control\n");
 		goto err_unprepare_clk;
 	}
 
@@ -599,7 +600,7 @@ struct nmk_gpio_chip *nmk_gpio_populate_chip(struct fwnode_handle *fwnode,
 	 */
 	ret = reset_control_deassert(reset);
 	if (ret) {
-		dev_err(dev, "failed reset deassert: %d\n", ret);
+		dev_err_probe(dev, ret, "failed reset deassert\n");
 		goto err_put_reset;
 	}
 
@@ -695,7 +696,7 @@ static int nmk_gpio_probe(struct platform_device *pdev)
 	ret = devm_request_irq(dev, irq, nmk_gpio_irq_handler, IRQF_SHARED,
 			       dev_name(dev), nmk_chip);
 	if (ret) {
-		dev_err(dev, "failed requesting IRQ\n");
+		dev_err_probe(dev, ret, "failed requesting IRQ\n");
 		return ret;
 	}
 

-- 
2.55.0


