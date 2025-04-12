Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 195F2C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 20:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=olWmtpJVJyP5ihquepeKVhUKSgcRCRnX8hMSMQjAVm0=; b=Hkm+iVfa/smE2MsTR0HW4CU4+m
	06iPgzpFGv1yKsJ389dhDPMsLBbul6ld31kRugZWqFKM6tKhOZHgJyZRlUFYhPXx7FAsSZbaWI6/v
	sYf4WOiSKVIxmNI2wrAu7QE5pl/N3pk8KtTXK8tdWlfWYX/QKbjSAq9P97v9eOTS21gqV4yZLOd7P
	KEGUcEhmB8Td4na150oT5xiHPyxSU+O/EPyQt83EhyP6Xb6YfgDXgwR1Befh6Mz13Wt8jq/qErRxD
	Lwgwf/W0aw9/wK1FgKCfOOTwnDLepFHk3D6cJ4Xd8OnEix7QgGt0nw1rcmPndgYEDgUhRMJV7TI1d
	tIrjt4sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3hl4-0000000GRJ1-1cLD;
	Sat, 12 Apr 2025 20:47:22 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3hRX-0000000GP5t-3ehe;
	Sat, 12 Apr 2025 20:27:13 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso14965305e9.3;
        Sat, 12 Apr 2025 13:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744489630; x=1745094430; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=olWmtpJVJyP5ihquepeKVhUKSgcRCRnX8hMSMQjAVm0=;
        b=AeCQ5TGxMKGDAi4pe7sTw6O0+0Kk/28aPjtoDnyF+1JMx1CjWNj1fFkvYLZzjalCq7
         /oWWhb0X511XnzpXJUdl0ho0k1BOnAmpwX/5dAN8CrDkBvh7IPqXyaXOiPYHnESRJ/DX
         ABxpgSnuuogwDUGnF35DRNZc6ac0hEXLjk7t4GeMYlYNN37H23p/btZWCEGAvTCAYpxd
         SXN6WbmYZrq8yqBpJyqZfaPcQKhkKosD8vpskqDCIrwVqTupGbg+LpAgklAxYTqBiSAM
         7+PGPzCqHfGjJFwJ6csAoxdlYIVIORxjWTVWlvfdGKToXC0U/ZWGV7IQTGxJaJc+Wfej
         F2og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744489630; x=1745094430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=olWmtpJVJyP5ihquepeKVhUKSgcRCRnX8hMSMQjAVm0=;
        b=ozDM6YK8YhVoC8HZFwF+rXjn/ErR00eaV+rMQOBm5t4kkp5137kddmqevNiLKpgLVO
         hyzLh4zu7Suu4u0o6BrJjunbWtOwMZD45zZzZWYO1vjYW2YjxnHvwSoAwwig+VcFh/hn
         tepgICqzw8+WIHpOYDIOEzhwLkThGLeh+79rNYcXzEmvkMYr0gIjjjmWbzy4UA3T+JkQ
         foVMOY6dydIZcyNVA/VWWCf0HOri0IlX4+NDrmhODL35JjbQWti1qpMKnw3FjiysyMid
         3cxERjWr8MaYOnj7ZEbpBC4Hd1tq1H34r0jJcYrRWEMZPux9o98TMm29x9ugEVirBmBe
         wK/A==
X-Forwarded-Encrypted: i=1; AJvYcCWa6hXPLdqQxX8yqg6hfSG68fL5ECJzJ2Uu4lvhSgT3EE9td1hk/20CJBtTy3Y8eXUKuLrdfIo8mNq1OHYa9EOz@lists.infradead.org, AJvYcCXS9F5H13UdXyklzJLYmqE9kDFlddLg10BSTKhPzRay0voclQYAJVfLwklNOtoiW2fuB/DTaeU/qLLo@lists.infradead.org
X-Gm-Message-State: AOJu0YzgQdee7P6UGANriZ0EkQDOrVj+fZedJufcmS1faWuxiKJq3uR2
	mw0Jzvg8ClP8jirHwbIZ5q5EHREkpgQAwGy/fbCBPHmyXEDoTbL3
