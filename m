Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A25CCF2E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 11:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pAuGbpbYIgMLYkQDiOfgLoi1DhXaRQoxjNR6h+bBZU0=; b=dSi1CnrbY+AxqEDZllhf5mrBuX
	GAi8p3L/K0zRuwrcampAZhKw/bQxpukZ9eQii/lxhjv9hnIpNzq5TXyDP/n86dBCzQx/TGJpSIW1R
	vd6BuFYoBhy2rdJjRx9yScGfs4EBVrMKBz2QjGUv/6PodzmReTuBfKgE+ESvfxC8eYUKO9P9HJLW9
	NImauNZomDGz1Hc6KwqXlqCHw/UsEhU5wGKywkzj3k20RwigHdBICpvd6iNLviu1lYDjpmD59ukgw
	fGVotPzyYjy0TvBinq9Xm2zL97w8CuPXngdLAsi2Ro/G7Tb4uyO+EReWt2lVYu8yn3OaEcwp7sLLR
	LHa02IWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIlOT-00000007HC2-0ayY;
	Mon, 19 Oct 2026 11:19:05 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIlOC-00000007H2M-45g3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 11:18:50 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-48c45111bebso1198064f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 04:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792408727; x=1793013527; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pAuGbpbYIgMLYkQDiOfgLoi1DhXaRQoxjNR6h+bBZU0=;
        b=h/o9fvo8f4M7sfO8YqR6IrbKh5C38utFq84AQVTBag3lvz4E+T0G8y6ho+WU66nWhX
         ueSf/suHgh4CteztMFi7BnoOrNv60NlkypwyjGN6ntanXJilj7riwtTGGETDeXWt1Vpo
         e7KXkdNb2EdDvpAPZbU37+Jv2ayK5lDWeONQ5rArtohsUEu5HQ7WbgfLoHDUr75JxkKm
         6b+TNrznAwtJGXEFLY5tszcSBIXBDM0qMe7ZPedjrwuvtcCiFb2Uyqm1JFGcTMJfDZLY
         jKiaJOwkwJrumSsySBKH+FoTV+5PO8eN1ViBy1dQmfSc66NHwqalSjTvikyoV2+f8Wkh
         GQvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792408727; x=1793013527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pAuGbpbYIgMLYkQDiOfgLoi1DhXaRQoxjNR6h+bBZU0=;
        b=taWGWJPPsbwOVnwq+aG9CS4WMJekyH+d2K2UlkaDzG+FWYO8ZKf32z2dlo9GIbpFJ0
         K7F8rXQ0lFaILK1tyDn/tAIQogv/rox+siA4IWZmQ0pCOOfZGY2T1Mgt84jPu1Rwghhg
         yP1/1jkaHIWsIu4XUmOgXFrr7a8DZvWiPkg+Zno/D+VgZV96jIW8L53zXWNPeaf5URO5
         PxwUYg7uvAkfXJBw6gTR9Z8i8GI2ABW9ZafT1R8oGgU0560loOD1Y9QECsrMnQZ0wBP7
         9GEGuQydWmRKbJIGFE5cWGj82hTXuj0OHkzHEfM517R/LqXCSdpnGD407mIkg1kwUpWN
         Hczw==
X-Forwarded-Encrypted: i=1; AKwUvByh7y068qRfWQc4+yP4bRGsG5sFVpxblGIFdikR9lz3kH+6TsXQwg7iixZksnVeoyMiUVUkzPvzI7krp48/T2LD@lists.infradead.org
X-Gm-Message-State: AFq9FYJhV73dUFLlZWxmaG9cV4lyyUjNV12erPO45WpTbmJ2VPhICw/F
	hcZlGlLc/84lyLbQge4VnlcUTpkhBpUwVNlbBbG3cWrpFDKSn6hTd0xl
