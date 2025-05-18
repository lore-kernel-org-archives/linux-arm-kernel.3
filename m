Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34367C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 May 2025 22:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+xC9UkJXY5JOXOk/2b7g0F3PoOZpaKShkIk0Mc9SNGk=; b=IdQy5i5S5hi5FjrDeEePYRbpLT
	8wuQrIuYg+r6+WY4+4Yyf4GBA/s1X84yNJa8ArP2qDuku+uCcJlV6PaEtVbNyI8oWUgTNKukhyJeP
	RPPV+QY8vBBMoV5W4XBEWVVtMLRM1N7oTY46nuhfnq5ZN5YGJHWaDjVxjCvXjurrp60bkPRJssNh2
	RKZOyLbR1Ls/7NJqukwwyGeblT8tSuOT6cgxOGOFDfhXxfFS9JQr8AeHpCbGL+IVAV5R6eUZDe32x
	8nP+wfeFUub8WQQI6WlP77DRgopAT6HNuQGLpMK4FmLF1WFsD6Q4pF3KZBs/N8aukV6fpa78BsmZc
	adcKAMfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGm6u-00000007a7H-0YqI;
	Sun, 18 May 2025 22:03:56 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGm2w-00000007Zpn-0v4j;
	Sun, 18 May 2025 21:59:51 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so38967755e9.1;
        Sun, 18 May 2025 14:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747605588; x=1748210388; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+xC9UkJXY5JOXOk/2b7g0F3PoOZpaKShkIk0Mc9SNGk=;
        b=GDF+QAaQW0YHSDlNPJb0ZtJVunAigeVQ6gGa5u4nXn9JM5hP/9roQa2htXsdIZ6BhY
         7QMbXcgTN3kPr3Lc2V92+ufBqB9XaQJsXNtiEEwNGot5QOA8HMlXSrlRxq8tROv9eJHf
         0aO8LQvjnuKMtAVz0PurMfPZ04cLhPE0k57TZwigfbxsR4zo410V7DdCgE3lXGiRXlQO
         5W0NkfLtAmIZj5h32R/G2MNu+eFL5A4FYewKK5KH8HbCiwa9kHx9adp8+a31SEfn7k3I
         saFnc/ePF8Nr4hcybdDzK+WOnPqii1fk4GW+whnYl/kdK/kcXH3lbFGPaFjj5OzeWg8/
         qi+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747605588; x=1748210388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+xC9UkJXY5JOXOk/2b7g0F3PoOZpaKShkIk0Mc9SNGk=;
        b=ZyKwPbDd8mqBZf10zizSKb8jAwx5DdmMkm1JgRVnLrDYKSmxggeUG8mDp6XyvP4LPG
         PcNRwgF4baizdMlnuz55RRR9pXs8lrTY/5PdgHAY74k0RiF1f9fYwo7f3xBVkGVh6AWg
         xPSva73iBtRdCMaFSgKBis8BtAb+OmOdZ6kUtkWu79AiSdCt6ROR+o0AF+PkZYYhTp5M
         XcfjgF9XRo+ewJH4Zlcdt68eDKFtSs0KNMSgH+m2UKmyGcjEB4BX0xKWQ+LdRJZVJHuv
         5sxsNBSUtD3IuiV9Y0J7A5fOO+CERE1Et0eEx4LTeK+VbWw2AQGHaIt4r5Mj7htgRIlH
         3y3A==
X-Forwarded-Encrypted: i=1; AJvYcCUCu0MGW6txvBdizWtm2c3q8X5Y+zb0N0sPomcWd+/XKC4FIPZQmDwB9KUhpn1vRSoA8n8pK8tJT0n4jupS4o4/@lists.infradead.org, AJvYcCUSQxCrsZ9C+Toe+DmfUer9C3Bb3yBWBfiMyjGy3VT/2fuaNAxELw9vI6JtCHmIHCRWnhKBq+0khwdDoXUEcpg=@lists.infradead.org
X-Gm-Message-State: AOJu0YyZUEK3xyVagNJkfdj8COyJU0dzM6IJ4hXat3wdgomLsuj30vu0
	KegKh8Vh3coWHCBeKLYnvUDbKFMMRTcYKOi3JQh8TZKR4uzPOkqi1Ho1
X-Gm-Gg: ASbGncvlqOBUKKsOwQb6jSGnzvmzt+TsPPdT6tDAGYi6NyMTplaNVPVcs0b6dxd3S+M
	53OFFS8f1fcTyLb6Y9WHTm43489BZ1brzJSzuRDKAwKDaEROEWS7vLunRv32YAtKkpsQjhfn/vH
	dNKupHS4YdbecVgPeJUw1atH2H9sgTjfXTb3BjwJs1SwHa8HY/2OvP2enRbDWtKsstxYcy8DAaX
	RJrbThrgT7Dya7R1EbQ1AzjdUmzn0ZlBTSsnnidTBvKO2Xp5c7QOxoAHKjkmiYgdSBjQJnzMglr
	ThZF4OGsOX3OUc4oEeYtjuXe6KvWK4u7LC40tTa8OicX9KWi3gEyVpkhWt7N+83elXIMxUO7Oev
	gub/16JJIMu+WG7Cip/BD2egHDHg0fN5iItspb/z4YxzMNWeJxo5b7Gzf6Y78e3hziAysGk14H4
	kjBfSw+Umklg==
