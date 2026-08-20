Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98CCC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 07:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8FpAmuQv/0D1SendrGr4xs5zcx8uXf/Ui4UAqXK6/V0=; b=vJ/NzK9vwBgUQxXfivhlCFUQP/
	/ZHfwiyQLnYVApbeaxjw2xyexfHEP6mYUK3xaXHpvcifZ4MRK6B8tWuTfmezs9owqaZmcllj3navB
	p4zkYBkvFe1LHj6tb+wcg8NbDg3ORdotF50FpK+U5qXuOHeJlKfAe2ApFBTBW1gMLVLWFuXodUnS4
	qxXPBV7gY8UeZw7Y7ZE+oQu/d4ZSG1oCQUBgYuIsxsCDqhHMMNoNEt/z/92RZa8ggSvJ8v3snSBGA
	kau6tEw+U2GiGpEfLAqIcaMO85O/gXM1jxDbDXDllcGerzAcD/2vrZzUStmveu2Q5O+G/1vieFR/3
	jjQ6ofMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwxAi-0000000B3XW-42mP;
	Thu, 20 Aug 2026 07:26:44 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwxAh-0000000B3Wy-0kGk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 07:26:44 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-84a4d8fd6ecso1844193b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 00:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787210802; x=1787815602; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8FpAmuQv/0D1SendrGr4xs5zcx8uXf/Ui4UAqXK6/V0=;
        b=q7WAazBcObvz+SYyQrT695Q6S3PG5oIQBdXnlJNKqNeu4LWPZoVn+DvfRq+y9geOJg
         QfM01D6b30gPpvWWwC2kyW3xzRnMfeRKAf22FxCOdRVQoMdw+/R84AREtvl9IU44assp
         JOyfmAtnGi2ij0raA0frXIFlvxO8uT5B4wWIUA8Rg36YTvafIMD3lWtDUJFMVeoXpBn2
         4Pj08naivAW8rqDMyMsfoBti11hNo6HRZ08f+wYXFcbArz/TFB75bV7SgyBOHm7DGj/v
         HgQInvNtruNgocOS5XltDZzuu9wYPIxR/tq+WVRgo2e6kOatbdzCdiz3tQktuu7NUsIi
         03Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787210802; x=1787815602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8FpAmuQv/0D1SendrGr4xs5zcx8uXf/Ui4UAqXK6/V0=;
        b=scXoQURrPTMIZqA2ILF1ntY34vRYY6uvDzhfveoeD/lyvnaUEYKb/UvXjqMd+LaHkt
         Jft7hlyCHi+sZLEfcA4TJPFlrBFBdcopmhWXmWF2DvjvUHdgPjAWtZs3xeqkFFAqPu2/
         /4026JTsiqPR0WdMUPcY3Iq1Z9oqNHdqN0pz1P2YaCqUfi+vofSsbnnLO4Kp+jePKY5N
         QGuV8eBrfzjdPJa0CaXklSZUzB3dnkZsWRcZ+Favphy/gpaa6/54EGQ8pTBj/TVmg2x/
         hRR27tTk2PmIxuJaJgGj14O7InwpHltbpXBZTOJ/OmZScOErkB0b9YgRo7dz5S5Tp8s2
         7EWg==
X-Forwarded-Encrypted: i=1; AHgh+RpPQE+S9+iItBDFdPZ7Q7KaixrRBKdSlvB1glybzV+g1MXq2bNBNEAcknHzjlJ4Rsvnxr9ReoLb/WUxhOaYgkhr@lists.infradead.org
X-Gm-Message-State: AOJu0YxOut/Yp+HKJDeG1vV3SHdWDxW27ixJuqY587PD22tAY3WFn1/m
	6GHSpmEEVssWqnup/3ytxbv26aUYr3RWPbyx1uJR6CAx9HfyxM/3o24=
X-Gm-Gg: AR+sD11vU0cBJWqKw+05/QGEsQ+5LVYzH87Hjma0g6k29oeLpazuLLMmic63tNawNI0
	l4NpTh4t3rs41Yw/1hW1VRjzM5a4SaXrM8pnvxOdLBTMoHYMzgRe1qzuHwWqSQYoGV6GUM9D+Fk
	HbpL5nqv5+Rc4HZoBe7X5dyjqUlLXjbBam4TFateoupCIcQqwZoyhakjWURRA/mtENw13end0i2
	5Z8xPrZLs6JxlrrRfstK+gnpUbhgldpO7VsZJCz1CVXKqOISgX5I0GWSt08vwRgOnUKvR+0USwR
	ycLI9nBpZBIoQapiGONNYTTZMrFjaIwSW44zN9nvqYR27KqC+qh+C48Yg8onfVPb89ogeQHaIdg
	UajopnhwOw66emkyPhgJPD67hJU20fAwmEsBnZDEJLxz0gzjDcC/oyxCr8634+CWUuF/21ooavz
	//tKSAqa9hbIQAyN3weEp+urFCVzqEWio3Qt6O3ELwoy0kvHWmGcz1zo2bW3Qn6mSctHdyUDWNe
	MytclR1INVk
