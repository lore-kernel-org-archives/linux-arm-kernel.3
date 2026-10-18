Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46EC6CCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 06:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tCpwVytRBHG001ylJlx6CLpltdlyxsoct+VeDjqc/64=; b=eHwMm4bTh1Ksd1yIro7fHplvx9
	X+1uNIprhOyO2HoGJFihY7DTHkHHwJoKoxVhU5oBoOwPDD8WPepI9omjENj6xN/9eVQc2f51bkUB2
	4D27/SmdTey3wcBIxWMUiD2R1ysl1L73PjFION6BvHXOc+ckxqUn0Tlvpl5IU+/2XXoeGrpfNJOIK
	t8JRnZTva8QHX4Q0AFLU3fH+AoHyTooZr/6VW+nc4MBl2AUl+BdtvCkIYK1Y4u+l1685AFZk2vFT9
	FE9syG6sYIaBaOf6+oUN8FKzkp0eUPu8jUv6q1GxZ8ZQ9GOaDxc9M7f3R+lMEZwq8WBu5aDTg9FpD
	UT6DTqOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIKV8-00000005cy7-2k2p;
	Sun, 18 Oct 2026 06:36:10 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIKV4-00000005cwY-3OrO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 06:36:07 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-8a058315c79so231135b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 23:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792305366; x=1792910166; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tCpwVytRBHG001ylJlx6CLpltdlyxsoct+VeDjqc/64=;
        b=S6sgD6MvJdSCNbi/dA0fSqyzPZH1rsV7mIm4DbNIbrUazItjyp7hgh9gUx+Gd46Y/R
         ECfoZAkbgCNJgDf089Me/1G7CWBJn3zQVBGCy8AGrEEsyurgE2J7o20V7cslpBoQlWTz
         STSuHhbEZKVyK1dKL8C1/dEJvJuYQkpk2CAlEGuvpR42pyKEvdBLmmb4icEAjI95EMuZ
         t4CksuYzdpIzjCqIik3lxn/HTfAt4hc15qUJ7wKr/WKihZEWCxWdv8WiBjQ0VaL668f3
         YFrv/GaeFWIhz8cdlPo9MUsi9Mdy/kw3Q3v0yCNsnPRu2mHRsvMXSxLEVlV2ixCpaoLj
         Kkmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792305366; x=1792910166;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tCpwVytRBHG001ylJlx6CLpltdlyxsoct+VeDjqc/64=;
        b=IikpU95mQc6nUCbxuDmuDxko2/bwVtSDwOuSq7KlF275J3QXFCn1aG5cZcdBHBjf8d
         t+MFLp2ea4sdrQFv5azzXKAYDFdXWyaUHquRzUukfeUDPpbK839FmRZVJTHf3HUnB+JE
         twOB8aE8o8vkHPXsswV1arpllEXhoOdXCEDwEnUdC2U2VLAD8kDVKOMJ8RtcZGBvuRGN
         z6/deCLmXustbUsGEzlpN/m6F6xryW8224yzcMYVCRmzS6srOGseXDocFqTqGDnUlRHL
         vPqb1/Cv3Hc4+RZOqa85b8rkGLheGjJzue/4eM2kWrFeLW/CFLmFh7bG+mFzmMYSHJaj
         D9/w==
X-Forwarded-Encrypted: i=1; AKwUvBxy92pr/dYc+5zHmfunA+r+jEIBVOolR/XuDgKM6Wj+MeV36gt7oKnAUtmbjKxtDZLXjwD8KCcudbA5nnV6xvVz@lists.infradead.org
X-Gm-Message-State: AFq9FYJjfzAIo6QJv2swLpSVIqdYolvpmVUFwhqv7tCx7QTjdaCgvGr1
	RzwRw78VabPr1HsbrkVk60E0tkqi6E8RawuFLE1xZC7AVkOC+o35UQt4
X-Gm-Gg: AYBFou3Nprtra2lKJlgd5pi09e5gOr6wkZsgBoogi0h2L+RIVC3d8dsYl0Pu8DB6w6r
	ZlDtymmzQ+uvTkWgPtseiLQaoveSySWTmR0X/3Yg0DslhnEnBz6+TVplzjvN18zvh0U5v0cONTZ
	9rARpay765eEnkyr1gzVXEUolf/5ANRkBa08OuIM3d8K+jA/mka/rd2m+HyMNkw7Qg9D9rljFHR
	Z8v9TBSkw2PpO97NnT+BVYlHYCNkYWbj9ZCNwDBe4RKqdkT5f8fdxo15abkx1jEDUtGOZVmYmEf
	gF/JeA6KfexRJK+eTkpYv849vm7i7O/QbwuS+2NKh/DoTSfKgqm+ZMK7Qo1uX3/OXTUiIgjtY+0
	iz05xlFzQk4Rk2vb0WY2P3GtxpIEUr9wYX0RuM0Suw7LjlRBZmqGGfR3i0OH/09BWsHcNK8l3sc
	AqV33UNQVlgs9x+Kb995JxY6RMg/RAGcXYQ8CuwtEdNwZCTmPr/0EHFLZSk5mgWGNfHcfLwRT06
	r9oGeoy/YZbKFhljg==
