Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD36DC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 14:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BxQsrMugLGGvmmAzyAq0mqX895UJp8wu14mw/2/2g1M=; b=ddD9ZcMOzHyHWPYU7UZWmm2Msx
	FSe78Z345eW3o1i8z3XsN1V19R9OKefIhUSe+ET+H9mo+9ymyBxJuwtSfETLj/UAv4auUH7+tGZg+
	C9m3C6m4+f2zvFsevUAyJRELdijHGL0tLPsZLqo0JCFMtIMkYKqlEt8PBID/lNO3AxeUDUASDQFz1
	tvPJSwcD5BsYmq1JwlhBISTnN9s2aP2M7olEosc4slCKcPBwAhHE+J4BgO5dy1AfnBMDpVKX3Siqn
	eRPB3J8EFgZQpkYbl/M9YrJ1KDqqXzEoh+mGu6ZspFGJ7tJkxmO/KSvRoQgb7ym+KLJcYjDXSgmZv
	EYe3taMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZEH-0000000E3Co-468e;
	Mon, 24 Feb 2025 14:14:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYrb-0000000DyJm-1OvP
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 24 Feb 2025 13:51:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=BxQsrMugLGGvmmAzyAq0mqX895UJp8wu14mw/2/2g1M=; b=lEwbXsEmGnowXfn2bK8ozKAnJG
	fUg3VpNOvmD0xA9BZZKNAwfy8z0Vs+OKAkylNsLVVA6AhRXAHezXJ27neT6BgQeyWhVSu27mIj43V
	b416XX5nvDLZWN5DmtXr6EkheIBZBCVRJl/LF5MHxTRGy9rel1AlwfMUPMlv1eGv/CxxGXp8Pu+HX
	rNrRVV9Y/5ATqX+8iDK8PiQTjmesx4MdGnHHaqP30EP4+/UFdEWHDHzfKX8OiQnH/Y7OS/cCSPnd/
	wzOO0bja5ma80s+kAIL7oEKgrlSVZGSylHbvKvOR+z4obww3iG9kgTvScGOBJJDsnbbrvIWZCflQ0
	1UOxP/0A==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYrX-00000003D7I-3wp3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 13:51:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2805A5C6E38;
	Mon, 24 Feb 2025 13:50:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 320E5C4AF62;
	Mon, 24 Feb 2025 13:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740405065;
	bh=FJ54yO04PKk7jacqo+ONYP3+FlHuQ9rLC64gl6G9Bxw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Ro0ihmqi+4apnSzbXn8tkuIVC7wo9uBi/D2ZQpOl0vVlM39cbj1s9sntlWes+lrQz
	 nsHPQoo+08M7Lc9JD1dW2YO3XnNFrvD967VzZRSjTfN+zRzWQ9pGFu7imj6hDU8r2n
	 KyBjoJjXlL3e+ABFnZY1KZdV4T16rqDz+FXcpEIxclDBb2rJSzolYx13PcwnSQ0fSZ
	 AHnwYpcC1zmnE81SYBkzeG0qovniJuQVNcoKkm9rDQ9anSDmYjzyBFAAV+B5dTYlC/
	 j6wbwNlFO3Ns/HevkME0DSkh4+uaDGtqv2w3T4+QeFaZd4VWk6qs51BhsbTLonCLbR
	 eEcTedc1b35tg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FE6CC021BB;
	Mon, 24 Feb 2025 13:51:05 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Mon, 24 Feb 2025 14:51:04 +0100
Subject: [PATCH 14/14] arm64: dts: freescale: Add the BOE av123z7m-n17
 variant of the Moduline Display
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250224-initial_display-v1-14-5ccbbf613543@gocontroll.com>
References: <20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com>
In-Reply-To: <20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740405062; l=3566;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=oTP9B5+eckemcAq7BoHH8WLYSzQY53IU8NlYcoi8TI4=;
 b=aQ+VE0ltCkVpecPynixQhO2jlXkv5MbH2Ub/umJWYy2F2l+LhIXFrAg+miCS5eqAogchWhS3+
 7JLJf8Xl76wCUt081BHlCJk6B9CStdy7l91pUD5HAkmbSCe6tqa6zBQ
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_135112_460050_D9E38AA7 
X-CRM114-Status: GOOD (  12.57  )
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
Reply-To: maudspierings@gocontroll.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Maud Spierings <maudspierings@gocontroll.com>