X-Gm-Gg: ASbGnct1zBcNulqD5P3alxiOh2FMMOGUB+Diray/460JMBBzqRVFUUroAsMumrh5Faj
	/1jJUayAQGc5pcL3czcCluogCsCjUui2x9L2OCTgJcJ4VG4cyZbBmajR7HIU1A/YCJuY0EUEbqD
	c4O9QnTpVRwLWR8SpOQSq+QX2MUyIbgmi94nf3H00SDQxlzCw7YGwyUMw8FUDTJ+KOEC+RBF8LJ
	WnF82Jxm05dFtWqnjD9mmqHt999tmi3qnzwx4iJFJ96fsmTWAAnSb7xFFkPPnuUl3dGyvstHxcN
	oqhZOnNftCuCIBzy8RMzruMtyAjpABXr+Fhe8vcMWQNefO/AojDpgjrP/rNY2hfrdb+UynG6zMU
	YE1AJF4mXNp7+ED8L
X-Google-Smtp-Source: AGHT+IEtxyW3UZ/3u0BXgkHZsM+YoFZNao9NjKVr3gYfBTIxWSJRFnSO9EXDpk7LBa79WamAspfqPg==
X-Received: by 2002:a05:600c:3b19:b0:43d:b3:fb1 with SMTP id 5b1f17b1804b1-43f3a9b02f9mr74840105e9.27.1744489630266;
        Sat, 12 Apr 2025 13:27:10 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2338d802sm131797845e9.1.2025.04.12.13.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 13:27:09 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 10/10] phy: exynos5-usbdrd: support Exynos USBDRD 3.2 4nm controller
Date: Sat, 12 Apr 2025 23:26:20 +0300
Message-ID: <20250412202620.738150-11-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250412202620.738150-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250412202620.738150-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_132712_016636_3540B8D4 
X-CRM114-Status: GOOD (  24.45  )
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

Add support for the Exynos USB 3.2 DRD 4nm controller. It's used in
recent 4nm SoCs like Exynos2200 and Exynos2400.

This device consists of 3 underlying and independent phys: SEC link
control phy, Synopsys eUSB 2.0 and Synopsys USBDP/SS combophy. Unlike
older device designs, where the internal phy blocks were all IP of
Samsung, Synopsys phys are present. This means that the link controller
is now mapped differently to account for missing bits and registers.
The Synopsys phys also have separate register bases.

As there are non-SEC PHYs present now, it doesn't make much sense to
implement them in this driver. They are expected to be configured
by external drivers, so pass phandles to them. USBDRD3.2 link controller
set up is still required beforehand.

This commit adds the necessary changes for USB HS to work. USB SS and
DisplayPort are out of scope in this commit and will be introduced
in the future.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c    | 227 ++++++++++++++++++--
 include/linux/soc/samsung/exynos-regs-pmu.h |   3 +
 2 files changed, 215 insertions(+), 15 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 817fddee0..f9a657642 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -36,6 +36,21 @@
 #define EXYNOS5_FSEL_26MHZ		0x6
 #define EXYNOS5_FSEL_50MHZ		0x7
 
+/* USB 3.2 DRD 4nm PHY link controller registers */
+#define EXYNOS2200_DRD_CLKRST			0x0c
+#define EXYNOS2200_CLKRST_LINK_PCLK_SEL		BIT(1)
+
+#define EXYNOS2200_DRD_UTMI			0x10
+#define EXYNOS2200_UTMI_FORCE_VBUSVALID		BIT(1)
+#define EXYNOS2200_UTMI_FORCE_BVALID		BIT(0)
+
+#define EXYNOS2200_DRD_HSP_MISC			0x114
+#define HSP_MISC_SET_REQ_IN2			BIT(4)
+#define HSP_MISC_RES_TUNE			GENMASK(1, 0)
+#define RES_TUNE_PHY1_PHY2			0x1
+#define RES_TUNE_PHY1				0x2
+#define RES_TUNE_PHY2				0x3
+
 /* Exynos5: USB 3.0 DRD PHY registers */
 #define EXYNOS5_DRD_LINKSYSTEM			0x04
 #define LINKSYSTEM_XHCI_VERSION_CONTROL		BIT(27)
