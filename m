Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA932CD6E6B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 13:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Y0cyJs3YzhZbMhMCeS+YcB/ZC7ibeA7FwgxaOl6j4E=; b=24ECmxLaUMybj1W7INCnGwTPnM
	DF9nGoyGP4Ws3w9UQ9T1s0IMX2B0p1qgCXD+2b2OrRSg99ubDC+FLc19J30dJjSVMSGHAE4+6bozr
	xIyyEyA/hvUaHvVmoYw+hLSwiNxl08ue3+LZ1uyoTaVm1Gutd/PMs4vUVtdXAti4iFo814iNEXGhA
	HDzcrMndIY8nkP7WuS1WyI1BckUfljKyrMUcmyNMw30e+Yb+g3ThoVPQJ2lbceHd0ny+BALrk22yc
	2ipBw13wsBRswe3Y8zbvterd7EZuXb6SoyWsBP0RvO/aNC1yJd4Ay8u339o9s6ejfkJZhXHGkeTXy
	zQYtTYag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV8VW-0000000Gq3X-3dIp;
	Thu, 04 Jun 2026 13:53:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV8VQ-0000000Gpo6-0xns
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 04 Jun 2026 13:53:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6Y0cyJs3YzhZbMhMCeS+YcB/ZC7ibeA7FwgxaOl6j4E=; b=ogyQBJ1LsVAe/Vgv4VO+3NswBk
	2IS33q/wgw3c/wp78u1ITxP31t2zzfLr9KRTrwvmMxrz427hZC0ddxyd64gQK4Ofjt9gnk3Grq/Al
	uuzyQ6wg1X0mv3zfUjO+nbgZ+jZncz+6X/Fo/thi1+jjEeopBTQRWG551taMeIdakxo5pzh7Q2nN8
	fLK4gnn1ia5+2jJJyNE8m/glLPmZsGUE7mov9F0MeVJkNOyvIongoGwjvrNmu/mkFV/kwMDRs4l70
	pTp37Plx7Ud7O2moX8wDo8pSOciFz9BEuaj2txqbBLiLJjfvFT5ocuholPEVS+2LJcW5JUJ2K9/mY
	iS4v/8NQ==;
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wV8VM-0000000EOu3-3t5U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 13:53:07 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-45eecb8bf67so581011f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 06:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780581184; x=1781185984; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Y0cyJs3YzhZbMhMCeS+YcB/ZC7ibeA7FwgxaOl6j4E=;
        b=T6hwvhMkHh+vo4M+wzbKP4PlhYxWXg73emhL3ONx2uZsBzJStZufO/kF1HcHF9nnOd
         uDeZN5IjuekVDnVFxH29O2AMEfShvKPQGhwqRU/ypT6LsyG+eH1OlEE/7hQWTAE9kYEy
         cEjNtHEKAjV5Fem0SkAiUCEmOfWDXHqg1Y9kavRUSax0CaN/ZPVaWqGgQIEd9lgoIWmD
         JzKOQLj2a4FOcSuazHS4Aa8VP+HlAX5FEMWFrQHBlXEcIVz9e9ruDoySDxwWSzEdWKHU
         vAnDC5dwpXKk8SXohZPhKmJGZ5MVCyoPW566/ViHtyeqiy7dF3JRh20W2SycUkQFXDpQ
         NVpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780581184; x=1781185984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6Y0cyJs3YzhZbMhMCeS+YcB/ZC7ibeA7FwgxaOl6j4E=;
        b=WiVWw7nvQUli4oWHLgDl8v9mK3LDfESt1abWsg+QmipylSJSvhjT/2U8n0YpcHWn6r
         ALX1g1TSvQ82oehXjoqRuN22+eC1vWYQJxzfgsPr3szjQUEeQJLSP0BtEkXy1SV/WQBt
         tCNFyUwdSpgyhoaqx3hs3glGwdXimDGeGOTvPufWxWeh7sJ3kiFUcFbQg7cZKuYTYIC4
         xCFb9SY1+qj4ZfwnqUS3sL8m0n7a60ZCwCveYb5KbpU58AWGheuqqatY+cCoDEJExpLA
         bM7bkLfonskCwa+4X0ZMj7v7delyt6mNx4kFxoRNI9v29lqgRF6Xv69CxFcIp85quyO2
         FXwg==
X-Forwarded-Encrypted: i=1; AFNElJ8mtAOflrC3qUGNQw95kmmRiSkSIMmDeo4PO1fxBNNBTrCWrzSuujP2qeaDtHsCm41T0rxzUJ06dFeezfscq4hh@lists.infradead.org
X-Gm-Message-State: AOJu0YzsUpp6XZX+34jf0GjW3zCAgmN7zi0OFuhm7jDkrBBVDdF5vOKT
	EtjmTEvchp43/u85zQjZ2zCQS1SAFMARo3WEqu0zdoOaCAfE73a1BsU1