X-Received: by 2002:a05:6a00:13a0:b0:89e:ad95:e01 with SMTP id d2e1a72fcca58-8a04be6af1emr3279470b3a.46.1792305365889;
        Sat, 17 Oct 2026 23:36:05 -0700 (PDT)
Received: from [127.0.1.1] (2403-580b-35b2-8--43b.ip6.aussiebb.net. [2403:580b:35b2:8::43b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57653ea9sm2718874b3a.32.2026.10.17.23.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 23:36:05 -0700 (PDT)
From: Kel Modderman <kelvmod@gmail.com>
Date: Sun, 18 Oct 2026 16:35:30 +1000
Subject: [PATCH 1/2] arm64: dts: rockchip: Move SD card regulator to Orange
 Pi 5/5B
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-opi5pro-amp-v1-1-05c84e91bf6d@gmail.com>
References: <20261018-opi5pro-amp-v1-0-05c84e91bf6d@gmail.com>
In-Reply-To: <20261018-opi5pro-amp-v1-0-05c84e91bf6d@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Dennis Gilmore <dennis@ausil.us>, Alexey Charkov <alchark@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Kel Modderman <kelvmod@gmail.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_233606_860560_9104F590 
X-CRM114-Status: GOOD (  12.48  )
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

vcc_3v3_sd_s0 switches SD card power via GPIO4_B5 on the Orange Pi 5 and
5B, but the shared rk3588s-orangepi-5.dtsi is also included by the
Orange Pi 5 Pro. On the Pro, SD power is not switched and GPIO4_B5
enables the headphone amplifier instead, so the inherited regulator
claims that pin.

Move the regulator and the sdmmc vmmc-supply into
rk3588s-orangepi-5-5b.dtsi, which only the 5 and 5B include.

Fixes: f47af8ebbe53 ("arm64: dts: rockchip: Add Orange Pi 5 Pro board support")
Signed-off-by: Kel Modderman <kelvmod@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi | 14 ++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi    | 11 -----------
 2 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
index 6e081bc06c..13351e4130 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
@@ -67,6 +67,16 @@ vbus_typec: regulator-vbus-typec {
 		regulator-max-microvolt = <5000000>;
 		vin-supply = <&vcc5v0_sys>;
 	};
+
+	vcc_3v3_sd_s0: regulator-vcc-3v3-sd-s0 {
+		compatible = "regulator-fixed";
+		gpios = <&gpio4 RK_PB5 GPIO_ACTIVE_LOW>;
+		regulator-name = "vcc_3v3_sd_s0";
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc_3v3_s3>;
+	};
 };
 
 &gmac1 {
@@ -218,6 +228,10 @@ regulator-state-mem {
 };
 
 
+&sdmmc {
+	vmmc-supply = <&vcc_3v3_sd_s0>;
+};
+
 &usb_host0_xhci {
 	dr_mode = "otg";
 	usb-role-switch;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
index fd0efa8d1b..615e914fdc 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
@@ -39,16 +39,6 @@ hdmi0_con_in: endpoint {
 		};
 	};
 
-	vcc_3v3_sd_s0: regulator-vcc-3v3-sd-s0 {
-		compatible = "regulator-fixed";
-		gpios = <&gpio4 RK_PB5 GPIO_ACTIVE_LOW>;
-		regulator-name = "vcc_3v3_sd_s0";
-		regulator-boot-on;
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		vin-supply = <&vcc_3v3_s3>;
-	};
-
 	vcc5v0_sys: regulator-vcc5v0-sys {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc5v0_sys";
@@ -297,7 +287,6 @@ &sdmmc {
 	no-mmc;
 	no-sdio;
 	sd-uhs-sdr104;
-	vmmc-supply = <&vcc_3v3_sd_s0>;
 	vqmmc-supply = <&vccio_sd_s0>;
 	status = "okay";
 };

-- 
2.55.0


