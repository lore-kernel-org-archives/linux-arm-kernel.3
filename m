Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899AFC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Aug 2026 04:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HQ9qMQKQa63apilSf8yoPY9mOe/vuD05hJ9auBWKPfI=; b=e8R3jklT+7W6lYbaoIMbCaCmku
	WjTKG18tAYhLIR3zQBWpiXaqZnwnY1JLqoSkH45J+lrUJo9tMcaWGohQbrkexbXk0nDQXZ1yuWJBU
	VVgX+tgYLloVEY2VKk/dnAKibJby9+B3zi9mW+no2umn1HSaEHOaNpHGHpyPb2px/FCKqiMl2NXZ+
	N/EdmPX43cIY3aAz11tFHb8QjbTaheb6FWg4o4m1mq5KGHFakk1ESWp1aZhwzjP8Kd4wGT0TfTg91
	2WEkecosPo5lEaZdGwORG/38pGXxULiYBGyV9ED773XyNZ39Chu2X1jXHJMNFu5KADNPWnWFCvngl
	yDkmJA2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy0Et-0000000F4Yb-0h62;
	Sun, 23 Aug 2026 04:55:23 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy0Eq-0000000F4YF-0QTF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Aug 2026 04:55:21 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-cbeea240819so1373056a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Aug 2026 21:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787460919; x=1788065719; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HQ9qMQKQa63apilSf8yoPY9mOe/vuD05hJ9auBWKPfI=;
        b=fVKtM3WLM1Ai41nnZMKLEtpQPYdacnQS2KHvMT+T3eTRv2Vqdi+vKruZ5DRmdKxG5+
         spPC58u7qNx7kdWjx/PDcYL6mUD0DENiV8tMZQeLAWEAkxSwd0mOJvoI4ncKaWWfvTE5
         h1FhmXj3geViBxMDDv8YPIAECF7gpyGyrFhPY5kJG2qE63p8+2NLFf/13JJKrruN8R2b
         N3fZcvctTUJtVlfBWk0yFSWL/HfghvqxJXetSBFLN1AaRGaGv43wDQXqcUS5QZ0Wx96S
         nZoZBzQPAOgufU9sgv2LdtMEmvx4VqEy2hVjnUIgEeeVFBidyB+9Ik9cBobEXoA2faIH
         6w5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787460919; x=1788065719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HQ9qMQKQa63apilSf8yoPY9mOe/vuD05hJ9auBWKPfI=;
        b=rtpg1pN6gD4JvWbSTC8HtmdOTSyNFfhMkXUeDwrFhWkLL2BsXb3BwH94d7ZSZEA+x6
         ArpiROcYnFgsINXCLNo2Or0atxZ5CRmFwq+ZnfWBFukvfU4TYUwBEcNYgS4tZr8jt8r4
         pER664pDr/Eyunb+nx0cuECPRWnA8yW29GjG/9KdtNxHp08tiTGGmctE2I59gdqH7Q8o
         c65rZ86eIyP3T+lIV9c3RSSye9mNYyl6j0N6JgxI/51FZmamtCBMX0/txS+zBIXxpNnq
         kvtoIOC/EvCvAMeH8lD3Jt0IS0w9GdyPOuATj0DhfViuxWtgM3vJQ1vjbWbcF7g6gqGp
         45Nw==
X-Forwarded-Encrypted: i=1; AHgh+RqoGqp8D+zn9BQZekOGzCVjcByF7giEG9mgYZcq5ucwUY0uVCkwZa/oCWMTrols8uusez7z3N8n0q4Tb6s+ujMF@lists.infradead.org
X-Gm-Message-State: AFuF++kSQnQQutv4i5a5pyijuwsf5CTsVomwgLOcl9MVDphZ7EsqwwIe
	bboaE5q5XuvqyrywAqueiti1fododYjdP7HZKABvnkXvPIvaDlGkWQo5
