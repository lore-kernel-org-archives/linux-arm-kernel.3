Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B11B9C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 19:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BpXcnovWinsYVCqQ5oTKECuPZPlUX4I8oy6VDRcWxpc=; b=XtlR3gldmapRPBV0aJIZ3eOdLY
	cz/NExR5e52VSGNz+gbXnCZHOWCoro9fGss2IM0sDzYl/IccCFhELyGr5UubFrYwdjHqFgbomgvmw
	sJfHGbVIq1WkeS2LsZFcrKg9O9ibB/dZiYKnbVKOWh1iaKhFhNYeowAXM4l88f6PXuvil7xZujdv9
	jnrr80Yrln5j5347nztm7ajyJynLF5ikjuilxfKE36KFekCI6x/I8w4Z/PCghUCubTBmX6sOCg4RN
	1lpnCN7OfOqShEdm8AAnokBJnDJzGShFh3Arl0BSlQw996SskOSP4curhkpjhlkmmWQgBzRdhRghS
	bYaxLp2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8PBe-00000000jxZ-2Qgc;
	Fri, 25 Apr 2025 19:58:14 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8P2O-00000000i8f-41qZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 19:48:42 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-391324ef4a0so137099f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 12:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745610519; x=1746215319; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BpXcnovWinsYVCqQ5oTKECuPZPlUX4I8oy6VDRcWxpc=;
        b=Yq5XVy208WfgtH5cTR0A1HwvrET0bf+2amtMoI8eszk6rUEumIxTM3jR0k+LL+RDos
         Ojv+4NLasrKhtsk+2YZ7glMBt+XY9aa/tgU/WSY4L4a7j9lZpmkEHnGE5Q6rqIBaaw+l
         fu+d8mFwI29azZ0Lx9/NE3JHgcaWH+Q5ibVYCPjQBwHKM0/1UZny/lWr4A16FF5vsa1x
         WwWKHyjkhdKAUlur+o0o7xyWnjul0i1L3FkWQWuo8rIiq5opDZyJbANARcsVJMgWzvaS
         c0XuKdViw0raFZUt3RGyEhp3CCJSEFVZSpN8w41d4nRsuQwHaJo9dw+8W7i+PpXBnfod
         aKMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745610519; x=1746215319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BpXcnovWinsYVCqQ5oTKECuPZPlUX4I8oy6VDRcWxpc=;
        b=vXri7dcDHNvCibsCuDY/t+XAeZD5kNP2LvzGgcRiFO47ASTdqaZObYqUyTFMn32o2K
         q5CYcj7J/yopOljt4ZDVHdV/kwZTiQ9bTS1s9HZQVnnJc0gr9/TMYVRlsJFsWDytqnRV
         Ykd3h5BLRDhfQ5R3mLh6VQlsU/b8+wyDiVP8HEnVvvnZ6aqXgdofBcQlbNeEMZIb0qE3
         4zpCoLIFE07/jaM4QEWaNMP6iHq5/26nSP2scR0cFbKQh/ZCZFlkADZVynPIVp/Hjbit
         oIKAuol3xGf500S5mqDXl0heq05rv1Rbg86EoxUvVNdPrNIYCoHmac4nGyzj5o8siFvM
         oZtw==
X-Forwarded-Encrypted: i=1; AJvYcCU/7ElJy6gQ8AWtDgoQMpU9Rk07MgS7QRK3fo+KcsRSU72XBRsqODG0sWSJ/3q9OpWIBWoyPBYgxEI/fmOvuZ6w@lists.infradead.org
X-Gm-Message-State: AOJu0YyNnX/sNvV+MUJx9m46WM7//czzzeON99NRmQFeIcDeWdCx7yTw
	tvzN2TsLuw6Dp/J96J4amEbhISc/O+dihF5+CYieLbylDo6541QjldXSIkaXVEE=
