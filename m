Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53289C44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 14:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZjvDxGaz/+Ym5ockvfd8pkGSRzvwp3SWGNBrqT7Ifz0=; b=bWt2jVHGccmjGuWA1TBvrNm09n
	2C+Y8Mtlx7PmbjAYPmk+7+f8uzhQZRy3omgD3CzNLKBIuJ/bzCGz05EYLN/7aoHNvb9f3vlZOKbvz
	IzNr2pmdoGxGSXOB4Vy+xTdJt0YIwb3ajMy8zfHbw5qdpk7K1R+NK63UyFokhJbnCslLrtP057K32
	Rp8ZM6njKsawQONNqKHKAGEpI1zHTQ433iviKO7ZZ7tuY27hpWy2GUZfL5+qmFKw9Ycdy1EsHIxHt
	QbD+7i/JwjrQgLhtnRgllzCEZWvffG+qIOgmLAaWf8SrWx7kFllvkVj1I+wYvGK5xl4irE9lPxBn7
	MTEPu8dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYFY-0000000C4b6-3jrN;
	Wed, 22 Jul 2026 14:48:44 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYFV-0000000C4Xw-0UWq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 14:48:42 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-49558ce01afso30911545e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 07:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784731719; x=1785336519; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZjvDxGaz/+Ym5ockvfd8pkGSRzvwp3SWGNBrqT7Ifz0=;
        b=GswjDmuHkKaeSeDw7PTQwaE8DWZSImB/svnyUxZf0Z5jVfvcVBzoU4Ojw45uJkFp7X
         hQV2HDZo+KhCZJusvbFXV1Gp5Uekxl7YC4dqmK8m6nTWwN2YMJgQ40EgubLd3wb5BCMh
         qPPM7r7j53qywKT+0mHI+W/xrWAvNK9ps4xrpiybIBCTzuQpAJKEAGlHZ0lupXN9fnyf
         EhzKbxykJLRtgAh2bJ9iz0yo3kA3vSXETKuFucZz3acBOTKlv0Kc+hznAQ/r7kyFcQ3d
         3RcSLVaTGoouo3+p7l/jM2kRj00CTRHmHJ11Q55Grwf3k/NIiatmUsZQfJXorQo0Ltz7
         Mfjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784731719; x=1785336519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZjvDxGaz/+Ym5ockvfd8pkGSRzvwp3SWGNBrqT7Ifz0=;
        b=ILh+WMx8QG4luiop3N3LSz/xxK2mGbZO5V1QZLgyqrmwpE6BFBm/m02rB7ExUXboWg
         AgBvFvboI9DN1rzxWnsJ1H5DdxkuYUbaojXJpNmXH3YxjytUt9NWyjgpAXuMk2AX2Ewg
         Z9Dt0GbpKn4ZjYm8KThp53MHMhaLBF7Y+lCP1dHbxvE+vo4GJEkIKysTnmD2E6YkiHvh
         89iib8a0+NuxUnujptdG0OjDTp8Ws/2bfbY8n/51+wlsiHzZo9QK4oZRIh/u+CC2UCK+
         vsEB4HOyRrdgeed9pTK2OpRFJsduZQHSUVBfA3heaYnrf/Y5/alKBxlI26xlMAD2LFvq
         AgiQ==
X-Forwarded-Encrypted: i=1; AHgh+RpDHv1a1G8SEiT3ohtlecFbZ41ycwKZkXw4n1qz3kirB8FP2OyIzLdbFwRIFoLh6SijmJ9i+TvDypoifEpafGLM@lists.infradead.org
X-Gm-Message-State: AOJu0Ywh+T8ipS43c7Uvc6jhY/m2DhmEELUV50KRTxboIVUc6FpNfO5F
	tYdTYc5cVNMzCFGg1ZFRO0aeR2Z4CwCQR+L9NNJHCcf5VMdrs/2FR/jDCGhOOsOpGGRCer1K6G3
	NSrt4
X-Gm-Gg: AR+sD13kvOL57aEmGsXw0KXNf3N+lQDLNmr5FdRCM8sz7kUKrkQS4jtOq600Ux84WpR
	HBJ23GU8hcnjO13ShFCae/ZBTesoX1p65VwlE1QRJnY4EWai5Ye5/f9F4hDwD9uR89ChzhkwAgG
	VQ3/KA1Vv8SnQCvXEapmik4JD1BtmkE77n+34qe9N9AKYiMpN93/eDLPjvPcn3RcoPeOmNDSbT+
	fvCGh/4M1mEeXe+CSDLv/1EfCmc9zGBZnBAVn0lKPrqGWUBcRa0fdUcxDLvjjxEHe4GBIHRl44G
	I0K6gEDajJTHWoSohp4vNIprFhUYUy5ivsnZt6lwnzhGQhBvpyk9JT+Vm5OBqwPOGGwi2X6MfE+
	7vVcDaKlnCNdV8+NFbL6OXiRaxPxk2aRnA20Lbabe1h2OWLuvYZGGbN6N6FmthH3UrqvcH/kigK
	rF
X-Received: by 2002:a05:600c:21da:b0:495:3e08:ad24 with SMTP id 5b1f17b1804b1-4954a51b524mr185452815e9.33.1784731719082;
        Wed, 22 Jul 2026 07:48:39 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:a589:14b5:ba97:3626])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-495653c8760sm139823645e9.14.2026.07.22.07.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 07:48:38 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 22 Jul 2026 16:48:21 +0200
