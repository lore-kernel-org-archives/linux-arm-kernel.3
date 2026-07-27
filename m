Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1381FC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 19:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ikqwbkqF0vWWk5NitpyxsfTFJUUcd2sIYvu6B+uZKIw=; b=X7+0MLSTs2JuU3Ng4Dem6yN/TN
	qchNJQmS0RpE2o3WKC/dPOCqklMBcsL55IMkGWaUfLOO4d2GfvlN3Ura644j3Ezi9gZqkZ5b5uc+5
	CBp9qbGEJC721fNlc/tvAGtDEMU0re7YhO7ZcOeqggXGnzqStDKHoxF+ZlUa+fv/wAsVO4AiwkPYl
	McgHYX/sZjJ4CFizD5CEvgh3xKICuMKU/80Q8UrWBZ1br6eJdTaCbu5UvrSoJcg9bISl+SBMALyMn
	CDVAeWWfczT3anJaJ0P9r0FIar52u4rJndc41GBKNy22ata1ZuagwemVc5+IrFoqucghJRWfJxJU6
	yKicxVzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRDL-00000003lz5-1yQz;
	Mon, 27 Jul 2026 19:42:15 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRDJ-00000003lyi-19kY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 19:42:14 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-92e6c4a867cso181924585a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 12:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785181332; x=1785786132; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ikqwbkqF0vWWk5NitpyxsfTFJUUcd2sIYvu6B+uZKIw=;
        b=BoLVlhWF4+tOufiugTGmzPl+nvVvMBxXn2iCZXY7XWXyw0sE0DlZflyJP+oXBSQIKV
         RCurmzlAf9bk7j0DXW+97UiNvOMNmrEeBkpTY3bPVF0WYqOs70KeihLwP6QdVcrqg1hh
         KGrfMI0OjZo3LUNoELjFJ/seuaS8vRXxvX4vIwqlWZ9zpDbmkx6o42wLJG74I6OsldoI
         V9Qh5phqkboRxf6ae8CNley/NxG5NF3WUdR8S7XgVJh2dGoNiFm9R64LGcwx5Io6jlRv
         fkZkZLaHcZb2RTDNncKMM5Tpa1Ak50DGI9libTX4q2wuQOF4201+N/CflTXY/ZDTxvRQ
         3vAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785181332; x=1785786132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ikqwbkqF0vWWk5NitpyxsfTFJUUcd2sIYvu6B+uZKIw=;
        b=IOI5i/+LS5wgEsDguvw/rGiDok8/9a+Zg+V6XJ+T3qGPXpV3geFnitqxp+Bf4/iOUQ
         WkdZb3LF65DlI13LtcLBX6wjFiYxnBb5PmckPYobVe6Z/lfr1NoRn9cK6rKgXuQCVXFe
         BTmHaV7d6FbDCVnPL+GQwK7sXF1/Y5urjw3p7FDoVsqK5qNsJWzt5o958xWAh3cWUttB
         yWqHpoKY23T+dIMIWtOd/Py8l80w4Up5zyzz7io9X6+gJnLJ+yTWGJhg+55hGGXtiK4H
         aIj8k/BZmphlzixC26BCXQ3trkUwT4Q7J6L05qYaACZe0/ctizJ2y7vuafaWsrTCiS8/
         HaJw==
X-Forwarded-Encrypted: i=1; AHgh+RqGpMbtI1gr5gChc9j7wf1K/hBD1R6UF8qWvsIZFM754Zj7EaOUn+tCXlHNzJY91RwXJqrv10ZJfxjvupCY0aP7@lists.infradead.org
X-Gm-Message-State: AOJu0YyvzELSKykXBc7bfsBQgylP3N4Au9Q3O2rHrlYunDwIxJB4MZT7
	3IQmMZIWCyspdl7Pu8Gcaej6dZVMOzSDlHNE4G854m5I0g1nI6J3tAiy
X-Gm-Gg: AR+sD13LICG1PEGm3RtNdvz/HeXy2A5r8C3B+hj3+kblFiEfRZGTGoS84eC6Rgx2JkX
	nA1DQV6ycTlciDTr1bXdyqjaZ6IQL94AyvFd8D7r3J/74HOTujqRskkjZH9gBejQsGeLqmrHwY9
	ng54KoUGBUpceKZHa3JSxXu7+CWyGuJms1vOFKdJ1IabtfxrcJFBL9JSag6oVrdwMSoKFAFfGc1
	wFGZwt/9WJ8/5rfur4i8C56KZevkZ5N2B4jravUC7glqxHJH39AjNyVG49aJjIa1QUjixYdD1sO
	Ryayz0MlzcnOq6we8iHD53dSssCFryse/0BPI6GA43X+12idkbJpFu5qHGxmz5Z7A3fFyTkJ0DJ
	+keVfiFTkaUdAZJMFmnJZ1PC4FpmluT/lylkW2x8AAJ6126yePq1q1I7YXP+2Bzka1vmNaVbjC2
	9hd7LpsmhQHHTY16triJ+ykQw5OY+4qQMQFWM1UpiKsFiTTN4rB0QcsFa0qc8CEM8dqz9HcgF8o
	f3hHHajwZQHrrM/A2v3SZqsSSMsFIgTA7vjvS6DMoJ3itmZRPHVo0c=
X-Received: by 2002:a05:620a:a197:20b0:92e:6dc0:7b13 with SMTP id af79cd13be357-932df6ea2cemr755870585a.53.1785181331671;
        Mon, 27 Jul 2026 12:42:11 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-932de66b2b4sm681276485a.41.2026.07.27.12.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 12:42:11 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-kernel@vger.kernel.org (open list:MAILBOX API),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC support)
Subject: [PATCH] mailbox: sun6i: modernize probe and convert to fully managed
Date: Mon, 27 Jul 2026 12:42:08 -0700
Message-ID: <20260727194208.10082-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_124213_355737_CAE4E162 
X-CRM114-Status: GOOD (  18.13  )
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

Assisted-by: Opencode:Big-Pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/mailbox/sun6i-msgbox.c | 62 ++++++++++------------------------
 1 file changed, 18 insertions(+), 44 deletions(-)

diff --git a/drivers/mailbox/sun6i-msgbox.c b/drivers/mailbox/sun6i-msgbox.c
index 6ba6920f4645..28d8636afad2 100644
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
+	return devm_mbox_controller_register(&mbox->controller);
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


