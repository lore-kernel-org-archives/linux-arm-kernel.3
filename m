Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05429C5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 20:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r5Y6mvwj3GDfaz1b69DVL8jE0Eg17I3eO1sqFwFDyY0=; b=XSnPwq2xH6Wkk8Hx2eQscdxt97
	+Hqjjq5c0cWFZ4kGatwouR9UCIOlv9PUCtrAQDY1+ksj86p+7M0G1CosQlxIyH1KGeiW9QVFNF+Lq
	cwyXzp0ngca8xdnsSllJTBWxc40JrHHu2Bd7+44PjtYBvIvdxGSnmzIxTeSoZlUj3bjBexdQ4v92F
	92M5Qn5gIdzoM6VniW/q7zFgGGLswYys36Pm2bdL8/Sffg2Neid4+EGuVIC3pyJHIhsEq+q0s+WdZ
	2G5W3BZJ5pw5ozgN6jh4Sw56f/wR1BFrnOgualQmzed8+JnksX2uqV0SGhNUgHjMINsaNRt0Qp9on
	YeRlOELQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuywZ-00000003BGD-0eFS;
	Fri, 14 Aug 2026 20:55:59 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuywX-00000003BFn-03w9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 20:55:58 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-381b831d535so2303006a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 13:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786740956; x=1787345756; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r5Y6mvwj3GDfaz1b69DVL8jE0Eg17I3eO1sqFwFDyY0=;
        b=LDI82oQTh+t5DFNRu/SVwpYGP+uxUeIXt7aMJlnsA9H1OEd9oDbZ2IRk+PaUIIlRqH
         vC6l0qNTj44ObOjvMjZaf+/UBC6PYij8RdiqEqFAFrosNq+hXz3KUfCUkKmvZ2Jc+oLn
         3KB2eAln8yAnwTxLb5a1EafHOFCytNZovdoZ7WiBa9qevTXq1r59DefFKEAOroTdKzqT
         oIvYSrx2Mio5eFv5BV03raWm+xZ/lgwpr/eSRSR5eRppJ8/7hqzW8sRu0S13QFOlKaob
         PHcPzROIxp+anPpVSPBl+gNQ62HthavG0HJbVkK/ec1Mxldkr4LiwWoedxc3FPeQzEG7
         ktiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786740956; x=1787345756;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r5Y6mvwj3GDfaz1b69DVL8jE0Eg17I3eO1sqFwFDyY0=;
        b=CKR+fRaM1g8rcRLh3+DssW9AovdSHJkXpshiQ2nK45x6KpVGA+Vjb7C/z1PIfUPel2
         rBvTLsWHLe6BLWw+qRQFFTsszrIDaiuAQdY4/w2Opru8D+/OsoFKI7qHKUHHGV3UL5Vv
         SqOyr22Ob+YYp4OMisKRsjw3cmzrC0ObVc4XUIEro0peY4v1flnYrhBVhlkMbhVVyb/T
         Fe8X+rTxnzDAwWitX/WG5/j1+lcS32rQexsaHlb99UXdOj/IX0UWRZ8SsnUs709E/Ci2
         UOjSpRNhBn/HWHTLt7X05HAPIeyIVxqf4nlgF5MuscsLNT1wmzbqWA1wpcV2ZwxaY/Xh
         G4Og==
X-Forwarded-Encrypted: i=1; AHgh+RpVbx3S4PS3wGrucFgryiZgDDzodLqa83JIop8Dd2gc67OF4Uao8Z0hILwDQz+98h7soW7yvTqPHd8QQND6yDFj@lists.infradead.org
X-Gm-Message-State: AOJu0YyLndyQqfMXXr+u/UUtHVuh2j11t6uSko7jx4be04Uq32nY5/Yj
	ixAIivkdINBvTQIj1gFwvh339Pi4HPWy492L3HkQ5tyDON0F6aLS2EGx/P7QlQ==