X-Gm-Gg: ASbGncvNTNLYy0aFX/+GzCsTBr5voJjmbdhxnl64VTjs1xl6WolSrQcsz7ZfEs6iz9M
	SvZMwQC/STwa6ChO6iQvzwqj2kYELINsPOVMabqZmI23hZOK8jzBjzT6v644AqSMQncjNBCuNii
	TNeDIXqNWBBBH8GBzocvF6OS5fTDhhlBYPcV0BuIwjioV739ycO3UY2qDrclqCJ7Reff/yl3n0b
	hIJuNJq8AOXNVU7EI/SGHTGfUqEDoJcl+vZNuu/La7t3RrBKFcSZrZ+LNqvLquzUqZ/4UokQuT6
	CyP3NO87LMl+n6V7swmQeLAWIuAQYPH7zShifz1R7mLfZ/sUmQ0SL1VSlAL3rsa0wSIUFQ==
X-Google-Smtp-Source: AGHT+IHRqZBqJkZjO0mitzu3CzYyV21ZT5Y2akCem/fgDU2yyxukK6COGTfisLBqPKgA6rVkJ2RM+w==
X-Received: by 2002:a05:6000:40e0:b0:39e:cbe0:415f with SMTP id ffacd0b85a97d-3a074f964camr998386f8f.14.1745610519049;
        Fri, 25 Apr 2025 12:48:39 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2a2e59sm65922335e9.16.2025.04.25.12.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 12:48:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 25 Apr 2025 21:48:24 +0200
Subject: [PATCH 1/6] arm64: dts: imx8qxp: Move Ethernet aliases out of SoC
 DTSI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-dts-imx-aliases-ethernet-v1-1-15b9d5cca611@linaro.org>
References: <20250425-dts-imx-aliases-ethernet-v1-0-15b9d5cca611@linaro.org>
In-Reply-To: <20250425-dts-imx-aliases-ethernet-v1-0-15b9d5cca611@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux@ew.tq-group.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4214;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=3nO4VnjQYdiRE93Jm8TiezOlk61htEB38J2trNtm8CM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoC+cO0jxEu7fTSVXD+grEAB5mtaGYKM/NqhPqM
 EY7HpNzfIGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaAvnDgAKCRDBN2bmhouD
 1+NyD/94+FK8H6crh1/uF1W4/NURW5TctzERkargXwjN+yT87P+dz+mKZpeNj4YdgcyvJaHGidh
 qk1xrWfVXQhx8YgDIaBNYlLY9jPlOCQ5XJOAgrex3/AKf7X1ngtmu9XS4+Uis1DtIZrmbeebhZ9
 nohamtR22KSlDG0QZAnUirLsExyg/LMW+UdEbTTn19vxZwBPwcJqy1n9T/81IeOwqDWLN7PLtC3
 /En17nWBJS+Ser5tHo0N5c2D61vOjMhPfJJst5kjCw3sNYWUs/jesgNlX8abfBYjnfQhyrgi6p1
 TKKu/Dec//QMZm+LgCMzYt1Nmh+fF8a55upqDc3UkmGeoJUvDVZFTS3M0e5PpqyP2RFY0110dMt
 zNh4/3GCftFdAB/b/fV18JmjC2wWTA3Bb/1PZu9dKfp3C8+6Qh75cpVOnPXlwWnfS88CYbwsijv
 mF3/eHOH/l8k7gGUq/IKrmN/qxYQp6FhDhpZ2Z2V7YYa2jGHweEIiclbmvutTFTBShJS1ITUX04
 XIyRMKgqysuGU2hil68KyhA+XfoVB9/wrpgPEp4Dkvfjb6wt/4Od1lY80SmUReD/Uy0yOTcJirO
 oyTlSNbOE2XHrNOjSSk7C6dTuc44mgU4i333FMb+QoGSbYjwP8uXDY3UxsgLJ/mcsL4ifnw8+f4
 EGs5oNLoZvuAwyQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_124841_002151_3197EFB6 
X-CRM114-Status: GOOD (  12.54  )
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

Ethernet interface, like other exposed interfaces, aliases depend on
actual board configuration, e.g. its labeling, thus aliases should be
defined per each board or each SoM.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dts          | 1 +
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts            | 4 ++++
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi               | 2 --
 arch/arm64/boot/dts/freescale/imx8x-colibri-aster.dtsi   | 6 ++++++
 arch/arm64/boot/dts/freescale/imx8x-colibri-eval-v3.dtsi | 1 +
 arch/arm64/boot/dts/freescale/imx8x-colibri-iris.dtsi    | 1 +
 arch/arm64/boot/dts/freescale/mba8xx.dtsi                | 2 ++
 7 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dts b/arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dts
