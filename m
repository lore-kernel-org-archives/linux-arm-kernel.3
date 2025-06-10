Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D141CC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 16:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/sMFXHUz8KDvmIU3TuGc+vP482++/FCK0k2Er/8oQMU=; b=p+wzWm55jLwrkUVvrmhui/wEct
	hzcFYyt/f3pI1LpymDGidKfLD4ndXAslfMzdDmzC3ZI1F5qkYSynbuCCuFuFOr+qQHAHon0QMM06P
	6B7CPpwZpXAhltQIYdwrLNCr5WX9c41l0zOrdsjeH1iewxK60js0YNO2b031FZqmipuJNCFuqz8aE
	PpZd/k8kI9ZJptu7QdLgxC2I27sgVwe+p4aGZlh981vLvyBACNvJp1oSLn8yYQsMpIRERFh7XzDk6
	hyO1ZL/cVMvXw8/e1Z0tPsFrOf+MZHKi3CyQHvyJNwxqHBOiHCFyQT9mrvjoDOjKfkVD4h1YE/yTN
	OOuYmo/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP26W-00000007WG1-0Amj;
	Tue, 10 Jun 2025 16:45:40 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOzIy-000000071lQ-09Gz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 13:46:21 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-af51596da56so3813479a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 06:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749563179; x=1750167979; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/sMFXHUz8KDvmIU3TuGc+vP482++/FCK0k2Er/8oQMU=;
        b=O9oJBbzFMp0gyHdGqk4CAuKAqh6KWJmuMNOGWgG275YveN810/34na25G1lL8lXPM4
         iYHlee0jEjQd2nau7L88qLujsc7yI8JM5V7i6RhwEdsZ32nkyq+ZL7SAJz8ZNx+mJBO/
         1HWfY8Ds1EMx32T5MPVfELjFEIKvD8DfdAi6XOp0Bb2BJ/Q9JkGtCVE4lTxvZZY1HQtW
         a3zIe+NKy0MyTTgGxwK5QtrE0gz9Fs5QPrmjo1WV7SidYTmNUtRbF292nZ25pLzzPYCm
         pe4I1xFEQ0ozmL19vmNjZ2+gRd5ICYQvXGdWwXgQiKRBc/FQDk0IHcRzThvm1Ke3+LUI
         DVKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749563179; x=1750167979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/sMFXHUz8KDvmIU3TuGc+vP482++/FCK0k2Er/8oQMU=;
        b=mLpgP3upqGetanpnMuFdiidg93Lj9yP1IVMUvpyh107Mo/EIsKFgwW/cit1UVZU9tz
         MUZ5LYFwqkBCzgT3LHNQyV5LUj+z+3soJZIR59tbn31Z+dVHXQ57GJ2jsT12grdfIART
         kbpTL2s6GM4kA5V9k81lCsVAfN12LMTjasnetMqqa0C0N4RML62Mad5QDi0GGDXq7Q7q
         Hlxe19cy2V3uRpej8tWQZc5wCh1mG3cP6ZzXHWOuadKNShF2Ezf1ivRjax6/O1BpIv/y
         nLVG5rwXaeQJkpsfqQK86MXnhM8RrSJ2ngfvfCmf9wXRPRZUhaPEsKQBmZqG+HYPdUQd
         xZmw==
X-Forwarded-Encrypted: i=1; AJvYcCWR1XX4JyaWhaATPfqldwE/Q/cKGXMXdwtzmtIq1a2wk1i8Rbo60AFm41pkzntDYfDcz1tOXaZo4v+vke1Nu0t4@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd5yG/os7aaApSV20mmaLz91oUXQoFl1REtfwkgPqty7AOD4kC
	YONcOFrh55kZy2Vkh3EBBxoc6IkEKbAjGDkDTM5k4/2DUpd1NeNe+Vqs
X-Gm-Gg: ASbGncvn+d5Jlyu+Cd9OUQNf4FcGSBBXiPp7Wk8QXyWtpf71/BljueQ32NlMIOxnKgP
	DqGR/I+sP+L3po12wJJ47zaXinyAO64kadRUqd5OZPymBvZMZWAsmBbDbYR48sGTWRmoi3yCvag
	Ok5+VAh7e54EyB1W33WCmuDbinqlkk5BNUm9GvRedImV9Sdt1/Me4WB4WYt/yegKMjiiwMKQSQV
	8utMXgKzxSdU9fHF2tOfUSxBBjR/uFPjG6jg5uHXN0+PJ0B9ITy5wZGvwSslVsM5r7f7C6ABCNQ
	iUVg0NFg4r578zBcbpsK03QcyNYDo8anlVjd0bOS963Ckan/20FOP384l8ZSTtwITL8W3kR3BDA
	=
