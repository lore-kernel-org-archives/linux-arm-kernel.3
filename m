Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C1EC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 12:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ZfW10zFYbqBNwsmMYYxG2KbvaoSIbM1bx9G5szi1GA=; b=vMVM/41F4tHeGEI0U51IbB+WzL
	Z+t1/vERBQxFMcf6jVMlcdt8hYRz7NLeybIKgV4tXIlIUErPE+tbJMi4Rj2guc6vJC+zp8e3+Frh2
	pr/swju4Bl6Zomw93vp2e9VtTWu8ZEGmi/M5uXNdzXvOJww8c3iE6sKdRcmOvmOZp95jDQ96ObcEI
	ik3RWFC9+u83p6TspbVkrqujBuJwJKS3DOlIHbTQte3sTRfbLbzrfKNrbUvBFB8UBVxGDjueMZsWn
	MfCVnx3oIVsklHpjkfiOd7w7uH8taoGWTwuVJKrbVKjpZYxmxlOtjYVH7nNB6RzZ2p9wDaimDyI4f
	LDqaqZDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umABh-0000000Dad3-0EQA;
	Wed, 13 Aug 2025 12:02:37 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um9Dh-0000000DSGa-0y9j
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 11:00:38 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-af95b919093so954736466b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 04:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755082836; x=1755687636; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ZfW10zFYbqBNwsmMYYxG2KbvaoSIbM1bx9G5szi1GA=;
        b=aY+Sc3c/xnVaQ9f08DXpkpoI2ctz/XFRTKrIaVuFcBH7dmvd+CFcESyi4XF0BFvGUg
         HLoCIEuYx+Y9MuTn+Uk0Vg47dC+1X+R8FkU9bRF8DdzTM2X2f6wiD+0uOKBwuLCYnHis
         AjtnCo+55P8C1qlomsa3fdYBYth5k4UcqVkBx0irdxmc8VsfiVbaUsxB5rRNrSSxazHg
         87xAxGGo8W6yxEjG2Cua7cD6tZlG05fVc0dF1vHq5y/2GQEmoouvAtyAG7qq5ROkBlVy
         jsTJm8WGLnx/mqL2iQYCLZWjgGybeK9lbYSEkHXv8jjiwZCkuhU4Lf0QYDB7CwwBMeJm
         pVSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755082836; x=1755687636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ZfW10zFYbqBNwsmMYYxG2KbvaoSIbM1bx9G5szi1GA=;
        b=i7H8IshTxb3GkH4WhjVgsndVJx2xEEwVU96FqY1gEKQDBX4zVQnQ8vfyKfOUPdLZ+K
         OF76J8ht7jSozWnaRBmiiFTNPa2qH3eybTD+j/V5KpRAvAMIdBHF6ToSDruxTX1pLIri
         tvubC4zXHtP44CFxqG/Wr1g77U0PoujoXkeff3k27pZI1dCZuANDMENhZNA8TxfseYYR
         mR3kOD63jLmn5Ji6cM1X6YAHVNtOnHeeYoGBZW8QJXpHSZ/3OvepBbUWyVABsP44TVyU
         5556qudsIdjJL2JI87/r/mZkNR0a/0KBTqZKAlVs62yZBzXBLHNwOeercbcvhTHZXZHs
         Dx4A==
X-Forwarded-Encrypted: i=1; AJvYcCX4FUJAbeOycWttjsYgbifZO4h2NFGuVX79heDYRmBeiAY6SRLFN1vM84TKgd45bAYubhia4vTd5zQo7SxoJPL+@lists.infradead.org
X-Gm-Message-State: AOJu0YwCtFrp6T0mAN6n1tqOIseex9SF+H5PrsYR1diSZNi5gLYHMyCx
	X72Wq7MYpEbQ9sgwRm1ZcxnJHRRfTpdbhiza8Wj2qWyEE8uiOPlttM8p
X-Gm-Gg: ASbGncv34/x36jN2ZUEC1peY9Hfvpc2WS+1Smz4rLCLhrhxp7Iob2OUJ9/vxhru2Icw
	/HwcqXg2GX0X+FB7+ONKNdilZSm20x+eY73/3imh3lU2IwbYsRxbPbovcXc4JooUUxFvs8fYfgJ
	8zvQ6R5jxWxcn2Ft1OZXCicjoQufCdzsPI/QhGDLcufhOAvC7vXiq3UgkowN7kfUCA+pTQBHohb
	DaTD2IkrLTYdQoiwtWXEtUzgRbpsFcJ9HOeC+D1WWk8F9Z/CnCfTEUlFDe1WgOsTqs26TSnk9rG
	qlesfADGuNmO/aieNNH9FDyIyQyhHh2aR0ZTvgS8wFTDbstxMnr/sU+tfNMrM7RU/fWnEpVgQXn
	0wNnilXD4u4K23eu7jaXRtQ8QohyBjYtkcoLai/566EAm4CKFoXSAj1R/vqh2tWFzQr6/4owlgd
	1c2Rs9
X-Google-Smtp-Source: AGHT+IHBVpEx8bhMMYRCjTIGjv0d9XitVwLkFklyI52qfh6/v+GfxUm3Hg0LhC3860E0Az0OXPHb/w==
X-Received: by 2002:a17:907:3f98:b0:af3:7645:43e1 with SMTP id a640c23a62f3a-afca4d011c3mr285818566b.17.1755082835744;
        Wed, 13 Aug 2025 04:00:35 -0700 (PDT)
