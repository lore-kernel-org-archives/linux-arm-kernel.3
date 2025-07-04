Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D01C6C83F04
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 01:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z7CrtMSRtoJpcPfB9qnSXOsewkw4Z1pqaBofqmAf1qY=; b=iZqzHb+FjHw/Fq5WJfuxQlGAG4
	fXof3Ex0hLwJnERcrJaOce2a+UQZoxfglW6Il3zVGZiyPafQqOgeix6gI+BDUK0f+BvVgb3rzd38c
	cgfzDEF8AyCi4BtpM32Jo2kQH3plBAxOeAdUG61apF7K4WRKOWC/bJ/L9k6OxyODlECfdaM9gpeL1
	OsTXXFWpLzJIGn0yqqIMNVcaV1Yc92hzkCqhVn/+GAF1lnTrv3/JvTdn7fa7ATafPcT6H3h+tXl7k
	S4K0qN4ekGDIZHx81ER8ApZkeDcR54xgho/7gU6I/7LMUvmh47NqdASjPf0BA1w8n9gbcqV19Klwk
	9g9yRiVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXVFT-0000000CzjF-3OSF;
	Fri, 04 Jul 2025 01:29:55 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXV6c-0000000Cyvi-3vaa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 01:20:48 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-7382ffcb373so355561a34.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 18:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751592046; x=1752196846; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z7CrtMSRtoJpcPfB9qnSXOsewkw4Z1pqaBofqmAf1qY=;
        b=Wp+3s5+dy63ILp/AcIuwSkBszt8YfJci3banMCQZToUT7jw7ypaQGwWlQBLWt3T4r1
         /5w0OEOtoSRAyTRCwkKDFKx/tYT1ypnRyUZr27lv+/xs/Cojm4J5Wn73+FMm3qBNovB7
         XEeyizMbprkZLIWywUNMZhO014iH2SU+3JP6+M6f370Zvg2DpxjMC2Vwn8cPZGpCW6cU
         9KSDsIXzXX/R1HvvcA7byKDQWer1i5JVD5VvPYy5eCs5/dLZa4+b8rPO5EEV/6hQEvCm
         c/KcUyKIOd7ZnC7WzqVYFOydDHRCw1wZ89S0GgynW6DF4zLaF2fMTustV1j3k+TXN6u4
         iAMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751592046; x=1752196846;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z7CrtMSRtoJpcPfB9qnSXOsewkw4Z1pqaBofqmAf1qY=;
        b=i5BtXIIzqKkD4Ks0E9lG/9jjEX/IOeQCToAk3tmP23xwbvJEn2FZy2uFqktEVEx2eB
         STmnfTcrKwBrWebx3KVjPOwGuB6Rr4akJNthmbHqhS2o1Jm4oJsYTY335rY4/Q6jcKtR
         Qm1Gan1G0c0QQ5jwF2ziK2FPZANNMO6Z3J20bm5QYW1LfpeBUSHmJfM9Ro1hclCkqdNa
         nkspapp/dMjnWHfWs8uJJuxInuB9gXXmxCRkS8luC5Ue4rqL2sUIuBTdxeDlr0fHQqiR
         hWh9AFQpgGFThyRyGM1wWllq7qWiOwegvSAUrKh/vuOiqQh2Ut5JOZ8V6/6TN6jG+fsR
         /EQA==
X-Forwarded-Encrypted: i=1; AJvYcCUt9I+sb1DW8EqcHk82fk5zFdqmRfdhMJFwBNRCAxCNAdgjM6pECTxtVSV2CdSqGZ/jXGkZbLa3IAMZzYtea1AQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyjVmj2uZTDnru0mu8JkwZRGGZyoFxMXM1TuIrq/1hhr4FGUZAm
	m2DvxcrEFaEef03+R2GmEQLLiaRzabWQHAgF/LSdiPIqXw3IZKjNa+SB6CPrS4A4M+w=
X-Gm-Gg: ASbGncstK7JfkJeXv9CasHQPEVqpxByOH9x4e5VOxW/lmbw3q3Md/uJBPBnS/GcH6yB
	3ZJZgbAG3zhVVLmOe17eKdK8+l2gjBtIuyz5a6tF0RUBnmsla4o2XAP276WjpOFMTjxMeZOFi0T
	hfaNVEB/ATcHLzOtF3EYVYdPDxrxPE5GYEZ8F1MQQZsR1kwplzZrR1fFKebW36y+CoyHd5Vi4zW
	H8RhGJh6X7+P13rS8nfdxCMhqUkenxRaXZFf5JNpcrhOxYh1Mt9zS1VXLI0pmMVWt7Fnd9dmk6M
	qfRAzbssu12wiV6gx+XYIv6jVNquFVis7SAocJqMZ+h0vuVHpUxIDtTEp1FZptWytAzz+A==
