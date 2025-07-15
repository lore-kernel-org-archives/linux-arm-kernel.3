Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E37C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 19:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pldi7JVw2aEIgElZ31BLSbydsDKsk3LLrjeHsOvc8cM=; b=URo6ix4T3I9BwBU6GICbCLsB6F
	+P5RmwkY5hH6JqNjNukOAuxj+rsd7zBdg8OBl8R8/R48YXd2hzcZ+R0PXrWS57pdgpd9aAfQZP0TP
	YS+i2Wpd/pJeEFMyHOJVGIv8xhBKLOy8rDO2a8Gb27H0+Fk4WZloHVUi650p7KdYsDO64glMBdtj9
	5QZS+9KzQXA2YxV1FxRG/ECcWdXhFsXFnNlw306fXgFc6UfJ+QtmdzKyRfE/CL015Kl61u2JliSqb
	g9FJo/7wTFHLDgvTIvrQtRQAuEdTep8CBR8a1bOWGKJwn8M58azXsCVRm28SBK7qlGJLSJvxepo+Y
	ov8POx6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ublCL-000000062nw-1Mta;
	Tue, 15 Jul 2025 19:20:17 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubkPp-00000005u9b-22dq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 18:30:10 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ae0ccfd5ca5so818702266b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 11:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752604208; x=1753209008; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pldi7JVw2aEIgElZ31BLSbydsDKsk3LLrjeHsOvc8cM=;
        b=gES2vo0HatZuIOwrvlQfTKUfUj7BAakiCJgcrT500HCQMV8HK+5VZKgkjvLdRw4fh7
         7X28bbfKcVKjsCwo6f52w0JSfyFn2oaobeB0iw4AHtgsEilmxitbGNLAjwBesOoaok2G
         80JAoDPjAnzueeEN4u5oErgpFQyP06ajwDL0SdA3wfTioufvCVAgnCG70pBtYPWcnmyd
         DylRhhBPkLd5MNnoBWe1cXL8KfbwetAt2zVmy1acfJqE0SWvAZOl82tj6tlAFpAMI9uk
         4a/HFasSWp0lzdWSLCAn141EkrMjY89VCCsefX2MRaomsYOubwoiohnfqZBFj6PjaPd1
         +lIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752604208; x=1753209008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pldi7JVw2aEIgElZ31BLSbydsDKsk3LLrjeHsOvc8cM=;
        b=u2K5S5l2hBnzltZH9IKkufskFWBpxWwz0yf4tbDWYjS9/s/jy6/QVhSLZBv6meBZWm
         GnnwiVkJl9GXEZ3MDOkvuq6NWjqQCbJI+r6b7wVjAEo5P5fRip/CACuwjn88oMs8Qyk7
         Oz5UFWIWAq+6R0YuZYAm2ej2ZKTNcof5IkTZDpA42ohcvz4HlwJaDKXzdxibN2q59PjC
         +9U03zsKc7WE0oGdx6VhV7xOd0ToAaFjElAUpkjCZczaO51YgHRAFodvAaeZuZjuvXlZ
         oHJS9V2ywmz9R73np/hIO2z7kKu2jumjbiwnos3d4XLx64sKQDTWe/Aqtw+7NaHOAzGO
         UdoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYS0VfHpy9CckBdjbVIrOcsQRLrWkZrOTEKLFwwqtH2b9bzuMjR4pp9YKrSQ5jEleCfqTvpHLtE3aZYpiMpJzq@lists.infradead.org
X-Gm-Message-State: AOJu0YwhSu3WzTSNckQcsUjzU0KZqaswXwMkCSeyCF5aFXnSSFeVaY1o
	9uvxMtuqMuZkFrtr3xQU0xjStkm8T5Su1ccewLTsGZq1dRasmsPRv4nEjnIhlDbWaHo=
X-Gm-Gg: ASbGncsh0z3OvXjyJUAAg61wTg3isFrWm4DJeIr2tae+7aH8GgYGfutaecoq7u6mfmr
	6q3TKwacgMD5e23wl+Bc4T1ofk9lpX1gZt/Isg1g2PD+4+poMleR3pZUTAoxmZJ9kivXLUk9z/b
	QP/TTayFW+nBWLxPBTCko1OdcX0ZjeRKAROZIYJmazygRrZwoyDf0aiadDrzzA0oZ5Yp/e6+s87
	k3mcIH4L9fpQ3K31CAiwuRePeMAKU2hIbr7s7kjgjDzgCdmNG7cDqlxTIBwLTvXXsZkMu+9O+Il
	Iloo4O9S1QdnCoA4G6hiGdT2kWxN6mkeR6TmnzTHsGN8GczIlOh8mtLuz6GkqJUgJAstosWYxkL
	SiBaYG2rb204y2o125iRHdMTbtsRdOkM5jPxgAard9AySIJPzDdGRXGUkkiSf0Wv1Ev68
X-Google-Smtp-Source: AGHT+IGwUYqsRHmstWDhORzwnIbfYu8/EL/YZzSOmEaELMDVJJ2PSbd1BP9+YofZivfAxklhwn5W3w==
X-Received: by 2002:a17:907:9487:b0:ade:4121:8d3d with SMTP id a640c23a62f3a-ae9c9967a03mr50070366b.12.1752604207855;
        Tue, 15 Jul 2025 11:30:07 -0700 (PDT)
Received: from localhost (host-79-47-155-191.retail.telecomitalia.it. [79.47.155.191])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df594sm1041872466b.159.2025.07.15.11.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 11:30:07 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org
Cc: conor+dt@kernel.org,
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
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH 4/7] arm64: dts: broadcom: bcm2712: Add one more GPIO node
Date: Tue, 15 Jul 2025 20:31:41 +0200
Message-ID: <f39560d1954120a5530c6b9dca0d6727a8872bd1.1752584387.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1752584387.git.andrea.porta@suse.com>
References: <cover.1752584387.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_113009_527653_623FDE6C 
X-CRM114-Status: GOOD (  11.81  )
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
This patch is based on linux-next/master

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