X-Gm-Gg: AYBFou3hlhmVs19jMfoFXVsvtHNSyDgclEr00VFokhi1ePBRPNc/Y4NqvWcLmhuKmFL
	ESoAYfghhJ2vRIz0cLBpb3yO8a/zZJZTpECrg43UWYCiSZxW5iiHvGEBwtQ1jsKx7uVRfCO1p0i
	ORyBx5MVFEb+TbHJWB1KAc2dcPTcuWA99FL5EFtuoZPiQTxbqGqYYrXTmt1B+LnZnGch+NmRc5z
	rXzAtCRIypNZUS24ZZVL/bdkaEIOmzmiPKqhVh8c+cv+0cItIN41IFFC0nYpkrfdHLfbrvKeLmb
	ca1DBGFbMmhjJw5QAXrin40kXGrm7fQNzST8n/TZlyXR0IRvMQ1xsMzC+xeO+D8Kg1xsuBqzAYi
	0f8y/xDcFAOcm6rxWCTc+TK0Lv0/NjuxqZcxkrmJjebdxHhuUAnlMMnq33oCGH5L9kR3GyxyVzr
	PY4gsl6uEKOGgqPioDpSs5ZSuLpbFZ6rvXI/8h7cK7jojiNn3SaN/l6dwypidGDVj2w53ae3uiE
	6jAu+Mr0FJnCamVIYvUQmeoai8o343S9OlVNBaDKhvvxXFHbawUBZj3PgGK1UQYTogAgagxMrEg
	NnSqBt6E4Bv9GWaenjcQL1t1UMLqW4bl
X-Received: by 2002:a05:600c:8883:b0:4a1:80d8:aed0 with SMTP id 5b1f17b1804b1-4a1d75fe793mr119911565e9.15.1792408726899;
        Mon, 19 Oct 2026 04:18:46 -0700 (PDT)
Received: from [10.0.0.136] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1e3ebb3aasm193183505e9.0.2026.10.19.04.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:18:45 -0700 (PDT)
From: Antoine Gouby <antoine.gouby@gmail.com>
Date: Mon, 19 Oct 2026 13:18:34 +0200
Subject: [PATCH 5/5] ARM: dts: imx6dl-colibri: Add VGA overlay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-colibri-imx6-overlays-v1-5-e4d028727382@toradex.com>
References: <20261019-colibri-imx6-overlays-v1-0-e4d028727382@toradex.com>
In-Reply-To: <20261019-colibri-imx6-overlays-v1-0-e4d028727382@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Antoine Gouby <antoine.gouby@toradex.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4928;
 i=antoine.gouby@toradex.com; h=from:subject:message-id;
 bh=rV4clumIvWpWiwOoIzG+2Vz7clpxc4eRzzo4Zecgm0w=;
 b=owGbwMvMwCWm0rPo7MxLN2YynlZLYsi6+qf/+ASOA7KLGI0Sl+RfY77752CpqZbW1ZVrq9wvJ
 3kF9zW2d5SyMIhxMciKKbJkPFEV5FMIkfXgaE6GmcPKBDKEgYtTACYyR56R4bZtUbmP2NJL336z
 Gx29MdP83MySSVlKgtWTxI/Y6wZOms7I0GW5/a3el2tSyTHfSqpczIW/cHofVb0QxnUiMi/g1QZ
 xJgA=
X-Developer-Key: i=antoine.gouby@toradex.com; a=openpgp;
 fpr=68E425110E20541D48088363248CA2CD99D2D899
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_041849_149243_9AAC4CEB 
X-CRM114-Status: GOOD (  15.77  )
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

From: Antoine Gouby <antoine.gouby@toradex.com>

Add a device tree overlay for the VGA output on the Colibri iMX6
parallel RGB LCD interface. The VGA output is driven through a
non-programmable video DAC without VESA DDC I2C signals to a DVI
connector. The DAC power-save input is driven by the BL_ON signal on
SODIMM 71, like on the Colibri iMX6ULL and Colibri iMX7.

The overlay is also combined with the Colibri iMX6 V1.2 Aster,
Evaluation Board v3, Iris and Iris v2 carrier board device trees to
provide ready-to-use DTBs.

Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                | 21 +++++++
 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-vga.dtso | 67 +++++++++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 1ea51b13ab7c..11fcef5195c8 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -84,6 +84,10 @@ imx6dl-colibri-v1.2-aster-panel-cap-touch-7inch-parallel-dtbs := \
 	imx6dl-colibri-v1.2-aster.dtb \
 	imx6dl-colibri-panel-cap-touch-7inch-parallel.dtbo
 
