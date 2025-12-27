Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA72EE92712
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 11:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f0AB1t66lhNxE63CvdTb7sDJST88CE6ooJzwCRCBXmQ=; b=ISPizNbxb5rG/bhjjvK7dcppRC
	CaWgxtvtldMMMgt/SkzOSEY1fw3lV2nIPSAgtxCUPXQciIPRmK3ZjLMQ5jRR2O3CkSaQgPWj4r15x
	BB1Gbwd7LGlBQ4vWPewHMuu+w6BWhizSxpW53nODzPmj7CW5lQTjxmCoz56LFVTxXZ9jjiecT37dA
	n1lWSrw66v/opQ452IEF1neGPojD1qcKQ9odOGPOjy+I4XyedxfgNeveXF1xZONc0IkjX1eaqS5+2
	XhvZfFz4Nx88VNJ5meRTenu0V12lMV6ADbQO2aE5wYSWx/iARhY9L4UDAKxy2eOfvtF3IJtJHD3sy
	qx/UKyVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZSoY-00000001tvN-4ABe;
	Sat, 27 Dec 2025 11:50:31 +0000
Received: from mail-m1973179.qiye.163.com ([220.197.31.79])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZSoH-00000001tl2-10Xq;
	Sat, 27 Dec 2025 11:50:15 +0000
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2ebf64e09;
	Sat, 27 Dec 2025 19:50:06 +0800 (GMT+08:00)
From: Ye Zhang <ye.zhang@rock-chips.com>
To: Ye Zhang <ye.zhang@rock-chips.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tao.huang@rock-chips.com
Subject: [PATCH v4 6/7] pinctrl: rockchip: Add RK3506 RMIO support
Date: Sat, 27 Dec 2025 19:49:56 +0800
Message-Id: <20251227114957.3287944-7-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251227114957.3287944-1-ye.zhang@rock-chips.com>
References: <20251227114957.3287944-1-ye.zhang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b5fa4fd5d09d8kunm85cc97d2e30ad1
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUwdTFYfTB5DTkkaGRoaHh1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=PFIcavJd8YUVZ2zgbMEnFgTSMWuOVmw+qMdQAKRhI41CRczoYNi1AF3WkLBguuwfduXKez+IssPrji+U4g4wr2wsiv2hjcKLtUHIJyBaKM3Bd53yez9WWsX8hoaF1HOpDBY5HkPABUOQeIeA4aB2K33IE9LZQY+3fU5pAsKpcGg=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=f0AB1t66lhNxE63CvdTb7sDJST88CE6ooJzwCRCBXmQ=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_035013_472214_1DFFA882 
X-CRM114-Status: GOOD (  21.39  )
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

On the RK3506 SoC, some pins support a secondary muxing layer via the
RMIO (Rockchip Matrix I/O) block. This allows expanding the number of
available functions for a single physical pin.

The RMIO configuration is stored as a separate list within the pin
group, decoupled from the primary pin list, to support flexible
pin-to-RMIO mapping.

Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 101 ++++++++++++++++++++++++++++-
 drivers/pinctrl/pinctrl-rockchip.h |  19 ++++++
 2 files changed, 117 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index dc7ef12dfcb0..e0493b4bb483 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -1414,6 +1414,33 @@ static int rockchip_set_mux(struct rockchip_pin_bank *bank, int pin, int mux)
 	return ret;
 }
 
