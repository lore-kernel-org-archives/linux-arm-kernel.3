Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B992C5518F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 08:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6y8Hcxg9MXxS8AWcFY2VAmn1cCgVHpq4caMsrXoFzEI=; b=G+vApOHD5yWS0oUgALbsVi6I2m
	zbok/A8zwVR4NCas94VG6955Qo6+figpWyrWUQs2u5lvbuQQ+tzQG7oF4xSTPhjyQw/K6CG9hidQ4
	pJQkXv/8lt/E+LMTP+Rj4D9xTaSXsXWNiQHEV5VvdgZRZuFgW1dWMWAiHX3+TDzywrZ5AdSLmMrhJ
	fbYrN+yxK7xRqUdZmERR0eCeoku8X2IHH2guD0SaxKm5TOfiImmkhaSVAY1YebV3cPZy0DzsB+ZfN
	dL+erUiqpOSaafAxNEH1KVDL8lVBRd+jcGgUaFcP/6vfwjb1wgqrR7XZhklfoiT+a35ZM0e9zFpSG
	XHQ8DPjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrAtC-00000001OBd-0Lm5;
	Tue, 04 Aug 2026 08:52:46 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrAt8-00000001O9W-46ve
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 08:52:44 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-38f620399a0so3461098a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 01:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785833562; x=1786438362; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6y8Hcxg9MXxS8AWcFY2VAmn1cCgVHpq4caMsrXoFzEI=;
        b=C7IXFSwG0I0AmEGTKMJ9/BDOZLWsbHDbyqT7zFD47HMCGr/VnV1WIQyN3yYDh4bChJ
         Ht/Qr0bFlr1zm2aIDGq7Ntf3SrJ7KE59aUu0U/QV0z1aIILWT7Qp/Z6VM2Y2Oo/E84ur
         rUaj47K7+IADg9bIRCJic6EbKJxsWHx86C4NS9XHOjbJfeievAtj8MDGt+J79dsNVIlq
         6mexef8+5P9hWOGqk2++G6FIK5LjwR6YMt98XmKXv+W/fggK/6Tu83lUmh+bxuB5p9Hv
         LWHDgDmzzE15K1CAiBrwH0hzIF11HXN3TYTAFbNSCp2pHaoj9yo/0Dj8jqb/Sgo3/fMT
         R4zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785833562; x=1786438362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6y8Hcxg9MXxS8AWcFY2VAmn1cCgVHpq4caMsrXoFzEI=;
        b=idQW8TkP9Zgb0xgFSwHlUpeHdQRir3BeKyJoIBJ1ina/hlHQHSmZufKBIejOPJgjOk
         lRzhI5S9Lt0ttDNCH6hn/rRMpjDIKtwvY9JK4+Ijll3XtCXxIXmHPqFaqBHB6jLNeCsM
         83GkmBHPKqZ4aWxc2Z04jBHMAp51bb/2/G7aWnO8MUmgO0aA50m3WGxuhSdjzErsoKww
         Xwpqhm2w0RLpwpbMxW/VUFZGDqy9hdo0iEqYqmSU1gGlsnpyWFWYD7REFcx3sxLCaJKi
         Wppb1v9TggHgR/XE8uQc72ncZytCQd2i9qP08gL7Y5JWyeyf9NRu5FX22Wm9ouOKxuLZ
         kHFg==
X-Forwarded-Encrypted: i=1; AHgh+RomOl9l5lsb4xNkq1S/S/2syr3SgSZOIku+c2yQ5aCQ4UU1RJcw+Yem6DYEcrf2rMPwfkOHVf2eay+s7MZE6WHV@lists.infradead.org
X-Gm-Message-State: AOJu0YwIN5DFzjsnk4veTboXq2kmU9W1uDmVgo4Gdi/dgR5rwg3YfhSZ
	8Y5vYD8tosgJYF/XJqtmXFctMlKTOGmJtsHMiQglGH+3+Nb/735KZtbQ
X-Gm-Gg: AR+sD11oPqbbZxlL4ObPVw5DOSu2jhT8hdQsPhkOFfV3tIvETi3aLOUVvW6vBh7DWul
	5ORzpo5idD09WfT0nOgCMXeUaRIRulaxZtU3iNh98kmKvPeytyeLkn5sd1Ays5dKE/aVrD6r1P1
	tUYtPQJZwA6p9+VVGfALb5ktmr+dh2UnlCILWEqr7RSchfJqsOYOiUXRirFLfgefbIQDVCh5LpP
	DraigKfdow+29tvs5EFc024fu4AsYIv6rFGRZEsyiY2zAjRCBfOxODJtg4E8SkNLdJA7mHv3e9W
	GAzHLntEskUZnzkqAxNlnYNwt3c80pJi4vRO64FkDTX64FaNV/CkPRJEmelHq/iPdc+QgYzr+M4
	CwSPLOJ07DXix4fyTrlXoZU3zYFbXDfclg1rI2E1jNYKwuDewo+S5XdHec8rPF0bPu1NlGMkKyz
	zPaSy61uCsurKwcy0N6s4nC/N3jhxANfVTJgv3jmafh/2FxPhjpt9qI+6VoGz3gNWFZnsjmP8k+
	FhvVQPCiHNqzWHX5+5st229PW4JA+Y7K00lyFxJk9uBy8k=
X-Received: by 2002:a17:90b:5867:b0:38e:bbe8:5be0 with SMTP id 98e67ed59e1d1-38fbc4adacbmr12546764a91.25.1785833562389;
        Tue, 04 Aug 2026 01:52:42 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38febffb36dsm1012000a91.7.2026.08.04.01.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 01:52:41 -0700 (PDT)
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
Subject: [PATCH v8 3/3] arm64: dts: nuvoton: Add I2C nodes for MA35D1 SoC
Date: Tue,  4 Aug 2026 16:48:06 +0800
Message-Id: <20260804084806.1846570-4-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260804084806.1846570-1-zychennvt@gmail.com>
References: <20260804084806.1846570-1-zychennvt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_015243_058952_4158C501 
X-CRM114-Status: GOOD (  11.28  )
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
index a029b660e8dc..422468dbc3bf 100644
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
+		reg = <0x1a> ;
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


