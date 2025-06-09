Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72370C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 15:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YITmx2LfNpYIIQRDNqfocFPIjztXd+JwPnZTlfVIKV4=; b=PvRa/ryEZILEihZn1KXXioYxII
	tS2m8GFDW0hYgdArmToWv9RUvOAuij8HIgI7tfsllxC/MscsVcK5QdWUGmZe78IFbOIMdsMhitsXW
	dSN5e2Z3z0GBdoG4eNUxa334S4e/848m2nlqtDORRiXyqw9kc9k5OgdCXJP/ch1GeePuq8n00G7FD
	Wnq/EAW8Xe1siXUrs/wRFVcgFWNBVswq73VM+Nvj4ox0zgHOMXVNYrhhgjdHwxHIXUmIwVXHcMCp9
	yAu++rcFHRb3t5PF+0nxwlNZQGT83w2KH2POv8qiPES7PLOg/HdnXZrMuFrdncWoavwzd3RfDqqTb
	901on6+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOe60-00000004Svb-3uUI;
	Mon, 09 Jun 2025 15:07:32 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOdxK-00000004RAQ-40uk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 14:58:36 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-748582445cfso369570b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Jun 2025 07:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749481114; x=1750085914; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YITmx2LfNpYIIQRDNqfocFPIjztXd+JwPnZTlfVIKV4=;
        b=kjYLwuOKPUvlIcBe1Hd4DKAXG77ELycoB17lbBxWg9T91lTL3uzF1pOmO1jzEZcqsV
         4SMw6FvxmvZV9bLggQ2KznWdXwPyvwg0CqRmZlpB3pYx2Bsf5la0Zvf2hGxfbXMFV7ih
         tm2Hf1TARCtje51EwfEpX8GsOTSVOc0aIx4QlnalvsRqtNRskXh+H4c5dmrYkuUqLoJd
         1XwkERHIWeF89OkvvOdsrU/FV7tyHOEUYg0r/VAbhyFLZtas4t9Rf+c391J54sBS+re7
         WPoc6H8BxK63tFfmZNEWTvr/RkKrFPGykGFx6twGCc01/e3uXe811kagLiSKqczAozbm
         6j9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749481114; x=1750085914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YITmx2LfNpYIIQRDNqfocFPIjztXd+JwPnZTlfVIKV4=;
        b=joOnpy2LDxjVpPI+T0PPxhA4ObU/KD2rMXVGLCaLTrGg4XLcI5Cd8/nbPMhuq+hrPV
         kHAlT5qtk9LJqU5L6GoR/aP4rxLH7t9zLpR/LZ2ZYZB6mrdkEOHiXcuUnGag2mq8h5z1
         Kk/rnwGhX9zy+LCSva2yUcgBNWkXEXTW9K6gAdAVBE5B0n0nn3T3maoqFh1X15g1jWM2
         JrxWjgj7fqFzfI6nvMRrcaALPNO/vvfscRhPCTFW6kY8V4gYqxWoaVR3L7Zi35/7e0F2
         YD8wf2z52f2nwPeUioKgEm7O90fYzNFAmAy90Se+yhUbkpRb7Jj8V7C4d7eWejZmLODn
         eFFg==
X-Forwarded-Encrypted: i=1; AJvYcCVbAtC47SwfHMxGVrw+WsH0w6hYKZDl/1eBxeYWHPHgs+S2YmgMtuGAxYpfZAPeoxkfb7vQmmifvgclbGt4CZ4o@lists.infradead.org
X-Gm-Message-State: AOJu0YyYCrrGD3YCsDsUeUcuHUkh2jV1WSPJnxeCGj/qZmA1xj0dp3Oq
	DAqi8Zjg1GW6r9dFtCpWsNI3gbKpvtVjahRBfS6DB/TTCyLCn7i7pPtG
X-Gm-Gg: ASbGncvYfLSopWvsCDnFgS1mph/lMa9FdDJ3TYuTbftbOugBVe8/Ts1CnREkaO44/5A
	/47DkGm6Pyys7GFIToCpcl7q/jp8a7tpZzJHh1UJbI4BjSgtYwOygMfJnzKchZZ0wJRiXeDI22t
	QW8GewXdCp9ZERR7EvRxa92FdwRugAD5JHcv2cKW9Eay2wM3ZuRxdGTyBPkMUUOjuVdXGjPmeQp
	gI23YIl+LQmq4fRaGzUPl8xwyLolBpgfDe14oCt8tJLMPD2fnjY4NAF+U9yB6VSPLVnpbQBywJH
	ujnyJc6X8ixeJcI+Gq1pBaBSzwxxQi+JWZsfsvS6C4oc87CjoUrN4Q==
X-Google-Smtp-Source: AGHT+IE/bBsxb7SPwbV3RX+Q5/pzcK/F12ikZ+jKXpsOAEfLLD6uUBuxfP/CDuynUXh9qOEUNBQY9w==
X-Received: by 2002:a05:6a21:5006:b0:21f:508b:1a19 with SMTP id adf61e73a8af0-21f508b265bmr6728364637.14.1749481114166;
        Mon, 09 Jun 2025 07:58:34 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2f5ed593ebsm5414182a12.6.2025.06.09.07.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 07:58:33 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 09 Jun 2025 22:56:20 +0800
