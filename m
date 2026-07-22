Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56580C4453C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 20:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L7OAXwu1ImBz6RiI92a0ZzOn6X9oEwvXp6jE08Kyy8I=; b=KrFcHIeDquOTRpb3SLWAv9VYek
	HY1JKHsTQs6bx/mlAR5FVpKdU+cnv8eUvflg6Mw8GV+++dVwVY5icCh3yC9xpoTep7BaCIOCJGbc7
	xv6/pC/4qKNE590/NkjrAYQkeznN7GfIZooGsNG6kxeFl5GGXGjKotG4UzA4N+pBl2uQ3mJO2WjHP
	2JFhNTau2AuFskLUxH828j4cCRbZ9bZPGSHDQQKmzue9g4s34MuZxltRndCaXCJcg7WBxyj9r3Bjh
	MRyr3yiCrD9KC9JZeGZs9Qsl1IuordtClJRhZuJzLqPNSbBKNvvDFYEC5RIGtOfyePkACJvPSLLUi
	psnO435Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmdNq-0000000Cgxe-3R3F;
	Wed, 22 Jul 2026 20:17:38 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmdNn-0000000Cgvy-0ON2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 20:17:36 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-6682259cae6so6730592d50.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 13:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784751454; x=1785356254; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L7OAXwu1ImBz6RiI92a0ZzOn6X9oEwvXp6jE08Kyy8I=;
        b=eFO9k30K5x9JdgIS2UrO1bqyHG5lcpl4azhwrSz8jTVrQXjy7Q4PVT+0es/ttRoGyk
         vEclT2N3OOO/X0vovt5J3YjQ5rH2xyQ9004LIQNGRF2twbk2V2rDuYc1ACs7lffPW1Qh
         XWXODxW9pI8GjFudj/eP02wdB9qBhqiQ99lQya4DKONqzhyjnAAesyeBro3E/CaO3SK0
         XhrutcpIqLS/618LcNXWzP4Ruk1lJkdU++9O/HvN4x/uhibXKyGFzBMMBa4xRLIJACYc
         hyrdaOMi0B2/SeoETiPsPK5l8xRT35/DGAqehh+Pt4nScoS87BCRdhWwf/GLD6ZY49u8
         cMXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784751454; x=1785356254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L7OAXwu1ImBz6RiI92a0ZzOn6X9oEwvXp6jE08Kyy8I=;
        b=KJYIqlJK9zptCQXvds7VIWSzDzGISX+JNe6HFvFQn8rOol/T8piZ9YLYUQ3HpfKzTx
         3fvrvucTGRjKx/3zhW0nhb2rfLj6b+9glHDYJwCJttSdvFuFah+66cfB2zVr8ZTcFqnD
         Umrb1iQqkVXkBMWRsnVvb58pcZvkd6t8HSTcXpRVxT8m6k8SJHmEm15JMQ6XL/u7Szbr
         fO8uAXZMeXWmbAwW+JTWblF/G/QTjr450/G4gcxNhzqI+q7IRnXC+aZOLiaJHQvvFc35
         LzJlANUzIXC1rI814GLJb/4gqb1QzsFsUzUDuP4OXIcY7srN3ATzBaMzHGEgDnBhXCAy
         xcTg==
X-Forwarded-Encrypted: i=1; AHgh+RqPeKs1dk5qjURpeUdw1HTwIkRFxV0kr5oL0GjfkEZxTZHH1yzO0NDc1VKQJFvr64kTta9+wnNqmn5pEhMFDSDE@lists.infradead.org
X-Gm-Message-State: AOJu0Yx60cWKN+Ff16vX0ZxQ4xInLuAr+dPVHCmP5y2r7O6jl01z0NwD
	4sXtv/3G2tE4CmNr0HCCrcRXQOgDp+bG71EFhZy5Ap8oLBXI+jIbig85
X-Gm-Gg: AR+sD13/kfgQu95jtg7QMCQGVaoM3lnCVuBRSXcZ/Xag80TyCYTssTG99okPYyssupQ
	d92UfJ9wh2PXKUVHBhM4umXQUYBkKffYxjuu0Yec5MgwsoSclPIa8HWps/uFyU/xhKgaasFjQOe
	WBWSRUcDaJk3uJ61xRWXytv7R2RN6F1O8wa6u9LflTn/78UMKth9WULmd+hup0ZkkFrdM7hqX/z
	E2dFXm2S5NgV9e8W9Za3O/dx5jzm631HxWEEEFsOzSYk98XjrZ9QMdEq+KkON48HloXBPUNr8v6
	8v+Hh8yME0eYzf+2FpxT8SmQOOi+zrrF8PIwVZpRrPxs1XrjEA65kkn0IxG6L8czGOrNUhlJSDS
	Q15nX1g5SfoEIwQMSp7PXLl9sjFPRqEIN0NqjrQCFxlmVHhmVBTpXUVE0Vt45tMJecTWeWo12Tx
	hgO9vEa640gG8R3D40+E/oLM54+0aNDh21CZfdtD5+1/zRaN4=
X-Received: by 2002:a53:cf51:0:b0:667:cf87:5869 with SMTP id 956f58d0204a3-668a4c197f9mr32658d50.29.1784751453933;
        Wed, 22 Jul 2026 13:17:33 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:4392:41cd:1ce2:e391])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6689056dfbasm1958866d50.9.2026.07.22.13.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 13:17:33 -0700 (PDT)
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
Subject: [PATCH v2 2/3] arm64: dts: allwinner: a523: add IR receiver nodes
Date: Wed, 22 Jul 2026 16:17:16 -0400
Message-ID: <20260722201717.2205609-3-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260722201717.2205609-1-utilityemal77@gmail.com>
References: <20260722201717.2205609-1-utilityemal77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_131735_158665_BA09DC02 
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

The A523 has two CIR receivers, both compatible with the A31 CIR: one
in the CPUX domain, clocked from the main CCU, and one in the RTC
power domain, clocked from the R-CCU.

Add nodes for both instances, disabled by default. Since the RX signal
of each instance can be routed to more than one pin, boards with an IR
receiver are expected to add the pinctrl properties next to where they
enable the node. Keep the PL11 pin description in the dtsi, as boards
commonly use that pin for the RTC domain instance.

Cc: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index ca6a16807049..19771aac68e5 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -327,6 +327,17 @@ ccu: clock-controller@2001000 {
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
@@ -927,6 +938,23 @@ r_i2c_pins: r-i2c-pins {
 				allwinner,pinmux = <2>;
 				function = "r_i2c0";
 			};
+
+			r_ir_rx_pin: r-ir-rx-pin {
+				pins = "PL11";
+				allwinner,pinmux = <2>;
+				function = "s_cir";
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