Add the BOE av123z7m-n17 variant of the Moduline Display, this variant
comes with a 12.3" 1920x720 display.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>

---
Currently the backlight driver is not available, this will be upstreamed
in a future patch series. It is a Maxim max25014atg.
---
 ...tx8p-ml81-moduline-display-106-av123z7m-n17.dts | 133 +++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dts b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dts
new file mode 100644
index 0000000000000000000000000000000000000000..129c69598f38566460efb271628c1d1e10eb2a85
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dts
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2025 GOcontroll B.V.
+ * Author: Maud Spierings <maudspierings@gocontroll.com>
+ */
+
+/dts-v1/;
+
+#include "imx8mp-tx8p-ml81-moduline-display-106.dtsi"
+
+/ {
+	model = "GOcontroll Moduline Display with BOE av123z7m-n17 display";
+
+	panel {
+		compatible = "boe,av123z7m-n17";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_panel>;
+		enable-gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
+		power-supply = <&reg_3v3_per>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				dual-lvds-odd-pixels;
+
+				panel_in0: endpoint {
+					remote-endpoint = <&lvds1_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				dual-lvds-even-pixels;
+
+				panel_in1: endpoint {
+					remote-endpoint = <&lvds0_out>;
+				};
+			};
+		};
+	};
+};
+
+&i2c4 {
+	bridge@2d { /* sn65dsi85 */
+		compatible = "ti,sn65dsi84";
+		reg = <0x2d>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_lvds_bridge>;
+		enable-gpios = <&gpio4 14 GPIO_ACTIVE_HIGH>;
+		vcc-supply = <&reg_1v8_per>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				dsi_lvds_bridge_in: endpoint {
+					remote-endpoint = <&mipi_dsi_out>;
+					data-lanes = <1 2 3 4>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				lvds0_out: endpoint {
+					remote-endpoint = <&panel_in1>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+
+				lvds1_out: endpoint {
+					remote-endpoint = <&panel_in0>;
+				};
+			};
+		};
+	};
+
+	/* max25014 @ 0x6f */
+};
+
+&lcdif1 {
+	status = "okay";
+};
+
+&mipi_dsi {
+	samsung,esc-clock-frequency = <12000000>;
+	/*
+	 * burst has to be at least 2x dsi clock that the sn65dsi85 expects
+	 * display pixelclock * bpp / lanes / 2 = dsi clock
+	 * 88.000.000 * 24 / 4 / 2 = 264.000.000
+	 * range gets rounded up to 265.000.000 - 270.000.000
+	 * 267.500.000 * 2 = 535.000.000
+	 */
+	samsung,burst-clock-frequency = <535000000>;
+	status = "okay";
+
+	ports {
+		port@1 {
+			mipi_dsi_out: endpoint {
+				remote-endpoint = < &dsi_lvds_bridge_in>;
+				data-lanes = <1 2 3 4>;
+			};
+		};
+	};
+};
+
+&iomuxc {
+	pinctrl_lvds_bridge: lvdsbridgegrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_TXD2__GPIO4_IO14 /* COM pin 113 */
+			MX8MP_DSE_X1
+		>;
+	};
+
+	pinctrl_panel: panelgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO07__GPIO1_IO07 /* COM pin 157 */
+			MX8MP_DSE_X1
+			MX8MP_IOMUXC_GPIO1_IO09__GPIO1_IO09 /* COM pin 159 */
+			MX8MP_DSE_X1
+		>;
+	};
+};

-- 
2.48.1