Subject: [PATCH 3/8] arm64: dts: apple: t7001: Add I2C nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-i2c-no-t2-v1-3-789c4693106f@gmail.com>
References: <20250609-i2c-no-t2-v1-0-789c4693106f@gmail.com>
In-Reply-To: <20250609-i2c-no-t2-v1-0-789c4693106f@gmail.com>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3001; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=eFHOE+VL0+vUkpIqYgHrxunJPZC08TQl4cAYlC5H0pg=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoRvaNrcrqpm0qmk6SFSpUNKyMHMKjxtl25i/nU
 wtZy/y6iE6JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEb2jQAKCRABygi3psUI
 JAqGD/0TpzVdEq1RtU0+WgCAT4uKrnvpB31OMBsrOfdJgcJWX6PsBelC0wCB2F/UROMYKoEvVmQ
 9lShNr3OG/MBbCl4DI+1i8vk8+I9I68IhXGVODrzc4joX3IXB4f9zexc5V3vOlz/dTAQdssjl+U
 QmQvoDe3tNK/uyA4KfL+FACYIHOziC+EtAimW9ERtA5Syj6KLjDhLk1FdZ9eZ9s+5YiRnZ/DzhE
 OZfw2OEBxYk0XkYy150VWFhS82cZ2wv9+PQg35Qx+8kd9jp97umQWd/0KvPFAuVq6DkWCn9YAuE
 lWQlQ0TNsGujXuaF32PchZaeh+VpJcwoNGcdvT92kgIZwFiEP2MCeliPU1GhW0Pz9WCf8bH/GIK
 iLi7xJFV/UpzLIBoDvz2Q0cfzpND002EvcerNr8VK8ZpezEMu/PN3eZ/ydnCJXnpHB4ICM0diBT
 Qu4pdp0+i6eTF4fU7ClzifxtZg1mN59psOjzwB4ptlIspjItRdZul73hcSheM/lmjamDLnxaAMw
 f4xtDGsb8655LmcGvT28g1aUy6kGGiGSb6IdF8OVqKqfU5S+/1SZx/aI83iyjwYmBP+29D7tNl/
 6aTr/ht11oAdo9NUGBQ/2XlU7VUYx1Px/Wm4iB/X2vq0QkY+rEp0Z5QW8dDZBXyPr5VCezjEcjl
 rCmDiwKcxfxTGWg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_075835_006119_52F83BC8 
X-CRM114-Status: UNSURE (   9.64  )
X-CRM114-Notice: Please train this message.
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

Add I2C nodes for Apple A8X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7001.dtsi | 76 ++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7001.dtsi b/arch/arm64/boot/dts/apple/t7001.dtsi
index a2efa81305df47bdfea6bc2a4d6749719a6ee619..e1afb05423698223ebc15f2ae347e73fb46c7c24 100644
--- a/arch/arm64/boot/dts/apple/t7001.dtsi
+++ b/arch/arm64/boot/dts/apple/t7001.dtsi
@@ -144,6 +144,62 @@ serial0: serial@20a0c0000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@20a110000 {
+			compatible = "apple,t7000-i2c", "apple,i2c";
+			reg = <0x2 0x0a110000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 174 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c0_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@20a111000 {
+			compatible = "apple,t7000-i2c", "apple,i2c";
+			reg = <0x2 0x0a111000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 175 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c1_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@20a112000 {
+			compatible = "apple,t7000-i2c", "apple,i2c";
+			reg = <0x2 0x0a112000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 176 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c2_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@20a113000 {
+			compatible = "apple,t7000-i2c", "apple,i2c";
+			reg = <0x2 0x0a113000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 177 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c3_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		pmgr: power-management@20e000000 {
 			compatible = "apple,t7000-pmgr", "apple,pmgr", "syscon", "simple-mfd";
 			#address-cells = <1>;
@@ -188,6 +244,26 @@ pinctrl: pinctrl@20e300000 {
 				     <AIC_IRQ 66 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 67 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 68 IRQ_TYPE_LEVEL_HIGH>;
+
+			i2c0_pins: i2c0-pins {
+				pinmux = <APPLE_PINMUX(38, 1)>,
+					 <APPLE_PINMUX(37, 1)>;
+			};
+
+			i2c1_pins: i2c1-pins {
+				pinmux = <APPLE_PINMUX(66, 1)>,
+					 <APPLE_PINMUX(65, 1)>;
+			};
+
+			i2c2_pins: i2c2-pins {
+				pinmux = <APPLE_PINMUX(133, 1)>,
+					 <APPLE_PINMUX(132, 1)>;
+			};
+
+			i2c3_pins: i2c3-pins {
+				pinmux = <APPLE_PINMUX(135, 1)>,
+					 <APPLE_PINMUX(134, 1)>;
+			};
 		};
 	};
 

-- 
2.49.0


