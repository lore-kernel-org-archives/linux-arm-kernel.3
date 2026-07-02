Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64CB3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 08:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rSh1ZBRvKf6dioysT8A/x6MNdQs15mKol/PsSCRG53E=; b=c6KRNkVD/5kazyd/VE4cCPX6oC
	RidSSbHWiCvmt3yShyxLefNJd4X+07ovl3vwxfF0bT1y0THIOteORUUfFnpEhWB2+umJdt0YrtHtT
	c0Ff2aKafwLnkDhNLwD+y4BXl7IA7MmPSWB4k/unbHolSnOB+PnYWjRv8C/lC77XZZAtk7r+JSWGs
	0W17bJ+yEaV6uu6SyePRveteyY6h3LTNlkECYnTylk6+0TCwHov0Rh8JbtDMbZVdpzt+AEo2tXTFm
	/f50SrlHLJT7867DPyF7ByMeTILigUXeYeLGJPt/xZa1h1bJ23ArRhaIyzbDjs/a3adKlWUCDTKr0
	K6ZnYsDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCVj-00000003oL2-2JNR;
	Thu, 02 Jul 2026 08:11:03 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCVh-00000003oHp-15n5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 08:11:02 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-493c83474ddso237285e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 01:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782979859; x=1783584659; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rSh1ZBRvKf6dioysT8A/x6MNdQs15mKol/PsSCRG53E=;
        b=ZOD3zTjtzod8Le4967bZQtG7Y/HwZq93CYj+XLSSRkTlC2MDjwVKFL6vhWR6fJBdI4
         mpVWntSzE22HNvVGTYIahQ7cJ0eDdu7ijSCAoeaF/xw8rTRYAEY3aZbdcJG6RlL8YJ/r
         1zTdPUhllovJr2ycFlJfPoU0M0o4Z5XhD2mS/TY0VCKlMlgDmx+p/rvTOZxJ+Xd2zotk
         KYjJV6QmlwPkGHraXHp073vackQXG3mBOnGSDjGd/Kq2Th5C/neajKSZHAU8oK4+Gekh
         ohyn9oxDaVbZz3XkQb3E+bEzIGBUTc4ig4k3VFOOThSaCT4P3s18JW2SQ7K7PAlGAO8D
         DU6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782979859; x=1783584659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rSh1ZBRvKf6dioysT8A/x6MNdQs15mKol/PsSCRG53E=;
        b=LPPkeatgNhaccW59lA0N4zPVY9K/8qAQ2WBh/RB7zlBMqt5z8+Z2ncPwuYi4Z+c8Cn
         kEeMbCpC6b+1Au5TcfiK6VFGlhAW92hFBP50nY1o+AGIe5297DH4bqt+5ZgYlU5Na5Hl
         nWs1rsS7JxwZrO15hfm73Xhez3PAwaezKHfdWOONLw8iycu/eA1AbW6pb5qHD9tSiMGA
         qQTXB+OHZ9+gEbA7U70lc6qzVnuj6mQ16M8GLVQBsk2Y64xhyjRBWT4e4YqdkoyYbRBI
         rYgGVbKfLOfTUj2Vnj8QmJ/CUn7y6CoAcur0F8TS39y2n3BHHCqQdJsKMXTVZ50sgi1f
         b64Q==
X-Forwarded-Encrypted: i=1; AFNElJ/mm6xy9mGKHTVKE5eaw1wYXdIQ4gldQNs9TotvJ+T6TSUcV4/LSmvU1DBRWQfCzAJTErdfdKE12OhC/FFEtxMo@lists.infradead.org
X-Gm-Message-State: AOJu0YzTVboJmChFZwBxYeAs6MmHEtk3SLBBnDvuHpnYTqz3Rjx0dmHB
	Etgx8MQskzsiwgb3C5UlUH6a/1ubhLwARVKaak2raB1bgCBDtLq/RcVEDyhCh8KpGcc=