X-Gm-Gg: AR+sD12rJnnC2cchWbausm15ErprsxghOoFlVVtG73l4AcFlik9sZtWqFg+bDOUcaUj
	028lSZzWzLET08WOl3xsjzOnHRuIZvqC33DnW7M4F8fd6hkxVWx5LpVjtEs5SA4twVOLTZSm9/A
	JQ6+BFm4EllYh3MsAV3Sya6XX8DtxxI9NBKcG4Rs/L6a57Jpr0WJJNw/0eFCpEce2a37akVHA+b
	fTDzcV+D2SFiZl32XpBlhDqypCUywLoi/rfq55a0Opt3+IuBuBkc1mkv/lP93MYh7Bv7P837BWW
	xvd1uQesotB1R/7k71ED/zdYoMtANIX0cJSMIm69hwsvcnN1f+DkGMQO3KA+oVbKE31RM9zGI9G
	lytQ7m4+O0EYs4M1xCy47apuHJT8ag7VUfc/4T0wa3mKUNEuS2+3H84euZHKPQLxDX1dScqjFQ3
	mi6BvCrvzie7pXaiMyFatYYve5GmPvUMGOwmZ9nh5uXFLtX/jCn/AvET6/4IwDMm4jxF/cRKihz
	cb9gbnSbyvOo5O7u2sv6jSticq+N3Yv6V4F6Zbt+KjcM9LSUK0EOCOObHfuezrbEcZNA3pQsiz6
	h3hqGkJYY2jkF+Uwd85bshWww9DewVaXAMtYxX2F9/tvRAJ6
X-Received: by 2002:a17:90b:4405:b0:381:792d:f993 with SMTP id 98e67ed59e1d1-3933b8c4cf1mr8467756a91.17.1786740956014;
        Fri, 14 Aug 2026 13:55:56 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394ea96c7fcsm4107294a91.3.2026.08.14.13.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 13:55:55 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-kernel@vger.kernel.org (open list:MAILBOX API),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC support)
Subject: [PATCHv2] mailbox: sun6i: modernize probe and convert to fully managed
Date: Fri, 14 Aug 2026 13:55:53 -0700
Message-ID: <20260814205553.39894-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_135557_061306_8190D15D 
X-CRM114-Status: GOOD (  17.93  )
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
 v2: fix compilation
 drivers/mailbox/sun6i-msgbox.c | 62 ++++++++++------------------------
 1 file changed, 18 insertions(+), 44 deletions(-)

diff --git a/drivers/mailbox/sun6i-msgbox.c b/drivers/mailbox/sun6i-msgbox.c
index 6ba6920f4645..3b838f6c837a 100644
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
@@ -211,24 +221,18 @@ static int sun6i_msgbox_probe(struct platform_device *pdev)
 	for (i = 0; i < NUM_CHANS; ++i)
 		chans[i].con_priv = mbox;
 
-	mbox->clk = devm_clk_get(dev, NULL);
+	mbox->clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(mbox->clk)) {
 		ret = PTR_ERR(mbox->clk);
 		dev_err(dev, "Failed to get clock: %d\n", ret);
 		return ret;
 	}
 
-	ret = clk_prepare_enable(mbox->clk);
-	if (ret) {
-		dev_err(dev, "Failed to enable clock: %d\n", ret);
-		return ret;
-	}
-
 	reset = devm_reset_control_get_exclusive(dev, NULL);
 	if (IS_ERR(reset)) {
 		ret = PTR_ERR(reset);
 		dev_err(dev, "Failed to get reset control: %d\n", ret);
-		goto err_disable_unprepare;
+		return ret;
 	}
 
 	/*
@@ -242,25 +246,17 @@ static int sun6i_msgbox_probe(struct platform_device *pdev)
 	ret = reset_control_deassert(reset);
 	if (ret) {
 		dev_err(dev, "Failed to deassert reset: %d\n", ret);
-		goto err_disable_unprepare;
+		return ret;
 	}
 
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
@@ -271,29 +267,8 @@ static int sun6i_msgbox_probe(struct platform_device *pdev)
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
@@ -308,7 +283,6 @@ static struct platform_driver sun6i_msgbox_driver = {
 		.of_match_table = sun6i_msgbox_of_match,
 	},
 	.probe = sun6i_msgbox_probe,
-	.remove = sun6i_msgbox_remove,
 };
 module_platform_driver(sun6i_msgbox_driver);
 
-- 
2.55.0


