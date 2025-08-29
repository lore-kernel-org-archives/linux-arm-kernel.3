Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84091CA0FF7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 10:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=huo6UKRZvOysKzlKK029Ak+BDZSM4j9x9AL+B8QBDmg=; b=I8bD32gJlkCiVsQeV95bU1w//Q
	3hfYgZ0G4ZPxVuqTqjPsl/v4FWK3Mn7H2/pF4YNry0H9A2dmW2p0upll0GMpiNihPwrX1DOPDtpIR
	k7ryb/fP1i1fOarrXllK9oPAQgTGfoMD9vJ59nCt8Beu4tjfkHLWB9kvO1DMt4LKvsWOLVRMY5BaM
	oH+1L5cn0ukROj/sydawTGnTe212WPxIXqinCP6gJ7iQszxVnm9SRNrloqelqZmRnLJRVlJ0BaEUP
	z+/ThWGFMlWGYVQ/5U/r3kC2d/cxCNsQ4Str5TNmrAUYq6knOdd8KEJtQOC78iigIft/L1FnplTSW
	Ep3/bL/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urw2C-00000005GOz-0Fuk;
	Fri, 29 Aug 2025 10:08:40 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urumj-000000051aE-3LUL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 08:48:38 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-b49b56a3f27so1211121a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 01:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756457317; x=1757062117; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=huo6UKRZvOysKzlKK029Ak+BDZSM4j9x9AL+B8QBDmg=;
        b=duqjSo8hQASduHvEPk/OXVs1B4z/ujTY5hp5TFxoMIqOCYHJUg9k50qc75HrazsgX7
         tqssRgfOs5coVrRkQI8F/S2YsGHXbe/A9i4DyHTRydUWlAVkWhyliXg2tMZY9653LFkl
         6mJvQko08UPZT5/SVA6nkKrOJ+YIdd7O59LRtvuIMo46DJVAXrWsWOjvxLWx2fp+G1I8
         kfwD1bNkbgBAWpLRajKrMTrTZs5jeyHWty9iZL5z081euLB6nCrkRJQnVve/tNsLyu1t
         lhaGFrisS8qHov1ZEL4ssW5I9wJXz2rSqNMhyuTa87to8L4ThN0lmHaMFFy1Kjz6aXlr
         ra2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756457317; x=1757062117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=huo6UKRZvOysKzlKK029Ak+BDZSM4j9x9AL+B8QBDmg=;
        b=Khum1TonV10JrwslBhpADtlwz5bbZqPGPeWfJWkfDGj94Fski/1bz5Y4RkOpHBWjJb
         vC5ry5/16P3qWmugKpy+4P1ijzGGIe1DFxD771LU/i1vYbuVILrjooMn9g9QE+l0G9xd
         lSF0Y4BpJHGv2/YDT/F7AQTppT5bhSbSKNifNNJLOxZyDupOHw05Zgm1bLOu6jcc3MWV
         ypSdS9XD2BaNUhkdr4WlsQlLfdiNLSUnDZUh/iF6f4ifmUFtprZaf7KYnVR9976HHccw
         KSuVEhnuJYpk6roloyYG+BEN9x3KKW+ypcllxRBG6K210HhjB1vUK68OE9GxUtsvZ3n6
         wJNw==
X-Forwarded-Encrypted: i=1; AJvYcCX0vb7raGi/Sfur5nu5wTuc+G4BB9X6/ZB0wPmgqRQb+u11T8v0kw2Tw5CA9LSqmpSuvcOvcSuR9CMrhAd/Eq4m@lists.infradead.org
X-Gm-Message-State: AOJu0YxzHC9AUauUpUjgUNe8TtvtU4uPWEM2+DQwcN4W4M885QWwoRPL
	aNpr8PMPAtLrJLmZKbe71aT+qeRuGXM8qRxCvWtrMLmc04+cnLlqVg8I
X-Gm-Gg: ASbGnctbSbOQTNVISi0aVZmXFco1+YpxqtEZaqoOh2rawv3Uje8+DIRXyfSOqqpqXOk
	U1MZjfJYPzVyfq7sGK5ko2YYewtrczVKbRputp2Fyhg3a6b0F+P6qHAh+KzwRepm8eUPgToHWmn
	mxTVckL06gA/83q/Hlxrltp4Qp6TM/i2O1CI+cFtsSaz0zqvCYYm3dAeXn07m3TH2E0vrL2MCyX
	KBNwSaO+1O5rg8ggSOLcL4av2jpxEkC/ds1H+kkm6n9BhhzmAJoCDwjqz1Vfywv893fVwHdAPEc
	awTOb7rKww+3rmEiLFaoB8WVtAd81IyDSnbf45OW9Ltguhc4PLxi2D4hgQp34LPpaHpnTg5m6Ig
	UCWwVnXzbXG7WQjv7CiHy3isaAs8viFmZ5xKpTA==