Subject: [PATCH v6 3/4] clk: sunxi-ng: sun6i-rtc: split main oscillator div
 and gate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-a733-rtc-v6-3-631cca28cc9a@baylibre.com>
References: <20260722-a733-rtc-v6-0-631cca28cc9a@baylibre.com>
In-Reply-To: <20260722-a733-rtc-v6-0-631cca28cc9a@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2641; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=JBCNsbbmpvOyQAHYAiNtZ0xGeCHrftQkcKapQT6A/2Y=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqYNg8H3wMJRC9rFCS2UiRPc6rFEZssU9BeWOM0
 IVN3Kqk3IiJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamDYPAAKCRDm/A8cN/La
 hc8MEACv28/V5ccSfgbQoFHihys/2ZxbPthoGPKW5mVRQE+g/Oz7L+SPyZBpuZsgvMxiFpLUVvA
 CMHDqN+3rNai6f57DbVEELC4zx/u8jRB/ZDoZGgGjMhxTdFO/+39KxpLcInS1n0/GBFkHAIMMkQ
 9tFoo//qXYoacnTNxLHTLjJFoBa/cWgZEEwBNjHIWJMcHsc44QIDzsKQgN7CRprENs5KmmZOR1f
 JumgVe1k3xqIx+7pUpwA7oGi3Ymem4bw5zu1GJxb79mx4FRqYPlL24E9tbIbmneKe0luhQcRDvX
 1kv3GBIbMrOmq0zqvRfU2eAqlGtUQQ9AwEzmV9DbQ0Xn0HVlQMx7L1MbL/UQaQ2vDjoQdHU59s5
 YpSj8Hp7HN70Wxg3Fw7TuvO3oz9pjNkUCovCEVrKVDCJO9G04cicBnu6uYfnxMdOxKE0qQC7gnU
 1lsHznk3OGrrxG53Mf+1RRTTANJROZmFPa9khK5gJS4MHaEbaw5koNWbVqwvTzri0cYFUx3lkOJ
 2fjEsIKt5TELlf1UJSijMcDTZWxdb5xoM23tOtNfHcSYmRYeS6/nePsghZsDNWakso8H5e3G8KE
 uqaFMLAGUbZOStYwp+kEz+oBYtn3TfZl+lzv2oggN/1xZylqxWUMsuj7yX9TpXLSu/g+nmNSN5r
 qc+du/pM9mHomng==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_074841_188662_FA15C673 
X-CRM114-Status: GOOD (  15.72  )
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

On the a733 the "osc24M-32k" clock has the same gate bits as the previously
supported SoC but a different divider implementation.

Instead of a fixed 750 divider, the divider is selected based on the
rate of the oscillator. It can be seen as a simple read-only divider.

On the A733 the gate and the divider are on different register which is
not supported by sunxi combined clocks. These element will be split on the
A733. Split them for the older SoC as well to keep on sharing the gate
definition.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 20 +++++++++++---------
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.h |  3 ++-
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
index b24c8b196e66..25dd87e78eb7 100644
--- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
@@ -218,17 +218,18 @@ static const struct clk_parent_data osc24M[] = {
 	{ .fw_name = "hosc", .name = "osc24M" }
 };
 
-static struct ccu_gate osc24M_32k_clk = {
-	.enable	= BIT(16),
-	.common	= {
-		.reg		= LOSC_OUT_GATING_REG,
-		.prediv		= 750,
-		.features	= CCU_FEATURE_ALL_PREDIV,
-		.hw.init	= CLK_HW_INIT_PARENTS_DATA("osc24M-32k", osc24M,
-							   &ccu_gate_ops, 0),
-	},
+static struct clk_fixed_factor osc24M_32k_div_clk = {
+	.mult = 1,
+	.div = 750,
+	.hw.init = CLK_HW_INIT_PARENTS_DATA("osc24M-32k-div",
+					    osc24M,
+					    &clk_fixed_factor_ops,
+					    0),
 };
 
+static SUNXI_CCU_GATE_HW(osc24M_32k_clk, "osc24M-32k", &osc24M_32k_div_clk.hw,
+			 LOSC_OUT_GATING_REG, BIT(16), 0);
+
 static const struct clk_hw *rtc_32k_parents[] = {
 	&osc32k_clk.common.hw,
 	&osc24M_32k_clk.common.hw
@@ -286,6 +287,7 @@ static struct clk_hw_onecell_data sun6i_rtc_ccu_hw_clks = {
 		[CLK_EXT_OSC32K_GATE]	= &ext_osc32k_gate_clk.common.hw,
 		[CLK_OSC24M_32K]	= &osc24M_32k_clk.common.hw,
 		[CLK_RTC_32K]		= &rtc_32k_clk.common.hw,
+		[CLK_OSC24M_32K_DIV]	= &osc24M_32k_div_clk.hw,
 	},
 };
 
diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.h b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.h
index 9ae821fc2599..ab7b92b47f59 100644
--- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.h
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.h
@@ -9,7 +9,8 @@
 #define CLK_EXT_OSC32K_GATE	4
 #define CLK_OSC24M_32K		5
 #define CLK_RTC_32K		6
+#define CLK_OSC24M_32K_DIV	7
 
-#define CLK_NUMBER		(CLK_RTC_32K + 1)
+#define CLK_NUMBER		(CLK_OSC24M_32K_DIV + 1)
 
 #endif /* _CCU_SUN6I_RTC_H */

-- 
2.47.3


