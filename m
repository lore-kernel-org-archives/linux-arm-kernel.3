Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C13C8302D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 16:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FOdigrsQQpd9WEDOm3Dn2iOG8VrxDhh0NLeJNZe4Nnc=; b=e++/yj9D360TAnsLt3TS3rCeOI
	uVCfWjonGI3JADHDmasuFR7hT83j86+ClM5gs2nbemmuk3bI3vsSki6nDnFpVae1p5EKbir3zNcQV
	VM5L7wnpeioMBDKOTx7prGfQUBCOpYuHys3MgRZTHbLMkgusHawRlBZ+UFBF+QbREFtUOYRV7ARDI
	scQjauLF8vTSReTYKnpvbZLV9eNba2IPJj21+5FCGe/PZKRxogOllkX+5pkI4LgPrGXf/qbyUX8bd
	ViN4ZUcUUhBrNI651PXhHiZDG1SyKg2Zl77ZmDDxPUQQyQkYcqcL6PoJq4uTGIQ+s2NuBQ9At+j1p
	sOWLH/iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWHAh-00000002rir-2aG2;
	Mon, 30 Jun 2025 16:15:55 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWGZ6-00000002m15-0lfX;
	Mon, 30 Jun 2025 15:37:05 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1751297811; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dFpvo546i+o+0y0ZvSbc31+hjS8gKxW1/ScGQz8pMXWQaUP6keGdnEXNn1vDQtnWxB2f6MezYHuD7ZmrNRYeHM72bxNK4YO+379tAwBUmk1YOZ+l/Meh9Z/QkCMIx48JMTBtEY80T8E9Jtwo5P3X1GN9JHGCBHNrEeGbzqYDew8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751297811; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=FOdigrsQQpd9WEDOm3Dn2iOG8VrxDhh0NLeJNZe4Nnc=; 
	b=oJMTHy6RS+SNua2Oey07DPgnVQqj4kf5CLeMUyC4+aK+CRTFv7Zhb1iFKCj0+Phi+w3Qs2MjtLiFNboxCm6WTD/4VLpMdXH4fFaX/be4QAY008W5XXpzvvTuGAHSCpoNgt4CismBq+pERyf4vznU1CD5tVtObuu8VXM0Uw+3o8k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751297811;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=FOdigrsQQpd9WEDOm3Dn2iOG8VrxDhh0NLeJNZe4Nnc=;
	b=lHu1l7KwuXmeDwZ2n6b+4WYUWxphCYFKunVzmOTwVc+4A3K6fky4lln7962lzB57
	n9W8aY+0D2BwckIBtvr+sgDQ4brFosfJR6DARiRvAck6vTACN32VP/eQFXi82CBbhkQ
	QbiWHBkj8ReGiaTTE+WvuAkS3+gN+M0Xa1wFLTLI=
Received: by mx.zohomail.com with SMTPS id 1751297810110842.1922689401597;
	Mon, 30 Jun 2025 08:36:50 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 30 Jun 2025 17:36:35 +0200
Subject: [PATCH 3/3] arm64: dts: rockchip: theoretically enable Wi-Fi on
 ROCK 4D
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-rock4d-reg-usb-wifi-v1-3-1057f412d98c@collabora.com>
References: <20250630-rock4d-reg-usb-wifi-v1-0-1057f412d98c@collabora.com>
In-Reply-To: <20250630-rock4d-reg-usb-wifi-v1-0-1057f412d98c@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_083704_285431_96F57DC9 
X-CRM114-Status: GOOD (  10.97  )
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

The production version of the ROCK 4D appears to sport a AICSEMI
AIC8800D80 USB Wi-Fi + BT chipset. This chip does not yet have a
mainline driver.

Add the necessary rfkill node and wifi regulator node to at least make
it show up in lsusb output. The regulator is set as always-on, as like 2
hours deep into debugging why onboard_usb_dev.c wouldn't try enabling
the regulator the device needs to actually show up and thus bind to
onboard_usb_dev.c, I decided that it's not worth the effort.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts | 30 +++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
index ed8b018539acb77328627c24b88a5a220fe085d2..291b6e4ffdac86280280de49c30de7ddde80462b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
@@ -37,6 +37,14 @@ hdmi_con_in: endpoint {
 		};
 	};
 
+	rfkill {
+		compatible = "rfkill-gpio";
+		pinctrl-names = "default";
+		pinctrl-0 = <&wifi_en_h>;
+		radio-type = "wlan";
+		shutdown-gpios = <&gpio2 RK_PD1 GPIO_ACTIVE_HIGH>;
+	};
+
 	leds: leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
@@ -159,6 +167,19 @@ vcc_3v3_ufs_s0: regulator-vcc-ufs-s0 {
 		vin-supply = <&vcc_5v0_sys>;
 	};
 
+	vcc_3v3_wifi: regulator-vcc-3v3-wifi {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio2 RK_PC7 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb_wifi_pwr>;
+		regulator-always-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-name = "vcc_3v3_wifi";
+		vin-supply = <&vcc_3v3_s3>;
+	};
+
 	vcc_5v0_device: regulator-vcc-5v0-device {
 		compatible = "regulator-fixed";
 		regulator-always-on;
@@ -703,6 +724,15 @@ usb_otg_pwren: usb-otg-pwren {
 
 		};
 	};
+
+	wifi {
+		usb_wifi_pwr: usb-wifi-pwr {
+			rockchip,pins = <2 RK_PC7 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+		wifi_en_h: wifi-en-h {
+			rockchip,pins = <2 RK_PD1 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+	};
 };
 
 &sdmmc {

-- 
2.50.0


