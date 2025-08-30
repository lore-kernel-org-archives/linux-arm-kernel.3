Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9606CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 11:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bh4erFgymhHXlSdczQn09Ns70cyX8l95wuvz4MlLE5Y=; b=zpRCHC4ZoVHy5SaCH6SMe1ihJ3
	U616rhStgqnniUv5IDONKa70NgIWycUV1jUiFLROQESQKdU/o7RNrvENOlPvN+Cd4CNDWGr1/RiPE
	cD9yBDYjQegTYmRcthDp6rVSyqCogKEdpztbqiY64kv94P2y2L8AX80Y+vXdhjMXogMMyjAzCL3iL
	HGl9s4p7UGnwa4x1CT9tzTLGoBFA2nFeZ24+Gpe2OfKUwXoKyRHfte3RxDBrx8TUB3do34wzhaBHh
	oM0QD9T81uFaX6VWyeAomeTGmGqFleLvHQ+Omc50NmzuWcTlfpWId8BWUQHBMuyTgWG/iRhgkjn6N
	Go5igoPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usJkg-00000007oP2-1xM9;
	Sat, 30 Aug 2025 11:28:10 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usJT3-00000007muo-0RJH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 11:09:58 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-61cad8d2a3eso401290a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 04:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756552195; x=1757156995; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bh4erFgymhHXlSdczQn09Ns70cyX8l95wuvz4MlLE5Y=;
        b=ds/K+MimELArvOEF7PDTcY2ot/G2dyrH8g07do/HsgK1mul9FwkBvq8oE5vyedTcF4
         BxBfN//R989dud/Xldlb3LeAKQuVBsf+0WgVCCe2skDByX5BCugIijziT75jhHdvn55y
         x8mE2eUYne8uptXmEfDvRRMizp6ECxKJT5yPUEj+MDK3qmu10BJqDcTvtjRYjMGjG5Ch
         i147wX9yc2VVY0YUhGgJMyJEk7doc9bkDk0k2UJA87AxpSWLeg3kWOMBMW4EeAiYC7WN
         lgNVN4TXkkKPSFbNpxYmrKrja+S+duFwYIRYRPa9XaVAcT09MykR6DFokV4MDJ+7RIP/
         fC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756552195; x=1757156995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bh4erFgymhHXlSdczQn09Ns70cyX8l95wuvz4MlLE5Y=;
        b=fWeYa0Z8h5UELp+UEN+Ta8mc7sHV7UoJeNaTvnmqeBph3e1UDxGTlc2+EI8tqCt2nL
         XYmk45AS8WzH5vgA7WX2bJRonnifW5aQfpqZk/V36VQv8Gv+ARBxg8nGnHCXzSMWASQx
         I5KmbbddlWZqjdKcPdVim2vBEy4avmX0MBQf8ojY3nXazaTJlBkWbRlq3ta3N/DKDqss
         UEaG2pxFtNqy9L2mWGCQGsZQDAWnepHrOZoNV83WcRgyfO6Ep5/FOpaqQiD+PHWnbqL8
         UGoAJy22tenLAEclR7yqY8E6mgC8mImC5nUdfP72zLkujhriOigutfkexsOVAv4ek110
         NiXw==
X-Forwarded-Encrypted: i=1; AJvYcCWjkwOYyhO7j5zgNaeUAhAdZPpW6rPXxAdWd7psLMNWDnN3b8RZ9prVFVdRnnaBQq0OfOf9t8tUy3gSVxGVMChl@lists.infradead.org
X-Gm-Message-State: AOJu0YzXHDdM/AGb/heb1DXRSLEmR/n9lrEhMcEFfXpwgZOZVP0DiYsJ
	J008zoVx/6C1X8T1QPRzzvIYypOAsAU3leFhoDNqhpk7dOIfHsZBdiFGSXoGeX/Q5bE=
X-Gm-Gg: ASbGnctDfIq9UXnNOXQyyb7oMRtbPwmXX4JE4PAVXUhivXzPQjwUk6ubsvozHg8jIW+
	QFVsuqVbJVDzqlKqoN7+7sR6Mq15QnsDWf7u2osQDf4VPgBBElud7KDzK+rpN+qx0NvsU0TpZvY
	GQEVaLanOVsNQ3yP3sG2pYbp9O3apwrZ/NTuVyudjXmvLuqPmboxc1SOfBddW8KuKnB3gzwujrR
	erZHQWZVuQF6FP0O4nlvGt68joPxU4cQY9QnvlDU/gzWxKRisY99GFSDMvhnEeGKq7gT9P+xg8F
	s9nJwtr6hEbQ4TqRDfHxJBImQoXHRUdlIsukrPH2SP5Igw+royfq/LLq/x47lESWpvpWcQLvy7m
	7EFQ3RfS4U/tpiMO3DK1/HQrPygHy9uOg2fu50P4=
