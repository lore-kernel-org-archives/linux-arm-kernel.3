Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F474C55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 21:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FHj476tA2byKc8arhZaw8Ci81fHtdMiGqz0hVZIDFng=; b=fSBOPjwCzFAjH6Kx9Yy7Skj737
	C6gkeTOZ7gnWiTbR69elSPBnG8kFTbG/WlaPhbEH2FjP+J9Lr1qYlLgEt0p1dz08JzTZ/fCQPrcuM
	lJ79WAZD+G0tZJQxk2ZnQzm/mMQx1FgxKrgdl0aLguhwUx/VaLrGdEVQMSwogW7IXn/sjktylO9n9
	z6LiBQNZO8X8QRAuyH/5fOEon9K5aYJUoK/HMDf7pcdsD4hUrGrCB+zmu44jgIFTdarmQxheXgjkM
	+wCuT7D7zeTTCv7u5cQWcIPMJsg3ugWoLoOOAdbCLw4AkPfEMa5oONuD2fnErDKZJLbsnR4A9QEN8
	+dxzA9vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrMfq-00000002omD-2HcQ;
	Tue, 04 Aug 2026 21:27:46 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrMfm-00000002oja-04G5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 21:27:43 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-489f3611e0cso202877b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 14:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785878861; x=1786483661; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FHj476tA2byKc8arhZaw8Ci81fHtdMiGqz0hVZIDFng=;
        b=B4I95AJ8H2Yfa5dEL3T62MqoZ4RThglzFf+gWxuObUtc2rkSEi1u2mY8beCXjxnPus
         /AoyRQ0QT+YpciEQ9rHcchlRDe8M5DZujPEANX7sU3dYDGhEhvT8BkaRvcDGu4hwTanB
         eocRG5kRtBaLr8QuC6vN5FT387P9RffO49SHGNPajq641IpV5Sq0L2ykvs8+8nbR/6WV
         Re40br79AgCT8nP2zf+7ZnGMXV7BcOYZcgshZO0fHkeUf0Sv2SYiAGIw7Sr21bf+DMP9
         GLEAkr59BHmWR3EuqZ3zxkzdOuCWWQG1WXmj4SLw2skOLjxb3PXkbwjRrR1vZdcs70+O
         NWEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785878861; x=1786483661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FHj476tA2byKc8arhZaw8Ci81fHtdMiGqz0hVZIDFng=;
        b=CHfIympIiy9aFPELxd4GQB3TseWC2ZDaND0nTHzFcr8CTt51kXGTdh2Odn1SXQFr95
         tBn1wBMJlzbP8dCcabpxA+qup6FT2HLuUNroqGMQo7tQcaVg2C2/dFkome4Ls2aOSZ59
         FQCT/wcAqLX/6JWKMxXFQH3FVWT6V1Exg0AzRYnIV15mlzl49gSFlS7ogMrgJTWZ76de
         ZZI+PakG8sA1mV9R1sk1DBnLVHpaoM24BrlHXDjeJoVSwkgkPzPQnKG+47FtrifBTDQc
         zNshmRoYKeXAxLkWiOJfxQ5h2++XH2ePZ9uBrBfzUMiPf4zgdtLazE1Q+gTFDm49AhiY
         /ThA==
X-Forwarded-Encrypted: i=1; AHgh+Rre/8TpiJ1v7reG5cHR8TlCnhB9Jwys2LnSOVqUm5YRMHGr6sXo3Dh4qWmdIXEshFKaeD98xTT+rUaq4WvyIhlv@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9jmzGMF5/Op+/+QUleVWaggDpN+4xwWSWLoiZogeU+QvvpQRl
	3FSSTDrRobXo5TRe0Sd36KLrJDmYuXBJyEBKoQ67UEkho14UJXjzswx8
