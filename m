Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE90CD49C74
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 08:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ajY33JbgcBo2+n4qVxxMLBcw2crou+yf+Z7Z73b2liI=; b=M5B4sOOPwU9RDmBh2nb0My+zuH
	LoNgdd1/ltQ1V7+LYKyxhivkB2S/GpJN9snK1rFgUq90KzYa78n2gUPqB3Fm+tZLsbbJbomTJ4ou/
	N++lyXBCc5W6JQL9NRMVS1zXNlBPHR/95vsYKqPKdc7mMU6Q6T0h8Xy3HAlEiNzbdO07mmQ3jONJ3
	5uW2uBs2GEcrx2ia12hU/N5Zse/d4bVyoL0+Y1UzUdJN/+IewdJ7eTkBVszc4XEBsS8dRLYkFE/08
	f+oZUxtH0EWSEZCRysObWfRdfM3V0ECe0wJaZK/9G/+pMANSdxlwlUfl6uviGVdQn985axGEcq+V6
	DA6R2LvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vljk2-00000001CVo-3hTq;
	Fri, 30 Jan 2026 08:20:34 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vljjz-00000001CSz-0krz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 08:20:32 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2a12ebe4b74so21380275ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 00:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769761230; x=1770366030; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ajY33JbgcBo2+n4qVxxMLBcw2crou+yf+Z7Z73b2liI=;
        b=efQ+ozGjN782Ql8KWA+6x8oL1vgeRexpYO0VTdGhLjL+uPsHnHbo2yXdFNy+ocZZPm
         5B5gZpZ16AluEcSEP8ofg1h0vm/FJ9nZkLCAJIT+AB/hNGJoKP0mwW9qMQL7b5iVpgHZ
         PzlhRvp2vbqr+0Bcd1e5tBRvlQaCgvs/eF1WXChZAUnl7MjDLqzzBlpM8WNE5RTuljQQ
         hkBfUrxcF3hh0Qz8CKGenkImnN8A8roFw89lX7+Mi1tCsCxNMj9UQxixzCca6u2sogpH
         ElnRyLERiZny75ezMbQSZ+SaTo3fUh51AtMlaFFVQfSdOa/rxZ2Spgk5QStSVn80ITXI
         B9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769761230; x=1770366030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ajY33JbgcBo2+n4qVxxMLBcw2crou+yf+Z7Z73b2liI=;
        b=gt9MZIGbOmubwsC6mQ6658WDCipruUHhAblakHihL66iUGGwC+lqQ0p/c9VfMcWKqu
         uAIpKnR4Ks0CsxYEoPCfrJXlX2Q5m/Tl3A+XeqbRXUAbGYRuxb2VnYeD1WGGKYxdR9Lg
         dh3WV6Z+jm57ozJk79n635d41yKQWTHdWM+kJDj5CY8AJLm3weGA+Wuyqxy1BofP/LbO
         4kWDpgkre5LNVGIdJUADuFAHb866mX5BkFAZ81Kh25+WQTPo2Z2yOmPPY2z14frfa2dO
         iwmI6DmwrH5omXuWUswN0deAepfy0f7ewXla3o8VUYGkaRNvNNykOMe+jvYpKb7SAPUj
         8NXw==
X-Forwarded-Encrypted: i=1; AJvYcCUoVezXQ+LEulqhltXhyM6LkZe0s+8JhAYKv4TciNXlNN7NusIozx96GSB9HtIMPqYQ1Banqft2Mvwdg8cT2cxZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxbrJBkooq9MTR44ZC6ryKKQ/+RroVe4WYZd9UZdBilYJfe2Yia
	Dxju40zi7daf6lU1wn2kQ5oAWmb62LZ3eH9ouSUD1AKwkzd+FgExhzF+
X-Gm-Gg: AZuq6aI68haHxBt3RMFHgJeXlGvDdON0HRJQLfkSnrwE2sYiOQUomLgFY3G2iH35rju
	g8IDz9aCJbrNzBtuZRG2mOXFb46tbXKCVTGRD64MW/vIldIy8Ge+vllFO4VvKm5DxpXI81HMm3G
	bMyaFw5p8L4jVHWsw8dOXU6rQDyS3SPi4RnTWOlLPGu/H2xz0iYWVza3J3FhO0p5VXZ061RfhVW
	5/CrTavcFGI2CzchvkelPPh1SI7nYVpZBUjpoMeU4y/aFtvuF1GTtgyFop02UaemZT+4NEr6jJ4
	RNneXL+tNlamZBZywvubpX2yccwd4YDO0BNmXKiAdS9hmm0nGT6vZX4gBnOLBUjFNsX5DxpfRMt
	0BzX2KADYN3bEbm4Pkq8KJxIDPOnilChUq0JNu/RybN4gS+aEV6CPHz9vJq2c59ICEwhojPHQp8
	acUzynXnhQwqMYbfCdE+37qOEjoiL0Hfdkd5v4BNuyt3WEV8ArFqJpIzRnZGCIJu2/34GtFUevF
	bKSHyk3lplVoNCfiN8c6H94Fxnxo5gYInHTr4Rj1sJz3tHWmkVSYJwnZ4/eF3u2c86M7ExWoof4
	PnzV8QxVVdMC