X-Google-Smtp-Source: AGHT+IHNprSHX/gtqW7mH6PGrQAeU90URpR1MuRLk66CvGwjz133vsdLxYv6Yhkc0Ldb3CFt1gYuaA==
X-Received: by 2002:a17:902:e891:b0:234:cc7c:d2e2 with SMTP id d9443c01a7336-2462edc4507mr413113905ad.1.1756457317009;
        Fri, 29 Aug 2025 01:48:37 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-249066e042asm18162565ad.146.2025.08.29.01.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 01:48:36 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Fri, 29 Aug 2025 16:47:02 +0800
Subject: [PATCH v3 3/3] arm64: dts: apple: t8015: Add SPMI node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250829-t8015-spmi-v3-3-58b15ee2c825@gmail.com>
References: <20250829-t8015-spmi-v3-0-58b15ee2c825@gmail.com>
In-Reply-To: <20250829-t8015-spmi-v3-0-58b15ee2c825@gmail.com>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1153; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=IXmE83WrLHoojz0Htjo2nqONfoaTszNCQ2HISt7DOmU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBosWlVRHFdQdeFy3aisUkxWV9ZA27SfibYMoV0R
 fxOZJPauX6JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaLFpVQAKCRABygi3psUI
 JDzFEACGVhhRSiF4ZqOskPQJhky+N+NRBdF+sbQNrZ+xlazYZfV2JNJ2y0VtjSDu5Dm7ebqPDh6
 K3uh1eeiv92PqwLIYi4IpoSgzjhikJ8OXjyley21JBEF/Wy6q5rTHI5ds5weqL51AArgrWeN3gb
 k5k+6Ty2fGtOomkCh3vwYerV/0Oiv17108XRCEC9T/o8W9Xejkd7zBc2VwThLm61BOLZT2sCq9N
 t6cvJP/WY2a58Trz713eLyMZOGwXSdBNS3WOk3qwEgB6heQ6LA8NVFjR5sMWXwa0dVZ5OhPZJZ9
 En+FX7fPu7zpic7sg+LkHvtc+PYVLa4gDFO7WV725avPvD/9BZbo59h0dR/hhSAJ+J9ToxClanp
 J8uYbnDZgDUPpBwy7YOlcPkaEOocxaD62ooIgZpETZWQBj/R+d/hNzLnnxHR/1/ILwXB1kMvY/z
 3bJeoBmON9pWo9EoOVImUQ2jh6trqcYepOCv+J3sV/UmYFfRC5H6mBjTknBEZlecV94khWSWYcI
 1bRZPAQLDGYfZci20++ga3iSQHDIh3q35iWUsZS00LDSnx2hzhG6V6lIdiu7xzPaWy8t5YDnCVv
 dSKXupFEeHCIsB1VK0lfdOiA0Bmn7vEtzgr/fGR+h+ll3/qIv+L6JEs390S5NzId4lUOeRN0cnE
 uaXN/vJs2ZicH6g==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_014837_840707_65471695 
X-CRM114-Status: GOOD (  11.37  )
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

Add SPMI node for Apple A11 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8015.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8015.dtsi b/arch/arm64/boot/dts/apple/t8015.dtsi
index 12acf8fc8bc6bcde6b11773cadd97e9ee115f510..63b2a1ddaf44012a03bbbe3d7ebbba91becda015 100644
--- a/arch/arm64/boot/dts/apple/t8015.dtsi
+++ b/arch/arm64/boot/dts/apple/t8015.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/apple-aic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
 #include <dt-bindings/pinctrl/apple.h>
 
 / {
@@ -344,6 +345,13 @@ pinctrl_aop: pinctrl@2340f0000 {
 				     <AIC_IRQ 141 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		spmi: spmi@235180700 {
+			compatible = "apple,t8015-spmi", "apple,t8103-spmi";
+			reg = <0x2 0x35180700 0x0 0x100>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+
 		pinctrl_nub: pinctrl@2351f0000 {
 			compatible = "apple,t8015-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x351f0000 0x0 0x4000>;

-- 
2.51.0