+static int rockchip_set_rmio(struct rockchip_pinctrl *info, u32 id, u32 pin, u32 func)
+{
+	struct rockchip_pin_ctrl *ctrl = info->ctrl;
+	struct rockchip_rmio_data *rmio;
+	u32 mask, data, offset;
+	int ret;
+
+	if (id >= ctrl->nr_rmios)
+		return -EINVAL;
+
+	rmio = &ctrl->rmios[id];
+	if (pin >= rmio->nr_pins)
+		return -EINVAL;
+
+	dev_dbg(info->dev, "setting func of rmio%u-%u to %u\n", id, pin, func);
+
+	mask = (1 << rmio->width) - 1;
+	data = (mask << 16) | func;
+	offset = rmio->offset + 4 * pin;
+
+	ret = regmap_write(rmio->regmap, offset, data);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 #define PX30_PULL_PMU_OFFSET		0x10
 #define PX30_PULL_GRF_OFFSET		0x60
 #define PX30_PULL_BITS_PER_PIN		2
@@ -3660,9 +3687,10 @@ static int rockchip_pmx_set(struct pinctrl_dev *pctldev, unsigned selector,
 	struct rockchip_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
 	const unsigned int *pins = info->groups[group].pins;
 	const struct rockchip_pin_config *data = info->groups[group].data;
+	const struct rockchip_rmio_config *rmio;
 	struct device *dev = info->dev;
 	struct rockchip_pin_bank *bank;
-	int cnt, ret = 0;
+	int cnt, cnt_rmio = 0, ret = 0;
 
 	dev_dbg(dev, "enable function %s group %s\n",
 		info->functions[selector].name, info->groups[group].name);
@@ -3679,6 +3707,17 @@ static int rockchip_pmx_set(struct pinctrl_dev *pctldev, unsigned selector,
 			break;
 	}
 
+	if (cnt != info->groups[group].npins)
+		goto revert_setting;
+
+	for (cnt_rmio = 0; cnt_rmio < info->groups[group].nrmios; cnt_rmio++) {
+		rmio = &info->groups[group].rmios[cnt_rmio];
+		ret = rockchip_set_rmio(info, rmio->id, rmio->pin, rmio->func);
+		if (ret)
+			break;
+	}
+
+revert_setting:
 	if (ret) {
 		/* revert the already done pin settings */
 		for (cnt--; cnt >= 0; cnt--) {
@@ -3689,6 +3728,16 @@ static int rockchip_pmx_set(struct pinctrl_dev *pctldev, unsigned selector,
 		return ret;
 	}
 
+	if (ret && cnt_rmio) {
+		/* revert the already done pin settings */
+		for (cnt_rmio--; cnt_rmio >= 0; cnt_rmio--) {
+			rmio = &info->groups[group].rmios[cnt_rmio];
+			rockchip_set_rmio(info, rmio->id, rmio->pin, 0);
+		}
+
+		return ret;
+	}
+
 	return 0;
 }
 
@@ -4036,6 +4085,32 @@ static int rockchip_pinctrl_parse_groups(struct device_node *np,
 			return ret;
 	}
 
+	/*
+	 * the binding format is rockchip,rmio-pins = <id pin func>,
+	 * do sanity check and calculate pins number
+	 */
+	size = 0;
+	list = of_get_property(np, "rockchip,rmio-pins", &size);
+	if (list && size) {
+		size /= sizeof(*list);
+		if (size % 3)
+			return dev_err_probe(dev, -EINVAL,
+					     "%pOF: rockchip,rmio-pins: expected one or more of <id pin func>, got %d args instead\n",
+					     np, size);
+
+		grp->nrmios = size / 3;
+
+		grp->rmios = devm_kcalloc(dev, grp->nrmios, sizeof(*grp->rmios), GFP_KERNEL);
+		if (!grp->rmios)
+			return -ENOMEM;
+
+		for (i = 0, j = 0; i < size; i += 3, j++) {
+			grp->rmios[j].id = be32_to_cpu(*list++);
+			grp->rmios[j].pin = be32_to_cpu(*list++);
+			grp->rmios[j].func = be32_to_cpu(*list++);
+		}
+	}
+
 	return 0;
 }
 
@@ -4173,10 +4248,11 @@ static struct rockchip_pin_ctrl *rockchip_pinctrl_get_soc_data(
 						struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *node = dev->of_node;
+	struct device_node *node = dev->of_node, *syscon_np;
 	const struct of_device_id *match;
 	struct rockchip_pin_ctrl *ctrl;
 	struct rockchip_pin_bank *bank;
+	struct rockchip_rmio_data *rmio;
 	int grf_offs, pmu_offs, drv_grf_offs, drv_pmu_offs, i, j;
 
 	match = of_match_node(rockchip_pinctrl_dt_match, node);
@@ -4282,6 +4358,19 @@ static struct rockchip_pin_ctrl *rockchip_pinctrl_get_soc_data(
 		}
 	}
 
+	rmio = ctrl->rmios;
+	for (i = 0; i < ctrl->nr_rmios; ++i, ++rmio) {
+		syscon_np = of_parse_phandle(node, "rockchip,rmio", i);
+		if (syscon_np) {
+			rmio->regmap = syscon_node_to_regmap(syscon_np);
+			of_node_put(syscon_np);
+			if (IS_ERR(rmio->regmap))
+				return ERR_CAST(rmio->regmap);
+		} else {
+			return ERR_PTR(-EINVAL);
+		}
+	}
+
 	return ctrl;
 }
 
@@ -4353,7 +4442,7 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 	info->dev = dev;
 
 	ctrl = rockchip_pinctrl_get_soc_data(info, pdev);
-	if (!ctrl)
+	if (IS_ERR_OR_NULL(ctrl))
 		return dev_err_probe(dev, -EINVAL, "driver data not available\n");
 	info->ctrl = ctrl;
 
@@ -4941,9 +5030,15 @@ static struct rockchip_pin_bank rk3506_pin_banks[] = {
 				    1, 1, 1, 1),
 };
 