+imx6dl-colibri-v1.2-aster-vga-dtbs := \
+	imx6dl-colibri-v1.2-aster.dtb \
+	imx6dl-colibri-vga.dtbo
+
 imx6dl-colibri-v1.2-eval-v3-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx6dl-colibri-hdmi.dtbo
@@ -96,10 +100,18 @@ imx6dl-colibri-v1.2-eval-v3-panel-res-touch-7inch-parallel-dtbs := \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx6dl-colibri-panel-res-touch-7inch-parallel.dtbo
 
+imx6dl-colibri-v1.2-eval-v3-vga-dtbs := \
+	imx6dl-colibri-v1.2-eval-v3.dtb \
+	imx6dl-colibri-vga.dtbo
+
 imx6dl-colibri-v1.2-iris-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-iris.dtb \
 	imx6dl-colibri-hdmi.dtbo
 
+imx6dl-colibri-v1.2-iris-vga-dtbs := \
+	imx6dl-colibri-v1.2-iris.dtb \
+	imx6dl-colibri-vga.dtbo
+
 imx6dl-colibri-v1.2-iris-v2-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
 	imx6dl-colibri-hdmi.dtbo
@@ -108,6 +120,10 @@ imx6dl-colibri-v1.2-iris-v2-panel-cap-touch-7inch-parallel-dtbs := \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
 	imx6dl-colibri-panel-cap-touch-7inch-parallel.dtbo
 
+imx6dl-colibri-v1.2-iris-v2-vga-dtbs := \
+	imx6dl-colibri-v1.2-iris-v2.dtb \
+	imx6dl-colibri-vga.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -154,15 +170,20 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-colibri-v1.2-aster.dtb \
 	imx6dl-colibri-v1.2-aster-hdmi.dtb \
 	imx6dl-colibri-v1.2-aster-panel-cap-touch-7inch-parallel.dtb \
+	imx6dl-colibri-v1.2-aster-vga.dtb \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx6dl-colibri-v1.2-eval-v3-hdmi.dtb \
 	imx6dl-colibri-v1.2-eval-v3-panel-cap-touch-7inch-parallel-touch-adapter.dtb \
 	imx6dl-colibri-v1.2-eval-v3-panel-res-touch-7inch-parallel.dtb \
+	imx6dl-colibri-v1.2-eval-v3-vga.dtb \
 	imx6dl-colibri-v1.2-iris.dtb \
 	imx6dl-colibri-v1.2-iris-hdmi.dtb \
+	imx6dl-colibri-v1.2-iris-vga.dtb \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
 	imx6dl-colibri-v1.2-iris-v2-hdmi.dtb \
 	imx6dl-colibri-v1.2-iris-v2-panel-cap-touch-7inch-parallel.dtb \
+	imx6dl-colibri-v1.2-iris-v2-vga.dtb \
+	imx6dl-colibri-vga.dtbo \
 	imx6dl-cubox-i.dtb \
 	imx6dl-cubox-i-emmc-som-v15.dtb \
 	imx6dl-cubox-i-som-v15.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-vga.dtso b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-vga.dtso
new file mode 100644
index 000000000000..f22f1969a6a8
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-vga.dtso
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * VGA output connected to the Colibri parallel RGB LCD interface through a
+ * non-programmable video DAC with a DVI connector.
+ *
+ * The VGA output is available on multiple carrier boards (including Iris,
+ * Eval, Aster) without VESA DDC I2C signals.
+ *
+ * The DAC power-save input is driven by the BL_ON signal on SODIMM 71.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	vga-encoder {
+		compatible = "dumb-vga-dac";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_bl_on>;
+		/* Colibri SODIMM 71 - BL_ON */
+		enable-gpios = <&gpio3 26 GPIO_ACTIVE_HIGH>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				vga_enc_in: endpoint {
+					remote-endpoint = <&lcd_display_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				vga_enc_out: endpoint {
+					remote-endpoint = <&dvi_connector_in>;
+				};
+			};
+		};
+	};
+
+	dvi-connector {
+		compatible = "dvi-connector";
+		analog;
+
+		port {
+			dvi_connector_in: endpoint {
+				remote-endpoint = <&vga_enc_out>;
+			};
+		};
+	};
+};
+
+&lcd_display {
+	status = "okay";
+};
+
+&lcd_display_out {
+	remote-endpoint = <&vga_enc_in>;
+};

-- 
2.55.0