X-Google-Smtp-Source: AGHT+IFBgu1ofh08wSJsUXZGfBTpuxs1IaZcrmEM87+9ZBrU5RDUdFz4gzUARIltFoHjOTc1YvjmYA==
X-Received: by 2002:a05:6402:2105:b0:61c:1bb3:2473 with SMTP id 4fb4d7f45d1cf-61cfe999d10mr2852784a12.3.1756552195504;
        Sat, 30 Aug 2025 04:09:55 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc21542asm3285666a12.18.2025.08.30.04.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 04:09:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Aug 2025 13:09:42 +0200
Subject: [PATCH 5/5] dt-bindings: iio: adc: samsung,exynos: Drop
 touchscreen support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-s3c-cleanup-adc-v1-5-de54dfb1d9ea@linaro.org>
References: <20250830-s3c-cleanup-adc-v1-0-de54dfb1d9ea@linaro.org>
In-Reply-To: <20250830-s3c-cleanup-adc-v1-0-de54dfb1d9ea@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1659;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=cHIEU+NPJpVUCzgTWpzKVI4NuSvxjRXzW+gY2ZxvjWs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBostv39456voN2g4Wi5/A6Obv1+NtJbj+zc4VQK
 FOmRj3bE4qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLLb9wAKCRDBN2bmhouD
 1xcNEACEkHrmoaC5qwjaF2gjYtInfNH8N/FKtg7etMoJXRrCaNqinwSklAwwUFZD654hDJDLZ0K
 MAQSvEnfCZVLggE5Ts8O9z/uk+ggfYvWin1Hfp6/FNww3cEwXYp6j5ynb6oyPow5c/ItmdeC9JX
 gK7Er1IlJ5+Rz0L5TU6J5EoJZn8F500lY5ExkpXOXhNB7A90+bUPomCzG4f3hLnhWWpFRj/w8Jv
 YwRDtXCVjkJ8Tj9I5scGmKzYEzA/xlSx1KkwAMukQoyLS6ROqFLTiMIjqFqqTOI+salro3quSHi
 diJu2y6tjzqIQrEUSPYwoEsmpClANA7B9w4L2PY7hJ6DIzeep8NwIhk/PY7ZZZQ2ThOLLWQpX3s
 sw7ZPXny5LSkBzE6A5kbMGklrjBxD54AkfkHOxIdtiqJBp9F4ls+lLHUpKCtKMvvzX23Myy5OsD
 yPTUXtgxbMCEQuDAfp1hm0xWBD+zJvWux2FIe+mjeVnahghukgzHPq+I6Bed1TkkYMAUnhSGIA0
 DYg6ZzTNkQCHHatjYCTIENVOtgKWL3Mxj12Q4CEwA49yXJZnGgNU0kMsjaJ8BRxRIL0+TnjBQ5c
 MHpV3EKFFGdREqfcRqjEw2pyuB5g8hoDtb3NxghjgkDGX9nET07QYhAaAORF80N8du+EP+MNzz9
 vGDcv9oR5wso+3w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_040957_148287_3034B5E2 
X-CRM114-Status: UNSURE (   9.97  )
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

With last user of touchscreen via ADC (S3C24xx SoC) gone, drop the
unused has-touchscreen property and optional touchscreen interrupt.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/iio/adc/samsung,exynos-adc.yaml          | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
index 73d7ba0fda1def433a97d10bce21e762a307e36c..0654f8972525bf67089fe7fd4f3ab3ff506515c3 100644
--- a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
@@ -42,10 +42,7 @@ properties:
     maxItems: 2
 
   interrupts:
-    description:
-      ADC interrupt followed by optional touchscreen interrupt.
-    minItems: 1
-    maxItems: 2
+    maxItems: 1
 
   "#io-channel-cells":
     const: 1
@@ -58,11 +55,6 @@ properties:
       Phandle to the PMU system controller node (to access the ADC_PHY
       register on Exynos3250/4x12/5250/5420/5800).
 
-  has-touchscreen:
-    description:
-      If present, indicates that a touchscreen is connected and usable.
-    type: boolean
-
 required:
   - compatible
   - reg
@@ -113,15 +105,6 @@ allOf:
           items:
             - const: adc
 
-  - if:
-      required:
-        - has-touchscreen
-    then:
-      properties:
-        interrupts:
-          minItems: 2
-          maxItems: 2
-
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>

-- 
2.48.1


