Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BDEC61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 20:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HZKFaUDOk9+0vR+1B9jj5VFfzdasobPYcBQD01+SUsQ=; b=YTGFPKMYKr3mj0p+ZUbClKsAdE
	usLUIMjKztUm+TNzXNNvY55vJPq7vhqXp2xpNrpnzBkSdwaVsGpkExowKnBtjYJ4nPT/dlEBRdQCB
	fw43uIMjC4PFVSRHmoJz/jglRwXxaXHIOgaFEmul9qaRjEnkAbhZoe/CpTecqyIF05bzoUCPXnEVg
	T1eA7RKtiFZEYNLybrFvqddDeYlRPY8k5HNAMNNv0UJUn7XLlYRiIo1JrbVrKmpmv0SfodDVQpGRd
	zyiNRPEquEyFbJK5fl7xi7oaZACQopGVaCZJxYQE+i6TpLisdRmjuhiSMyv6FGj6xPdb3h+wneB+d
	brmXdGvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0Pnq-00000007JF0-1ujo;
	Sat, 29 Aug 2026 20:37:26 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0Pnn-00000007JEb-1DCZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Aug 2026 20:37:24 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3965d3d9ab8so1610161a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 13:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788035842; x=1788640642; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HZKFaUDOk9+0vR+1B9jj5VFfzdasobPYcBQD01+SUsQ=;
        b=RLe0C5hK1sURUvUp4Js1Kag0axmf68PRadmYJYdXkWpNuXYQYfoMC5Eatz7CZW8uU9
         N/LMBN7YkNFjTAi9OCVgIy1OR2NTIsygLj8hjax+ZOtJYY9fgqGHtiS4kgrpSHG+9vXp
         eVBmI2g5N8heuOHBLpHtIpxedtxPYcDhNbOOw+cBYMV72a8mwXwAb+HMkj00Cg2RH5GX
         c0YQB+MCmq7K6iaKBz23wsk356ln6/63E2GHMa1wsXHlN6Yo3mpT+tTcAXnOu0aoBSv7
         zeb+r5MfHoa2VMae2g2xN5WC/17wicJ/FAVAmIqKYk9j+96tLNBd8h5GuKuJmeJX+wSi
         tXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788035842; x=1788640642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HZKFaUDOk9+0vR+1B9jj5VFfzdasobPYcBQD01+SUsQ=;
        b=XK+6Y/pxh4i0HIaf6yHIPv2aeJwDoEutI+W/TS3QB6bNW58mQ2HGQWFjqAWwqIM1h0
         /PG8dBEEhHUW84qdrATyBzDJNU50DzC5HKRBtBE8rzNu23CcjuNRooLnLnqZRvYjwTGZ
         Okfl5mMvXdHB1bBG/IvyzXZOCfZWgVeloUmTIMZIUGrCFqTiIHJqy6x1TYd4XGZeZ9iT
         DyBNo9Bd9frhk9XWl8Xb1FzRUZMDRPecqETlnU7/taA26/cLChB4eJuuf6if/5tA58dI
         0zTraMI2vgZtijoU9jp35Ez2wj3OyAV6u0f0+14V7z8RU4+HeYNjGkIdE9Gf/zZHH0LB
         Yoxg==
X-Forwarded-Encrypted: i=1; AKwUvBzcOGsps3w2AUHC2V6h2FB6oOJjZ8rnHcfa8kPJNwNg3GS+X0fySoRuuCPKvE7OXopN7vk0m7V3bxSxaEfMQTnF@lists.infradead.org
X-Gm-Message-State: AFuF++mJjHDTpKoInNhoHKMPUpeKF8nf2x1anEAzQaQtBpRsqhIB5psQ
	8d27gSI5AKwkkM29vpBGekD4SQzPA4Hy5A40JltHLWmbPobCqzltAQop
