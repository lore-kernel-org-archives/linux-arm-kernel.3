Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B4E5D6ACE1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 14:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JG65amItm1eQrPUKFI3ZjKhN3hgWEFqfBjT1QDEGt80=; b=j46WuyYk3LQBwsTdVEMTC7xodI
	pa0fkpYKwvVBDPxUuDktj7YfS5/CrMlbhOk/qARJtFEdTSwhbtu37qIEbdQsSnZayWcxIwpsgDzgt
	4nGknZ8EnGLr5+H20DoJgHsQO0JMppbgDpj+MlqCJexnWm3o7I3LePwRBty5JOP4LJzLEjtJDGJvY
	/S2Xa5LQb8owQ7NsDLwL/v0FLm4IpP3UeFDn7PuBUyGue7ChDy4Xa/IrHtpqseaobniWyGSQCSM3w
	KfNeZJABnihCRv4hqFAMD2D78m5GJ+3JZmn/qMHj0kT8kJMXEquMIBYLl7+VxvKjCiPafjVePqHvk
	Mtx52/kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGJDs-0000000DOSp-14uP;
	Wed, 27 Nov 2024 14:40:56 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGJAn-0000000DNks-16mj;
	Wed, 27 Nov 2024 14:37:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JG65amItm1eQrPUKFI3ZjKhN3hgWEFqfBjT1QDEGt80=; b=eh6H3tKEO4hVqfxnVoFJfrSHKY
	GmuYz7tQm2zS+CPYGTm8lP9u0QQgaMPtJDps1DA/KFToM0xsOBtAsMJHwm9IDIkYW4Eq7dXPinRMb
	/E9FXJh7SR02UveBDtaO1GbUVLQyw1DO2WAAsRx5aHxAv+h46C/TiX/OsOakkSjj+fKMdaKqZy/ui
	u4UOGBAZ595I8jWLvRCFiNMCohNo72OQS7sY2ms6PeqJJS/yh7/KdzLBFKxGZawtug4vDFGAjq3es
	NOC/jf2NuaFe0of6VsVvDkcJkcQr6uzenEwwlnlp8Ucp6uOEosGK/EJKdY2bvB7vA9O3ZQmvTyCG2
	EQHl9hDg==;
Received: from i5e86190f.versanet.de ([94.134.25.15] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tGJAj-0002n6-NU; Wed, 27 Nov 2024 15:37:41 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: quentin.schulz@cherry.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	dse@thaumatec.com,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH v2 1/3] arm64: dts: rockchip: add mipi dcphy nodes to rk3588
Date: Wed, 27 Nov 2024 15:37:17 +0100
Message-ID: <20241127143719.660658-2-heiko@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241127143719.660658-1-heiko@sntech.de>
References: <20241127143719.660658-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_063745_363832_90E5BFD8 
X-CRM114-Status: GOOD (  12.20  )
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

Add the two MIPI-DC-phy nodes to the RK3588, that will be used by the
DSI2 controllers and hopefully in some future also for camera input.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index d9a2648a65d2..93d031d8821f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -580,6 +580,16 @@ sys_grf: syscon@fd58c000 {
 		reg = <0x0 0xfd58c000 0x0 0x1000>;
 	};
 
+	mipidcphy0_grf: syscon@fd5e8000 {
+		compatible = "rockchip,rk3588-dcphy-grf", "syscon";
+		reg = <0x0 0xfd5e8000 0x0 0x4000>;
+	};
+
+	mipidcphy1_grf: syscon@fd5ec000 {
+		compatible = "rockchip,rk3588-dcphy-grf", "syscon";
+		reg = <0x0 0xfd5ec000 0x0 0x4000>;
+	};
+
 	vop_grf: syscon@fd5a4000 {
 		compatible = "rockchip,rk3588-vop-grf", "syscon";
 		reg = <0x0 0xfd5a4000 0x0 0x2000>;
@@ -2882,6 +2892,38 @@ usbdp_phy0: phy@fed80000 {
 		status = "disabled";
 	};
 
+	mipidcphy0: phy@feda0000 {
+		compatible = "rockchip,rk3588-mipi-dcphy";
+		reg = <0x0 0xfeda0000 0x0 0x10000>;
+		rockchip,grf = <&mipidcphy0_grf>;
+		clocks = <&cru PCLK_MIPI_DCPHY0>,
+			 <&cru CLK_USBDPPHY_MIPIDCPPHY_REF>;
+		clock-names = "pclk", "ref";
+		resets = <&cru SRST_M_MIPI_DCPHY0>,
+			 <&cru SRST_P_MIPI_DCPHY0>,
+			 <&cru SRST_P_MIPI_DCPHY0_GRF>,
+			 <&cru SRST_S_MIPI_DCPHY0>;
+		reset-names = "m_phy", "apb", "grf", "s_phy";
+		#phy-cells = <1>;
+		status = "disabled";
+	};
+
+	mipidcphy1: phy@fedb0000 {
+		compatible = "rockchip,rk3588-mipi-dcphy";
+		reg = <0x0 0xfedb0000 0x0 0x10000>;
+		rockchip,grf = <&mipidcphy1_grf>;
+		clocks = <&cru PCLK_MIPI_DCPHY1>,
+			 <&cru CLK_USBDPPHY_MIPIDCPPHY_REF>;
+		clock-names = "pclk", "ref";
+		resets = <&cru SRST_M_MIPI_DCPHY1>,
+			 <&cru SRST_P_MIPI_DCPHY1>,
+			 <&cru SRST_P_MIPI_DCPHY1_GRF>,
+			 <&cru SRST_S_MIPI_DCPHY1>;
+		reset-names = "m_phy", "apb", "grf", "s_phy";
+		#phy-cells = <1>;
+		status = "disabled";
+	};
+
 	combphy0_ps: phy@fee00000 {
 		compatible = "rockchip,rk3588-naneng-combphy";
 		reg = <0x0 0xfee00000 0x0 0x100>;
-- 
2.45.2


