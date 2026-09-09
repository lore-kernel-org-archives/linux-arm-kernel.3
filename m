Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9CFCC79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 10:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1zg6mwnSPboNknQUC1L1HpPT5den/iP0+b+QvQio3VU=; b=F64JvC9jcCIth2Wi2YsWHyy8Mu
	fApti9owWveL66OMqeqP79ynGwFb64o2muJVxInwIglDRKPFMEf5Y0FeSQkl0N9L4lJIDTKcWXZOb
	ZT8lprs6v6GKcGGMP2XacrQjuo4ugyTarb4i0ogARQ9ShhNmpiZHa4I4NFW5zBw6UZDGyJAC7pwUK
	eCjgOuJzqtFyXb01YwTB4/TO+MAk7DTtHnLfUSPUaETFsjI15NOkYnjhhJIkivS+f9TOI/7qWViGM
	EkYigo9D3YAPjKWC1Znvh8c4nYSXta+xMaYtm01Yj7BifFkmsZwVcVgD1mtZfn87I284tfo9VOjqZ
	NirbHsAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4FWS-0000000BPfL-34A1;
	Wed, 09 Sep 2026 10:27:20 +0000
Received: from fhigh-b4-smtp.messagingengine.com ([202.12.124.155])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4FWM-0000000BPbw-21mP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 10:27:18 +0000
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B18F67A0084;
	Wed,  9 Sep 2026 06:27:13 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 09 Sep 2026 06:27:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1788949633;
	 x=1789036033; bh=1zg6mwnSPboNknQUC1L1HpPT5den/iP0+b+QvQio3VU=; b=
	f/2VDSpopPj+vGIbD8jGM1mpRic5UP5Re892wY2dWRdlqYxuepQ2dWhRfCNLViRI
	8syeDHIOyNoa6N50TPLeiXJXGwNcDZK1tTJasCj22I9GXhBwuvJQfP77NDKalA9M
	ILKaatJls7MFIVOpCehsYM+j1ux78MFI4ht81nwDsHBS9Iu/D6y/yFmrT5ERxrLs
	RmxeBKUfDiG6IQuA3l0KcpTz2vpi7kaPP0y5o4xL/G7ttGhQoj1NpYnJhYnuDx7B
	WSPxRx3herwxURPV9hcJ/4Hxee9+cehkmHkc2w05ZeVTtySJ7KOnzAjWi9t9hfPT
	NsSCNGvBwI3zOoWeBeIE9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788949633; x=
	1789036033; bh=1zg6mwnSPboNknQUC1L1HpPT5den/iP0+b+QvQio3VU=; b=Q
	bIuGvMD5ud+EsdScdegFpBREn/UVqnKv60iheFo7jkPw7rCzv4GDBv1Zr2MSQN4F
	rmnZM5xMaluRZ8E+WgrWakg0FGFTQOhdAZGv1IW9/SoSEGTiMpVUdcZ8hsM40JmZ
	fEjFi3zeA033FUCFtl9cXK3LfP+J/M/1wSz2Y9zjk4qqqZ+02fFfP4lese/PMzUM
	2KPpxjrB0DGXz+NF6yfpBfiMeeXbDoQm9vBxc8CM894rc7Em57qBvv1fpt5HIoCP
	9xEe6aPFytdycm1QtXyw6kk8g9/Hy4E9eJzuJjXO/eyFM/MTLrI1YLkiQpEskUnx
	e9AActm8ufmUJKRgR+lJw==
X-ME-Sender: <xms:gTShasgKxSxvqg2VcPmgh_jSKIKfpRkO_0ITfTaAjvjRtMOwbCs_Ow>
    <xme:gTShatNXZzoU9EgEgZ3Kq7Lf-vC69jtPIkOqzkdhpcJqE7mjiXMjAd8moeWecPxS6
    I37sEOJidFgxVfILC5fESU1vBktkSq-wrZWdzFl3043ukItCoIFqncztw>
X-ME-Received: <xmr:gTShavq45jD5xnWn5o2NXn55Xf3ONGFKtIn8mJzIKbGuRQza7uxQKKQmNZM5hz1Dk-AJJjJXA6BE-KLhI5UZ7ZE7td0C5-XhHIu-ZQ>
X-ME-Proxy-Cause: dmFkZTGrfMJS/BPnzvFtxFWH7T2NvqB5iRSUYFltsQYoqh91AcAlEZdgxuHZyrYLq3kEOk
    j5wvhkqN1OKl91HrWXzjjavcMXmgvEWC1tfNMr6YyuWRD6//RUDkmVO3/ATEajCWyfZedL
    8sHEPefu4TqdYPDdk53dU84dTpDQmvitB4Jd8BhRBQx2FhHfLph5+6E9Uyo985vYlfK3rV
    DNGLSCjFuasa5/IY8K3MZyQs8cwzlsSAXH1aJt2liMZr6UglJb7lvyAF9z6AbPEzIyhVzl
    HRoRmsqTYvRh/nPj5OrrpEMagZdYAssoR8SKXOADJ0/HyjV/ybNJdeD0QwSSZATBimrjaP
    q2oHqd4V+7UZSKagR3wB7C8yA/BnXgBU3yMeyaSIkGabFurIkc1y/cub/tWbE7JuIhlhFm
    DO1Aq2qcUhSKdoAhClN0LQMu0V034d51lvWpSnqxlFa/vicDd9VOfbNpuQR7C7hi3ISdF3
    3TUJM4DyUUGmooibaQrDKWpiv4aBc2mzvpWofAYRm+RdLlm0XJtnE3OMltOSEZyAga3fWj
    CSvqM33AFjqKVnSwVSMREn05EtlAWLO4Gck4SUzWLG8T8Mg2XcvriFLz3ESTf8Fft3Gots
    w/JYHnMxqd54sdIJxewJLH8IUbWwZ6mpO42R3bOqk82GrT+TzgeVFHvV+Z9A
