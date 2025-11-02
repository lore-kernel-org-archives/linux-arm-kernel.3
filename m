Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA7DCCFA02
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Nov 2025 16:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/8jI1PnoD5u+P2s7QZ0IqUPfw31d0/RtxfNA17x2epg=; b=3WXIWYd451hYejSJphSk3CwBKm
	qX0LBqibYulfvV8KZuCzwxyzLENuo5an1dUT4zDrmIkzCxChd5pyImpZl7e4Rikf6p9HMqGnN2kq8
	IiZJzZMPKhcRMi9PGIiM+wS1nuQY0l0B4C43gOQSX6kp8OiE9+DSpypukrAx15AIiufZ3tm6SFKQe
	dpLV4R17F7tL1sOdtqK+Ms5UVIjdTmntOYamZwjSoSgZr25joshrIxNARr8xAHVbASOJa53IM6Whd
	/HNZQrlTtPBRjaPaAOXhppmnzXxRR1eOADMU+jsdBD/OR0G8BdGdhgBWxRwCQQYVUOt+B9prVpsik
	GbNjaghA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFaeL-00000008dp4-0HvT;
	Sun, 02 Nov 2025 16:09:49 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFaeI-00000008do2-2VjL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Nov 2025 16:09:47 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4d006H722Yz9tTm;
	Sun,  2 Nov 2025 17:09:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762099784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/8jI1PnoD5u+P2s7QZ0IqUPfw31d0/RtxfNA17x2epg=;
	b=xdgeWQmiGqWJmEqnZh5Azy2yHg8aJu8BAFANh9wJkc4JmqH94OTDufBoTecm3zFjFRzPuh
	0eWt06HTLy2lHcns/ikwZIOixazfW1TWd1ENpwFrXblNoK167IDuVMqxxocSThTDwhsanM
	d68I+K1GW0EdHTHHcHvn62k9mwbQF2pRuTrXsRJWgFHdRfuLW15GkD527HAftOl5RLMKmo
	TYi0f6w4PzxyXP/d8y1CRiGurlepronFJQDPkXBLAe/GGb+iQJiSFqXvvinqHVFUuiXa1b
	eKtisQgXR7ylweMv2xCE5lDLtp1u1IvEgbvF19NNWo1M+ZRIfnI9KOam7m9ELg==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762099782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/8jI1PnoD5u+P2s7QZ0IqUPfw31d0/RtxfNA17x2epg=;
	b=MRaUoExjPwW6UANMn1StuJJlPtiwXmvK9Oa1ASdu38ETQoKfDZCcdnmIupVzhvKOEupJF/
	/Tb3cPTK9/V43hJz2yjmL9L9k7lNLS5+qusEgHafz6+LjdLW+DXVg8PD+J2imROzl41WM5
	Im5dyXH7r8rb9tS96b/NpWqsHd9fk9OBlQzf0FDd0MoQm/yx5b0cS2Wz15IBp0GPWYOqeT
	5WmSBaIFKmK/yypGiC1q8BVaPbrPTPJqfHrhnEnHlFF21sK4nqZr9WJj+fkF4IeMC1Al8i
	Nk0gu7vIb4kODLovsuNTb7vSOYwqjQhv28yv6Bpfe2RxL//jQDcmjC+j2Ac8aQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Frank Li <Frank.Li@nxp.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	"Jiyu Yang (OSS)" <jiyu.yang@oss.nxp.com>,
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
	Xianzhong Li <xianzhong.li@nxp.com>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev
Subject: [PATCH v4 2/2] arm64: dts: imx95: Describe Mali G310 GPU
Date: Sun,  2 Nov 2025 17:09:07 +0100
Message-ID: <20251102160927.45157-2-marek.vasut@mailbox.org>
In-Reply-To: <20251102160927.45157-1-marek.vasut@mailbox.org>
References: <20251102160927.45157-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: uq1wffcpx3ha4pqpnp75bfqhkcccepny
X-MBO-RS-ID: 4d6a5d9a7fbc3d07ad0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_080946_782140_98827A0F 
X-CRM114-Status: GOOD (  12.30  )
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

The instance of the GPU populated in i.MX95 is the G310, describe this
GPU in the DT. Include dummy GPU voltage regulator and OPP tables.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Jiyu Yang (OSS) <jiyu.yang@oss.nxp.com>
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
Cc: Xianzhong Li <xianzhong.li@nxp.com>
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
V3: - Drop perf power domain
    - Drop reset block controller
V4: - Add RB from Frank
    - Drop the now optional GPU regulator
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 37 ++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index a91e1724ab1a4..e45014d50abef 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -250,6 +250,28 @@ dummy: clock-dummy {
 		clock-output-names = "dummy";
 	};
 
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
@@ -2139,6 +2161,21 @@ netc_emdio: mdio@0,0 {
 			};
 		};
 
+		gpu: gpu@4d900000 {
+			compatible = "nxp,imx95-mali", "arm,mali-valhall-csf";
+			reg = <0 0x4d900000 0 0x480000>;
+			clocks = <&scmi_clk IMX95_CLK_GPU>, <&scmi_clk IMX95_CLK_GPUAPB>;
+			clock-names = "core", "coregroup";
+			interrupts = <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "job", "mmu", "gpu";
+			operating-points-v2 = <&gpu_opp_table>;
+			power-domains = <&scmi_devpd IMX95_PD_GPU>;
+			#cooling-cells = <2>;
+			dynamic-power-coefficient = <1013>;
+		};
+
 		ddr-pmu@4e090dc0 {
 			compatible = "fsl,imx95-ddr-pmu", "fsl,imx93-ddr-pmu";
 			reg = <0x0 0x4e090dc0 0x0 0x200>;
-- 
2.51.0


