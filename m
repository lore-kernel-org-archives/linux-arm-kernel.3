Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F440CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 11:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+TkKDb8seGZ3p0bb+weF9fHd1+l2SxCH4jqobx5Z0NA=; b=0tiPMj9JNL/xVRPieWxFkYusyn
	FfjqrwKGe8X5DDRioxBBPVtbnHzmVB2qeLGEIScGE0usMueSkHELdPp/5AW0KQdOAnzqwbJRQ6MpS
	s5xzF9oDFTnaC02UbwyxYxT7uIXD6g+7q/56V4ZQrRSn4mR1VJ59j0Z7wMa++3Lk6pom2mFPKlF+/
	TMnbauKjt4O9vKHtEZPydm+KONF+v1Rd/hJ1GtVHFtTrxqx4i7fckhMrMJm+83ub6LevYYr28Jbr9
	KXXvPqyW60dlwPedqBQ8cZ4OJc7ItHIJ6kTgaewqDmLa6N/J/nhbH6dbe9bS/ARz/mmw9Vdk6MEHI
	xotsCR6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBWsa-00000002cs4-2kah;
	Wed, 22 Oct 2025 11:19:46 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBWsW-00000002cpX-33Hu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 11:19:42 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3ed20bdfdffso6161201f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 04:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761131979; x=1761736779; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+TkKDb8seGZ3p0bb+weF9fHd1+l2SxCH4jqobx5Z0NA=;
        b=vdAqRStmtiprwnQV/QUbJXnZH5SL8sd1FMEOD77UjA+Q4EePQ4M11XIjW9AdvD63ja
         XMF/3qhEO+ztHN3m2VQ/dDk/u1HvPJQNhqvcfw0Hrwz2nj5X3wwXeYK4ZM9r0QZ9XxMV
         CAJu4M2E0PTvVNRF//u76ra+Ob2yCe4S94R8B62pSjGleeZR9VDQpEeXWc/NziBHEUSy
         cNggVgt/iTr/8OvVA04+Zhy36hO+nAwYqZoyDkB3V6lsU0iak9r6YYakg50CR+UZ9Ow3
         z8QJ8n6AxTrL+GD7MLQiikZDjFpMezxkwlknNZG5URXNu21SuwAmrY5JizP0OmuNOOWK
         bO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761131979; x=1761736779;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+TkKDb8seGZ3p0bb+weF9fHd1+l2SxCH4jqobx5Z0NA=;
        b=lF9I3zpe3MS7BG9dz/sxfONYXDrMUS2nlOgeZGQh+5Sml3tNFQAFTgdx870FxHMHCq
         EDu5ect7IzU5cTDCCqQkbqjb9gHdeevDrIBH+z2asbta2eYfLKQIfUjB6Gk8618cDkiH
         xq6ZpP/kS6eWOS+p54pqXHrIWev5DhqndbzPF4zGvLaMWE6Ja63dlKnC/wQMi2eH9s+g
         RWzCOqu9E+VFT/RtaAb5RZAn6g+/KvOi1jzSKncKoMdybOKWoJMKoGOUuXUYg8xucsok
         TRrHWe/l4rMn/Q516lb0dGoozwCHoUB6LSxDjjA9mOd/ptcNltCUWUNcrq5Trw3HMGL5
         jHTw==
X-Forwarded-Encrypted: i=1; AJvYcCUDee4FEIB+pBzax1Bt7H/SPMDU4RkFiXRDGHxFxXcmT8gzc38bpa18jt+I4ynniaHN7Iy4RAJra+AZMBDHdFF3@lists.infradead.org
X-Gm-Message-State: AOJu0YyZ0lQAkp8JwVF7D5kew0iYZ086KSRqgxXrJVl6LLSv3uKZAxm0
	umhI7IewIZIrr9VkwVPrFt1g96Ynbx1UeIiAyDgJ9DfYgDfP8UWWzvAh4E5uBg5vSXM=