+static struct rockchip_rmio_data rk3506_rmios[] = {
+	{ .nr_pins = 32, .width = 7, .offset = 0x80 },
+};
+
 static struct rockchip_pin_ctrl rk3506_pin_ctrl __maybe_unused = {
 	.pin_banks		= rk3506_pin_banks,
 	.nr_banks		= ARRAY_SIZE(rk3506_pin_banks),
+	.rmios			= rk3506_rmios,
+	.nr_rmios		= ARRAY_SIZE(rk3506_rmios),
 	.label			= "RK3506-GPIO",
 	.type			= RK3506,
 	.pull_calc_reg		= rk3506_calc_pull_reg_and_bit,
diff --git a/drivers/pinctrl/pinctrl-rockchip.h b/drivers/pinctrl/pinctrl-rockchip.h
index fe18b62ed994..c4624df8ce07 100644
--- a/drivers/pinctrl/pinctrl-rockchip.h
+++ b/drivers/pinctrl/pinctrl-rockchip.h
@@ -390,9 +390,18 @@ struct rockchip_mux_route_data {
 	u32 route_val;
 };
 
+struct rockchip_rmio_data {
+	struct regmap			*regmap;
+	u32				nr_pins;
+	u32				width;
+	u32				offset;
+};
+
 struct rockchip_pin_ctrl {
 	struct rockchip_pin_bank	*pin_banks;
 	u32				nr_banks;
+	struct rockchip_rmio_data	*rmios;
+	u32				nr_rmios;
 	u32				nr_pins;
 	char				*label;
 	enum rockchip_pinctrl_type	type;
@@ -416,6 +425,12 @@ struct rockchip_pin_ctrl {
 				    int *reg, u8 *bit);
 };
 
+struct rockchip_rmio_config {
+	u32			id;
+	u32			pin;
+	u32			func;
+};
+
 struct rockchip_pin_config {
 	unsigned int		func;
 	unsigned long		*configs;
@@ -437,12 +452,16 @@ struct rockchip_pin_deferred {
  * @pins: the pins included in this group.
  * @npins: number of pins included in this group.
  * @data: local pin configuration
+ * @nrmios: number of RMIO configurations in this group.
+ * @rmios: list of RMIO configurations for this group.
  */
 struct rockchip_pin_group {
 	const char			*name;
 	unsigned int			npins;
 	unsigned int			*pins;
 	struct rockchip_pin_config	*data;
+	unsigned int			nrmios;
+	struct rockchip_rmio_config	*rmios;
 };
 
 /**
-- 
2.34.1


