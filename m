Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA45CCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 13:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rFXbojovxWliJMkNJdsF09HvmueXHOHMsMOPKrCfmZA=; b=suwiZf2UC0vrXTErD1c3aYQ2p0
	jYx3idmk2ZazclCR7YoB9zyiuNF8x2Wm5dnuhUtAjFJDAzsBhW4zF8Dx8JNXnHFK9NeESdTPvV5zo
	ZpRRMa6phu5G94FRhTihsjsUAiNQl1rQPHC4JCAbZj4vB1hNiGwwp96YFisq7fR2/aoQfWFRpGFZA
	wS9oQ2Sp+EIu1euZCpc2CjC/pUNZt3NS9zQxlDxCE21srHyXL7kKhF18acAzdfiQhcvi2MoaF+RiX
	G5vBj8K8P8z4r3tXD+gHyj6u9V89GD+zju64wG0F6kcmcVjlJWcG2Gj4b4Qa2JmfV+diPZA2COLDh
	AjkrVX6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYz2-000000031CG-3NZw;
	Wed, 22 Oct 2025 13:34:32 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYz0-000000031Ay-0ftX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 13:34:31 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3f4319b8c03so793444f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 06:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761140068; x=1761744868; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rFXbojovxWliJMkNJdsF09HvmueXHOHMsMOPKrCfmZA=;
        b=NfUSz43EXOuCE1eRonSg+bNUxNbrQ+uHS9NqyzDdL4fW3vu1m5Fo00J5nGhf/5VOa0
         YLhD3HDxuntNN0Ww7TRFpPTW0dPTllvUlSZ9bZFnYdXI1sD2AFGiU3CshiGWzSa6Gv87
         +lJCmMInxa4E+asDjCDPWaLAC598oUA7xxpiMIwTaYzLQUwvyyOIdeW5+LU7VwMgYDlm
         UchiQ2NWkngwLDPbqtnLYqHBIXCsbuRBk3sS2vTVYosTp+7njwaQYKeS1JpPSYTECPi8
         R8js3TH2RHRLXw8gOIzLwt/zX3Tgc7xj5uFFyS3lZtzKoY89s6i/CsdMYyWzcm9hPyrm
         RNJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761140068; x=1761744868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rFXbojovxWliJMkNJdsF09HvmueXHOHMsMOPKrCfmZA=;
        b=mhFI0rLik03zQ/QCVG7oKu1RbFLcg4i/53VUSKy2dHBdwS8HfGEu+qshHF6O3OaAbw
         5QLXSEj4N2ibrvtWSLJuxbZEabIFnQSBcE9/zD6MG0coyODv17DV9v9lNDR0Hy0XxAT4
         z4pzW23homabp8YPUOISZPtd/fM9uRtjHMmK9QaNksh36nP2ANSgA+M+iEYAxEEm+IHK
         CiEKis+m0g4TXbfJqHErVL3K/mV2EFhI/fJFQqDr1rsHqqfDJw421p9MEsYVGKiuXiqY
         r79UGbG9mnC70gUI2igVGfcxVq+lFmmDNgeVbIXt0ysq6+GI9CFq6NfUGypE6AoeSmUD
         /qOw==
X-Forwarded-Encrypted: i=1; AJvYcCXSda3Z8azdveE2MxO8C5QSUPhWg9jlErITpWusCfNHjDc5ASv8h3/rmEMUDNTrUKNiXkbjhH3omehnaJ67dIe1@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0KuJGmkOV82r5V6Sf2ePvvYRdiBuXSRc8Wn7j5O99UFd6mvjA
	IfSNadm3Wd5rz7unxU2xb98E0cOaTYfUjZ2ztJn7I8KEoLiKjpFg/hxSyNVEIlDjPag=
X-Gm-Gg: ASbGncvSxq/Kx0fZFx+qyoxUm71rp4DLj39tF7mxAMtIytJJefp8/gafCEHRGWCY2Yg
	OPu62G0XtxeSmDisHcGQ9LT7TrRSCuAvLsdT6DcWHsaE2P31+wdSIiblHXWWjd7YRnvYmgqxLe9
	FBeXe7IKeTINbNEI9F+cltO8CuxVIrkEQVK+LbRyUIH2cAmdf1Oku+nU3XxMCeOmolUYk3HpBci
	hl9uCR070AKMDNCz89WxmATRA+PvtrS1TpvXlHRtXAQVD1+qkDlIYlo9YakBfJ3r8rJpNn5+Xi/
	LX8Ogh0wq6l/ne1VgIZgLYSMerdWKvUqbXwJE/+MYlfUzPfCymwKFYtBhr9n/10JJ2//hUcjxQP
	tIu89D05B1S306NhzKNZ4thVsslt08PBFPFTN5NDqzftN/vtgm+9AjiduG8SNIcAAajQpJOHEh8
	D/T8UNUj+g0dP8kujQaMHUCg==
