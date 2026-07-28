Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A322C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 02:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SL1KTF1x/wzq2M0G3BusIA5VX7FgJc1o5Gt3hpRnCRU=; b=lJwFjP7K8F1wLTHDHtsVOAetRp
	Sqt3LiTSG2X9V9VONLKpMuWUFjnKxfEhj8XB+76o3yKlxt7dnu5shbdv+uC0MN6W7d2E+ypQNBs2X
	1qstXsk74QthagEnEr25Fys6J/9ZLO+GCr35uUk+J54n4Ug3PN8PiysHb0Muwg7ZEqiUDWheZn3XU
	fnLBIop7WoYuzdBp4+cjB/EJOfL04MXSbXKpLGo5kVW0g0dm1QzqdMnfoMPM5IioLVfL9agoXqc5Y
	trHRTb9XcTRf40e12likNpGVPAMmqk9VJ/dNE/QYv9WNqK/05TsPnvX1ZVdeRaU1U1TeJnLm2RH5J
	3MUkF9Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woXtY-00000004HbN-0dAY;
	Tue, 28 Jul 2026 02:50:16 +0000
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woXsh-00000004HWL-3gFV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 02:50:14 +0000
Received: by mail-yx1-xb134.google.com with SMTP id 956f58d0204a3-664db84f074so4315479d50.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 19:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785206963; x=1785811763; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SL1KTF1x/wzq2M0G3BusIA5VX7FgJc1o5Gt3hpRnCRU=;
        b=bres7aYT9pEzIzoaaHxaSiU90ttr4sIS/EBt1ElfA/V5mEgA8VXkpW9y7IyfEjMzrS
         ZtWDb8ZsIScphn1Efd6x18WA1TTsgazDMsRlScdnnrod4/ZDJKyfIKN9QqUzSGbxvrAM
         05vbNW72neHmk/LW077n3ub+ecIi9y3G/Ib2LMTN2ADrlMNPApt0x4GtCX3BRvFZGCVX
         EvSiRcpvv6SNALGQJhmn9eaysTAffGttICyKKCyn4OCAhFeWRDKp1T9bQAkErxiko8Py
         Rs5+eOR4pVXBMtD25ky6HO245HAuJDQiGoZQ0RNkAf9UwO57AAb6+gNArXE2dhthwi03
         iEkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785206963; x=1785811763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SL1KTF1x/wzq2M0G3BusIA5VX7FgJc1o5Gt3hpRnCRU=;
        b=mpZDWBxpJnF4sO+M0FtsyHAsmPwoR6UUpcixAHuyuteDGfoByfDzDDguYSncZzBS3D
         IXDe4w5MiyYrBP4qFqXGwr+gnlKNAVxt7T1IwFK0uath5StHkbc1s1yjfivGvfkAoC02
         Ic2dPdaw7NxXdLGxl0Uz50Zek/OwVrA09PbSZjTXJpPmdn9sZTf+J+JCxgpzX9EJEfUw
         yg1lMxb5TPlEpOkLiw0pPYDEbYIzNHdTJly1+yp1vBe0250OpF7Z1XSBSQMcEqG8bRzM
         TDvVsFuGU8THxBK7ZZX1QcSrl68uIdDgBUOyIHOaSrEpxb62dFFmMLuur5B62dhsCaZ2
         kbrA==
X-Forwarded-Encrypted: i=1; AHgh+RpV/UctLPTpNDvHLS9J+Hamth15E25VxgUoJ9NNrjVQxp7ZOz84vcZ74wXHQWSgNZ2pT4nVwGDiG4rVBhopRr+5@lists.infradead.org
X-Gm-Message-State: AOJu0Yyf4RMQsY8/VH/qYbe6Zy2vDrsBSCmQfcLsbSrlPH8TXEBPezDT
	GtS0p78elni/8X75d6v1ULJICFgPxn4699ywqqa9Yaz+Q4Q3n61u9zx5
X-Gm-Gg: AR+sD10NYuK6bvuoepE5VwBtL9jLwaKfa7hDa34JzcRR9WK6tAYZB/ea8cSkaPSs6yC
	5s0mNobkXw7lxdF15+zljSqBBC4IGJxAvTB1KgSGv/9+F85mldflrQBONVeDreP5ayiqJnJdrZf
	PSQFp8Dy+opzxu0DW7wR9Kv8yMt+1l3o5kVLkONIH1JcKYhjxpazWXRwjsrFz6BU29vt/kRFiz4
	WvNBZ+vzrs6M1a8QawtHag7ibbueI4moOEOiM7QyjS6Deh4bxMhWJPYtlclNca0ajGEf+FxJELI
	OApyMbuA50v+wLbIS3WboZMfPxISu10+oKt2OY9WRzeH8JvI80a2wTghW+Far+PyftV9IjZotwi
	f5rYCmejGNsBNj8RYjZLB6xMEkHl+axSsIaOU8TErUG0gQF/1wLYTTSs3qaSma59RDzRzDO4Sqc
	ZdXfzIEtZxAVVdd8WY8zKsCEsT29EBA1TxHAS+
