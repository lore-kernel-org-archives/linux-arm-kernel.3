Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E12E77179
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 16:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HPP5c8pu/eBBjcmsKsNPv6zfp1yvfxbHuQGEFAVxnBk=; b=TDzgAs3rQED27mt8ylD+YB+zXX
	CWxxsNTpj9Zn8ysWvMMgu7n+yZSnOSFRMKmDyBwgeVdQUrOx1Y3VrqIv5C9jqsKRg7QFF4YXUpqVc
	CRykRdCUQEuJK7izFudDmNyxfQzY9vFI8uMbKQlkPx+8lrGxXhFTgXBKehhUGNxi0yNNyQ90IK87J
	P3OPniSTwDPSLE5vegP3EGqwb0KdMEUd+73X/AnYCT5b8jRe54y2GQgppPBLXREiHACah4jTjVISC
	oNLz6GiOS+Tew7b8V0Wyc+m4sg0CglV9uDeAQV+8/r40rCim1OKl/0VBNzSB7wn2u2foLkGapucvQ
	O585F4AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbLR-00000002CJK-3q4B;
	Fri, 06 Dec 2024 16:38:21 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbEQ-00000002AEn-1R7v
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 16:31:09 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-aa1e6ecd353so350568866b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 08:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733502664; x=1734107464; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HPP5c8pu/eBBjcmsKsNPv6zfp1yvfxbHuQGEFAVxnBk=;
        b=dAx9JobJTKXKinzerbtbmxC7z53runLMUOntSKQexWkPOTwgdOCn2KHDPX8nlmUinN
         bwl91tC+Ou7LIxGNwAWRQBZNbZyv2c3u1jBGyCKN/YmFsM8DkPLmNDmX8sI18KgTqr0I
         lNv/ZhILF0qjXU9Hb0V9za2eBoiE2i5RgR3bRSyChGj+wU0+bwOs4/2BbIn2upN3gwly
         Q5KZ5HQ9Y2kgozBiV4DC39+BvYD7IucN2FHOjZyNH8s45cxnxeFPTLS/hV5PTRKpuuWc
         L/1OKk4jYpWRv6Gfeo0Uaa7ucpYImf/Uz3Gn6r34u69c9ysmtx0tpHGCvLC08eR14Xig
         IAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733502664; x=1734107464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HPP5c8pu/eBBjcmsKsNPv6zfp1yvfxbHuQGEFAVxnBk=;
        b=RkbO82DkLndpmkXe6Lxdbpbzn7ACHMzaWmCca8RHVQ0KPyyDq092vlVQm9WVaqWRg1
         NP7um9T0TjOcoeJoeEtaDw/VWvAV2qVqJ2GymuyZa1Dewu5NveLbVYH3c2tKMJp8ES52
         6LTQF2z/z7lXnKA6EBaIxVpaYeDRIG88LfX0/71wDh9he0r1p5tx6VP8IC1D0dVQ8FxW
         j4kg8UJ28wYAaJAQM4mX69z7sSOiu16n6F77wKg1OxTEEK+oxRxpiS+N/dtyfu9LP5dl
         41xpYNd98qSeuzfyEsjObNkjwv7UsT5wI5EHnER5sqb75GNsVY0WsihuGDj2ex517YFG
         IAlQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+LDj8pOl2k4iBytE7puf9RWWF3p9rqAfgGr/ZuB9CB6rj5qTn0CGkUfdYCO+OOU8ODflE2d8uO47vAinL+BP1@lists.infradead.org
X-Gm-Message-State: AOJu0Yw17bbhaKT53e5EfnPtoXD8AjGlyBsqAInEwvnaOinXSO2cRnqz
	0USzuPfu5UhAnWvADy9Dc4CN/Q1kHau6HgCvzOBEHRgxlIErdZDAQea4zSVstUc=
X-Gm-Gg: ASbGnctT4AGeZ7FjR9kdONar0ej8jJw1bUJNFOh8e0j5FJh10KcUVuoAOpbnePzQbrv
	CAJRJj2uEJlH6tW8Gra87VS4ZYAcKNYXpzT/m4I6802D9Myzg8rgh09Wff88/td4fJFFiXm4t4e
	kG+vGxdcndAhu+qAGl2J1x7XNgCl3MWUupQSLgf9Qir96sseP6VwWudwxSou6FAo4+NUk6daohR
	YQxvFq+M1Rig9aTjBF0hK6PvTuuiiNuJejhdpBh1xKI0slHTWeX0Gljz4Qdjc4aOAciurX2ygaz
	acDsXB3+9jeiO2m61me072LRtX1JCYPTqQ==
X-Google-Smtp-Source: AGHT+IF0uwzYhahKwpQYpBdboLh/QXBH7mKUfu774OKt/A3dvzGhzk66TWaKHzqzwzigsHn6DM6krA==
X-Received: by 2002:a05:6402:1ec2:b0:5d0:cfad:f71 with SMTP id 4fb4d7f45d1cf-5d3be7215damr8856222a12.32.1733502664348;
        Fri, 06 Dec 2024 08:31:04 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260e8af8sm257710266b.191.2024.12.06.08.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 08:31:03 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 06 Dec 2024 16:31:05 +0000
