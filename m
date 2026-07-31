Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D81C55171
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 04:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NNaQ6jyQsISQEUWTw0sK+in83QA39rZZQGzKh4nqVaE=; b=xAW3+yaYUiP3f5iujluhIzy6Mw
	g80kNZvLF5TUCiKqo9+unRjv7/7aIRpMuD3MP1lGsBRPc2njGnxCEjTN8B+V7cG8p1MVwXCiPzQOp
	jo4aDqnau3mS7RHYugrUV+pnRp8o4sjna1SwzGvNeU18OKPrppqXy2yDtw49gPoP8gmikDOh8i6om
	7rVFSD7YUP/oRzaqwIdVemhQ5iHiVutqc/gL5cUA0MHE8cvPna5hz50OIowY1k0H1QB6TW4IdObQ/
	en3gRCIgP9hMfKyxOZxqw1t7HRn5mpJLbud+uN6JfJh2dKNoBuREhz6L85EbERI67qZXVOaNicjVJ
	XKX9wl8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpeyd-0000000BkYj-329t;
	Fri, 31 Jul 2026 04:36:07 +0000
Received: from flow-a8-smtp.messagingengine.com ([103.168.172.143])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpeyT-0000000BkRE-1KLi;
	Fri, 31 Jul 2026 04:35:58 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.phl.internal (Postfix) with ESMTP id 7BC8E138030A;
	Fri, 31 Jul 2026 00:35:56 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 31 Jul 2026 00:35:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1785472556; x=
	1785476156; bh=NNaQ6jyQsISQEUWTw0sK+in83QA39rZZQGzKh4nqVaE=; b=H
	BK50lY78p/BRkVHvrj/H3Sd8n8NtikmR8bjNb0kv91uoJxK4M4K/bjW8DsPu9iSw
	vQt+lhj1SY59y6Ih9PF6aT9gmcEYjfvxhr+UuHGB/x/ON3mdfQ7BxX8zAsH9ByxP
	2uTAMRfIEzla/qOeCwbcmxN46KcikfZCnI/p8aru7LowX374cdqH4lTjBFusRSOL
	NaiTL4IjTs9e8uRvV0srejjh5dSSsAVVbi26j5+qP1xVUNCZpzW5iqU8ce4MrX0E
	ldoaSH/cBpSMYpMrLV95LXLompzsPnbXiz35yeGTj14Iseh/eIT+47cfPEwPJSoo
	ZKDvvV5Zh6Ec5FYVWh1rQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1785472556; x=1785476156; bh=N
	NaQ6jyQsISQEUWTw0sK+in83QA39rZZQGzKh4nqVaE=; b=AEDeqBdWeioiMkpi8
	lmlz4N7YO9EdrZFcmK1Wkfo+zcQsoYuPkNRXetvtqaKt512h8aNfl9XbStWU1g8W
	hsCbnG1AAEx/nfOcHMCwxi7CgOQqyY7tRG6PIYrJWOLHmO4baEwJBuZlnjwlXFf+
	PI8oeJESJUc+6qWtSLml5glFS4hpp/cuxiEG3zqWmwONpmjUXTYSyBsKLJhxKES+
	702MChtEcRb2s9CaKAWbA/w6w/FHzMLdzXgqCr4u8UH8anPaBH4ODzAjo+GCXffI
	4NUOQcV4cblWCienzctAl7WIeo/VlHx1knsC8m2NQyoL/bhu3A8SZr2LWShcXzzD
	jtjDA==
X-ME-Sender: <xms:LCZsaiU4r77SJ4d97fruHRD8ZdlX54kjTQKnNxWmgltn7SB-fyZUZg>
    <xme:LCZsamjcHnnrpw8AE-yTbIz3HjsjNvuphEETfo895VaxwNgJsfpil1NpfNhPc1PO8
    W2BzgxSKs5c_ulndaUH2L0HrLQQ2HdTQlX6TLXrJpzaS3UHsBzjdA>
X-ME-Received: <xmr:LCZsatlRr8GgJNrx2APNiSwHvjciiAzg7waPUOH8WDQ0kFeILYxb3KqAIQKc-ElfIOoH8yF-aQ>
X-ME-Proxy-Cause: dmFkZTE25eMdGdpb7qYxCh3/n28jyVx2OtJLeAC15DbDMbLFv+BOhkY59Q+/xTCV0SQeJ3
    EKBWixYMhpIcjjWsr5BZ9koZvwL4Th1+An0NalzHT428pPOccATA4SxRizMwC/RB2aFEYK
    YLQl5iwrfjWzzSG+JxzTsRB5ZZjsrkxJT8KVNf7XUd66s6QYWcP0TjtLT7Ra5Of2dvXA9E
    N3lKtoojTG8OxFKCNOJAdsB0tR35MTIAKb4rU124lBz22DiG97J0LLMT4VFf2ewgx5FMdt
    N1wSbdLVoGCtkBO418k/jdA7d+F0yDQvaadK/JXNWhOLmvXl0wuceTVLmJauicvneJOLew
    +xeeCFBK6A0/DERWiJ/1Il6PYcmHxswJBb6CDTlgPi/41Ooe1LLTMM+3D7Z667vOluE3IF
    dfE0QzCeHIO23xBLnYyZlvY3bBdPRlc2KGMfBmFw1t0sCU203cxzCDpdM+z2BihFU0IqNz
    lLCrnzndZPLI7FemgktPFQehRaZ2dlQbvFAjdRa2Vqo3c1L06np0uQSzSsRN88W/nGmTX8
    +tm9OaInMw91BNjnF35C63Xghv/E4zIz/KPuFPDH5tHONWd7mGG1kUMIqum5E+STMwJEr8
    nYIZxmTyQXWDVsFKABi8TjekMv27SrwQux1ArZwlnsW+1lAajcIgvj30a0hA
