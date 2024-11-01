Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C46BE6B24A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 10:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dQzVdoqdvqgLOFlu8gMxMsd1xizkEdv4aj8iXiXRzjU=; b=bgsXtqzg4Tql2z7Wpbvq5sd4AU
	EMqnb9LvTXa890OZfCEVytm6onjD6grOUbfaE5TVf38Vsp+Rz3+srEcjTaduyb6tJx7DQOMGVtrEV
	76lE5I8y/gA2F8v7o1ui9ScwrT4dTVhf913JUST1NpF3a0xKivJTDdIS5mNqNatWPZGl3xlSaHLAG
	9lc/a4ZNJj43vffNBTvpqX/nHguFVbOYxpJtUICPGowv/D0RHp5Ro4GdEZLoWzqaG2LjkBqy6LjMU
	vw7DU07boBPvM2RWy1XrJI05/5OBXoZDFaH4ZRWWff850CZPjzasP18xUZ9gqi6Ryua5g67iad44J
	N40TWLng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6oZW-00000006VhX-1CGd;
	Fri, 01 Nov 2024 10:08:02 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6oPe-00000006TN6-2pyJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 09:57:52 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5cb6ca2a776so2542238a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 02:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730455069; x=1731059869; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dQzVdoqdvqgLOFlu8gMxMsd1xizkEdv4aj8iXiXRzjU=;
        b=SuC6ISV4dNyxC+KpR+Nqg9t0UNvI72sua0obz7aMssliNSloimn4eNyE4h9VW5LFUf
         LojlbM85MhQGgPHo8iNJeE0k7+/n2LgEZ1fekMLJU58Oz9DkU18UIQNrln3XPyT8QAio
         nJ+FVW48JT2oJiZAt1+lpdcR2+iHAHTnBWPPlLF3R+6i0zMQsYCxnj8hKJdpLEjBqyS2
         NbUF4dEJ7C9Bh7mCRXXjDEoLdToBxJBj4JnqW0fdhVxAS4fYpgvndFfaAlN+UHSksEux
         fue2mElazcPLokbKQkHeq9oV91dKheYtA6Js5fcb4k27qdbzOyPmiFIlHKygYOyCGliV
         yXgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730455069; x=1731059869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dQzVdoqdvqgLOFlu8gMxMsd1xizkEdv4aj8iXiXRzjU=;
        b=kRp8IJzvvI/pwiuasSrZU1NmS7wsJUGKhrz/NZZFDJpOcN90PVZyn83Svtjk3+GJ69
         bNx/Nb0fuQpWGOAYXrHmZgExq7yCv0fSzHErQkdaixi9vC0Yz/RqQxopgNOx9eOh6yhs
         z8I7n4K1MOLnJ55PG8YhBaOg/j6f/q794kTX4oJqJ78fALrqL5r5ShBerVtfRDlZ5srn
         D26q6WwA7wU9MKc0FIlUvGzFy8GorMQ3XE5WtFgSMJ/ewY++Sq5cjwNAmT1XemlLIT66
         vbdp5d/IdIPFAXmfdoxccXJtdoYa2c18be9F46cObbFOiJz0gChCJLlzmwqCNUpVJipf
         Ewig==
X-Forwarded-Encrypted: i=1; AJvYcCVtp8gdEgp+LjoKRiiGOTn+06C81d2mIJ0/PGqYmS9RDb4f4oT2xlU3OWJay80vGDCytl08k+UWulu/EziAeNxG@lists.infradead.org
X-Gm-Message-State: AOJu0YznB+UU+ATyOAYMk751DWFkt68L4PzvAQ25e8+NVg39OUA7TjSM
	2aabmV6c6aY1DNRuAckIJsbUrGTleQwtay6DewxYc1GJ65GHI7w27RJPYtwzsh8=
X-Google-Smtp-Source: AGHT+IGfg1jB9Gr5SknKQmj654bdZhqMhBEbjNXW8PNX7wmtbus6/mYgJoy7Q69k4vfLF7Q0z4tBwQ==
X-Received: by 2002:a05:6402:4307:b0:5ce:af01:6317 with SMTP id 4fb4d7f45d1cf-5ceaf016b07mr3408111a12.15.1730455068835;
        Fri, 01 Nov 2024 02:57:48 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.190])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac7c8d87sm1364136a12.76.2024.11.01.02.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 02:57:47 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alexandre.belloni@bootlin.com,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v6 5/9] arm64: dts: renesas: r9a08g045: Add VBATTB node
Date: Fri,  1 Nov 2024 11:57:16 +0200
Message-Id: <20241101095720.2247815-6-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241101095720.2247815-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241101095720.2247815-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_025750_748533_37C397FB 
X-CRM114-Status: GOOD (  12.95  )
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add the DT node for the VBATTB IP along with DT bindings for the clock
it provides.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v6:
- none

Changes in v5:
- dropped the status = "disabled"; for the vbattb-xtal node

Changes in v4:
- used clock-controller for the vbattb node name
- move the node near scif0 for ordering
- set the vbattb_xtal status as disabled to avoid having it exported
  in linux with frequency = 0 in boards that don't use it
- collected tags

Changes in v3:
- dropped the child nodes of vbattb; along with this dropped ranges,
  interrupt-names, #address-cells, #size-cells
- added vbattb_xtal as input clock for vbattb

Changes in v2:
- update compatibles
- updated clocks and clock-names for clock-controller node
- removed the power domain from the clock-controller as this is
  controlled by parent node in v2
  
  
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index 067a26a66c24..a1d5084b074a 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -72,6 +72,18 @@ scif0: serial@1004b800 {
 			status = "disabled";
 		};
 
+		vbattb: clock-controller@1005c000 {
+			compatible = "renesas,r9a08g045-vbattb";
+			reg = <0 0x1005c000 0 0x1000>;
+			interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G045_VBAT_BCLK>, <&vbattb_xtal>;
+			clock-names = "bclk", "rtx";
+			#clock-cells = <1>;
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G045_VBAT_BRESETN>;
+			status = "disabled";
+		};
+
 		i2c0: i2c@10090000 {
 			compatible = "renesas,riic-r9a08g045", "renesas,riic-r9a09g057";
 			reg = <0 0x10090000 0 0x400>;
@@ -425,4 +437,11 @@ timer {
 		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys",
 				  "hyp-virt";
 	};
+
+	vbattb_xtal: vbattb-xtal {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board. */
+		clock-frequency = <0>;
+	};
 };
-- 
2.39.2