X-Received: by 2002:a05:6a00:c81:b0:851:b007:2fe0 with SMTP id d2e1a72fcca58-851d3820363mr17061044b3a.1.1787210802084;
        Thu, 20 Aug 2026 00:26:42 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d33b4135sm1360621b3a.27.2026.08.20.00.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 00:26:41 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: myungjoo.ham@samsung.com
Cc: kyungmin.park@samsung.com,
	cw00.choi@samsung.com,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Triet Hoang <triet.hoang.dev@gmail.com>
Subject: [PATCH] PM / devfreq: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Thu, 20 Aug 2026 14:26:36 +0700
Message-ID: <20260820072636.2049617-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_002643_242803_1DC5DBFA 
X-CRM114-Status: GOOD (  14.26  )
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
to DEFINE_SIMPLE_DEV_PM_OPS and pm_sleep_ptr().

This lets us drop the __maybe_unused annotations from the suspend and
resume callbacks, and reduces kernel size in case CONFIG_PM or
CONFIG_PM_SLEEP is disabled.

Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
 drivers/devfreq/rk3399_dmc.c     | 8 ++++----
 drivers/devfreq/sun8i-a33-mbus.c | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/devfreq/rk3399_dmc.c b/drivers/devfreq/rk3399_dmc.c
index dbdce7636ca5..3ebc817fa608 100644
--- a/drivers/devfreq/rk3399_dmc.c
+++ b/drivers/devfreq/rk3399_dmc.c
@@ -243,7 +243,7 @@ static int rk3399_dmcfreq_get_cur_freq(struct device *dev, unsigned long *freq)
 	return 0;
 }
 
-static __maybe_unused int rk3399_dmcfreq_suspend(struct device *dev)
+static int rk3399_dmcfreq_suspend(struct device *dev)
 {
 	struct rk3399_dmcfreq *dmcfreq = dev_get_drvdata(dev);
 	int ret = 0;
@@ -263,7 +263,7 @@ static __maybe_unused int rk3399_dmcfreq_suspend(struct device *dev)
 	return 0;
 }
 
-static __maybe_unused int rk3399_dmcfreq_resume(struct device *dev)
+static int rk3399_dmcfreq_resume(struct device *dev)
 {
 	struct rk3399_dmcfreq *dmcfreq = dev_get_drvdata(dev);
 	int ret = 0;
@@ -282,7 +282,7 @@ static __maybe_unused int rk3399_dmcfreq_resume(struct device *dev)
 	return ret;
 }
 
-static SIMPLE_DEV_PM_OPS(rk3399_dmcfreq_pm, rk3399_dmcfreq_suspend,
+static DEFINE_SIMPLE_DEV_PM_OPS(rk3399_dmcfreq_pm, rk3399_dmcfreq_suspend,
 			 rk3399_dmcfreq_resume);
 
 static int rk3399_dmcfreq_of_props(struct rk3399_dmcfreq *data,
@@ -477,7 +477,7 @@ static struct platform_driver rk3399_dmcfreq_driver = {
 	.remove = rk3399_dmcfreq_remove,
 	.driver = {
 		.name	= "rk3399-dmc-freq",
-		.pm	= &rk3399_dmcfreq_pm,
+		.pm	= pm_sleep_ptr(&rk3399_dmcfreq_pm),
 		.of_match_table = rk3399dmc_devfreq_of_match,
 	},
 };
diff --git a/drivers/devfreq/sun8i-a33-mbus.c b/drivers/devfreq/sun8i-a33-mbus.c
index 4bd5657558d6..1636501c753e 100644
--- a/drivers/devfreq/sun8i-a33-mbus.c
+++ b/drivers/devfreq/sun8i-a33-mbus.c
@@ -312,7 +312,7 @@ static int sun8i_a33_mbus_hw_init(struct device *dev,
 	return 0;
 }
 
-static int __maybe_unused sun8i_a33_mbus_suspend(struct device *dev)
+static int sun8i_a33_mbus_suspend(struct device *dev)
 {
 	struct sun8i_a33_mbus *priv = dev_get_drvdata(dev);
 
@@ -321,7 +321,7 @@ static int __maybe_unused sun8i_a33_mbus_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused sun8i_a33_mbus_resume(struct device *dev)
+static int sun8i_a33_mbus_resume(struct device *dev)
 {
 	struct sun8i_a33_mbus *priv = dev_get_drvdata(dev);
 
@@ -470,7 +470,7 @@ static const struct of_device_id sun8i_a33_mbus_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, sun8i_a33_mbus_of_match);
 
-static SIMPLE_DEV_PM_OPS(sun8i_a33_mbus_pm_ops,
+static DEFINE_SIMPLE_DEV_PM_OPS(sun8i_a33_mbus_pm_ops,
 			 sun8i_a33_mbus_suspend, sun8i_a33_mbus_resume);
 
 static struct platform_driver sun8i_a33_mbus_driver = {
@@ -479,7 +479,7 @@ static struct platform_driver sun8i_a33_mbus_driver = {
 	.driver	= {
 		.name		= "sun8i-a33-mbus",
 		.of_match_table	= sun8i_a33_mbus_of_match,
-		.pm		= pm_ptr(&sun8i_a33_mbus_pm_ops),
+		.pm		= pm_sleep_ptr(&sun8i_a33_mbus_pm_ops),
 	},
 };
 module_platform_driver(sun8i_a33_mbus_driver);
-- 
2.53.0


