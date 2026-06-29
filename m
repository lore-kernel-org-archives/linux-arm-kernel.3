Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ACF8C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 12:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p9gMufAEHeq0Shwigbm5Xg4KyFFoCIavO1i9vrLQZfU=; b=LhGAq0A9C48eMWemk2Zmhv0+tW
	T7SI6guy1yAgPn2k8nJll8EDSD4X1VM8uEyldG3T23bqwRQTn//xu1VqhWrkcpszsExQ23NhZxVm7
	emcFsk+3pmGWlu4QOZctU8EIhV26dYgRwRIwZ/lwqguM+wcK/bnT5dgXcbNYF2EflCBEhkPS/Dl1L
	VycrIj25jgMQ4951088dd+cQK0nC4XGCM1KOafCpgHmsA/YCCo87ngU2IDYkU4jmKyA2UXatTahjy
	tqLY5daq4svw4iNbLpYZGJFpc/LfBd+XSjysLgpROJCmWTJBiqAr+qWxKGvn+MdkSuXDyXC92fGKL
	Cpesql7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBJu-0000000Eahq-3dA1;
	Mon, 29 Jun 2026 12:42:38 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBJq-0000000Eafk-0w3Q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 12:42:35 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-493a440bc10so10350085e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 05:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782736953; x=1783341753; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p9gMufAEHeq0Shwigbm5Xg4KyFFoCIavO1i9vrLQZfU=;
        b=pLZ45APc8DZKDJ98aTgJxwvrpk3EgGYtue6ohHG+9sbzqlaJFVurd9uE/ODV2wdMqT
         BZvjLfeZvCMJ7CTW8+xVoJTWsDW5+O7N9lkQNrtx8KvL0saYHKsaS/kYLiGXD4R8/nes
         JaDCy36sSCUJx0+UMuRZGF8PxcjdL1do+PwtWBXdWWq9yCMILJNTVIOpLm/KF8bVr0ex
         fGGQz6sw34Peu7AbPQK3URveLVrQihOMSWyTClFTBrkk9M1M9LWOvnvxBylt86LW5XdL
         lJpTpuMwgsYBSpBSLWceszJRwkrzwsWEKhu41pfclkPxiazkBq578rdiDpMfujdlwXrc
         bwJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782736953; x=1783341753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p9gMufAEHeq0Shwigbm5Xg4KyFFoCIavO1i9vrLQZfU=;
        b=GO7rnEBU7KvptQ3d9WBTvUyupS0SYL3N+MGcbUb6p6nHIZATP0RWRJTxNKhlgOObeP
         uxV4IBOkjDYjob6qmPanimeGhHF0njtMVeFMQEg+cf1HmDcPW2Vjh+re04jkpa72lLxx
         LUTHdscqSBddPYig5OLe9zwnPVs8i4EMa5WaySU7zvRasFauYBtEL+pCUjthxANDtX8t
         Z7oQwY5J5js/f96qwnqQrDp9meQ4dELkdjHQFNVWE+XDMmVHBO40UKGq3jLeAuibXlLP
         mlyp0kctivpxk89ssZNH62DsE69/SyJriyZgBKP16T7QiYT7hwBrYlIRaGX1LxVfAm63
         tXiQ==
X-Forwarded-Encrypted: i=1; AFNElJ/i55X9EQpFivWPJTrgrTzb/b1hvcqUOO7k9O0USKfqh7OypyNGQrIOc4yS+H24WFCWHa0nm3BawlzHMvCXi+ij@lists.infradead.org
X-Gm-Message-State: AOJu0YxoV8q+CwrQrxraUeW1nR6CmbtTLXYYmiSjaQghq0bZiIROweKG
	efIrhyXUGTGqxPiZobuFQ7UWGVYpPD1X2zH14UD5xMOaVo/XZjArEiiGKcSSgnNBy1c=
X-Gm-Gg: AfdE7cnwFu/msm7TtJedDusRoS0J/r53ug2vxmYhEdlQT4g2EpwzrSu+GjZ9tBSiN1A
	yZguFQ+kdNJV3YdjBZYEbZKutHsbUsgb5o+8nRxJ8S6UeyTGrHBXFPqzihhqdzTk0pPTWL9vC5j
	DPnDbejOd7bsGu4MQnB5iiaiB+3BMOkfeMWz4B8ArSiM9TqxQ5MYYv8s/cDABh9zAu13TKgYoK4
	Ksn1HI358tti+9aBrgCjSr3nHp5K92feaCHUgDnnwXCZ1koE8XvTg2YwUQbCCU5lC7BoLzKqEV/
	93nPTlV5Dh+lTf3TqT9L4quDJAxJsHAIsBKzfDj6RPiqdMbm0+diyGZx4pLz80isVqVg3QW5N2I
	mjsTzWsDrjEDbspsz5FP875DBqUh9AbSR7p7Gi593Rje2cgHuqKNRJXlePYu41wn1UWHlss7mu4
	lFRgYdswEwywE=
X-Received: by 2002:a05:600c:8117:b0:493:a607:f3b8 with SMTP id 5b1f17b1804b1-493b71413demr11373165e9.0.1782736952553;
        Mon, 29 Jun 2026 05:42:32 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1d21:f5d5:2d3c:23a7])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4726b76e6f8sm19182406f8f.13.2026.06.29.05.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:42:32 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 29 Jun 2026 14:42:06 +0200
