Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 321BDCA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 17:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uGegaPWxGQTvhFdIvhwtl2HHlep4qKtefJBT6reESx0=; b=CbM4n/1RTtB8HeKgXgAia0wZXe
	8sb183YRZmO2L+GVW1hD2k8Q6fU4E3Ufste+0i4334mHPxNB8/WWu9Lz1EgkD2pyBfgKKiZPoJ4/G
	YDxQj8FQMJWCdK2IDd+R1puDM4M7bltl/QtOUf20qYtAUP4+GYcDFYEO1DxD/TuQf7TQxFU/8IjuO
	vOc1Heg/nb/xLqtghMyGz8qB9j7y6D/giNP4bBw8gYSu1PmwkyBYHr+E3ltCx8u7inm7I53ZKxNA9
	KrnXzhbqT2KuI9PDu015HRrO2z2wzMoQtd+fEE7z8dwHAluQxeZhC0S+IoS3xqoWUQg7Ux5xaS+oZ
	2U/+i3xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usP1K-00000008C4y-2ia8;
	Sat, 30 Aug 2025 17:05:42 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usOl0-00000008AAu-2EO6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 16:48:51 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-45b86a6cdcaso72775e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 09:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756572529; x=1757177329; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uGegaPWxGQTvhFdIvhwtl2HHlep4qKtefJBT6reESx0=;
        b=IkkzmPc2DWrxBQrd48+uqsyCe47zocBFxcH9dAy71xys6unHysuFyUPoDhvFdQRZbe
         37jRja2AibwnZ6GfxFagydfMPtWFBuKYqtS2BTL41fjDZ/KHKJHatF4Afwwf5hMkBD8+
         yUZDAHp9L2q4IPGWwpi4DAy/KTFihBEOcQKzanxXAYuTRkUTFu9JfK5JRD8cnTzZeqPV
         zUoXqDMaPPkw5/kWMmnsO4T16Qh9AhbAlgkG1GF2NVC3iTT7uySqKhom57/5nlh9EPCQ
         BV0TdEZefwFLzJ3Ap5Ixe+k6yVuCEv4OKBeSxge5IxuGBOEin3OAyWa5L7DQHelL+5su
         niug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756572529; x=1757177329;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uGegaPWxGQTvhFdIvhwtl2HHlep4qKtefJBT6reESx0=;
        b=q4BzbvVh+KrIBB+NsIncb+G+tnpWTlpU2VK0yNG08Djyyr6pD45qYqCI+1qip5xCxP
         AiVreaAkTVgo3s6rp5pNtENuJtSJjYbVDiVjI1IBjQr4sX+IyJfWBdLuyAHG72pVQlkX
         B1cDG4W9RZbwLwQX2PvXfn3+IFAr7xPyfzdELCIDMuit8fcnhnOXpifhCYy3cw+Tmoxm
         SWW/B39OynCam/KDkLhL+sKjWtxEaq9YTQFb6qedYfUpP62Wf7pzqq7lhpsiOonjGuMx
         V+fgxoCw/Xx8xBGC0dHD/SXZKtQXOgsp7hEL46j3M/lpiZUhMcH0Ct5wTJ4/kFTJwEEu
         ViCA==
X-Forwarded-Encrypted: i=1; AJvYcCV/eyUgoL34uG0zwUcZj/P8iCXZPldsOQKyqygSq80rrCzF78DQiGt58JEIlW1fBkXTWBp91yDOC/B7EYkMxXkM@lists.infradead.org
X-Gm-Message-State: AOJu0YzipZdvGE7Rj94wsSUsqxRA6G5Viee85VRbV7AnEIzhwL3l4GT9
	koETsKh28hOhrY1TrqpqCd2/Yx70b+53dtgu2XxU/KgszRLhDXMVXwD5HJT0ovt5kKY=
X-Gm-Gg: ASbGncteDY5hJ0eCbFZsqDXrjje00dsDDpjWCv0oKvv7ilVbc2m9ZbzqvpGDGSp9bhm
	IyY3zOFpIlLMYtovprsNnVbeYp9vFCqy5cWOE6dUPiOVDsmseeEL/E/gRRcungmZkT4n4CEYVwE
	5uFhagy5244SYkaaaJVpbJyREVwQ1uUSzDGHYUwspnxqkJeZdrwxxD5tSM/3PP7mY5Ii7BLsyVI
	u7N/Ag++mRS2d/z5Wc5P08PqH3MF3/JadMHXxmP4a7oPCBPisnKyyEO0e9XW8Zwid+CedO63heU
	o6zQ4KieT02WqcMJmC1ZNbWm02coDBC34nC1+0tRM4fSkNzZUgowL0dhF2gFw8ZaIdTfeOu2c0c
	oAmwnEB3jrVYL3wG1TtWyhTvSKu8bWeLubbhFuBE=
