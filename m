Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C99CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 09:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pt4T5ObMyYagXPbowM8Wn1tRV9x+5vQ2cef3iU5ynik=; b=isvooeqXrA8LOyklc85huo9wxV
	zbU5MlBvrI7olRvJF89yP/hGM6PjqiH7hx7zLVw9QENbC8OwX7XR40B3n1eDxC2Wwe7RUSkYhORER
	dP2tTuaTxOZRBRJ9kXZvP6/dyUSvua+/Cm2+NIVqe7H7JSVQ9gHwdYDFknlEbqFx2rn+wQxzAsxpL
	uyhg/cWrorqXiCHgsFBUbC92xryIt0Gq8pF8a5baYKrlNzPg93jgnvxSM2gFwoRQwjCC4pP8UmIaz
	GmyfyPr7ZYFA8BuzuXCN8kpxlYjBFdomTxDMnXXI3AWL/jmzvdAxtqP87iopRAt1bD3CIRN3nu0MZ
	YJOUcJZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoRa-00000007pKA-2SfZ;
	Fri, 15 May 2026 09:02:54 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoRV-00000007pCi-2949
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 09:02:50 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-367cbac9c37so4729745a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 02:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778835769; x=1779440569; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pt4T5ObMyYagXPbowM8Wn1tRV9x+5vQ2cef3iU5ynik=;
        b=FxsxY2L6p+ZAAi6Uo7qzZJ+2mJEoGurfMx+E8NLAlNnIhjr1yW4SvTOjUxLYj1JjXi
         khS3UmDE3CUbjLrbXRwmVedV5sRIqJdlt8UalLfGvGfzUpLI+9mjjQIxcXlfxak/s9M2
         GS9S1btFVuGrPbzETkpNmdl5dtiLUfHDFjcK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778835769; x=1779440569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pt4T5ObMyYagXPbowM8Wn1tRV9x+5vQ2cef3iU5ynik=;
        b=Xq/BHT6eS2MkAi1bZ73s6C1v3ebX69t8QaIafWO6P5oBl3EUsA4neA6FtwlQ4X+2E+
         SE8Kg5IIEj9WThDndurZ72HDbDQKj3ZgfkI668XwegI3f/1Y/vRRy60bh0lFnTIfqDVF
         IWsDWgC2mv+YgV9MvEVsSeyqrfrWgaLcGpn0QHfTdzs8XXE9IFSSPdZcPLlcMH28YkjC
         kyMF38xMRd/mnpTLfMkKZSRSIPMY2RdaZJUNTo1A5c25Rnr68qIaalpJRNTZ7RS5dEAt
         SlmHMXpVHgvlcaL6izwT+nNd9ubLGLpYOk05KinDt4Vrgpip3JIXFDesjkuCZg/g2AA4
         MjPQ==
X-Forwarded-Encrypted: i=1; AFNElJ/pkEx6TVKagj0c6DYmzaiIt3Degi6xCemDD5uABTaCiLv5OXYcoan6DNEwjZZpIh27iP4nuNz5w0U4gCGaUtOU@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9iUKbIsFXk3dTIy0mEV/bSjFC1DJVUcYeQUm5zdS1V1gL+KC8
	E02xlO0js934ZCKDI20pbqIdJ+9TYIRF4RqnJajgvU2jq54NY2oKGzxzfP5tjjcDHA==
X-Gm-Gg: Acq92OEaSKaMPIcjDy+ixZyMmNKfX0cdfL/Vl4PHbu7mTxPH2+8mZt1xAnQXM6pzWRu
	w1YDpN5V2zye5eKTah/ZOhdzHWMs7bP0/btX+DnNYycseONoNvkNCjpQwI3VN2WrHP4nyCA59Po
	3gfEj1/CwR8Xc4R+KSKl2DR/RfLoV3cf915BSOWfuv6AmwgcGoWUgolRhod86dtVTyRerxl+hzt
	TXLitb4DwAqmgSAeAg53NgnKrF62yo4fOUe6Kl0GcONgKsqbp3sQGtHj0A35Vm2H/aXqMYLUF4z
	CWd/FD4U1K9tKgba/qBY5+NF6swCz54auapEzx5GbPtisA9rk8OuNgxG6VGX2jCjNbeBq2Nj2re
	2X1oJylucuzQYaYFvFHBUwZ5qPKv4BXMHfN3CpVfbG7bu7PJs2EmMpWCfy9wGQSSvDMzyYSIgSc
	fKsOFsALFz2lE60U497HVwRXH/kPPoxx3uWxhjdnLqnIAnHCYMvW8/E5bAXKMHbd90XU+NmRGxF
	xZEkq8D
X-Received: by 2002:a17:90b:1344:b0:366:4782:138c with SMTP id 98e67ed59e1d1-36951b971ccmr3221579a91.17.1778835768758;
        Fri, 15 May 2026 02:02:48 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:b3d8:e32e:c2fc:c31e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2076537a91.7.2026.05.15.02.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:02:48 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH RFC 12/12] arm64: dts: mediatek: mt8188-geralt: Add WiFi/BT as M.2 E-key slot
Date: Fri, 15 May 2026 17:01:48 +0800
Message-ID: <20260515090149.3169406-13-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260515090149.3169406-1-wenst@chromium.org>
References: <20260515090149.3169406-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_020249_572308_EBE56D19 
X-CRM114-Status: GOOD (  17.12  )
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

