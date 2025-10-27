Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2571CCCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 09:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TCQDnPWqowHG59QXmb0jLVkKI2rjRu35406X3JQiDVY=; b=4B+UpE2n0h2LfkoZPu2JiglWy0
	DmQycZZ/VdxW4ayhLAkNUMj8pl8rXYZjW5yBrkzxMJ59SClmgvX60HXw+FUr8O0N7TFGAanHQ/nvZ
	jeFiLmRCJuhaFj43fs6SY9vqQv3aKcWTIuLpijpU4XV6Hs5ha0f6BdACeukBY+lr+MzepZhLXB+YV
	ZRQTIqyWfWqEhmNsGxalj2ymUJpwLaqWwLQOC3sjjtlgDpOgM8rNxnN+PgIfNV+1m06leGVNtmRpk
	m7EYrS0m6WwNBX6WVCCdBsyqzpofYmG30fIcu944avxU335irBEPOaMknHTDOIlNEKk+zNFXKy8ph
	ywaW0cjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJaa-0000000DXvT-1qRy;
	Mon, 27 Oct 2025 09:32:32 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJaV-0000000DXsr-2yxx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 09:32:28 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b6d402422c2so1053876966b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 02:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761557546; x=1762162346; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TCQDnPWqowHG59QXmb0jLVkKI2rjRu35406X3JQiDVY=;
        b=hxhnNWk+XiIm28l3A2AQwtUuznZWUPGVApyITC8/oNA2iW2JREFweZAo32VIK7EosZ
         ZWzuncm6oGXsLOf0jsg6YHg5rv9MKvj8WUlQ3iO/kjRhgpkyc5hxwtCoFWzOGGrv4i0Z
         c2MycjomGx7RNNRPfotcxQniBQC1yTRzUDqwRWgL+KNIPvMu3Pdz3MVEq7XvIazQb30E
         j6NBqVNsH6AI6V9TuDaCrRqSj4IGqssCDyTFwaXgU25uZClbNTvNYzpEv3hmViMvNERn
         NMQrTxXsqpVurMmqYDKmRKZJRAyAM0NXFqDL/TfVvGAhndp9wzDq3ZfwdHa2aeb7PlKk
         AvnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761557546; x=1762162346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TCQDnPWqowHG59QXmb0jLVkKI2rjRu35406X3JQiDVY=;
        b=Su12wHkr2YgUvcaVKvtzE6RkKN8ls+Th00F5TbuTpWHAWMq6QFxS5ibvOTilve9a4v
         +zMzIRMZOd7RYZJ8dHSsdgEfeoijr36J/T4+Sw1R5m3FI6xrNj5yIpVt9PdlLsPiZmVM
         K1z0XlvYBAaaomehYc+F+eV536zcBi+lQ3r/kI3fkV0xQXrlvVHjzI4XXOjuEbP7EkKX
         Vd9TZDAWpIASNLTVMUxjVaIzyUP8jBHSPUm8Q83hnb3L/QbhARQoSNy1YjEbKq6E80SQ
         xX3L+MkasXCGtUVI5Y8jOIS7+Wl4JIbd1rIHn4uj+hsJGlR3y9//eeuGtP/g6dTH//hI
         iodw==
X-Forwarded-Encrypted: i=1; AJvYcCWHs94ggvtaZK67UlHs/VGNS/gxZjOKiBYPkDlBOrzeXHJFNiCpEiGtbJfBqRFxzZVN4AOi8RvRJtBoFgwiBVZb@lists.infradead.org
X-Gm-Message-State: AOJu0YyzGsuGWhwFb09wby1WjgH87BK2eLbQGYPUWDjJd/Bznar1hfE4
	jaIep992NeOqzGt8QbQ4ZM1uI3fGfOWgq1Fo4r0iVngIJZ/oWK48Sw24
