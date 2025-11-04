Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F527CCFA06
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 02:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6bpdvky3mLqhhxKzpg13DZv9erw7l+ahTifZaliB3Fc=; b=YMxUN02G9fZltfs8674hvHgY7d
	wWpZ3JGN524a9iM5f8mjc6TkEy7UEjvDy9W2TlMR/xYVOpcAr7k1xxUg+JRR2gxqVbngkktiX/tN9
	nHDvH3WiF61vW1JS/5AbteDU/a9w98SgxaM5mZfos2OaCnWE64CKIwM8vFE4k9KrznxnmW1fztjy6
	T4iPGvjv4NDJuEHYv/Eb4nt//gMohvI9x/dlgalaNYkLSAs032iVnKRBNySTvw7/jd2EA6z4BqaWO
	eIaHEdBZMKrbBhzKu5kmwSrlDOVyp315iuetGDGninH0UPqviY88SSoDcD7/0R/v95AB210tNbvVQ
	YnHDSIMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG6XJ-0000000Ay6Q-1495;
	Tue, 04 Nov 2025 02:12:41 +0000
Received: from mail-m49228.qiye.163.com ([45.254.49.228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG6XE-0000000Ay3N-3UEy;
	Tue, 04 Nov 2025 02:12:38 +0000
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2842e983c;
	Tue, 4 Nov 2025 10:12:33 +0800 (GMT+08:00)
From: Ye Zhang <ye.zhang@rock-chips.com>
To: Ye Zhang <ye.zhang@rock-chips.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tao.huang@rock-chips.com
Subject: [PATCH v1 3/3] pinctrl: rockchip: add rk3506 rmio support
Date: Tue,  4 Nov 2025 10:12:23 +0800
Message-Id: <20251104021223.2375116-4-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251104021223.2375116-1-ye.zhang@rock-chips.com>
References: <20251104021223.2375116-1-ye.zhang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a4ca32c1909d8kunm1bdc99775fc3c87
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUNOH1ZLHh0aQk1DGRgfQ0xWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=QV9omP/GG2etENojjSXRfCCBuTDUDwWS6aHOiRfLpDLS4DvkgkKZWistKcYn4E1PCDF/edawoqSNkS9gZDztDr2gzP2C9UYj0qlM/AEjRDrAsfEQ+1kgU1+NnZtGCtr0wB7yAnwrAuoaTpHxCNc0FICicjRZTRyq0qeGufQavUo=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=6bpdvky3mLqhhxKzpg13DZv9erw7l+ahTifZaliB3Fc=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_181237_058902_944B0EF3 
X-CRM114-Status: GOOD (  18.48  )
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

Support rockchip matrix io

Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 75 ++++++++++++++++++++++++++++++
 drivers/pinctrl/pinctrl-rockchip.h |  1 +
 2 files changed, 76 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index e44ef262beec..89ff8d8c7fcc 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -1258,6 +1258,74 @@ static int rockchip_verify_mux(struct rockchip_pin_bank *bank,
 	return 0;
 }
 
+static int rockchip_set_rmio(struct rockchip_pin_bank *bank, int pin, int *mux)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+	struct rockchip_pin_ctrl *ctrl = info->ctrl;
+	struct regmap *regmap;
+	int reg, function;
+	u32 data, rmask;
+	int ret = 0;
+	int iomux_num = (pin / 8);
+	u32 iomux_max, mux_type;
+
+	mux_type = bank->iomux[iomux_num].type;
+	if (mux_type & IOMUX_WIDTH_4BIT)
+		iomux_max = (1 << 4) - 1;
+	else if (mux_type & IOMUX_WIDTH_3BIT)
+		iomux_max = (1 << 3) - 1;
+	else
+		iomux_max = (1 << 2) - 1;
+
+	if (*mux > iomux_max)
+		function = *mux - iomux_max;
+	else
+		return 0;
+
+	switch (ctrl->type) {
+	case RK3506:
+		regmap = info->regmap_rmio;
+		if (bank->bank_num == 0) {
+			if (pin < 24)
+				reg = 0x80 + 0x4 * pin;
+			else
+				ret = -EINVAL;
+		} else if (bank->bank_num == 1) {
+			if (pin >= 9 && pin <= 11)
+				reg = 0xbc + 0x4 * pin;
+			else if (pin >= 18 && pin <= 19)
+				reg = 0xa4 + 0x4 * pin;
+			else if (pin >= 25 && pin <= 27)
+				reg = 0x90 + 0x4 * pin;
+			else
+				ret = -EINVAL;
+		} else {
+			ret = -EINVAL;
+		}
+
+		if (ret) {
+			dev_err(info->dev,
+				"rmio unsupported bank_num %d function %d\n",
+				bank->bank_num, function);
+
+			return -EINVAL;
+		}
+
+		rmask = 0x7f007f;
+		data = 0x7f0000 | function;
+		*mux = 7;
+		ret = regmap_update_bits(regmap, reg, rmask, data);
+		if (ret)
+			return ret;
+		break;
+
+	default:
+		break;
+	}
+
+	return 0;
+}
+
 /*
  * Set a new mux function for a pin.
  *
@@ -1291,6 +1359,10 @@ static int rockchip_set_mux(struct rockchip_pin_bank *bank, int pin, int mux)
 
 	dev_dbg(dev, "setting mux of GPIO%d-%d to %d\n", bank->bank_num, pin, mux);
 
+	ret = rockchip_set_rmio(bank, pin, &mux);
+	if (ret)
+		return ret;
+
 	if (bank->iomux[iomux_num].type & IOMUX_SOURCE_PMU)
 		regmap = info->regmap_pmu;
 	else if (bank->iomux[iomux_num].type & IOMUX_L_SOURCE_PMU)
@@ -4247,6 +4319,9 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 	/* try to find the optional reference to the ioc1 syscon */
 	info->regmap_ioc1 = syscon_regmap_lookup_by_phandle_optional(np, "rockchip,ioc1");
 
+	/* try to find the optional reference to the rmio syscon */
+	info->regmap_rmio = syscon_regmap_lookup_by_phandle_optional(np, "rockchip,rmio");
+
 	ret = rockchip_pinctrl_register(pdev, info);
 	if (ret)
 		return ret;
diff --git a/drivers/pinctrl/pinctrl-rockchip.h b/drivers/pinctrl/pinctrl-rockchip.h
index 4f4aff42a80a..6d79ccf73b71 100644
--- a/drivers/pinctrl/pinctrl-rockchip.h
+++ b/drivers/pinctrl/pinctrl-rockchip.h
@@ -462,6 +462,7 @@ struct rockchip_pinctrl {
 	struct regmap			*regmap_pull;
 	struct regmap			*regmap_pmu;
 	struct regmap			*regmap_ioc1;
+	struct regmap			*regmap_rmio;
 	struct device			*dev;
 	struct rockchip_pin_ctrl	*ctrl;
 	struct pinctrl_desc		pctl;
-- 
2.34.1


