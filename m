Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A673C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 14:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=um6+orYZmvWyjIKPMULKaYcq3cJ+8tX54fBBdRjWSS4=; b=s9reqEp6EScRv9FSXKF8XGxEgK
	ZqV7h4rC4dh9MoTmKCtmYEw/AZjUtkFi2YAEV8lOrf9v/oF3A2RuGIqll+e1J3L0/wlaY+J947Syg
	iM4qfEWDG2ukbgbGpGDY+QTOyd0oxDpk2GQEKJffkFmVrEvZmDPvujSH9A1mNW6U/JWSD+4O/bUh7
	ztzaM/nQOPIQX9EgRDDTKIr2t6bleRfhbpHCZfc8Jzn6WjtJScQ8Dmt2fwfZLjJ+d0RmZ170O9er3
	qJSk5hBT/eOC7lLbrbO62zZVrUUcxpA1hI9LtTx4lLZHPGVCXKt40QR5kf8xLgfmY8OJlTHITOpgD
	kvN0A4lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOzb0-000000074n7-0llZ;
	Tue, 10 Jun 2025 14:04:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyAc-00000006mOp-1Zpz;
	Tue, 10 Jun 2025 12:33:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=um6+orYZmvWyjIKPMULKaYcq3cJ+8tX54fBBdRjWSS4=; b=gilswRIUkhGUAKwicoKlxJsUqD
	RvJ4oK8s2H/EU1zb8wo9DE5oFvKvJ3oGFC+Z+esc3B/rN4rn7zq7Fav8WV/4/4oiFeg5nTmKayKEe
	AmdhzMDAb+PcK1QXhSj0PLNvhUoxlO7FBfJE6tklERJpkDUKbdIlKmoI131iVQXFCDlqY2sk/cHq7
	wTcLEyjzwQ0vYqz1+io9N9C/vNkkWxJ93A3bO7QNZ27uAkAZp4UzvZx31UB+xYLj6KNGs69eE3wRf
	TkRID7YqXVP0g/b588gPosUJGMNck4SlpLnTlms8pacR8RSoTUHa5ruFTKKOCXbHkdxl3BwrBBjBb
	sxhkeCIg==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyAZ-00000001oZv-40Gg;
	Tue, 10 Jun 2025 12:33:37 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1749558800; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KbETfOGiZH37xLuUpi6vn8QuiB/V4pokvPC0Ot+3pQky05cYm3c8lXBexPKI/5EJZfSSaaB87zOMY+Y2VYo3EGdHSHXJJILp6RZZle9Im3mkyzCsnxMUH6ZQT5DU9mEbN2dmj89fIfNud7gfDNGD25Rxsay3jfPbBpzwJZjBKag=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749558800; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=um6+orYZmvWyjIKPMULKaYcq3cJ+8tX54fBBdRjWSS4=; 
	b=WaisFqSs5i/OiwKTdC0UVe5P3Uwu29gpu+iQy42U9l6WmR6XXRiaWE4kpfdslPZN61ArPZxQQXcMvPsSl0UizXUKxcmsRdoE3E2O2vOtPFea1uMjFVAghVXT2gd9RiFxmfEWRaCrT6uOt5CZNVCNq4eWCAeSVGWmNYvonAnxZQ0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749558799;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=um6+orYZmvWyjIKPMULKaYcq3cJ+8tX54fBBdRjWSS4=;
	b=W0/9qBAL+3hppBxV14yeK/+YXV9ZLHBdKRb1IcsGBA7q/OdEWF51zA3ektCeiYGJ
	A7KcbEuelECBy6fus3Q64ZJVF0Rmrfa+Lu6PsO43vd+494aTq7xnAPVNEpSFF3sVR8U
	Qsa68HZvAeWbF9+JwfzSeRqkZxOR1A57QLNkBOT0=
Received: by mx.zohomail.com with SMTPS id 1749558797642874.6088758885295;
	Tue, 10 Jun 2025 05:33:17 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 10 Jun 2025 14:32:43 +0200
Subject: [PATCH v6 7/7] arm64: dts: rockchip: Add thermal trim OTP and
 tsadc nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-rk3576-tsadc-upstream-v6-7-b6e9efbf1015@collabora.com>
References: <20250610-rk3576-tsadc-upstream-v6-0-b6e9efbf1015@collabora.com>
In-Reply-To: <20250610-rk3576-tsadc-upstream-v6-0-b6e9efbf1015@collabora.com>
To: Alexey Charkov <alchark@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Jonas Karlman <jonas@kwiboo.se>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 kernel@collabora.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_133336_411197_FF7F488B 
X-CRM114-Status: GOOD (  10.49  )
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

Thanks to Heiko's work getting OTP working on the RK3576, we can specify
the thermal sensor trim values which are stored there now, and with my
driver addition to rockchip_thermal, we can make use of these.

Add them to the devicetree for the SoC.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 57 ++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index dbc527ec60cfac0bbdb881a27d3ff765366be99e..c388fbb510ade0f06e64c1025dcfa59b8187bc97 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1919,6 +1919,30 @@ gpu_leakage: gpu-leakage@21 {
 			log_leakage: log-leakage@22 {
 				reg = <0x22 0x1>;
 			};
+			bigcore_tsadc_trim: bigcore-tsadc-trim@24 {
+				reg = <0x24 0x2>;
+				bits = <0 10>;
+			};
+			litcore_tsadc_trim: litcore-tsadc-trim@26 {
+				reg = <0x26 0x2>;
+				bits = <0 10>;
+			};
+			ddr_tsadc_trim: ddr-tsadc-trim@28 {
+				reg = <0x28 0x2>;
+				bits = <0 10>;
+			};
+			npu_tsadc_trim: npu-tsadc-trim@2a {
+				reg = <0x2a 0x2>;
+				bits = <0 10>;
+			};
+			gpu_tsadc_trim: gpu-tsadc-trim@2c {
+				reg = <0x2c 0x2>;
+				bits = <0 10>;
+			};
+			soc_tsadc_trim: soc-tsadc-trim@64 {
+				reg = <0x64 0x2>;
+				bits = <0 10>;
+			};
 		};
 
 		sai0: sai@2a600000 {
@@ -2443,6 +2467,39 @@ tsadc: tsadc@2ae70000 {
 			rockchip,hw-tshut-temp = <120000>;
 			rockchip,hw-tshut-mode = <0>; /* tshut mode 0:CRU 1:GPIO */
 			rockchip,hw-tshut-polarity = <0>; /* tshut polarity 0:LOW 1:HIGH */
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			sensor@0 {
+				reg = <0>;
+				nvmem-cells = <&soc_tsadc_trim>;
+				nvmem-cell-names = "trim";
+			};
+			sensor@1 {
+				reg = <1>;
+				nvmem-cells = <&bigcore_tsadc_trim>;
+				nvmem-cell-names = "trim";
+			};
+			sensor@2 {
+				reg = <2>;
+				nvmem-cells = <&litcore_tsadc_trim>;
+				nvmem-cell-names = "trim";
+			};
+			sensor@3 {
+				reg = <3>;
+				nvmem-cells = <&ddr_tsadc_trim>;
+				nvmem-cell-names = "trim";
+			};
+			sensor@4 {
+				reg = <4>;
+				nvmem-cells = <&npu_tsadc_trim>;
+				nvmem-cell-names = "trim";
+			};
+			sensor@5 {
+				reg = <5>;
+				nvmem-cells = <&gpu_tsadc_trim>;
+				nvmem-cell-names = "trim";
+			};
 		};
 
 		i2c9: i2c@2ae80000 {

-- 
2.49.0


