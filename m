Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA618606A322
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 06:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=STLASDeJ;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=jUjghBRr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kW+VR5U0b0jOaOOyCPQjLOX5nd6qRJjRAAQ97MnVWxk=; b=STLASDeJRmxpgW
	1gRHVOdJHKD8kDI3Gup842PWOko+VQ3yLTh0q0+nf0M9v0bZYRum0t8WTEfoNHc5euAoo1We99UUk
	qMCYJlPah9AZLewtR2Ol30VE5yfJXBwGZ+htQDKDBMROIxfC42tS/R6MO7T7d/v2e33SHUU540p5a
	6i6eSeH3fcHZS1SstRfDfyUkYR1HUZaNbTAaggxPiP41vY1FdUqw1RBLcteMD1CucrwjkLc56SHL/
	JBDNy98+IHBbaIEeLYoRcMV06RKmxpJviRb8z3HgP286ccXXSNgeOxc91Mbx0DcUwoR6as0QfNprP
	MWW5zofIoF3aOHy6JTaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMgRP-0000000Avu7-33NC;
	Fri, 30 Oct 2026 06:50:19 +0000
Received: from mail-m12836.netease.com ([103.209.128.36])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMgQo-0000000AvFh-3mrM;
	Fri, 30 Oct 2026 06:49:44 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 52e796957;
	Fri, 30 Oct 2026 14:49:37 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: Sandy Huang <hjc@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dave Jones <s.dave.jones@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v4 6/6] arm64: dts: rockchip: rk356x: Add eDP controller and phy nodes
Date: Fri, 30 Oct 2026 14:49:05 +0800
Message-Id: <20261030064905.2248999-7-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030064905.2248999-1-damon.ding@rock-chips.com>
References: <20261030064905.2248999-1-damon.ding@rock-chips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa18b92353103a8kunme14bef9979446
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZGk5JQlYdSk1MSh0aSR
	gYHk9WFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSEpKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=jUjghBRrjI6cVIGuqcpihieSTRffFrj0ZNC66Rdp4ikFSh+FmctUCIgnLka750gG/cbFnW2kKlUTDPpB1FkGaRt6idnSy1H16Xsvnydyji640t325qBvRczeT7CcDOddoshuTPsWXSd/w22n+LNQRHlO/KBPOpV+ygupsHTJ8uE=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=kW+VR5U0b0jOaOOyCPQjLOX5nd6qRJjRAAQ97MnVWxk=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_234943_197006_672E8C39 
X-CRM114-Status: UNSURE (   8.34  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the eDP PHY GRF (with the eDP PHY child node mapped by its own
register window) and the eDP controller nodes for the RK3568/RK3566
SoCs.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v4:
- Model the PHY node with a reg property under the parent syscon.
---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index a5832895bd39..7a5168548e55 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -403,6 +403,24 @@ usb2phy1_grf: syscon@fdca8000 {
 		reg = <0x0 0xfdca8000 0x0 0x8000>;
 	};
 
+	edp_phy_grf: syscon@fdcb0000 {
+		compatible = "rockchip,rk3568-edp-phy-grf", "syscon", "simple-mfd";
+		reg = <0x0 0xfdcb0000 0x0 0x8000>;
+		clocks = <&cru PCLK_EDPPHY_GRF>;
+		ranges = <0x0 0x0 0xfdcb0000 0x100>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		edp_phy: phy@0 {
+			compatible = "rockchip,rk3568-edp-phy";
+			reg = <0x0 0x100>;
+			clocks = <&pmucru XIN_OSC0_EDPPHY_G>;
+			clock-names = "refclk";
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+	};
+
 	pmucru: clock-controller@fdd00000 {
 		compatible = "rockchip,rk3568-pmucru";
 		reg = <0x0 0xfdd00000 0x0 0x1000>;
@@ -879,6 +897,33 @@ hdmi_out: port@1 {
 		};
 	};
 
+	edp: edp@fe0c0000 {
+		compatible = "rockchip,rk3568-edp";
+		reg = <0x0 0xfe0c0000 0x0 0x10000>;
+		clocks = <&pmucru XIN_OSC0_EDPPHY_G>, <&cru PCLK_EDP_CTRL>, <&cru HCLK_VO>;
+		clock-names = "dp", "pclk", "hclk";
+		interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+		phys = <&edp_phy>;
+		phy-names = "dp";
+		power-domains = <&power RK3568_PD_VO>;
+		resets = <&cru SRST_EDP_24M>, <&cru SRST_P_EDP_CTRL>;
+		reset-names = "dp", "apb";
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			edp_in: port@0 {
+				reg = <0>;
+			};
+
+			edp_out: port@1 {
+				reg = <1>;
+			};
+		};
+	};
+
 	qos_gpu: qos@fe128000 {
 		compatible = "rockchip,rk3568-qos", "syscon";
 		reg = <0x0 0xfe128000 0x0 0x20>;
-- 
2.34.1