X-Google-Smtp-Source: AGHT+IFvLBK7QKQLjbsresGOshkAq1Y2KEzfkr14fsl/n+XnbtnLa4n6aQg00/piBwhOnMY4ArgxzQ==
X-Received: by 2002:a05:600c:3e18:b0:440:6852:5b31 with SMTP id 5b1f17b1804b1-44302ae93ffmr91509075e9.10.1747605588447;
        Sun, 18 May 2025 14:59:48 -0700 (PDT)
Received: from cypher.home.roving-it.com (2.c.4.1.7.3.6.4.2.a.a.3.0.f.c.2.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:2cf0:3aa2:4637:14c2])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442f39ef81csm185711995e9.34.2025.05.18.14.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 14:59:48 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Peter Geis <pgwipeout@gmail.com>
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH 2/2] arm64: dts: rockchip: add overlay for RockPro64 screen
Date: Sun, 18 May 2025 22:59:34 +0100
Message-ID: <20250518215944.178582-2-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250518215944.178582-1-pbrobinson@gmail.com>
References: <20250518215944.178582-1-pbrobinson@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_145950_255909_C75BC6A8 
X-CRM114-Status: GOOD (  15.99  )
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

The Pine64 touch panel is a panel consisting of the Feiyang fy07024di26a30d
panel with a Goodix gt911 touch screen. Add a device tree overlay to
allow the display to be easily used on the device.

This was previously included in the main device tree but left disabled
by default which still required rebuilding the DT to use the device, now
overlays can go upstream the overlay is the best way to handle the
add on devices.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 arch/arm64/boot/dts/rockchip/Makefile         |  9 ++
 .../dts/rockchip/rk3399-rockpro64-screen.dtso | 89 +++++++++++++++++++
 2 files changed, 98 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-rockpro64-screen.dtso

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 3e8771ef69ba1..c7b13bff3ac20 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -77,6 +77,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-rock-pi-4c.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-rock960.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-rockpro64-v2.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-rockpro64.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-rockpro64-screen.dtso
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-sapphire.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-sapphire-excavator.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399pro-rock-pi-n10.dtb
@@ -209,6 +210,14 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-puma-haikou-haikou-video-demo.dtb
 rk3399-puma-haikou-haikou-video-demo-dtbs := rk3399-puma-haikou.dtb \
 	rk3399-puma-haikou-video-demo.dtbo
 
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-rockpro64-screen.dtb
+rk3399-rockpro64-screen-dtbs := rk3399-rockpro64.dtb \
+	rk3399-rockpro64-screen.dtbo
+
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-rockpro64-screen.dtb
+rk3399-rockpro64-v2-screen-dtbs := rk3399-rockpro64-v2.dtb \
+	rk3399-rockpro64-screen.dtbo
+
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-vz-2-uhd.dtb
 rk3568-wolfvision-pf5-vz-2-uhd-dtbs := rk3568-wolfvision-pf5.dtb \
 	rk3568-wolfvision-pf5-display-vz.dtbo \
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64-screen.dtso b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64-screen.dtso
new file mode 100644
index 0000000000000..26899cd67fc9b
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64-screen.dtso
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2017 Fuzhou Rockchip Electronics Co., Ltd.
+ * Copyright (c) 2025 Peter Robinson <pbrobinson@gmail.com>
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+
+&{/} {
+	avdd: regulator-avdd {
+		compatible = "regulator-fixed";
+		regulator-name = "avdd";
+		regulator-min-microvolt = <11000000>;
+		regulator-max-microvolt = <11000000>;
+		vin-supply = <&vcc3v3_s0>;
+	};
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 4 8 16 32 64 128 255>;
+		default-brightness-level = <5>;
+		pwms = <&pwm0 0 1000000 0>;
+		status = "okay";
+	};
+};
+
+&i2c4 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touch: touchscreen@5d {
+		compatible = "goodix,gt911";
+		reg = <0x5d>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <RK_PD5 IRQ_TYPE_EDGE_FALLING>;
+		AVDD28-supply = <&vcc3v0_touch>;
+		VDDIO-supply = <&vcc3v0_touch>;
+		irq-gpios = <&gpio4 RK_PD5 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&gpio4 RK_PD6 GPIO_ACTIVE_HIGH>;
+		status = "okay";
+	};
+};
+
+&mipi_dsi {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	clock-master;
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		mipi_out: port@1 {
+			reg = <1>;
+
+			mipi_out_panel: endpoint {
+				remote-endpoint = <&mipi_in_panel>;
+			};
+		};
+	};
+
+	mipi_panel: panel@0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		compatible = "feiyang,fy07024di26a30d";
+		reg = <0>;
+		avdd-supply = <&avdd>;
+		backlight = <&backlight>;
+		dvdd-supply = <&vcc3v3_s0>;
+
+		port {
+			mipi_in_panel: endpoint {
+				remote-endpoint = <&mipi_out_panel>;
+			};
+		};
+	};
+};
+
+&pwm0 {
+	status = "okay";
+};
-- 
2.49.0