Subject: [PATCH v4 5/7] phy: exynos5-usbdrd: gs101: configure SS lanes
 based on orientation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241206-gs101-phy-lanes-orientation-phy-v4-5-f5961268b149@linaro.org>
References: <20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
In-Reply-To: <20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_083106_378262_E8AC6710 
X-CRM114-Status: GOOD (  22.76  )
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

USB SS lanes need to be configured based on the connector orientation -
at most two lanes will be in use for USB (and the remaining two for
alternate modes like DP).

For the USB link to come up in SS, the lane configuration registers
have to be programmed accordingly.

While we still need a way to be notified of the actual connector
orientation and then reprogram the registers accordingly (at the moment
the configuration happens just once during phy_init() and never again),
we can prepare the code doing the configuration to take the orientation
into account.

Do so.

Note: the mutex is needed to synchronize this with the upcoming
connector orientation callback.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
* collect tags
* replace #include typec_mux.h with typec.h, and move the former into
  next patch (Peter)
* commit message typo (Peter)
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 72 ++++++++++++++++++++++----------
 1 file changed, 51 insertions(+), 21 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 2a724d362c2d..61e0de4b3d4b 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -23,6 +23,7 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/soc/samsung/exynos-regs-pmu.h>
+#include <linux/usb/typec.h>
 
 /* Exynos USB PHY registers */
 #define EXYNOS5_FSEL_9MHZ6		0x0
@@ -209,6 +210,10 @@
 
 #define EXYNOS9_PMA_USBDP_CMN_REG00B8		0x02e0
 #define CMN_REG00B8_LANE_MUX_SEL_DP		GENMASK(3, 0)
+#define CMN_REG00B8_LANE_MUX_SEL_DP_LANE3	BIT(3)
+#define CMN_REG00B8_LANE_MUX_SEL_DP_LANE2	BIT(2)
+#define CMN_REG00B8_LANE_MUX_SEL_DP_LANE1	BIT(1)
+#define CMN_REG00B8_LANE_MUX_SEL_DP_LANE0	BIT(0)
 
 #define EXYNOS9_PMA_USBDP_CMN_REG01C0		0x0700
 #define CMN_REG01C0_ANA_LCPLL_LOCK_DONE		BIT(7)
