Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9853D74960
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 08:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B/wATTXzUjfrmjvqBe4cpw13hqUTpsiU8Co9x75TxGw=; b=FDt/ssMvgYAuP76TOp2QWaD6AE
	JfYLm1lG3O+ISo1+f/OuWFlRvF68zVtx7YY7t1gt+TgI1n9V3N2/XFNtWMF7GR/2/iAJZr1AkhomP
	QsNFrbD8S3Cdc9HZJ9cXd988jkPr0Hi2jvTuhop9vmy3y+SgdryLBacqnv5k/bmov3pEWZIa/ivPX
	TdPoqquY16b68yvWhY5Q1Uw3khsTi/hdttkD+PUTd5Nw93O2QK9fEOtKzlfKecFXd71wQ/NWlDesD
	9qAoaUF9vp/hO5+JUxlc7icn3j7N11y0pymi61Uwcfeq4ECOtV/TIAVrfQmyIgIWDG8Hnx+u9gZSX
	P+NrMgqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVZB-00000009oKx-489N;
	Fri, 19 Dec 2025 08:10:25 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVZ0-00000009oAo-2q6M
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 08:10:15 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-7bf0ad0cb87so2021956b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 00:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766131814; x=1766736614; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B/wATTXzUjfrmjvqBe4cpw13hqUTpsiU8Co9x75TxGw=;
        b=kXtstqdUu+9p8veCT2q4JjeoD8PuoHQf9bLI7kjcKlY+KzItKLzp7qkDGtXKXW2Tln
         EcJKKH5NHRYlCtcWSWVxTpdt0+LgkvoopCgVLy6hKwfu1bcWzf3i5zaDXwUYSObG2hUH
         SftGin9epsDZEOcx/Xhd9lranEo3LB7f1sUCL1oxb4eFI2st1WdyG6X60KU0I2xXxfJB
         nULcLoTjw/K0XhYXSehSZ7JO+KU+uMBuySZTM/whqSFkmbwMrMWGcDddT8BYzT46hkIg
         Yh0dDu8Lf41+ACETFk1bVG6swt5dV9QCmveXxOij22ogRW+vOrizeaE3Ykv+9KLSRPat
         j6Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766131814; x=1766736614;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B/wATTXzUjfrmjvqBe4cpw13hqUTpsiU8Co9x75TxGw=;
        b=ojeyG67tKTC17H3iFFxQZd06PXGtmI/zTcCvpxjJCpkE+MvZrDThN2Rs3FC6cuSjhW
         XsyzWmoyCJDD+hUigIvP7TChGxAbrgaphvs7YF4uW7BMssb3dC0JlcqbIrCFoMlRgQs8
         ekkNJMw9c0PyqeJryVP8baMGfheWRqmhDdlB9Jhq8ynYAcPRAkvx+OkC+u11PllOH83Q
         ZRYdXbdGfIT1AuPIY2AuOadTKzjbhhQotyO1vGz89vkT6+W2mrBL4bmEXhIJ31LLYZ9W
         yciVJfsC34QtJ31qIkhkclMvrxI5xzOKZD4XoqWWc2HlbXUVMpfdIlRThkZMfXBqu92f
         phvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVINf3RbKRMbKj+nS/YsueuAt0XDI4yJUx9NIvawZ+vSwYagKlXqA2xpfMu1YKdzdrJMpcHWu+FB5QKdOKW3ApO@lists.infradead.org
X-Gm-Message-State: AOJu0YxNw1WgYMZU3rnSKMI8mUP0uppLqe2HQkfcHjQe0HvXrAdjQw1m
	w+14AHKf25hbLYAXaUaHpLGgPSj6fZWMATBlPDaJN8j6Ni7+Nonmjof6
