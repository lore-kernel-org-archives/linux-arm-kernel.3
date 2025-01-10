Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1675DE7719C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 13:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X+ydmhpp1ri+ZdLuckw0JQJHXAllkad5qgHwwB9SlMQ=; b=zmkEGD7CEFQmf7XLgeuOyIgLV8
	du95sA8EL26vzjHbqculfqFzbpDAlLMJFCAPNQCQKQfRl/G5axdA7EZf6hlBJuv5CSVi3Ws8xU02Q
	7Xyfl5ioYePz6Suk89VvWMaE2Q5oXWhFQWexqfhKw/2jtZdmdUgwfYlT1flZlWlWMVd3CZDnfH7xN
	/dwrbKtgiDr1GDdWHI7harp0SE0Bf4gPt0ckEt7fZWBftr3l9YpfP23j1X07s4TNQOCJppE/LlnFM
	sx46pLts+oxWLi6bNbPg+57vNTIFQOkEW34ZXteUSoe5B4J1GiH3msn6k3fL7zXagjBBrECTew/WO
	iSdhjRdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWFFN-0000000FVdC-0CzT;
	Fri, 10 Jan 2025 13:40:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWF6r-0000000FTwQ-42PF
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Jan 2025 13:31:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=X+ydmhpp1ri+ZdLuckw0JQJHXAllkad5qgHwwB9SlMQ=; b=VjdhxIIEVSgPZ5jUL6OgnU9Ear
	jfDhNxL/cbi7vPzwm3CYjSLeMKd1nzqd/pzv6w6go4F0SIwREh4u8fr13clk15PkhW/WQOKgFo7U6
	8dEB6KOtcY6JFI1ckaGw6iJHLcG7XUd2bZzqzpROZa7PdvBqJmxUzKsKDoQ2CgQJftZ12djZ70tsg
	D4JKAN7hR0W6hMjno9VMJX2YnPUuLWiJBqFO7yjMpS/T7Pz/DK6fb7ZTYDe9tb9dpyJQVG0d58zPw
	P2X3HfcY3w7cc3Udk5EtVhPtcGolKhtMsWxckicpOe0/VgEA5ji6uKIUTOygy/qCzX1USgF57Dsyg
	IFje6rtQ==;
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWF6p-00000009mBC-0ec0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 13:31:32 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso15070775e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 05:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736515889; x=1737120689; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X+ydmhpp1ri+ZdLuckw0JQJHXAllkad5qgHwwB9SlMQ=;
        b=Eu1t2Wxyd08AK3FuDMbCOtsQKiwrKTWoyzDa43HBROFw6ldUU1F5th6g3yyx5Iuzu5
         rEwQIA36fOntNZuKkYMaMUuKW8+/MfhpQxT7jKGyotuP7t2WkHpU3kJAwP0NltWDrkef
         QST8MicMXLkEMZOcldcQsWn1luaFWpXqBnDiUJ8WP+UMV42MUy3sYGGuxEqn9CoIDUq/
         1t9pzpjq7KmFxYdqi3ov3j6ctWLQFO8H9gmDPUamrpzLB1IJGbm7sdPkqMnKMVCcuJ/q
         owZQve0rcx/BoIYhGi2qugg0LX9y5krRQPUSOlCIrJBky6ekR5rR1FmT12maN5/AbYjy
         kyOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736515889; x=1737120689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X+ydmhpp1ri+ZdLuckw0JQJHXAllkad5qgHwwB9SlMQ=;
        b=JgzyuBjwaaYSYmop3oIfMytAkw5+DxTY8Oh9iV1/ve7uJkfwQ/NSa6T9wLgstbotYM
         QoGKHMAt0u8LIHGOv+GgusdYZikKbcyoeBgvXkQ5sHb35TG2tlg2h3sYZZrfL5+I/4aA
         v0Qu85NmsIx6EkVZ8u0sbecoRP2XMYk8Mc+L7k+Hed0BV2TZdx9ieMqE8rP3lYj4pyGs
         Dd06zk3bo+ZikwWcVYkHUeYwXzIcH46HGeQ1AYZRmrRMTYZgN5jNee+hgONNIPYat4Ct
         ntxDyg6FlYOp3ikEAyRf4feaZYmSPjOL4mhKoeICJ3eGQ5CTJLl0UrmfYONts8adn10v
         a3tA==