index 50bf7919c86305403dc9fe2d75ee312dead03b40..2586cabad31ef61594fbe74247d3868639095320 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dts
@@ -13,6 +13,7 @@ / {
 	compatible = "einfochips,imx8qxp-ai_ml", "fsl,imx8qxp";
 
 	aliases {
+		ethernet0 = &fec1;
 		serial1 = &lpuart1;
 		serial2 = &lpuart2;
 		serial3 = &lpuart3;
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index 4ba8ddd472234704d05db51fb5fb0929e6b15567..b5b14cb20cbef9a67a7661531031fafc702dcbcd 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -12,6 +12,10 @@ / {
 	model = "Freescale i.MX8QXP MEK";
 	compatible = "fsl,imx8qxp-mek", "fsl,imx8qxp";
 
+	aliases {
+		ethernet0 = &fec1;
+	};
+
 	bt_sco_codec: audio-codec-bt {
 		compatible = "linux,bt-sco";
 		#sound-dai-cells = <1>;
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
index 05138326f0a572f45122f5ee425089f945fdc656..6d8386bdac00d150d272b62ad68c136c0da6ba2d 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -20,8 +20,6 @@ / {
 	#size-cells = <2>;
 
 	aliases {
-		ethernet0 = &fec1;
-		ethernet1 = &fec2;
 		gpio0 = &lsio_gpio0;
 		gpio1 = &lsio_gpio1;
 		gpio2 = &lsio_gpio2;
diff --git a/arch/arm64/boot/dts/freescale/imx8x-colibri-aster.dtsi b/arch/arm64/boot/dts/freescale/imx8x-colibri-aster.dtsi
index f7bbb2153ae01a2e97f1e28be0c23f9de4172102..7be0b9ecc8aab1f271c1b658babdb316bae41cc6 100644
--- a/arch/arm64/boot/dts/freescale/imx8x-colibri-aster.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8x-colibri-aster.dtsi
@@ -3,6 +3,12 @@
  * Copyright 2018-2021 Toradex
  */
 
+/ {
+	aliases {
+		ethernet0 = &fec1;
+	};
+};
+
 /* Colibri Analogue Inputs */
 &adc0 {
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx8x-colibri-eval-v3.dtsi b/arch/arm64/boot/dts/freescale/imx8x-colibri-eval-v3.dtsi
index f75499765d85dc78808af9ddadc92e133b0c3499..a7159a842d74306f372db793959cdc8e2555eb3e 100644
--- a/arch/arm64/boot/dts/freescale/imx8x-colibri-eval-v3.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8x-colibri-eval-v3.dtsi
@@ -7,6 +7,7 @@
 
 / {
 	aliases {
+		ethernet0 = &fec1;
 		rtc0 = &rtc_i2c;
 		rtc1 = &rtc;
 	};
diff --git a/arch/arm64/boot/dts/freescale/imx8x-colibri-iris.dtsi b/arch/arm64/boot/dts/freescale/imx8x-colibri-iris.dtsi
index 54393a0c5cbfcd55dae080a9f07879748bbd4486..1e588d76a6ddb1bd7f94f444d72e2819f267c490 100644
--- a/arch/arm64/boot/dts/freescale/imx8x-colibri-iris.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8x-colibri-iris.dtsi
@@ -5,6 +5,7 @@
 
 / {
 	aliases {
+		ethernet0 = &fec1;
 		rtc0 = &rtc_i2c;
 		rtc1 = &rtc;
 	};
diff --git a/arch/arm64/boot/dts/freescale/mba8xx.dtsi b/arch/arm64/boot/dts/freescale/mba8xx.dtsi
index c4b5663949ade617fe9b7be20a3aebf0b322623a..a64ae67ef70cc6a624b06f4ab1f3a8ab03ffd1f6 100644
--- a/arch/arm64/boot/dts/freescale/mba8xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/mba8xx.dtsi
@@ -16,6 +16,8 @@ adc {
 	};
 
 	aliases {
+		ethernet0 = &fec1;
+		ethernet1 = &fec2;
 		rtc0 = &pcf85063;
 		rtc1 = &rtc;
 	};

-- 
2.45.2