X-Gm-Gg: ASbGncsm/yU9tHve68afQyPNxm6qlHYY4iHLA5Z+tMShKInsZdoWxgQKGN1PO/Kjim7
	wSWLVSb6OeWhB/boxdBtk+HFzOrwHdHkVJ8mBRe/VNu7C+KqsQHeiTkkcuHAsl7s4kMVroYDpEr
	mLhiFPdpjfGdyju5evEzN3NnxXB9D8LGnVuYzs9hrZ1lezyAVwPEDSJ1m1vUTL79FTl3tEUcktP
	pG+fPJfUVRnHzCpWv5dcEPWjqtl4Tn1+YvB2RBpBQiku0ndzuT2iNQnzVN7Ju/1WCXjtdHaycep
	lHDpJj7NSbITii36eqhdrIeXXHy7v2HK+7spI7jEuCIehUpOsOBfCfbmL/mSy8z4t+NwSKEtxdk
	uLTaE/GqeVVi4sGNiJA2IVSvNxIK/O4q5wGKmlfCT0na46suD3NR9AMUHsN9vPuj2HuOFWxYERL
	LhbNW0TJ2uZUwAuLcT0JLE09q/IeTyvEeIM+ViXo675Ha2LRZmmZ3FxM87MRAScsc=
X-Google-Smtp-Source: AGHT+IE/+qEk3SjQE0WaGw/Ate00STQbnaD0YtCC+WFT4/Fbr+bdpqv2kFO9m4rVu0eXE78+nSoBzA==
X-Received: by 2002:a05:6000:491d:b0:427:55b:cf6 with SMTP id ffacd0b85a97d-427055b0cf8mr14963659f8f.7.1761131978900;
        Wed, 22 Oct 2025 04:19:38 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a78csm24820692f8f.26.2025.10.22.04.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 04:19:38 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 22 Oct 2025 11:19:35 +0000
Subject: [PATCH 1/2] dt-bindings: rng: add google,gs101-trng compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-gs101-trng-v1-1-8817e2d7a6fc@linaro.org>
References: <20251022-gs101-trng-v1-0-8817e2d7a6fc@linaro.org>
In-Reply-To: <20251022-gs101-trng-v1-0-8817e2d7a6fc@linaro.org>
To: =?utf-8?q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>, 
 Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 linux-samsung-soc@vger.kernel.org, linux-crypto@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761131977; l=1108;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=wFL7EaC7oajWS8si1y0wmfU9HL7IN0yiHQa1hCUg5Ls=;
 b=BADVR+Jf79pRXQQP7OJ+g5sLQY7l/hCEa6RUAs9sGn87SwsuC7w4rRwpSLmGz9MKiaePKpFtk
 kdDu7pTDMneDUah7lu5PkCdDDp1n5XfUkpHjxqyC9OeuHgEpauWIQ/v
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_041940_847707_383BF886 
X-CRM114-Status: GOOD (  11.32  )
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

Add support for the TRNG found on GS101. It works well with the current
exynos850 TRNG support.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 .../devicetree/bindings/rng/samsung,exynos5250-trng.yaml       | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/rng/samsung,exynos5250-trng.yaml b/Documentation/devicetree/bindings/rng/samsung,exynos5250-trng.yaml
index 1a71935d8a1906591439c03b7678538e656324b6..4cae7dccbb915cf50dfa8db86b43293a66200002 100644
--- a/Documentation/devicetree/bindings/rng/samsung,exynos5250-trng.yaml
+++ b/Documentation/devicetree/bindings/rng/samsung,exynos5250-trng.yaml
@@ -12,9 +12,13 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - samsung,exynos5250-trng
-      - samsung,exynos850-trng
+    oneOf:
+      - enum:
+          - samsung,exynos5250-trng
+          - samsung,exynos850-trng
+      - items:
+          - const: google,gs101-trng
+          - const: samsung,exynos850-trng
 
   clocks:
     minItems: 1

-- 
2.51.0.915.g61a8936c21-goog


