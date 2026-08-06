Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B953C55838
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 06:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MCdVFBzoMQYqXVrZeC1sFHbOAswgeJFeoPQ04J47ZjA=; b=V7am8lGAQ/KPqYHMLtSnZbelQm
	jOjRnjLke+5HoVwxBWJcYfYPg3YlPMy2GUbgJ1xacHP771HoYdoRC0yqy1cARHO/MTV9fGzi2BhFo
	1oqI/xcw9hSl1ESbCjp9ep1dCBsfyR0jOScxTMDFHUhX/PpFvVhcS2lRVi5ZPEY7sLO5+PalgpIZm
	f9WipVnLUlNmehXGfs/rjaKQlTgemuBO/PvAo3vZQ5D9yyaOg6FIS8ayIeZGPQuAex6EfaGYrVlpD
	LN952TQkZnC+pKxBALx5VUiksYPiH2ttgi1yc6eqgOQuLglggVfb/h7DY3Y3dkemvyn0Gssh5XB47
	24Q4NkXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrrht-00000005452-3Nvk;
	Thu, 06 Aug 2026 06:35:57 +0000
Received: from flow-b6-smtp.messagingengine.com ([202.12.124.141])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrrhq-0000000542M-3208;
	Thu, 06 Aug 2026 06:35:55 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.stl.internal (Postfix) with ESMTP id 7EC2813001B6;
	Thu,  6 Aug 2026 02:35:53 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 06 Aug 2026 02:35:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1785998153; x=
	1786001753; bh=MCdVFBzoMQYqXVrZeC1sFHbOAswgeJFeoPQ04J47ZjA=; b=M
	Fct1n34Bigl9NKLfwyrt4kTWzq/T7EBnkXyQb24ycDscNG+gOHljKs41pRgdaKi3
	kM2lPXXoQOIBPNU6gCoMAly05ur98SmkAbtDyDxlDg44pzwmV4ktj3kt97EVFo5N
	WvrhWOce2U6lT93eeFZ0AogNh3oUspJplNOK8w69mn6IWEpXWPZ9bBj9hDROYtVL
	nJRFUOa/9H/wLvNxPBQv0J7BALnTXBJeOHHMmfw6/XbEW5Dke2ti0MBVF2tIG/CY
	q+jgMFDqNAzlRcEmZgtjYTO6HHYTdvkYHn2EgU/HNjAsUAhmDNP5FjuPIRABpgto
	k/G8ztaGjq5sY0Pjdnvdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1785998153; x=1786001753; bh=M
	CdVFBzoMQYqXVrZeC1sFHbOAswgeJFeoPQ04J47ZjA=; b=NAENol+4BUQKRpxYS
	PoQJkQaj1IrBXeSb+94yTPQ/EOzGrC6BSiKuNhh6X9pGnaKo8i+/ToR0OtlmSmBz
	P7pU4JhIXIXSrQE8C7G3LfkQI9S086vyjj6qAhJaQ01qS17xiGAqIBNKIAltFkK6
	jWdOs4krIlAdhHTrEF7XWhh0HdQ4FWBj6guP/doQhGJyUwcy4bQ9mbZwiSPA41P9
	5ubf3gVIh4tTHo0Vk7KHZwIcs3TNxC41hNs91tgMvdzmgKXyvRirSSnc02S5OgRi
	W8yQKxl8CaytVqwWdIwEc92MGeaQZcbLQQLa3A2TH3S/W/ZgQLGmXrz4O+4haD/I
	xAELA==
X-ME-Sender: <xms:SSt0avxi10CchjxN9ZdZTUk07ZiJ6vQJrqSPAaqqbTHeSTn6IYdtjA>
    <xme:SSt0aja8lT8VpfNGkC6AOIKKWnuKTDHeDvNoHPRjpIevgXh_IFwvTljZhC2V6jVLK
    UbxoLRiZYJ-jS478kGPGrkAZgehmdG3U090ZDBfE3zQMpiUb_9MRw8>