X-ME-Proxy: <xmx:LCZsavwsHrKx7Vojbt7smjEU9wywjD1sBKQ7UmazrwRrYbHmkQD7cg>
    <xmx:LCZsaovhgqWDR3iLGj0wjr89verWu_Vs2oFTgIXp9LHf90vVhUBynw>
    <xmx:LCZsaksiN6pbS8F0pf_tIiWl1cpshFSbE_I_Btqbqk_h7gZjNf9l7A>
    <xmx:LCZsamnwy8MXko6plKDo8tMbLV5FbOOIkq5C4_O7mAEAW76umzPMuw>
    <xmx:LCZsalYNiySSobgyTVvqsV4iie5XH1rYQNuwD9sZjWH6C6acZQPhTUi4>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 31 Jul 2026 00:35:51 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ulfh@kernel.org,
	p.zabel@pengutronix.de,
	ogabbay@kernel.org
Cc: chaoyi.chen@rock-chips.com,
	alchark@flipper.net,
	royalnet026@gmail.com,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>
Subject: [RFC PATCH v3 5/6] arm64: dts: rockchip: rk3576: add NPU (RKNN) nodes
Date: Fri, 31 Jul 2026 16:35:06 +1200
Message-ID: <20260731043507.1832277-6-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731043507.1832277-1-gahing@gahingwoo.com>
References: <20260731043507.1832277-1-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_213557_444339_11B92DDB 
X-CRM114-Status: UNSURE (   9.34  )
X-CRM114-Notice: Please train this message.
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

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 78 +++++++++++++++++++++++-
 1 file changed, 76 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index b0c0d3c8b..a9d85e672 100644
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
@@ -1832,6 +1840,72 @@ qos_npu_m1ro: qos@27f22100 {
 			reg = <0x0 0x27f22100 0x0 0x20>;
 		};
 
+		rknn_core_0: npu@27700000 {
+			compatible = "rockchip,rk3576-rknn-core";
+			reg = <0x0 0x27700000 0x0 0x1000>,
+			      <0x0 0x27701000 0x0 0x1000>,
+			      <0x0 0x27703000 0x0 0x1000>,
+			      <0x0 0x27704000 0x0 0x1000>,
+			      <0x0 0x27705000 0x0 0x1000>;
+			reg-names = "pc", "cna", "core", "dpu", "dpu_rdma";
+			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru ACLK_RKNN0>, <&cru HCLK_RKNN_ROOT>,
+				 <&cru CLK_RKNN_DSU0>, <&cru PCLK_NPUTOP_ROOT>,
+				 <&cru ACLK_RKNN_CBUF>, <&cru HCLK_RKNN_CBUF>;
+			clock-names = "aclk", "hclk", "npu", "pclk",
+				      "aclk_cbuf", "hclk_cbuf";
+			resets = <&cru SRST_A_RKNN0>;
+			reset-names = "srst_a";
+			power-domains = <&power RK3576_PD_NPU0>;
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
+			#iommu-cells = <0>;
+			power-domains = <&power RK3576_PD_NPU0>;
+			status = "disabled";
+		};
+
+		rknn_core_1: npu@27710000 {
+			compatible = "rockchip,rk3576-rknn-core";
+			reg = <0x0 0x27710000 0x0 0x1000>,
+			      <0x0 0x27711000 0x0 0x1000>,
+			      <0x0 0x27713000 0x0 0x1000>,
+			      <0x0 0x27714000 0x0 0x1000>,
+			      <0x0 0x27715000 0x0 0x1000>;
+			reg-names = "pc", "cna", "core", "dpu", "dpu_rdma";
+			interrupts = <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru ACLK_RKNN1>, <&cru HCLK_RKNN_ROOT>,
+				 <&cru CLK_RKNN_DSU0>, <&cru PCLK_NPUTOP_ROOT>;
+			clock-names = "aclk", "hclk", "npu", "pclk";
+			resets = <&cru SRST_A_RKNN1>;
+			reset-names = "srst_a";
+			power-domains = <&power RK3576_PD_NPU1>;
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


