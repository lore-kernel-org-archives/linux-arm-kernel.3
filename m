Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD303C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rSh1ZBRvKf6dioysT8A/x6MNdQs15mKol/PsSCRG53E=; b=XsV2uXIe0LQ3JoLXjDog0cREhM
	GFQ3v2AienkM6j6nGRCQ3eRNdDBJlYowON3rzUL6sqb1tz0v4e3k9UlfZes4xlnufN3vXVMpH4O4C
	mQQMGFWyaf3U0V5EL6yMa6Uk3aYdC2QzEU0rOwdrt3hnm7oI11yAYXIyisN+2Z85d6Ikv5OHta5v/
	9GILcdymseTKME0Gi38DJMCkZ6EyqDkl/FP7AgFKrPyj5u2F7UCsajwBgKaYegEe67X/Rjgus9jtz
	yHmuEdBeLqzOZx7eEDUUfh1b9AvLaL2tpAeC1ochQO+5L3oTW1YrQybCGN0QkvDE7YFiugY+Nu66V
	Hel298AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfhJ-0000000C296-3KdS;
	Mon, 06 Jul 2026 09:33:05 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfgz-0000000C1wB-1FIh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:32:48 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-493c733f15aso28559055e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 02:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783330363; x=1783935163; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rSh1ZBRvKf6dioysT8A/x6MNdQs15mKol/PsSCRG53E=;
        b=RKp1owh2eDLIuuffnBIhk2XAywRYplfmc6/RV1Rm8JkjuVsdBzg4bQne01BcBiS1zG
         DV24xbwRunHNVOhnxT1wZ6uzoRBrqDcKoRHcOtgi7XMkndSlqIwz9kEr3DNfBSLaf+6g
         991tnxw3znrEXbj4NPP3JJJnG3G/ZHG1uFF56vrR6/5oIORAbpAjiI+Evlq0e0ZIAj3i
         wna/PA41W/pxltHDUXjyLei+J1pgqebduUfFde8qBlkyl58AL1eVTx9V002LbK0EHooQ
         Ncq+cAvU8+ju8WkA59phh/DtkTiiyugm7Gz54NQUWQcZ3O7vLIyJOH6BS80e4/W5FFQi
         FWIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330363; x=1783935163;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rSh1ZBRvKf6dioysT8A/x6MNdQs15mKol/PsSCRG53E=;
        b=VKE6bgo7pl7WpkPUpoZJzzTFRFyjw9Z9wjHuIttlbueK1/K+ItY9W8rnQY6TLSaj7h
         yEUUSeC4jaKWuZzLSkbh9eRY4pc7XqFwi+xSKqUkhHAzmJ179F3TMWni3I8X25ZPENi5
         IKv3lIdd82/n0VndcpC2du2W8tLN+7uYcjInvrP5N+LHOWeAtBMPG3vK3TyO+vPhRp5y
         EuEEjCFTnfZS0xt8spqJWQIBIHjQgVgPlx+teLOp2jFwmD9p8JadFeAEyicu6hB7oWwR
         IkC1D0XzHPRuaLglAoteH8j9FISX/3TXY27rw8gLh3EK7Z70Wor0EZ0c+aFbW9+m9NRD
         OkjQ==
X-Forwarded-Encrypted: i=1; AHgh+RpOZiMHkUYc5cHR7gPfBBI+OG4ZrrMvJFmW6t5kayzG7Bzi5sVEtDeMs6ffju2/ko+nCWlrWVsTOdFGKUYdVz2X@lists.infradead.org
X-Gm-Message-State: AOJu0YxVGACOuU14j42MXOYKotQ+JL4Qmq19B7xw5/hjkaGAgisLXw++
	4m+lfmo1/GQREHrmUaCW8VLbyFBfHOXVHlrXC2lM4qXi0F72qEfqoOsWyKdaI1GASmk=