X-Google-Smtp-Source: AGHT+IFctLqPBuLJF6Nxsz5V/0JaXeCXOK3nPmNtUEuY/xg3IxZOthUn0avC8QEHugYTj8Kz3nPtCg==
X-Received: by 2002:a17:90b:2541:b0:311:f05b:869b with SMTP id 98e67ed59e1d1-31347798ac5mr23723759a91.30.1749563179250;
        Tue, 10 Jun 2025 06:46:19 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-31349f32df7sm7288522a91.15.2025.06.10.06.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:46:18 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 10 Jun 2025 21:45:27 +0800
Subject: [PATCH v2 8/9] arm64: dts: apple: t8011: Add I2C nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-i2c-no-t2-v2-8-a5a71080fba9@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3038; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=v7W7ZvqXSh/jiGyI0EQo6XvMCTg7kLe+e7s4TGkVXGY=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoSDcMsQdFKiLqPwEA1tJnzjRoKFEp0AQi1eP3z
 wi6m1nq0HSJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEg3DAAKCRABygi3psUI
 JEoWEACte2synddwWI8BNIKdj+WoQ/wrydjezbkYaP+CKwGuQvmTW7iQArURwkFLc9eqT+XOlwk
 d7qSM39EiXpQIxp4DGk+TWCQUpYlnyW6eD+uyUShC6zPbvRR/HkNIXnvNqP3m+mAPWUPZ3dA0tH
 E/Ir4lOV4idUgIr5kotrt/kli8Ot1bDi8PKWw6COcNvWIlcwB81ZDgmSBRNoulVcCh6FnSDmz4k
 KrVKZum3yekd1dLiHBbbeS5Ph77/sR0mFk3Q5c0gOV/bPxI+syGUMgp1VQo8OQdhs7HJvTHpwbG
 QGe88RlEyRjxFIx8gQoy42tKE2sNcHMgczf1F45MkRaVJON6mIJ+hqw8R6iNOCjeAFGvniaVZkj
 6Kzo39oQJd05no+mYMtasdjxbS5U0nSEOODdRCgKiC8bmV/RoMRsAG8O5CbXAAx7qWQmP+J+FUa
 TkW5qG1upQKoUunNXM2cwZKKRONCwCmCxTTMqrroVEPgi1a0vv2uJZyuqbUxlSd7qAGV4HejRaC
 8YntqXNp3i/pbHSe42+5VqOqJ7/2aq0vjQoF69Yi/wRZtn2DNrAeVw5ZkEriw10ea1vbE8hs2xN
 ACc6JPZ8QhGLyZmzqMhzlU3sBUYaNp5SgZUhS6M7rxmezhZE/+dnYmtA1Tx8mQrLmchz+QjKZTt
 KtUhYdoSP/vhqaQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_064620_067464_8AB1BA88 
X-CRM114-Status: UNSURE (   9.81  )
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

Add I2C nodes for Apple A10X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8011.dtsi | 76 ++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8011.dtsi b/arch/arm64/boot/dts/apple/t8011.dtsi
index 974f78cc77cfe28d3c26a52a292b643172d8f5bd..039aa4d1e887625e7b6ad789bfd9aa032dc58d01 100644
--- a/arch/arm64/boot/dts/apple/t8011.dtsi
+++ b/arch/arm64/boot/dts/apple/t8011.dtsi
@@ -168,6 +168,62 @@ serial0: serial@20a0c0000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@20a110000 {
+			compatible = "apple,t8010-i2c", "apple,i2c";
+			reg = <0x2 0x0a110000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 230 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c0_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@20a111000 {
+			compatible = "apple,t8010-i2c", "apple,i2c";
+			reg = <0x2 0x0a111000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 231 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c1_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@20a112000 {
+			compatible = "apple,t8010-i2c", "apple,i2c";
+			reg = <0x2 0x0a112000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 232 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c2_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@20a113000 {
+			compatible = "apple,t8010-i2c", "apple,i2c";
+			reg = <0x2 0x0a113000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 233 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c3_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		pmgr: power-management@20e000000 {
 			compatible = "apple,t8010-pmgr", "apple,pmgr", "syscon", "simple-mfd";
 			#address-cells = <1>;
@@ -204,6 +260,26 @@ pinctrl_ap: pinctrl@20f100000 {
 				     <AIC_IRQ 46 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 47 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 48 IRQ_TYPE_LEVEL_HIGH>;
+
+			i2c0_pins: i2c0-pins {
+				pinmux = <APPLE_PINMUX(211, 1)>,
+					 <APPLE_PINMUX(210, 1)>;
+			};
+
+			i2c1_pins: i2c1-pins {
+				pinmux = <APPLE_PINMUX(156, 1)>,
+					 <APPLE_PINMUX(155, 1)>;
+			};
+
+			i2c2_pins: i2c2-pins {
+				pinmux = <APPLE_PINMUX(58, 1)>,
+					 <APPLE_PINMUX(57, 1)>;
+			};
+
+			i2c3_pins: i2c3-pins {
+				pinmux = <APPLE_PINMUX(158, 1)>,
+					 <APPLE_PINMUX(157, 1)>;
+			};
 		};
 
 		pinctrl_aop: pinctrl@2100f0000 {

-- 
2.49.0


