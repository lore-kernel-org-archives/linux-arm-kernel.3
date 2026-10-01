Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABEAACA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 07:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KjOU7YARtrXAbkjxgoW/D83MupO/fBHcHqOARUheMbc=; b=wqkf+XykTcJkteb9ScT+u0KZFo
	0MCKAZ3yOfUU2B14V6LBgzfrQC2IMJMAYDpVnPwmDz2YqqHMAMKXUmZjpJMeH47olcNHa7RcWTLlf
	/8WqqJzybNWP4ku8aWuHHnlGzexyzrO7SuJAtFvqptvxa/1IxMrTRWS+X1iafWZVTlMkH73vQ7UGc
	TqOjWeElI0yd6rGRYwfY4TFX17ReCBGPsYGt1mbgS2H0gYksNkRqS/xWlCik8wF8wCaRNr2NQ6rF+
	m13fNd77nYMuDPqvy+OuA/ZJo0DR2vtqiZxM32Gcp0aLHscXdGf5PuEpMb6MSll+T9qwLjp53jMl3
	QRUmil0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBaG-000000083oZ-1556;
	Thu, 01 Oct 2026 07:52:04 +0000
Received: from mail-pz2-x2b.google.com ([2607:f8b0:4864:3b::2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBaE-000000083nd-1pCZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 07:52:03 +0000
Received: by mail-pz2-x2b.google.com with SMTP id d2e1a72fcca58-88098dbba5fso1370896b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 00:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790841121; x=1791445921; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KjOU7YARtrXAbkjxgoW/D83MupO/fBHcHqOARUheMbc=;
        b=WCRT47NPNVtpLNsBgpnpzOuYD3ebm3HJnKjOqCSWBcOOtUNbWJYpYOXw5lzgedt9nZ
         iBkHtJ50jUTJnqh3P1qZCAEtWpa33/9MMC5/tDeGXJQV0empD2ql7Ca+7Vv/dB5on7rL
         73btPU5xZ0ECpnE9apzaCDgUNR5CP1EJojvt06Gm3SSgxiJEQcWaLsP3HKy8MUiegNVb
         azTUoXUJ1a2ZMIIiJijeU5dskH/xAWsO5KYpVNaeZZMfWeoUB500BDLgcSDdEFoXMSGv
         6aEl4NkKVtRHIjgK/zDy5DiiQmZlpp8h861RrMX+70Xn6t+h1sHu9tmwuH7ownxiuOXF
         eQzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790841121; x=1791445921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KjOU7YARtrXAbkjxgoW/D83MupO/fBHcHqOARUheMbc=;
        b=xqauPOGowzkr+h4sT8xEPmA4SJo8Z4ZzHzNPy1lwYKSyDDw0iJUuQiG3cPpoZmRPly
         HE5e0C7WvSlpOtpwgT3P5xmlpLWv1jHcWPCuoZTrtaUrtgJ3qWUK0JzvkkNx8RoZH4Qx
         BKCQ3AILpZqXeVDVA5xzYZxAJGUUq3Vnr0UKiVBnJCYZ34dYUWCxoQUD80FphDoDFCpT
         pwRYE54dPSlRJYefa6WWy1cX+R8D4gVCVW5zrzmTD3cD3oYOxfS5uNUKM0I/W+wlHdfH
         ARaF+6Sqry24hxJt3dWsJTnNxO3yqfrPj1FzPbWLZ7Vdc9ZI9cgirC5Y6/VBwJdsZnzS
         4yzA==
X-Forwarded-Encrypted: i=1; AKwUvByxojM0wqMkhVIR1aYFeZ5cxoybX64h3V7aM0xDtUPcK9shzzjJz8v4qW14/y7cdUp9qubbf+5DAnxU124CgXsB@lists.infradead.org
X-Gm-Message-State: AFuF++kx8KqY3JQNs6v32jH3ZhKWgFXqluxn+r8Qb+psTT0MFHIJRt0q
	anDcftdU32wolSYArK3zY5JOcWHZ742zMoMbpOUQGxbQQE+eMbiubTY9
X-Gm-Gg: AYBFou0BR3v+gQczrRNXPdUS+UCZJqXy6RoiIc0FhkKNzndO4q/FmA3wdL0eoHsoBBh
	ipmNK7mdgoJiEfExX/za38Z7JsVW+xHIw/nUhQTLD30NIusYgdgp2mkwKfiX5mqo20XRlafN6xq
	WztPX9k2ZUQ0EvirQR4YLAq0xjrSyJf8VNYruLfFZd7mh9uJOxAeBjY5h3voLqt3CZqkt6/ug52
	0p5Zt3InZ76bVpq31LHbt9ihho8bkx+6mDZGvB8Z7BokihsceaL7P4BtJHqRmjTSja2VyCwLfFo
	mGjIiSA2iuadJvX8Tom8X9tYBEqaZzFAHKGROWBi3luLtV9YFnqp21A+ks4G3lL27mOKQvy2URo
	+YaKjKTuO3JcbwDI7dah8NdjX4nQUPbWxMICbxgydVvFTslUxCFZpQckQIOJMxaIdyrI5d19aBA
	gOhe9zawNxIA38qJhOp6KfoGOBk/oKLtjlBPjm80HkKiRF41AIu9Bu5ysoRaHC+aD04bcwN41Yu
	4o1bn0TABkczZ4ohYOBeVeGWJ5iKn6KPriuo4o3c9PWKoGLz6G51s7D
X-Received: by 2002:a05:6a00:2301:b0:886:95df:c50c with SMTP id d2e1a72fcca58-887fe5c8dddmr1176734b3a.26.1790841121413;
        Thu, 01 Oct 2026 00:52:01 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88819db440csm666843b3a.60.2026.10.01.00.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 00:52:00 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH v11 3/3] arm64: dts: nuvoton: Add I2C nodes for MA35D1 SoC
Date: Thu,  1 Oct 2026 15:51:01 +0800
Message-Id: <20261001075101.489660-4-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261001075101.489660-1-zychennvt@gmail.com>
References: <20261001075101.489660-1-zychennvt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_005202_487640_469F2AB3 
X-CRM114-Status: GOOD (  11.05  )
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

Add I2C controller nodes to the MA35D1 SoC dtsi file.
Also, enable the I2C2 interface on the MA35D1 SOM board and
configure its pinctrl to allow communication with the onboard
NAU8822 audio codec

Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 20 ++++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 72 +++++++++++++++++++
 2 files changed, 92 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index a029b660e8dc..488567f830a6 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -57,6 +57,18 @@ &clk {
 			   "integer";
 };
 
+&i2c2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c2>;
+
+	nau8822: audio-codec@1a {
+		compatible = "nuvoton,nau8822";
+		reg = <0x1a>;
+		nuvoton,spk-btl;
+	};
+};
+
 &pinctrl {
 	uart-grp {
 		pinctrl_uart0: uart0-pins {
@@ -100,6 +112,14 @@ pinctrl_uart16: uart16-pins {
 			power-source = <1>;
 		};
 	};
+
+	i2c-grp {
+		pinctrl_i2c2: i2c2-pins {
+			nuvoton,pins = <1 8 4>,
+				       <1 9 4>;
+			bias-disable;
+		};
+	};
 };
 
 &uart0 {
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index 7228ad4735b5..28488889f564 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -372,6 +372,78 @@ uart15: serial@407f0000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@40800000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40800000 0x0 0x1000>;
+			interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C0_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C0>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c1: i2c@40810000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40810000 0x0 0x1000>;
+			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C1_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C1>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c2: i2c@40820000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40820000 0x0 0x1000>;
+			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C2_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C2>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c3: i2c@40830000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40830000 0x0 0x1000>;
+			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C3_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C3>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c4: i2c@40840000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40840000 0x0 0x1000>;
+			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C4_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C4>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c5: i2c@40850000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40850000 0x0 0x1000>;
+			interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C5_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C5>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
 		uart16: serial@40880000 {
 			compatible = "nuvoton,ma35d1-uart";
 			reg = <0x0 0x40880000 0x0 0x100>;
-- 
2.34.1


