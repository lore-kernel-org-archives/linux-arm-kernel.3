Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43DB1C98311
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 10:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h8AuXepnzD9XaSOicrRYnsLBz/47hJApvicX3vZY0wg=; b=q8BaYPHZykG3cfNU5nEbrdKKMm
	pcvGVMCG5WgLJJ0w7tpq1aXVcb4z9r4KStgANOgDQ7tOeE5Danmq2x10b53gNT1LmwDTvIuOuobAQ
	jZxBtt+GXHTYO6++6svnXmOtwAZPesAsom+wqWvFE0+KhRNFGJTECJih+fplZhL15L9OJ7YeGf0al
	7b3F6DQV5n0i3YL9tz3/HMpzVntOXDpAaE10A49ArmOd6tSm93cx+Syg39eFBdfUuf8XxbIObpF9u
	eMU3x8TTD9gA+fOaH49SM8aUu2Dokbo5pw5oijCesJDfqx9Vw91olTebJGZhcxdpbYU6/A2mmnnq5
	ltgHpomQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9gdJ-0000000Aish-1tXN;
	Thu, 24 Sep 2026 10:24:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9gdH-0000000Aiqj-11o3;
	Thu, 24 Sep 2026 10:24:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=h8AuXepnzD9XaSOicrRYnsLBz/47hJApvicX3vZY0wg=; b=PNYBV/Al8qQHV2wDjkXI16omlZ
	XjEeN5wNR7o/D2uoL4i0zoeO1wkaaq+rW3cwp3mBwnJ5AaW0I6KCwiA3x6g23loSxKk/o8e6BSWSF
	rtSiOvqjZo7qH/8kJvgYb+9oZDaxeRRRAG1pktDC0AwY+t4xnfB9oeknWsoOcr9Lx191TcVdUQtlE
	KG0uW+fwb/N0o+u15Dy/KM+pFnnN2R1MTTsIPPS/H/H88nECzufEJvyn6MhjDTbYlKI8KuuwKCslp
	rSNdSZ+0qywEAOmiOPVTNQ7nK8y50PMph1wMVklDuSb6Y9K+MYHApL1SnIHKYy+F+S+UHQAphnqL/
	KgC13Yiw==;
Received: from fout-b4-smtp.messagingengine.com ([202.12.124.147])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9gd9-0000000FqEc-2yKp;
	Thu, 24 Sep 2026 10:24:50 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id E08541D000A7;
	Thu, 24 Sep 2026 06:24:40 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 24 Sep 2026 06:24:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1790245480; x=
	1790331880; bh=h8AuXepnzD9XaSOicrRYnsLBz/47hJApvicX3vZY0wg=; b=q
	XKcLVrrkjjgRE4Z4le52nr0lAY+x6UmVJNY/VUPywQtgrBwZIAq60fdDdLDQtJSM
	Adbbx1gP9uCQVn/1xeqvB0A57F2iqIVisUD8OYtJYCMSHD9EwwKcUQ5xa16885vX
	pGb3WVMSSx9aLWfG0KTz3HeigQouk6wyCjal6h8feGjT0rUVSaUadiTYt7qAeDCg
	ZxW4WZKKuOvbBkqDlooRRl6cAw6LouzcdxzdT03wRFEBFmhPn1mM76in2r377fj9
	O/m5wt9K3mei+jcYCp0sNJGNo/QO7sjOO7UCx82gY3T7RqWLYW4Gn3oa3uPhKKn/
	jE+kQ/yIJ+WSA0LyjdJhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1790245480; x=1790331880; bh=h
	8AuXepnzD9XaSOicrRYnsLBz/47hJApvicX3vZY0wg=; b=Xb/TW3sINDKpBOvTK
	64ILVP8UcJT/cLQgO65sRb/q7HHqNmaR1BgZh/W5KPg7cbhe3UZHlykad6YVAjyA
	j0wifg8q/0XhZvl6lqQ1oDCDKaoMHvqNkSeAE8HDllo+5OjDylPbwuvyh/jtWP5i
	8MP1edqwF3zdLm6Ce0wt76UW0TjEszstCDmgR33lQmrKDIuoH0zL1Sqk0sAHSs3k
	JLt0AWbiGfgjN3Isk0VWLk6WPihA3Q98hXv9vsIFmQHQMYQczj0utcQdNPE3d223
	AMYSl5y8cmtUcX9aiRfyxEDWP1E8ePQUaqhcD5dwS6HeE5bAREfxvvlKV1x15cI9
	YY8TA==
X-ME-Sender: <xms:aPq0aidVtH-ZSooFrerTo3X5lkYz4IwBckI0uKix_tk14yh_wzet3A>
    <xme:aPq0asUrRSRSPcgygAuU0pgD5fIj1KSEXiDnNyO_iXSMltCbmCnQhyQSNBxiR5nDo
    0nOFvZrIT5DbztVeSPalXIa6503_Vn12woLrjqnXaocA866_ofMVA>