X-Forwarded-Encrypted: i=1; AJvYcCX5Upoiw4zL1SXj++MPXJa8iEm2y/UpqR5hOSKpQ8Bf7D9i1gNAPBfpaqhiLnrNXf6TBgqyuRXroDeFyDquhXJV@lists.infradead.org
X-Gm-Message-State: AOJu0YwJtlSrLN+VAkvJD4ifAFeE5tPGI5RBfWhi2p2LvT6D22i6GQ47
	xF7mTuIGgtCtQS+yyNAOn8F/h63qMK5qRcxWkMNSLL8BsCsE3BIByY0Mi5WvDmc=
X-Gm-Gg: ASbGnctF6SvXHT6/UZEBOX16NQ35RtHXoLhJjepZijudwVUs9mslzPc/Unq15iLU90c
	OY9jsJMdIKb9Ht9iEPWmA9JY07GkR8DoWwpoCLiB9wCOI5Tvym9OkmqhxyHeSOdmxoFKGfgfAPa
	XQrvhSm8qPX+5B/f7CrhC4KlAZM80cbzE8UVJmMHGXprajBrfGj3RbPHqXhJQgcdOjYDMwEw6De
	pfACGMc4hqrCXoeNxdfhbv/D6P+AsxWGQGKqRvPxDq2+bot/I68cj/e5vbT
X-Google-Smtp-Source: AGHT+IHOgBZiG80PdI6gQkHthMh4B3T84IIQ+Ibyw1a2z2GuYKQogQiNJn1l8VXim5ZVmA32oxHBEg==
X-Received: by 2002:a05:600c:5129:b0:434:a315:19c with SMTP id 5b1f17b1804b1-436e2697002mr94418255e9.3.1736515888894;
        Fri, 10 Jan 2025 05:31:28 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:2555:edac:4d05:947d])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a8e38c990sm4598193f8f.56.2025.01.10.05.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 05:31:28 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 10 Jan 2025 14:31:16 +0100
Subject: [PATCH v7 6/6] arm64: dts: mediatek: add display support for
 mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v7-6-6703f3e26831@baylibre.com>
References: <20231023-display-support-v7-0-6703f3e26831@baylibre.com>
In-Reply-To: <20231023-display-support-v7-0-6703f3e26831@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8129; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=mR5QEUL3a78L+sYq6qQGF6wk0gc8QlcnD6i8hjpBduI=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBngSEnfupoAl+fwmQa5qOSTPAbmJIL6hR4373elmf0
 458SX+OJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ4EhJwAKCRArRkmdfjHURW0yEA
 CuPFV9Fo6HVc/tU0xJSXz0nxrF5RnoRINBK8NcymyFOqgQ01YsgxmbQ7EOkMpZYEC7rwdPEf6m76kL
 IO/J742uJp4PrMo8y5HIT2M7JHt2iDeN+6lqD6l2LLbrR4PB8/jbm7+MUx3sWb1glQ4gZR6+PYP2ly
 BYtfizhiXHI2fbUlTx7hAJgI4UJLH6GknFmdymks71QFUuZCagNVeLyOmOz4n8SAVG01Q3gI0wOy0O
 I/PssY++/CDoMTCrOBDCYnGZFl7c9Gn6RGqnQqib56iAqpEASBVClNvZzLI77agTswyIF9/F6qG3Mh
 DlGuJClcHtx286YeKZV434rSLbrSo2U5ekcdDXVLTeOlu5sh1DlYuqiRvFDEGNXI/D4hIno2QfP8v1
 3FBi7DJgSLQ3mOSvxnMYDGwmIR0PJwbpBs4b2p95Eqoxmh3EFsD7Zi+gGLaGOrAUG6i30g98EN+IgH
 fwJ90H/YGThYyhQjfG6fS5F5jW+TIfTIBEfKBvN0OBqOYXeUuT+bG33biHBX7STnySbNYx8Zv4n6Wg
 SZ1YJOMRWqt9HOeyPee9j6r4VSI8h6iGHLzCb8ehS2wGCL8JFzWnOwlG0SNDmbnJR+/UWWVeuIiqxJ
 178DdqVE7lEUy5fqMHXVmbU16vtFtLiOPcwjFfpGTWAUAt8ohG3kV0Soznzg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_133131_352542_A3F7047B 
X-CRM114-Status: GOOD (  15.52  )
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

MIPI DSI:
- Add "vsys_lcm_reg" regulator support and setup the "mt6357_vsim1_reg",
to power the pannel plugged to the DSI connector.
- Setup the Display Parallel Interface.
  - Add the startek kd070fhfid015 pannel support.

HDMI:
- Add HDMI connector support.
- Add the "ite,it66121" HDMI bridge support, driven by I2C1.
- Setup the Display Parallel Interface.

Fix a typo in the ethernet node.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 245 +++++++++++++++++++++++++++-
 1 file changed, 244 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 7d90112a7e27..c72b2f6f8ef4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -27,6 +27,21 @@ chosen {
 		stdout-path = "serial0:921600n8";
 	};
 
