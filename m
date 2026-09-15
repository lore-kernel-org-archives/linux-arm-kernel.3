Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 732C8C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 01:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mca1uOiT/+sfyymmOrDVbqr5tpDJZhJUUk2kbexgAZI=; b=1FKDSCiWJwCYeahpxJX/2JuS4R
	MVMkbeIZnKfl13FXi6JUtSoC/MGbccKV9vZXz3lcTj/RB53q4H9q4Vwkmzbn9VdLnkigIpSAP1XcC
	s29HwO5JmU3F+n9EYQ7Q8A0boQD9OlWXeK5Uo8vgVoK8kfxWcE2cBfLzIpLQamqmrWKQwbQdldzyy
	BEhvYyoK3XwJF6WeUTl3pIy02X8bsnKkGJkmCyWiD0H7uhP17d1il0YGT+hx/lnRlnb4S4OPpRPZb
	XAtstb3X3Q4AjyrXq6cyQ0R0yRJQoFxNsc4AeDCfTgZ1UoXtCBzCNWGS7OGEYg9MuHhOz8LF5JBLj
	PgAI0jNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6I1F-00000004xYO-2Dl2;
	Tue, 15 Sep 2026 01:31:33 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6I1C-00000004xXD-2BaY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 01:31:31 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-6be1f18687bso2298682eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 18:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789435889; x=1790040689; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mca1uOiT/+sfyymmOrDVbqr5tpDJZhJUUk2kbexgAZI=;
        b=OTNyDREE1dle4aAl1AohGj2Bo2yliHrStRgg+0XBBXk92wZN26cuUg/PrBRLoEThr3
         d0Wo0yqTdTajt2N0DHWt1YENWvtNkuL7W+GAKkq7x6nPSGCyZiHGwOECCycPnNMU267D
         j5OiIDmO0XRbN/fODw2Zp2A7hQ2Dt1tpKFdeyzpNVlM8rBIaQ1cFHe86oEwXLdIBO1+c
         1w5JPT+GIBFMD6Aw+G8YOYjPygcr9Cjuy9L9mts03xWP6fisw13tXOCSTr91uEDIOsiX
         ROoq7A03g3er6dHn9OBXD0xsu42LzImSWngg7aRK7BSD6d9kubhyFOkhmaaJdYWoUFUy
         fDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789435889; x=1790040689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mca1uOiT/+sfyymmOrDVbqr5tpDJZhJUUk2kbexgAZI=;
        b=qpNFR3hOvQTFALgM1PtnA2bKCzIwnZmWgRq2QYF1iJq0c4xJQeHzAE2ruJJ3A81v3B
         ZvruK+G4BCel/KXBkYQx8jHrBvZExrF0V1ZioiXNb2ckJ64ZlSLjGnRaO2bc5HExpIH+
         Oif6IPAh7MbN/0M11BRS8TqjoOeWm/dtuS1KqCqUuNI7haIowQmFFpLix8iWvIbbZ+OA
         4g8k4aF+txsOsxtYhUej0T3/uM/R2Rm2rxf/qag3eleHbHL1VR/tLWqfMHmfJbsdVyIx
         Q3UJ3bP8DaSkCaQvVJfA4DlGauuwhYUiazjosBJC1etzGlNND8asO3VzBM6fdhjwFqfL
         Uxqg==
X-Forwarded-Encrypted: i=1; AKwUvBxzfjT2iaJbtMyVd8E5iurGJwGkVLU29k3Hc50FPqkCPBDnrR+nluk92VPqfG+lKWDTQjrhhuCKAlYGbiTODHnU@lists.infradead.org
X-Gm-Message-State: AFuF++k2YeBecV4PYvVG+3cEpUSX2enrxjMDHjNv276TRzzPz758hgu2
	r7TdCT4FkfoUW9o/gz65G0HcML0SyE2zx6ULhAeBXu9QnacDCtD+T3rs
X-Gm-Gg: AYBFou2DdzxLwmkPy9iV6PcQZTCjPKPKbcmFt2XUB824MJ4Zq1zONVrjQ88PMd/Sksl
	wuN8GDTI3iZmSEv1P+DGX5CNoLVCkjZkP7GQWBxbmQCNa2JqHOc5FCWLpOWmso2qJE6CJFFkEVh
	YGDSvCzMfyAdeaImmq/YjW/POF2MbmG9JvT3anWLTLtkAo97TCgnxRXm9Dg645iWPU6dc7DBO9Q
	RswW2AzL6ctoXo9G9XpTRZH+mgbnsactvM3coz3NCe7IUV/df0HG8WGvkxRBDjhqYOVsfsw/+RH
	361jwfWB32kPuApkB96VRYqcNNEv+mINE7b1ZMbIH4YdcwAzCgFO4LNcNBoSSrX6yHhCHAaXY03
	O2f9ldYI6h2S3H+JxWPN/RgL9Ex6/aEDTdmPILat2Kn2auEuzIJmul68g/I/mcrr5u0853inJ4U
	sFSl1mPrapP2kKw6JDRlv19qD7XxnP5Jr306TETlXUmEr/DQ9dh+DuzGhdApZ65EUt9CXCHw9fX
	2cRgpdX3CA5CvhH
