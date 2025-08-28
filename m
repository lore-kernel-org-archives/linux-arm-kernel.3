Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D37CFC8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 17:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AuvwZFkQA9C7qsU3a5Mf07+vt99ZB7O1MdQDYloQZeU=; b=Mpvs9uXbyEP3yqyD3Sq64afMRK
	IP3Ciy8UeYjufnKCOCEVO72n7ajy/RP1oG5941SALhvAgEwUZRjrazkPzHy3EsyUA2i2xR8/cPb2n
	Nfi03SWDvN01tTthHPixkXFxQ890f2Fofj2Deti1v2GO2Jv25hy4I0JxKQCGKLTs4aJGJ8vFqsS4b
	RqJ9qX4wF6S02FqnOKu9+k36es3qCo9o+vhVHFiURjaT79cC5+l8xLVGGAN1Ev10hoaynfu8akOvP
	owtawdcYT1+DCCDdIG8PUWVfGUMgx1QOTQfKKhklSK3HSFQYckBTteNoEdxSzzrcp3I4NeQNsdEh6
	vBkjbrgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgOL-00000002TLp-1hjX;
	Thu, 28 Aug 2025 17:26:29 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urcTR-00000001hKk-2QHJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 13:15:30 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-afe84202bc2so127140666b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 06:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756386928; x=1756991728; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AuvwZFkQA9C7qsU3a5Mf07+vt99ZB7O1MdQDYloQZeU=;
        b=XD3gKHJXY74zNcfC6g27b545NHAZoVbdRzH9EWsIN107LLbM9ebYPnYWI3ZhEoiNEE
         nIrVc7FF8SBrBO0r7yLPVXN69w+Fte/7Wlu8A5eB3xy1vnNjj0L75YzV7HZkbfu1ReZK
         0Urd4CZhKi3ZDK4gpNbDthabOSOKG3Amw9r9BtizLltURbOLkcat6cKKlo2bovri43tg
         9sUmXG60nHd9Zuhao4wDJLpaVoM6Ctn1nYJC8khXgZ5u6oClcx3jLQ5FE10svhQhnJyP
         6DnLJIb/t8YLMpGzWhaIgriBr99ASr+exw1564GrtpQYmTGpaA5Iu9IEGHExHnyhkaSL
         OEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756386928; x=1756991728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AuvwZFkQA9C7qsU3a5Mf07+vt99ZB7O1MdQDYloQZeU=;
        b=DOp4aTxcDsBQwul6w9TFYOUwMBYsF5sUW8f4crA7v4g98uWI1iIxJ72HjQxJOR4NL6
         17AWQObKo0PPsjHK4pYYiGHYF7cIFxj5/FLl6eRhHHTeRWs/7D7FE5V7Hv0t93jVlpNB
         OZgoUnqsnbHC4HhNfEGOV2voEDHXPa0UeFpKvq90Sd5t5093MH8QFB4ACau7/01yGjSw
         Ge1RgfXsdSKTbW1WuW9ywjQZZahaRdu2lnUFizSzimSWc3rs6B42e6Z5eHVD6a0BFuHR
         ZBHHs1j8/z1t36O+9AflXbYM0cxpDLTv7A0e4jTbkonIQc3ey29AIhhCqyB59xYuynoE
         mFTg==
X-Forwarded-Encrypted: i=1; AJvYcCXiphYmhXfsYarKkR5f2mXPZioWAZmmnpUveCQPkUYkhstXK+2zJ6EDb4mLmK+cBFE8TiYawK3deAbbWxPNFC/X@lists.infradead.org
X-Gm-Message-State: AOJu0Yxqe7f49UmCxQfQ5SK32SwkOERiLx1vMqh9cngnB/b8Hr3yUaOd
	uG02efERkTcFHiTmI/8lOF06mtxPnVXlH+6PWzHM9qvBvFjsM0wsE98eVmwpHpbczCQ=
