Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2EAC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 15:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZjvDxGaz/+Ym5ockvfd8pkGSRzvwp3SWGNBrqT7Ifz0=; b=GZKG+xMmNczwDbqvJKrFbHYXbN
	+rZpYwrkbgr5geKb80suopPv9POlp98zrFMZqzQaXPbruczzcM7wZnnQhwWICZNOZfGRlnRYNwAA3
	x4r9Q5UlH/vN762AEAmB4j9tho1YZfMEKko3izLRSQshKux/hs8omWzzwyy0BvQYk5yajzNAXjZ/a
	zgXwESRLZPzvkckvRb0+EJhlqvrpPYY9keKRW1vMfbqyEKEEtjamAFbfW4riMCkbMHAMPN/+M7I70
	p0ZdnW95YUMSL5Az7DaFO/bmGOL5g0rAw2onsAbOEabKPJtO1GLHjoRC9LckGeMswpXWkUWWfRN7J
	RGncgOGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkRL-00000002bWN-3cw3;
	Fri, 17 Jul 2026 15:25:27 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkRA-00000002bPm-44A1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 15:25:19 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so6977157f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 08:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784301915; x=1784906715; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZjvDxGaz/+Ym5ockvfd8pkGSRzvwp3SWGNBrqT7Ifz0=;
        b=ntQdSx68l3nd3gxR9TYfhYyD1mE18589p04L6Vzm6FjE/Kuw++kMUTvWBqMWvLKFW5
         sppNozKKD6uRzMZcDJL7qlaIUDKkn3AjRBFtUQg2ZB8LLmn90wWJWRW3sSc4U54bk4eC
         H3fzOQtC8hgKsP1NBx/MQgeYyYrHvtrc50lPt8SziTS2cSgosOarhYpIjMr1dLRp55xf
         uGWFhqwx+c7GcZ78Lo5FtJ/M6sZjV6+UNzukU04qUr8nEajbZIMBZbvYQB4BTdvQLauL
         t/NdleSTSrFvYdSVh7dkZAIT68tRKTRpcLqNrAldvBRHLOvnfnmIDDGCzZtwRa4SgQiG
         eUgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784301915; x=1784906715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZjvDxGaz/+Ym5ockvfd8pkGSRzvwp3SWGNBrqT7Ifz0=;
        b=fR31WGWhfu4j3icjPm7d+fdN5jiaAm9fw/jTXoxi+xFocvTgSwnhs1LHb8dVwNRava
         hjtZNVdPhTnenlD/EYsFRA+5k7BZ7OX9AwUG88bIKIuojAm3VB9ExfddsM9zxZdytPvE
         igzxSpRryG879EjfJnhNxQYbvs6uhPlfJv1Js3TsiXbKBD2mTwRORu2xO6llQVMsV7wS
         jHcnFj9UrmPvbFV0t1pyxAGCFRiEqJnhetEhwU6TpMr+lsTn4eEiUHq0RIAi77w9wyzt
         HOrbD6PYMJSdYfvFVkYVXTXE7iO76MDNTLMjjoVy/pLbe4zUFMl/uALnNTllD85IuPGj
         vBdA==
X-Forwarded-Encrypted: i=1; AHgh+RpBX+mfS8JVFQIdITjauZ3dUig57GtXlrcwCbSkCdCQyKl0epAQqaX0ia+59XAN3lGWm+LWi45kMWIHp8P0Q9tH@lists.infradead.org
X-Gm-Message-State: AOJu0YyudtXnznrSlFwRokMSd1VmB0G9zAOx07DcyL7VKK2KF7IIqQGD
	RfTbLeUmfNfUDCd+PQOU8vWFxW/M7/EREfz0+kpPqcMn7e6AeeoodUpQ8BvjOZwRjlg=
X-Gm-Gg: AfdE7cke+lND1qlAtDXdyDp23JWF6WvaQbTNf3Sf2qO9G/Zkp7bcn3bv3WbeJ1uOKXL
	9Gp09Nb3wQI17ITMbgyyatosOhOjbv6dab7EZbvy26xAn8S8BvoNFmM18ceCcU24F6qCz+qHWoP
	Pavn31CqF5AOiX2v19l9WqQKqSrP6WOPpDH0gbvUCgrkl5zx++bpP0XtcCV4WZ/y6ERxPAYw/NK
	+MwOpY3gzTWj+HaeEw9OrxRtBi8cua/CZwjda2IwyQiSfNLjU3qpKIj/nimkFRDMhebGdO/zzIJ
	OyDnZIuDqfnrEZqNOOPGectx/cGoMKP8awKvS16/TO912pGGCmbe7uBlm6VTCORR+dpFg3lR3dR
	/gpUigSz/TIJx1gBvVtjZrGsltMR7af4o31SLJF7jHqG2vTGdpYiYnWL0mAm23aIVMs5MsX3BtM
	D5
X-Received: by 2002:a05:6000:2303:b0:47f:5291:fae with SMTP id ffacd0b85a97d-47f6233bec9mr4275709f8f.51.1784301915393;
        Fri, 17 Jul 2026 08:25:15 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8e22:8a15:f33f:dc60])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f63eeece9sm4855342f8f.37.2026.07.17.08.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 08:25:14 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 17 Jul 2026 17:24:53 +0200
Subject: [PATCH v5 3/4] clk: sunxi-ng: sun6i-rtc: split main oscillator div
 and gate.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-a733-rtc-v5-3-3874cc26abf7@baylibre.com>
References: <20260717-a733-rtc-v5-0-3874cc26abf7@baylibre.com>
In-Reply-To: <20260717-a733-rtc-v5-0-3874cc26abf7@baylibre.com>
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
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqWklOUZjr7y2WuxQfFPTyrAQ07oi9okv23RLOm
 R3EG8Nkk0uJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCalpJTgAKCRDm/A8cN/La
 hUtND/9gWGLRZiqsVGnuaARlPg06QXVbvSuUCKTaYB/564ePeUYI4DDA+VB8WQUs3Xzugzqx8lz
 BmHR+EzBj7XpYIQn1l9k8CVOdXwacybzEXuVQL4WMybY6xZmOK9fLWqxRNm3ZGibQGnTJQn+STw
 raYcri4xgBN8Zt3zWOI5b4Hm8q0WzyPgNUXNT0Q8VX+nj6LcytzgJR00sWp7+n5NnwW01GSNOKu
 RkKwbV4xg40BFjFVzNNtCkrPjcbpQWPQS5GxJxV5N8Wgapti+PfXYEtclRZWOw+V84Xsia8XeFD
 VjT8RBfBgHpRn/uXvSBS1tjEEPOGrmxP8bfiJAlE3MspvkXW2L4bqcZjdzlGE6osA6U8hd7masY
 Xar19j0B5DJBxAV9ZRzIjACTONt0mhLTVOMyB5QVKDiP9Zo0l6xrilWDlU9r0iyh1fM98++/xJf
 F5yUqxAPpO7ps5aMIus5NNGcrnlCEFEOha7FY35C9xjlkxljBtdm2kJZoYcui/FQpM970e3oqN9
 9KqzpEDlBNJ4GT1/Vz9uNxZiDvLAA7Rz1BTicn564gdqKl5Wr5btdDaRsZWGgLyrDaXY7/h8TaS
 ylrEyos2SqTVybeivbBU0lfvXuIdOCf4LQPCq2Tx4arDtEJZa/kVzNC2D7OqOZsxyqssY0O6KVz
 XEmvMHzAcf9nc1w==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_082517_037312_1FEAF2CF 
X-CRM114-Status: GOOD (  14.70  )
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


