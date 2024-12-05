Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BEE8E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 07:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rbUd4Bjv9Szr1aHrKy8wPCWITceO1kvCtngZZYvRJf0=; b=1qUFDQGQ5fBlaj9riZBjzKpvt+
	/ZWwndtSZgdoYUJNY83wchOuZ0V6uWvtKEv2Sqcl/rVGxQxCf0sfH4sHTFEsHyHJ2X+ztxYv69aWh
	+lT4WwcssH26ne4u249TM8NHCI8lRuikBFNZtuvtgddpUQ5000eCT/9hQD+76hLyTwIC1GA4Ls+3K
	CyewWfTnKKRImMmlWYBh0Hqw614WQwQKaYQ3wkV4dE4lfe0v4smgWaPiyiITEV8wdcuCYsI590QKP
	zQMDa8H8b0yhdWaQd6GXMnvKSmkgCfYLA1/o6bZkEEsoUQtQEHwMGEHIc7womluVJyr8l3kwS9Dm8
	jpzG8SYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ6Vk-0000000F4Fo-12QZ;
	Thu, 05 Dec 2024 07:42:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ6MU-0000000F1lz-3A8I
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Dec 2024 07:33:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=rbUd4Bjv9Szr1aHrKy8wPCWITceO1kvCtngZZYvRJf0=; b=RV6qY7yM/7BTxSYtGANfx+OgCc
	9eR3d6CBzL4McbKjoUB2FXqC2Ai9+cOBbdEDGgreSqUw3/M2cE47K/ynA6iNW7s5D3Wyra7S7N0k5
	BDBXzFKDwT3EFWr15YfN/txiWMPZA3w8boIMnunsWNgslGjpDGZ5uMkStGxR+YrNC/NRGJvpvYoF0
	oMJ5B4ZDAjTCI7EEfol9wPrbHQbgr3vwEmf2wZCuUnyqRRlu5O0BQFd9bizOy0MiMPRDgZdkW9hem
	JPyb7pPXyEEHms2HNQtC8tAphTR0R8xU/PmdK1nfK9hfcSkQtn66KJp7X7GUsq4pwGV7fDPpIlwEY
	rkTumD7w==;
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ6MQ-00000002muF-3aej
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 07:33:21 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-aa549d9dffdso76968866b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 23:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733383996; x=1733988796; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rbUd4Bjv9Szr1aHrKy8wPCWITceO1kvCtngZZYvRJf0=;
        b=Jqg7C629bPyWzJTCXXSeM/pkHbAj1WUgaEiFg3RqSxHJiivkoPyvSwTmmoQbAmLAFP
         gdw8VTbHX6/cRYzIiTgYTcqiANhhYcLDdivlJAmBtjS7QhpALR9MwsUPtDO2Sp8ZrSne
         sy/QNPvHCyllFUpdhPI2hKZ646r1FYWmGe6qxcL4cDlyMbboJR6d6Bq7ZGslKTlWgDGL
         cZ/qbkUiMJYkZogQU4qgS9izWybwDvSgnqC3U6qjSSL5SLanN4FHeRpFmEEAVod2kBQx
         Gu+8Isqin58GM4iYfMT+SvQik0LyWDEF+Fk8ue0kmmdBeOLM/VBA4EQqutXEOSG0v6xV
         nhrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733383996; x=1733988796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rbUd4Bjv9Szr1aHrKy8wPCWITceO1kvCtngZZYvRJf0=;
        b=eS6Byg2nanejHGZhAqrnmLfNVuyLpSnnla9ZGzrxZX44hwlR3DueerRJ+vN0efXoA2
         WawTosqoZVq/UQm3mWgcTZGDtmwGSXyQ6f9WHl+3pPbVHukfgdhfBm8Yh1U4cFDJQNLw
         NNAiPapVPgE6MX+LV+xxPkjBWgpJt2IvhA7mX2skNJvvkLxgkYN+6teYGf9UFjnyzzrF
         IzLqpvEMCHYebOpUoieuGwqarn583nmNr3esCI0ZcnWo/myAR7A1Z/oQ2cxNuNKQ+j8l
         hxMS9SSQRt16bpB6chyrXi9zn240TrrAlkQutHKn8+ZjCa3jH0CKn3N5HVxALUiejSKO
         kdGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUatUq7LylhLTd2sDiCBEBnyW2jgATr6pMDXYNv6Yv6gde+FN4OGr17uFEsDGitM8YbnVqlELJG5cJd+PxxTCrB@lists.infradead.org
X-Gm-Message-State: AOJu0Yyl3ObnWoYtheTltb8Q81PD/3W9mZmUgkXr6gZc6KBPOXup4tRK
	gKEoSkbVqqlptMjqc6QlcvtkOKczjYJBwZa32QKErtS89HOq9g6Rg0aJkMw60Hc=
X-Gm-Gg: ASbGnct1xbGle+2yzV8IZL11BhwHMUFbDWpK70NRwAXebUJ5Q3DBf1Z5rLhV2j6zwRk
	zVCpBx0N+KGQ5jRpXdeHJrryQjxoE8LCkihYjaEXnukXb4bcqNlQDVVfSjKrUJS0KUcAouurPk4
	JVKghq4trQ9/yryWdAr3G/tObns1KcMlbIkR8SSTaQUiu0ydxrTnLQxa+mHN7bvZ/Jz1zM4Xgkf
	0tOwJNQm0V3oJSOumXSIOucXih1sfUwCjIOA7pwv7qEYpF1IZyl+HyJEMyPo/RS/EVQ/s0Jx8OR
	5zFQbzqh3E4ADJ9+y7Oxvh/MNKQGonpfqw==
X-Google-Smtp-Source: AGHT+IHNHlztvnn2YKPTupPy7irtmhcD07q8bL0o5UzylQP2VhznMrbt8FYseED/HYM9kfIhmtmXwA==
X-Received: by 2002:a17:906:23ea:b0:a99:5466:2556 with SMTP id a640c23a62f3a-aa5f7f6e957mr634121766b.61.1733383996464;
        Wed, 04 Dec 2024 23:33:16 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260888casm53371766b.133.2024.12.04.23.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 23:33:16 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Dec 2024 07:33:17 +0000
Subject: [PATCH v3 6/8] phy: exynos5-usbdrd: gs101: configure SS lanes
 based on orientation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241205-gs101-phy-lanes-orientation-phy-v3-6-32f721bed219@linaro.org>
References: <20241205-gs101-phy-lanes-orientation-phy-v3-0-32f721bed219@linaro.org>
In-Reply-To: <20241205-gs101-phy-lanes-orientation-phy-v3-0-32f721bed219@linaro.org>
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
X-CRM114-CacheID: sfid-20241205_073319_057768_53EA7B15 
X-CRM114-Status: GOOD (  23.27  )
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
index c1ce6fdeef31..206483c7ca55 100644
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
@@ -1701,6 +1727,10 @@ static int exynos5_usbdrd_phy_probe(struct platform_device *pdev)
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


