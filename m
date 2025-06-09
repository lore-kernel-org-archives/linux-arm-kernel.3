Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7487C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 15:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DRQckTsTT83xbLwigtiX4m5LksrcbOPbtVMh/FhriaY=; b=cpFGL0bOpsAj1bvqCVQn7H6qCI
	JTQw7eA6myOLK4pOFKTR6MGgyFLiAbNa8aqEeMO0b58TXiAGv9Q1e6Gq6u7/YH0SkJz7wCeWRFAmg
	aLLlz2WbI2oHPXnhJdhRiWKq+nKabTS+ivjjXuhbyopHXJagb/s390aYf1QtWQkLyyZRSebwqHjYT
	NA6xLOeGVII6nct9Bx+rwt90MD6CbrB7fNa2ur3m7nckXi3G512nkBE85ch3LLS3CxLkANcX73fei
	Vum3ol/vGW4Pk8MaV3ee7A7AE6hK1ZdOVhfw7lCk1JxfNtjGEUzoNoYkaUpwevfTUZjsEM99PUVbZ
	mktk1KaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOeGm-00000004UwQ-0wpB;
	Mon, 09 Jun 2025 15:18:40 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOdxa-00000004REG-08Qd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 14:58:51 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-747fc77ba9eso3194743b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Jun 2025 07:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749481129; x=1750085929; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DRQckTsTT83xbLwigtiX4m5LksrcbOPbtVMh/FhriaY=;
        b=A1UX72zEMnqVs4GW9Xkte1WpFnyNKzc2ad5QBnhLwgw0W2UbsZeBluNrzWgvKRQ1VI
         b9Tg3rF2hwFwXBIOUoXlJtjKqqUZCREIAzvi6fZX0526G0YrYbUMcfzml7/UcL7uOOuc
         r72TtfeYUWOzjsr+1m7o0tbKAjMN3mOYfQpUM9+QjwvpxrgB/WJBenA051cl+PYPKMAy
         cUsAEjaZG71ZPLUYg91EuLL4E/UJ2hY0YSRbsGdpk6Ybpj1rJgd7ertGTf79qbqavaIO
         iE4XJ02hRY70V3Zyk8fSCrhf5LSNzK+JSG7YCW7OrQj22cPGci/dpjDxym3q4k/Nutpo
         FyVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749481129; x=1750085929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DRQckTsTT83xbLwigtiX4m5LksrcbOPbtVMh/FhriaY=;
        b=Jgq08s2AAkbiO3rn+EYzekfPsYf85P2MHfOH8xZfPOOOiZmmTr3ELLsd4Gdyv/LagW
         EpOeooA4coXl7Jyusmk2KHSgY3gxvBBLZfy8dE0i6MbbUm7HOo0xY2QWG0TI8h1qZ7HS
         ZfS2f4UsW6yzYtNACyCNA97n9E8ymvHIkgTj5hkXC5A/BGXSvqyPc+sXUxyWddvpCQex
         oTYAfy/2TQZTSBoWHAONQCr90lCi/qKkFn5SKBD8kil+ym1lrSs97FNSM0DdtkK3gnvh
         SKGqLLMRHlVl7vtjEwj0UzxEedbXf4rUAq3Rr42RdJzGZPE8Fkhh7AQmBOJvIG6AoeAM
         T2uw==
X-Forwarded-Encrypted: i=1; AJvYcCWpzsqfDqbwAU66glcpn2YZZXpXlXmqxnGTYd5x12UK8HpBQlz/6FMtU6wSKN03XUtXCTpyJ5E521WP4oJ0IKor@lists.infradead.org
X-Gm-Message-State: AOJu0YyOV6ywjUiXcLkSXUnBAjUOZgmnVYxWRr50rHBnNLTvF727YZbe
	3gkOwHu5nB+5OuLt5U+kinKpbzTPj01x0TMTfvSNVfJMH//38nqR8umY
X-Gm-Gg: ASbGncuMpMNGdAqa6eEfqdFD/Tuq2Veoq3uTh7WcM68DG70xnLho2xWOcHgGI5er4CD
	Wx3yUDeiJNmGjpFCwHqfQRfKr6cyeEbDo0SgBU8ESw0IRxMopVJ9NSVRzNzdqH5VJwD0sHRyDOA
	i2wG8eSKwediAaUybDsuz/fVuwwcMwwhvnB9v4ePsMHAbus3FugQkUfKksLAcaNfmPNIz2QJqH6
	efKchR41TfOezcNy9WohVyk1Qmqn0DD0w1CvzwSXSyF0Vk8TphV2KtMsGMXvzLCo+eqk2wM1xq5
	lWASzJp200JxD4RUCW0uRiLD2/zqc6nv17uzbNbu51zgVhecAATqMF/j+CSRB1aZ