Received: from tablet.my.domain (ip-31-0-121-4.multi.internet.cyfrowypolsat.pl. [31.0.121.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0df10asm2377046966b.59.2025.08.13.04.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 04:00:35 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Wed, 13 Aug 2025 13:00:14 +0200
Subject: [PATCH v6 8/9] ARM: dts: bcm2166x-common: Add matching bus clocks
 for peripheral clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-kona-bus-clock-v6-8-f5a63d4920a4@gmail.com>
References: <20250813-kona-bus-clock-v6-0-f5a63d4920a4@gmail.com>
In-Reply-To: <20250813-kona-bus-clock-v6-0-f5a63d4920a4@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Alex Elder <elder@kernel.org>, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-kernel@lists.infradead.org, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2451;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=h392+mnpg7XL/aXcx1eoF94ujTiYzX21EL9Uh5HDyNo=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBonHA+FPFwVaGa67+guCmLndtPZd2mh94+S+aNC
 +bD7m65ftSJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaJxwPgAKCRCzu/ihE6BR
 aM4lD/9ZThn4HMMUj01QvCYJZvSBvvL4SEEOnUmiqPFbsAroJrs65IGe6cnq8XWZihOlrNsHYaX
 prWjLiJGWhoqAS8SN30qVKpjj7KQaT6nxO1jeywZ2K1cnhg6/o7xnmVxuWKo9BL6e8e3klsw4NL
 n41b2m1nIzco3q7V/I2w/kvTj6D2PtVFsZNPa/grf8qKWcJJBMVoI95KnKDY3XtX/AR1XM3m2eo
 Zw73tC3mPynqsX6brsgMVsQkwBruX5DgVmRSpS7dFSBFDTgDUs7MxAQbpYSQAFiKqMtRuKJV2qp
 d3CG9sbqYooQkyimKXF+XVlbvTJfymJyvUbRvOpQtSm77Zy2oOJzQ0I6T2FRCm9wwAGvVLnvGXF
 piYrpg6swLCXkaotbciu7W2yp8g3wBVMJptVAxacILCbWoy8RbLipQvH4o8KSQZ8v2ZHyYGlyDa
 3srvDozPhLStuS4/wrZTk2sY5F+sMncG5UtaYXTysU1AIj4MmtZBlF6tEmZWftbLxy57umDzc83
 Suks8fpGbWtKcqay8EfZS5q0rWH6F1K8Wr9Wi1V0tgVHIxXG2Yxu/GKILQjvD5SvbUX9g/EaYUM
 qwhKRC2r1CWSOi6nJMefJu1QRiDnvhwv3SVrKdizsiJgbEKIXLUV8FWl5x8YZy+crX1V++oapnE
 Xk/9UbF+IF8wNgA==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_040037_290950_187A943B 
X-CRM114-Status: GOOD (  12.79  )
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

Following changes in the clock driver, add bus clocks for timer, SDIO,
BSC and UART to the DTS clock output names. Replace the usb_otg_ahb
fixed clock with the real bus clock.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v4:
- Change commit summary to match equivalent BCM281xx commit
---
 arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi | 28 ++++++++++++++++---------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi b/arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi
index f535212cb52fec0668abfc06e7268bead70d958a..b8a6b81d2b7cac00cf393ee37aae4dcc379e487c 100644
--- a/arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi
@@ -148,7 +148,7 @@ usbotg: usb@e20000 {
 			compatible = "snps,dwc2";
 			reg = <0x00e20000 0x10000>;
 			interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&usb_otg_ahb_clk>;
+			clocks = <&master_ccu BCM21664_MASTER_CCU_USB_OTG_AHB>;
 			clock-names = "otg";
 			phys = <&usbphy>;
 			phy-names = "usb2-phy";
@@ -253,12 +253,6 @@ var_52m_clk: var_52m {
 			clock-frequency = <52000000>;
 		};
 
-		usb_otg_ahb_clk: usb_otg_ahb {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			clock-frequency = <52000000>;
-		};
-
 		ref_96m_clk: ref_96m {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
@@ -306,7 +300,8 @@ aon_ccu: aon_ccu@35002000 {
 			compatible = "brcm,bcm21664-aon-ccu";
 			reg = <0x35002000 0x0f00>;
 			#clock-cells = <1>;
-			clock-output-names = "hub_timer";
+			clock-output-names = "hub_timer",
+					     "hub_timer_apb";
 		};
 
 		slave_ccu: slave_ccu@3e011000 {
@@ -319,7 +314,15 @@ slave_ccu: slave_ccu@3e011000 {
 					     "bsc1",
 					     "bsc2",
 					     "bsc3",
-					     "bsc4";
+					     "bsc4",
+					     "uartb_apb",
+					     "uartb2_apb",
+					     "uartb3_apb",
+					     "bsc1_apb",
+					     "bsc2_apb",
+					     "bsc3_apb",
+					     "bsc4_apb";
+
 		};
 
 		master_ccu: master_ccu@3f001000 {
@@ -333,7 +336,12 @@ master_ccu: master_ccu@3f001000 {
 					     "sdio1_sleep",
 					     "sdio2_sleep",
 					     "sdio3_sleep",
-					     "sdio4_sleep";
+					     "sdio4_sleep",
+					     "sdio1_ahb",
+					     "sdio2_ahb",
+					     "sdio3_ahb",
+					     "sdio4_ahb",
+					     "usb_otg_ahb";
 		};
 	};
 };

-- 
2.50.1