X-Gm-Gg: AR+sD11wN8b4ippcNHJPGeOzHx9pMTCBNGSER8iy305yiVGTkcyZLTfJHrjYO1XJP+P
	LksEnQ3wRVZJ7NO7K3tfpS7Igk1BLuO4UUEL452JQmmYaadzV4hDFyWrY9JPc5T8EC+ci0qUzAq
	u+9pn4mIk3t7vV603saH5UhSHC6Euu95yiEjH31RHKRdJjGZAKe5IG7MkIqNqEjQpNvvD83kKS5
	QdHj0tsZ6ZnzLl/dQNuaFOFcF58RhH7J2Cr1qMUpRPOJCHpLYSCV36t10y59r9y6hatQvZnNDZG
	mfXFuP64xRw5CXgoCrrgsAMCFf38k6XoNU4lgNv183PfbZ4W/HxY+3QL9jlg+e6/bwjuAuvpVEP
	XpkBOwOSD9ESHYQIYovWmDrMY8712bLEmU0XWGGJGmEtFHQPzgNITuDg8lWwLLOYmbcAZfsL/zi
	DSISl14tDDOvEO9LSgHPUfB6xFvekogu+ZuiwVoXiBs8Vs7uWdrIG2Pw7STeNPj4CkLW/YtvF3A
	AbBWCunuikiWF7sNajCeKh+dsTx/Mv4Ky6bBnLltkuJwfeODR/diflodyd5Yiu3WoxgxMXaaYg8
	GjFEws5qJooSAtrSNqq9q7OhXOyHmQZixEPK80IoBn6bpk2gb3V05gxYyMw/rMm1Y1ecVykd6fC
	vJR0Y2f7ZCb4y/K0q
X-Received: by 2002:a05:6808:1646:b0:496:559d:5474 with SMTP id 5614622812f47-4afadfb0140mr961793b6e.8.1785878860975;
        Tue, 04 Aug 2026 14:27:40 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4afae7c50e9sm451659b6e.17.2026.08.04.14.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 14:27:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 04 Aug 2026 15:27:26 -0600
Subject: [PATCH v8 3/4] arm64: dts: allwinner: h616: add PWM controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-h616-pwm-v8-v8-3-db37ab8624ae@gmail.com>
References: <20260804-h616-pwm-v8-v8-0-db37ab8624ae@gmail.com>
In-Reply-To: <20260804-h616-pwm-v8-v8-0-db37ab8624ae@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Paul Kocialkowski <paulk@sys-base.io>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 John Stultz <jstultz@google.com>, Joao Schim <joao@schimsalabim.eu>, 
 bigunclemax@gmail.com, linux-clk@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_142742_085557_153EB003 
X-CRM114-Status: GOOD (  10.47  )
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

From: Richard Genoud <richard.genoud@bootlin.com>

The H616 has a PWM controller that can provide PWM signals, but also
plain clocks.

Add the PWM controller node and pins in the device tree.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 47 ++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index 1598e86259ab..90fe56a1d3cd 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -281,6 +281,17 @@ watchdog: watchdog@30090a0 {
 			clocks = <&osc24M>;
 		};
 
+		pwm: pwm@300a000 {
+			compatible = "allwinner,sun50i-h616-pwm";
+			reg = <0x0300a000 0x400>;
+			clocks = <&osc24M>, <&ccu CLK_BUS_PWM>;
+			clock-names = "mod", "bus";
+			resets = <&ccu RST_BUS_PWM>;
+			#pwm-cells = <3>;
+			#clock-cells = <1>;
+			status = "disabled";
+		};
+
 		pio: pinctrl@300b000 {
 			compatible = "allwinner,sun50i-h616-pinctrl";
 			reg = <0x0300b000 0x400>;
@@ -385,6 +396,42 @@ nand_rb1_pin: nand-rb1-pin {
 				bias-pull-up;
 			};
 
+			/omit-if-no-ref/
+			pwm0_pin: pwm0-pin {
+				pins = "PD28";
+				function = "pwm0";
+			};
+
+			/omit-if-no-ref/
+			pwm1_pin: pwm1-pin {
+				pins = "PG19";
+				function = "pwm1";
+			};
+
+			/omit-if-no-ref/
+			pwm2_pin: pwm2-pin {
+				pins = "PH2";
+				function = "pwm2";
+			};
+
+			/omit-if-no-ref/
+			pwm3_pin: pwm3-pin {
+				pins = "PH0";
+				function = "pwm3";
+			};
+
+			/omit-if-no-ref/
+			pwm4_pin: pwm4-pin {
+				pins = "PI14";
+				function = "pwm4";
+			};
+
+			/omit-if-no-ref/
+			pwm5_pin: pwm5-pin {
+				pins = "PA12";
+				function = "pwm5";
+			};
+
 			/omit-if-no-ref/
 			spi0_pins: spi0-pins {
 				pins = "PC0", "PC2", "PC4";

-- 
2.53.0