X-Gm-Gg: Acq92OFuBa5OJKOVYOhwzsURvoBQRlVwCvQsX6c4rTd12e/m8X3J27Fd0cP2dUUpPUK
	ZFVmyvgTjRJ0n5RTJKuxtGOzNY0Ft3yyG93KQ1/ZfgoxV4dQ7QuKqQ3SqqmpWBls828Slk+zDLt
	63qthbrmhjCNY1mFETzTJWpYprJWHpdulZMTvKjshVKJdZkszc8ouVpJCpfVVvnJ7eQMVwCkYrn
	YSthP+8qHqS3jD3vnJK97zt2B9/dIzRIkYKdLUg6W38OOVoBP4RJ6Vvg2gELvszPQx3BD6egHLK
	e6UNDtdeGHLCPxtnBMqrCyiCwiOhcws3btlS0ihhyUkQobiKvw1CkijsxrsSucNkoerVJjlLSGd
	JLxzn5w3hrMtaNN5TeEVxO1UeKaAFDZyde6XRW3j5XxJ69i7L5Oepbb3NJvmncz/O7Y28lGHVdj
	uh19bfsDZYilV1414uCC8twETQGG4RojhwTdxSJVcKeUYqZEQ5WAOW6e6iA4/1LbU=
X-Received: by 2002:adf:fc48:0:b0:446:96b1:f53 with SMTP id ffacd0b85a97d-46021844e6emr9463717f8f.26.1780581183713;
        Thu, 04 Jun 2026 06:53:03 -0700 (PDT)
Received: from compiler-rock3b.tailb81abf.ts.net ([2a01:e0a:104a:4d80:be24:11ff:fe12:2776])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f0a43e9sm16661068f8f.0.2026.06.04.06.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 06:53:03 -0700 (PDT)
From: Midgy BALON <midgy971@gmail.com>
To: tomeu@tomeuvizoso.net,
	ogabbay@kernel.org,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org
Cc: robin.murphy@arm.com,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3 8/9] arm64: dts: rockchip: rk356x: Add the NPU and its IOMMU
Date: Thu,  4 Jun 2026 13:52:54 +0000
Message-Id: <20260604135255.62682-9-midgy971@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260604135255.62682-1-midgy971@gmail.com>
References: <20260604135255.62682-1-midgy971@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_145305_228973_C386ED54 
X-CRM114-Status: GOOD (  10.54  )
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

The RK3568 has an NVDLA-derived NPU at fde40000 with its own IOMMU at
fde4b000. Add both nodes (disabled by default) and the NPU power-domain
child under the PMU power-controller, and point rockchip,pmu at the PMU
syscon that controls the NPU NoC bus-idle.

The power-domain deliberately carries no pm_qos: qos_npu sits behind the
NPU NoC, which is gated until the NPU is brought up, so a genpd power-off
QoS save would fault reading it.

Signed-off-by: Midgy BALON <midgy971@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index 64bdd8b7754b5..50ce5a5e4fc24 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -512,6 +512,13 @@ power-domain@RK3568_PD_GPU {
 				#power-domain-cells = <0>;
 			};
 
+			pd_npu: power-domain@RK3568_PD_NPU {
+				reg = <RK3568_PD_NPU>;
+				clocks = <&cru ACLK_NPU_PRE>,
+					 <&cru HCLK_NPU_PRE>;
+				#power-domain-cells = <0>;
+			};
+
 			/* These power domains are grouped by VD_LOGIC */
 			power-domain@RK3568_PD_VI {
 				reg = <RK3568_PD_VI>;
@@ -948,6 +955,37 @@ qos_rga_wr: qos@fe158300 {
 		reg = <0x0 0xfe158300 0x0 0x20>;
 	};
 
+	rknn_core_0: npu@fde40000 {
+		compatible = "rockchip,rk3568-rknn-core";
+		reg = <0x0 0xfde40000 0x0 0x1000>,
+		      <0x0 0xfde41000 0x0 0x1000>,
+		      <0x0 0xfde43000 0x0 0x1000>;
+		reg-names = "pc", "cna", "core";
+		interrupts = <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru ACLK_NPU>, <&cru HCLK_NPU>,
+			 <&scmi_clk SCMI_CLK_NPU>, <&cru PCLK_NPU_PRE>;
+		clock-names = "aclk", "hclk", "npu", "pclk";
+		assigned-clocks = <&scmi_clk SCMI_CLK_NPU>;
+		assigned-clock-rates = <200000000>;
+		resets = <&cru SRST_A_NPU>, <&cru SRST_H_NPU>;
+		reset-names = "srst_a", "srst_h";
+		power-domains = <&power RK3568_PD_NPU>;
+		rockchip,pmu = <&pmu>;
+		iommus = <&rknn_mmu_0>;
+		status = "disabled";
+	};
+
+	rknn_mmu_0: iommu@fde4b000 {
+		compatible = "rockchip,iommu";
+		reg = <0x0 0xfde4b000 0x0 0x40>;
+		interrupts = <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;
+		clock-names = "aclk", "iface";
+		clocks = <&cru ACLK_NPU>, <&cru HCLK_NPU>;
+		power-domains = <&power RK3568_PD_NPU>;
+		#iommu-cells = <0>;
+		status = "disabled";
+	};
+
 	qos_npu: qos@fe180000 {
 		compatible = "rockchip,rk3568-qos", "syscon";
 		reg = <0x0 0xfe180000 0x0 0x20>;
-- 
2.39.5


