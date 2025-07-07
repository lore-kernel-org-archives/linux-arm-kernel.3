Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97034C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 17:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p8ly7oF3wY3svi7kAE9pak8dnHj/ipa3jtx+B3eJ+EE=; b=jM294RzXxQA8QWh25rl1ID9jZa
	kyI2fifdvzjPS1m1OH8PS7RS9WXsKBARhAJb0CUFvT2UVTsERRzgDVEg3SoW0f5LA1nCDCCL0FMtZ
	fngiKFzkuBqzwKK+bQYhJiAL3a+SWdme0HhWgREHlQMK79PCsbnD3puTK33BKLHyPIJoPXC0OHHIu
	JbsN7xslSDJGb0z6CcHeMOqIEYVOs8SPsAnOUrCnLn7tH74ZEY1l5vTNzdLgxDTcpssBJV1ktwz7x
	zEylLKlMD7ixl2Cu3rtGvwxwbu/mdr6JrLo31oCuZqQy10f5PgFEGPNSvDik9YP4MIZczuuovcmqX
	IZ6CAF9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYq5Q-00000003EBP-1dqX;
	Mon, 07 Jul 2025 17:57:04 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYp7s-000000035X6-38Ep;
	Mon, 07 Jul 2025 16:55:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=p8ly7oF3wY3svi7kAE9pak8dnHj/ipa3jtx+B3eJ+EE=; b=qbVfqFY5KmjT4Bmb0hMOj8w8lU
	+BqxWITtoDMD0j0fU0ZFuoNevU7Y/wRFaLorWfYs9JfBrY/qesPLbjNi2OgcfsyaPjx1VK2s6Z7ij
	9VErhST7UFzKmHooHc/tO/n1MJDVt8K0nQFxeYpqGPVS3VL6Ysix2qm11IgP3VWiCoYjz6NF3Dir9
	XR3P4yBMPLKxWK6rAmK/tM8GqRHzAWtDJuYWLje3A7nz+x3Kd5ckEQkBfoO6D3M3qn35gXvDyQiLF
	gJh0XcpIXIr4xd6eWDgOkmmBW/EcDLESbzYvV7eh5Q+e/5zpVDA22NdEVu8AkPRAZFYokyzvLVf8e
	nlQFRIPg==;
Received: from i53875bf5.versanet.de ([83.135.91.245] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uYp1w-0004yl-RI; Mon, 07 Jul 2025 18:49:24 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: neil.armstrong@linaro.org,
	quic_jesszhan@quicinc.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	hjc@rock-chips.com,
	andy.yan@rock-chips.com,
	andyshrk@163.com,
	nicolas.frattaroli@collabora.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 11/13] arm64: dts: rockchip: add the dsi controller to rk3576
Date: Mon,  7 Jul 2025 18:49:04 +0200
Message-ID: <20250707164906.1445288-12-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250707164906.1445288-1-heiko@sntech.de>
References: <20250707164906.1445288-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_095532_780092_7975155E 
X-CRM114-Status: GOOD (  11.84  )
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

The RK3576 comes with one DSI2 controllers based on the same newer
Synopsis IP as the ones on the RK3588.

Add the necessary node for it.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 28 ++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 87d518422a60..5e9c3dce5823 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1271,6 +1271,34 @@ sai6: sai@27d50000 {
 			status = "disabled";
 		};
 
+		dsi: dsi@27d80000 {
+			compatible = "rockchip,rk3576-mipi-dsi2";
+			reg = <0x0 0x27d80000 0x0 0x10000>;
+			interrupts = <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru PCLK_DSIHOST0>, <&cru CLK_DSIHOST0>;
+			clock-names = "pclk", "sys";
+			power-domains = <&power RK3576_PD_VO0>;
+			resets = <&cru SRST_P_DSIHOST0>;
+			reset-names = "apb";
+			phys = <&mipidcphy PHY_TYPE_DPHY>;
+			phy-names = "dcphy";
+			rockchip,grf = <&vo0_grf>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				dsi_in: port@0 {
+					reg = <0>;
+				};
+
+				dsi_out: port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
 		hdmi: hdmi@27da0000 {
 			compatible = "rockchip,rk3576-dw-hdmi-qp";
 			reg = <0x0 0x27da0000 0x0 0x20000>;
-- 
2.47.2


