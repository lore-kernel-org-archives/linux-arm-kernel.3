Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE920C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 16:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vh1kbOu64C6WU5jzJ5D7MEiwpN2T3eAogGW0MXnKmS0=; b=KBeJBrib+zo+znVBRG3dS0ihSw
	Kh86ZgTqPc2tXSaGtcyEWQyxe05KNlg/9mYl7wkUFdlgsdBqhxF53LW0YZf+ZGwTkrnGYPfVBDSKC
	bwNFgqmeIEMGQ5S0p+rc6aX8J3xqmrGNG1Vl93bRPuKMYYZ2xrqlxsUuXqNBO0zNrkvALue1Kz64P
	dH8jl/Zg1ltLur4Z4XtPBebjMLIXTN/i2Qtj+Uet+wRpPr3OYNC/EoUEHEaPaT6RhjqI5odkzUYh/
	dz0HqLQ6ilFS9MWHA5XfXKVhr3p83hagUJRNtX9mh91Mhhm7fnm6VIpfLTr5xLYUMcbr8jhLbu427
	n1Rsxcew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP22G-00000007VQd-2Z53;
	Tue, 10 Jun 2025 16:41:16 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOzIv-000000071kE-0NTu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 13:46:18 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3122368d7c4so4370764a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 06:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749563176; x=1750167976; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vh1kbOu64C6WU5jzJ5D7MEiwpN2T3eAogGW0MXnKmS0=;
        b=FeVWNTrnNx4JVA7MfHyOGXXC71WZ8HQq83hQ1DMwuGEIzYcuhAePZhKtZ7xA6qmDij
         V8XbSDmpQk+cTildw1pDI5Lv1KV5LfoZOOjiQGPcEkx4oJ1xOI5Dru7+o+DTkj6KAWu6
         xc1ctY89fBMZnfnuVOc5nQuBbRJkrSsARmqWqXHqzlw8Bwn+62bKkakVuD9FGutr8mZh
         EGLqXaTE8OKBNV3acdyxe44jO3q4pJtpunlBCd53jQb1glogM4aht29FADgzLLLNFm68
         wYOaaHR1y8pXf+W6w7fpclE5h4p2x2vze60XPE68mzE1vIICGFgcdJgECDyljQduoTPD
         8IoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749563176; x=1750167976;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vh1kbOu64C6WU5jzJ5D7MEiwpN2T3eAogGW0MXnKmS0=;
        b=cV7udaP3WX7NjJW9tWQcSLmHn0pt8xaYC6fVYGAk0ga4EJvLW+TjNxLdsFhYe5fSvm
         R5cyH9XoyznHks0nzjAwQTvVlrjK/cMwP897jZZW37qwQyJWHNwoFhX68JozxVe5O4ZF
         EnWDaK3q0beDwBQ1D8Q7FU34aHm6yRil+hcMC1WLIMqgOKGEgDoh3nsahoReq8RGK25Y
         4J+JrGuqq5RlvkV7DdF7jUi3UC7uzKmkAzLB6/s7z+HchPMIcTZdYiFxQCC2gS4zG+nD
         HsvNklchvn3Y9+PZBtHURO+bTqox0Kmpf3cQNtvYZowKpa3ccqm6lOdRaivbB5uXHOL2
         QxAA==
X-Forwarded-Encrypted: i=1; AJvYcCXdHkWff+bYtD7O98b/jjTyuOnmN9lrslyWjRaMUUdvPe2qrYcdqitAVVz4CsLd4zrufIJkLLgQ2l/nq6qQSqRf@lists.infradead.org
X-Gm-Message-State: AOJu0YwAYga5nunPUg9DfBFv7+xgh2JXQsky6+zaR1DdkHz+tgESTUly
	9Q56AkJVMTrqgUYKoU5s9ZWC7ijp7TgYWsjLZZB1m/DjNnjuV/VBdZS5
X-Gm-Gg: ASbGncv/e5ZBSAn2L0scqGfmMAv+Q0xYak+ErIYsI0Lm931GucG9T3j8nOHUr49fPA+
	EJpL5kthPmCQhIwlYGteDOgPF9J5uz4DnXnX3q/gBO5or+hXownec7UdT+c4q8m3xyIeyI2usH/
	F5cKAEvhq4PhAJJeBbkb9nmRHZv9IHCZ9EclBsLReTzHvMU3WpBUCx/tlddKR4k4c53bXacY2g5
	Y59zF8+uC+httLU0ZefhFHHzcFz3bxR+8G5qmMbRgUsCYyDGFVTrTPG+b96K+zl1qbYVLuGmEzs
	XUnTLLZNu0rJ73D8ancVi8eV/6qm+CleQV0a8cRsm/0Sqnc7GeG6ZNmmtj+tons9
