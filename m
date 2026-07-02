Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0520EC43327
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 08:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1QZ/tzJaIkMNpKGsZtD20B+8zLkYYTOKlJtJuY0qjaA=; b=SD0iiIBo03NvvF1+yE3OsnNPHJ
	GZ/dfmceC+fwMTnWTYmxti3k06dDSep9AVlh7BBsVP9mTJ6CbGANM/1+Ckyyc22JKS912i63o27Mz
	nYuOBNBkEuLXvwka2CQ2cnU4zi8/aP7fIQB3B7mJ5M5WpIsKfC80rROi3ULb1Nnqq65WceC2CrAIn
	pwC0/eInGrn/SwU1aJlNt4rXcotQ4Uz70Mnqte+PB8GugHg/Zwvr73AXVw1RknZ/KeYSMnnM3FcJ7
	TgPAb3x8qRV3j7ZWnGXRs+Rp1H69ngHTI/nwiNGGJUOlpqfrrMVvD3KA5qSViiLHbrzHneNFTC3L7
	2uSToqyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCVd-00000003oEt-0OAN;
	Thu, 02 Jul 2026 08:10:57 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCVa-00000003oCe-43hH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 08:10:56 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-4720d22c94aso1356968f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 01:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782979853; x=1783584653; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1QZ/tzJaIkMNpKGsZtD20B+8zLkYYTOKlJtJuY0qjaA=;
        b=P7Bd0Urc1O/uVTtucRBT6AWfO7yvXCS5B1+A9DnI6fs5+EXt+HZ4WWz0Z/e6lqluLd
         D+v0kvj8ghSQmSa49dN2yM38VTXbxFdT0iu/coiWcpvLQLRzKeZusuAHVKDKzVW/NkIo
         w6j21yGRhQZCELZIlz7RFoakafMrPSD+QFdspqdorm0UItdCgPyfPVQ1z9IyCw1wiKZq
         XrCvZcOFA+n6LTkr6n1yXKPDfQvgrzHC8mx7rbMWg3/xhmYV2fm7cOc9xxyI7mxmd9SV
         Ss8PCxNaJp6M2lvUtG3mjVgDtMElEE8OODPazR09Lsy2bL4RTl9rbLRkOnemvGaCPVIQ
         UTEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782979853; x=1783584653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1QZ/tzJaIkMNpKGsZtD20B+8zLkYYTOKlJtJuY0qjaA=;
        b=Rz8qfHt4jkLGlOSqO/T7DzmELyUKQ4GSc2eOxGWTBt2lsTH0f9N3rTfb8dO0p1TMhs
         zVJ5VGaUnGbDoPpRg5QTn9hFuzj6qZpIAjb2Qrt79Cgga+wpLdF7pjR1VGIjb9m1iWyP
         3GwTUSgcVPE/CrGzNiKpj/rsqLrAwa/jAw9zwN+q5Cr2EnVUyckKRmg0tzLY/wZDc+ji
         IbENPfBY7inzUxyko573+wazw0oJ42nPNUHGjvbD5SlzFJiy26y1hJSb5e5TUcKzDMK3
         K2ikUsmHjbLksZ8JiwuHcmG6wB5t70EJ3oDe5QXR4rxTs1WXOrv7O8gN8MS4EDk5cSRH
         zteA==
X-Forwarded-Encrypted: i=1; AFNElJ83jED7XFZMCKE2oq4NFBBBL5w5/sWcuMx8U6bUB9S++Kf2VUG6ddIsDMBno2lzidprOqpP/2eF7mD5AKjK1icP@lists.infradead.org
X-Gm-Message-State: AOJu0YxuidZAxaRcBoGlTAPUpX3g+zrpL9NJAI6W5SW4dHtNNQvOhvF4
	k3du/EMVtEZY8xsNA2zis0N23MafMoePgCk/DUYQNGCChRtT/j4aXad9lamu8cAnCro=
X-Gm-Gg: AfdE7clKCJjYuZS/ayZgytEL+YAYY67CAcZKtWUDd1NyBHVm2pnmb1QHMaXu4rWn+fU
	b6Pffy8ySloo/ALXBZfHsYm8eiVl01rGNibMce+NIKpOInX8kKq25JeS4RvY2mRKft5zpi3unEW
	EYSuoDxhGjwbPR7c7cfzGwZx8kn3scmHc93ZvQyG/qMwwFEKE67bnn72ZTi3rMDlZfnGPIyBOYH
	YOKabFP7hhIwGn2TDL1TjmzIe9kcY63Rw3qo8HHjQep894YtljFpCh9Mp/drTGn0iQtP+caTO+n
	vVPLqhaYzz+sml37ataQ81oVnhFBiPU0zliBwLupwGDzMir5CXES6A37OHLUpC+FoTsYEjNyfOU
	+LUfW3MRiBryiDsj4phxeiNXuZQiz+A/zhcv//f2JEmhUg8Lg2M4nwbuDoyhpd0EEKqX8JMyTP0
	yiaG+SrQ6ieFo=
X-Received: by 2002:a05:600c:a4b:b0:493:bef8:ba8 with SMTP id 5b1f17b1804b1-493c3dfc635mr53639805e9.39.1782979852907;
        Thu, 02 Jul 2026 01:10:52 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:2e3a:7dcd:d2a4:6556])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493bfe7427dsm70001875e9.2.2026.07.02.01.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 01:10:51 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 02 Jul 2026 10:10:03 +0200
Subject: [PATCH v3 4/8] clk: sunxi-ng: sun6i-rtc: clean up DT usage
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-a733-rtc-v3-4-eb2580374de6@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2679; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=0uBL/FtS3qxYddEpWPm85zwv8RTdX1Kl9yqgj170ams=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqRhz5uKxhDHKubvZxQtlYpXYIvwPrXCLC0seV1
 WNDhZX/FeWJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakYc+QAKCRDm/A8cN/La
 hUh9EACSTxeO/WGvg3k425s7xQALo9JT+meGwuevXCEpXNGpfJmYnCeWBOdYw76IaUfLZz8piWu
 fiie9pcLKv1IbGsRhzkUQ7XXb+AWMbWYTy18NjnDAw3JR02bSjqY31qrNTtj82Ih153RgolV+R3
 GGRtx8Uz1+F/a/RDy5GWAInXgSjazJtka1+8wQIXbpx6Tb4fnXXhUEsROIJlCGLx+GYAGM2Jo6N
 Yb/OBdqgFyOez1K4IgYerUPByqDRq9jRpN0FOR436buNMnAT+gAt7crVCsKOTHpE1TEkTqmbvUs
 abVPh1Xlf0XYjv/t8Pu9E/jCgA2illPyEo2OHZWAqfDexBOATbzlUJHAIiMOGrHEIGgipt81JtU
 dC1hmgoUzL1fkDvnkbwya7VSwPMtCYVTLNAvvPNu+UPq76zDxvG5xNmJGbJaAdFp/nZShjy2l1x
 KaBHVbcJxomgjd7eHdzdAaygeCz1OFPyd2iSNaTPCme9xFnKGDbC07oxPyYMsWHz807sGzm8lbE
 P8Z2fu5YN0DeEEZvIcTDYh5B7kTyjcpDYeYF7tPnQXGnnJ5aihpkIZMs1R1IPavzLOosR+BAXzm
 VU84Lp4KFojc8TShzVyouOFSlPDx9zE8qRCNN14oHHIJb6hMwcqlSMXGCMk09BFbGUt8yq0HLrL
 vPhFA0vSiaoyD0Q==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_011055_042001_1982B718 
X-CRM114-Status: GOOD (  19.07  )
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

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
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


