Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0934C5DF8F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 07:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9Y/Hk1ij4iIeeDeCgZ2taRMrjGJza1klMebG4Wvu7x0=; b=cCLNkG8HV4MeNldBJHKZ876IhG
	Dyezyfi3eEXbtNkctduJdl6cSB8h/oIby4oaPz21EBdkgV/pLOg+3Z6Yb6ec8hjLT4KH4lDKHmj5h
	grEy0CJn8yE7dbDw1NFaQkBRqj9jLA7mL7P20fzOg655lVH5rcucTn0T58MzE8f+lsBo3hBxvmJSp
	XcuAtnTB7Ayl9fquQ+i8AzRYXgUh9fWgpQv3By1FY/SJKhovmkkxfKy/VI1PsMBUKr4pChg4S1VnY
	480T9Rw9A1DkY4oa0+G4nLlaIOI0uPCAQDxYHgrILqRflmh8QwXhZApCRsbg0lHm2X9SahTOENkx1
	XXCpdOvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxJTg-0000000Cg8f-3sAv;
	Fri, 21 Aug 2026 07:15:48 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxJTe-0000000Cg7d-2whG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 07:15:47 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-ca7bea5e5b3so580202a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 00:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787296546; x=1787901346; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9Y/Hk1ij4iIeeDeCgZ2taRMrjGJza1klMebG4Wvu7x0=;
        b=cm8vpJFo9QS0LYHZ2sXo8zlAXekpwAYsP8XvLOFU0ctGsL04w5bCMk+SrFgs8LpkJG
         0D7P+PdST6Yp5ehbsSkEa0IuWE2BlUdUPaHv+sZlJuPmIWtId5hZmywcrXDZjcfqzCWO
         WRqtB9qFLaqYeFaF7+4BBOc1weEj4A+c8z9vShozY5aS5iU/FvKJBMeYCZ4+kjfx0WH7
         J92FQUzFML23rBmdXcxAjFiZaB+d1Ovjz8DYrsXmElcfs3NuOk1nkmsRG0GpqyJiMKJZ
         WQ7KvDBDWz8XFZFZWrJ3VbfqfLaLkXRjVjr1AO9Ih5dp4ukqpldRfWvxtsUlRonBMYQb
         4Wag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787296546; x=1787901346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Y/Hk1ij4iIeeDeCgZ2taRMrjGJza1klMebG4Wvu7x0=;
        b=D1B33uLsC6GmWBszfQ8Sv1WBvag19+5IyZoobbYD5GdDurMtPQ38VvzIBgJuMtjfqH
         8AMIN4nQbNsqg/QfudQKH8gQINjSTpSa8R9MGw/2kueXkaCvG/3kkbZJljIcQ49XHaoF
         P7sMdJfOaR2X36muptHr69Wxs63/swJgDZyWLX4oVs1qyecUfUecd3wSxjzbu9v9O3CG
         c5eCfFrjHVsztWIU+ZpRsz54Vth0Zk5ppbalKqCBbALkeGsqXLkc7SMlmcYIn1U8grNO
         xB5o5NmZzDLr5/dPhdMgEGv0CZ7lCvOjFi+cAODfZXTObBl7LPmHymYniQ4PbZtfJnU2
         IAEA==
X-Forwarded-Encrypted: i=1; AHgh+Rrdm1YO2aiVvW+2ur/F3ZtHrCMnbQAxAAgBoQumqcFQSVoiyeiT8NEsSO5c8tRShpZOTtQBilaVOEqpi2HI/ys3@lists.infradead.org
X-Gm-Message-State: AFuF++n5N5lqu3QIdtRxuMJ3XTewcDEgHyIn6kIkGiXGCRPZuCb0upQq
	XxIghZyXpIA6fiIrpgtV2jvrZ5iAdUjghRvgm7ZQTlgQUtjVTPhLVc8=
X-Gm-Gg: AR+sD10tw/mLlhr5eJStTLleuPivZYDBtKyY3qdKhRDEE0Dz4Oip1UuRzudSjzzY8xT
	7MbRHzEjj2+dpkgfOFWsa9O4ZTg+xMQ5eg+EBnrEhHApmJNHZXmAaas22Zex0+nN9ZBViWJ62LI
	Bh/Prdp5W58AwTqL+bxIa4nm0PbkIfWGuO7eX0aLr0aey1acBDinx2TLVJDyaOncbLxVkez9s+5
	Nm4hMhxUaYu3/kZqbP5U5K7ht78MtaXXQf78j4Qy9JIP2je0c3kWSztkwieU4vqrf0dYoDPQLpq
	INSpJ9LE9a/sVvDB4yvA/3ID/r4PZRiBpNbdL/pDaIPSPHltCfBm4rZjizS4+lUXn9t5+ERpEpl
	ihmmPN0bhpJvpWi58QJpGe6k+O9nLGzOp7awB3hxk0dRkk/iPCz88Wzq1d/1ML4ksuHDid1LOTC
	0JFLkEdfIX1BBEGbJ/BnUwYAIYaO2aXd+Nz6e+Rn8pjeCoFvpFDsqTgS54SaD4xJH5IY/JFz3jD
	HogcfWWjmiyuA==