X-Google-Smtp-Source: AGHT+IGKpN090KCfuM4mnhhtjjx4+d+Tq5NKBbKuG74j3lXwde35ZZB9mrUEoykhE/YnRjDMBlrFhA==
X-Received: by 2002:a17:90b:3a8b:b0:2ee:6d08:7936 with SMTP id 98e67ed59e1d1-3134740f5d7mr23396206a91.20.1749563176255;
        Tue, 10 Jun 2025 06:46:16 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-31349f32df7sm7288522a91.15.2025.06.10.06.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:46:15 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 10 Jun 2025 21:45:26 +0800
Subject: [PATCH v2 7/9] arm64: dts: apple: t8010: Add I2C nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-i2c-no-t2-v2-7-a5a71080fba9@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3035; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=kHaRIkP/PArXXOw9EiKwVTXYiFfFFiSty0mPZ+ZDpAU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoSDcMxLD7nGI22hDjQFxRWZzZu4ED+wy+20gi7
 nJY6d2bfzOJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEg3DAAKCRABygi3psUI
 JKKMD/9l+BcRDkJlprO7jUu2w1Fwj8eZphRCaqzV3wsKr/1yirY4hNGGGR+eeO/YxQzVFUnqflQ
 i+23tkqqCBpqHg1tNuzu0Vgo8i0XDERjD7kXajgAjL1VsqJ6w77wdeNfhdRN3wFswvBA2OMu/T8
 SRbxydQHragP2ndPYLt7xhSizJ1h1CTxbALWvr3lPZoAgXOs/oPL4UqwzgpUZI87O5eRwKpDCZc
 WutOcvVMWnThfRDW4DkbkEA4qw5aOHsDkGnSwDsXCr3LwR+WwnjfVU44xigY4lravtsJXOdSLm+
 M4gD7OZhgEa2QpRDz5E/Wtwlj8bMOSlQfcLmeyB+arHes9WDKyB+QcFuEIStT7WpDZJCSG8wP39
 T8fjv/K4NEz68N8OylVP3BB4oOWru6+t79WdaK/GYSPAkp5iWk7MxUhg2bJp14zqPEQpX63RHcQ
 4ex7hzDgy8m89C74seoPbKqUtKVtk7+3mBDzoWKmk8qkL3s3jQgHSo3MXZyC3LMthIj/LVcKY4a
 039WbOeaQ2RiNEZebCdLhOZ5UcDF6mbbG9I0lRl2ExHyzIm3N54+Q6Gl9DVLtBiulPPfrK9pQlC
 FFaNvYZ+AxZgPABzpUwDJ8jwqeLj+ElYK2k2dcBbbmSFffc4pk3KFP2piuLohlDHG8RdMDKcKzt
 vMNdfj5xoWXtPjA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_064617_122158_98BBF95E 
X-CRM114-Status: UNSURE (   9.80  )
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

Add I2C nodes for Apple A10 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8010.dtsi | 76 ++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8010.dtsi b/arch/arm64/boot/dts/apple/t8010.dtsi
index b961d4f65bc379da3b215ca76d5f68691df06f4d..522b3896aa87eb290dc831cbbf2cc8e593844097 100644
--- a/arch/arm64/boot/dts/apple/t8010.dtsi
+++ b/arch/arm64/boot/dts/apple/t8010.dtsi
@@ -164,6 +164,62 @@ serial0: serial@20a0c0000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@20a110000 {
+			compatible = "apple,t8010-i2c", "apple,i2c";
+			reg = <0x2 0x0a110000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 232 IRQ_TYPE_LEVEL_HIGH>;
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
+			interrupts = <AIC_IRQ 233 IRQ_TYPE_LEVEL_HIGH>;
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
+			interrupts = <AIC_IRQ 234 IRQ_TYPE_LEVEL_HIGH>;
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
+			interrupts = <AIC_IRQ 235 IRQ_TYPE_LEVEL_HIGH>;
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
@@ -207,6 +263,26 @@ pinctrl_ap: pinctrl@20f100000 {
 				     <AIC_IRQ 46 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 47 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 48 IRQ_TYPE_LEVEL_HIGH>;
+
+			i2c0_pins: i2c0-pins {
+				pinmux = <APPLE_PINMUX(197, 1)>,
+					 <APPLE_PINMUX(196, 1)>;
+			};
+
+			i2c1_pins: i2c1-pins {
+				pinmux = <APPLE_PINMUX(40, 1)>,
+					 <APPLE_PINMUX(39, 1)>;
+			};
+
+			i2c2_pins: i2c2-pins {
+				pinmux = <APPLE_PINMUX(132, 1)>,
+					 <APPLE_PINMUX(133, 1)>;
+			};
+
+			i2c3_pins: i2c3-pins {
+				pinmux = <APPLE_PINMUX(41, 1)>,
+					 <APPLE_PINMUX(42, 1)>;
+			};
 		};
 
 		pinctrl_aop: pinctrl@2100f0000 {

-- 
2.49.0


