Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A4F4C44500
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sEbrn8nkx2n3q4opZ/ye+YyaLjCnYU6NuTNhw5Plk0U=; b=PgGFRXDnLt4fN4g0R3blQEXr1i
	O8Gv/Zd5IMSk7LrXEKyfFPf+/TVZCkMY71PcdIruGBpuAZWpTRnSbLZuJcNWucXR6Lft25rk9VOFP
	SxwM2PrjENuCYn3ZGmMMinoRg0Xf7Qr0B/aQ2LzE43tT04Y7aKVRd6cn5aKwsZCHZCbJXfRkRcDdZ
	9oTWpW6ufoyBmZ1+kNDVT2xqXpqejK3JZO0hJbcMi6agpWKRJmEB9Xgc+N8d2yNdbEtVEdxcRlQSC
	ybuLdaBOcLyDHMsrHYrodxcN6VOiqLZOMDZE4BdBUEvr268XRe1D3twdn0xOePthWKW59ntMzLPNB
	HTxzgy7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfQP-0000000ByzM-3TFN;
	Mon, 06 Jul 2026 09:15:37 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfQL-0000000BywQ-3vHN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:15:36 +0000
Received: by mail-pf1-x443.google.com with SMTP id d2e1a72fcca58-845c92bc464so1877659b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 02:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783329333; x=1783934133; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sEbrn8nkx2n3q4opZ/ye+YyaLjCnYU6NuTNhw5Plk0U=;
        b=Yjpt9kafvLKJRSjGzI/mTFfk6v/6a5BZ5daIFM1DKWijbUo6JokY2mFkti2CjguhkG
         PVxjec0onkMoERZrgJyPHDxkgg2b59TH4Lw+C/JM7ItRhiWsgVx5kynmhGoEMQTHqIUS
         6jO+IJOZScsnVJqFjs3X93+VMdlIeLIHwZQPNJqVuVS0/O5OJfq/yPnOJDulofgTXiq7
         JYfY6N5uvPuVnWG9av2IUEAoGDKytz1FeagESNpquu8OVZcKAXGy2AjphCMgx9w6hhfx
         eC8GVaXsiqIEPV4zZyExR4IpmGwTwikzUMNvq3qyowt+ljQAPdif+iwVUoHYcnAj6EZN
         lRwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783329333; x=1783934133;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sEbrn8nkx2n3q4opZ/ye+YyaLjCnYU6NuTNhw5Plk0U=;
        b=sSJEIxD/2hZ6lCn0r2YrQmG+cx7PAB4YtCJfFXvFYbc8D1oz2+cbI5VgwzQsEGrFOV
         qxxo9uWUO3+ukNdHo8TVc7kpcx+Bj12EDqXoZXjIrINKrWhKyZ9E2oXnldleGFHagHxA
         AtmgNmLra3BQRBcYENHkE3abQdpFfMF6ukGK2eUxtbkD2PCs1BuL+FozOwm5wYTLv28M
         4x3GNQAe89RsIRja4x7K4uHR4UYjLcqaxF44ZV93UltrQJeVCB7Unt/M1jan/+q8tYIB
         AR1kr7KIt3a6PiOWu/ORVBgFa+LuIn5JMrFpPr3w+li6dTILOq0Xx31a/0BjMmJgmGHp
         /GSw==
X-Forwarded-Encrypted: i=1; AHgh+RpqqOSNldnVahOzCtxebZF0GDP5qD0vgnvpVTu5+xplVIcCmUTnvKkusV4Ehuudcf9bC4wjasRKjq04/YTj8hk0@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+dMy3sZ+vSpTw5I8BQjVnMGCWJ4QpPcO2GsoRvjMxFAy+NYL6
	dRR1dyZoyq/lyEj6CQrjWK/LELZJa9TdKRKHSa2KPw59iiOymXTCrRfjRIzYZAZfZU0=
X-Gm-Gg: AfdE7ckZWEP0klp7YlY4tDHcupwytuwrhChjxLZdA4lJEpoL6hWtF+xBaU4TqvcNLbR
	eWBZ7oBP7JKid9xDNduhomaT0cG1hkutyTC1Khl92cLDAAm1IO7Dfeu6O+91WXGFTAh5Garl2Mr
	/zWSubh6IRvhM73g7PfParW2A22fDvnus3jKiSJB/qOi7PKVQSFBxN7TYjzMRPcDCf4VbD/bAKJ
	wzCLmtJjlZSzfyTCZPGfJ/LDVOhlxUIRUE2xdb3U/NaOevyGNcl8H/eiZB7ctdy33Jp/JJN0D4O
	sakGMkmWdbaNSIIqiUR56ySuSJ4+jlV0OhDH7O8j/uyQmxkDrHITuqArGlhK0TeKDYEQtEfTN5l
	mPjuluEnQxwQz9p7mDdSLFHzzS8M1TRHYYtzQfApHiFWeJCUOhIYEpoKqpbK/0sOmV6WrSsM3fD
	bWKyYjXu+OsRYyB/Zzr5cZpzlp
