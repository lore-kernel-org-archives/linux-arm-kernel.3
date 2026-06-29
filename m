Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A0AC43327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 12:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rSh1ZBRvKf6dioysT8A/x6MNdQs15mKol/PsSCRG53E=; b=NfVnuh9ItRFjO9Z1fQQNM4UGkh
	RiUFrevA+3udd1c9noDNr+D7gxMrhcW3dXWt4fHYM9fAkrWzQNHfNDTYPoGJuOed6TfBkfQIw3qHd
	3EojySgzs8caN0jPpw1egCCbGhU444si9k+rFDjIOAQ5aRTjgwm5viTynOzrx93C5glvjEtZLW6Cs
	x+4vwsNZKRRC0gR2oNUp09IYxUPNa2+vYC8hUPhdWj+6HU5QucqIjF+org1shn6jzmTS18Zje0S/u
	o1KnwIqx6WZkWMfII76UzzjNIAflbns85ywsi6GYqEGbmJD6yqh5nKfhZJTKXN6mI4vLH7cPWNk0B
	R1kVxC0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBK8-0000000EaoP-0pEw;
	Mon, 29 Jun 2026 12:42:52 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBJw-0000000Eaj1-35ew
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 12:42:41 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-493a54b80a5so21169785e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 05:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782736959; x=1783341759; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rSh1ZBRvKf6dioysT8A/x6MNdQs15mKol/PsSCRG53E=;
        b=Ls/G25JF7mIePZfN+NIbj9LPVRxMzXwJHKRmnIPqrJ2zX+1M0jGdBKBSTbwF6WB58h
         C/j94FFrKdd5jkA3Dc4oxzloHhabghv/LFtCY5ChmWD1izVD8yc5glmlIMlh9pCAVd0U
         L7j2EpD7rY2nxD0lvShi08xtTJHmO/aVez2ZaZNERM+jLjyBS7gIG+zI4g1VRenH7r7R
         PG2Ii3yvvRJqNnQTjTjHaEXCUBQ91u9ikrQjChB2GhPxeYtyqTaBsUi8zZM4k4theEHF
         qzqKVc34nrecMRaHlm+TzwNB58YAwWiUv3fMtRysT2Up7dYYRK09xPYVbYvU0lTC1AMW
         HS4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782736959; x=1783341759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rSh1ZBRvKf6dioysT8A/x6MNdQs15mKol/PsSCRG53E=;
        b=V3Wo/hU8gADtdiG6PnMuus0CFCar6RGsfHv0WJAqPFD1/NcHVqjhJ90GXnnTvTF6CI
         zlpVDQ/2Buk3hXg/+78IvaqUhx9wPzQHmQnb2bXKeDK3p24HvEKYQqFTdXUU3wyDQs+j
         H93MNSoNMxzQ/binGdmpjI1II2iQyaDFrYW7Ptorg+fKu6pEkQnJUlnO2Jegcg2u45C6
         kGXmfJCIa9C+5Xv7n+rLa//ELszBafwK07Fr15KDUhCT2Ky4GQqdkDfst9rlmfDSG5zN
         r1gvl+0QztrKhEYTTFG5h8cCvN4+OP9wlKQ4uh8x8iCbPkDGPmK2HI/F/sPXDNvFCXgg
         8fFQ==
X-Forwarded-Encrypted: i=1; AFNElJ9zi24nDvbXl5uPfV0RZKH2kzAAiG3GWQDKZW5jyyiQuIca4w4yubOKQdw7SPmEKj7PKECdmbB8sG/Fm3vjT1PU@lists.infradead.org
X-Gm-Message-State: AOJu0YzS9EwTxYe7R8Vx3YJGdS6rwYC7Q6gdwBcgrIBvwNILNTUOZBzE
	sACmq43BGu+d/HpjVvlxDBSmvDqYD+jTGJ5ko/lHOMnhYrXeZ0oHXUVPuJAXRHF3NV8=
X-Gm-Gg: AfdE7cl9kZqmvjgs24489SEsg0jYP99WFjoFTosf1FqokydyJSitWJjtlgDHeZNMJVC
	crUH4yi+tdgLMEEb2MLObYTxJsmCMLgLNTl88ZqEse97zQ7gL5EvytWO982esjAOz8oVj3417gU
	WDku9kyKga4RSSVf/PksTiGd6OCVWX/DotXH520h5tLQAlW8HHkprEEgjV2wsMSOuiF4z5W0Fuy
	q7ZvFKiPpSY/OwQMkLGwUk3jdfmb4BEicV9Nbo3QEXQAYx2ewgaGTissoQpOCrAexILTpX8RnCv
	KNVG2V2/LZQOWWQ4aHdFBOnzI0FcA04UxGy4anySDEk/rkIQ2I74lbcsVltM82XNyZn97R7mzxP
	Z+DG3wNbyRtyWlTCdYTAtfIHM3OdplRVUsemmo2fhOVAhjW8Ja4KFOKMKEvZGKP9gPSAnXp6iIY
	syJAvWEoE28Xg=
X-Received: by 2002:a05:600c:8b30:b0:492:6eff:7d02 with SMTP id 5b1f17b1804b1-493b71dad66mr10202405e9.30.1782736958743;
        Mon, 29 Jun 2026 05:42:38 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1d21:f5d5:2d3c:23a7])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4730937e18dsm14116290f8f.21.2026.06.29.05.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:42:38 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 29 Jun 2026 14:42:09 +0200
Subject: [PATCH v2 5/6] clk: sunxi-ng: sun6i-rtc: split main oscillator div
 and gate.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-a733-rtc-v2-5-7b72112784f8@baylibre.com>
References: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
In-Reply-To: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
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
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqQmgwCcpAim4iGNmxcdYBHSDfCGlZjMmgEkjlG
 pEgFgGXBn+JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakJoMAAKCRDm/A8cN/La
 haOZEACnFfbvW3FhdzHAFggeUxMCHosJfDMAsVLsgX8coJCaSYo7KTr+uvuDH5zi96kgfbQFk82
 JX8sRKJemEUWdYZWWiBiqVSWYlk0LGOqL1aeqZjNYRpcHDuo+bEZSUute478X/gtGo+xF+Euqyx
 qc7ecT16wVXAGk6Ti6B14ixs+kgmoai6oyYcW7u8hhVpyfsC8+RaawD/4ng0FE5W0U5mhkAtrZU
 quu/IsG8QrFmvHaRy2b+clEQdK9t885FlCriHWlqqv6L0Sq1OLS2oyFpXmtwNpcdx3yrzPr2IIl
 +3EU7yJCxknNQh42OtSEBB+KwnCUUY/mWyQnOPihDWtxWT3Uoc3OVdJsaZdYkOL5zBrttkVmMKr
 d5E5ddcl3ChK4VuC8rjgjMhs19xua46P9haUS4YSlaXtUn3xftoXpfNwtcERxLlxVjAD37M0ti9
 ioQJ093gTZFRC7JPe6LETF2qSlneea758Jm26jQy72/2XhemfiIZUdQ1Vg9iD5zVlFvRDZ4Xv2F
 +WVGtuV6ayT1kuc/vV+VwQ8umGEzGBF5JsTxHTUjPvOxQIy5AncPF9bkWrxrG0Cilc4JNgYNZ6/
 k4f5yOMZyIOlo+C1LPERCOt0MZICSk9UBeQeyrAEqHGaL52hNAQtcQ3b2W1yVzdcy6S0YkN4Wjv
 2JBzJngCguw2AUQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_054240_811631_7587985F 
X-CRM114-Status: GOOD (  14.23  )
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


