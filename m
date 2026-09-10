Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 619FEC88E40
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 05:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RyHAMGObrZ2W+LqPoNz/UDlskVqAfuHrAD8Veert9AY=; b=pulbfnb+/Rk36oOtu2GLv8ZxS4
	zIRx7cD2YtTslsmTVMWuStsKOi8U3ZeOWgQTTNygV1h2CIVPeYpCKE4JKPWUrpHNJGjrHrxWW+P98
	J3GSf7msuxbmHVaqPKOpFhiYsYGXde1fIOCFa1rFsu36xn7KAuSk/bvuRjJ5U3ldRbulE1MAA7Gsh
	SW5c+NrqO/Q299vO83HmdRn/s7T+8WdtJL7BU2F1Ca4ceFpa+z5QQazz5lJRCDnSkaY4K8UVMqYN5
	uS89uyTPr7Nc+tIwD08U+fvmiMk9s6rNe3Z/ojE5SDdg66lh3OsSjax/OlzCZsC6bQfltLoHyH9Mf
	hZoWGw5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4XGT-0000000DQqL-360x;
	Thu, 10 Sep 2026 05:24:01 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4XGP-0000000DQpB-0ouy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 05:23:58 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BFC5C102E36;
	Thu, 10 Sep 2026 07:23:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1789017831; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=RyHAMGObrZ2W+LqPoNz/UDlskVqAfuHrAD8Veert9AY=;
	b=P8jnnJ96+KUgJHiHbucVSZVx4CKShWIKHcpwRPIs9Y64mupOm7IGll/Qsz73qQEujH8mu3
	crGhzHcJPPQHW5CHVHELrbJjygYERhQKyzHjMzLXlKtNJf1fQqVksJkN7OQHXDrwyZl/q2
	Gz96t9AQGaIaMGs2R8ZnjHTAKl73QV95DaYDlromICoGpmioUkPdsZc60e+PChn+3Pydn+
	liaNbiWl5bPKQjufTEQNpxS9tH6XNA+i3gq92KtBvbDtlSu2mdIR+OB5FPoaQcBClJJONs
	9nWBhLrCvcuYsb21hru+zMydR2lfHKwDQ309kS12WcrbqlcRqCfnmEVzdG8nyA==
From: Marek Vasut <marex@nabladev.com>
To: linux-usb@vger.kernel.org
Cc: Marek Vasut <marex@nabladev.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v5 2/2] usb: dwc3: dwc3-generic-plat: Add ST STM32MP2 DWC3 xHCI USB controller glue
Date: Thu, 10 Sep 2026 07:22:41 +0200
Message-ID: <20260910052340.246717-2-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260910052340.246717-1-marex@nabladev.com>
References: <20260910052340.246717-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_222357_549774_81B18F76 
X-CRM114-Status: GOOD (  15.83  )
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

The ST STM32MP2 SoC contains one instance of DWC3 USB controller with
glue logic wrapper around it controlled by syscon. Extend the generic
DWC3 platform driver with ST STM32MP2 glue logic specifics.

Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Marek Vasut <marex@nabladev.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-usb@vger.kernel.org
---
V2: No change
V3: - Use generic over-current-active-low
V4: - Include bitfield.h
    - Split this from series arm64: dts: phy: st: usb: Add STM32MP2 USB support
      https://lore.kernel.org/all/20260822074816.548662-1-marex@nabladev.com/
V5: - Reorder usb2only_conf to improve readability
    - Drop superfluous !!
    - Add AB from Thinh
---
 drivers/usb/dwc3/dwc3-generic-plat.c | 46 ++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
index ca69ac0eb07ce..2dce1f24615c8 100644
--- a/drivers/usb/dwc3/dwc3-generic-plat.c
+++ b/drivers/usb/dwc3/dwc3-generic-plat.c
@@ -7,6 +7,7 @@
  * Inspired by dwc3-qcom.c and dwc3-of-simple.c
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
@@ -22,6 +23,12 @@
 #define EIC7700_HSP_AXI_LP_XM_CSYSREQ	BIT(0)
 #define EIC7700_HSP_AXI_LP_XS_CSYSREQ	BIT(16)
 