X-Google-Smtp-Source: AGHT+IEWcnZIaP2wLBKfRqry0HILeS5KfSEJcKKwt34JV4PPLBebPsmgOhwbhA8EkzXLqs8P73MPpA==
X-Received: by 2002:a5d:55d1:0:b0:426:fff3:5d0c with SMTP id ffacd0b85a97d-4284e531afamr2257012f8f.1.1761140068108;
        Wed, 22 Oct 2025 06:34:28 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42855c2fb92sm2981201f8f.46.2025.10.22.06.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 06:34:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Punit Agrawal <punit1.agrawal@toshiba.co.jp>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: pinctrl: toshiba,visconti: Fix number of items in groups
Date: Wed, 22 Oct 2025 15:34:26 +0200
Message-ID: <20251022133425.61988-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_063430_220970_F74C77C7 
X-CRM114-Status: GOOD (  10.56  )
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

The "groups" property can hold multiple entries (e.g.
toshiba/tmpv7708-rm-mbrc.dts file), so allow that by dropping incorrect
type (pinmux-node.yaml schema already defines that as string-array) and
adding constraints for items.  This fixes dtbs_check warnings like:

  toshiba/tmpv7708-rm-mbrc.dtb: pinctrl@24190000 (toshiba,tmpv7708-pinctrl):
    pwm-pins:groups: ['pwm0_gpio16_grp', 'pwm1_gpio17_grp', 'pwm2_gpio18_grp', 'pwm3_gpio19_grp'] is too long

Fixes: 1825c1fe0057 ("pinctrl: Add DT bindings for Toshiba Visconti TMPV7700 SoC")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../pinctrl/toshiba,visconti-pinctrl.yaml     | 26 ++++++++++---------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml
index 19d47fd414bc..ce04d2eadec9 100644
--- a/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml
@@ -50,18 +50,20 @@ patternProperties:
       groups:
         description:
           Name of the pin group to use for the functions.
-        $ref: /schemas/types.yaml#/definitions/string
-        enum: [i2c0_grp, i2c1_grp, i2c2_grp, i2c3_grp, i2c4_grp,
-               i2c5_grp, i2c6_grp, i2c7_grp, i2c8_grp,
-               spi0_grp, spi0_cs0_grp, spi0_cs1_grp, spi0_cs2_grp,
-               spi1_grp, spi2_grp, spi3_grp, spi4_grp, spi5_grp, spi6_grp,
-               uart0_grp, uart1_grp, uart2_grp, uart3_grp,
-               pwm0_gpio4_grp, pwm0_gpio8_grp, pwm0_gpio12_grp,
-               pwm0_gpio16_grp, pwm1_gpio5_grp, pwm1_gpio9_grp,
-               pwm1_gpio13_grp, pwm1_gpio17_grp, pwm2_gpio6_grp,
-               pwm2_gpio10_grp, pwm2_gpio14_grp, pwm2_gpio18_grp,
-               pwm3_gpio7_grp, pwm3_gpio11_grp, pwm3_gpio15_grp,
-               pwm3_gpio19_grp, pcmif_out_grp, pcmif_in_grp]
+        items:
+          enum: [i2c0_grp, i2c1_grp, i2c2_grp, i2c3_grp, i2c4_grp,
+                 i2c5_grp, i2c6_grp, i2c7_grp, i2c8_grp,
+                 spi0_grp, spi0_cs0_grp, spi0_cs1_grp, spi0_cs2_grp,
+                 spi1_grp, spi2_grp, spi3_grp, spi4_grp, spi5_grp, spi6_grp,
+                 uart0_grp, uart1_grp, uart2_grp, uart3_grp,
+                 pwm0_gpio4_grp, pwm0_gpio8_grp, pwm0_gpio12_grp,
+                 pwm0_gpio16_grp, pwm1_gpio5_grp, pwm1_gpio9_grp,
+                 pwm1_gpio13_grp, pwm1_gpio17_grp, pwm2_gpio6_grp,
+                 pwm2_gpio10_grp, pwm2_gpio14_grp, pwm2_gpio18_grp,
+                 pwm3_gpio7_grp, pwm3_gpio11_grp, pwm3_gpio15_grp,
+                 pwm3_gpio19_grp, pcmif_out_grp, pcmif_in_grp]
+        minItems: 1
+        maxItems: 8
 
       drive-strength:
         enum: [2, 4, 6, 8, 16, 24, 32]
-- 
2.48.1


