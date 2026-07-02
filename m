Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE23C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 10:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gpZvamYw9AnVrZnk1GFQEFXSHxgLU3wS0Rp+AMjlVD0=; b=uoJGOu1xu2cpEceztcdxYRP/29
	bz/A94MKakTm4zYkeyQdGYP1DwEQy0/l+Db5eEUL9XvElQzHG4eNOBdvE7e4kv98fJIU5e4J0QLiu
	J42s/eC1d+QW8SVenrOsNVadNYKCrrqbB9iy/YEoN1DpH/B9RiVrXrCo5u1S/2bknQElzz2VViYnr
	Hjlxw988XWRMQNLv9jALXe3IQT266oc64Cgncyzb0Sk7ULRLZSatgYMTDDJoPSj9IzkCpKXv5anZW
	u8FW5I3hfoVxRUeRvI72dcJ56IpfHyIKgcID8ERkN1dLDKWoe+LKNCzjqb7kELpBqCijPu5iy+0Ir
	uTrGl3JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCVf-00000003oGl-1BBo;
	Thu, 02 Jul 2026 08:10:59 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCVd-00000003oDt-002W
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 08:10:58 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-4720f3bf164so133987f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 01:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782979855; x=1783584655; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gpZvamYw9AnVrZnk1GFQEFXSHxgLU3wS0Rp+AMjlVD0=;
        b=nU1Wph5EzU9SK7FhCqOCJKiFvexj8vAd6aAL4dlVooj68Z690lO/2tZz7vqGVImeQo
         RraTAkpX4iDdAwuj1svwbKxVJvlFvD5Wt2UUAbt5xZft6bYC52rPlfiHri9HiHSQV/aJ
         JSRIzQ4t8bLZWOBeIT1zQXCRQFo5cYOY/EbyUPEVsTqztKZ5y1VTePKPtM1i8A7THlFO
         pQz3L0+OvB1seSUTdQWui8cg2dALBN35T9p7j1vlW+KdWfyBTIMT3xevT4sDSKdrAmrh
         MfLiKQ/sCJKhqWW59KBvIlAngj1FfQWrGboxELkH3pa+MbemT27MLcSXL6zjDkESnVeS
         lmgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782979855; x=1783584655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gpZvamYw9AnVrZnk1GFQEFXSHxgLU3wS0Rp+AMjlVD0=;
        b=LVfVOThx/AUftJA66U7iLY1c2D8vQcYAmr6KtTA1wB9HF6oyoNavjxUzJMBlrxOClV
         m6zozNkNIOSsN7Ti5GekFdj0GDYK+Q2gvHuonYICI3QUXdlpRv/nKs/mE9/aFhqLStBF
         Xl7tpX6ZKz1HzgXC2gEHPg15bUVDH23fRPmhBGVpGCln9CcgNJNABIC2oRbYtojAXr+3
         KfqCRR7TEsyh5Ssc2w6RJW/B5+7BAEm03KSP2Uf9c1Pb4DEVS9vlGyrrQToW3OvZcYVo
         OxIqrH/H8oRIukS0bZSfgTslegAhq4OIEe0WKOdE0urG/lRQyRQUBvaL5SklMXmJRJPO
         DglA==
X-Forwarded-Encrypted: i=1; AHgh+Rr4Mrt1d4efBGPyz/8dVzTdgOXtvwDUckdi5PeRc9W+gOcGSyVgIxogVUAqomECUMpA/j6Yq6RqUEEvSV2aUo9x@lists.infradead.org
X-Gm-Message-State: AOJu0YzTNDXTssYfU2Xquc7MIiwYCT4HbXPfBPWMvrS1tuTCFTKBQ3lv
	VQewiFk11JDEK+Uprjqco3QmD90azIGI9AnrIGLhYGxPHj/X8iDAz17K2mylVib7mUk=
X-Gm-Gg: AfdE7cnLyl0E6laTm+k9mN3nKd1MLRmBaMrZc2Qdu7q/ywc1/UdriSjmP9jsvV7sUBS
	eUA4gfOAK37RnVf7JfdeVLTcgy0UMzHebPZMyLM3sFGk8m6XwVVKqKDP6hiIhoeb7RbXCzWJspf
	BidpIcrJ52SVg8FTaPha3T5Wjx6D1wgRnwi4+5qV5CsjMB2SpLYDuH8osxTGu86Mzn/6zbVYAU8
	jJj/0+4Qy7K/lB95x4HLHtyxYTGsZUXDXcmJFCC0CY2qlT0qmT6Bn/rKW3rV4SWSYQKKeORXkAT
	Fu7lzss7W6/XX28lEUWOU9rMsIu1qt3MhjonE7H0TmOv75E/VX4F3aXAFVFGutgFZlcwZrVoq/Q
	Eaq23DjwcOxR1lorl4Vv23kb8ShzXMwKFQqg54DbzYbHbbgmtoIAosQUE0BbEkTNWhs375n6qHX
	8yDKRd13PJ1A4=
X-Received: by 2002:a05:6000:40ce:b0:473:c2ec:7a79 with SMTP id ffacd0b85a97d-4774424350cmr7132004f8f.12.1782979855094;
        Thu, 02 Jul 2026 01:10:55 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:2e3a:7dcd:d2a4:6556])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-477db3dba3csm6687967f8f.3.2026.07.02.01.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 01:10:54 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 02 Jul 2026 10:10:04 +0200
Subject: [PATCH v3 5/8] clk: sunxi-ng: sun6i-rtc: Add feature bit for IOSC
 calibration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-a733-rtc-v3-5-eb2580374de6@baylibre.com>
References: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com>
In-Reply-To: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com>
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
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqRhz6iQ4ImmQHndHiBUqhJRQYIbF2ssh6u4zet
 LAX/Wa+q56JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakYc+gAKCRDm/A8cN/La
 hevvEACvUM3ca8OwIt1oufqC2tSNAYGaxdWOw46j08bNcil+NPfmr/5Af1LlNbH/cnK2mvD9i17
 uhUOtHab6h+C5k9mFrYY1/iEpNmMfiAqNP9b/SiohQo4XXQ7vH9aCSJwWzZAlrArxDjOkodWaUc
 h88RZxUvA7mpw29FBOGQWAxNpADzCWGUspkbA8rAQRvm8euwYNVi7o/O/eqFeiyK5NHr1BWiZjK
 qHzdkatztZ1pM4D298w9UADjl6bwZ/dDwaRXP5VQp1nZW8W8YDaCjG7yS+RO7IomoAJgRApUaRZ
 fCv2H2xgcSB9tIG2M6bbAzlbJe9oHGE8VwmGCk4XO2n42566JCVwypwJDkjpELB7bHudEQpOe0N
 KAlOo18K8PAcZ5uZNFnxWTOZXeiYLXjOxPAUdCpyQm7RyTZ7oXKsm2oT5k8painM4yMkDUXnRVB
 T03tesm9gVdVWILE+46J+kE4sOjXiNG1Pp2Rw1TPyVPSHfgQ0dFqutz5HsYLHOAQYgz67YjOXfU
 pzBqi+eTBeBslVZK09E9N6D9jQjjoLPsCuxdb87P8ml5T5tLNLxjNmQtkhUUGOERDfIenO571u8
 S/AJZCLIex6hlXowPOaM5FRdQFsxE2H3MNvMuOYOZfpG14rbnirk8o1Ip4YH603HjyOic3M3jSz
 A40fFvy4QCn3l1A==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_011057_087701_6300A508 
X-CRM114-Status: GOOD (  18.84  )
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


