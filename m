Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4674CE8E8B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 15:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xtYtlnfTmvr3zN41Ip+EWEfN6UogitdaSsSvvG5Igbo=; b=wQSI+OtdxYUAkF88Qz+F0OYC/R
	RKmWCRVeXJc8iIGSR+8ys5t1Q1XBYV+4+n1vwACGtzwzHyGtQJri5ONTuTFZi3dHs5La1D/UlmXO5
	BHuynBcZqbuGndb7gJrOtTq4XJz1CYQjSmiAxfB0QwywnDMxyaauJcUpLJNKQ7XjZaf0RK+9vO9kR
	Cf+KtnMFh2vHy+2r1NX9lPobB1znvnJAljOrT0edxbFAut8ryb+9576yN0gOCEsfUkHj/hJCVMzmA
	ITCBIu7pTVz5/CeoVe1VDwoEF0Q8SMRJERiIWZ2Mx9/ua3gz/JlVJZe2PKo1/snVd9N0g8bAQyeb8
	hh8hs1hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zkI-00000000uMw-2YXw;
	Thu, 24 Oct 2024 15:27:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zXR-00000000sYw-1otA;
	Thu, 24 Oct 2024 15:14:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=xtYtlnfTmvr3zN41Ip+EWEfN6UogitdaSsSvvG5Igbo=; b=qfkVxkDq7o8fKtA2SCMe+1OLlq
	PB/iuqutR0eNOkCNGH7ZMI2dXbjBwsIE1Dc6ga6ubhXxqJ8jZ1BtxBzdLhHfPSbmgYfxw8mdppGK8
	2yYXzw1V4Y5G/h7C8DTDkNtS6jGa4tfePwBx3BxGKYiTYfbmshns2rtQfEgbrqNpeuGP9M0OCiNRC
	1uOwbhwmriEG4hs2cLQlr8wJ2Chc0dEC33jQbPO0ln7MRGQAs74JC6wcHE800CahWHE/sLHtknqRO
	hxVQlanDUdcUtiS/Tt1upPLUCRRrKC14IjwOkbjpyHcm/WnStVpThJVpzIu9Ejz/WPmSqgrokt5IV
	ex+4Ue7A==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zXO-00000008h64-2tH7;
	Thu, 24 Oct 2024 15:14:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xtYtlnfTmvr3zN41Ip+EWEfN6UogitdaSsSvvG5Igbo=; b=C2aW70CRgRMOdVKehjfz70W+Cr
	svEASVpImDuk6Se2C1x4e6t8o2meA3u80bJhW7T6KN1pG2eWmZuz9w1mMvnJjnjLVg9GerofysCvT
	bb/9Tn/mVwRQxDiJlSJxTN0FWoMCnvIr11Qdpy24Ei0FL8YK3lrHc7xNLErFfY5Sl20KpWGUQ+u5D
	CD+UngHkHp3CA2CYmGfIKu1/4G8ZVKTSuS6U0enP9MjmuBzGxfd27PZVnsXNyjhsbfGEJNlRxqo/T
	gcmdHfRR7JT9xpTgiBpF8l70DyoGfAWRzTG9IwVe1qV/dsGS1AmTzVKz2jZpZYEVdhhi2xfm8GmEF
	R4euxe8A==;
Received: from i53875b34.versanet.de ([83.135.91.52] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1t3zXL-0004at-3T; Thu, 24 Oct 2024 17:14:07 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: quentin.schulz@cherry.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH v2 2/3] arm64: dts: rockchip: add HDMI support to rk3588-tiger-haikou
Date: Thu, 24 Oct 2024 17:14:02 +0200
Message-ID: <20241024151403.1748554-3-heiko@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241024151403.1748554-1-heiko@sntech.de>
References: <20241024151403.1748554-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_161410_880991_5E399CE6 
X-CRM114-Status: GOOD (  13.17  )
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

The Haikou baseboard has an hdmi output port, which is connected
via the Q7 connector to the hdmi0 controller of the rk3588.

Add the necessary plumbing to enable it using the recently merged
hdmi-qp controller.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 .../boot/dts/rockchip/rk3588-tiger-haikou.dts | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts b/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts
index e4b7a0a4444b..270d59a56037 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/soc/rockchip,vop2.h>
 #include "rk3588-tiger.dtsi"
 
 / {
@@ -61,6 +62,17 @@ switch-lid-btn-n {
 		};
 	};
 
+	hdmi-con {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi0_out_con>;
+			};
+		};
+	};
+
 	i2s3-sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,format = "i2s";
@@ -155,6 +167,32 @@ &gmac0 {
 	status = "okay";
 };
 
+&hdmi0 {
+	/*
+	 * While HDMI-CEC is present on the Q7 connector, it is not
+	 * connected on Haikou itself.
+	 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&hdmim0_tx0_hpd &hdmim1_tx0_scl &hdmim1_tx0_sda>;
+	status = "okay";
+};
+
+&hdmi0_in {
+	hdmi0_in_vp0: endpoint {
+		remote-endpoint = <&vp0_out_hdmi0>;
+	};
+};
+
+&hdmi0_out {
+	hdmi0_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
+&hdptxphy_hdmi0 {
+	status = "okay";
+};
+
 &i2c1 {
 	status = "okay";
 
@@ -321,3 +359,18 @@ &usb_host1_xhci {
 &usb_host2_xhci {
 	status = "okay";
 };
+
+&vop {
+	status = "okay";
+};
+
+&vop_mmu {
+	status = "okay";
+};
+
+&vp0 {
+	vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
+		reg = <ROCKCHIP_VOP2_EP_HDMI0>;
+		remote-endpoint = <&hdmi0_in_vp0>;
+	};
+};
-- 
2.45.2


