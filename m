Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9EA3C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 07:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5pJ0L04+0LvJLaoDNBbLvvB34SBygdnNvNCFLvcb6N4=; b=fbMzogt+kkWGcEeGHLXwEruD/7
	Cu6UL9luceMzqPHwL3GOGWWzR19/8lx8t3DvvUPKFARVLtgAcSQtCW1IVkV070zh0fd9Snvg6s4zE
	N5bKIOUGrb3vOYj+nYoTHYAY7Gu1zpBRFeed3Gv0Hh9op9XWcnTr+M+quT4NGN8pcDD6vNQUn9GK/
	oD783/c7U/5foza9MndoEo5tuhDZ01ZqS7fc7TeApcYhw6G2mY6DhgAn2nFqhRYDeSRVdlCdsZrJ8
	sbNKk13HwGNzI+DPm8CgZ53UKPbFLqkGo4qmRlAr/XvAW25iYAOKdQIV4CYBi96+fJYAzBtsRnOjm
	7NK7MewA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwwxk-0000000B15m-1tZ8;
	Thu, 20 Aug 2026 07:13:20 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwwxi-0000000B15N-0Y4R
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 07:13:19 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2cf50c6f235so19314425ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 00:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787209997; x=1787814797; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5pJ0L04+0LvJLaoDNBbLvvB34SBygdnNvNCFLvcb6N4=;
        b=N06kQphWU2v0liAcHIzo/3dMMjkTI+kg/CaJv6Xyap/67XVDap4zJbk6aQjAWxb3u1
         AhkQAy+2QiavxhqLgziD2xhnt+QwlS+L3/DfdHNmhjwdR8v4GfsfJKpKtRvoSzymtlFj
         Z8oFdGqJWY7HTP1Wu/jns380LjcAYpCPWzsT6pczGDUQXr9u5G6rW5Awe3shAM9DWwxS
         bzmXezTaAHKdGfewaSxNQzg/PQXYprkuP3L6Yk23ZBfNb31HtUaHzDCnhP2KRIrVA2Fo
         I6rsnDWONyZdhQmRClBgdCHJ1OfFy9wOkvhvdkgaO3XLH52SPXQFB1axmbX9H7r3ZDtx
         BwJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787209997; x=1787814797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5pJ0L04+0LvJLaoDNBbLvvB34SBygdnNvNCFLvcb6N4=;
        b=LghMm8kY7OikcmuVSE91NOYEVMK9EJE6bEGdT3HJEOXOldOipqzXZuyu3LPku5aO9l
         0xUJAPhzJzr+sMyvUzMYewTKmrhWhfmPmdk32vGaLOZVAIkMPLaUy1zbIAXT2J+dvTyr
         SzkfisFBlv9gdeNhQRqXxj/6AK3J7PFsYSLFLZb006tCTWjUriKbqFdq5vpz/TEiQXgp
         fwTTJLLxk3o9i1dFOzWIPnSlZm1FnPEBtfEgxb2kovcJ3XHsYU0AdGPg45mJYt1caqaV
         8ZSftE89/34jef8iA8m9zEc0HONgWZaM3Qc3siKc/iitGjS0sYS9xEJJMnVAWj+bHTDx
         26rQ==
X-Forwarded-Encrypted: i=1; AHgh+RpoR678alS+5kKKj5vAewKvQNBT4LYDfutsK7AR7+ZZ8RrLRgPkI7UIuFQoLqrvE+PwiIfqOCp9tHeSqI06wUq/@lists.infradead.org
X-Gm-Message-State: AFuF++kQsFhcUC5YOE9qFB6sOB6knVRypssjCEf0oc+gKTlShi2zHDAP
	kUExIabp8pwjNoi76PMYzmhNhf8bYk17FCvumPMRYt/Zi9HbIok+49I=
