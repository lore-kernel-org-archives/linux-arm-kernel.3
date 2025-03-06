Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F83C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 18:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j37mnUzlQTtnhXiZqO46hZncJMufzxsxLdHChdchakI=; b=mcPkT0ZxKJzRJnN/7gNqKBbWI3
	a0+VEIXvlqOaQrut3BkN0SfI8UkqOCL2lEXhaXT/5v/RUoW+zXBWUWCTMi7ucG77jkMtFsZ+dzZjS
	BINTzxuD85i4nPZvdX69/C3PwDnwBjFKSPClLFswX6sk1sxJlI2SEDKvqIk88G+0zazb4z+I2XNmU
	axbpesHmKvrHUkR1q6ysq6+p0D4kV2vWBVI4ABsdUmEU0k1xLmfuoiwm4Wd3O55JugfYsRnRWLSH5
	X7LHxhGx/im4SP2orbSiKCMQFXdlxMPx/oxVhNggrSptXL6QaSG4jtx/PMvOHMlBgdjV7u3ZHKi4J
	y4miTkmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqFdH-0000000Bnvn-0I22;
	Thu, 06 Mar 2025 18:07:43 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqFZm-0000000Bn5u-3XY3;
	Thu, 06 Mar 2025 18:04:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741284244;
	bh=XUoZmVfvgm+iV3BJUEqJmJKTR6CIvcIOFGmj9mu2tRc=;
	h=From:To:Cc:Subject:Date:From;
	b=F5aec+rSsmt7o/TX27ZQARx2IXgaKfhSsUdxHrFi5z7c6roBtbOMaB++fpu8S2WxF
	 HBNQZ3ZbdEQH/mSQADdULTlN/3hcsZZasD6kmGpDoib7bT7VB2G+vl5Hkl+A7OZalH
	 i1bmmQUpAD2HJgK2JAxWd+hKXOeAvdKK32P5XYhdOriI4Na+9uTCdNWsHacSB/ajMB
	 7qO+GUfKoMN2Rgt3T0mjoDV5j8keC5ez67dgBBpNQE3gAtRHBBGEoNXK60NaG52Gfo
	 xleZZR/jz3emgmlrwqllUamRKOdehQPXp4pMlKM7dI3sdYbGoZhfeWm8A/qu65COKY
	 GM68iqy//kBeQ==
Received: from trenzalore.hitronhub.home (unknown [23.233.251.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B512E17E0673;
	Thu,  6 Mar 2025 19:04:02 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Alexey Charkov <alchark@gmail.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Stephen Chen <stephen@radxa.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH] arm64: dts: rockchip: Add HDMI support for rock-4d
Date: Thu,  6 Mar 2025 13:03:44 -0500
Message-ID: <20250306180344.126189-1-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_100407_064222_629A638C 
X-CRM114-Status: UNSURE (   9.17  )
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

Enable HDMI and VOP nodes for the rock-4d board.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../boot/dts/rockchip/rk3576-rock-4d.dts      | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
index 5dc1c18a3b211..f39bd441dce18 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
@@ -26,6 +26,17 @@ chosen {
 		stdout-path = "serial0:1500000n8";
 	};
 
+	hdmi-con {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
 	leds: leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
@@ -238,6 +249,27 @@ &gpu {
 	status = "okay";
 };
 
+&hdmi {
+	status = "okay";
+};
+
+&hdmi_in {
+	hdmi_in_vp0: endpoint {
+		remote-endpoint = <&vp0_out_hdmi>;
+	};
+};
+
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
+&hdptxphy {
+	status = "okay";
+};
+
+
 &i2c1 {
 	status = "okay";
 
@@ -687,3 +719,18 @@ &usb_drd1_dwc3 {
 	dr_mode = "host";
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
+	vp0_out_hdmi: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
+		reg = <ROCKCHIP_VOP2_EP_HDMI0>;
+		remote-endpoint = <&hdmi_in_vp0>;
+	};
+};
-- 
2.48.1


