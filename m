Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C5F6C531C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 09:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZjvDxGaz/+Ym5ockvfd8pkGSRzvwp3SWGNBrqT7Ifz0=; b=Om56rqMkSi8aeovUdPf5ze0ODW
	h7uzyS/7p0w8Z+3/JK13Wl8Pt9wXhE5MILx7ItsehCADH5ScIQc/RgGztLL4gMz+qoU1v0Unth9Xu
	y2xI4BD40pxkk2af9E99UG0x5VnR4aN0sQYPvyy9JGUygkH2BvcmDRXETrMIhCT31HZLxyMQl7hIW
	r88CLWnRM/x9IOqfFgUmtO9bqBdREbp/JiIuf50l40A1dwd1eGWTf0mQxqtQS3rm2wDi89WVip7L0
	qVwZve6t9o5/prlC51pO7NheTF5lC1RZ3Hq2CzQMuShorowox8OzbEqYSB/fzZeFxXv0tMXV/h3l+
	vfZH63iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmpuf-0000000DuyV-1HPu;
	Thu, 23 Jul 2026 09:40:21 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmpuW-0000000Dutj-1pLB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 09:40:13 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-49548e01d02so2393505e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 02:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784799610; x=1785404410; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZjvDxGaz/+Ym5ockvfd8pkGSRzvwp3SWGNBrqT7Ifz0=;
        b=K3HOeybl202F8EOiLe9GNIxfF6DgnGw3TXzYm5C8h2sMd0xDj86RM0ESZOQpG0G/zx
         FtX/WEj/8Fc2cF+X5b97GRYGbIciUwOgdCXLI0t9lErWs2s6eFf9vNPgbwwhsDsHOhkV
         g6e/X3eUsR6KJk3McuhfF2qwqIGoTNHMhLm/80ROQ6D6sTPypX5jDKYAug28VEAQjjgR
         QBlXnWeaCP9AaAquwBhOGuw9tgtuVD0BYmWarlAjSeyj2ek41oHbwg2UUNNAXDuA0NkI
         h+e8zs72UYeEfIEZEk+cag1bKocNJGUu0VJI17XdGZZqpjMDpT1HTee/ATQGxcfToBzX
         dNng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784799610; x=1785404410;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZjvDxGaz/+Ym5ockvfd8pkGSRzvwp3SWGNBrqT7Ifz0=;
        b=h7D7Nq476mqyuJtiSfRG8KYERyIX1aw7vfKQBlivaeAW2T4eotVMjsOjz7RR3NjUNC
         jC2VYWBG1wLjmO/odLkQ4ziR+6KLDSK7zOVQtWVqtq2rFvql/MXSLF1Np3Ibi6SevVWM
         o8f3h4+3RfIbPqWwj6eReVdTl1RodcCanEurR2CCxCR3jRdptlR2RfM+i23cRSZlK60R
         jS/dexWHVdukRk4m5lxsKd2hCazUVlar4hEP0+LdtunSDWQOBCwvJNirPPr4c8rvX9jI
         vqBfSDgn0pjov+37pWcSQt4Nbs7defor+ErvGLxGhVTXIR/ZGGtOkymuqCVznn6uA+vH
         4Bcg==
X-Forwarded-Encrypted: i=1; AHgh+RpkCq8qgj50Wk+1FJvC1wTvKiNDZ6ZTX/dLsnKA6WpeXlrZ+Mp0SNkQ+ewpywBaciMTiqjinDqFmjcU2lu8Nk0P@lists.infradead.org
X-Gm-Message-State: AOJu0YxgePJ1vPGBnf+9j2RLcdc5+8b5NPYYHPaTaCs2KwQb7+rKtiEU
	PHApmK6hv0e/InDBHFTcRq/MHgAgNAZcbYS2dr4pfUdsYdV+UsYEJjDVpdm0vXCUEMw=