@@ -383,11 +388,13 @@ struct exynos5_usbdrd_phy_drvdata {
  * @clks: clocks for register access
  * @core_clks: core clocks for phy (ref, pipe3, utmi+, ITP, etc. as required)
  * @drv_data: pointer to SoC level driver data structure
+ * @phy_mutex: mutex protecting phy_init/exit & TCPC callbacks
  * @phys: array for 'EXYNOS5_DRDPHYS_NUM' number of PHY
  *	    instances each with its 'phy' and 'phy_cfg'.
  * @extrefclk: frequency select settings when using 'separate
  *	       reference clocks' for SS and HS operations
  * @regulators: regulators for phy
+ * @orientation: TypeC connector orientation - normal or flipped
  */
 struct exynos5_usbdrd_phy {
 	struct device *dev;
@@ -397,6 +404,7 @@ struct exynos5_usbdrd_phy {
 	struct clk_bulk_data *clks;
 	struct clk_bulk_data *core_clks;
 	const struct exynos5_usbdrd_phy_drvdata *drv_data;
+	struct mutex phy_mutex;
 	struct phy_usb_instance {
 		struct phy *phy;
 		u32 index;
@@ -406,6 +414,8 @@ struct exynos5_usbdrd_phy {
 	} phys[EXYNOS5_DRDPHYS_NUM];
 	u32 extrefclk;
 	struct regulator_bulk_data *regulators;
+
+	enum typec_orientation orientation;
 };
 
 static inline
@@ -647,22 +657,38 @@ exynos5_usbdrd_usbdp_g2_v4_pma_lane_mux_sel(struct exynos5_usbdrd_phy *phy_drd)
 	/* lane configuration: USB on all lanes */
 	reg = readl(regs_base + EXYNOS9_PMA_USBDP_CMN_REG00B8);
 	reg &= ~CMN_REG00B8_LANE_MUX_SEL_DP;
-	writel(reg, regs_base + EXYNOS9_PMA_USBDP_CMN_REG00B8);
-
 	/*
-	 * FIXME: below code supports one connector orientation only. It needs
-	 * updating once we can receive connector events.
+	 * USB on lanes 0 & 1 in normal mode, or 2 & 3 if reversed, DP on the
+	 * other ones.
 	 */
+	reg |= FIELD_PREP(CMN_REG00B8_LANE_MUX_SEL_DP,
+			  ((phy_drd->orientation == TYPEC_ORIENTATION_NORMAL)
+			   ? (CMN_REG00B8_LANE_MUX_SEL_DP_LANE3
+			      | CMN_REG00B8_LANE_MUX_SEL_DP_LANE2)
+			   : (CMN_REG00B8_LANE_MUX_SEL_DP_LANE1
+			      | CMN_REG00B8_LANE_MUX_SEL_DP_LANE0)));
+	writel(reg, regs_base + EXYNOS9_PMA_USBDP_CMN_REG00B8);
+
 	/* override of TX receiver detector and comparator: lane 1 */
 	reg = readl(regs_base + EXYNOS9_PMA_USBDP_TRSV_REG0413);
-	reg &= ~TRSV_REG0413_OVRD_LN1_TX_RXD_COMP_EN;
-	reg &= ~TRSV_REG0413_OVRD_LN1_TX_RXD_EN;
+	if (phy_drd->orientation == TYPEC_ORIENTATION_NORMAL) {
+		reg &= ~TRSV_REG0413_OVRD_LN1_TX_RXD_COMP_EN;
+		reg &= ~TRSV_REG0413_OVRD_LN1_TX_RXD_EN;
+	} else {
+		reg |= TRSV_REG0413_OVRD_LN1_TX_RXD_COMP_EN;
+		reg |= TRSV_REG0413_OVRD_LN1_TX_RXD_EN;
+	}
 	writel(reg, regs_base + EXYNOS9_PMA_USBDP_TRSV_REG0413);
 
 	/* lane 3 */
 	reg = readl(regs_base + EXYNOS9_PMA_USBDP_TRSV_REG0813);
-	reg |= TRSV_REG0813_OVRD_LN3_TX_RXD_COMP_EN;
-	reg |= TRSV_REG0813_OVRD_LN3_TX_RXD_EN;
+	if (phy_drd->orientation == TYPEC_ORIENTATION_NORMAL) {
+		reg |= TRSV_REG0813_OVRD_LN3_TX_RXD_COMP_EN;
+		reg |= TRSV_REG0813_OVRD_LN3_TX_RXD_EN;
+	} else {
+		reg &= ~TRSV_REG0813_OVRD_LN3_TX_RXD_COMP_EN;
+		reg &= ~TRSV_REG0813_OVRD_LN3_TX_RXD_EN;
+	}
 	writel(reg, regs_base + EXYNOS9_PMA_USBDP_TRSV_REG0813);
 }
 
@@ -700,21 +726,18 @@ exynos5_usbdrd_usbdp_g2_v4_pma_check_cdr_lock(struct exynos5_usbdrd_phy *phy_drd
 	int err;
 
 	err = readl_poll_timeout(
-			phy_drd->reg_pma + EXYNOS9_PMA_USBDP_TRSV_REG03C3,
-			reg, (reg & locked) == locked, sleep_us, timeout_us);
-	if (!err)
-		return;
-
-	dev_err(phy_drd->dev,
-		"timed out waiting for CDR lock (l0): %#.8x, retrying\n", reg);
-
-	/* based on cable orientation, this might be on the other phy port */
-	err = readl_poll_timeout(
-			phy_drd->reg_pma + EXYNOS9_PMA_USBDP_TRSV_REG07C3,
+			/* lane depends on cable orientation */
+			(phy_drd->reg_pma
+			 + ((phy_drd->orientation == TYPEC_ORIENTATION_NORMAL)
+			    ? EXYNOS9_PMA_USBDP_TRSV_REG03C3
+			    : EXYNOS9_PMA_USBDP_TRSV_REG07C3)),
 			reg, (reg & locked) == locked, sleep_us, timeout_us);
 	if (err)
 		dev_err(phy_drd->dev,
-			"timed out waiting for CDR lock (l2): %#.8x\n", reg);
+			"timed out waiting for CDR(l%d) lock: %#.8x\n",
+			((phy_drd->orientation == TYPEC_ORIENTATION_NORMAL)
+			 ? 0
+			 : 2), reg);
 }
 
 static void exynos5_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
@@ -1184,7 +1207,8 @@ static int exynos850_usbdrd_phy_init(struct phy *phy)
 		return ret;
 
 	/* UTMI or PIPE3 specific init */
-	inst->phy_cfg->phy_init(phy_drd);
+	scoped_guard(mutex, &phy_drd->phy_mutex)
+		inst->phy_cfg->phy_init(phy_drd);
 
 	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->clks);
 
@@ -1203,6 +1227,8 @@ static int exynos850_usbdrd_phy_exit(struct phy *phy)
 	if (ret)
 		return ret;
 
+	guard(mutex)(&phy_drd->phy_mutex);
+
 	/* Set PHY clock and control HS PHY */
 	reg = readl(regs_base + EXYNOS850_DRD_UTMI);
 	reg &= ~(UTMI_DP_PULLDOWN | UTMI_DM_PULLDOWN);
@@ -1698,6 +1724,10 @@ static int exynos5_usbdrd_phy_probe(struct platform_device *pdev)
 		return -EINVAL;
 	phy_drd->drv_data = drv_data;
 
+	ret = devm_mutex_init(dev, &phy_drd->phy_mutex);
+	if (ret)
+		return ret;
+
 	if (of_property_present(dev->of_node, "reg-names")) {
 		void __iomem *reg;
 

-- 
2.47.0.338.g60cca15819-goog