+	connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "d";
+
+		port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			hdmi_connector_in: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&hdmi_connector_out>;
+			};
+		};
+	};
+
 	firmware {
 		optee {
 			compatible = "linaro,optee-tz";
@@ -104,6 +119,16 @@ sound: sound {
 		pinctrl-5 = <&aud_mosi_on_pins>;
 		mediatek,platform = <&afe>;
 	};
+
+	vsys_lcm_reg: regulator-vsys-lcm {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&pio 129 GPIO_ACTIVE_HIGH>;
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		regulator-name = "vsys_lcm";
+	};
+
 };
 
 &afe {
@@ -131,13 +156,102 @@ &cpu3 {
 	sram-supply = <&mt6357_vsram_proc_reg>;
 };
 
+&dither0_out {
+	remote-endpoint = <&dsi0_in>;
+};
+
+&dpi0 {
+	pinctrl-0 = <&dpi_default_pins>;
+	pinctrl-1 = <&dpi_idle_pins>;
+	pinctrl-names = "default", "sleep";
+	/*
+	 * Ethernet and HDMI (DPI0) are sharing pins.
+	 * Only one can be enabled at a time and require the physical switch
+	 * SW2101 to be set on LAN position
+	 */
+	status = "disabled";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+			dpi0_in: endpoint@1 {
+				reg = <1>;
+				remote-endpoint = <&rdma1_out>;
+			};
+		};
+
+		port@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+			dpi0_out: endpoint@1 {
+				reg = <1>;
+				remote-endpoint = <&it66121_in>;
+			};
+		};
+	};
+};
+
+&dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	panel@0 {
+		compatible = "startek,kd070fhfid015";
+		reg = <0>;
+		enable-gpios = <&pio 67 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&pio 20 GPIO_ACTIVE_HIGH>;
+		iovcc-supply = <&mt6357_vsim1_reg>;
+		power-supply = <&vsys_lcm_reg>;
+
+		port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			panel_in: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&dsi0_out>;
+			};
+		};
+	};
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+			dsi0_in: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&dither0_out>;
+			};
+		};
+
+		port@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+			dsi0_out: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&panel_in>;
+			};
+		};
+	};
+};
+
 &ethernet {
 	pinctrl-0 = <&ethernet_pins>;
 	pinctrl-names = "default";
 	phy-handle = <&eth_phy>;
 	phy-mode = "rmii";
 	/*
-	 * Ethernet and HDMI (DSI0) are sharing pins.
+	 * Ethernet and HDMI (DPI0) are sharing pins.
 	 * Only one can be enabled at a time and require the physical switch
 	 * SW2101 to be set on LAN position
 	 * mt6357_vibr_reg and mt6357_vsim2_reg are needed to supply ethernet
@@ -161,6 +275,56 @@ &i2c0 {
 	status = "okay";
 };
 
+&i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-div = <2>;
+	clock-frequency = <100000>;
+	pinctrl-0 = <&i2c1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	it66121_hdmi: hdmi@4c {
+		compatible = "ite,it66121";
+		reg = <0x4c>;
+		#sound-dai-cells = <0>;
+		interrupt-parent = <&pio>;
+		interrupts = <68 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&ite_pins>;
+		pinctrl-names = "default";
+		reset-gpios = <&pio 69 GPIO_ACTIVE_LOW>;
+		vcn18-supply = <&mt6357_vsim2_reg>;
+		vcn33-supply = <&mt6357_vibr_reg>;
+		vrf12-supply = <&mt6357_vrf12_reg>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0>;
+				it66121_in: endpoint@0 {
+					reg = <0>;
+					bus-width = <12>;
+					remote-endpoint = <&dpi0_out>;
+				};
+			};
+
+			port@1 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <1>;
+				hdmi_connector_out: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+	};
+};
+
 &mmc0 {
 	assigned-clock-parents = <&topckgen CLK_TOP_MSDCPLL>;
 	assigned-clocks = <&topckgen CLK_TOP_MSDC50_0_SEL>;
@@ -205,6 +369,11 @@ &mt6357_pmic {
 	mediatek,micbias1-microvolt = <1700000>;
 };
 
+&mt6357_vsim1_reg {
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <1800000>;
+};
+
 &pio {
 	aud_default_pins: audiodefault-pins {
 		clk-dat-pins {
@@ -267,6 +436,49 @@ clk-dat-pins {
 		};
 	};
 
+	dpi_default_pins: dpi-default-pins {
+		pins {
+			pinmux = <MT8365_PIN_0_GPIO0__FUNC_DPI_D0>,
+				 <MT8365_PIN_1_GPIO1__FUNC_DPI_D1>,
+				 <MT8365_PIN_2_GPIO2__FUNC_DPI_D2>,
+				 <MT8365_PIN_3_GPIO3__FUNC_DPI_D3>,
+				 <MT8365_PIN_4_GPIO4__FUNC_DPI_D4>,
+				 <MT8365_PIN_5_GPIO5__FUNC_DPI_D5>,
+				 <MT8365_PIN_6_GPIO6__FUNC_DPI_D6>,
+				 <MT8365_PIN_7_GPIO7__FUNC_DPI_D7>,
+				 <MT8365_PIN_8_GPIO8__FUNC_DPI_D8>,
+				 <MT8365_PIN_9_GPIO9__FUNC_DPI_D9>,
+				 <MT8365_PIN_10_GPIO10__FUNC_DPI_D10>,
+				 <MT8365_PIN_11_GPIO11__FUNC_DPI_D11>,
+				 <MT8365_PIN_12_GPIO12__FUNC_DPI_DE>,
+				 <MT8365_PIN_13_GPIO13__FUNC_DPI_VSYNC>,
+				 <MT8365_PIN_14_GPIO14__FUNC_DPI_CK>,
+				 <MT8365_PIN_15_GPIO15__FUNC_DPI_HSYNC>;
+			drive-strength = <4>;
+		};
+	};
+
+	dpi_idle_pins: dpi-idle-pins {
+		pins {
+			pinmux = <MT8365_PIN_0_GPIO0__FUNC_GPIO0>,
+				 <MT8365_PIN_1_GPIO1__FUNC_GPIO1>,
+				 <MT8365_PIN_2_GPIO2__FUNC_GPIO2>,
+				 <MT8365_PIN_3_GPIO3__FUNC_GPIO3>,
+				 <MT8365_PIN_4_GPIO4__FUNC_GPIO4>,
+				 <MT8365_PIN_5_GPIO5__FUNC_GPIO5>,
+				 <MT8365_PIN_6_GPIO6__FUNC_GPIO6>,
+				 <MT8365_PIN_7_GPIO7__FUNC_GPIO7>,
+				 <MT8365_PIN_8_GPIO8__FUNC_GPIO8>,
+				 <MT8365_PIN_9_GPIO9__FUNC_GPIO9>,
+				 <MT8365_PIN_10_GPIO10__FUNC_GPIO10>,
+				 <MT8365_PIN_11_GPIO11__FUNC_GPIO11>,
+				 <MT8365_PIN_12_GPIO12__FUNC_GPIO12>,
+				 <MT8365_PIN_13_GPIO13__FUNC_GPIO13>,
+				 <MT8365_PIN_14_GPIO14__FUNC_GPIO14>,
+				 <MT8365_PIN_15_GPIO15__FUNC_GPIO15>;
+		};
+	};
+
 	ethernet_pins: ethernet-pins {
 		phy_reset_pins {
 			pinmux = <MT8365_PIN_133_TDM_TX_DATA1__FUNC_GPIO133>;
@@ -308,6 +520,33 @@ pins {
 		};
 	};
 
+	i2c1_pins: i2c1-pins {
+		pins {
+			pinmux = <MT8365_PIN_59_SDA1__FUNC_SDA1_0>,
+				 <MT8365_PIN_60_SCL1__FUNC_SCL1_0>;
+			bias-pull-up;
+		};
+	};
+
+	ite_pins: ite-pins {
+		irq_ite_pins {
+			pinmux = <MT8365_PIN_68_CMDAT0__FUNC_GPIO68>;
+			input-enable;
+			bias-pull-up;
+		};
+
+		pwr_pins {
+			pinmux = <MT8365_PIN_70_CMDAT2__FUNC_GPIO70>,
+				 <MT8365_PIN_71_CMDAT3__FUNC_GPIO71>;
+			output-high;
+		};
+
+		rst_ite_pins {
+			pinmux = <MT8365_PIN_69_CMDAT1__FUNC_GPIO69>;
+			output-high;
+		};
+	};
+
 	mmc0_default_pins: mmc0-default-pins {
 		clk-pins {
 			pinmux = <MT8365_PIN_99_MSDC0_CLK__FUNC_MSDC0_CLK>;
@@ -463,6 +702,10 @@ &pwm {
 	status = "okay";
 };
 
+&rdma1_out {
+	remote-endpoint = <&dpi0_in>;
+};
+
 &ssusb {
 	dr_mode = "otg";
 	maximum-speed = "high-speed";

-- 
2.25.1