X-ME-Received: <xmr:aPq0ahX_OMF0hpBosZ-wmHQ8Le1UfPn9GW57b-z_dnnZT85pdygttpia-uQkgdleGrngHCWJ3Q>
X-ME-Proxy-Cause: dmFkZTFsBxBnkxABgBGy+2y8oh2XcRM9qhNrQt63e9eXQe5iuApGdKOSmV7em8OherjGGN
    2UkOtHmOQJGeWvpaeiVHFgUOdWvU0GuImx3mX3r6ii00a0IpQTJjp1cfkpgG25m29J5z7+
    rNk1buhlGtDCpsLmFpRl17COSu+GXw+6L56rzVEP4tdwLkJGLabYhY6BNB4o0H87HOkC+U
    fkFpHSoZagGd9OBbhGNpV1h7cbPjRcWqI/oILvcJB6xiDiwiovlBxFwMy88BO8jJwtdy3z
    TcTfMivx0F11V30THQiKxsErjj9V/7m7iOeekydns3M5HrTYfcTxRRN6AGKc1ZzD4jZ9ZJ
    9EHo5HHuloqbxdoLuHw9T1jbR8pFu5iyYB2qYmmOZbejz3o6MWJ60cL0WJRK6wumSOBiD2
    bFu73y92SoDgJHAVWeEeIg+2A3SPLvWPujEbZiYL3mhSFP+kEQuyzwh41Yv4kdPUMsS5e2
    1jy+u64/yhEAXTm9yNvatG3foUnNsSYn7fbi0i29UjMZYBr67+7L2VnEhRkVS/AbfUtn6m
    h0ZvhySh7kCN/iqUMqkChKURGFsVvHFJRnO7+zqc7n8OQTQk5yrAUZohsmUwbmXbYmNFyt
    VW7Fsr/B1ZxFAxn3q1d9+LYh/j4LRvd/1ND7t4wof3TW6eLOd6vy8hkGfc1g
X-ME-Proxy: <xmx:aPq0akO5wmtjnGm9KpRAulh5B9VyesG678PmQbI4ZcgAAUDVZsTZNg>
    <xmx:aPq0as7BOBIu_UROQ7v8085Q-rDX8hzlg7x4uuuYh-EiHoiRMLtJTw>
    <xmx:aPq0alqMt73zmfn8D5RMM12ZKu4Wc5Hz4daODorWoHpHUq3IKRUrHg>
    <xmx:aPq0aqDEqQGW9mYZR18gdHiyZvAQzZwxWAHSXBnQJndiFXfYTn0JoQ>
    <xmx:aPq0avZ6xk-VJg7QX5bWJeso7ydkAbhZNf_YKDQoPmwxP8IkrMmIRnPh>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 24 Sep 2026 06:24:32 -0400 (EDT)
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
	abel.vesa@oss.qualcomm.com,
	sebastian.reichel@collabora.com,
	sidong.yang@furiosa.ai,
	u.kleine-koenig@baylibre.com,
	chaoyi.chen@rock-chips.com,
	diederik@cknow-tech.com,
	alchark@flipper.net,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>
Subject: [PATCH v14 14/15] arm64: dts: rockchip: add NPU (RKNN) nodes to rk3576
Date: Thu, 24 Sep 2026 22:21:34 +1200
Message-ID: <20260924102135.92217-15-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924102135.92217-1-gahing@gahingwoo.com>
References: <20260924102135.92217-1-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_112448_517001_DC427241 
X-CRM114-Status: UNSURE (   8.92  )
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

Add the two RKNN cores and their IOMMUs, disabled, and label PD_NPU so a
board can give it the NPU rail. Each core lists both core domains, its own
first, as tested.

Assign CLK_RKNN_DSU0 594 MHz. Nothing in mainline sets its rate or the NPU
rail, and at the 786 MHz it comes up at, on the 750 mV a ROCK 4D boots
with, two cores running together write wrong words, 11 to 25 in each pass
of 5400 rows. 594 MHz is clean, and Rockchip's OPP table asks only 725 mV
of its 500 and 600 MHz steps.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 74 +++++++++++++++++++++++-
 1 file changed, 73 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 26aaf4320..e9cd11b58 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1042,7 +1042,7 @@ power: power-controller {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
-				power-domain@RK3576_PD_NPU {
+				pd_npu: power-domain@RK3576_PD_NPU {
 					reg = <RK3576_PD_NPU>;
 					#power-domain-cells = <1>;
 					#address-cells = <1>;
@@ -1269,6 +1269,78 @@ power-domain@RK3576_PD_VO1 {
 			};
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
+			assigned-clocks = <&cru CLK_RKNN_DSU0>;
+			assigned-clock-rates = <594000000>;
+			resets = <&cru SRST_A_RKNN0>;
+			reset-names = "srst_a";
+			power-domains = <&power RK3576_PD_NPU0>, <&power RK3576_PD_NPU1>;
+			iommus = <&rknn_mmu_0>;
+			status = "disabled";
+		};
+
+		rknn_mmu_0: iommu@27702000 {
+			compatible = "rockchip,rk3576-npu-iommu", "rockchip,rk3568-iommu";
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
+			assigned-clocks = <&cru CLK_RKNN_DSU0>;
+			assigned-clock-rates = <594000000>;
+			resets = <&cru SRST_A_RKNN1>;
+			reset-names = "srst_a";
+			power-domains = <&power RK3576_PD_NPU1>, <&power RK3576_PD_NPU0>;
+			iommus = <&rknn_mmu_1>;
+			status = "disabled";
+		};
+
+		rknn_mmu_1: iommu@2770a000 {
+			compatible = "rockchip,rk3576-npu-iommu", "rockchip,rk3568-iommu";
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
 		gpu: gpu@27800000 {
 			compatible = "rockchip,rk3576-mali", "arm,mali-bifrost";
 			reg = <0x0 0x27800000 0x0 0x20000>;
-- 
2.43.0