X-Gm-Gg: ASbGncsNJUnWMFZlckgNvGPPra57kT1i4iRTd3Eue2NgTNjwhy2NhZUKIui+l1evwG7
	b9gxGcvGmfDSZHpwBfNybJYXftx+VMjv2PW4ei9/Ibu/kpAkmRSl451A+b6hOgjj5gtl4o+wTz8
	9kF4HC37Xbv2VOYNEzc4u5WrgXOBXXy1PNXFCKd8LGjXNoaj4uSn+tHLB1jbl9+rV3mBeelVt0L
	38dhHjFgt8O2NWYuqvLIM4cpwpvFCVOjt8EzWhzryp3FSQB2IxBwsUkRLZ9TBjfiIzByO5+gNu4
	Y+61dqAf77IuX0JKVTlIoO3wPvawpfak+c8ADAPtUVDdu0dCvbXlA2GRki2ATMXajJKcmexAbeh
	59dLRdIKT4+Rd7hboupcD6l8yKgKgQxy2rk/+FnHAdTfYunxzccR2q/Gk0xUzIUGzQ0e8AGEs/z
	CF74ZHf54S/LhkvRR5aRZsoRSQ7iY=
X-Google-Smtp-Source: AGHT+IGSKrLVAbeLo7wxrnx0s+JZT41mA3nP6tlZKBKQmBHaVFPv7RQF2CH2aqOCAJNVh+pwQ/4NwA==
X-Received: by 2002:a17:907:7e8a:b0:afe:c459:e663 with SMTP id a640c23a62f3a-afec459f209mr508631966b.21.1756386928087;
        Thu, 28 Aug 2025 06:15:28 -0700 (PDT)
Received: from localhost (host-79-36-0-44.retail.telecomitalia.it. [79.36.0.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe7e3f63e9sm885782266b.98.2025.08.28.06.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 06:15:27 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com,
	wahrenst@gmx.net,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	iivanov@suse.de,
	svarbanov@suse.de,
	mbrugger@suse.com,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Al Cooper <alcooperx@gmail.com>,
	linux-mmc@vger.kernel.org,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-serial@vger.kernel.org
Cc: Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v2 3/5] arm64: dts: broadcom: bcm2712: Add one more GPIO node
Date: Thu, 28 Aug 2025 15:17:12 +0200
Message-ID: <6d311b2f629bbc0e1dd9821e4aa8e5af9f8e5362.1756386531.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1756386531.git.andrea.porta@suse.com>
References: <cover.1756386531.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_061529_632034_65E0844F 
X-CRM114-Status: GOOD (  11.80  )
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

From: "Ivan T. Ivanov" <iivanov@suse.de>

Add GPIO and related interrupt controller nodes and wire one
of the lines to power button.

Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 .../dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts  | 21 +++++++++++++++++++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi     | 12 +++++++++++
 2 files changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
index 6091a1ff365c..f0883c903527 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
@@ -2,6 +2,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 #include "bcm2712.dtsi"
 
 / {
@@ -29,6 +30,20 @@ memory@0 {
 		reg = <0 0 0 0x28000000>;
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pwr_button_default>;
+		status = "okay";
+
+		power_button: power-button {
+			label = "pwr_button";
+			linux,code = <KEY_POWER>;
+			gpios = <&gio 20 GPIO_ACTIVE_LOW>;
+			debounce-interval = <50>;
+		};
+	};
+
 	sd_io_1v8_reg: sd-io-1v8-reg {
 		compatible = "regulator-gpio";
 		regulator-name = "vdd-sd-io";
@@ -58,6 +73,12 @@ emmc_sd_default: emmc-sd-default-state {
 		pins = "emmc_cmd", "emmc_dat0", "emmc_dat1", "emmc_dat2", "emmc_dat3";
 		bias-pull-up;
 	};
+
+	pwr_button_default: pwr-button-default-state {
+		function = "gpio";
+		pins = "gpio20";
+		bias-pull-up;
+	};
 };
 
 &pinctrl_aon {
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 8a517261841d..f70ec8d3dc4d 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -248,6 +248,18 @@ pinctrl: pinctrl@7d504100 {
 			reg = <0x7d504100 0x30>;
 		};
 
+		gio: gpio@7d508500 {
+			compatible = "brcm,bcm7445-gpio", "brcm,brcmstb-gpio";
+			reg = <0x7d508500 0x40>;
+			interrupt-parent = <&main_irq>;
+			interrupts = <0>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			brcm,gpio-bank-widths = <32 22>;
+		};
+
 		pinctrl_aon: pinctrl@7d510700 {
 			compatible = "brcm,bcm2712c0-aon-pinctrl";
 			reg = <0x7d510700 0x20>;
-- 
2.35.3