X-Gm-Gg: ASbGncsOdNyo8vRGQr/fm52/5990b8+bBZ29czW3Dits9GIpCAH4mMSTwkw0eylP3Uc
	AobeZuS+2NvJWGUUDy08g4W22xzCLUGdAMwkHDqDO63h3TAYYy1+c/V2wGVA6eTNhsIqYJttGcZ
	Xhy6tm+scVh/uiWCQ2J5DVGH8Hh0u8mFznp03aBJCMfY26f98iWpFfttzGo1OoJsS3NzPHulInb
	l9CxtMrx+0M9UjnD9v3cXu2wi1dIM5ikZTRiySaWibOr6KSoTFDNSYMXBWlFS16iUX6Jj8JOf/6
	oWn91WETlzpKiymUfEgbE8LdIv9edIWlCAJncDe52/K975AOIxg7qKgIK93p4DBMz9H7MspeFD8
	Dg6JTuYElBWfuhgfRgvPRJzngsP2IhdumW+y4kkt10ZRoeMz0InzY+V50uVZbezmPyM54wcczQE
	owSwNihzYt/0j2j02DRyQguvufogu/DZPOuw4DZoz2TQ7j3cSzcweEkFxMJ22zLA4xMnYzCHWtx
	8YXXg==
X-Google-Smtp-Source: AGHT+IGjcZLCWHusJQ+RRTOnS62EVI4AzVgjShANu+qiEsSh8iA493hRxBFjM7nRHQfw9gIc6kKZYg==
X-Received: by 2002:a17:906:4fc4:b0:b3a:b22e:dd35 with SMTP id a640c23a62f3a-b6471d45a69mr4222583766b.2.1761557545758;
        Mon, 27 Oct 2025 02:32:25 -0700 (PDT)
Received: from toolbox.int.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e7ef6be28sm5681014a12.2.2025.10.27.02.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 02:32:25 -0700 (PDT)
From: max.oss.09@gmail.com
To: Max Krummenacher <max.krummenacher@toradex.com>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/5] arm64: dts: imx8-apalis: add thermal nodes
Date: Mon, 27 Oct 2025 10:30:08 +0100
Message-ID: <20251027093133.2344267-3-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20251027093133.2344267-1-max.oss.09@gmail.com>
References: <20251027093133.2344267-1-max.oss.09@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_023227_765021_A3A5DA04 
X-CRM114-Status: GOOD (  12.69  )
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

From: Max Krummenacher <max.krummenacher@toradex.com>

Add the thermal-zones and cooling-maps nodes for the PMIC device.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---

 .../boot/dts/freescale/imx8-apalis-v1.1.dtsi  | 30 +++++++++++++++++--
 .../dts/freescale/imx8qm-apalis-v1.1.dtsi     | 10 ++++++-
 2 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
index 6ebeade2ce72..686fce7443bb 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
@@ -226,6 +226,34 @@ sound-spdif {
 		spdif-out;
 	};
 
+	thermal-zones {
+		pmic-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <2000>;
+			thermal-sensors = <&tsens IMX_SC_R_PMIC_0>;
+
+			cooling-maps {
+				cooling_maps_map0: map0 {
+					trip = <&pmic_alert0>;
+				};
+			};
+
+			trips {
+				pmic_alert0: trip0 {
+					hysteresis = <2000>;
+					temperature = <110000>;
+					type = "passive";
+				};
+
+				pmic_crit0: trip1 {
+					hysteresis = <2000>;
+					temperature = <125000>;
+					type = "critical";
+				};
+			};
+		};
+	};
+
 	touchscreen: touchscreen {
 		compatible = "toradex,vf50-touchscreen";
 		interrupt-parent = <&lsio_gpio3>;
@@ -833,8 +861,6 @@ &spdif0 {
 	status = "okay";
 };
 
-/* TODO: Thermal Zones */
-
 /* TODO: Apalis USBH2, Apalis USBH3 and on-module Wi-Fi via on-module HSIC Hub */
 
 /* Apalis USBH4 */
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1.dtsi
index b1c3f331c4ed..8a37cbe922ac 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1.dtsi
@@ -11,4 +11,12 @@ / {
 	model = "Toradex Apalis iMX8QM V1.1";
 };
 
-/* TODO: Cooling Maps */
+&cooling_maps_map0 {
+	cooling-device =
+		<&A53_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+		<&A53_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+		<&A53_2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+		<&A53_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+		<&A72_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+		<&A72_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+};
-- 
2.42.0