X-Google-Smtp-Source: AGHT+IH7Z/kvyvopM2ZnHxAu+WCRchp8R1OWKLCzlB4yVnosvVIsNOGkgCloMAkokNIzpMGMhjhXuw==
X-Received: by 2002:a05:600c:5287:b0:456:2137:5662 with SMTP id 5b1f17b1804b1-45b81f120bamr22809295e9.7.1756572528946;
        Sat, 30 Aug 2025 09:48:48 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf274dde69sm7818129f8f.14.2025.08.30.09.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 09:48:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Aug 2025 18:48:34 +0200
Subject: [PATCH v2 5/5] dt-bindings: iio: adc: samsung,exynos: Drop
 touchscreen support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-s3c-cleanup-adc-v2-5-4f8299343d32@linaro.org>
References: <20250830-s3c-cleanup-adc-v2-0-4f8299343d32@linaro.org>
In-Reply-To: <20250830-s3c-cleanup-adc-v2-0-4f8299343d32@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1987;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=M52Ix5e2ZfY480bhbf4Da85nfANVV5Q7GQgHm64bNig=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBosytm4JHyzH+AmZV5ywRHpisz2B5V10Ey2ZqXi
 ZkjUY5CvsOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLMrZgAKCRDBN2bmhouD
 1zmzD/4ppk5vO9b3vahpeArWbxkYzHayHXHpMN8v8pvD3pzMJ029qz5Zkv3REblrgn8HRmobbak
 5rGSq5Yrfo6/aF7cfHFUfpBOoUBRjNGyRyaMK/e4gESo+l0qJrrSHhWMQzuT/kezBuT9VNs6gox
 sfhS1/Y/RvAckDeLV46jXtRNAcIEE1xbnxezlRkemJPd9GHz/5FikDKOTLuTR03020aLhGpJlgD
 6gb5/yQguf2lK1zBQ2OynKcpzAaRFpF5HNmFAgx0CvbqAtqhSOBl34MR3rzjzfMC1BaEQv7qjNK
 pt1o9mgMZiMNfTf3WQkR8aJ5YIPwWJUKICCwTIzdndDc8FI2kk2q0llE1BnBamT/n0AqppNc8wU
 rCfdwcv1zx6irWkafqebcuyOGlqMNCHCUPl07bGU+Dw/qBL/AAoX/7Hg9POwHjgpn0wAvCvUShJ
 A2K1Sr4WRuJ2kJoXHev458ou4bcsPRW4Fsdy5M9lvaTEbVKpSp6ot8//nWkoCv7VdUX0InOIMwU
 ej/oLXtYnCSDLITwtiVt/RwMxMN7bghJdgW6DmFJ6RYayGLrWLQhSi9vL5Vox7a1j1S+2Vb8s3/
 HCZROQXDgwxx4e87GeXNVc+mqmZgdcnEab1k+5uxz9eZSUgsgrR5RpkRtvRYfRq31MeZXcGiDoX
 MgEQgosc2lfW7qA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_094850_580107_D1DDE100 
X-CRM114-Status: GOOD (  12.50  )
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
unused has-touchscreen property and optional touchscreen interrupt for
samsung,s3c6410-adc.  The samsung,s5pv210-adc is the only platform
having two interrupts, so add a constrain for that.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Fix S5Pv210 interrupts
---
 .../bindings/iio/adc/samsung,exynos-adc.yaml       | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
index 73d7ba0fda1def433a97d10bce21e762a307e36c..def879f6ed20a3ad40baebed6557082a358cae2e 100644
--- a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
@@ -42,8 +42,6 @@ properties:
     maxItems: 2
 
   interrupts:
-    description:
-      ADC interrupt followed by optional touchscreen interrupt.
     minItems: 1
     maxItems: 2
 
@@ -58,11 +56,6 @@ properties:
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
@@ -114,13 +107,20 @@ allOf:
             - const: adc
 
   - if:
-      required:
-        - has-touchscreen
+      properties:
+        compatible:
+          contains:
+            const: samsung,s5pv210-adc
     then:
       properties:
         interrupts:
-          minItems: 2
-          maxItems: 2
+          items:
+            - description: main (ADC)
+            - description: pending (PENDN)
+    else:
+      properties:
+        interrupts:
+          maxItems: 1
 
 examples:
   - |

-- 
2.48.1


