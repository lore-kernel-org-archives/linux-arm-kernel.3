Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5768FC3600D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 20:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5+jyyD01tuaQ9cu3oI1xcyMiNqOwJFt8kuWaEBU5/6M=; b=JjD1Fzao+q/1T5F0jGSA3VW/NW
	r646utGSSm4NGXxUd9UmCtrtHAsqDNXwt41Dnu1KWNTPVETmFQ2h4LzCJxt1/gzcZ4K87lsEw35+E
	OQuRTiX1Hh+Rgg+kL15NZqrj9t/6wC4d1vtYyZux8bjdcholZkJUTQ24q61QXVw/dwy0Ay+ZO2A8X
	6Zp0HwBylo+hSVYuI/JBXaEo2T8G9UZz/uf6HpZ5IuU66Okf0uwPZZyu5uuHCXjBBL3UWqOHbARS8
	rzKebwl+QIMFEyPDDdeBKmfFcet8hSd0NTOZbsbOnq/aNcmT26VBBqFB9FsEQgLNeqxg/CnQAhf2Y
	afdwa0Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tviz2-0000000GALo-2gRo;
	Fri, 21 Mar 2025 20:28:48 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvieI-0000000G7aG-3GBy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 20:07:24 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 98AF9101E90A8;
	Fri, 21 Mar 2025 21:07:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1742587640; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=5+jyyD01tuaQ9cu3oI1xcyMiNqOwJFt8kuWaEBU5/6M=;
	b=X7jesX2iMhyumPrNedJv8B7XDjh9wic5AVfGyGcHHjXEGGlmQlyN5IX89SX6MgHKiAQMBR
	Ct/179I90ZNIfnBvCXwnYO8JjWcvFXj6suKf1XPJsKG2iDb406uTu4IfNxw5kObrfNK38u
	0IGcUf3aloiWa3ePtAQ09nGRbH9v8W13NlVg0YSTDLtPUKofPPgbrT7xk6R+1aIfrD7Xpz
	ZPkmm0ovCje/ouFs6fjxQTxXdwZwYbZMJs9fgY7FBXuelthnbmkdZA8iBNqJqhRIipB/bO
	UDfOEmH1jI2Ldj1BdeNVv8wIfYtqnA1sY0/4HdEr6EekGeuLolSMHTLNyW3YFA==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@denx.de>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebastian Reichel <sre@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Steven Price <steven.price@arm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev
Subject: [PATCH v2 9/9] arm64: dts: imx95: Describe Mali G310 GPU
Date: Fri, 21 Mar 2025 21:05:59 +0100
Message-ID: <20250321200625.132494-10-marex@denx.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250321200625.132494-1-marex@denx.de>
References: <20250321200625.132494-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_130723_095440_E03E0218 
X-CRM114-Status: GOOD (  12.36  )
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

The instance of the GPU populated in i.MX95 is the G310,
describe this GPU in the DT. Include description of the
GPUMIX block controller, which can be operated as a simple
reset. Include dummy GPU voltage regulator and OPP tables.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Sebastian Reichel <sre@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Steven Price <steven.price@arm.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
V2: - Drop regulator-{always,boot}-on from fixed-gpu-reg regulator
    - Keep the GPU and GPUMIX always enabled
    - Switch from fsl, to nxp, vendor prefix
    - Fix opp_table to opp-table
    - Describe IMX95_CLK_GPUAPB as coregroup clock
    - Sort interrupts by their names to match bindings
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 58 ++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 9bb26b466a061..3acdbd7fd4eee 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -249,6 +249,35 @@ dummy: clock-dummy {
 		clock-output-names = "dummy";
 	};
 
+	gpu_fixed_reg: fixed-gpu-reg {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <920000>;
+		regulator-max-microvolt = <920000>;
+		regulator-name = "vdd_gpu";
+	};
+
+	gpu_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-hz-real = /bits/ 64 <500000000>;
+			opp-microvolt = <920000>;
+		};
+
+		opp-800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			opp-hz-real = /bits/ 64 <800000000>;
+			opp-microvolt = <920000>;
+		};
+
+		opp-1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-hz-real = /bits/ 64 <1000000000>;
+			opp-microvolt = <920000>;
+		};
+	};
+
 	clk_ext1: clock-ext1 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -1890,6 +1919,35 @@ netc_emdio: mdio@0,0 {
 			};
 		};
 
+		gpu_blk_ctrl: reset-controller@4d810000 {
+			compatible = "nxp,imx95-gpu-blk-ctrl";
+			reg = <0x0 0x4d810000 0x0 0xc>;
+			#reset-cells = <1>;
+			clocks = <&scmi_clk IMX95_CLK_GPUAPB>;
+			assigned-clocks = <&scmi_clk IMX95_CLK_GPUAPB>;
+			assigned-clock-parents = <&scmi_clk IMX95_CLK_SYSPLL1_PFD1_DIV2>;
+			assigned-clock-rates = <133333333>;
+			power-domains = <&scmi_devpd IMX95_PD_GPU>;
+		};
+
+		gpu: gpu@4d900000 {
+			compatible = "nxp,imx95-mali", "arm,mali-valhall-csf";
+			reg = <0 0x4d900000 0 0x480000>;
+			clocks = <&scmi_clk IMX95_CLK_GPU>, <&scmi_clk IMX95_CLK_GPUAPB>;
+			clock-names = "core", "coregroup";
+			interrupts = <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "job", "mmu", "gpu";
+			mali-supply = <&gpu_fixed_reg>;
+			operating-points-v2 = <&gpu_opp_table>;
+			power-domains = <&scmi_devpd IMX95_PD_GPU>, <&scmi_perf IMX95_PERF_GPU>;
+			power-domain-names = "mix", "perf";
+			resets = <&gpu_blk_ctrl 0>;
+			#cooling-cells = <2>;
+			dynamic-power-coefficient = <1013>;
+		};
+
 		ddr-pmu@4e090dc0 {
 			compatible = "fsl,imx95-ddr-pmu", "fsl,imx93-ddr-pmu";
 			reg = <0x0 0x4e090dc0 0x0 0x200>;
-- 
2.47.2