X-Received: by 2002:a17:90a:da87:b0:38e:2860:253f with SMTP id 98e67ed59e1d1-395c3731c29mr8394315a91.12.1787296545832;
        Fri, 21 Aug 2026 00:15:45 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c4c194d2sm1951676a91.15.2026.08.21.00.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 00:15:45 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: sean@mess.org
Cc: mchehab@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Triet Hoang <triet.hoang.dev@gmail.com>
Subject: [PATCH] media: rc: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Fri, 21 Aug 2026 14:15:33 +0700
Message-ID: <20260821071533.215821-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_001546_743487_6745056E 
X-CRM114-Status: GOOD (  13.36  )
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

Convert the deprecated SIMPLE_DEV_PM_OPS
to DEFINE_SIMPLE_DEV_PM_OPS
and pm_sleep_ptr().

This lets us drop the __maybe_unused annotations
from its suspend and resume callbacks,
also reduces kernel size in case CONFIG_PM or
CONFIG_PM_SLEEP is disabled.

Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
 drivers/media/rc/meson-ir.c  | 6 +++---
 drivers/media/rc/sunxi-cir.c | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/rc/meson-ir.c b/drivers/media/rc/meson-ir.c
index 272ebb0d97c8..795b38ca864a 100644
--- a/drivers/media/rc/meson-ir.c
+++ b/drivers/media/rc/meson-ir.c
@@ -567,7 +567,7 @@ static void meson_ir_shutdown(struct platform_device *pdev)
 	spin_unlock_irqrestore(&ir->lock, flags);
 }
 
-static __maybe_unused int meson_ir_resume(struct device *dev)
+static int meson_ir_resume(struct device *dev)
 {
 	struct meson_ir *ir = dev_get_drvdata(dev);
 
@@ -579,7 +579,7 @@ static __maybe_unused int meson_ir_resume(struct device *dev)
 	return 0;
 }
 
-static __maybe_unused int meson_ir_suspend(struct device *dev)
+static int meson_ir_suspend(struct device *dev)
 {
 	struct meson_ir *ir = dev_get_drvdata(dev);
 	unsigned long flags;
@@ -591,7 +591,7 @@ static __maybe_unused int meson_ir_suspend(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(meson_ir_pm_ops, meson_ir_suspend, meson_ir_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(meson_ir_pm_ops, meson_ir_suspend, meson_ir_resume);
 
 static const struct meson_ir_param meson6_ir_param = {
 	.support_hw_decoder = false,
diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
index 28e840a7e5b8..7fd48c510143 100644
--- a/drivers/media/rc/sunxi-cir.c
+++ b/drivers/media/rc/sunxi-cir.c
@@ -236,19 +236,19 @@ static void sunxi_ir_hw_exit(struct device *dev)
 	reset_control_assert(ir->rst);
 }
 
-static int __maybe_unused sunxi_ir_suspend(struct device *dev)
+static int sunxi_ir_suspend(struct device *dev)
 {
 	sunxi_ir_hw_exit(dev);
 
 	return 0;
 }
 
-static int __maybe_unused sunxi_ir_resume(struct device *dev)
+static int sunxi_ir_resume(struct device *dev)
 {
 	return sunxi_ir_hw_init(dev);
 }
 
-static SIMPLE_DEV_PM_OPS(sunxi_ir_pm_ops, sunxi_ir_suspend, sunxi_ir_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(sunxi_ir_pm_ops, sunxi_ir_suspend, sunxi_ir_resume);
 
 static int sunxi_ir_probe(struct platform_device *pdev)
 {
@@ -422,7 +422,7 @@ static struct platform_driver sunxi_ir_driver = {
 	.driver = {
 		.name = SUNXI_IR_DEV,
 		.of_match_table = sunxi_ir_match,
-		.pm = &sunxi_ir_pm_ops,
+		.pm = pm_sleep_ptr(&sunxi_ir_pm_ops),
 	},
 };
 
-- 
2.53.0