X-ME-Received: <xmr:SSt0alLz6xfO8ThEnMoihGoydvSvkmhTLNYi_-cIv0YYtRkFxJfJYwdP82lDZiu41GiikUpS0g>
X-ME-Proxy-Cause: dmFkZTEh6EqLEron4P620rfA50oje5pogyeStsqRC64znWcm/DBV15Jp+RPu9rfpq1CYYb
    UFmLU5UCxdxDCYby+qIAZtXGI2PUlpFQNXwfYq4ttCgPHbGa62/TDDwxKwLB8tX7dfhqau
    EbUP3O00RQtnFbFjlgrSaMtfjvGvqyYuejLHQ8kaCQjYwTQGvwYjMVbSb1Jvpanl+FPpuM
    SqFyNQH/92jvSpo2kN70zd3lo4jOKuY6rGBanj09NT9Qpf7fxDVsJep1Tqo9Yuq62YMLgS
    +erfmDCU3gBbJvDrolUKAZwfNdHwfv2Y4EHW05E61S/1zu1MOw9sAC69rBYAvxBuvfJpCG
    6sqOK/dU1aOJR4IqBiZMRe50GYv94+aLZvUTfD6v2LUE8vwKws+MqoZDbp6rjd4owNJ/S7
    w178UMafEXMMmdqUBb4J4pwt/aUXVQgwk02FXNWcohSQOYNdvLacn3vkKogU1H/1GayMBg
    OHg0QkB+BzrLOqldIfhwj4pvyON4dpHwz0zPXpFruAkcDsFxjy8uy9QmY9JKA+AP3XO3bE
    6MByKHXRsq7+qI4V5YVGubCSY+hZyK6smBD4f1ib8OBLj7f4kV+BRzw+oj9qguxbCVrGA2
    tGCiy9OvfFwvk+kOhO/WQRMr0mnmmci9ZVV1u/dWk7yAP1XfGWVqw0NVaSvA
X-ME-Proxy: <xmx:SSt0ai3hBivYFLErYjGw65fX0k1yhQ1HbzGm12vjKY2ELiL81KSSQg>
    <xmx:SSt0ahL_thjeQ3LeQ6b0I3FOmCGSIK50e7xtaXTlddpytrUp4JO6pg>
    <xmx:SSt0amO8GwngRg4_PrMkcdIbs-STSUBr0L7WZWlc9CkI7H57arkscw>
    <xmx:SSt0aiyFwFVL2sadc_HYXGSwerGy6zA-9FmcA1N5TpX4pha_e84kwA>
    <xmx:SSt0ah4Klm1lcUHf1TKfo3g_9WxyQQPiUd_ItgKWJrYbUt6jZm-GB5av>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Aug 2026 02:35:45 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	ulfh@kernel.org,
	p.zabel@pengutronix.de,
	ogabbay@kernel.org,
	zhangqing@rock-chips.com
Cc: royalnet026@gmail.com,
	alchark@flipper.net,
	chaoyi.chen@rock-chips.com,
	diederik@cknow-tech.com,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>
Subject: [RFC PATCH v6 8/9] arm64: dts: rockchip: rk3576: add NPU (RKNN) nodes
Date: Thu,  6 Aug 2026 18:34:12 +1200
Message-ID: <20260806063413.350184-9-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806063413.350184-1-gahing@gahingwoo.com>
References: <20260806063413.350184-1-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_233554_840307_11F23007 
X-CRM114-Status: GOOD (  10.77  )
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

Add the two RKNN cores and their IOMMUs, plus the NPU power-domain
resets the pmdomain driver now cycles on power-on. Both cores are
disabled by default; boards enable what they wire up.

