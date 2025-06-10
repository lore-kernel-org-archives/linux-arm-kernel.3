Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B57C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 16:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fgzxLDD1EDoYAqcznGOnUvDBEtdRSzSN7d1ImoC53nA=; b=ivcP59Kz6g/9MrszLDm+sK8kE3
	ji1elc9DsedpScpD+JO6FQA2ZalzX30UM+byuUvxscqHu91brztSndFhrZ8e1tG1cike4L1t21BUF
	q9uD7De4y1t4VPAj33UhzdzWkBkQ01TjTnp5t8Jb9cPS0iY76mbZWA3IptDTNktx/ruITkKIaraJj
	aCm1L44ulGkmjLQoTJkZBcNvOehXclfV14C/7rBTSm9DJ8N6hq+8TeedA0ZeX0GR8hffRdY23JpXB
	gURB7rMi8w+ZJCtcxZFulf/iStlqxMxxQDGpSCdq0+tubhBZ65p+tZIau5ew5JcZhTZEAkzHzgaUW
	MCwWVYWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1vt-00000007UKt-0GBV;
	Tue, 10 Jun 2025 16:34:41 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOzIf-000000071dw-3VYT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 13:46:02 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-b2f603b0ef6so2602984a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 06:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749563161; x=1750167961; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fgzxLDD1EDoYAqcznGOnUvDBEtdRSzSN7d1ImoC53nA=;
        b=JcuGxcIc8r8vOvcaMXq3ImEcj5xUDnBUaJr264G/zXrnPZwihdgi7z74ThJfr8I3dx
         4U9Kqx09YYZIQFXkjaoR7cSZOeFYyxtzTQqBYDYGaZ7tm1UxAGNCN920pO5kX2CBVy7l
         TUkvSSx1CbRxxoSDBNzSGx1WUefoH5Z5AQTJ6JfJMjhESdK5RmCmIpDkv75VL8jjzzI7
         agRtERWj2N1GCTX9YiQkcRFd9vDfyGMR9ZeD0metUZAWmOqNGF2sHR1h++DwCVUkNG6U
         BX7AtuRZ4+E42P0JuHuQLnj9cuUeWZ+vLw3bnDJlXmWIjOBFNk7aFle9CJBUK8zFcqkO
         qfeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749563161; x=1750167961;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fgzxLDD1EDoYAqcznGOnUvDBEtdRSzSN7d1ImoC53nA=;
        b=SLPzJrZlPT7LzkE3GItwMeFR5UZ5CRTY5HPuTwLTF55T53ozsJCmVd1H3x9EkL5LkG
         v1p7SYjNJ6mOvR+Wmy0/jygdcgD/acuWpIdnqgwuw7lHafppeskNA1yaZkylO8tRB7aZ
         QDmAl9sDQbAKmzNK+Btm1BL8w7S8CM4eK2UzF5VMfJ/8b9/BWr3MIxXKGeTzo8bVcuUN
         QcbHUC8D9NbZAU7Rfm4BfhisjUCP8D4HL+RwqyrL5rsZWmAAqRC7PYuxB3acj3cc3X8d
         fKOMqN8KYLIDOk6Q7uHkqkD7tGkaZ0ryUaQQkjGKBOsQJ6MjMdxP1dq2vlC5BTqOYK1O
         Gvmw==
X-Forwarded-Encrypted: i=1; AJvYcCU6wC/Pqc+NuyDcChdnaMuZx2/tpmPBUfsmnZxZtQ/DfnvcppGewyxsuJBSb+O/6BNf3vEnJfAoNaKItZcIqEwD@lists.infradead.org
X-Gm-Message-State: AOJu0YwTR7//AYLIz538F5/oUGdL+HJQib7O/LikSkhsgK2r/8+YKkrz
	bqrjQzUsJiuvKUexluTkLslIxRHbi0yQWR8vdfALhjxwHuWsTOWjtWWd
X-Gm-Gg: ASbGncvVzPg9XbDVFGEtxYGJXQ1vrgtiwGzIOs9S8T/6beV2zwiGKFu1Ptwgm3zKssV
	3LrtXyb2NQoxklwpmO0C0tPPterVzwszqQ5WTMfBYVf/GYVdboo4gEC20jdhpD0BQ3Tf97hFXWe
	tPW83ipyjqCdrXREJZfqvViRJTOjOvn/GSqEnaz+T3BxWodqrM3Q3J4AdNUybI0mPccNvrFBOpo
	2irE1scj/ehJGI5HywJLZKtu/xOfyUQ/Wyp6z8sEWeBWVS5dDIBnEc+Lj6Id9Fjxh2SaN80ci27
	WQ6h6qE6xnX5tCXix69QrG2h9/F7eQTv7bakNmjELyM/Yp707fn+OxxWcrP3SBBT88BavpUQ0Q0
	=
