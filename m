Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92087CA0EF7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 18:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DPILFNpK7zCsqHWBHdQ9uG4ptTyRvqVrmGvIx37v5K4=; b=Kz+9CTICU3L+/jz0HpeTnT2qR6
	yLs0O2JS/yuSjXOqOlEZmSOzEPJ43QVMhAMxioxcXnyEb/F9IqJp9F10AtIrsk+cT2sjbLhZqjHL5
	s0LU1ENTTZZSpJYa8UdTWvC91pWQzHGdp5BR6WWd3Jpf1YIeWk/i42I5nwsptodAze3D3tx5nogJV
	B2cFDhhVC4TdVQ17dgToYTzaXcgNhlh1Klr4Ku5cI1ZcSpkp0zpsEZbUaati20Y6mvn2BRVKge3BB
	C7tyPEy0ZH6vdqpYUt5XfsJW27aU4Qdz/z3LFeWAUno1f+ua2HbjZHwr6Jkf7pUSG9oVpiLrc3bTC
	ztaijByQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQpf-0000000BC6V-1WCE;
	Tue, 19 Aug 2025 18:13:15 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoMCH-0000000AYze-156i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 13:16:18 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-afcb78d5e13so83962466b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 06:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755609375; x=1756214175; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DPILFNpK7zCsqHWBHdQ9uG4ptTyRvqVrmGvIx37v5K4=;
        b=ZulwZMTodL/Gv0q0grmzCVlftq+bXCpNHOEVtzQnJ0AbL942YB4CP4EEAn3uahN0U5
         dyIbxSBGpDI7RGDYsetdZC/yjXhd4AjNBadnHyLyUqJgLn2bLdc8/vPaY44MHs5bWrry
         tzwqe2zQ76Sslzoj0gSyH7bYnYbGuCAZaC9/HBXcqaO+78LZm5A4NNmO2PlatC7ggHSV
         6u3Xc+0TCCTYfbnNSJYyeLY03HwSGP6I1jult3DyRf+6QcEvGTHytLOEqzWHBycIaDXV
         3rBZQSGMMOK1ZtO1U5hUSpDrzFxlgmdF1SV4v4u41apbkOJ3nlPx6GLlAAGfTl8lq5WR
         dE7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755609376; x=1756214176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DPILFNpK7zCsqHWBHdQ9uG4ptTyRvqVrmGvIx37v5K4=;
        b=udLTe5kk0csxRBDcvS37miJYGykJsvu/WkzsIbQuSRYa+Q7WB4x79Xe9GAlyY1GsmR
         CXg8bQsM4ytNB6QHyvgUBksHEJSw+3l2aknzRxMXvru42x+YvfTfzmP/UerAThSc8h4X
         nk9QSiY0Oa18nQP3ncqaiTnkPzCgkVnbolekwbAbFbqZYKyXC00sumeRnnheVglWswQ5
         IBTKUkp/KDKTMl5wjnH9P6B9mDdMsPd9Urj2mEM8YO0OpARygHEOTfR5IOSgKQ2YalLW
         rKugrZU2ceIL5fD0lmZCm4dqwDcfloyUS0K/Y5wysIkjnN5hbPGke5nGEfHsjHtOJuEp
         62VQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKcU5HM9g94Z8hcggYYDOTv4GCA0H3PfJZ8cnBxw8bBgxXhVmey+TEEl8tvrGcv6ROgSMxF9a50od6E8sqYW8t@lists.infradead.org
X-Gm-Message-State: AOJu0YyMaWBh8pRFgs7LF8thrWPn5bRn4YhktKDPysAaTV/0bKq0Vei+
	ScZ0VANW97P2LfuBSWQ81QkPyiO4sCKKNn4jcOT/dBGjAuwiVJ7eA/1gYCeKAg3qHyrjqMl/iy2
	vnsSP
X-Gm-Gg: ASbGnctrHSRzR5VVEDtlNza68JQ0cgKZANKFo0KBCC0EgXGWdf3JbT7pJkUm4wJAip1
	G1rwoXE9S3ZhN4Vz8HyB2FtJobLy++SWMPge9CjoPrB1Dy6AQSpQxtr/JrFCgtV1dZN0i4q8nyY
	Y73SvX98wLozBHjjJmD2YS6SeZgbsVUdRX057sEiVl1WYwR+sJ21HPtZEgkGXyFvVgkbRkb7T/T
	uceUfLerKcfz05iA9FjDUf71GUHxBdYEI+QcZJbZofGw/xK34kWfsiqdpEd6Y5ZM94s47E+w7Kl
	cv7jqjOtWAtDVlGe5ihT/8f+VmyN71ReezGydpG43Ds9Ugb7CcGgf8akahX5cbV2W5dvIDIoeht
	j1ROcwM8Um5Ddq7InJlSHeW+H3yG/wuoV7FxpA8DkluxG