X-Gm-Gg: AR+sD13eQ4t3uXpOtnR/+KDhcKpNRsP2TEhl33mKviFV59SImUWaKaJNwNoelFB/d5n
	o8F7mr999UJO3/KlDksUytoVR8NhJSsr7NjKBb2BKAAFB5K1YWK0ugmsO+BWKa7F0N1WK/QT3xK
	5KPv2reuPcaZjHWwdnP9/rqoc4g55h+TFxpIwpvu96pGtKnyfvOO5OwDu0hc1NZOl6c0nkNktLC
	g33CAMOMFVKmz02suW56UypMjBB/EiY3eyX27CQX4tgNxT80m3VF949E/BXrfz8vqu+Aw9vyVVT
	lCWy0CcxQfku32VkMUT89UihnmLWAysWZ8loj+nT3LzZL9YCwEvO/GyN/ZvM0HtoZukM8Jijur3
	fJ91/8iasWCA/XpWvfQGcIAZcj8i8NxV8s+d5m9KK8tacFbcDxQ9JDNyTh7eDazd7SVm/4l3/U8
	GSCCPlIWBClRMBzwiM9jn2QhYe3Gaz8MX2WDzSZ5eZpBOl8s6Y8QqG+P6O2G+qbQK12ooCwvm53
	qpY4FBmZ+VJf151bqDRM0GvgtgX0dqX7GlJZbzMvqx86Aw8czf1N3SkLwLBxbA7MGJKNJ1wXvmX
	H0QUrs0yMoeUV6P6naCVPBUSV9Wla7rqsIrcNw==
X-Received: by 2002:a05:6300:278a:20b0:3cd:51ff:1b14 with SMTP id adf61e73a8af0-3cd51ff1dd5mr7969272637.4.1787460919067;
        Sat, 22 Aug 2026 21:55:19 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc199e4b1e1sm120957a12.21.2026.08.22.21.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 21:55:17 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-kernel@vger.kernel.org (open list:MAILBOX API),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC support)
Subject: [PATCHv3] mailbox: sun6i: modernize probe and convert to fully managed
Date: Sat, 22 Aug 2026 21:55:15 -0700
Message-ID: <20260823045515.15315-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_215520_151713_5CBB047A 
X-CRM114-Status: GOOD (  17.88  )
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

Replace irq_of_parse_and_map() with platform_get_irq() and move both
IRQ and MMIO resource acquisition to the top of probe, before any
allocations, for early error exit.

Switch from devm_clk_get() + clk_prepare_enable() to
devm_clk_get_enabled(), which combines both operations and registers
devres callbacks for automatic disable/unprepare on unbind. This
eliminates the manual err_disable_unprepare error path and the
remove callback entirely.

Use devm_mbox_controller_register() for devres-managed controller
registration, and drop the remove callback and platform_set_drvdata()
which are no longer needed.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: use dev_err_probe
 v2: fix compilation
 drivers/mailbox/sun6i-msgbox.c | 78 ++++++++++------------------------
 1 file changed, 22 insertions(+), 56 deletions(-)

diff --git a/drivers/mailbox/sun6i-msgbox.c b/drivers/mailbox/sun6i-msgbox.c
index 6ba6920f4645..da68bad1d916 100644
--- a/drivers/mailbox/sun6i-msgbox.c
+++ b/drivers/mailbox/sun6i-msgbox.c
@@ -198,7 +198,17 @@ static int sun6i_msgbox_probe(struct platform_device *pdev)
 	struct mbox_chan *chans;
 	struct reset_control *reset;
 	struct sun6i_msgbox *mbox;
+	void __iomem *regs;
 	int i, ret;
+	int irq;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
 
 	mbox = devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
 	if (!mbox)
@@ -211,25 +221,13 @@ static int sun6i_msgbox_probe(struct platform_device *pdev)
 	for (i = 0; i < NUM_CHANS; ++i)
 		chans[i].con_priv = mbox;
 