X-Google-Smtp-Source: AGHT+IH4YcJJL/QSinLf0papR/EWjmhqn+rfvAaSq4Pn0BhKlOqBtDpJZuz+HI7qT2qYaiQUGHT87A==
X-Received: by 2002:a05:6830:8204:b0:73a:6d48:dec6 with SMTP id 46e09a7af769-73ca489e0d3mr227940a34.5.1751592046061;
        Thu, 03 Jul 2025 18:20:46 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1ed4:f8f7:2a8d:77d5])
        by smtp.gmail.com with UTF8SMTPSA id 46e09a7af769-73c9f9621f0sm204964a34.61.2025.07.03.18.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 18:20:45 -0700 (PDT)
Date: Thu, 3 Jul 2025 20:20:44 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chester Lin <chester62515@gmail.com>
Cc: Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linaro-s32@linaro.org, Larisa Grigore <larisa.grigore@nxp.com>,
	Ionut Vicovan <Ionut.Vicovan@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: [PATCH v3 4/4] arm64: dts: s32g: Add USB device tree information for
 s32g2/s32g3
Message-ID: <e3e5041e-254d-44c3-b645-532d4d7a8f9e@sabinyo.mountain>
References: <cover.1751591078.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1751591078.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_182046_983561_090231FA 
X-CRM114-Status: GOOD (  11.35  )
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

This adds the USB support for the s32g2 and s32g3 SoCs.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v3: New patch

 arch/arm64/boot/dts/freescale/s32g2.dtsi | 23 +++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 23 +++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index ea1456d361a3..4be6534ed01d 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -376,6 +376,29 @@ uart1: serial@401cc000 {
 			status = "disabled";
 		};
 
+		usbmisc: usbmisc@44064200 {
+			#index-cells = <1>;
+			compatible = "nxp,s32g2-usbmisc";
+			reg = <0x44064200 0x200>;
+		};
+
+		usbotg: usb@44064000 {
+			compatible = "nxp,s32g2-usb";
+			reg = <0x44064000 0x200>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>, /* OTG Core */
+					 <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>; /* OTG Wakeup */
+			clocks = <&clks 94>, <&clks 95>;
+			fsl,usbmisc = <&usbmisc 0>;
+			ahb-burst-config = <0x3>;
+			tx-burst-size-dword = <0x10>;
+			rx-burst-size-dword = <0x10>;
+			phy_type = "ulpi";
+			dr_mode = "host";
+			maximum-speed = "high-speed";
+			status = "disabled";
+		};
+
 		i2c0: i2c@401e4000 {
 			compatible = "nxp,s32g2-i2c";
 			reg = <0x401e4000 0x1000>;
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index 991dbfbfa203..191d2dab4254 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -435,6 +435,29 @@ uart1: serial@401cc000 {
 			status = "disabled";
 		};
 
+		usbmisc: usbmisc@44064200 {
+			#index-cells = <1>;
+			compatible = "nxp,s32g3-usbmisc";
+			reg = <0x44064200 0x200>;
+		};
+
+                usbotg: usb@44064000 {
+                        compatible = "nxp,s32g3-usb", "nxp,s32g2-usb";
+                        reg = <0x44064000 0x200>;
+                        interrupt-parent = <&gic>;
+                        interrupts = <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>, /* OTG Core */
+                                     <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>; /* OTG Wakeup */
+                        clocks = <&clks 94>, <&clks 95>;
+                        fsl,usbmisc = <&usbmisc 0>;
+                        ahb-burst-config = <0x3>;
+                        tx-burst-size-dword = <0x10>;
+                        rx-burst-size-dword = <0x10>;
+                        phy_type = "ulpi";
+                        dr_mode = "host";
+                        maximum-speed = "high-speed";
+                        status = "disabled";
+                };
+
 		i2c0: i2c@401e4000 {
 			compatible = "nxp,s32g3-i2c",
 				     "nxp,s32g2-i2c";
-- 
2.47.2


