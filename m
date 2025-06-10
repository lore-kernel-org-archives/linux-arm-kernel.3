Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51919C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 16:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YITmx2LfNpYIIQRDNqfocFPIjztXd+JwPnZTlfVIKV4=; b=EGnwLCVc19J7qutENgai+a4ZSP
	lgvxjeqI/qSFIPr+p+MDbKJm+eVOSbhZlHT60Ll3waPtG70klWRXgVhHLc2UWa9XJRih3gjg97nae
	XftwJ4vohzx73HEFc24iy5jykZtaUF4Wem+f2U7v+BcaynABoH21XoTl3d6q35TGyt7xx2xm5Kvn7
	UvGiKZCwuaFRiOJkTrwTunf5Pjkru8Qfq1X2AB4OiTzMBJEWX1QMe4bz1SP3MTSRWcP+r0RfJQejZ
	sAeqD6HwdlvrxoobTwoBKmZdfo63B7ZI59V9Qgz/IKOwMsXteqkIvPdW57gy9eP5Ceu192tru1bjj
	ZKDCQ/RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP24O-00000007Vtx-1DHg;
	Tue, 10 Jun 2025 16:43:28 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOzIw-000000071ko-3DaK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 13:46:19 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-2db2149ffceso2419601fac.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 06:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749563178; x=1750167978; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YITmx2LfNpYIIQRDNqfocFPIjztXd+JwPnZTlfVIKV4=;
        b=YyMRNcO0rk7Uljj3MSO8SR3AG01N2mRv27dRU7lEathC0Gd0yt3ZrMBAPPwVYRaD3W
         08YOPfyvz6QSqV0YzR9wS1YZ7sZBBhzKLifzFdg62YDdLsy8Be3fNOOL8xdJKGZk0T0w
         kd1a0Jo9jTiaQUnfNHzjCWs8GijOArAbe747lqpQxEK9pYGY6J6QNoAXt/VvjERJ1S3s
         UiOFOwXPRCjDWXqX80jFz0nHSCBQnLTnlaTWMsikHr7ezKCuxZDXN31NtySgIE9ghhyq
         uj6fxTDaQ5DQO+8ksGkh6E+b9qAJuYlhf7F+BSM4kqbExLpibY6/r/VF6vkWTD/HVwZ9
         Jklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749563178; x=1750167978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YITmx2LfNpYIIQRDNqfocFPIjztXd+JwPnZTlfVIKV4=;
        b=pPx1pN9JARJX8/luxf9s1pHMJLgkjWuWSVQI+m31pBlOibIeWxsIwIobkTTBUU8w11
         eZQWtGGhQU4QT1cWOg3P3MHQqWHXLAQfaH6POtg4hEwbVFh3AptiCEpcyO1wT6vPxEqw
         qtt+6u/gcJQqV90KVLj+MMmuet/s7z1jXNyiG84cMcQz174lXF9JynYnFqgogeVV16Wk
         brFWAigQAu8rwWqut/oz2RVoxPQknp7uGSwUAIW3udZ6C1FXwanGPoA9d7uMyQh7uQdB
         vOQ/clkbDqbFO5hP5Twy6juyic0QZs1mEpmcOEwlr+Mvgv2Ib+JoKlKVrDK3W/zu6f31
         C0GQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUzYdU7DWagkcpOLBYn5m9v1EWixCIXoLUC/SNYytytSqBazQMI5KsBBtTIKmWsvTDnPU3IrYiDN+RDKZKYtrV@lists.infradead.org
X-Gm-Message-State: AOJu0YxsQ4Yj54m/9DM0WGnCZcqBBllBdEhgjQyYgyp75M7wvxMzX4NK
	nHHS/KOSx0fFsnNwtQnUlXMmQSjuDklGH6TvAnARCxmm0JunubfYHF5VzUSuNA==
X-Gm-Gg: ASbGncuz1W64cczfkyuf/O7eBnvRoGIpEGTf/6ZT1kSEXnaFpRIleM/+Gt0CxZwVhvN
	dZYI2hJdIusLz+DCJcp+E85iunTaNgbPav40mZKAQBeoLgsGQwjN+V1IGLzvSK3fVQCqhceYkWn
	Jo54j6CsQef3CbZ83SemO5MTqLQLp0CMcyqavTEWbsiB6PjFjVKjsE4Hi3UKslBvF17Hz7VWS/a
	w4/qO2mKsO12MlHxRqCbpFB2hP6qaWGFLBpcVTfu/5jHg/bloOE33Rq+Zg6mZ2VDGm93HhdTyr5
	3Ij0tE4HhLU+XYpZ/w1UQ2RiHZ9YP551WcDHQ/MjUzppGaTbt9GRhytLMW4ceOtE
X-Google-Smtp-Source: AGHT+IEfTFb8zgj5xUPi51FTzMoYyKfdVF7T9yXKQ/Lb4kplJ4b51oTC893O7qoQI8dAZAqlSerVrg==
X-Received: by 2002:a17:902:e890:b0:235:1706:1fe7 with SMTP id d9443c01a7336-23601cf6b9amr266199995ad.4.1749563167284;
        Tue, 10 Jun 2025 06:46:07 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-31349f32df7sm7288522a91.15.2025.06.10.06.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:46:06 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 10 Jun 2025 21:45:23 +0800
Subject: [PATCH v2 4/9] arm64: dts: apple: t7001: Add I2C nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-i2c-no-t2-v2-4-a5a71080fba9@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3001; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=eFHOE+VL0+vUkpIqYgHrxunJPZC08TQl4cAYlC5H0pg=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoSDcLt4kle8AckLpFOCx/plMyGBuRFTCnZMMKh
 Yc8QVDJIRGJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEg3CwAKCRABygi3psUI
 JNSOD/9j5hbFls9qcicL2VPhhzVe3osxN/UrGFIGMw7IHCf4HaJD0w1gRhXh4HQjyKvvX6ZOwC+
 qkUuhmvEtEZpC4xVYcGOtF849vuzTOW08lbX5Y4bDsqGUqP9fsUDDfMowyP28ife2pSrZZ9AEn9
 JNT63c4k+mIUqZb6C68vu0qhleMZwjYwXZNr3KNIg8HtBEs8TRr2subs7zMShRs5/K9YaM7e/Dy
 76WV9y31DN1Kq3M1W+E/F8BldoP/cCfKuKbIgo3o6j0Jirn2gIS6zUBecbm2pN9SbWM7wDRPo4K
 MbBN8aujAiXcmUdYT9oiCv77pJ5C0N9LU2cV/x+v67Bnyw5JMsrIiLvVTlrUrtGi32wMiEpKbkL
 64GjbuSpaBB+GFvtcrEZ4z4P62IsFLURKMJkwBNi/hEh2o6xxlT89pWPjyi4gXmYZPGj1sSiuAI
 6P9q3tKijX4z2JVx6mZUiSL+Ps3VzxxrPTHKoJfE9SfoEJ9KN0RhDeMiLD55RW2nPjsRssfHMob
 dNe7qR4qZd/RwcFpm/ra059PmWxbJeBzSY/Auhs8Dw0MuJr6Hf6lRUf5w6tvK8qTI/JdcwZjnFN
 ZmfSeSZaZa4clQ1vxK4wZm6uhJFg9y+Oyv6UnZAXzMQQhRDtuR3SD2iEqMnuhwt7/36vK5v++LX
 uycLH/+4NU5eh3A==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_064618_800657_80DF0F9E 
X-CRM114-Status: UNSURE (   9.79  )
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