X-Gm-Gg: AfdE7ckK3hw7xQPmp+ebwi5vh8Wf9RtgS0zjyhk7tTEB89vkgvdYYDjlFpqINBW7eR3
	GSIh0aawjrF0Y8dnABj7zcGbYSP/dJfLgb71nfzWO/I7bAxaaRF0z13qKb/NSNGC6w0YMSqF1yJ
	5+37Xchyxm6PdanilotIxEG3UbEj4w/pBqnuorjhx8Zl1GTiyqi9etur0LWoIBRcb4hff/ehODc
	CMkrPZRIXZ47e0vPOYOUtrVPyBzw6fSdJ5W+PvF+f8HsS4pYXxG6pwjCEY/T91mD/aHhsuopnAb
	YIYUiYu414eg3QcuuVVQU+CKpjL0i2Qe4qRzCheqSv6+kEnqEBitEdTBxEd1AFINzTeI9D91g0F
	raXCOs6zeW+9dA3y3LGLRGfnkMolbetDfX4XUyYB7GfU9XOBihIcW2lWRtp916akG3rewQ0O2VK
	JED9jcMo+mWgA=
X-Received: by 2002:a05:600c:3f0a:b0:492:4a50:41fe with SMTP id 5b1f17b1804b1-493d11f05a3mr108518285e9.22.1783330363453;
        Mon, 06 Jul 2026 02:32:43 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1495:8c97:96f4:dff8])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa0960634sm24496957f8f.26.2026.07.06.02.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:32:43 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 06 Jul 2026 11:32:16 +0200
Subject: [PATCH v4 8/9] clk: sunxi-ng: sun6i-rtc: split main oscillator div
 and gate.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-a733-rtc-v4-8-f330728db3d3@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2479; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=mDE5aNV7J0YTDC++0PyqpQq+1LRXe/OEq5dNJJriQq0=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqS3YmTWLBuAgutDebw3ejtGqAFUPS56EkSWc4A
 wtGJpbqBNSJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakt2JgAKCRDm/A8cN/La
 hVRZD/9c7MLYh8cPg12ioyQi+NhtPqzROV5AnuK4OgtAmpPfUuF85geQbj6t5HzciSP2Hh5Mc07
 aeHHxl1ymAujhPPVz/w0sx4tnU+MQcTN0E/JoNe6YjsD4IXSKB2UYWaz2Mzj2rHOBpz8Jt9BdFc
 UQ+FcbGsS1mwn9pQK5kgnb/qp6qptHo5Kz/Rih4Zsnx17p0P6tn0hMHPUa1KSiBattQ0RX+xAt2
 IWtiahvXeBrLgJyzYxnMeK70V8BtmwhBIPs1dFcCzFka/fKigZrksQx8e7ZsF0AUqwkcbbSdIRT
 ZCd3xtLzkBr1JoH/pO9xhIl3YI4eAPZVc/jnTc1DfSNmnrplpCz3KKensHb+1OJgpT9r0h84CTP
 c+cJ1JLw3U1lLEzIaDO8qd6WKjb6zIHaifi0TOp+L/JZ+HHGvyCaSc5Dq2tD7PGFpfwEVAMH3xZ
 tL8TXrkKZuCXaxuOJNB7N3lFLcqjU/0C+Xi7RdoDJZDZ8p4ARlcQYEC6p/16tVFuvRWgKI7cEIL
 mwOOfAGoQLdeKsNPTFgA5qOjVVZNIn24USq7nNhqzvmSXlZvTBpSswK5YjYXGrCCO79jPg3hdwR
 POG1wdQfq4QO6f7JNq1s/CJgCpm662359uW9sY5QIdpPDl+Uui0d9y7VRYZHOHWijGo6fR3pkgT
 ySkhTV0XZ+V7+gQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_023246_574106_7888C5A1 
X-CRM114-Status: GOOD (  14.14  )
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

To easily replace the divider part depending the SoC, split the divider
and gate into two separate clock entities.

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