X-Received: by 2002:a17:903:1447:b0:2a1:5d2:2e45 with SMTP id d9443c01a7336-2a8d9a85d83mr22102745ad.59.1769761230333;
        Fri, 30 Jan 2026 00:20:30 -0800 (PST)
Received: from 2001-b400-e3e0-2a58-5bcf-a65d-c80e-2087.emome-ip6.hinet.net (2001-b400-e3e0-2a58-5bcf-a65d-c80e-2087.emome-ip6.hinet.net. [2001:b400:e3e0:2a58:5bcf:a65d:c80e:2087])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379bfc712sm7866018b3a.40.2026.01.30.00.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 00:20:30 -0800 (PST)
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Fri, 30 Jan 2026 16:20:13 +0800
Subject: [PATCH v4 5/7] ARM: dts: aspeed: yosemite5: Correct power monitor
 shunt resistor
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260130-yv5_revise_dts-v4-5-4d924455f3a7@gmail.com>
References: <20260130-yv5_revise_dts-v4-0-4d924455f3a7@gmail.com>
In-Reply-To: <20260130-yv5_revise_dts-v4-0-4d924455f3a7@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Amithash Prasasd <amithash@meta.com>, Kevin Tung <Kevin.Tung@quantatw.com>, 
 Ken Chen <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>, 
 Jackson Liu <Jackson.Liu@quantatw.com>, 
 Kevin Tung <kevin.tung.openbmc@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769761212; l=2209;
 i=kevin.tung.openbmc@gmail.com; s=20250924; h=from:subject:message-id;
 bh=xJ4jSm7ucaz8Rq11dl/v2sadnR+9Q4t/tqVDqA3oOEA=;
 b=MPGZXI3K7EwDVf3iP1xdEiwNx8Gw/EdFZ5MD8WuQYvke+Oa98YGg0p8X/7fw9xuc6+aD3ukLf
 Wz12IaCBA24DhksL6kj+wgOmVgfjrmA9401ODbKemoi7XzkIXnygNwP
X-Developer-Key: i=kevin.tung.openbmc@gmail.com; a=ed25519;
 pk=PjAss0agA0hiuLfIBlA9j/qBmJaPCDP+jmQIUB6SE7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_002031_242799_1260347B 
X-CRM114-Status: GOOD (  12.17  )
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

The shunt resistor value defined in the DTS was incorrect and did not
reflect the resistor value populated on the board. As a result, power
and current readings derived from this value were inaccurate.

This change updates the DTS to use the correct shunt resistor value
according to the hardware design, restoring accurate power and current
measurements.

Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
index 84d3731b17f7c7c87338672bbcc859de2b89b722..524597a81365ef10cd03b67d35eeb88a965cbe0a 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
@@ -415,7 +415,7 @@ power-sensor@42 {
 	power-monitor@43 {
 		compatible = "lltc,ltc4287";
 		reg = <0x43>;
-		shunt-resistor-micro-ohms = <250>;
+		shunt-resistor-micro-ohms = <100>;
 	};
 
 	power-sensor@44 {
@@ -461,25 +461,25 @@ eeprom@57 {
 	power-monitor@58 {
 		compatible = "renesas,isl28022";
 		reg = <0x58>;
-		shunt-resistor-micro-ohms = <1000>;
+		shunt-resistor-micro-ohms = <10000>;
 	};
 
 	power-monitor@59 {
 		compatible = "renesas,isl28022";
 		reg = <0x59>;
-		shunt-resistor-micro-ohms = <1000>;
+		shunt-resistor-micro-ohms = <10000>;
 	};
 
 	power-monitor@5a {
 		compatible = "renesas,isl28022";
 		reg = <0x5a>;
-		shunt-resistor-micro-ohms = <1000>;
+		shunt-resistor-micro-ohms = <10000>;
 	};
 
 	power-monitor@5b {
 		compatible = "renesas,isl28022";
 		reg = <0x5b>;
-		shunt-resistor-micro-ohms = <1000>;
+		shunt-resistor-micro-ohms = <10000>;
 	};
 
 	psu@5c {
@@ -723,13 +723,13 @@ gpio-expander@21 {
 	power-sensor@40 {
 		compatible = "ti,ina230";
 		reg = <0x40>;
-		shunt-resistor = <2000>;
+		shunt-resistor = <1000>;
 	};
 
 	power-sensor@41 {
 		compatible = "ti,ina230";
 		reg = <0x41>;
-		shunt-resistor = <2000>;
+		shunt-resistor = <1000>;
 	};
 
 	power-sensor@42 {

-- 
2.52.0


