Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4519FD1BDE7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 19:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=unJ9b+rts3y1hb3/PAxKDJbTMcuKEtEuGFYI5bvW40k=; b=E7aQvdD+iffix5n08l/TsvnkAl
	1/JymIuqzxrOzhzez5z/fpd0MLbmQ690CpaEaVwSWk1i01oy0opAA2xZ0Q/iSTcDqVTmFouZP7Dzv
	aQnzGUw6qVG13ZwCNBajjB7zMhZ2Zes/LLIt48Lakd76WhoWTIWmnpcKbf8J07tOznaBGyq+s9GJE
	iuOCBT26Mwo/CFCOUEeg7q+Gi/hjpduOxYg834zCf39tqYfBMoJKGldZvhSggrSwiMgFX5QHtIsy+
	a4dWAFH3TUSMave6ArI8T5NX5rt2nOv82pHcPF8/KiV+E9j2a7c/kojf7ZHf3vqIRMPyqSq3hvF72
	GblqLDUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t82lN-0000000Etkk-2KlK;
	Mon, 04 Nov 2024 19:29:21 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t82as-0000000EsMi-1PnZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 19:18:32 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-460c0f9c13eso40261751cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 11:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730747908; x=1731352708; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=unJ9b+rts3y1hb3/PAxKDJbTMcuKEtEuGFYI5bvW40k=;
        b=M6iuswTYcWNU8UE1rGm+4hjhI+8TZnWFHSroG3Qf6LDjdVMW7ULwAdx6oRM7A1F6xU
         qvQ0AbEPTxt4KKlsgWRQr4Moj3kTgULFfVsWuhtZELP/yE7PP3q7ba9BGaf5rWGhCHVq
         9SWNF72GR9yUXyHs3mhFf4K2r5FCiBwlcRSewLJxmaS8y+WvuQzLkIp5wGmlnJkuVE7c
         ZWkyGw2FlecWXXGCDaUzio41L2noHcU9hFRp+QQtf7okS2iPVDxNBTOz0Py0OhgW6l9l
         ilwZi/NbZS9iJKEXQ0YnKryRRlU4gQOhiUwAC9yhr/XBpzcJcv7Ok2oenKf4HdVlFcNi
         e45Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730747908; x=1731352708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=unJ9b+rts3y1hb3/PAxKDJbTMcuKEtEuGFYI5bvW40k=;
        b=JBtkgtf2OzgVDPZS4cUShDIbZ/GNeC5HW3D35Y3gAoXa5MIOXANxXBgynt3KfkCSSv
         xKiNVBDrL4UAbUCYouEGUuPtLTCnc75ma7eSONKatIsltPz1Caz72ph2dwAD8ooGG5ph
         JuaZ/otx8bK3a9Ac1fayOlvF/Ek6rO02sSTSA9yKKuT7LcJYEWrbBd6GPKqmBunraxhL
         0i0A39wbWySIQ8IDlmLlgS8i3WIR9tq4h+411e+/RadcPpqEs7+mxFAjAx6wTPOeJytH
         QuBPa8uxC1zVyqQHm5pho5yb3CUjXh3PNsPFPvaIErksGTsO+e5fb/wv6wK6lwJqSZDJ
         EQYA==
X-Forwarded-Encrypted: i=1; AJvYcCWln1yYiUJklCMCVRKWafj+stqy04UeT+3kzGCos2k2uMfKRo9XmeTVZAfpqTXgWFyeKiItWD/wdcynTpSlrkug@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4dihgzOuGG+ymQRWSqU6GFAGzAWnJmSBvak8VnaFjr5W8KhUa
	RlafVS6kAdls68MEnR9Skv82z5kI3Eb8YFxQkmtRfDMASnVEyA4M
X-Google-Smtp-Source: AGHT+IELakiFzr59EudtKLiMCMHPt484NaNIT6Kjz/ZSDX/NpW9fjmCjoWrs7c/vQ4eTZTNX7i2z4g==
X-Received: by 2002:ac8:58ce:0:b0:44f:fb6d:4b2f with SMTP id d75a77b69052e-462b6e83130mr228655931cf.23.1730747908255;
        Mon, 04 Nov 2024 11:18:28 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-462ad086e55sm50174351cf.7.2024.11.04.11.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 11:18:28 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: wbg@kernel.org,
	fabrice.gasnier@foss.st.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	Jonathan.Cameron@huawei.com,
	benjamin.gaignard@st.com,
	gregkh@linuxfoundation.org
Cc: linux-iio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH v2] counter: stm32-timer-cnt: Add check for clk_enable()
Date: Mon,  4 Nov 2024 19:18:25 +0000
Message-Id: <20241104191825.40155-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_111830_398681_74B9CA04 
X-CRM114-Status: GOOD (  12.29  )
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

Add check for the return value of clk_enable() in order to catch the
potential exception.

Fixes: c5b8425514da ("counter: stm32-timer-cnt: add power management support")
Fixes: ad29937e206f ("counter: Add STM32 Timer quadrature encoder")
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
Changelog:

v1 -> v2:

1. Add dev_err() to indicate the reason for the error code.
---
 drivers/counter/stm32-timer-cnt.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-timer-cnt.c
index 186e73d6ccb4..9c188d9edd89 100644
--- a/drivers/counter/stm32-timer-cnt.c
+++ b/drivers/counter/stm32-timer-cnt.c
@@ -214,11 +214,17 @@ static int stm32_count_enable_write(struct counter_device *counter,
 {
 	struct stm32_timer_cnt *const priv = counter_priv(counter);
 	u32 cr1;
+	int ret;
 
 	if (enable) {
 		regmap_read(priv->regmap, TIM_CR1, &cr1);
-		if (!(cr1 & TIM_CR1_CEN))
-			clk_enable(priv->clk);
+		if (!(cr1 & TIM_CR1_CEN)) {
+			ret = clk_enable(priv->clk);
+			if (ret) {
+				dev_err(counter->parent, "Cannot enable clock %d\n", ret);
+				return ret;
+			}
+		}
 
 		regmap_update_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN,
 				   TIM_CR1_CEN);
@@ -816,7 +822,11 @@ static int __maybe_unused stm32_timer_cnt_resume(struct device *dev)
 		return ret;
 
 	if (priv->enabled) {
-		clk_enable(priv->clk);
+		ret = clk_enable(priv->clk);
+		if (ret) {
+			dev_err(dev, "Cannot enable clock %d\n", ret);
+			return ret;
+		}
 
 		/* Restore registers that may have been lost */
 		regmap_write(priv->regmap, TIM_SMCR, priv->bak.smcr);
-- 
2.25.1