Each core lists both NPU power domains, its own first. The compute path
needs NPU1 powered even when only core 0 runs, and a node with a single
domain would be auto-attached by the driver core before the driver can
attach the list itself. The IOMMUs keep one domain each, since they rely
on that same auto-attach.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 80 +++++++++++++++++++++++-
 1 file changed, 78 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index b0c0d3c8b..1e6dd039f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1070,14 +1070,22 @@ power-domain@RK3576_PD_NPUTOP {
 						power-domain@RK3576_PD_NPU0 {
 							reg = <RK3576_PD_NPU0>;
 							clocks = <&cru HCLK_RKNN_ROOT>,
-								 <&cru ACLK_RKNN0>;
+								 <&cru ACLK_RKNN0>,
+								 <&cru CLK_RKNN_DSU0>,
+								 <&cru ACLK_RKNN_CBUF>,
+								 <&cru HCLK_RKNN_CBUF>;
+							resets = <&cru SRST_A_RKNN0_BIU>;
 							pm_qos = <&qos_npu_m0>;
 							#power-domain-cells = <0>;
 						};
 						power-domain@RK3576_PD_NPU1 {
 							reg = <RK3576_PD_NPU1>;
 							clocks = <&cru HCLK_RKNN_ROOT>,
-								 <&cru ACLK_RKNN1>;
+								 <&cru ACLK_RKNN1>,
+								 <&cru CLK_RKNN_DSU0>,
+								 <&cru ACLK_RKNN_CBUF>,
+								 <&cru HCLK_RKNN_CBUF>;
+							resets = <&cru SRST_A_RKNN1_BIU>;
 							pm_qos = <&qos_npu_m1>;
 							#power-domain-cells = <0>;
 						};
@@ -1832,6 +1840,74 @@ qos_npu_m1ro: qos@27f22100 {
 			reg = <0x0 0x27f22100 0x0 0x20>;
 		};
 
+		rknn_core_0: npu@27700000 {
+			compatible = "rockchip,rk3576-rknn-core";
+			reg = <0x0 0x27700000 0x0 0x1000>,
+			      <0x0 0x27701000 0x0 0x1000>,
+			      <0x0 0x27703000 0x0 0x1000>;
+			reg-names = "pc", "cna", "core";
+			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru ACLK_RKNN0>, <&cru HCLK_RKNN_ROOT>,
+				 <&cru CLK_RKNN_DSU0>, <&cru PCLK_NPUTOP_ROOT>,
+				 <&cru ACLK_RKNN_CBUF>, <&cru HCLK_RKNN_CBUF>;
+			clock-names = "aclk", "hclk", "npu", "pclk",
+				      "aclk_cbuf", "hclk_cbuf";
+			resets = <&cru SRST_A_RKNN0>;
+			reset-names = "srst_a";
+			power-domains = <&power RK3576_PD_NPU0>, <&power RK3576_PD_NPU1>;
+			iommus = <&rknn_mmu_0>;
+			status = "disabled";
+		};
+
+		rknn_mmu_0: iommu@27702000 {
+			compatible = "rockchip,rk3576-iommu", "rockchip,rk3568-iommu";
+			reg = <0x0 0x27702000 0x0 0x100>,
+			      <0x0 0x27702100 0x0 0x100>;
+			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru ACLK_RKNN0>, <&cru HCLK_RKNN_ROOT>,
+				 <&cru CLK_RKNN_DSU0>, <&cru ACLK_RKNN_CBUF>,
+				 <&cru HCLK_RKNN_CBUF>;
+			clock-names = "aclk", "iface", "npu",
+				      "aclk_cbuf", "hclk_cbuf";
+			#iommu-cells = <0>;
+			power-domains = <&power RK3576_PD_NPU0>;
+			status = "disabled";
+		};
+
+		rknn_core_1: npu@27708000 {
+			compatible = "rockchip,rk3576-rknn-core";
+			reg = <0x0 0x27708000 0x0 0x1000>,
+			      <0x0 0x27709000 0x0 0x1000>,
+			      <0x0 0x2770b000 0x0 0x1000>;
+			reg-names = "pc", "cna", "core";
+			interrupts = <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru ACLK_RKNN1>, <&cru HCLK_RKNN_ROOT>,
+				 <&cru CLK_RKNN_DSU0>, <&cru PCLK_NPUTOP_ROOT>,
+				 <&cru ACLK_RKNN_CBUF>, <&cru HCLK_RKNN_CBUF>;
+			clock-names = "aclk", "hclk", "npu", "pclk",
+				      "aclk_cbuf", "hclk_cbuf";
+			resets = <&cru SRST_A_RKNN1>;
+			reset-names = "srst_a";
+			power-domains = <&power RK3576_PD_NPU1>, <&power RK3576_PD_NPU0>;
+			iommus = <&rknn_mmu_1>;
+			status = "disabled";
+		};
+
+		rknn_mmu_1: iommu@2770a000 {
+			compatible = "rockchip,rk3576-iommu", "rockchip,rk3568-iommu";
+			reg = <0x0 0x2770a000 0x0 0x100>,
+			      <0x0 0x2770a100 0x0 0x100>;
+			interrupts = <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru ACLK_RKNN1>, <&cru HCLK_RKNN_ROOT>,
+				 <&cru CLK_RKNN_DSU0>, <&cru ACLK_RKNN_CBUF>,
+				 <&cru HCLK_RKNN_CBUF>;
+			clock-names = "aclk", "iface", "npu",
+				      "aclk_cbuf", "hclk_cbuf";
+			#iommu-cells = <0>;
+			power-domains = <&power RK3576_PD_NPU1>;
+			status = "disabled";
+		};
+
 		gmac0: ethernet@2a220000 {
 			compatible = "rockchip,rk3576-gmac", "snps,dwmac-4.20a";
 			reg = <0x0 0x2a220000 0x0 0x10000>;
-- 
2.43.0