+#define STM32MP2_USB3DRCR_HOST_PORT_POWER_CONTROL_PRESENT	BIT(0)
+#define STM32MP2_USB3DRCR_OVRCUR_POLARITY			BIT(1)
+#define STM32MP2_USB3DRCR_VBUSEN_POLARITY			BIT(2)
+#define STM32MP2_USB3DRCR_USB2ONLYH				BIT(3)
+#define STM32MP2_USB3DRCR_USB2ONLYD				BIT(4)
+
 struct dwc3_generic {
 	struct device		*dev;
 	struct dwc3		dwc;
@@ -85,6 +92,39 @@ static int dwc3_spacemit_k1_init(struct dwc3_generic *dwc3g)
 	return 0;
 }
 
+static int dwc3_stm32mp25_init(struct dwc3_generic *dwc3g)
+{
+	struct device *dev = dwc3g->dev;
+	bool ovrcur_polarity_low = device_property_read_bool(dev, "over-current-active-low");
+	bool prt_pwr_ctrl = device_property_read_bool(dev, "st,enable-port-power-control");
+	bool vbusen_polarity_low = device_property_read_bool(dev, "st,vbusen-active-low");
+	bool usb2only_conf = false;
+	struct regmap *regmap;
+	u32 drcr;
+
+	if (device_property_match_string(dev, "phy-names", "usb3-phy") < 0)
+		usb2only_conf = true;
+
+	regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node, "st,syscfg", 1, &drcr);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap), "No st,syscfg phandle specified\n");
+
+	return regmap_update_bits(regmap, drcr,
+				  STM32MP2_USB3DRCR_HOST_PORT_POWER_CONTROL_PRESENT |
+				  STM32MP2_USB3DRCR_OVRCUR_POLARITY |
+				  STM32MP2_USB3DRCR_VBUSEN_POLARITY |
+				  STM32MP2_USB3DRCR_USB2ONLYD |
+				  STM32MP2_USB3DRCR_USB2ONLYH,
+				  FIELD_PREP(STM32MP2_USB3DRCR_HOST_PORT_POWER_CONTROL_PRESENT,
+					     prt_pwr_ctrl) |
+				  FIELD_PREP(STM32MP2_USB3DRCR_OVRCUR_POLARITY,
+					     ovrcur_polarity_low) |
+				  FIELD_PREP(STM32MP2_USB3DRCR_VBUSEN_POLARITY,
+					     vbusen_polarity_low) |
+				  FIELD_PREP(STM32MP2_USB3DRCR_USB2ONLYD, usb2only_conf) |
+				  FIELD_PREP(STM32MP2_USB3DRCR_USB2ONLYH, usb2only_conf));
+}
+
 static int dwc3_generic_probe(struct platform_device *pdev)
 {
 	const struct dwc3_generic_config *plat_config;
@@ -231,12 +271,18 @@ static const struct dwc3_generic_config eic7700_dwc3 =  {
 	.properties = DWC3_DEFAULT_PROPERTIES,
 };
 
+static const struct dwc3_generic_config stm32mp25_dwc3 =  {
+	.init = dwc3_stm32mp25_init,
+	.properties = DWC3_DEFAULT_PROPERTIES,
+};
+
 static const struct of_device_id dwc3_generic_of_match[] = {
 	{ .compatible = "spacemit,k1-dwc3", &spacemit_k1_dwc3},
 	{ .compatible = "spacemit,k3-dwc3", },
 	{ .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
 	{ .compatible = "eswin,eic7700-dwc3", &eic7700_dwc3},
 	{ .compatible = "starfive,jhb100-dwc3", },
+	{ .compatible = "st,stm32mp25-dwc3", &stm32mp25_dwc3 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dwc3_generic_of_match);
-- 
2.53.0


