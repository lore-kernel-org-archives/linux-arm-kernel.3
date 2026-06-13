Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC07ECD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 06:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ExjVQvO4/iWqbTjsUJjExpq/Pad0yGuPxgZEv8g/Xlo=; b=CEn8/SHZKoUL0krpYJtC4LrIEq
	M6ijczzMcol4Xhv7gMzKwKYZ2HitvJYAVnIdFEDORqghUhaAqHAwQm+R8B+yXj9Iul77UF75HWQMm
	9ohZ4rn/M4X01AXJ11ghsdGc84nw0Qmg0rRBQeUxl0n4fgoi8DM5FQAHPGeKzsSLcg1cpU/It0blV
	PTfjsdKIXqKUAMaSHO3eI19WXXB1M1Z9MNvAo/mX+jyAUaDaCWQADlMNRrpPs3A6BrahS1TI9bYdh
	zCoRsCX18rHQPGDVKqFY6iw78tp1hNzV0CXJFIA9QAylRWnorT+P+uxp3glg3OX1/D9Nimpl7CAwA
	wV9K4H3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYIKQ-0000000C17N-05D9;
	Sat, 13 Jun 2026 06:58:50 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYIKI-0000000C0wp-1gN8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 06:58:43 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-490ac357c55so15186965e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 23:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781333921; x=1781938721; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ExjVQvO4/iWqbTjsUJjExpq/Pad0yGuPxgZEv8g/Xlo=;
        b=ZdJfMidXKu9CD+KNjREK5N96tRtjEC3UmS/eewvIUpgnw0oxb0W5guj3HHysqUJUaI
         wpEBmYrjCkdJNJJCkXZUFklFXi2eGF+glkKhy6iTr38Y2JscsptZk0AG+QuRyDEORCpk
         HJB6ThVPqrx+QDAyrEbrQtIWU8SLN16HfEYlVFPqk2c0M8hwyir9kPE46I4TievP6jZo
         6vhuOO19yj0YjZIBU2t9aJuWQt6N2Zxq1oYvrVpSi6ngEW6oVav1HykQPtvEEqwd+8DN
         QY02wcXOu5GOdqoH8r0D8m22gTLCGq+xPn944nyX1PoDcP5QPaCyUFlta4r12LzF8Kas
         S0zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781333921; x=1781938721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ExjVQvO4/iWqbTjsUJjExpq/Pad0yGuPxgZEv8g/Xlo=;
        b=WABeg71TXGrMX5tiHG9Pf5IOVXfdifY34uOPrOibxj57mRi1sglFiILxD7WWOgXpqr
         wuLpdnc4TRc0fKqJbnG1GtAE6Vv3UMpifazjluqShRjlgbAjKRZIfUY/5kXUXK/YVqOf
         r0K12SqZ+1QxLpFcBcU1wg5Rhr5TEwGl8Ad9qEBPJcOMr9G9jwmm0+OqkGUrP6IV9TLw
         lM9v6XxsqrdQt2iC4tBenLNlWXWx5AsadrZh+iqVY3jtMvi2CIZL6e5j3T6sMtfnqpZM
         mBCoc9CMULA1seri8QG/JzAOB7ZU/hMRBYNmcs6E+ig+gOtSsdLL0O31wZdSE80LBj2D
         jnig==
X-Forwarded-Encrypted: i=1; AFNElJ/J1tXkCZM5tUXSi+6ednxAg4IgPTXqYDmWZVMy1iPcvdJgVuUS0X51h80ZkOQdm1q8z9+Y+NURpjhwU5EQSSPO@lists.infradead.org
X-Gm-Message-State: AOJu0YyFh9STBFKEnEgp9aeYtuGHQkvQX6UgXAEUTBJdrFQ5Fdi/JH58
	/1XhJChDX1CfhHdCTkeyTbcImk7eGyFVtx1pViOF18UJE/qYFGlQcVnn