X-Google-Smtp-Source: AGHT+IEwCZJue9fwcjQonzqN1xhP8vKvIQlVQWXej/FdfQzVhn5ZWjVS9YMp6WNHGbn4p1YNlDhZfA==
X-Received: by 2002:a05:6a20:a108:b0:1f5:6abb:7cbb with SMTP id adf61e73a8af0-21ee25ed279mr16540950637.23.1749481129278;
        Mon, 09 Jun 2025 07:58:49 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2f5ed593ebsm5414182a12.6.2025.06.09.07.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 07:58:48 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 09 Jun 2025 22:56:25 +0800
Subject: [PATCH 8/8] arm64: dts: apple: t8015: Add I2C nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-i2c-no-t2-v1-8-789c4693106f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3029; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=onusbAGTeKZDibm8BvV42Zc7VsUIDMtHO+9C2/7TIY4=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoRvaO8SGlIc2XSE9/A37sHSQIj212EpJz4zTMi
 VwBw/QSObSJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEb2jgAKCRABygi3psUI
 JHD6D/9dYZa9dMbZdgIf9ev4sHn254ePe0v0emWfbCY+2jG4gIQOekixwqsIptjddnqFB8nsOwb
 8i2Bk5DS+DV1n32sdO1+XyCbMTVj4JrLxuyl/kvIE+vE5C7mtREuojjDEIZnkF+TGuxXn3dOpxr
 0Pt8RozEg8JwhkE/p9ZOH9zkqf6U1LmXEUPclnHMBr4F0cGXcWp7DTEk2Mx+Ne8P7QHMZyMraun
 ch+itHCrFsKNIifBY563o+z+Bi300HbeeEp32plusfU1ITJYIqzTvQWHn1gpG3AJ/u0F3ZUUZPp
 6DwMjUDrE+DfN8H4Dih6VD6sPuUYj2XEbLvtjQdhIKz93+mFDl8V1yziDlSgY/z39kYyTq3NhQ9
 LfJQ/99OH0s8dHzNGURS9yLjiYx4u/6VKjCIs9ZNhkywekDRi53f6EOD5pBQ4eWyyN+tempF+Lk
 hrev0lB9UICGBbA6sDiLLEDiQe3Qp/X1r4wRk1VrXVAnZkn+6k1pmox4aoSvHR8M/yhdIIUViAt
 L1u2ZQf8D7x9DbXjM0uideOf5mpvS29ES2nrYHJZQ2FiDgbWHfGnkUzVqs789stBdhUZUhjhkUW
 KQMh5BTyf1SD3L5DCvuAu3T8eudi3GARzVKqfdk9xJtaDTpSgKwl7jWdwEXh9D/I9WtMEMyJPsp
 yZ3mXkRSBcRlxmQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_075850_078250_545CE461 
X-CRM114-Status: UNSURE (   9.45  )
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

Add I2C nodes for Apple A11 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8015.dtsi | 76 ++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8015.dtsi b/arch/arm64/boot/dts/apple/t8015.dtsi
index 12acf8fc8bc6bcde6b11773cadd97e9ee115f510..e002ecee339013194537910db2168c143ab3d00a 100644
--- a/arch/arm64/boot/dts/apple/t8015.dtsi
+++ b/arch/arm64/boot/dts/apple/t8015.dtsi
@@ -265,6 +265,62 @@ cpufreq_p: performance-controller@208ea0000 {
 			#performance-domain-cells = <0>;
 		};
 
+		i2c0: i2c@22e200000 {
+			compatible = "apple,t8015-i2c", "apple,i2c";
+			reg = <0x2 0x2e200000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 304 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c0_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@22e204000 {
+			compatible = "apple,t8015-i2c", "apple,i2c";
+			reg = <0x2 0x2e204000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 305 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c1_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@22e208000 {
+			compatible = "apple,t8015-i2c", "apple,i2c";
+			reg = <0x2 0x2e208000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 306 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c2_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@22e20c000 {
+			compatible = "apple,t8015-i2c", "apple,i2c";
+			reg = <0x2 0x2e20c000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 307 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c3_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		serial0: serial@22e600000 {
 			compatible = "apple,s5l-uart";
 			reg = <0x2 0x2e600000 0x0 0x4000>;
@@ -321,6 +377,26 @@ pinctrl_ap: pinctrl@233100000 {
 				     <AIC_IRQ 54 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 55 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 56 IRQ_TYPE_LEVEL_HIGH>;
+
+			i2c0_pins: i2c0-pins {
+				pinmux = <APPLE_PINMUX(73, 1)>,
+					 <APPLE_PINMUX(72, 1)>;
+			};
+
+			i2c1_pins: i2c1-pins {
+				pinmux = <APPLE_PINMUX(182, 1)>,
+					 <APPLE_PINMUX(181, 1)>;
+			};
+
+			i2c2_pins: i2c2-pins {
+				pinmux = <APPLE_PINMUX(4, 1)>,
+					 <APPLE_PINMUX(3, 1)>;
+			};
+
+			i2c3_pins: i2c3-pins {
+				pinmux = <APPLE_PINMUX(184, 1)>,
+					 <APPLE_PINMUX(183, 1)>;
+			};
 		};
 
 		pinctrl_aop: pinctrl@2340f0000 {

-- 
2.49.0


