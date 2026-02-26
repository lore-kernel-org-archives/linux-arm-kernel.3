Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2211FFD8FCE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 15:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H/kgDWAlaVKVnE11W8S3H0mE7bshX2fubcylJ0A4KM8=; b=tnFL6UMZh4rQ1DbWKKAwd8z4x4
	pAoICsYgPFoFLmb/vNksW5atOj/68m1HfmETZudGP6RV4uGurgCaZcWipyqyVPzr6KFtpha8psTSS
	wKAvm8Rkoqn5M4J88cKYHBwDTbFQEF3r8keEi63fDY7Fsuu/wunxxMHdqy9rLmxQ8omFgcvtgtON2
	sOzF2CFhKVk42U8Q7TMgSpm9QUhKqM4KZHlcwvrKTf+NoeBhLwp6mmcipf3MERx0jzTqX5OPgkQbA
	xbeZmLgGu+6SEz3hPTbZKtHHy4UlNcG41uE3hQ4Hbu5viMa1Yyp/imTesicTzeyzT24eXCVUMAxJ2
	YjUDdq6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdaC-00000006Y6K-3fVq;
	Thu, 26 Feb 2026 15:47:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdaA-00000006Y4V-2OEG
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Feb 2026 15:47:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=H/kgDWAlaVKVnE11W8S3H0mE7bshX2fubcylJ0A4KM8=; b=FrKa3PNHqwlsy3BZ/xVwoF8qHf
	smM9wOPd4lyChkg8BV5Cr7uMbUwPcl8Uh5iOZ6U/S6+Yr0yvoUXvQWzIEfph28tuEhYGgxu6qvPk2
	oso6s3jNncH/QucDzJmn/eg8UuXeO3bLEZbFyCrw4BDn2OFB6pZmKRPrnXEBlO5Y/RH5RLI1CNqhr
	sj5Ca45EwtKOCBhozLayvVHr1m/T6o2+ffixk+1aGgcyx60/QRPVInUw3H37FHzF2ixfuprnEWwsf
	bSWGlWh8kmPE04iK9uD7WpbpSf1TeWDDp1IHglQHhrww3LamFXwJ7ZtIOmdI7rXF0sACUuL+v//c5
	xolpCEvQ==;
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvda7-0000000BMyX-3ZTI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 15:47:17 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-43767807cf3so716944f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 07:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772120834; x=1772725634; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H/kgDWAlaVKVnE11W8S3H0mE7bshX2fubcylJ0A4KM8=;
        b=wo4jB+BgPMKPesMu6VOqVNBmz0HzayB5HGB2JYOfHnl69s+2JB+0CyE97fn41MJrJc
         Cugx5Sf3XYnbn0kSvXZQ6KMnxpVm5vAFweWFDCaOCiJooR0FPdv0u6Xz0WFUygq91wGr
         hHx7+iz3EG/UbsDzzGzTfSwDHT0agho2pNQDpIGYsUCPSO4VkcnNPjlPGQ39pAQkiE4o
         hiHUHHbjzCYgAuQdJV7iLoHRHhLhOiCXXGHsReyOe5I0TDRTVkl9++bX0J4a0eR757Gs
         MsqWWZDX7+DYVU9i5PrwiboaoakiSMooat9eigOevjwyIaplV16EHzSfGhH33OiZrLDZ
         bjPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772120834; x=1772725634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H/kgDWAlaVKVnE11W8S3H0mE7bshX2fubcylJ0A4KM8=;
        b=cuyOX2FOUWBX5v31cifSL8Ja5kQhWJn4JOkNFnqI3MdD5Z85W0AHyeI+YO1LN3d2t+
         lM159oxntCncvLbuUSCfPf+oTSiJ4E7625kkUfDtZq4RPuUgYTSKxJcdJwd/Vv6yVebt
         jlHTenyiYs25D5NdfjNBkR4uvNtTncc5EVethuIV3If4+BmXMT9jf0HMiMrfSg/TkeUp
         bxcMWNKCKBfg/9cNZJVGafGCcDlIu5qfA0uOXB0vtDWY5D6l51XobQ0UndBDHw7tkc5W
         Rn7OHfGm2MjmxYwsHW3pAcb1E+f1MTNyZzvzwdizoyAVrygWHctkNECk3U1o8E3bqsm5
         9lJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgkd/V7S1j9niZErHdG5UZPPK9XE9x3jvPUS7Xz/pMH/E/KGbRAKvuXm/u2Ju4S19TKNGExXw28QHx5ZuY8Cij@lists.infradead.org
