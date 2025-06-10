Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86749C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 16:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yAg1xxPrByLVXS5zqSSsIze8Df8Cn+rlbuQoqH4AjLQ=; b=KMLrB4MweWWlSza7hmxMLT+uYI
	HZmY4WWXutYDIpVg+UHSYcDV11YAo0PdDIRaandYJC9Ydyx7bCVJePBrnFMuF4BAVSI0RYm/ArgB7
	//5i/ByIDnkoTxRzMxlcgX7VyBlVUOQ+G4OJHqe0TH6IKW1E4O/1Js2x3YIm/ypW91qJxQuk5EpX8
	lSjI0oOjIKutCYdnI3vtic4S4b8q7rnQEiMQIWkh+BIP+bJFx+KMhLEG8J0Fe5kF3H/IMUo378dth
	EwrbrAYxtP+E+RtJWrK0M15/oTJ9sSBxt04HfdOGfzLZdKFa3xnUru9brUKgoSSg1yBtyawfVVxLv
	oXTlQv4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP28d-00000007Waj-3HXS;
	Tue, 10 Jun 2025 16:47:51 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOzJ0-000000071lv-0XI3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 13:46:23 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-4a58ba6c945so91132231cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 06:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749563181; x=1750167981; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yAg1xxPrByLVXS5zqSSsIze8Df8Cn+rlbuQoqH4AjLQ=;
        b=ZAXklXrw+w4QxD1ivFDEVXiT/ZhLusWdUq+xH1BDMl39bZad5RtyoD/vJpytSY4MYq
         +7b4cP/lLCy1NRUO88zYkY3T7KvbCPxmXCM+KzA7AS3fGvbZeXEW8X7hPmerbeA4BFgT
         +QhcVjse+0gkNo8WQv8hOUReKcwhK0NS0aPZDjhrixlJ/asDokEUJaAOh+mHz/mmfL3I
         w3OyncALjqmD3J+WrIzBgNxBPE/WVrNBqzLXW2tZAA2wpAmkZehUA181oPY1hUlnnUbw
         8bXoRamCXnVpcVreRt6FVyj4e1RIwlJL7eNPhHrKVPKKsp+SO/EvGoeyZ+CXCzFs2jaZ
         R6Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749563181; x=1750167981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yAg1xxPrByLVXS5zqSSsIze8Df8Cn+rlbuQoqH4AjLQ=;
        b=kzGxVGbiS1XtkL8KQXu+iEGlukDu94jqoBxNaJ/B8qFh9FsBmiLogsi9us56BPWZZJ
         ZZSqwl8iqfs0mCZuTJ0NfhLBA0T74Mkf0QP3SC7RtecQAvizPtTo6SMa/jZpRJf7qFlZ
         0QFElLym4VYckQs+u891P90Ay3clnF0vsBoa6ndhGxNkNXQaw4M2L3ezCSU/9olUKv8/
         taep/ao0Stk95SV9CYGNPUj9EQbTXHma7wSdBwqLoRnezuGlgfD6lh9VZlwff9fqO+Zu
         3ebziBnHtBBiyqJcmeyebz3w0Z/1wadfq2SSZ77f5KrsJEQtdQTgp/zZdep1Ggzp8dO5
         gwAg==
X-Forwarded-Encrypted: i=1; AJvYcCU6kNsVpxDUYlK9cAnXB1jVo1dHoldiHrKfYZHgPiYkvhWaCS7sasFtbCuQ3JaQPnWNaizaT92sR2a+ThBHqsQR@lists.infradead.org
X-Gm-Message-State: AOJu0YxJY/Vz8uWUgmsQMSAa5W81yfnD/8D+FgEbY1yabwlmKmLJW3uA
	jiSFYtYvrSFRckjWZP4PY7bSGH9elVNK/vPB6dsgLgaGo2JpeIr5FcRgKPJZFg==
X-Gm-Gg: ASbGncvttNN0aRb5sers9sKON3Q707eqQU4y36J4me6AigDBKcjf7a7SMTYMZBOWocg
	bjxTQkR+NLfpzApev6zmC8SVJXGS99N04VsnR/aUj3VRmP3wVxbzFNFd8rVqvSLJCW0YpFN5i8n
	ijEra5GYDeYSfxwTqxYHGFwL7TnY2yiz3b/QHq5yGLf7hU9BUQLoZFsxZ1vlNfscIdNhuBR+geq
	k99LRrpvmXggwtZfTAwlmiflQ2IqyVcswmE6yEKyYkrj02MzEIYEqh+qHXIfObv+/MYqY/6sLum
	KpR32OTlugVAr8GpBdF+/JEzJNnqD/Z5BdWeRyx98xOf7B/HsdgnIb5ddNcxSpDg