X-Received: by 2002:a05:690c:6d0a:b0:81c:e8ab:c4dc with SMTP id 00721157ae682-81f992b6a75mr2515787b3.51.1785206962862;
        Mon, 27 Jul 2026 19:49:22 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:722a:22a9:308b:2c35])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f6579f462sm40974847b3.11.2026.07.27.19.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 19:49:21 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Justin Suess <utilityemal77@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v4 2/4] arm64: dts: allwinner: a523: add IR receiver nodes
Date: Mon, 27 Jul 2026 22:49:14 -0400
Message-ID: <20260728024916.993224-3-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260728024916.993224-1-utilityemal77@gmail.com>
References: <20260728024916.993224-1-utilityemal77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_194923_944272_D9BF2170 
X-CRM114-Status: GOOD (  15.22  )
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

The A523 has two CIR receivers, both compatible with the A31 CIR: one
in the CPUX domain, clocked from the main CCU, and one in the RTC
power domain, clocked from the R-CCU.

The RTC domain instance's RX signal is typically muxed to PL11, as on
the X96Q Pro+. The CPUX instance's can be muxed to PI8, which is what
the Avaota A1 uses.

Add nodes for both instances, disabled by default. Since the RX signal
of each instance can be routed to more than one pin, boards with an IR
receiver are expected to add the pinctrl properties next to where they
enable the node.

Add pinmux nodes for both pins: PL11 for the RTC domain instance, and
PI8 for the CPUX one.

Co-developed-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---

Notes:

v4:
    - add /omit-if-no-ref/ and rename to r-ir-rx-pl-pin (Chen-Yu)
    - take the PI8 pinmux node from Andre's Avaota patch, named
      ir-rx-pi-pin (Chen-Yu); Co-developed-by added and Andre's
      Reviewed-by dropped, since the patch has a new hunk plus
      pinmux node name change.

 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index ca6a16807049..f0b74693da7f 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -155,6 +155,13 @@ i2s2_pi_pins: i2s2-pi-pins {
 				bias-disable;
 			};
 
+			/omit-if-no-ref/
+			ir_rx_pin: ir-rx-pi-pin {
+				pins = "PI8";
+				allwinner,pinmux = <3>;
+				function = "cir_rx";
+			};
+
 			/omit-if-no-ref/
 			ledc_ph_pin: ledc-ph-pin {
 				pins = "PH19";
@@ -327,6 +334,17 @@ ccu: clock-controller@2001000 {
 			#reset-cells = <1>;
 		};
 
+		ir: ir@2005000 {
+			compatible = "allwinner,sun55i-a523-ir",
+				     "allwinner,sun6i-a31-ir";
+			reg = <0x02005000 0x400>;
+			interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_IR_RX>, <&ccu CLK_IR_RX>;
+			clock-names = "apb", "ir";
+			resets = <&ccu RST_BUS_IR_RX>;
+			status = "disabled";
+		};
+
 		ledc: led-controller@2008000 {
 			compatible = "allwinner,sun55i-a523-ledc",
 				     "allwinner,sun50i-a100-ledc";
@@ -927,6 +945,24 @@ r_i2c_pins: r-i2c-pins {
 				allwinner,pinmux = <2>;
 				function = "r_i2c0";
 			};
+
+			/omit-if-no-ref/
+			r_ir_rx_pin: r-ir-rx-pl-pin {
+				pins = "PL11";
+				allwinner,pinmux = <2>;
+				function = "s_cir_rx";
+			};
+		};
+
+		r_ir: ir@7040000 {
+			compatible = "allwinner,sun55i-a523-ir",
+				     "allwinner,sun6i-a31-ir";
+			reg = <0x07040000 0x400>;
+			interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&r_ccu CLK_BUS_R_IR_RX>, <&r_ccu CLK_R_IR_RX>;
+			clock-names = "apb", "ir";
+			resets = <&r_ccu RST_BUS_R_IR_RX>;
+			status = "disabled";
 		};
 
 		pck600: power-controller@7060000 {
-- 
2.54.0


