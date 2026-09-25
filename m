Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC5AC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 12:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pnLLA/1flpR0LOs70Cy40hhdZUyQOq32+JwGKeb+HsY=; b=wp39HFLXSej0CZ0BYtb8WKuRMc
	3pgHhnTDUdmFg4NS5psoSi2wzEAMUsrqyhS29yP5pmAxI8vn4mKHQu0SzTqUeZqYxC/eQbqBGFcUf
	ZAWj2V8YbkGOg5aiCDEVNvigjZGlDHTCSjKCqHravZukjatoDfI6zZddtwYG+kH+klLwj1KaNpYMm
	2RJKLL2Fw6oSNG5VwlW+gfWWKwo1STNDE9CY0IU1kjAs8PJpnztwJQPeZiQN/EdYmlqgWE2gfOD40
	4qXxvt4K9JsPytziuBE+y7E1ExgziP/fNZDcrgyk8sZk1tVoIrWYxt2V14hBEF2mqE9nF+CdQrj+R
	qEhwAVCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA4rw-0000000DIWQ-1xBP;
	Fri, 25 Sep 2026 12:17:36 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA4rr-0000000DIVV-3idi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 12:17:32 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so4921125e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 05:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790338649; x=1790943449; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pnLLA/1flpR0LOs70Cy40hhdZUyQOq32+JwGKeb+HsY=;
        b=GbMIFgb+OgFOAy4zabwmNtoeJ8d0iINOhiYpWERNcqJ7eKdxNdZjjlMUmXtcgTTKbG
         tGfDgKr+KXRYhWFWz2780ItISz8T6C3U1b1JohdHsaUO1X5ppaFfj5HjwYu0iu+laUnv
         JwXrPL1BidKoQ0kL/w+GW2bxVlNxe0JgaMYbct/vPqnyaYL2txTAhrI+U8ZzEk8Lo25h
         XORd2XQF476K+sxWpxfUGLBVaVlxuiAolaI0VfgWRQvduIkDwUMWkp2hraUKxD0aHnI8
         Fwv/xkg7W1RIyPiqS7kDB+y9LfAOdn2WpDhCiVVLtX7lHIBZH9VIbCdE5nnXRugSM0ZW
         Qb4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790338649; x=1790943449;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pnLLA/1flpR0LOs70Cy40hhdZUyQOq32+JwGKeb+HsY=;
        b=J6qjSOjXilL8ya35EYctBcZb8+6yBLbSLNNU2UwBt94GObHyz4bYcuE5AjnoHpxifn
         JZY7uK9ZFHagtwlUcqRB+HVUSSGzLXhPdSfKRa9qi/rFfo6gChDszADW0gBY+e3Pz2pY
         RENwDWgNfIzB3Wb/+SV3oJd17r7ViBVx865KxvjBLi8CuAbPL66Sf1+cyQdEOhImJLfW
         6BN3vubJvrUxJtvkJIJikIes8Besk1GRzLt2KoyNK8vguNA2PCpANy4OxSszLeGBzkbv
         cgdwTiihMpJcl9ctEvj9lMcBVLkSQslAt/peA9JObVDMEl2mUGV/PAQ4x3b8Kd0xwKui
         h/kA==
X-Forwarded-Encrypted: i=1; AKwUvBwmOln6xOsRpT3HtHDsIi7/fWEX+kNsxeI8oj7L0BWHPXMGuFHsXeAcab0Hv5jGThDitZWsbJb7hPQGX+mSNci+@lists.infradead.org
X-Gm-Message-State: AFuF++mCh49eiefTOvHNZ45dU53RNJN5TEFLYflQMcMmvAebE9cH/8lv
	FQDgv9qZMBkvNUnok1UBWrF0oY8/xtHC2HrPGfIA9tfq8RIxIS73LxRt
X-Gm-Gg: AYBFou1qxfY2s9BkQ37knxZag3sKzJ7HyqMi2XSLjDT5BBHyG/dVo1zTTYFWwG0Ga7D
	jQQeOCCT3fVoUbCtUihMmN24aPRYGf2TPnBxwLrlXizrga8IoLJI2r2g5XOR9ZxgaqLzJTr/edt
	tkhmXEg+4SD9HqQFxFB2oinzwtFT8MnJ6Y7It4MPhJxVvAzGJDwjXkQG21m+HNV7xC5xNi8QPnl
	9cKkd8CCVhGvNmN9gL05Ak1Vp2sXd+zvqTlbrMxhAJDlUmyQUyCvokWD+OuPkTkGFrwdSQGGKys
	5hdVpa260vJeSgbr8Nu8iRN+8lFjjguNlnc4facyqGHYXuZbb7PLqVzgt5hC/RBccDRhIaMFdKM
	ZPTzGiIRKzTSybVzipbFlG93/itUF25VzlXdI5hSZdhKFiBHKCYu6IX8kQFZaCPdtmEK+ynSiS9
	f2/UHTAx3eJ/HhfnkBC7Ydj3POr/LCRE4pqfqDwkXvst8WBtiBVtmCgSI140ynU9laRo52I4vXO
	QfSqYk6vcvPb2xJKCYILcYC1NFUvNpQqCegqtKVWwXqNcEL1ulUsqbC
