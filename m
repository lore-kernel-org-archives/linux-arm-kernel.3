Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 249F9C83029
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 16:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c1YGdk2ZohmIABV7Pc0xmFdEGzRW5c9+R0A8R/9CkYc=; b=yzl+CxKhnCs+iNYRQE/Nqtj62P
	zcGLwc9+7aB0WD+7z1D95iWE4Gm/3Sa9f1IDG9sydN4tMcVr3VrpD5JLEfptSZLGJXIG2xFgLm0VF
	MVnmc7OgFE1Qhuh2cjNA6c+n0DEskEXhucRjmGzsMuafbXW9h3lZqA142f6QV+4Hamr7fFI3q9LKA
	i6feoQjpSSGuL9MUAplk8IfDS79PeL17mlXWD9GPLvKgXeT47nG19775HG39RdVrRCVv26fCd1oB6
	CXlKIGkC079T4stFymOdHjwd9ErWg/CGY4ZfDLuGdgR09NXLoPqcjs9+WqX6tQIc9ckOoBy2GURXl
	UOHsnHdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWHAg-00000002rfh-016n;
	Mon, 30 Jun 2025 16:15:54 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWGZ5-00000002m0o-1uzG;
	Mon, 30 Jun 2025 15:37:04 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1751297809; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fcmnJxw89CijL3dQAiVqrbC3o+mSiPlb1gYaPODOuAZahrqXh9Q7MJljPbl44c3H/s3kbDYiCDMzkZkdxKrwN7xZPRlE1Yecxe5+RwhFTezM7jcr+9O1u4syuMyDRpjT4aP71sTEJLMyU/uWbpi++7xMfctgSDv6bkYH46z826s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751297809; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=c1YGdk2ZohmIABV7Pc0xmFdEGzRW5c9+R0A8R/9CkYc=; 
	b=BPP1iDvvCXrrHNJkMnE4/qjD5+IbRSfoot+73k/vBhYIHSffcEY6FukWmLMDlXtoOWnLzYiJa59ya9G10YL5Yt0uGfDPV1tzgX0jr9Sgxzr/8VzzcmXr46kNLj0iWXyT91JmTCBPueM829ZjIaJJc4nStXYDDjsUHQ9gtCTucxE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751297809;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=c1YGdk2ZohmIABV7Pc0xmFdEGzRW5c9+R0A8R/9CkYc=;
	b=KqJ9LBf36QU99xqK9haLS0d6mQ8XIfJD3kVIrNtDq+I3TaZvYX6jgdjABgiRdLAh
	5tBfT9rky1ou9xADQ86BCgcetbK+TAAv4c6ND92/45/m26CfeLGb7VckzJFa/HVh/Nd
	+7cIqMrNdv8MA2GH7ez/oa/PvfkVavXz4vPQ+SQw=
Received: by mx.zohomail.com with SMTPS id 1751297807261784.8387235480643;
	Mon, 30 Jun 2025 08:36:47 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 30 Jun 2025 17:36:34 +0200
Subject: [PATCH 2/3] arm64: dts: rockchip: complete USB nodes on ROCK 4D
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-rock4d-reg-usb-wifi-v1-2-1057f412d98c@collabora.com>
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
X-CRM114-CacheID: sfid-20250630_083703_561745_BDF06DFD 
X-CRM114-Status: GOOD (  11.74  )
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

The ROCK 4D uses both USB controllers, and both of which in host mode.
However, it still names one of the supplies for them "OTG" in the
schematic.

Fix the "host" supply's input, and add the "otg" supply. Enable the
remaining USB PHY nodes, and the first controller node as well.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts | 41 +++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
index 352e3df165688219bfedc19734d9eb32c547ec44..ed8b018539acb77328627c24b88a5a220fe085d2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
@@ -180,7 +180,21 @@ vcc_5v0_host: regulator-vcc-5v0-host {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		regulator-name = "vcc5v0_host";
-		vin-supply = <&vcc_5v0_device>;
+		vin-supply = <&vcc_5v0_sys>;
+	};
+
+	vcc_5v0_otg: regulator-vcc-5v0-otg {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio2 RK_PD2 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb_otg_pwren>;
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-name = "vcc5v0_otg";
+		vin-supply = <&vcc_5v0_sys>;
 	};
 
 	vcc_5v0_sys: regulator-vcc-5v0-sys {
@@ -682,7 +696,11 @@ pcie_pwren: pcie-pwren {
 
 	usb {
 		usb_host_pwren: usb-host-pwren {
-			rockchip,pins = <0 RK_PD3 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <0 RK_PD3 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+		usb_otg_pwren: usb-otg-pwren {
+			rockchip,pins = <2 RK_PD2 RK_FUNC_GPIO &pcfg_pull_down>;
+
 		};
 	};
 };
@@ -721,15 +739,34 @@ &u2phy0 {
 	status = "okay";
 };
 
+&u2phy0_otg {
+	phy-supply = <&vcc_5v0_otg>;
+	status = "okay";
+};
+
 &u2phy1 {
 	status = "okay";
 };
 
+&u2phy1_otg {
+	phy-supply = <&vcc_5v0_host>;
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-0 = <&uart0m0_xfer>;
 	status = "okay";
 };
 
+&usbdp_phy {
+	status = "okay";
+};
+
+&usb_drd0_dwc3 {
+	dr_mode = "host";
+	status = "okay";
+};
+
 &usb_drd1_dwc3 {
 	dr_mode = "host";
 	status = "okay";

-- 
2.50.0