X-Gm-Gg: AR+sD10SAc3EfVdLN5tH95qgIUPD/x5SwD/KuSKFfOVlNv1e/6fCtv1tzcMnvdgjS7V
	FRXxKz+QLJIlHFZKdDhId05tz2z65TxHqx/6T+byrNIK4JSw3dk7y6CEhMe5/kkGmIfGPxa4YEy
	XSBuwLi1HplehvMZrV7gMqIq/QKu0I6JyAnwNq8//jWDfFwaH8dyWQeozg41gpeLwT/PMXs/zsT
	Zc9LwgolmZygbdQODumfDdBLeJSvLrqL2eRD/ud7q+mO5IxrIWeTUpiRmPTyNAKCPXnxnSBwB7o
	MIIZ1GKEKEq1SqVY/aWUTlygae2F7Mn1hQjc2fECbftnizGBLZZvUNM677w1n9xquUczAd08mxf
	8oTtIse3GBWJB+j4pFqNjAxfLwJ7Us1VukZFolL1cv49S6HjwtScSFgVUxErUogfqRZ1rjPJQOj
	FpgoNOoGBIV5kO22RQBAKcbfbttPt4SR46gDuo3VG+29KW87fO7EOb8iE5/CgtqwWNR9r6joDqA
	A==
X-Received: by 2002:a17:903:b4e:b0:2c8:4c29:afeb with SMTP id d9443c01a7336-2d5fd674a51mr207729235ad.8.1787209996909;
        Thu, 20 Aug 2026 00:13:16 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62d5b687bsm3207175ad.37.2026.08.20.00.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 00:13:16 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: fabrice.gasnier@foss.st.com
Cc: wbg@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-iio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Triet Hoang <triet.hoang.dev@gmail.com>
Subject: [PATCH] counter: stm32-timer-cnt: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Thu, 20 Aug 2026 14:13:08 +0700
Message-ID: <20260820071308.2041128-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_001318_169949_C8FF470D 
X-CRM114-Status: GOOD (  12.78  )
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

This lets us drop the __maybe_unused annotations from its suspend and
resume callbacks, and reduces kernel size in case CONFIG_PM or
CONFIG_PM_SLEEP is disabled.

Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
 drivers/counter/stm32-timer-cnt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-timer-cnt.c
index a3d8f7a5874e..3024ec002cc6 100644
--- a/drivers/counter/stm32-timer-cnt.c
+++ b/drivers/counter/stm32-timer-cnt.c
@@ -794,7 +794,7 @@ static int stm32_timer_cnt_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int __maybe_unused stm32_timer_cnt_suspend(struct device *dev)
+static int stm32_timer_cnt_suspend(struct device *dev)
 {
 	struct stm32_timer_cnt *priv = dev_get_drvdata(dev);
 
@@ -814,7 +814,7 @@ static int __maybe_unused stm32_timer_cnt_suspend(struct device *dev)
 	return pinctrl_pm_select_sleep_state(dev);
 }
 
-static int __maybe_unused stm32_timer_cnt_resume(struct device *dev)
+static int stm32_timer_cnt_resume(struct device *dev)
 {
 	struct stm32_timer_cnt *priv = dev_get_drvdata(dev);
 	int ret;
@@ -842,7 +842,7 @@ static int __maybe_unused stm32_timer_cnt_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(stm32_timer_cnt_pm_ops, stm32_timer_cnt_suspend,
+static DEFINE_SIMPLE_DEV_PM_OPS(stm32_timer_cnt_pm_ops, stm32_timer_cnt_suspend,
 			 stm32_timer_cnt_resume);
 
 static const struct of_device_id stm32_timer_cnt_of_match[] = {
@@ -857,7 +857,7 @@ static struct platform_driver stm32_timer_cnt_driver = {
 	.driver = {
 		.name = "stm32-timer-counter",
 		.of_match_table = stm32_timer_cnt_of_match,
-		.pm = &stm32_timer_cnt_pm_ops,
+		.pm = pm_sleep_ptr(&stm32_timer_cnt_pm_ops),
 	},
 };
 module_platform_driver(stm32_timer_cnt_driver);
-- 
2.53.0


