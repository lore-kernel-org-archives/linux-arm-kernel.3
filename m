Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C03DFC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bnDwHn3VE/1QDoX5PmDpHlQdrc4Kek1m+Wmq70y11Yg=; b=kSeyAmRzgA/WkyXabUGYaRZM/p
	lV2xc6fWqAqbuRGnCBld0nPEKQJh9aycUTw/xlI5vN4bpDesdnSV4RqgTDLOlhchF0chnaPb4PHm0
	C1cxuDVsFuu6bliJId+jrLQufakySmBeadFrr+laIZR3/B2rySMBeBLrnFBf6PoNvyQFGVSocz8fr
	+JGwf9Z5+KHlNMu7zqdYNNb1vIcHUyIQL5cJdY+PbfqthwBVDd/F5q0BjFrs5xKHuuCstv5eloUZr
	cRUFDCLYj9Pmmy+rthBF+qHaMBai/P6w93UR1WfdUCr/2gKoMZmYi8qAew6ek6qB9Rvc1luhydnXc
	hyatbgHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjmh-00000008dv8-0cuR;
	Thu, 27 Feb 2025 19:43:03 +0000
Received: from smtp.forwardemail.net ([121.127.44.59])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnipB-00000008LTO-2w6E
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 18:41:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1740681693; bh=bnDwHn3VE/1QDoX5PmDpHlQdrc4Kek1m+Wmq70y11Yg=;
 b=NBqM4qidq/tKl1rLyHAw6yL8e40xXGp8JWxgtAaFpf3gbe9rTrCYfBVhcJa0+tf3u6evneI0j
 13OrUozS/vBmwjEJnUUiZOmdXUOOhAVMAX3UOzFTuARsyNkRz3cKTMOlwE0wm3Pe90eblUvf3Xu
 jA3tpNPUcNOjvBHSFCUUVLUROp3LHszgUa+6UEBQs8wE6LhGO+bHAVnTp79xnvgoY9+fTkZeEHV
 /HJDs8Q+ZEhrisx4h7nZrE0Eigfe7QZ1Opkzto8b5zXGkBlJatgaK2VKVx595BHTO8Uheuk7jpm
 63ju8ROa7hRGbJOInrWx9I5sMLNIxdpc6g4ecd6Jh4xA==
X-Forward-Email-ID: 67c0b1dabf572996e86214e5
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.59
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Yao Zi <ziyao@disroot.org>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 4/4] arm64: dts: rockchip: Add adc-keys node to Radxa E20C
Date: Thu, 27 Feb 2025 18:40:53 +0000
Message-ID: <20250227184058.2964204-5-jonas@kwiboo.se>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250227184058.2964204-1-jonas@kwiboo.se>
References: <20250227184058.2964204-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_104133_829210_D40A3539 
X-CRM114-Status: GOOD (  10.47  )
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

Radxa E20C has two buttons, one SARADC maskrom button and one GPIO user
button.

Add support for the maskrom button using a adc-keys node, also add the
regulators used by SARADC controller.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 .../boot/dts/rockchip/rk3528-radxa-e20c.dts   | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
index d2cdb63d4a9d..dcc0b2584bbc 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
@@ -6,6 +6,8 @@
  */
 
 /dts-v1/;
+
+#include <dt-bindings/input/input.h>
 #include "rk3528.dtsi"
 
 / {
@@ -15,6 +17,54 @@ / {
 	chosen {
 		stdout-path = "serial0:1500000n8";
 	};
+
+	adc-keys {
+		compatible = "adc-keys";
+		io-channels = <&saradc 0>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <1800000>;
+		poll-interval = <100>;
+
+		button-maskrom {
+			label = "MASKROM";
+			linux,code = <KEY_SETUP>;
+			press-threshold-microvolt = <0>;
+		};
+	};
+
+	vcc_1v8: regulator-1v8-vcc {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_1v8";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vcc_3v3>;
+	};
+
+	vcc_3v3: regulator-3v3-vcc {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_3v3";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc5v0_sys: regulator-5v0-vcc-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_sys";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+};
+
+&saradc {
+	vref-supply = <&vcc_1v8>;
+	status = "okay";
 };
 
 &uart0 {
-- 
2.48.1