X-Received: by 2002:a05:600c:a4c:b0:49c:fa20:cc08 with SMTP id 5b1f17b1804b1-49fe67060cemr95925545e9.31.1790338648585;
        Fri, 25 Sep 2026 05:17:28 -0700 (PDT)
Received: from [127.0.1.1] (lmontsouris-656-1-83-121.w82-127.abo.wanadoo.fr. [82.127.110.121])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm218658205e9.14.2026.09.25.05.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 05:17:28 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Fri, 25 Sep 2026 14:16:34 +0200
Subject: [PATCH] arm64: dts: rockchip: add radxa camera 4k on rock 4d
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-rock4d-cam4k-v1-1-c9519c794fb3@gmail.com>
X-B4-Tracking: v=1; b=H4sIACJmtmoC/3WOwW7DIBBEf8Xi3JXMmgXsX6lyMLA01HLigGO1i
 vLvpUmt9tLjSPPmzU0UzomLGJqbyLylks6nGuRLI/xxPL0xpFCzwBZ12yNBPvtJBfDjrCbQ3BF
 Kr6UjEhVZMsf08Zh7PTxzubp39uv3xk8j8+VaPeuz9qsZmofEyh7y1JHREJbjJ2DXqmiVRUlu2
 FD8fbYj9ZcvCRCy3yCsBYyR6ILtVGD9L2RhS35cdptmI6XlsUW1M24sDP48z2kdGhcoKkuxixV
 HJGc1mY6J+jG2ziApjkpaJQ73+xet8b0GWAEAAA==
X-Change-ID: 20260925-rock4d-cam4k-6e3521c61b55
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790338647; l=6138;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=xN7v3X7hesRZVMkOlUzapj4+LgE0eflnCea4UWZu/Yw=;
 b=OZchep/qy+LSg8lzxIh8Oj+wqfBHRnzl1TZKe6K5u/RJr37st+QIladMmca8auY7IK+tvcofI
 kElz53+u8kLBlH+4eMmDLXVseU7JPr6FViJoY0U5hfCJ31WX/YilG5Q
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_051731_960201_2A017F99 
X-CRM114-Status: GOOD (  14.50  )
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

Add a device tree overlay for the Radxa Camera 4K (featuring the Sony
IMX415 image sensor) to be applied on the Radxa ROCK 4D camera
connector. The camera connects to CSI HOST1 through the MIPI D-PHY0
in full mode.

Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
 arch/arm64/boot/dts/rockchip/Makefile              |   5 +
 .../dts/rockchip/rk3576-rock-4d-radxa-cam4k.dtso   | 105 +++++++++++++++++++++
 2 files changed, 110 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index e7936a21c118..82b2afd420d5 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -183,6 +183,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-nanopi-m5.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-nanopi-r76s.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-roc-pc.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-rock-4d.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-rock-4d-radxa-cam4k.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3582-radxa-e52c.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-armsom-sige7.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-armsom-w3.dtb