X-Gm-Gg: AfdE7cntkAPIaJeTwOXe+UcETW1Ue8L8+yJTcBAXIvz6RtWVYVOqpxI6t3ogrMRlDL2
	YbZwG0S4cpDQ583d6EcWKCr0UGHJg6CDnchq/3vlACa6CBf+88qcpIdiRuQbVUIudVDwmp1zz6x
	uqjhbcB9SOhnPWqdsMfQPDsTBjfpRNYb4G8CZUHaRz7Swn8PhKTrT2kIDdt3VM+HsqqhJpnLCfe
	EHlB+tA0SCjArHWVrIzKT5eq+Ny0vcoXGsD7QDvt0bWwTMzsIdTJGxi2yCWjZv7FOUJqns03c4n
	GgUR/NOtcXMnE3HTk119Sl59UQhS0PpKbNwM8LYAB7hziLqPz2x7t90hCcmvWRtWl7dlUobKb0k
	QbyrIvy7PcZgojywtiH80DApOxcMofJh3PVlyiDQVV/5wRLGR59QpN8jopCDRutiYkR2rj25clV
	czdIC3gteWWkS0wdfV6Ye4OQ==
X-Received: by 2002:a05:600c:c046:b0:493:a8eb:5145 with SMTP id 5b1f17b1804b1-493c3cd4ac7mr42700915e9.4.1782979859299;
        Thu, 02 Jul 2026 01:10:59 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:2e3a:7dcd:d2a4:6556])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493c6372a31sm30759565e9.13.2026.07.02.01.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 01:10:58 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 02 Jul 2026 10:10:06 +0200
Subject: [PATCH v3 7/8] clk: sunxi-ng: sun6i-rtc: split main oscillator div
 and gate.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-a733-rtc-v3-7-eb2580374de6@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2479; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=mDE5aNV7J0YTDC++0PyqpQq+1LRXe/OEq5dNJJriQq0=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqRhz84Va+eOo65gJ7r3N6Uf0cw5m///ZPyWWed
 jMOv7SogdyJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakYc/AAKCRDm/A8cN/La
 hX2JEAC0IHxsjEu2zR4yluC1t2Qb1R/L4bdk5ZB2cG6ZO54dIfcruEioVYrQy33K0Ed91Qx1xdE
 60I8i6/hGKoLimMfyWJbAVqKQ29WXMVpz3nY2R/Qnv46o03/dSHRoXFaA6/lWNtZohRlcktfxh8
 pz87aKnhsIc/yHVwoXXniWAT3FpyS4dWoG2odR05jydF7opAW1I76KngNaxEhoKAepZS1/2Pbd4
 L6GlU6TUuzQmxSpqK6hyV/ltMo7+8DnGIjjaH5/LDcBkvUXgf6jfqqYWtetU3AALKJYIsasG+Qn
 eC7Ypky8gYw/34RmJ4M/vKUPr582khMcs9Xi9eOFXS1Zk9YSLncqBCPFLxkvkbLfk+E7moeGo4g
 k/6ux28KThwQx49b/VFGIiAxQKJej3xUtaUY/22zhSM2QKrSAcnSTnBneywFJLzOraENmnJCz/e
 VU257QrLk36zzQqVJcg7MvDtSK2PFYQ6yloz+IGekf1LYV5pCGljTyXowMn0U+uOAnh06SZKyuO
 BkF/Flqz2jcmaHNMsOvAHn7hL7P8HrAIJx4Iw8v3a+/mhvHAoq6nCKnSZ1y2BDMJpxj4qyCVYKF
 2ZMJ0jLwbj6nrVsCADE2p0X9xadDN8s3baLJGDZCxm5FtiYxyB5kZCQXDcQ2LM7aR8Rh1+zAq8D
 6FeMPTX8vOFg/lg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_011101_334706_6EB60C90 
X-CRM114-Status: GOOD (  14.43  )
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