The MT8188 Geralt design features a chip-on-board WiFi/BT solution. This
is a M.2 E-key WiFi/BT board layout directly inserted into the mainboard
design. The connections to the rest of the board are almost the same as
if it were a separate M.2 card. The only addition is the PMU_EN pin on
the chip; on M.2 cards this would be tied to the primary power source.

Model the chip-on-board WiFi/BT solution as a M.2 E-key slot with PCIe,
USB and auxiliary signals. The PMU_EN pin, which enables the internal
power controls and regulators, is modeled as a regulator fed by the
pp3300_wlan regulator. Since power sequencing is now correctly modeled
using the M.2 E-key slot, drop the "regulator-always-on" property one
pp3300_wlan regulator. Also drop the comment in xhci2 saying "MT7921's
power is controlled by PCIe".

Also drop the voltage range on the pp3300_wlan regulator. This
"regulator" is just a load switch and does not provide any regulation.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8188-geralt.dtsi      | 93 ++++++++++++++++++-
 1 file changed, 89 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index 4cb23595d17b..d7b5eb95ba0f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -86,13 +86,11 @@ pp3300_z1: regulator-pp3300-z1 {
 	pp3300_wlan: regulator-pp3300-wlan {
 		compatible = "regulator-fixed";
 		regulator-name = "pp3300_wlan";
-		regulator-always-on;
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
 		enable-active-high;
 		gpio = <&pio 12 GPIO_ACTIVE_HIGH>;
 		pinctrl-0 = <&wlan_en>;
 		pinctrl-names = "default";
+		/* load switch */
 		vin-supply = <&pp3300_z1>;
 	};
 
@@ -159,6 +157,17 @@ ppvar_mipi_disp_avee: regulator-ppvar-mipi-disp-avee {
 		vin-supply = <&pp5000_z1>;
 	};
 
+	/* PMU_EN pin controls internal regulators and power sequence */
+	wlan_pmu: regulator-wlan-pmu {
+		compatible = "regulator-fixed";
+		regulator-name = "wlan-pmu";
+		enable-active-high;
+		gpio = <&pio 145 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&wlan_pmu_en>;
+		pinctrl-names = "default";
+		vin-supply = <&pp3300_wlan>;
+	};
+
 	reserved_memory: reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -193,6 +202,39 @@ adsp_dma_mem: memory@61000000 {
 			no-map;
 		};
 	};
+
+	wifi-bt-connector {
+		compatible = "pcie-m2-e-connector";
+		pinctrl-names = "default";
+		pinctrl-0 = <&m2_e_key_kill_pins>;
+		vpcie1v8-supply = <&mt6359_vcn18_ldo_reg>;
+		vpcie3v3-supply = <&wlan_pmu>;
+		w-disable1-gpios = <&pio 13 GPIO_ACTIVE_LOW>;
+		w-disable2-gpios = <&pio 14 GPIO_ACTIVE_LOW>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* PCIe for WiFi */
+			port@0 {
+				reg = <0>;
+
+				wifi_ep: endpoint {
+					remote-endpoint = <&pcie_ep>;
+				};
+			};
+
+			/* USB for Bluetooth */
+			port@2 {
+				reg = <2>;
+
+				bt_ep: endpoint {
+					remote-endpoint = <&usb2_ep>;
+				};
+			};
+		};
+	};
 };
 
 &adsp {
@@ -656,6 +698,22 @@ &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie_pins>;
 	status = "okay";
+
+	pcie@0 {
+		compatible = "pciclass,0604";
+		reg = <0 0 0 0 0>;
+		device_type = "pci";
+		num-lanes = <1>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges;
+
+		port {
+			pcie_ep: endpoint {
+				remote-endpoint = <&wifi_ep>;
+			};
+		};
+	};
 };
 
 &pciephy {
@@ -999,6 +1057,14 @@ pins-bus {
 		};
 	};
 
+	m2_e_key_kill_pins: m2-e-key-kill-pins {
+		pins-kill {
+			pinmux = <PINMUX_GPIO13__FUNC_B_GPIO13>,
+				 <PINMUX_GPIO14__FUNC_B_GPIO14>;
+			output-high;
+		};
+	};
+
 	mipi_disp_avdd_en: mipi-disp-avdd-en-pins {
 		pins-en-ppvar-mipi-disp {
 			pinmux = <PINMUX_GPIO3__FUNC_B_GPIO3>;
@@ -1163,6 +1229,13 @@ pins-bus {
 		};
 	};
 
+	wlan_pmu_en: wlan-pmu-en-pins {
+		pins-wlan-pmu-en {
+			pinmux = <PINMUX_GPIO145__FUNC_B_GPIO145>;
+			output-low;
+		};
+	};
+
 	wlan_en: wlan-en-pins {
 		pins-en-pp3300-wlan {
 			pinmux = <PINMUX_GPIO12__FUNC_B_GPIO12>;
@@ -1342,10 +1415,22 @@ vdosys1_ep_ext: endpoint@1 {
 };
 
 &xhci2 {
-	/* no power supply since MT7921's power is controlled by PCIe */
 	/* MT7921's USB BT has issues with USB2 LPM */
 	usb2-lpm-disable;
 	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			usb2_ep: endpoint {
+				remote-endpoint = <&bt_ep>;
+			};
+		};
+	};
 };
 
 #include <arm/cros-ec-keyboard.dtsi>
-- 
2.54.0.563.g4f69b47b94-goog