@@ -311,6 +312,10 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-evb1-v10-pcie1.dtb
 rk3576-evb1-v10-pcie1-dtbs := rk3576-evb1-v10.dtb \
 	rk3576-evb1-v10-pcie1.dtbo
 
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-rock-4d-radxa-4k-cam.dtb
+rk3576-rock-4d-radxa-4k-cam-dtbs := rk3576-rock-4d.dtb \
+	rk3576-rock-4d-radxa-cam4k.dtbo
+
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-wifi.dtb
 rk3588-edgeble-neu6a-wifi-dtbs := rk3588-edgeble-neu6a-io.dtb \
 	rk3588-edgeble-neu6a-wifi.dtbo
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d-radxa-cam4k.dtso b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d-radxa-cam4k.dtso
new file mode 100644
index 000000000000..613a3e351500
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d-radxa-cam4k.dtso
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Device tree overlay for the Radxa Camera 4K attached to the camera
+ * connector of the Radxa ROCK 4D.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/rockchip,rk3576-cru.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/media/video-interfaces.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+
+&{/} {
+	savdd_cam: regulator-savdd-cam {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio3 RK_PD0 GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <2900000>;
+		regulator-max-microvolt = <2900000>;
+		regulator-name = "savdd_cam";
+		vin-supply = <&vcc_3v3_s0>;
+	};
+
+	sdvdd_cam: regulator-sdvdd-cam {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <1100000>;
+		regulator-max-microvolt = <1100000>;
+		regulator-name = "sdvdd_cam";
+		vin-supply = <&vcc_5v0_device>;
+	};
+
+	siovdd_cam: regulator-siovdd-cam {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-name = "siovdd_cam";
+		vin-supply = <&vcc_3v3_s0>;
+	};
+};
+
+&i2c5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c5m3_xfer>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	imx415: camera-sensor@1a {
+		compatible = "sony,imx415";
+		reg = <0x1a>;
+		assigned-clocks = <&cru CLK_MIPI_CAMERAOUT_M1>;
+		assigned-clock-rates = <37125000>;
+		avdd-supply = <&savdd_cam>;
+		clocks = <&cru CLK_MIPI_CAMERAOUT_M1>;
+		dvdd-supply = <&sdvdd_cam>;
+		orientation = <2>; /* External */
+		ovdd-supply = <&siovdd_cam>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam_rstn &cam_clk1m0_clk1>;
+		reset-gpios = <&gpio3 RK_PC7 GPIO_ACTIVE_LOW>;
+
+		port {
+			imx415_output: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <445500000>;
+				remote-endpoint = <&csi1_input>;
+			};
+		};
+	};
+};
+
+&pinctrl {
+	cam {
+		cam_rstn: cam-rstn-pinctrl {
+			rockchip,pins = <3 RK_PC7 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&csi1 {
+	status = "okay";
+};
+
+&csi1_in {
+	csi1_input: endpoint {
+		bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+		data-lanes = <1 2 3 4>;
+		link-frequencies = /bits/ 64 <445500000>;
+		remote-endpoint = <&imx415_output>;
+	};
+};
+
+&csi_dphy0 {
+	status = "okay";
+};
+
+&vicap {
+	status = "okay";
+};
+
+&vicap_mmu {
+	status = "okay";
+};

---
base-commit: bd5f485f3f026225b86573e559af0b7254ef4184
change-id: 20260925-rock4d-cam4k-6e3521c61b55
prerequisite-change-id: 20260819-rk3576-dphy-2304f848215b:v2
prerequisite-patch-id: fbe2d84f88709b8bf846debe6b8ce62c4392ca63
prerequisite-patch-id: 9bce33933ae69e8cc7f7ef2f0d9acb969620bc85
prerequisite-patch-id: bff0c668524f94b0b7901c682d5ccdccfe18d46e
prerequisite-patch-id: 8f45701f840680a35e044f43ebd3087282847990
prerequisite-change-id: 20260825-csi-2-rcv-dts-7712bd834de6:v2
prerequisite-patch-id: fbe2d84f88709b8bf846debe6b8ce62c4392ca63
prerequisite-patch-id: 9bce33933ae69e8cc7f7ef2f0d9acb969620bc85
prerequisite-patch-id: bff0c668524f94b0b7901c682d5ccdccfe18d46e
prerequisite-patch-id: 8f45701f840680a35e044f43ebd3087282847990
prerequisite-patch-id: bdbb3e9b072469900cac21031cd799265b52d734
prerequisite-patch-id: c91ceb74abc8bc79ac036990abdef4cbd7328f97
prerequisite-change-id: 20260828-vicap-rk3576-6e7118ea0246:v2
prerequisite-patch-id: fbe2d84f88709b8bf846debe6b8ce62c4392ca63
prerequisite-patch-id: 9bce33933ae69e8cc7f7ef2f0d9acb969620bc85
prerequisite-patch-id: bff0c668524f94b0b7901c682d5ccdccfe18d46e
prerequisite-patch-id: 8f45701f840680a35e044f43ebd3087282847990
prerequisite-patch-id: bdbb3e9b072469900cac21031cd799265b52d734
prerequisite-patch-id: c91ceb74abc8bc79ac036990abdef4cbd7328f97
prerequisite-patch-id: d4120ad9def5effeda632f831b6fd0cd59295285
prerequisite-patch-id: e0c7e587fcaffe58b61fe78508efccec86dc7c79
prerequisite-patch-id: 6a87bd22798d58cc8f9b30733f5b28a2fced05c1
prerequisite-patch-id: a94c687ac3f648079b18dbb5109657fb038bd516
prerequisite-patch-id: 76e36df1aab8a9853440aa28b4bda528ce2adfd7

Best regards,
--  
Amin Gattout <amin.gattout@gmail.com>


