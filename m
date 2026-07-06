Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 518D5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 11:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gpZvamYw9AnVrZnk1GFQEFXSHxgLU3wS0Rp+AMjlVD0=; b=Fnp5r8L5MXL39zgREz4CGdiq3+
	A8pHSS2M/948VfrFw7OBnE0i+cQCuWZKWw0xt90i1XZ1mvTKmNpej/T5Wjaa6ACnGFiXSgNDQWcJN
	1aNBkMrGYvhVOAmV8/JL4GkJMq/xrZwtPZIyHoztljIRq86OTbB/ab0Vh3IF2l2NElEB+aS/c9F6n
	ejvDtSEZxKTWjFG8EdYNDppbnoA5wPTxZWkHlrgkykWxNDWaFgzUdQt93t4YQxxP1hbU2O87QraMz
	QrfJRRB41Zx51wBwE0DuzerKr8okAJ7UHvJAke9GlsgmAtRNnm3qjJCak7ljjP9INHhBz2bZaCVW+
	YtfZjF4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfgx-0000000C1vs-3mLw;
	Mon, 06 Jul 2026 09:32:43 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfgs-0000000C1rl-3mWZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:32:40 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-493b6f1b14bso10916065e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 02:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783330357; x=1783935157; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gpZvamYw9AnVrZnk1GFQEFXSHxgLU3wS0Rp+AMjlVD0=;
        b=jaW1GmVs6FC1NloXsOfJC0rOIym9J4dwOPTcwy5IeFHmfKwD6lBk7HvSTerkPOmhxK
         U2TekarSrcqC4/m3VeCP5eBFvepHmtcnFL8vC8lPhVSZc44soY9zpxq2KPbWxEZtPXVi
         VFo5ZpImnaxmvS/i1jRkaPDRTenUyxgJEtns1t2S9Xm/tKe5s80+xHs8hWyvl1fIlbt7
         paQpj1yD68Jbj6Cn9bttobbXiiePrvzWuBQfnbYDeEpOXPEWHCdvHm/k3iKy8gG5wQbJ
         gJENblhNr+MWO0IREz2XSN9Fal/5omis7vQm4FUZh4loCWsLucJzcMynm94P0yGgWXvu
         qOQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330357; x=1783935157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gpZvamYw9AnVrZnk1GFQEFXSHxgLU3wS0Rp+AMjlVD0=;
        b=UEOAhz/p0p0mKx1NZAp9zzn2h9PHLcmfO9GYq/6+l39uBbt2LvMjfBnbkLt1Ag1xd1
         NegLakidIrNSiNV0NC8MEJNa39sUwiaYqWEelMxLjfAwci/t1zrjeESQu8+otZ5axHIW
         eJzIPCmi5mlX0U8TrJgfC+aaoETx709xKNWD5sedyRugKDpeUZyuN3BRXg3cdOJpR1Yl
         6TRNMw1EJ24u/dsNsD5NK1xkP5cTHv2h6bE4Rv6ym/2bvytaWbHdIJSgKbaw3UR3TToA
         74YMY4lkRew1+lTQsI79P+WIv0p8rX7EP1g+czssxwYGaNR2J6Or8u/ejWCU6uOkDo6A
         6iFA==
X-Forwarded-Encrypted: i=1; AHgh+RqnkU2bAGc0lErc4sQu1LsDglY2VvwQ9NLqMgoGUJ7sCN3xgJnQ9Ju8jzqkDAYOL98ve3DKxwcNuPDFjk2iBZai@lists.infradead.org
X-Gm-Message-State: AOJu0YyBmegM1tmL/a13VyS1G1h9WRv0X2BjCuQ7P3b/eEhswPMKsg2+
	Sh77sC8gWpJhkHGwQAZs2MfjHDxSJc+nSXVE9YdXsPWCtE05V2+AjN6/feWlhOoRg/c=