X-Google-Smtp-Source: AGHT+IEErOXdJp9b1ehODUuVTcmCLwbggBz4Hhy6NCk3Mi2gxJ4D4hn5livuiXenvHI0hDtdlcUZ0w==
X-Received: by 2002:a17:90b:57ce:b0:312:e51c:af67 with SMTP id 98e67ed59e1d1-313472c05e1mr24265831a91.1.1749563170277;
        Tue, 10 Jun 2025 06:46:10 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-31349f32df7sm7288522a91.15.2025.06.10.06.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:46:09 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 10 Jun 2025 21:45:24 +0800
Subject: [PATCH v2 5/9] arm64: dts: apple: s800-0-3: Add I2C nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-i2c-no-t2-v2-5-a5a71080fba9@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2705; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=K2/pnHaMI2yTXkNfn6PYNYe6qBt38rxRGGJx2uQPPho=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoSDcM9irOxkkAottjpevWGk8w0PrnT8fx+059I
 6sxARmdDx2JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEg3DAAKCRABygi3psUI
 JJl8D/9urrrpfnMCfp+tl2m2kKQnPNRWCuzdFXYshv0u/LseKybJgkEhi5ql57t+VH7aKl/mSxN
 49cKt8hX7s7BORwKajqFa1N6bf6UAWoRA44WHLFWCDcyBvZwQYQ+nqDF43v7pbI5GGDQH4C/U3E
 3Ik736Z6kIkz4HupXdQtChqH7ps/gFDvxaEfD/eajKjumQRQFIAc2d4oMowHrgTDzZa0TaVpa7W
 dOy18Vq5e2XSL6sq5XCv8h9MvcbZMh0/95GsavBTfL8VLUtqXN4n0A1VgQeMX+/BavsAz1sfM7G
 3Zeoc+0Dn94Qp+4ZvJ4ksExWJt9VzACO94ng+OJgEO5B8K32XfV2jgfTIidr3rTUIfRu64F/WLp
 T4idufeqgDWThTJ3/n31bs5hq2+8iskYGVepB9BfSwmK+gZ8wGAWSmTYD0RR/S+kk08GF6WZ4T1
 xjZVWjTbPrAZ10rzEKx1VJl7r7sGF5AXaxfcbcJhQmBc8YNLw73Y5ruD6avF2o2JYWMZZUaY6Cf
 IEEHG2fXuIsc0FtPXfTMZmKhVB1/i/95qwNvHAatZ5VwKS2e8cGFZNK9o83uR/cehflARb5TUC7
 zeSnT+dNhWlaPXS9KEEVOZHcYNcf8DPAXXJDrMFGmp+MisJwPy5t2/lX3zGVW9crh9bi8k2tFZC
 RL32y+S1Z2yYaPQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_064622_163861_9D120AFD 
X-CRM114-Status: GOOD (  11.77  )
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

Add I2C nodes for Apple A9 SoC.

There is actually an i2c3 on this SoC but the SCL and SDA lines
appears to be not connected and no peripherals are expected to be
connected to it, so there is no node for it.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s800-0-3.dtsi | 57 +++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s800-0-3.dtsi b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
index 09db4ed64054aefe5b8f8298553d87fe5514e81a..bb38662b7d2e0b70e18b6870b706789b1cb242af 100644
--- a/arch/arm64/boot/dts/apple/s800-0-3.dtsi
+++ b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
@@ -88,6 +88,48 @@ serial0: serial@20a0c0000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@20a110000 {
+			compatible = "apple,s8000-i2c", "apple,i2c";
+			reg = <0x2 0x0a110000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 206 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c0_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@20a111000 {
+			compatible = "apple,s8000-i2c", "apple,i2c";
+			reg = <0x2 0x0a111000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 207 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c1_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@20a112000 {
+			compatible = "apple,s8000-i2c", "apple,i2c";
+			reg = <0x2 0x0a112000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 208 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c2_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		pmgr: power-management@20e000000 {
 			compatible = "apple,s8000-pmgr", "apple,pmgr", "syscon", "simple-mfd";
 			#address-cells = <1>;
@@ -131,6 +173,21 @@ pinctrl_ap: pinctrl@20f100000 {
 				     <AIC_IRQ 46 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 47 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 48 IRQ_TYPE_LEVEL_HIGH>;
+
+			i2c0_pins: i2c0-pins {
+				pinmux = <APPLE_PINMUX(46, 1)>,
+					 <APPLE_PINMUX(45, 1)>;
+			};
+
+			i2c1_pins: i2c1-pins {
+				pinmux = <APPLE_PINMUX(115, 1)>,
+					 <APPLE_PINMUX(114, 1)>;
+			};
+
+			i2c2_pins: i2c2-pins {
+				pinmux = <APPLE_PINMUX(23, 1)>,
+					 <APPLE_PINMUX(22, 1)>;
+			};
 		};
 
 		pinctrl_aop: pinctrl@2100f0000 {

-- 
2.49.0