X-ME-Proxy: <xmx:gTShan7kXdH47iO0AY2C64o6_UQJpt9WcUgiYFXo1TG3bxqeRmgrHw>
    <xmx:gTShaljBuV_EVeiE8gAGI0HA2JfLJLZjGGWHk6G8BjQoSoYRe8pczQ>
    <xmx:gTShal410SkQIqdmdF5hE4Bjb3EBNUf13poMPjuDL9AnCxnEkE4Eig>
    <xmx:gTShaiFIeUpeu6TIjPrq4wN3RURLCHDOaH2ikt6qtfJ_vfnXI0dc7w>
    <xmx:gTShagDRzLEzwFmSFy5TEy8oUoWrZbOM7nKvVBi9v2-J8oGp8O777yF1>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Sep 2026 06:27:12 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Wed, 09 Sep 2026 12:26:58 +0200
Subject: [PATCH 02/13] arm64: dts: apple: t8122: Fix blank line related
 dt-style-check issues
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-apple-dts-m3-dt-style-check-v1-2-4c546e2d9d51@jannau.net>
References: <20260909-apple-dts-m3-dt-style-check-v1-0-4c546e2d9d51@jannau.net>
In-Reply-To: <20260909-apple-dts-m3-dt-style-check-v1-0-4c546e2d9d51@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4776; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=XqBINKXniaRwvPYcX3CE8cuCcNAUvA/oREFDHduSrTo=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqyFJhVWXrwp4ba1IS90jih47Hfw419tFXpbMpm1/+mU2
 /GPXH51lLIwiHExyIopsiRpv+xgWF2jGFP7IAxmDisTyBAGLk4BmIifDcM/u8R9ej7n3htXRffG
 Jtu8/HolrLFF7n2LZNLrus+C519lM/wzXd6Q7/V/2ewDYZntV8O29dx5xpD0USjrnMLk1zmu/nb
 MAA==
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_032714_630214_BAEA1E31 
X-CRM114-Status: GOOD (  11.52  )
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

Fixes dt-style-check 'blank-lines' and 'required-blank-lines' issues
reported in strict mode.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t8122-j504.dts  |  2 +-
 arch/arm64/boot/dts/apple/t8122-j613.dts  |  1 +
 arch/arm64/boot/dts/apple/t8122-j615.dts  |  1 +
 arch/arm64/boot/dts/apple/t8122-jxxx.dtsi |  1 +
 arch/arm64/boot/dts/apple/t8122-pmgr.dtsi |  1 -
 arch/arm64/boot/dts/apple/t8122.dtsi      | 14 +++++++++++++-
 6 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t8122-j504.dts b/arch/arm64/boot/dts/apple/t8122-j504.dts