X-Gm-Gg: AfdE7ckoZBScuewEzVXcDke40Tr5BpwW8JDAmYSaPnG+r3odTvTCsMal9BBSTG2Vlzv
	5apwJG/WwzHBwGDWikXq4CqV7RiGtTY51PA33Wblt2WK/B3n94nuevBf4bA8w8APJjHl0U7vITp
	9oHPbZf+D9TbshSolIkNLt/wDhX/xnSLuC7nM/l2nmWNaGP1iwjaBa4aDJXKel6b2KOUOBmmogf
	3YHryUqUD0kl3Pmic9xajcYx8UwN8wOi4wqGZdchdg6Bm6VDGnMJk3qCajEl1f7GkBbZycGwOk1
	FnyXvkNjpCA1gZijUwgDnMn+41C+aRi5UU3TPH27sX1Cp9cCHqEvX6m6Iyvn38JRgaXi9CmTr2R
	30JPQDD/mAYU7gYYTd886to7DdAahjohdaPlTnpYLbIijpFRZXiJYlEuStns+Umkm+rYMqZ6hPQ
	TnQO/5hjNHq1k=
X-Received: by 2002:a05:600c:c118:b0:492:3e66:6c84 with SMTP id 5b1f17b1804b1-493d11f918cmr92947785e9.30.1783330356762;
        Mon, 06 Jul 2026 02:32:36 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1495:8c97:96f4:dff8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493bef11338sm377772315e9.1.2026.07.06.02.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:32:36 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 06 Jul 2026 11:32:13 +0200
Subject: [PATCH v4 5/9] clk: sunxi-ng: sun6i-rtc: Add feature bit for IOSC
 calibration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-a733-rtc-v4-5-f330728db3d3@baylibre.com>
References: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
In-Reply-To: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3560; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=LjKLqtELI/k5Bm86qG39EiNLmLLQg2pvRCFKcypyAtM=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqS3Ykm1EkaDJ069gqM3tqzZUAo6EzOomoBvrrG
 TY60PbIiaqJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakt2JAAKCRDm/A8cN/La
 hY6PEACcL49Jv+12kjoAQsDpUPA5V1xw9VbQsEtOPVlm9vqqWLHZwoaPT4wAlORrO3AdWbLsP99
 3Va3GrObwSKZUgSScUTpAR9hNRd4uB9ay8wsEnI5doSKc0OxjECZvx5YIFWne9fn5wvJSY4dABo
 Nd1qkF+KcOd+L3w+z1WMzohuFIjRPeYo03b4QghplwZxrZrOO3erSNWE/6WdDYAVfiqCz8ozF7T
 sOBaTPh2Ya9YSPxG8OvqNnj8m1N/ozmgUCXMacKz6ZkiZUSWhwNSKytFZLrzlQHAV6d68XpK3Bd
 ztEjka3alClmehE5im7V14RfDcdAlcVDAIrxt2BCWmSHynOdEeykUKnkDaLBjC0VB3J9S0mK/Ea
 rfPUwIey53EGCzJWVafrOw20jOAmZYKXKC9jrmjmGIrrPI3kuQ9cb3jK+OlPdg2Dty7QiTX0Vnv
 smnFnurV6vL6UW4exhKbzae8TERopeRgMXTYpc1OYQuFqA7ayOUzRGbgj7eo/IIxrdfk1Am/LDz
 x9P69Vo0/ZnQUBQfQJD9pJPD30bDdiqSBFh4IGlArPzp/azMB7F7CxxS3rXjTlYfNTQAOOxYVQ4
 VUMsLMUDKkFUmjJH3j5UYg9xA0MhEEwbjcDiIPXoe9Lohy72G0WpUdGGtMMf45iETg/TYiK8S3/
 FwG9c4GpEzDcYfw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_023239_520408_5F4E1657 
X-CRM114-Status: GOOD (  18.64  )
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

From: Junhui Liu <junhui.liu@pigmoral.tech>

The sun6i-rtc CCU driver currently uses a global static variable to
denote whether calibration is supported, which makes IOSC operations
tightly coupled to this file.

Convert this into a feature bit to decouple the logic. This allows the
IOSC clock code to be moved into a shared module for reuse by other SoCs.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 17 +++++++++--------
 drivers/clk/sunxi-ng/ccu_common.h    |  1 +
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
index 0f528bfaed00..b24c8b196e66 100644
--- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
@@ -52,8 +52,6 @@ struct sun6i_rtc_match_data {
 	u8				osc32k_fanout_nparents;
 };
 
