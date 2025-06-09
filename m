Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 695E8C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 15:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K83jFZOoULSQRfkDWiXqS6t5Jzzm+WLFtNrH9VIQpoA=; b=C5FA1v1Pe7GirU+fXxlHhS8bWv
	BnUWuwEYgn7E7iaXanZQgkfn7VrJYqAm0i/DFXa04gZlOKJanoJo7sa34UsEBhIQG08QqlPqzXSGG
	nF6tw7+pASj88LM6MhysiEYds1DZgXzSTiIFyLjsiejkWOHpT9kwkvs88zdlGQXlJbb4cvO1veIbZ
	/M4ElZc/5LebqhvKw8QDTgqfGRGS5eeqAziUvx46SoR2gRMPH6WIrM8U6RwYspWsy3cA8DNZRkckt
	35myIkEtvY2rt7pqc6INmQdPSkrRltDMW5q2L3ZHimC8WVry6bowDbWIT3BVRMZC5Br+p5Vtx/QWV
	ck9LZJ9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOe3p-00000004SY6-0pMG;
	Mon, 09 Jun 2025 15:05:17 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOdxI-00000004R9o-09xB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 14:58:33 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-235e1d4cba0so34357215ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Jun 2025 07:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749481111; x=1750085911; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K83jFZOoULSQRfkDWiXqS6t5Jzzm+WLFtNrH9VIQpoA=;
        b=m1jb7Q6bp3B2/NG6K0KsRxAlXGYipa0/FaJh7Yb6FO3DVewL+7mVolqDk20vqXEw2p
         DOVgbEZmDuGrufXsR/YWw/5AM5/kKkrmrRq0z72P3b9L/NNvU7rNhhe4guLxN6KAsnc2
         Ug4LRwP6KCRLLx8zb6UN7jDwYVyvRfVgiE3QnjCMM9A9N50oqzTnfmrTUj9FxtBjVmdj
         AcHLQe4EDSjc1/JWRbfaY8CbG9InaDDYXvH/VbGR2Oi0D6T0tgn6C6TUC57F1cY+ESH5
         33h05QHgIX5+pl/WEnCJynogeiFHklpLxb9E9fhY3lvW90Y9vpcB8JC/Zu3y5vxj7vvO
         dVCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749481111; x=1750085911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K83jFZOoULSQRfkDWiXqS6t5Jzzm+WLFtNrH9VIQpoA=;
        b=OxeadPX5RqBUSMJR1zRbag7b3B4bsQv7/gzzHmpZfjwwz2Cz49/bEikA7PjQJ/bB+6
         tJ//h687ZlDfF8uvllLmZK02W02ilzhUL6mq5GZqZ4uhBsqfZMU5eNUSNAegtbsbKo6K
         rczHcRx0mahLU8t9mbhKAGCkAbdPQccEhLrUYnuStXmzlTz2Dyt4VJ09M66bjLiHNulY
         AJ0Iyhn7njBdhuFY6QP1FEqFLWLcWjhjAZv3rxahn5kEKGEQHpWMgfRa11CraUgweSBs
         MaCI+0SS64a6WqijdBKPOH1o2is9zCJHNsuXM1ECvpT6sBDeF9DjBmfDP39jQlesA1aS
         eTpg==
X-Forwarded-Encrypted: i=1; AJvYcCV1Kbe7esVTOkfZtmHCQKbIJ/dXR2zp4VLaY1oHqNuF1yAXVUhofhcx/XEVa+YZsjqw6ZeSJaOE9pRQiYJlrb83@lists.infradead.org
X-Gm-Message-State: AOJu0Yxd1HcBDHCm9RbmbKsJyIJ17qt1MFgCH2c6NZAVmgym5UpbXt9i
	5Tr5p/fbYbobctE8ryCS+4DIuq608nSM0Ay5p0crjh+r3m1vMAo7Nv4S
X-Gm-Gg: ASbGncvSONWtRSU+cu5Sa1+f77Hmlxs+CuHNzijOPSilwTFWwd1Oi3vBKFYidW7Nq3I
	0+6JXEcbkgDw/SdJtMcvjENL7nZSqjPvRL5JONXkEUT6DqdbuO5jAKWjbqmpZY0uGdf3BfG2OMY
	CM6cTh8evEsjc9J49XVWSBU+MA5I4FA6mCdiaFwFeMNuNS+R1ZNBBw4qyPfDEUxQTIjPA3XHBnz
	5rQQEh6ue7wGHrw9otGtiQSzWoVCt8Qvo9LoIevKH+Ys0pV02xrHUo0p0IVbHpB+L75yxxSDjzW
	96lqi908Zf2ZGwBrMDeVLjQ53z/SDkdNeopvG99Lei/fW0Z++3NPHQaBNSuGvVDD