@@ -389,6 +404,7 @@ struct exynos5_usbdrd_phy_drvdata {
  * @clks: clocks for register access
  * @core_clks: core clocks for phy (ref, pipe3, utmi+, ITP, etc. as required)
  * @drv_data: pointer to SoC level driver data structure
+ * @hs_phy: pointer to non-Samsung IP high-speed phy controller
  * @phy_mutex: mutex protecting phy_init/exit & TCPC callbacks
  * @phys: array for 'EXYNOS5_DRDPHYS_NUM' number of PHY
  *	    instances each with its 'phy' and 'phy_cfg'.
@@ -406,6 +422,7 @@ struct exynos5_usbdrd_phy {
 	struct clk_bulk_data *clks;
 	struct clk_bulk_data *core_clks;
 	const struct exynos5_usbdrd_phy_drvdata *drv_data;
+	struct phy *hs_phy;
 	struct mutex phy_mutex;
 	struct phy_usb_instance {
 		struct phy *phy;
@@ -1075,6 +1092,149 @@ static const struct phy_ops exynos5_usbdrd_phy_ops = {
 	.owner		= THIS_MODULE,
 };
 
+static void exynos2200_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
+{
+	/* Configure non-Samsung IP PHY, responsible for UTMI */
+	phy_init(phy_drd->hs_phy);
+}
+
+static void exynos2200_usbdrd_link_init(struct exynos5_usbdrd_phy *phy_drd)
+{
+	void __iomem *regs_base = phy_drd->reg_phy;
+	u32 reg;
+
+	/*
+	 * Disable HWACG (hardware auto clock gating control). This will force
+	 * QACTIVE signal in Q-Channel interface to HIGH level, to make sure
+	 * the PHY clock is not gated by the hardware.
+	 */
+	reg = readl(regs_base + EXYNOS850_DRD_LINKCTRL);
+	reg |= LINKCTRL_FORCE_QACT;
+	writel(reg, regs_base + EXYNOS850_DRD_LINKCTRL);
+
+	/* De-assert link reset */
+	reg = readl(regs_base + EXYNOS2200_DRD_CLKRST);
+	reg &= ~CLKRST_LINK_SW_RST;
+	writel(reg, regs_base + EXYNOS2200_DRD_CLKRST);
+
+	/* Set link VBUS Valid */
+	reg = readl(regs_base + EXYNOS2200_DRD_UTMI);
+	reg |= EXYNOS2200_UTMI_FORCE_BVALID | EXYNOS2200_UTMI_FORCE_VBUSVALID;
+	writel(reg, regs_base + EXYNOS2200_DRD_UTMI);
+}
+
+static void
+exynos2200_usbdrd_link_attach_detach_pipe3_phy(struct phy_usb_instance *inst)
+{
+	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
+	void __iomem *regs_base = phy_drd->reg_phy;
+	u32 reg;
+
+	reg = readl(regs_base + EXYNOS850_DRD_LINKCTRL);
+	if (inst->phy_cfg->id == EXYNOS5_DRDPHY_UTMI) {
+		/* force pipe3 signal for link */
+		reg &= ~LINKCTRL_FORCE_PHYSTATUS;
+		reg |= LINKCTRL_FORCE_PIPE_EN | LINKCTRL_FORCE_RXELECIDLE;
+	} else {
+		/* disable forcing pipe interface */
+		reg &= ~LINKCTRL_FORCE_PIPE_EN;
+	}
+	writel(reg, regs_base + EXYNOS850_DRD_LINKCTRL);
+
+	reg = readl(regs_base + EXYNOS2200_DRD_HSP_MISC);
+	if (inst->phy_cfg->id == EXYNOS5_DRDPHY_UTMI) {
+		/* calibrate only eUSB phy */
+		reg |= FIELD_PREP(HSP_MISC_RES_TUNE, RES_TUNE_PHY1);
+		reg |= HSP_MISC_SET_REQ_IN2;
+	} else {
+		/* calibrate for dual phy */
+		reg |= FIELD_PREP(HSP_MISC_RES_TUNE, RES_TUNE_PHY1_PHY2);
+		reg &= ~HSP_MISC_SET_REQ_IN2;
+	}
+	writel(reg, regs_base + EXYNOS2200_DRD_HSP_MISC);
+
+	reg = readl(regs_base + EXYNOS2200_DRD_CLKRST);
+	if (inst->phy_cfg->id == EXYNOS5_DRDPHY_UTMI)
+		reg &= ~EXYNOS2200_CLKRST_LINK_PCLK_SEL;
+	else
+		reg |= EXYNOS2200_CLKRST_LINK_PCLK_SEL;
+
+	writel(reg, regs_base + EXYNOS2200_DRD_CLKRST);
+}
+
+static int exynos2200_usbdrd_phy_init(struct phy *phy)
+{
+	struct phy_usb_instance *inst = phy_get_drvdata(phy);
+	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
+	int ret;
+
+	if (inst->phy_cfg->id == EXYNOS5_DRDPHY_UTMI) {
+		/* Power-on PHY ... */
+		ret = regulator_bulk_enable(phy_drd->drv_data->n_regulators,
+					    phy_drd->regulators);
+		if (ret) {
+			dev_err(phy_drd->dev,
+				"Failed to enable PHY regulator(s)\n");
+			return ret;
+		}
+	}
+	/*
+	 * ... and ungate power via PMU. Without this here, we get an SError
+	 * trying to access PMA registers
+	 */
+	exynos5_usbdrd_phy_isol(inst, false);
+
+	ret = clk_bulk_prepare_enable(phy_drd->drv_data->n_clks, phy_drd->clks);
+	if (ret)
+		return ret;
+
+	/* Set up the link controller */
+	exynos2200_usbdrd_link_init(phy_drd);
+
+	/* UTMI or PIPE3 link preparation */
+	exynos2200_usbdrd_link_attach_detach_pipe3_phy(inst);
+
+	/* UTMI or PIPE3 specific init */
+	inst->phy_cfg->phy_init(phy_drd);
+
+	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->clks);
+
+	return 0;
+}
+
+static int exynos2200_usbdrd_phy_exit(struct phy *phy)
+{
+	struct phy_usb_instance *inst = phy_get_drvdata(phy);
+	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
+	void __iomem *regs_base = phy_drd->reg_phy;
+	u32 reg;
+	int ret;
+
+	ret = clk_bulk_prepare_enable(phy_drd->drv_data->n_clks, phy_drd->clks);
+	if (ret)
+		return ret;
+
+	reg = readl(regs_base + EXYNOS2200_DRD_UTMI);
+	reg &= ~(EXYNOS2200_UTMI_FORCE_BVALID | EXYNOS2200_UTMI_FORCE_VBUSVALID);
+	writel(reg, regs_base + EXYNOS2200_DRD_UTMI);
+
+	reg = readl(regs_base + EXYNOS2200_DRD_CLKRST);
+	reg |= CLKRST_LINK_SW_RST;
+	writel(reg, regs_base + EXYNOS2200_DRD_CLKRST);
+
+	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->clks);
+
+	exynos5_usbdrd_phy_isol(inst, true);
+	return regulator_bulk_disable(phy_drd->drv_data->n_regulators,
+				      phy_drd->regulators);
+}
+
+static const struct phy_ops exynos2200_usbdrd_phy_ops = {
+	.init		= exynos2200_usbdrd_phy_init,
+	.exit		= exynos2200_usbdrd_phy_exit,
+	.owner		= THIS_MODULE,
+};
+
 static void
 exynos5_usbdrd_usb_v3p1_pipe_override(struct exynos5_usbdrd_phy *phy_drd)
 {
@@ -1384,27 +1544,37 @@ static int exynos5_usbdrd_phy_clk_handle(struct exynos5_usbdrd_phy *phy_drd)
 		return dev_err_probe(phy_drd->dev, ret,
 				     "failed to get phy core clock(s)\n");
 
-	ref_clk = NULL;
-	for (int i = 0; i < phy_drd->drv_data->n_core_clks; ++i) {
-		if (!strcmp(phy_drd->core_clks[i].id, "ref")) {
-			ref_clk = phy_drd->core_clks[i].clk;
-			break;
+	if (phy_drd->drv_data->n_core_clks) {
+		ref_clk = NULL;
+		for (int i = 0; i < phy_drd->drv_data->n_core_clks; ++i) {
+			if (!strcmp(phy_drd->core_clks[i].id, "ref")) {
+				ref_clk = phy_drd->core_clks[i].clk;
+				break;
+			}
 		}
-	}
-	if (!ref_clk)
-		return dev_err_probe(phy_drd->dev, -ENODEV,
-				     "failed to find phy reference clock\n");
+		if (!ref_clk)
+			return dev_err_probe(phy_drd->dev, -ENODEV,
+					     "failed to find phy reference clock\n");
 
-	ref_rate = clk_get_rate(ref_clk);
-	ret = exynos5_rate_to_clk(ref_rate, &phy_drd->extrefclk);
-	if (ret)
-		return dev_err_probe(phy_drd->dev, ret,
-				     "clock rate (%ld) not supported\n",
-				     ref_rate);
+		ref_rate = clk_get_rate(ref_clk);
+		ret = exynos5_rate_to_clk(ref_rate, &phy_drd->extrefclk);
+		if (ret)
+			return dev_err_probe(phy_drd->dev, ret,
+					     "clock rate (%ld) not supported\n",
+					     ref_rate);
+	}
 
 	return 0;
 }
 
+static const struct exynos5_usbdrd_phy_config phy_cfg_exynos2200[] = {
+	{
+		.id		= EXYNOS5_DRDPHY_UTMI,
+		.phy_isol	= exynos5_usbdrd_phy_isol,
+		.phy_init	= exynos2200_usbdrd_utmi_init,
+	},
+};
+
 static int exynos5_usbdrd_orien_sw_set(struct typec_switch_dev *sw,
 				       enum typec_orientation orientation)
 {
@@ -1525,6 +1695,19 @@ static const char * const exynos5_regulator_names[] = {
 	"vbus", "vbus-boost",
 };
 
+static const struct exynos5_usbdrd_phy_drvdata exynos2200_usb32drd_phy = {
+	.phy_cfg		= phy_cfg_exynos2200,
+	.phy_ops		= &exynos2200_usbdrd_phy_ops,
+	.pmu_offset_usbdrd0_phy	= EXYNOS2200_PHY_CTRL_USB20,
+	.clk_names		= exynos5_clk_names,
+	.n_clks			= ARRAY_SIZE(exynos5_clk_names),
+	/* clocks and regulators are specific to the underlying PHY blocks */
+	.core_clk_names		= NULL,
+	.n_core_clks		= 0,
+	.regulator_names	= NULL,
+	.n_regulators		= 0,
+};
+
 static const struct exynos5_usbdrd_phy_drvdata exynos5420_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynos5,
 	.phy_ops		= &exynos5_usbdrd_phy_ops,
@@ -1769,6 +1952,9 @@ static const struct of_device_id exynos5_usbdrd_phy_of_match[] = {
 	{
 		.compatible = "google,gs101-usb31drd-phy",
 		.data = &gs101_usbd31rd_phy
+	}, {
+		.compatible = "samsung,exynos2200-usb32drd-phy",
+		.data = &exynos2200_usb32drd_phy,
 	}, {
 		.compatible = "samsung,exynos5250-usbdrd-phy",
 		.data = &exynos5250_usbdrd_phy
@@ -1841,6 +2027,17 @@ static int exynos5_usbdrd_phy_probe(struct platform_device *pdev)
 			return PTR_ERR(phy_drd->reg_phy);
 	}
 
+	/*
+	 * USB32DRD 4nm controller implements Synopsys eUSB2.0 PHY
+	 * and Synopsys SS/USBDP COMBOPHY, managed by external code.
+	 */
+	if (of_property_present(dev->of_node, "phy-names")) {
+		phy_drd->hs_phy = devm_of_phy_get(dev, dev->of_node, "hs");
+		if (IS_ERR(phy_drd->hs_phy))
+			return dev_err_probe(dev, PTR_ERR(phy_drd->hs_phy),
+					     "failed to get hs_phy\n");
+	}
+
 	ret = exynos5_usbdrd_phy_clk_handle(phy_drd);
 	if (ret)
 		return ret;
diff --git a/include/linux/soc/samsung/exynos-regs-pmu.h b/include/linux/soc/samsung/exynos-regs-pmu.h
index ce1a3790d..b77187ba5 100644
--- a/include/linux/soc/samsung/exynos-regs-pmu.h
+++ b/include/linux/soc/samsung/exynos-regs-pmu.h
@@ -185,6 +185,9 @@
 /* Only for S5Pv210 */
 #define S5PV210_EINT_WAKEUP_MASK	0xC004
 
+/* Only for Exynos2200 */
+#define EXYNOS2200_PHY_CTRL_USB20	0x72C
+
 /* Only for Exynos4210 */
 #define S5P_CMU_CLKSTOP_LCD1_LOWPWR	0x1154
 #define S5P_CMU_RESET_LCD1_LOWPWR	0x1174
-- 
2.43.0