index 464491b55b01..d9e8016e84a2 100644
--- a/arch/arm64/boot/dts/apple/t8122-j504.dts
+++ b/arch/arm64/boot/dts/apple/t8122-j504.dts
@@ -20,6 +20,7 @@ / {
 
 	led-controller {
 		compatible = "pwm-leds";
+
 		led-0 {
 			pwms = <&fpwm1 0 40000>;
 			label = "kbd_backlight";
@@ -34,4 +35,3 @@ led-0 {
 &fpwm1 {
 	status = "okay";
 };
-
diff --git a/arch/arm64/boot/dts/apple/t8122-j613.dts b/arch/arm64/boot/dts/apple/t8122-j613.dts
index 51894ea705e7..127a4c2d8577 100644
--- a/arch/arm64/boot/dts/apple/t8122-j613.dts
+++ b/arch/arm64/boot/dts/apple/t8122-j613.dts
@@ -19,6 +19,7 @@ / {
 
 	led-controller {
 		compatible = "pwm-leds";
+
 		led-0 {
 			pwms = <&fpwm1 0 40000>;
 			label = "kbd_backlight";
diff --git a/arch/arm64/boot/dts/apple/t8122-j615.dts b/arch/arm64/boot/dts/apple/t8122-j615.dts
index 2a1970c1bc90..9ef7791e2f32 100644
--- a/arch/arm64/boot/dts/apple/t8122-j615.dts
+++ b/arch/arm64/boot/dts/apple/t8122-j615.dts
@@ -19,6 +19,7 @@ / {
 
 	led-controller {
 		compatible = "pwm-leds";
+
 		led-0 {
 			pwms = <&fpwm1 0 40000>;
 			label = "kbd_backlight";
diff --git a/arch/arm64/boot/dts/apple/t8122-jxxx.dtsi b/arch/arm64/boot/dts/apple/t8122-jxxx.dtsi
index dd85f0c9fb1e..b9576e4164a3 100644
--- a/arch/arm64/boot/dts/apple/t8122-jxxx.dtsi
+++ b/arch/arm64/boot/dts/apple/t8122-jxxx.dtsi
@@ -26,6 +26,7 @@ framebuffer0: framebuffer@0 {
 			reg = <0 0 0 0>; /* To be filled by loader */
 			power-domains = <&ps_disp_cpu>, <&ps_dptx_ext_phy>;
 			/* Format properties will be added by loader */
+
 			status = "disabled";
 		};
 	};
diff --git a/arch/arm64/boot/dts/apple/t8122-pmgr.dtsi b/arch/arm64/boot/dts/apple/t8122-pmgr.dtsi
index 64093792e0ad..3f8be74b5ea8 100644
--- a/arch/arm64/boot/dts/apple/t8122-pmgr.dtsi
+++ b/arch/arm64/boot/dts/apple/t8122-pmgr.dtsi
@@ -1004,7 +1004,6 @@ ps_disp_cpu: power-controller@10000 {
 };
 
 &pmgr_mini {
-
 	ps_debug_gated: power-controller@0 {
 		compatible = "apple,t8122-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
 		reg = <0x0 4>;
diff --git a/arch/arm64/boot/dts/apple/t8122.dtsi b/arch/arm64/boot/dts/apple/t8122.dtsi
index 1ee61c5b3409..de09989c5663 100644
--- a/arch/arm64/boot/dts/apple/t8122.dtsi
+++ b/arch/arm64/boot/dts/apple/t8122.dtsi
@@ -29,12 +29,15 @@ cluster0 {
 				core0 {
 					cpu = <&cpu_e0>;
 				};
+
 				core1 {
 					cpu = <&cpu_e1>;
 				};
+
 				core2 {
 					cpu = <&cpu_e2>;
 				};
+
 				core3 {
 					cpu = <&cpu_e3>;
 				};
@@ -44,12 +47,15 @@ cluster1 {
 				core0 {
 					cpu = <&cpu_p0>;
 				};
+
 				core1 {
 					cpu = <&cpu_p1>;
 				};
+
 				core2 {
 					cpu = <&cpu_p2>;
 				};
+
 				core3 {
 					cpu = <&cpu_p3>;
 				};
@@ -197,6 +203,7 @@ i2c0: i2c@2a1010000 {
 			#address-cells = <0x1>;
 			#size-cells = <0x0>;
 			power-domains = <&ps_i2c0>;
+
 			status = "disabled";
 		};
 
@@ -211,6 +218,7 @@ i2c1: i2c@2a1014000 {
 			#address-cells = <0x1>;
 			#size-cells = <0x0>;
 			power-domains = <&ps_i2c1>;
+
 			status = "disabled";
 		};
 
@@ -225,6 +233,7 @@ i2c2: i2c@2a1018000 {
 			#address-cells = <0x1>;
 			#size-cells = <0x0>;
 			power-domains = <&ps_i2c2>;
+
 			status = "disabled";
 		};
 
@@ -239,6 +248,7 @@ i2c3: i2c@2a101c000 {
 			#address-cells = <0x1>;
 			#size-cells = <0x0>;
 			power-domains = <&ps_i2c3>;
+
 			status = "disabled";
 		};
 
@@ -253,6 +263,7 @@ i2c4: i2c@2a1020000 {
 			#address-cells = <0x1>;
 			#size-cells = <0x0>;
 			power-domains = <&ps_i2c4>;
+
 			status = "disabled";
 		};
 
@@ -262,6 +273,7 @@ fpwm1: pwm@2a1044000 {
 			power-domains = <&ps_fpwm1>;
 			clocks = <&clkref>;
 			#pwm-cells = <2>;
+
 			status = "disabled";
 		};
 
@@ -278,6 +290,7 @@ serial0: serial@2a1200000 {
 			clocks = <&clkref>, <&clkref>;
 			clock-names = "uart", "clk_uart_baud0";
 			power-domains = <&ps_uart0>;
+
 			status = "disabled";
 		};
 
@@ -356,7 +369,6 @@ i2c4_pins: i2c4-pins {
 				pinmux = <APPLE_PINMUX(149, 1)>,
 					 <APPLE_PINMUX(148, 1)>;
 			};
-
 		};
 
 		pinctrl_nub: pinctrl@2e41f0000 {

-- 
2.55.0