X-Gm-Gg: AR+sD13saA23bbIP0xZfcmbq6lRrghw5hKHzKk3WDwJURLDYMJ7I0T/o0XxSiZNhG16
	ZUdqB6934/CspGlW2Jw5h10sXBxwkAjMjkShJ0228A5F2wZWangTdeLs6gI2SceSZf+PwrBf74D
	Mj/YU8f9R0TFKnUXEtb5ZInipKyjCS1Oh6J4axaf+8glwAUytu4RYSMvSmlNxFSp0GOTIWNwZ/A
	X51bNwEx3Qln8Mrvn0Y6sVTEVgriVWkPmf21eFjrjP8iLgm/sIpkL/q6btE9MzRsrrGQvHhFL3O
	hF8FCKGVwP2l2yOLZ/gRzjvm7Y5tJYierlSC/KCZbcReRS88TBsyy8f2N6QlNdm2LVWkte17MZ5
	7ObprCS0asuW8uzjeRzZRObG5DPTWfXL04KTcxDp7vPiKKocyv7mzjqP7p1L3Y/3/SOZdM65pzI
	0dxVIg52s1uLE=
X-Received: by 2002:a05:600c:4ecd:b0:493:c77c:108a with SMTP id 5b1f17b1804b1-49573d218camr23593405e9.36.1784799610474;
        Thu, 23 Jul 2026 02:40:10 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:3274:dbb5:2710:802b])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f85c6f076sm14217894f8f.34.2026.07.23.02.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 02:40:10 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 23 Jul 2026 11:39:53 +0200
Subject: [PATCH v7 3/4] clk: sunxi-ng: sun6i-rtc: split main oscillator div
 and gate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-a733-rtc-v7-3-8fd68aab94ae@baylibre.com>
References: <20260723-a733-rtc-v7-0-8fd68aab94ae@baylibre.com>
In-Reply-To: <20260723-a733-rtc-v7-0-8fd68aab94ae@baylibre.com>
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
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqYeFvjq1VgqkrnRX4lgbpVG1CsAXk0OXhBpCAY
 2cCxet3nn2JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamHhbwAKCRDm/A8cN/La
 hf+4D/9zXNDTBscW+MTjTDh5NosjbTzIiSUcS/dzhnCjmVmQ22U54ZbigzSwc6euLyNEtodPs1C
 /83GyQHXZt+edY9PQwiZPYblQf+aVW1yKbeYf6FFTVVge5OGW3uMbf9OafZ444Ub/xyM7n9nGTL
 XW7lMm7/LwIzHt4uT1zqEwBFeGSWbtpq42X5f5XSAWzj0D/Sfg/UNEzJt+Rs+um4Vl4r6c13Ch2
 jgSCFGwtao3MN98b2BVBehZnTVyzXa3tKeJ74cHMVt1fIqo42wGGN4MW6hIyGnpcKhRZVBUTPpj
 nImEEQ/hlmQBjgiMcaKdGtY/IN8KqnMZxLGR807JujAmNNxr2G6VLFHBf69hKJMuRSFapjHy3f+
 6g8EfwUeZcwlSHhe5v9kw7q4+t1Zn9dFcxPktxBOmr8jtipsQ+Foc6AxBT5/zYW3c/9kz7rr7hT
 /MHiWwdeMGFzyCU1iVvoPB8GrWdMpoL6V89Iin13MOxCvLchXPPD2prKYFPK6dxhZggyxOWl16M
 87kPE9H1TtPTKfcVmm+e2FKcEVn4s/R8VC+ea3KAS9sOw8scj8hQZU7GuSCX+FTvMUZstkPhCzJ
 9N08h3ySwaNa7DjKju7KfJTrOTYdqNgr4IKfsaevnZUUtEgvNDH5hQDqy7wzqNj2ezZl7zu5VEQ
 YE3e07IaksL7KFA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_024012_513894_EE9C91CE 
X-CRM114-Status: GOOD (  15.38  )
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


