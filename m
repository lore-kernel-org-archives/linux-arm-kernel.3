Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24FF8C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 May 2025 15:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=olWmtpJVJyP5ihquepeKVhUKSgcRCRnX8hMSMQjAVm0=; b=rW95orTkOzxStwY+dm/WjqHiaQ
	YW49LVz/w++WTdNl3KgXE75rLke4Jr2HkC8jjhEFBvT/q3BDdFuInKjJ2jJ3LnD3pyta/Jrx0yqbu
	f1t46oLHD9MUtXAlSgxfnZAZsrf3mk0l0T2t0Q1mnh9cGLrAX9n1rvCS8eBXeUf0VnOQ1AroNv+63
	gCgaogMTUs/+kfBLvlX3rWciJZ9XeDuqYOeNn58H8CKgSFg7UgTuRUnzd2BrpGQm7OvvRaEhUNwyZ
	P9i1IKXREjQzf9Ik93n5V2iXZ80sLJw4qEBZ/qvmgYPC4HRA8UzB9QctJYEl8gIXy/29fymUrbvU4
	RqvRzTkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBavt-00000005SNa-1BFR;
	Sun, 04 May 2025 15:07:09 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBabJ-00000005PTf-28HC;
	Sun, 04 May 2025 14:45:54 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5f63ac6ef0fso3848307a12.1;
        Sun, 04 May 2025 07:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746369952; x=1746974752; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=olWmtpJVJyP5ihquepeKVhUKSgcRCRnX8hMSMQjAVm0=;
        b=NKuSysTS37uZ/rqnN7FLxuFrsoCK2cI6EYcNjbFM3NKFr68dDXToVEurw8ZDhjR8jY
         9MhCiZPXF2hlcoddZHgHI7NvX3OJqQliPvkhmIDbT/cGRHZB5ErInVCAKRHSoDOSjktL
         IHB+4k/RKEXiYakp2jfi7jQJdqY+RHY0h8TzThVg017FbevAzusz9wOpwoyHWNvxAsAd
         DIKLSBDaLvC6pTtzd+RUbsbqIXCKA/WsqAWVjyL6X1S0AzqLlgBREtDD7ITij2bmHRd5
         2znpCfxvPnGrMjnzU+6I93IhkIn3CQvk+CA0hC/LJaNV4st9Q0K+atLNAnx/VDsr1jPl
         gBxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746369952; x=1746974752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=olWmtpJVJyP5ihquepeKVhUKSgcRCRnX8hMSMQjAVm0=;
        b=S7QFYfhiZRbKyXnqTVL/UWGflVgOxa8J4DSlWxsJLrDaoV7z9whlTWyfZtT98uMQpn
         73zpu6pEn440eHqx0HwoglSUCL8wpFB7uB+1tgxFIPbqcVyWaSX8Z17qvaxYZjO3AucM
         Y2/NVTg9I+xuMpGIkzNnRz8gL8qQgC2DIvK/58DuVdUzAcwDwL+meX+OBIsUVK5nCiDR
         10FUUs742Ae9vK80A4cUlX64hb/JkKlkIUC4xsjV+3hP0C4YMXDg8LHEELv49/SMyR6x
         CXv6PwuRSkeRNhvUoywHdmt7Vw7icn6x51YzS8MXnm5jzgh26Gxb4FjPvSEknT9z9E5O
         rPrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbIRHnaQrBCuDzys+1ivmnpPqKhBsquLp/8xdQkPKgzdfM6brPY2YcAyRNGsilPqzoUd2SbDY5HfAvIVyDqcvJ@lists.infradead.org
X-Gm-Message-State: AOJu0YySAun3iVmUvYDLuJHdjXRFKqTm98DjEagPDCsPZZJKG7jmNC1O
	tzA8UprlKLDnomZh/yM9Tmwj1rMJ08jNmHVNpEVpqIZF35tw3o67
X-Gm-Gg: ASbGncsq84h7mIWEkWqNPD5awYMacRinq+qEhz0dw7q3Jb4wkh+Vu1rE5aIftX2LA32
	vOtLzwZSu1NrWrYNeyQp4t2Wzb445U1EKY4Ge8Gyi7vhLNSxnAjK31Hajf08v7oLGTJRVv04hXm
	d3eZhIZ4zhl20eL4mqeaPLE1zgWRXJULGMi+1OOlVSjHK+6IqjSquYMIBhEjtSQsohb3nfAO7rM
	x8pS7+yG9iQrTYHriykYMdhASH1uG8XviNzLCYsx0Lc7KVkHa2uB/qtnIXZcbgDaH1PcUfTYd4+
	oyBn0Tittqr1/M3eB41Nqfx+q1hguG0GW2cViZlQXwxJbNSj/g4eDumj/x1ElgqSDA84wp5BxWk
	dJKtQMzBfjAHV0twd
X-Google-Smtp-Source: AGHT+IEewLKEcMRJPlELXPyihjMHkdm1I8PMilAI27xxkLbRXIeAtZFm6BFezmKY/8inmTCaZPdqHA==
X-Received: by 2002:a05:6402:234f:b0:5f8:f0ed:ffc5 with SMTP id 4fb4d7f45d1cf-5fa7336da3dmr7794715a12.12.1746369951931;
        Sun, 04 May 2025 07:45:51 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5faecf59d31sm1147258a12.77.2025.05.04.07.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 07:45:51 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-phy@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 10/10] phy: exynos5-usbdrd: support Exynos USBDRD 3.2 4nm controller
Date: Sun,  4 May 2025 17:45:27 +0300
Message-ID: <20250504144527.1723980-11-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250504144527.1723980-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250504144527.1723980-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_074553_682521_A94AEFE0 
X-CRM114-Status: GOOD (  23.74  )
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