X-Google-Smtp-Source: AGHT+IFlSe6sbMbTSuOg6u2AFFHkncCf/aboZnrFBeb3plYt2M1g7caLrLJTlnNZL7b96zAaRKt4Pg==
X-Received: by 2002:a17:907:969e:b0:af8:fc60:5008 with SMTP id a640c23a62f3a-afddcd113eemr121159066b.4.1755609375493;
        Tue, 19 Aug 2025 06:16:15 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce53d60sm998744666b.20.2025.08.19.06.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 06:16:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] arm64: dts: rockchip: Minor whitespace cleanup
Date: Tue, 19 Aug 2025 15:16:09 +0200
Message-ID: <20250819131607.86338-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250819131607.86338-3-krzysztof.kozlowski@linaro.org>
References: <20250819131607.86338-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6570; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=63JgKqF3bc5t1TwNQeM5U464DiEpmWFQDp6CzuzSqJM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBopHkYebIcahBFBqreRmNe33++dMlPkjj+8wJIZ
 2Hj40Y7qw6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKR5GAAKCRDBN2bmhouD
 15l7EACPLhACEmtJ9t9YjD/9I0wca/SoRWGRlR0miHb8fOJJ/ZUdZ/TqYmuFbUZdIYkCRNryYeO
 Ah3lx7QD+SfVtWmULtH8QaFr9yhHN4qXrmsfqUlDAYNILt3i0VBLjk+sFRM4bfSzGM+bsqbsvki
 xGDBMtiSNy8RJDs+PbrhGjDkGjmOao5H1V6WYcmjlWQ54n9UbXgZWvQcHCBiggl0cAnIn2P6nk1
 GZ1mJxgT0mdIz1AwoHLzRr6DUTJwHpf7LQScLxE3oNUN/QzqXsL7QSJyWcFWGgYj0Bltxi71UjL
 91LKtj8LKkaG/I1aavb1AWprGDlvw8dZ8LPTUlh/dm9nXTPAS2N/HgH63zOA8hEajXd55qPYjBs
 tRz4BuME5cyCK2V8ygLSIGT0pbCeFaV4tckpgiQPVnz/lLZ+V6NxNNdvDEUfnaaz3hpWvJNERpW
 n+LZDBATQT2QhPK/ciSfFfZtH3sunRKb6JTPRnfjemMV9CdxkSr92N0FV1/q/k6LcbMeIEbzbEz
 DhYZ+kmQccoc1SOIX27IgL925+XNT8hfXmiGKDOkgqKUFzDje0o01PkRrxKWDZSDOAxvjRVJ7v3
 MgeUWrS5Mo9/ANCZpbMFcmNRnTWLIeWvxlULSeQXODt3ChbQ08vwhyRoPwqZ9yeknpv1sSRi1Wl WaVtMluTg3SvWMg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_061617_290978_647692D2 
X-CRM114-Status: GOOD (  13.44  )
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

The DTS code coding style expects exactly one space around '=' or '{'
characters.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi             | 8 ++++----
 .../dts/rockchip/px30-ringneck-haikou-video-demo.dtso     | 6 +++---
 arch/arm64/boot/dts/rockchip/rk3308-sakurapi-rk3308b.dts  | 2 +-
 .../boot/dts/rockchip/rk3399-puma-haikou-video-demo.dtso  | 6 +++---
 arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi  | 4 ++--
 arch/arm64/boot/dts/rockchip/rk3588j.dtsi                 | 4 ++--
 6 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi b/arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi
index b4bd4e34747c..192791993f05 100644
--- a/arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi
@@ -72,7 +72,7 @@ vcc5v0_sys: regulator-vccsys {
 	};
 
 	vcc_cam_avdd: regulator-vcc-cam-avdd {
-		compatible  = "regulator-fixed";
+		compatible = "regulator-fixed";
 		regulator-name = "vcc_cam_avdd";
 		gpio = <&gpio3 RK_PC0 GPIO_ACTIVE_LOW>;
 		pinctrl-names = "default";
@@ -83,7 +83,7 @@ vcc_cam_avdd: regulator-vcc-cam-avdd {
 	};
 
 	vcc_cam_dovdd: regulator-vcc-cam-dovdd {
-		compatible  = "regulator-fixed";
+		compatible = "regulator-fixed";
 		regulator-name = "vcc_cam_dovdd";
 		gpio = <&gpio3 RK_PC1 GPIO_ACTIVE_LOW>;
 		pinctrl-names = "default";
@@ -94,7 +94,7 @@ vcc_cam_dovdd: regulator-vcc-cam-dovdd {
 	};
 
 	vcc_cam_dvdd: regulator-vcc-cam-dvdd {
-		compatible  = "regulator-fixed";
+		compatible = "regulator-fixed";
 		regulator-name = "vcc_cam_dvdd";
 		gpio = <&gpio3 RK_PC5 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
@@ -106,7 +106,7 @@ vcc_cam_dvdd: regulator-vcc-cam-dvdd {
 	};
 
 	vcc_lens_afvdd: regulator-vcc-lens-afvdd {
-		compatible  = "regulator-fixed";
+		compatible = "regulator-fixed";
 		regulator-name = "vcc_lens_afvdd";
 		gpio = <&gpio3 RK_PB2 GPIO_ACTIVE_LOW>;
 		pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-video-demo.dtso b/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-video-demo.dtso
index ea5ce919984f..760d5139f95d 100644
--- a/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-video-demo.dtso
+++ b/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-video-demo.dtso
@@ -26,7 +26,7 @@ backlight: backlight {
 	};
 
 	cam_afvdd_2v8: regulator-cam-afvdd-2v8 {
-		compatible  = "regulator-fixed";
+		compatible = "regulator-fixed";
 		gpio = <&pca9670 2 GPIO_ACTIVE_LOW>;
 		regulator-max-microvolt = <2800000>;
 		regulator-min-microvolt = <2800000>;
@@ -35,7 +35,7 @@ cam_afvdd_2v8: regulator-cam-afvdd-2v8 {
 	};
 
 	cam_avdd_2v8: regulator-cam-avdd-2v8 {
-		compatible  = "regulator-fixed";
+		compatible = "regulator-fixed";
 		gpio = <&pca9670 4 GPIO_ACTIVE_LOW>;
 		regulator-max-microvolt = <2800000>;
 		regulator-min-microvolt = <2800000>;
@@ -44,7 +44,7 @@ cam_avdd_2v8: regulator-cam-avdd-2v8 {
 	};
 
 	cam_dovdd_1v8: regulator-cam-dovdd-1v8 {
-		compatible  = "regulator-fixed";
+		compatible = "regulator-fixed";
 	        gpio = <&pca9670 3 GPIO_ACTIVE_LOW>;
 	        regulator-max-microvolt = <1800000>;
 	        regulator-min-microvolt = <1800000>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3308-sakurapi-rk3308b.dts b/arch/arm64/boot/dts/rockchip/rk3308-sakurapi-rk3308b.dts
index aee6643e33ab..3473db08b9b2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3308-sakurapi-rk3308b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3308-sakurapi-rk3308b.dts
@@ -260,6 +260,6 @@ &usb_host_ehci {
 	status = "okay";
 };
 
-&usb_host_ohci{
+&usb_host_ohci {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-video-demo.dtso b/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-video-demo.dtso
index d28880b8dd44..5e8f729c2cf2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-video-demo.dtso
+++ b/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-video-demo.dtso
@@ -26,7 +26,7 @@ backlight: backlight {
 	};
 
 	cam_afvdd_2v8: regulator-cam-afvdd-2v8 {
-		compatible  = "regulator-fixed";
+		compatible = "regulator-fixed";
 		gpio = <&pca9670 2 GPIO_ACTIVE_LOW>;
 		regulator-max-microvolt = <2800000>;
 		regulator-min-microvolt = <2800000>;
@@ -35,7 +35,7 @@ cam_afvdd_2v8: regulator-cam-afvdd-2v8 {
 	};
 
 	cam_avdd_2v8: regulator-cam-avdd-2v8 {
-		compatible  = "regulator-fixed";
+		compatible = "regulator-fixed";
 		gpio = <&pca9670 4 GPIO_ACTIVE_LOW>;
 		regulator-max-microvolt = <2800000>;
 		regulator-min-microvolt = <2800000>;
@@ -44,7 +44,7 @@ cam_avdd_2v8: regulator-cam-avdd-2v8 {
 	};
 
 	cam_dovdd_1v8: regulator-cam-dovdd-1v8 {
-		compatible  = "regulator-fixed";
+		compatible = "regulator-fixed";
 	        gpio = <&pca9670 3 GPIO_ACTIVE_LOW>;
 	        regulator-max-microvolt = <1800000>;
 	        regulator-min-microvolt = <1800000>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi b/arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi
index e7ba477e75f9..7f578c50b4ad 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi
@@ -53,7 +53,7 @@ led-0 {
 			gpios = <&gpio4 RK_PA1 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "default-on";
 			pinctrl-names = "default";
-			pinctrl-0 =<&blue_led>;
+			pinctrl-0 = <&blue_led>;
 		};
 
 		led-1 {
@@ -62,7 +62,7 @@ led-1 {
 			gpios = <&gpio0 RK_PB7 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "heartbeat";
 			pinctrl-names = "default";
-			pinctrl-0 =<&heartbeat_led>;
+			pinctrl-0 = <&heartbeat_led>;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588j.dtsi b/arch/arm64/boot/dts/rockchip/rk3588j.dtsi
index 3045cb3bd68c..9884a5df47df 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588j.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588j.dtsi
@@ -28,7 +28,7 @@ cluster1_opp_table: opp-table-cluster1 {
 		compatible = "operating-points-v2";
 		opp-shared;
 
-		opp-1200000000{
+		opp-1200000000 {
 			opp-hz = /bits/ 64 <1200000000>;
 			opp-microvolt = <750000 750000 950000>;
 			clock-latency-ns = <40000>;
@@ -49,7 +49,7 @@ cluster2_opp_table: opp-table-cluster2 {
 		compatible = "operating-points-v2";
 		opp-shared;
 
-		opp-1200000000{
+		opp-1200000000 {
 			opp-hz = /bits/ 64 <1200000000>;
 			opp-microvolt = <750000 750000 950000>;
 			clock-latency-ns = <40000>;
-- 
2.48.1


