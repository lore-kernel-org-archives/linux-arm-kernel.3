Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650BFC4453F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 23:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lqOrT9xci3vC0yRAEjJsB/AtSU5bQ1X+i+tu63Bn8bU=; b=Xdxf6G5hbLxUvt9n6x0MHqra1G
	zdPtam5/EBpXggEAiVpeLDS+RVPXj5jB9xo6mTABXWWqzbs9wMfU9He06Dy07ohGt28MLLTy1q2si
	ezQ94EWjkdy78/CQ1vFYivG/JI7VikghtY7KmKAGN/OsGghkLo69Z0JIHV5LR2Hyqi1yPVIM3fBv1
	Rmtl0r3uPtu6KMnKK6WeA6lz9BQJvl460x9kBEHXA0glnqbL31XxSbbYO0OQW7xwXzk824CdZnFZU
	McCoFJ7wESZdPhAWfq+e5UfbtjVy5hFc/aalByF4En3vOzxUNgahgy6rEbwBKVmdFzBBDJom+9aHz
	jDUrOeTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmgUE-0000000CxU7-0cfe;
	Wed, 22 Jul 2026 23:36:26 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmgU6-0000000CxRr-36EW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 23:36:19 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-80c5cb9a888so458497b3.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 16:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784763378; x=1785368178; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lqOrT9xci3vC0yRAEjJsB/AtSU5bQ1X+i+tu63Bn8bU=;
        b=NB0jlFHzyPOOmIf0+JJExyynLEiuUWLtBUErca7W0PhkKfWccnzKC0AQLmVCj+6Uq+
         f4nWr+JteQzs2IPp384qzh3igSaPUxiYnPHke3d0HU6JZ13C6UwckatySrcdhwWX5q6B
         cQe3w8GWIT2r4W92cKnorjGrRSxyVNzlbA41WkRKRt22RGV73mpB2NF4MMZ7pmYvcS3G
         vpjwOuCALZZyvgHn9RUxPz5rNuNKAhN68VeDq3xjE4jgHQau1PKLTrRhtEOf5KnmItDm
         A91P7lxt6vU7qNCKcVqnpvJaILtiEJXqn8ItKztKinaVBspJQDX/58F9ZFGqJLbNSXvZ
         t0rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784763378; x=1785368178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lqOrT9xci3vC0yRAEjJsB/AtSU5bQ1X+i+tu63Bn8bU=;
        b=YDprLWCzgdWUpZ/Nyi8uK4a1O/ZhWbeDQxy/CBn+zOvDqlhqgZJWy0vieiAAcayU33
         xl0mz0+WCXJw+oIuWB/6lUDcjL0gH2PkalRzKictUyeaYMHEKKz0740d3AcU66mi/t0k
         nxlITNuUDJTnbRck0zX0yr4Z4HgZOtfHvKUBf/ej2imPFquvO/C/GYel16iXvKv4Wpzn
         BVhYYZwMz7aZg+3azUH6Oo3pMvIFcjfwvmwR7FMl+s+WS0dzyJibaYMfRQQgrWTwUfS7
         0mO4mKVTgDqcsvoWuAoZ25PUdVE9ls2u3NJIqJNGrRss9FX/0AekSjqrY7kbCYlM0CaQ
         UYdg==
X-Forwarded-Encrypted: i=1; AHgh+RrBytfHmlVrV/18CxlXa3nk/iLohg4yUR5XjVLaCW/7LsB1oR3U8pAeQ3n7pGcpN20b6qhyDhd/tMU33c3SNCgY@lists.infradead.org
X-Gm-Message-State: AOJu0YwbLMaMDL072F1O3PraA5U18FtpI4YvGysmzlE0EqLSbfHJblTD
	pa1RVg9Menpb5O8lYMhNyKvIPJdVb4DXWTktCZ/jsuCGuEgkZnPb7hus
X-Gm-Gg: AR+sD10xvQvn8qQfeIrU/RceLXSpe9FxwNfJBNbK9jay/BG1s36kh2bijshd1paDqYA
	UXpOWC8NXQXGsKXut8T5VVam9eAPClZeBSelzMyPQS7gC3PRv46/i5NWfmyenV4mXzkFK3yLcF+
	Pb40Oo2881JPVJaHMDhu3B2Z2y7rFKK0A3pdQfoov4FXF8Jk9/0kka5Jw+i6c9YZqVux9FclUZU
	COxAMsMqm9llKrtdGF7dn/8ccNjb1cnyeWHqWYFw41V/+cSvGG1Qv3n0uS4iJW5JSNavhcHD5rb
	/Alw8mvkfq3DwSSJ1QzLCpPLcejC4zFzA6SBLOgyofMVBondUG4iXHgphpUJtxi+wvrjiOxO2B2
	EQBrV+l2LACOhWvvUA46AL3841RuIIBqn/gC8ac4JmQqeYmRWuzEHPJl8oHU645h/gkULdsVmU+
	7JH+uWLlwQCnBpY8Y583k8xuiuugs8iDCUkM9m
X-Received: by 2002:a05:690c:296:b0:80d:66b2:850 with SMTP id 00721157ae682-81f4c2b5753mr2162297b3.42.1784763377901;
        Wed, 22 Jul 2026 16:36:17 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:4392:41cd:1ce2:e391])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f33c627c9sm20937027b3.19.2026.07.22.16.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 16:36:17 -0700 (PDT)
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
Subject: [PATCH v3 2/4] arm64: dts: allwinner: a523: add IR receiver nodes
Date: Wed, 22 Jul 2026 19:36:02 -0400
Message-ID: <20260722233604.3001063-3-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260722233604.3001063-1-utilityemal77@gmail.com>
References: <20260722233604.3001063-1-utilityemal77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_163618_785547_8C10D405 
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

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index ca6a16807049..c2de662140ce 100644
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