X-Google-Smtp-Source: AGHT+IHudanz/AzLe3suzWuVi9ir1ppPYX5nivs9d5/PLR8B0J0O/ktF/FMnClKF8ITjSwmoanaI4g==
X-Received: by 2002:a17:902:fc4b:b0:234:8c64:7875 with SMTP id d9443c01a7336-23601d96e8dmr218896905ad.38.1749481111240;
        Mon, 09 Jun 2025 07:58:31 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2f5ed593ebsm5414182a12.6.2025.06.09.07.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 07:58:30 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 09 Jun 2025 22:56:19 +0800
Subject: [PATCH 2/8] arm64: dts: apple: t7000: Add I2C nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-i2c-no-t2-v1-2-789c4693106f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2998; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=SytD8kgCuxXBBFx++xxWqqIK35ejAFIEBKHMJoFT9+Q=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoRvaN2qKaij/1msQFpC8wl1rbodNpvJi4tqcsQ
 XcEw1C/niiJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEb2jQAKCRABygi3psUI
 JDRaEACkXyzwdAoycqbt0sX7Vkmt+pta8E5FIvMUQez4KGhtDcZkBCEMb2RPYMKDi8kiMho+OtX
 BST4Jmo0b4lGxRZWlcPAQKnMcV4XNPHkk850aIWUyk+1s33ez33PnhD26tBRDqdLAdj65k4QX19
 r+gBYjAwLXrQptR0q5XxCFqSrSezk9FrfexrAoZw3WLEOV4Mmj9JPXj6CGj7JiSwUb4tq/MYAAy
 Hpga6eGvU4o9P8m0qAqqUnb/3mk0qpAOOuzWtdrB0ZIqjSSGoIsq8a83lMAi7NoAHgHnlEWj9Pa
 DjmeB+Vcb9utiAC9mSR/MmgHQEToSs2rgUOc/Fx2pI0LGdyGrcyAv1T2VHoNqvEnmr5I2ialY1+
 cUPYEIwdE9wDpVWgpQPpgxb9brNotf6QNZusDiKAkw2N6fU6xV/vaD4Bw8Mnor0GtpZhLYwCj48
 E+ct4NWgjJrSxRRf5bFcWft3jNuGJcAZrSQ7sA81f6TFDS9N7zZYJnTQfWdunWEmH9rxsA3JSHC
 i3iyvkXbwyyJL5RZ3fWnGdh9Xj6KktKvYClAdYpWr0NKUnxsQRodARauQLzP8ivLNhkU67P71qk
 PY0cJ+U7ifJqL40d6VSszxB0w9YkCCLbpPLAnE+D6kzNk8iEIzi+zC7XdTO5jCA3t5KWbslRycY
 g/bw2gFRY64nRKw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_075832_086104_3D6EDEDE 
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

Add I2C nodes for Apple A8 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7000.dtsi | 76 ++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7000.dtsi b/arch/arm64/boot/dts/apple/t7000.dtsi
index 52edc8d776a936ca5ba58537d4d68e153023f536..0342455d344474d34f7924a089bf5f5915e68d55 100644
--- a/arch/arm64/boot/dts/apple/t7000.dtsi
+++ b/arch/arm64/boot/dts/apple/t7000.dtsi
@@ -144,6 +144,62 @@ serial6: serial@20a0d8000 {
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
@@ -195,6 +251,26 @@ pinctrl: pinctrl@20e300000 {
 				     <AIC_IRQ 66 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 67 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 68 IRQ_TYPE_LEVEL_HIGH>;
+
+			i2c0_pins: i2c0-pins {
+				pinmux = <APPLE_PINMUX(97, 1)>,
+					 <APPLE_PINMUX(96, 1)>;
+			};
+
+			i2c1_pins: i2c1-pins {
+				pinmux = <APPLE_PINMUX(139, 1)>,
+					 <APPLE_PINMUX(138, 1)>;
+			};
+
+			i2c2_pins: i2c2-pins {
+				pinmux = <APPLE_PINMUX(65, 1)>,
+					 <APPLE_PINMUX(64, 1)>;
+			};
+
+			i2c3_pins: i2c3-pins {
+				pinmux = <APPLE_PINMUX(87, 1)>,
+					 <APPLE_PINMUX(86, 1)>;
+			};
 		};
 	};
 

-- 
2.49.0