X-Gm-Gg: Acq92OErLJzHDHyruOXyXCsIggnZ91Mif8g0WPExpgEtlJYSwUP5rXOYQ3/0j+pnsN7
	VKO0VlMcjXferBwp3xxqTxV1QxmVSjt1FSyZ2jmYpn8l3N/WvpaJ5nfKoB267Uq8Y8aw16SImk2
	2ATk42KLN5GH0fr51mK4cLvhCpyrrPOCtNxzgPrDMeIKW55kQk+QUXI6TZ1XmwophsiNZOBqrmf
	1SKcm853zL8dLNv0WC6yvpAKX8MqcUB+dkeJ/6rzljP49RIWaAO2dPTKujvK5JgRyC8zwjA7DD1
	UAN97HO2WodnuIqaa50qijv8KpexWv5nPYE/1GfyyWeNdsvPE2vV57Kn/GovGSc0hJSQEtGokIy
	mLKe+RlHWguz5MzL76nd39VklutcTYIPbvq7Nb1loD7cSC7F1ZnVZB5bIzbPfRH6OIXN+kQlq4t
	pU6UAPwqEKG4hm4NX+zuwA5YbpMLW1MjX0yDVULqdaxg==
X-Received: by 2002:a05:600c:a47:b0:490:52c0:744c with SMTP id 5b1f17b1804b1-490ec4ee63cmr73748795e9.20.1781333920798;
        Fri, 12 Jun 2026 23:58:40 -0700 (PDT)
Received: from debian.tailb81abf.ts.net ([2a01:e0a:104a:4d80:14c0:9448:1c38:77df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202e5cbasm42917705e9.2.2026.06.12.23.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 23:58:40 -0700 (PDT)
From: MidG971 <midgy971@gmail.com>
To: tomeu@tomeuvizoso.net,
	ogabbay@kernel.org,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ulf.hansson@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	xxm@rock-chips.com,
	chaoyi.chen@rock-chips.com,
	finley.xiao@rock-chips.com,
	diederik@cknow-tech.com,
	jonas@kwiboo.se,
	Midgy BALON <midgy971@gmail.com>
Subject: [RFC PATCH v4 7/9] arm64: dts: rockchip: rk356x: Add the NPU and its IOMMU
Date: Sat, 13 Jun 2026 09:01:14 +0200
Message-Id: <20260613070116.438906-8-midgy971@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260613070116.438906-1-midgy971@gmail.com>
References: <20260613070116.438906-1-midgy971@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_235842_463732_9945838F 
X-CRM114-Status: GOOD (  11.16  )
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

From: Midgy BALON <midgy971@gmail.com>

The RK3568 has an NVDLA-derived NPU at fde40000 with its own IOMMU at
fde4b000. Add both nodes (disabled by default) and the NPU power-domain
child under the PMU power-controller, and point rockchip,pmu at the PMU
syscon that controls the NPU NoC bus-idle.

Besides the SCMI compute clock, assign the CRU CLK_NPU so the NPU AXI
bus clock comes up at 200 MHz rather than the 12 MHz boot default.

The power-domain deliberately carries no pm_qos: qos_npu sits behind the
NPU NoC, which is gated until the NPU is brought up, so a genpd power-off
QoS save would fault reading it.

Signed-off-by: Midgy BALON <midgy971@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index 64bdd8b7754b5..313db59c1aed8 100644
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
@@ -572,6 +579,37 @@ power-domain@RK3568_PD_RKVENC {
 		};
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
+		assigned-clocks = <&scmi_clk SCMI_CLK_NPU>, <&cru CLK_NPU>;
+		assigned-clock-rates = <200000000>, <600000000>;
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
 	gpu: gpu@fde60000 {
 		compatible = "rockchip,rk3568-mali", "arm,mali-bifrost";
 		reg = <0x0 0xfde60000 0x0 0x4000>;
-- 
2.39.5