X-Received: by 2002:a05:6820:1694:b0:6b7:83d6:2920 with SMTP id 006d021491bc7-6c542342bffmr3288896eaf.35.1789435889379;
        Mon, 14 Sep 2026 18:31:29 -0700 (PDT)
Received: from debian.prasanth ([103.183.205.11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365a59b18sm27111575c88.2.2026.09.14.18.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 18:31:28 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v5 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
Date: Tue, 15 Sep 2026 07:01:10 +0530
Message-ID: <20260915013110.4780-3-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915013110.4780-1-prasanth.padarthi10@gmail.com>
References: <20260830182036.284736-1-prasanth.padarthi10@gmail.com>
 <20260915013110.4780-1-prasanth.padarthi10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_183130_574118_714115D8 
X-CRM114-Status: GOOD (  15.86  )
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

Add the device tree for the ASRock Rack B650D4U BMC, which is
based on the ASPEED AST2600 SoC.

Describe the BMC memory, SPI NOR flash layout, UART console,
GPIO line names, video framebuffer memory, I2C EEPROM, and MAC0
connected to an RTL8211F Ethernet PHY.

Use the EEPROM on I2C7 as the NVMEM provider for the MAC0 address.

Configure MAC0 to use the RTL8211F in RGMII-ID mode.

Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  | 120 ++++++++++++++++++
 2 files changed, 121 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts

diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
index 6b68671f9379..b109491d5c8f 100644
--- a/arch/arm/boot/dts/aspeed/Makefile
+++ b/arch/arm/boot/dts/aspeed/Makefile
@@ -10,6 +10,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-ampere-mtmitchell.dtb \
 	aspeed-bmc-arm-stardragon4800-rep2.dtb \
 	aspeed-bmc-asrock-altrad8.dtb \
+	aspeed-bmc-asrock-b650d4u.dtb \
 	aspeed-bmc-asrock-e3c246d4i.dtb \
 	aspeed-bmc-asrock-e3c256d4i.dtb \
 	aspeed-bmc-asrock-paul-ipmi-card.dtb \
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
new file mode 100644
index 000000000000..6585bda56a4c
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
@@ -0,0 +1,120 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "aspeed-g6.dtsi"
+
+/ {
+	model = "ASRock Rack B650D4U BMC";
+	compatible = "asrock,b650d4u-bmc", "aspeed,ast2600";
+
+	aliases {
+		serial0 = &uart5;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x20000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		gfx_memory: framebuffer {
+			size = <0x01000000>;
+			alignment = <0x01000000>;
+			compatible = "shared-dma-pool";
+			reusable;
+		};
+	};
+};
+
+&gfx {
+	status = "okay";
+	memory-region = <&gfx_memory>;
+};
+
+&gpio0 {
+	gpio-line-names =
+		/* A0-A7 */	"","","","","","","","",
+		/* B0-B7 */	"","","","","","","","",
+		/* C0-C7 */	"","","","","","","","",
+		/* D0-D7 */	"","","","","","","","",
+		/* E0-E7 */	"","","","","","","","",
+		/* F0-F7 */	"","","","","","button-reset-n","","",
+		/* G0-G7 */	"","","","","","","","",
+		/* H0-H7 */	"","","","","","","","",
+		/* I0-I7 */	"","","","","","","","",
+		/* J0-J7 */	"","","","","","","","",
+		/* K0-K7 */	"","","","","","","","",
+		/* L0-L7 */	"","","","","","","","",
+		/* M0-M7 */	"","","","","","","","",
+		/* N0-N7 */	"","","","","","","","",
+		/* O0-O7 */	"","","","","","","","",
+		/* P0-P3 */	"","","","control-power-n";
+};
+
+&fmc {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		label = "bmc";
+		m25p,fast-read;
+		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <4>;
+		status = "okay";
+
+#include "openbmc-flash-layout-64.dtsi"
+	};
+};
+
+&mac0 {
+	status = "okay";
+	phy-mode = "rgmii-id";
+	phy-handle = <&ethphy0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii1_default>;
+
+	nvmem-cells = <&eth0_macaddress>;
+	nvmem-cell-names = "mac-address";
+};
+
+&mdio0 {
+	status = "okay";
+
+	ethphy0: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
+	};
+};
+
+&uart5 {
+	status = "okay";
+};
+
+&i2c7 {
+	status = "okay";
+
+	eeprom@57 {
+		compatible = "atmel,24c128";
+		reg = <0x57>;
+		pagesize = <16>;
+
+		nvmem-layout {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			eth0_macaddress: macaddress@3f80 {
+				reg = <0x3f80 6>;
+			};
+		};
+	};
+};
-- 
2.47.3