X-Gm-Message-State: AOJu0YzSQH8F7qIIkwzjECPJWBmMeZH2F/WFtAz0SNnnfCD2KsbzRYPW
	O8izsgyfKelZ13/F3W33fXkdN/HsHnVM5wYNJ3KkdjqM8e4bL4jFRdhHdCfUvzhBOCk=
X-Gm-Gg: ATEYQzz0MP1O5gCcM28iRm435DQ835vUVAB5K1hIgMpUfpC6kZ7JT+qY2FjWtsinC3f
	2FX/2qFEsm6cjjPxyf88A9tvXTJJBJv1PUNGFvqawO2IbGemc+a4qPaXzt731Hslw/GhvNHvXe0
	VxcL6SlG4AlNitobXqguBV38sSSSAvtfU8HpTqBQdheAKXmiDUiPzfwTjzv5C4u74L9SCE7/Ni4
	1Q3usF4k8L2VLlH1DzyeBRGLEwKmo6jtN11WJwuqXzMZ6aSsNjVX1PnbzNZ5tR5kLNste49z1lY
	YPF7n45ia14vS7K15EV1TVKt37te1oL1k9glMkQhLpGkUaM0XtDj51BKxK9ztm1XPGVYdSdrUFk
	GD94t49BUDkdrf2CTQNer2N7jOpd6qjwkNC1JKqpdean1ATNIP+RkGG19An2Du8OWAPO52rYaoz
	XjrmePWWIfePywLhfZFh3c/07MhuMbixXNsU+h2MKWXIwYsLPU2Tnci69uNfLGQHL7SYPHEt7/V
	STtRClfctHo59E=
X-Received: by 2002:a05:600c:4750:b0:477:a978:3a7b with SMTP id 5b1f17b1804b1-483c219eba1mr74883375e9.22.1772120834054;
        Thu, 26 Feb 2026 07:47:14 -0800 (PST)
Received: from [127.0.1.1] ([94.4.193.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b4410bsm56007365e9.6.2026.02.26.07.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 07:47:13 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 26 Feb 2026 15:47:10 +0000
Subject: [PATCH RFC 4/8] dt-bindings: soc: samsung: exynos-pmu: deprecate
 google,pmu-intr-gen-syscon
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-exynos850-cpuhotplug-v1-4-71d7c4063382@linaro.org>
References: <20260226-exynos850-cpuhotplug-v1-0-71d7c4063382@linaro.org>
In-Reply-To: <20260226-exynos850-cpuhotplug-v1-0-71d7c4063382@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_154715_960420_F6BD5FE0 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
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

The generic property samsung,pmu-intr-gen-syscon should be used
by default for Samsung Exynos PMU hardware blocks. Update binding
document to add deprecated flag for google,pmu-intr-gen-syscon
property.
While at this, also add dependency to not allow usage of both
above mentioned properties in the same time.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 92acdfd5d44e..1ff1a8729989 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -119,6 +119,7 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
       Phandle to PMU interrupt generation interface.
+    deprecated: true
 
 required:
   - compatible
@@ -207,6 +208,11 @@ allOf:
       properties:
         samsung,pmu-intr-gen-syscon: false
 
+dependencies:
+  google,pmu-intr-gen-syscon:
+    not:
+      required: ['samsung,pmu-intr-gen-syscon']
+
 examples:
   - |
     #include <dt-bindings/clock/exynos5250.h>

-- 
2.51.0