X-Gm-Gg: AY/fxX7eDSMIiq4Kdlkz8dyYiissM3Pk9sX+KH0kL4VfplrSSNX6ca33Cxf1WsbdovH
	HbfgO13UbmT84glw1eFw6dTb4oZ8ETZE8IOVDKxgCsQo6MaKMXcVXV3aDk8LtjzgIRutAKpCGiY
	rZ+i4yITObk9q/mOX4iRinwXUFu0DER/tXsO5Dcw6J3sai7zcPRPgFA+Ub7u/zqCPwRdI7wMT64
	tXlXkO84Fl3kn4irtXJq09AkEGjsjpeJFXMe6M7AwCf+AAhTW1Cvy0YOuA+4oKR15rNUGdXFitw
	raXDK+gcPhoSQNV7Hi8XySznnM/GoToaZsAIB5LLxqR/I4MjnBJ0EY+b873ZRtM4QG72kmHG8+D
	cpRkOkE/DkjJLC5+7i3PE/G+vplk+4VfUitjK9tCFT59nWkAvj2qSj4Lm9OGa1G5k3OoPV/T5zq
	Eua1PMAKq968HEWQDQmNJVyHaAJ8+673gmihQbv8Xq4yyTDMy4AOrq9cLaDxOPABhm8x1gBPTxt
	kCoIf6L6p2sQZuPscJbUCmN6IL08fGOM0v8DQy3Uz4FScLMp0ZqebKpojuE7wEtCSaeMWli8dWb
	1MBbD5HHKre6ac9kx7jGYw==
X-Google-Smtp-Source: AGHT+IFgG/kkmFnup93ef4j7B1YogbwF3xY5WX20Fy1r8auW4FLn7n6hE0zs3aNr4OERdmMnPXW5Zw==
X-Received: by 2002:a05:6a00:340b:b0:7e8:43f5:bd1b with SMTP id d2e1a72fcca58-7ff6735eb46mr1956944b3a.48.1766131814009;
        Fri, 19 Dec 2025 00:10:14 -0800 (PST)
Received: from 2001-b400-e3ff-afb4-41b8-b31c-89b3-0a14.emome-ip6.hinet.net (2001-b400-e3ff-afb4-41b8-b31c-89b3-0a14.emome-ip6.hinet.net. [2001:b400:e3ff:afb4:41b8:b31c:89b3:a14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b423d86sm1597274b3a.26.2025.12.19.00.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 00:10:13 -0800 (PST)
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Fri, 19 Dec 2025 16:09:58 +0800
Subject: [PATCH v3 5/5] ARM: dts: aspeed: yosemite5: Correct power monitor
 shunt resistor
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-yv5_revise_dts-v3-5-ca1d5a382013@gmail.com>
References: <20251219-yv5_revise_dts-v3-0-ca1d5a382013@gmail.com>
In-Reply-To: <20251219-yv5_revise_dts-v3-0-ca1d5a382013@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Amithash Prasasd <amithash@meta.com>, Kevin Tung <Kevin.Tung@quantatw.com>, 
 Ken Chen <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>, 
 Kevin Tung <kevin.tung.openbmc@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766131796; l=1969;
 i=kevin.tung.openbmc@gmail.com; s=20250924; h=from:subject:message-id;
 bh=d6+A4ye/JRSrS7pJrCdCy2IGur+aajOHCYd0dBHk7cc=;
 b=qSGjSNQeX1Dihy5AoAeuN0WLNCmP9mWMxheaWMyYmyLGs6Z5Fvgxy2/YCQj+mh1ZmYpDVu1e5
 rnyjJgRsPAaClSr4Yh6wFnM2/xuqfEFAb4P/YClhlBd0Uv57GidsdCb
X-Developer-Key: i=kevin.tung.openbmc@gmail.com; a=ed25519;
 pk=PjAss0agA0hiuLfIBlA9j/qBmJaPCDP+jmQIUB6SE7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_001014_728656_8D5058CD 
X-CRM114-Status: GOOD (  10.42  )
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

Correct the shunt resistor value in the DTS with the hardware setting
to ensure accurate power and current measurements.

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