X-Received: by 2002:a05:6a00:32ce:b0:847:438f:500c with SMTP id d2e1a72fcca58-847f6fcd568mr8517078b3a.60.1783329329369;
        Mon, 06 Jul 2026 02:15:29 -0700 (PDT)
Received: from [192.168.1.101] ([218.194.36.79])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm3445963b3a.53.2026.07.06.02.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:15:28 -0700 (PDT)
From: Yanan He <grumpycat921013@gmail.com>
Date: Mon, 06 Jul 2026 17:14:44 +0800
Subject: [PATCH v2 4/5] ARM: dts: rockchip: Add RV1126 I2C5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-rv1126-alientek-dlrv1126-v2-4-ff3176ca362b@gmail.com>
References: <20260706-rv1126-alientek-dlrv1126-v2-0-ff3176ca362b@gmail.com>
In-Reply-To: <20260706-rv1126-alientek-dlrv1126-v2-0-ff3176ca362b@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 David Wu <david.wu@rock-chips.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Frank <Frank.Sae@motor-comm.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Yanan He <grumpycat921013@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783329287; l=2080;
 i=grumpycat921013@gmail.com; s=20260618; h=from:subject:message-id;
 bh=YYXBhszfUr1JhliGkjK/e/qiP2GmFVYlWneGxF8txDo=;
 b=YGf9TKEH3HthXKT99UhNu8l/oEBNF6pz0GwXaT72VY1OxJvp6qbSl8vzB/x98CgnlkQqZBtmd
 olvuTvIueVWBLVJh6ktacMSkePgvqDmIUYV1dVFhk9rWAWwM2WNlyT2
X-Developer-Key: i=grumpycat921013@gmail.com; a=ed25519;
 pk=oWrY8KwXIunZWlYBV76NG2A3V4p1bJ+aD45Mr56ErTw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_021534_875661_CD9DB990 
X-CRM114-Status: GOOD (  12.93  )
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

The controller is present in the SoC and can be used by boards for
external peripherals, such as an RTC on the Alientek DLRV1126 carrier
board.

Signed-off-by: Yanan He <grumpycat921013@gmail.com>
---
 arch/arm/boot/dts/rockchip/rv1126-pinctrl.dtsi | 10 ++++++++++
 arch/arm/boot/dts/rockchip/rv1126.dtsi         | 15 +++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rv1126-pinctrl.dtsi b/arch/arm/boot/dts/rockchip/rv1126-pinctrl.dtsi
index 35ef6732281f..1d883b80aed4 100644
--- a/arch/arm/boot/dts/rockchip/rv1126-pinctrl.dtsi
+++ b/arch/arm/boot/dts/rockchip/rv1126-pinctrl.dtsi
@@ -123,6 +123,16 @@ i2c3m2_xfer: i2c3m2-xfer {
 				<1 RK_PD7 3 &pcfg_pull_none>;
 		};
 	};
+	i2c5 {
+		/omit-if-no-ref/
+		i2c5m0_xfer: i2c5m0-xfer {
+			rockchip,pins =
+				/* i2c5_scl_m0 */
+				<2 RK_PA5 7 &pcfg_pull_none_drv_level_0_smt>,
+				/* i2c5_sda_m0 */
+				<2 RK_PB3 7 &pcfg_pull_none_drv_level_0_smt>;
+		};
+	};
 	i2s0 {
 		i2s0m0_lrck_tx: i2s0m0-lrck-tx {
 			rockchip,pins =
diff --git a/arch/arm/boot/dts/rockchip/rv1126.dtsi b/arch/arm/boot/dts/rockchip/rv1126.dtsi
index d6e8b63daa42..d0cdc5f74212 100644
--- a/arch/arm/boot/dts/rockchip/rv1126.dtsi
+++ b/arch/arm/boot/dts/rockchip/rv1126.dtsi
@@ -23,6 +23,7 @@ aliases {
 		i2c0 = &i2c0;
 		i2c2 = &i2c2;
 		i2c3 = &i2c3;
+		i2c5 = &i2c5;
 		serial0 = &uart0;
 		serial1 = &uart1;
 		serial2 = &uart2;
@@ -400,6 +401,20 @@ i2c3: i2c@ff520000 {
 		status = "disabled";
 	};
 
+	i2c5: i2c@ff540000 {
+		compatible = "rockchip,rv1126-i2c", "rockchip,rk3399-i2c";
+		reg = <0xff540000 0x1000>;
+		interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru CLK_I2C5>, <&cru PCLK_I2C5>;
+		clock-names = "i2c", "pclk";
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2c5m0_xfer>;
+		rockchip,grf = <&pmugrf>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+	};
+
 	pwm8: pwm@ff550000 {
 		compatible = "rockchip,rv1126-pwm", "rockchip,rk3328-pwm";
 		reg = <0xff550000 0x10>;

-- 
2.54.0