-	mbox->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(mbox->clk)) {
-		ret = PTR_ERR(mbox->clk);
-		dev_err(dev, "Failed to get clock: %d\n", ret);
-		return ret;
-	}
-
-	ret = clk_prepare_enable(mbox->clk);
-	if (ret) {
-		dev_err(dev, "Failed to enable clock: %d\n", ret);
-		return ret;
-	}
+	mbox->clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(mbox->clk))
+		return dev_err_probe(dev, PTR_ERR(mbox->clk), "Failed to get clock\n");
 
 	reset = devm_reset_control_get_exclusive(dev, NULL);
-	if (IS_ERR(reset)) {
-		ret = PTR_ERR(reset);
-		dev_err(dev, "Failed to get reset control: %d\n", ret);
-		goto err_disable_unprepare;
-	}
+	if (IS_ERR(reset))
+		return dev_err_probe(dev, PTR_ERR(reset), "Failed to get reset control\n");
 
 	/*
 	 * NOTE: We rely on platform firmware to preconfigure the channel
@@ -240,27 +238,17 @@ static int sun6i_msgbox_probe(struct platform_device *pdev)
 	 * when removing the device.
 	 */
 	ret = reset_control_deassert(reset);
-	if (ret) {
-		dev_err(dev, "Failed to deassert reset: %d\n", ret);
-		goto err_disable_unprepare;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to deassert reset\n");
 
-	mbox->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(mbox->regs)) {
-		ret = PTR_ERR(mbox->regs);
-		dev_err(dev, "Failed to map MMIO resource: %d\n", ret);
-		goto err_disable_unprepare;
-	}
+	mbox->regs = regs;
 
 	/* Disable all IRQs for this end of the msgbox. */
 	writel(0, mbox->regs + LOCAL_IRQ_EN_REG);
 
-	ret = devm_request_irq(dev, irq_of_parse_and_map(dev->of_node, 0),
-			       sun6i_msgbox_irq, 0, dev_name(dev), mbox);
-	if (ret) {
-		dev_err(dev, "Failed to register IRQ handler: %d\n", ret);
-		goto err_disable_unprepare;
-	}
+	ret = devm_request_irq(dev, irq, sun6i_msgbox_irq, 0, dev_name(dev), mbox);
+	if (ret)
+		return ret;
 
 	mbox->controller.dev           = dev;
 	mbox->controller.ops           = &sun6i_msgbox_chan_ops;
@@ -271,29 +259,8 @@ static int sun6i_msgbox_probe(struct platform_device *pdev)
 	mbox->controller.txpoll_period = 5;
 
 	spin_lock_init(&mbox->lock);
-	platform_set_drvdata(pdev, mbox);
-
-	ret = mbox_controller_register(&mbox->controller);
-	if (ret) {
-		dev_err(dev, "Failed to register controller: %d\n", ret);
-		goto err_disable_unprepare;
-	}
-
-	return 0;
-
-err_disable_unprepare:
-	clk_disable_unprepare(mbox->clk);
-
-	return ret;
-}
-
-static void sun6i_msgbox_remove(struct platform_device *pdev)
-{
-	struct sun6i_msgbox *mbox = platform_get_drvdata(pdev);
 
-	mbox_controller_unregister(&mbox->controller);
-	/* See the comment in sun6i_msgbox_probe about the reset line. */
-	clk_disable_unprepare(mbox->clk);
+	return devm_mbox_controller_register(dev, &mbox->controller);
 }
 
 static const struct of_device_id sun6i_msgbox_of_match[] = {
@@ -308,7 +275,6 @@ static struct platform_driver sun6i_msgbox_driver = {
 		.of_match_table = sun6i_msgbox_of_match,
 	},
 	.probe = sun6i_msgbox_probe,
-	.remove = sun6i_msgbox_remove,
 };
 module_platform_driver(sun6i_msgbox_driver);
 
-- 
2.55.0