Subject: [PATCH v2 2/6] clk: sunxi-ng: sun6i-rtc: clean up DT usage
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-a733-rtc-v2-2-7b72112784f8@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2634; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=QIDVb4v67kXTxypoR7T1A+2qrv5ugJGiyI5f/4IznIg=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqQmgu5DnB+eudiTNdZyR8LEcTDWwt/TL8OLgi8
 mOLm0C8spKJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakJoLgAKCRDm/A8cN/La
 hX1QD/95lLPuPyszhXE8d/DJws2q5hAdSAN/+TLFua8a1fFg/xdl1HEmX5SP5l1C7lgaka8FqIm
 rMRKHh0oeizypSTZFQfWkyqPsR8pSx3LiOiKOXwNykN+bmJ4oQqIYKd9LQjKyiFMSUxSmmUbGMH
 hGqFxT6yVW1I76xgw5WCS8tCzdSmePBXggO3hUvLqmE4DU+V/DEokJdKNwmD4zNfxoefthIRnOh
 T9bzIFPN2EiYH1D8oXvkF+GFLqbH6Sl6zpNPLKkzc7HE4fFxE5EY24G1u3VaE0nUlcLn5vEH5PI
 6TrdXRzss5NYcXu6w8m4OnZoUzzSWe6fPy74ExMOrIKH8vUXKsbt632rhR38x7JpO4av+CVwxFv
 XC3sb94OTpYo4I2r5k1uZZz80CEy1BxxcnOSgiDpwWW7dNzsYwivpa8U1v4LrTjX8k5xFILIIDQ
 tjHCt0iDk9qctrHojzZZqsVQdgHiJMY1UerL/4TTdz8NAFah87tu4+TCs3utPCJ3ZRjqAZgAncd
 8iPsOkHBMvKawDAxy82FyLWptvch17SXKekO88Tly3x6sMxR516cMKY04ti/Xm0zJWO+Fyd9cUU
 LG+hzHdrg22dHqqfGNZ4+3ee8nNSvIpsdv1jXwZTeN4oqSvpOsjLKdBNN6Ukri5WQbGGTzKH35F
 WdjsUrDbyv+7IxQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_054234_295689_FFE57C28 
X-CRM114-Status: GOOD (  18.95  )
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

With sun6i-rtc compatible devices, the "ext-osc32k" clock input
is optional for the devices that support this input (r329 and onward).

Probably preparing for older SoC support, the driver does something funny
when parsing DT. It check if "ext-osc32k" is present in the clock-names and
if it is not, it uses the first clock as "ext-osc32k". This clock will
actually be the rtc bus clock so what the driver does is wrong.

At the moment, the driver does not support the older SoCs that would have
an external 32k clock provided on index #0 so just remove this quirk.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
index f6bfeba009e8..0f528bfaed00 100644
--- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
@@ -191,10 +191,8 @@ static struct ccu_common iosc_32k_clk = {
 					 CLK_GET_RATE_NOCACHE),
 };
 
-static const struct clk_hw *ext_osc32k[] = { NULL }; /* updated during probe */
-
-static SUNXI_CCU_GATE_HWS(ext_osc32k_gate_clk, "ext-osc32k-gate",
-			  ext_osc32k, 0x0, BIT(4), 0);
+static SUNXI_CCU_GATE_FW(ext_osc32k_gate_clk, "ext-osc32k-gate",
+			  "ext-osc32k", 0x0, BIT(4), 0);
 
 static const struct clk_hw *osc32k_parents[] = {
 	&iosc_32k_clk.hw,
@@ -352,7 +350,6 @@ MODULE_DEVICE_TABLE(of, sun6i_rtc_ccu_match);
 int sun6i_rtc_ccu_probe(struct device *dev, void __iomem *reg)
 {
 	const struct sun6i_rtc_match_data *data;
-	struct clk *ext_osc32k_clk = NULL;
 	const struct of_device_id *match;
 
 	/* This driver is only used for newer variants of the hardware. */
@@ -363,21 +360,7 @@ int sun6i_rtc_ccu_probe(struct device *dev, void __iomem *reg)
 	data = match->data;
 	have_iosc_calibration = data->have_iosc_calibration;
 
-	if (data->have_ext_osc32k) {
-		const char *fw_name;
-
-		/* ext-osc32k was the only input clock in the old binding. */
-		fw_name = of_property_present(dev->of_node, "clock-names")
-			? "ext-osc32k" : NULL;
-		ext_osc32k_clk = devm_clk_get_optional(dev, fw_name);
-		if (IS_ERR(ext_osc32k_clk))
-			return PTR_ERR(ext_osc32k_clk);
-	}
-
-	if (ext_osc32k_clk) {
-		/* Link ext-osc32k-gate to its parent. */
-		*ext_osc32k = __clk_get_hw(ext_osc32k_clk);
-	} else {
+	if (!data->have_ext_osc32k) {
 		/* ext-osc32k-gate is an orphan, so do not register it. */
 		sun6i_rtc_ccu_hw_clks.hws[CLK_EXT_OSC32K_GATE] = NULL;
 		osc32k_init_data.num_parents = 1;

-- 
2.47.3


