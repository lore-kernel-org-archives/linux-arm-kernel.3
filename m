Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4606C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 16:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K83jFZOoULSQRfkDWiXqS6t5Jzzm+WLFtNrH9VIQpoA=; b=IIIfxQhGFrpBsatOl/vVCX8PiU
	RJiSHeG3f69B4YCtVtksZwXOjkNttsZijG6nFw1W4seDH2CvdJBWIF/oSEAYHmuTBjIutgbmdRP60
	Z21Wx9QgOa2NRfLZgCJpIuMx9dketS/U3jnpqcWQSa3Yzxn5YTcQ7/tJdZtAXI8aZ+IDK6eTFu0Z6
	tio02pQWxFjID55VkO1BNRxBKrvZmlMTvycYee969GZCkFihs9M0T/7KD2+ACPODxx6k+5xVS4CoW
	W0e79z3E/Dt6MKv1KfG3iILAats9z3wOLzoriyoAzztRvAV7uGcN1pwhApEsi8ATMsg48KMefmPvT
	68EQvpHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1y0-00000007UZ6-3Juf;
	Tue, 10 Jun 2025 16:36:52 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOzIi-000000071eS-32rh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 13:46:05 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-31332cff2d5so4110217a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 06:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749563164; x=1750167964; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K83jFZOoULSQRfkDWiXqS6t5Jzzm+WLFtNrH9VIQpoA=;
        b=jMb1WfZ5Z3pFUQgUr+P7RV913sWRhxRM/qN95R8oWwcPcVG9oWk69Ctm2g4CX1hUxR
         VBnHsBXfWXilL+mCYIsb/O0PzrgopReedoD2AaNTrDJs1N/dvlHNFAtyIraaxtsrjZ/9
         ss4y8QGh/o5AxwD2/SLMV6Ech/vLXxbzGQfsmt22P88w5J6boyekO7b4ew44yBX9NMJ0
         bblpnYYcGIMt2+TVpT7GX6a4iUXRGJMEx4/dHqyVFJ0L2I+znymbaqYwEIv/R1b2G9FA
         5ZrZfknyTVIJxdy7e2oLqX/VgPT42Wo0eLh17egxSIFPODjrFLQuGSsX17cP+IMnkX2/
         yjzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749563164; x=1750167964;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K83jFZOoULSQRfkDWiXqS6t5Jzzm+WLFtNrH9VIQpoA=;
        b=OOaLUxRPajPGkRT0V7uop4frf4TUokfDSfSD0fe1mgqnvt9mE9nBDkbzzq3GKb0d2o
         7FnNY96/+x/fGidrSZLN+R6B0jSLPYMtNLOqmBUTF1InnfTDXFHja8mL3sZgAu7xRUWB
         fGRE8Ak6DG4CqL9wyHaRdfk5HuXtRSRY4oBskp+3WpVQirbWUl8/cDXYhiFFsAfF9siu
         xRJA0BVLMqGLQxVAmLV8PKimKxpzvdgjQ8klnfnCE/T7E2Seja8frvVmQRAKWbgpeHnQ
         KzEUFA7+8t8MoxZxn2yveiVDSLy0FdBe0lvv6KEibcwX8AFejgDjN/0TYLFHdbrS+iWY
         09iQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+Gtsn0+GeMxIseRi2RmUb8Czx24SwlaAYKo3iwlDOfctYsA/JNrcWocyI55tiS7aS/eH3NX9YjK/u/Mjiub0e@lists.infradead.org
X-Gm-Message-State: AOJu0YzPOiWLMv0p5aG/NvACeXIYMTOB+8EVJl7Qpdf59uoLYKE5hSsJ
	V/TI8tCq1VpqlD+YBWMjOyyOBex8Nf/3QFHz9/tHudQGLWIeItJKVEsmQBkYBA==
X-Gm-Gg: ASbGncvkNMZ4DHoxzh2efbyAy43NMT+Brz53sz/hR27dC4JAda5JgEb2mDQKWSBTTOg
	UT91TADhE7pkDio0CSPZZ1b4OFE0rWyM2eJxny/K9itQywNl3SvBiAdNB/i8tomHedtrEi3Ps7A
	y7GTfPVxLABePIb5ijb8fFYQQVmbOgfvt9xPzRA85IYDIIo1+g7K1+O/JNQMG7AofqkkN4RJBRM
	jwhXw9j0ImJGhQwDRJ1olr/7nY1hLQtbqKWYIJ3D086opyEfLX7lOk5Xvvnj3BS0E69EkTSudLM
	My1cv+qrstdw6R0BOqRuJvfKKHDzYtnp/PYE7Ix/ziAedEzCPzPBYkbEa/PWoP1peqr0nEPDNzY
	=
X-Google-Smtp-Source: AGHT+IFwMzsCYgWMT+CFDgevF6YB6l29l/wNFrIVqtpMe/DF3xOkCJ0luh7tYQ0NXpZxazDWxZ/x2A==
X-Received: by 2002:a17:90a:dfc5:b0:311:b0d3:85d with SMTP id 98e67ed59e1d1-313a155c54dmr3919205a91.2.1749563163919;
        Tue, 10 Jun 2025 06:46:03 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-31349f32df7sm7288522a91.15.2025.06.10.06.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:46:03 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 10 Jun 2025 21:45:22 +0800
Subject: [PATCH v2 3/9] arm64: dts: apple: t7000: Add I2C nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-i2c-no-t2-v2-3-a5a71080fba9@gmail.com>
References: <20250610-i2c-no-t2-v2-0-a5a71080fba9@gmail.com>
In-Reply-To: <20250610-i2c-no-t2-v2-0-a5a71080fba9@gmail.com>
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
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoSDcLe1rL4B1JFrm9RkyAgKXRWPFtMJrW8tM7O
 MExXyABjfuJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEg3CwAKCRABygi3psUI
 JHcaD/4gnlucLyaM5enMPneKiFJG69Dk2MBczinSUzhxA9dPstTau2WigFdNG3O9Pn+gmLBlWd6
 hy9JF8XSapJ0lPUPw/tr+0CCiYrDSgKCK/xOGnx0/Tr+1Ja78stzi3IiE6wfnEwhZloRsPzzv1U
 D0i1ALLQPfboCG5Ozs8shcOY7yakn9Yr+45FRBAUZOA+YNOfjJAqb+Cm+yd4Zajy3EIaZ4lvhZ/
 ckdtWVV1j3QCKPe5vCcdbY6pNjRYnQwimfz68Cxko0KQMRTJJsG7CtqnXGNc8LMXi3IwNYHkeaI
 feK6nYhYOrJEUhlvvGWpCYyvK+DG1TcHUcD13L9gB0hW9Lp+KvIGnTbMQevtA+PxKWNtniDryMq
 YtkmsSum2xzBTnw5fUG0vRW8HV/ANeXCQmmIPtFFZaEgwE5u2Ml2fNhoY71nT4FkSOt9s0z9HoH
 KhNo2reB3Lp89XvbCDN1jG6awjhWUTBd5UbMZ8RKwu2E0J3080MkxEKpamIPKm7T0sxe67wZmHR
 krWnhiLRVYgo29SE3N3cYcV915uEaqlFJsdiR85Wm6J0p1XyB0LuRLc/PVznIjs6GfVENGCsYhT
 lozHRfibRaFR1RWOluCdZ1PPvpwS1FqUW4JieYjC/3pDeb3Vz9CIWP7iI8GNfrfqY6OG/OqC1Rs
 C+O/+TfkQCufZLw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_064604_758372_6141BFAD 
X-CRM114-Status: UNSURE (   9.90  )
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