X-Gm-Gg: AYBFou1vZeI+V2nanaRrEHdBcvY/XhqczSUMrcWzobn5Ol8BgkZi2V0dziI14+pUU0h
	BtXX2TVJdq13XFIl7ANc5rbOFl1hGK9Nh1J7mycMwjd57OTjW/pZVjZynuUAyPsjkO9smF6EsMs
	vTGNmBonGbJyerXhp0syrlmFNtRSDE0S6mfEMX5ZQmvUJdpOEWey+xzllCZv2IUD4u4xnduoJG2
	pfhNpnrxyBDVhaLrYxa9pOOZ2kkSMU5QyRjIxP+fuKaU8cX6WhXuW6BX9JmW5rZA7ZC/cm/UIVq
	5n8qHEYjb72rOgm/d0c2QlZ8mi1jmvnEq5QCOxOXEZgV0iA5vKZq7vHbRFe/nNDg+pSuiAq7y+F
	8q2UJnCdbrEIcRbHJuVGLsr9ISerXjOPiTQxNJUM9hl3t8yohERWnOl5qpLvXXpWu5iAkipPpQL
	g/Qjk6Ci3NuLi85aQJswXUQz23TyIJCv+VWMQ8RR4y/x1/0YP4bbVWs4NSJMZAKcH3HqdcL1xcg
	XHQw6nJr1AhyoikgAMrJs/ZYrY82J8XMwUmv+rGvoBi6EYAuIhnhQ8Z5Wsy3ydNX7qQRX0bHQfd
	wM65Z64q8shEQJSQjyrJP1aVCo4ZrTsUrcRVQD+r47YdAhhX
X-Received: by 2002:a17:90b:1a8e:b0:396:4c63:7193 with SMTP id 98e67ed59e1d1-396d0fe45damr27054160a91.11.1788035842198;
        Sat, 29 Aug 2026 13:37:22 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-398a2f5187fsm1771407a91.1.2026.08.29.13.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 13:37:21 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dennis Gilmore <dennis@ausil.us>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: helios4: fix spi1 location
Date: Sat, 29 Aug 2026 13:37:20 -0700
Message-ID: <20260829203720.44633-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_133723_333347_C3CF66EF 
X-CRM114-Status: GOOD (  12.57  )
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

This spi node is specified in armada-38x.dtsi with proper compatible
strings whereas they are not present here. Instead of copy and pasting
various lines, just reference the node in the dtsi.

This dts seems to predate the move of spi from internal-regs to the soc
node so this moves it in line there.

Allows proper probing of SPI at runtime.

Remove the microsom_spi1_cs_pins pinctrl group and its reference in
&spi1. The group only muxed mpp59 to the "spi1" function, but that
pin (SPI1 cs0) is already covered by spi1_pins, which selects the
same function for mpp56-59 in armada-38x.dtsi.

Fixes: ced8025b569e ("ARM: dts: armada388-helios4")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../arm/boot/dts/marvell/armada-388-helios4.dts | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index 9de9a8a4267c..ae03d42f92a0 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -254,13 +254,6 @@ sata3: sata-port@1 {
 				};
 			};
 
-			spi@10680 {
-				pinctrl-0 = <&spi1_pins
-					     &microsom_spi1_cs_pins>;
-				pinctrl-names = "default";
-				status = "okay";
-			};
-
 			sdhci@d8000 {
 				bus-width = <4>;
 				cd-gpios = <&gpio0 20 GPIO_ACTIVE_LOW>;
@@ -327,11 +320,13 @@ helios_fan2_pins: helios_fan2_pins {
 					marvell,pins = "mpp48", "mpp55";
 					marvell,function = "gpio";
 				};
-				microsom_spi1_cs_pins: spi1-cs-pins {
-					marvell,pins = "mpp59";
-					marvell,function = "spi1";
-				};
 			};
 		};
 	};
 };
+
+&spi1 {
+	pinctrl-0 = <&spi1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
-- 
2.55.0


