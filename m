Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF9F4CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 08:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/4o4WYSufJQ01exYcxPhmyweb253Pa1dolXAna3IPCA=; b=MKrIb3XGIKU9ULNmmwkE263k97
	mJx4zOnRUvg6Gv4ZGXIZF9laeOoBYdcst82/7MfFS+LlJtFWryFu8SYDdf2TZVnPpn+5juWuoGDjx
	KA1s4owcLlByKCllm4YZ1Q7mfZq0TXvrkMtTMm6teGqu3e5fJstI7lz7F66anRl/pJwL84Hkel2QQ
	55CPw/R6dOk+sUJVTDtL4TaLmv851UxGTs72wEqKBzG9YzNlS2ECn4teNgRy1Oj2taLStwQC7tM1+
	3N+35FLNdqBQMFAWLIoIKB1S9UGn202tZ3TeDjOQQmjmxLtrbUjImdjL255+/vorEvPenExUAcGf8
	/Ill1vFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcJGV-00000007QRF-1OeR;
	Wed, 24 Jun 2026 08:47:23 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcJGR-00000007QMb-136D
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 08:47:21 +0000
Received: by mail-pj1-x1043.google.com with SMTP id 98e67ed59e1d1-36dac5d5da0so333393a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 01:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782290838; x=1782895638; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/4o4WYSufJQ01exYcxPhmyweb253Pa1dolXAna3IPCA=;
        b=kWAFEbfbojiraKvP6rohdE8Wmx8rXw1K0bYwL+mqHsl64VRZBrFvTf+Keb18gtWKNo
         W8b4C1qXqA79/oWvPYCHWy2nJAyWWrgF7zGMP2FDyKHufoWutBdGyP3tmTIZ76jSP07U
         E5v9H8tttfHpUoVvFmC4qrdZC/QSSId4kXGQeSuBFedNsMbBg/Lm2Xz4zdZdJq0H+uGo
         ZQTqKWs4ExMlNEEE0Ua4ucMeC3+Uo42xmLNEH+5+7dlxwruzhgCWg2+tkuppjzVil0fw
         SQ7qCbJJdqCFszMnUSKIpCJ8URC8Q9IF1xfR5V2e1qKeLuL+uHEFTsrjvVpJDLbWbSpa
         84wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782290838; x=1782895638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/4o4WYSufJQ01exYcxPhmyweb253Pa1dolXAna3IPCA=;
        b=gTwbXLiPOwdZ38QsNiC4wqGsI7+LWOs8EdnXz6FUxGsMKIenU44WNbO2b7OCNrw6YT
         iD16nC/D3I0d/GxMNVuMj3TJLZQqCwCiwZEnbnGUj59IMV7a9almCVNB7P3XEZV9V6e2
         UpjB7uWvjA1+hel0DWT/nGPiI1tnVwJAawBcZaVaAA2hlssqA9fqPQdNzG5RhsH1FOrv
         0EjRJbH6og8XUiczgukRFlUAMTIkX4mRMrJFlpAs8MQltJp9N1rb06A0D/AamsBkkeWH
         mFJ8l+Qly15HIE/NkPUJs575SHzWQM/EHQpJOxb6qM/FrS8EZCTnHpZ8u1p8VRpcKBN/
         zNcg==
X-Forwarded-Encrypted: i=1; AHgh+RoALvXw3nLs+YA46UDedjoeRVIKnfYBMUmngxTRPXZW/pmB+/9vqPRF40nxOMpr4avTB5/loRtrew0NByN90mVq@lists.infradead.org
X-Gm-Message-State: AOJu0Yyn70x7Ihay0zHHWsnHRbov7uTVlzDEI+ScUnBRsRo1ao4SHTqg
	9nvYefs4EJxLbLG+2x71cE7LmVovQQNviCVQ2wnr1Lzbtc3hZ0UT+C6r
X-Gm-Gg: AfdE7clxzBrs3tSGa9u9r6dSVb0Ogv1i8WuEgp+/3uxyLpQqocjVg1jS/nnxfgaX+IU
	RSTS0g9gjgAWSP0VLVSAPGk4IkWBLtTYfadeyu+lsN/JvtnaxlnA3ZSsLOVIC90FbaKu0xU2Ycy
	HVlVA93J4yzQvPmmjC51gehATMF8JbEGAwJH4QGgDCcsb6svtEqggYD7OtCam0qojI3Dhznq6kM
	nXM4dmlVsdZ7OfTqfmqyUXZyEh0Ng6m4ZR2ixBjYn/Yu/crsJJmSlf4cMU/s2ccZj8ZsGcXoxvV
	w7piVvr1NpE8GZBBNKjriJCVof7156rQMF5YH3SS1O+YYh5qpmYC6BD4dcY975wEHFK2lShkTe1
	4LL4l+cd2bGMufNIi9GrXzjJksTesaz1FKXPu0SyN4Cskgjrcngo5UEZ1ELq7GQ1/AjTNBskWB+
	tMRUOSx4YkbobwXRyN2sErlHyU
X-Received: by 2002:a17:90b:3dc3:b0:36d:f28b:72e0 with SMTP id 98e67ed59e1d1-37de42395bamr2280839a91.12.1782290838541;
        Wed, 24 Jun 2026 01:47:18 -0700 (PDT)
Received: from [192.168.1.101] ([218.194.36.79])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37de3d152f4sm2138146a91.14.2026.06.24.01.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 01:47:17 -0700 (PDT)
From: Yanan He <grumpycat921013@gmail.com>
Date: Wed, 24 Jun 2026 16:44:43 +0800
Subject: [PATCH 6/7] ARM: dts: rockchip: Add RV1126 I2C5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-rv1126-alientek-dlrv1126-v1-6-5aef608a3f64@gmail.com>
References: <20260624-rv1126-alientek-dlrv1126-v1-0-5aef608a3f64@gmail.com>
In-Reply-To: <20260624-rv1126-alientek-dlrv1126-v1-0-5aef608a3f64@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 David Wu <david.wu@rock-chips.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Yanan He <grumpycat921013@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782290789; l=2080;
 i=grumpycat921013@gmail.com; s=20260618; h=from:subject:message-id;
 bh=8DnGaGhGF2q1/a03FB7kpaA8OczPo2IgyWm3JdknUfY=;
 b=YrCE91tKnr6J0OxbIju8J9llVy/eKVFyENAfkCGsxf50FuzCPU5lW0+qINNmUO0ziOrxg/4bN
 2UxDIGsPfkWB7A5GzEjXLLSyplZa5jrmv1yvPfGxXM2WoonVvpq4CIt
X-Developer-Key: i=grumpycat921013@gmail.com; a=ed25519;
 pk=oWrY8KwXIunZWlYBV76NG2A3V4p1bJ+aD45Mr56ErTw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_014719_346754_7BEA8EBD 
X-CRM114-Status: GOOD (  12.23  )
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
index 5b1ee06dc035..483576de841e 100644
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