-static bool have_iosc_calibration;
-
 static int ccu_iosc_enable(struct clk_hw *hw)
 {
 	struct ccu_common *cm = hw_to_ccu_common(hw);
@@ -80,7 +78,7 @@ static unsigned long ccu_iosc_recalc_rate(struct clk_hw *hw,
 {
 	struct ccu_common *cm = hw_to_ccu_common(hw);
 
-	if (have_iosc_calibration) {
+	if (cm->features & CCU_FEATURE_IOSC_CALIBRATION) {
 		u32 reg = readl(cm->base + IOSC_CLK_CALI_REG);
 
 		/*
@@ -119,7 +117,7 @@ static int ccu_iosc_32k_prepare(struct clk_hw *hw)
 	struct ccu_common *cm = hw_to_ccu_common(hw);
 	u32 val;
 
-	if (!have_iosc_calibration)
+	if (!(cm->features & CCU_FEATURE_IOSC_CALIBRATION))
 		return 0;
 
 	val = readl(cm->base + IOSC_CLK_CALI_REG);
@@ -134,7 +132,7 @@ static void ccu_iosc_32k_unprepare(struct clk_hw *hw)
 	struct ccu_common *cm = hw_to_ccu_common(hw);
 	u32 val;
 
-	if (!have_iosc_calibration)
+	if (!(cm->features & CCU_FEATURE_IOSC_CALIBRATION))
 		return;
 
 	val = readl(cm->base + IOSC_CLK_CALI_REG);
@@ -148,7 +146,7 @@ static unsigned long ccu_iosc_32k_recalc_rate(struct clk_hw *hw,
 	struct ccu_common *cm = hw_to_ccu_common(hw);
 	u32 val;
 
-	if (have_iosc_calibration) {
+	if (cm->features & CCU_FEATURE_IOSC_CALIBRATION) {
 		val = readl(cm->base + IOSC_CLK_CALI_REG);
 
 		/* Assume the calibrated 32k clock is accurate. */
@@ -167,7 +165,7 @@ static unsigned long ccu_iosc_32k_recalc_accuracy(struct clk_hw *hw,
 	struct ccu_common *cm = hw_to_ccu_common(hw);
 	u32 val;
 
-	if (have_iosc_calibration) {
+	if (cm->features & CCU_FEATURE_IOSC_CALIBRATION) {
 		val = readl(cm->base + IOSC_CLK_CALI_REG);
 
 		/* Assume the calibrated 32k clock is accurate. */
@@ -358,7 +356,10 @@ int sun6i_rtc_ccu_probe(struct device *dev, void __iomem *reg)
 		return 0;
 
 	data = match->data;
-	have_iosc_calibration = data->have_iosc_calibration;
+	if (data->have_iosc_calibration) {
+		iosc_clk.features |= CCU_FEATURE_IOSC_CALIBRATION;
+		iosc_32k_clk.features |= CCU_FEATURE_IOSC_CALIBRATION;
+	}
 
 	if (!data->have_ext_osc32k) {
 		/* ext-osc32k-gate is an orphan, so do not register it. */
diff --git a/drivers/clk/sunxi-ng/ccu_common.h b/drivers/clk/sunxi-ng/ccu_common.h
index bbec283b9d99..d9dc24ad5503 100644
--- a/drivers/clk/sunxi-ng/ccu_common.h
+++ b/drivers/clk/sunxi-ng/ccu_common.h
@@ -21,6 +21,7 @@
 #define CCU_FEATURE_CLOSEST_RATE	BIT(9)
 #define CCU_FEATURE_DUAL_DIV		BIT(10)
 #define CCU_FEATURE_UPDATE_BIT		BIT(11)
+#define CCU_FEATURE_IOSC_CALIBRATION	BIT(12)
 
 /* MMC timing mode switch bit */
 #define CCU_MMC_NEW_TIMING_MODE		BIT(30)

-- 
2.47.3