X-Google-Smtp-Source: AGHT+IGK3m/b8ShwDnwkYQZ/3bSby/VP+fZbQmhnnLuecG6P6WZWJdU842YzUVSnJPIZkmbsxKKkZA==
X-Received: by 2002:a17:90b:1d92:b0:311:ff02:3fcc with SMTP id 98e67ed59e1d1-313472e8c90mr26139241a91.14.1749563160859;
        Tue, 10 Jun 2025 06:46:00 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-31349f32df7sm7288522a91.15.2025.06.10.06.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:46:00 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 10 Jun 2025 21:45:21 +0800
Subject: [PATCH v2 2/9] arm64: dts: apple: s5l8960x: Add I2C nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-i2c-no-t2-v2-2-a5a71080fba9@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3028; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=UtUXsBApERv0HSkBqesHqqsf4hnDJMVAjhLKU618wUk=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoSDcLg9pYRCfUltZiRuv+/WgyjKGV8lBNWbqxY
 qU16qGuOmCJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEg3CwAKCRABygi3psUI
 JGwLD/9PEKpo3DwC+3IfppSQTT4jUzKdpJwc1f0qRO2CialwUZjPjxG6RTj7G6qIJ/BcwTkM3U/
 TvVZzjvuu1FsjZPlXli/Ma+g0x3z+jfT+dFmQxy2fjayUhq6HQEY7rlC5iQqzsWqvaDNuZjSgeO
 IQb9jFfizSAN9JyIyLmovJ2txQUq3kA4sEhY9NBp304PF1Td/7YgK/L2Oj1sylYc/V4ISBLIMYr
 CiXAybU0AcimfFgB5VPZ2TY6eLL6Jk6oWXjbJJnWo2kfWiZ59gyaZdqCx25/w+rUMNgFzdivyKl
 TF+3KYE7bxmSAAXrwAfLNTMbd3LhBf/APsTCLptDM65pxnIxU8ptghByHb/C2gjaJie6OSSS3ta
 7Wk4bxqhdhKC075OlJI/HrCYGnVJ5A+wBlgWcjLltJiIwpmEDb6FG9HOO+n5Nx1/Gpsgws9GZi6
 Pi2E6K6AK20xW9zs8Fu8bCnh/lYvAh/t4/TUoNAyHU87UivyICY+76Orn880MS6yldl/X4I2qmg
 hXRZYwQU+TcCLKb1Noxp16e1s86WfohCE9znu9EUqh+M2WP2B2lw0CJrz3UHG48H62Z4UCxevAX
 nMkO2coB90vplqyKgq2WGptBwkrANOyixxNJzaYvZteq8TJsXiyUUTTBPd06YkU2QagRUeShk0d
 cUqN1Ns1Ty98yUA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_064601_868413_4AAD1303 
X-CRM114-Status: GOOD (  10.21  )
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

Add I2C nodes for Apple A7 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s5l8960x.dtsi | 76 +++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s5l8960x.dtsi b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
index 5b5175d6978c45052ded495fc0d18ee3a8fbfdcb..462ffdd348fc893d8e1d597b11d063dc5f88bdf3 100644
--- a/arch/arm64/boot/dts/apple/s5l8960x.dtsi
+++ b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
@@ -89,6 +89,62 @@ serial0: serial@20a0a0000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@20a110000 {
+			compatible = "apple,s5l8960x-i2c", "apple,i2c";
+			reg = <0x2 0x0a110000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 154 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c0_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@20a111000 {
+			compatible = "apple,s5l8960x-i2c", "apple,i2c";
+			reg = <0x2 0x0a111000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 155 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c1_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@20a112000 {
+			compatible = "apple,s5l8960x-i2c", "apple,i2c";
+			reg = <0x2 0x0a112000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 156 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c2_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@20a113000 {
+			compatible = "apple,s5l8960x-i2c", "apple,i2c";
+			reg = <0x2 0x0a113000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 157 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c3_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		pmgr: power-management@20e000000 {
 			compatible = "apple,s5l8960x-pmgr", "apple,pmgr", "syscon", "simple-mfd";
 			#address-cells = <1>;
@@ -140,6 +196,26 @@ pinctrl: pinctrl@20e300000 {
 				     <AIC_IRQ 112 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 113 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 114 IRQ_TYPE_LEVEL_HIGH>;
+
+			i2c0_pins: i2c0-pins {
+				pinmux = <APPLE_PINMUX(81, 1)>,
+					 <APPLE_PINMUX(80, 1)>;
+			};
+
+			i2c1_pins: i2c1-pins {
+				pinmux = <APPLE_PINMUX(83, 1)>,
+					 <APPLE_PINMUX(82, 1)>;
+			};
+
+			i2c2_pins: i2c2-pins {
+				pinmux = <APPLE_PINMUX(101, 1)>,
+					 <APPLE_PINMUX(100, 1)>;
+			};
+
+			i2c3_pins: i2c3-pins {
+				pinmux = <APPLE_PINMUX(172, 1)>,
+					 <APPLE_PINMUX(171, 1)>;
+			};
 		};
 	};
 

-- 
2.49.0


