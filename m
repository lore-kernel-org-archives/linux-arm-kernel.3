Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1694CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 17:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rOLCVk9/QiwKN1UsTQZ1CrvJYvRM1UlIJhn07XUe2KE=; b=ON+MIMA5oITYIUcV2RFy5oMN50
	7ADbqAxUUtA2M9IFKz3PZ0QWvx/ZLdTsb1quX5/bAaqDIY+h5xXhBG14OU2T9pJaO2z2tgmOol+eY
	kxnbGK/YF3uuzN7XfqJdC1i+jMXCwOQqbo8WkuEeuIjwJcccABOqyZtIOmoY6FsVc0KZYu+6YH24e
	tb20J3paIK060AEsXLpFo0bypyb43mSUHwNfBfURl0ms/8fsa0BjO/XvUyK0fLd5MDAyByGQEjtw7
	DPKiJ7SFWMWTikCCdyn30Ho/RCsfsVZatVHeub9CWvQ4s4UzL07NFg4fHKIpMeVWA15XpxjRQ+ZEX
	0wLucX1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCLwT-0000000A9Qs-002n;
	Fri, 24 Oct 2025 17:51:09 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCLwQ-0000000A9Q0-3dZd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 17:51:07 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-427007b1fe5so1983765f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 10:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761328265; x=1761933065; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rOLCVk9/QiwKN1UsTQZ1CrvJYvRM1UlIJhn07XUe2KE=;
        b=CWdCFRVJ+W54ar3NJuakcratsuRJaQUeb2BAa2yawiHWM9x2qSgTVQN1bLQHLPKHU2
         nwJC+08INzK37r2QHKp8oByKFCqJ4EHfEqIMYNexRTiraz0zudsWtyQ9++g5Ix94n5XO
         u0VY6sHtol+j8fstVrD5i3h3nfM4l1Cd4qMFOaRmnmz9P9MDAPfJNQW2RVGmwPdDyBh5
         fUA3iVUbuokuG2FxnWdnGu4N1Mb8ce4qBBpDL86yt4wjzUwaRGHAeDmuf7ZQSXBPTJ5T
         SmYXNsEVXvU6EHEFT2jELYWVadJcz4ZnRCwgI4Yl0TJC378+xX9YuBtue1EVDeJQIeg1
         LjBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761328265; x=1761933065;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rOLCVk9/QiwKN1UsTQZ1CrvJYvRM1UlIJhn07XUe2KE=;
        b=PcQXLIv+sYPka8noNGLEKONXsLxvIhTimTa6eOR/8CrbiWnEw8Nuw6Yf9UVIakQQRH
         D7dff7Hb53L59m5K6kYb12qo60iE9srboRDEdc8alfNw47HvtjLB0O/prm1BT21K/lgh
         xFc3SaL61wThFuhb51+dXt8NW47Hnd9d8nH5pJh27qHJD7mUsaTMELQxasxU8QLlHWRF
         lzhNccJNbMzBufxkqUIz2PQ8vCfmIJgV/TFRCj5rYgJoy2PBI4Vf62nKw1ZDCZ+NxHqg
         AwGSK4ynrznH5zjkS4tS31ED8uyhStT/84D8DsqSbm+Qj6RPLmzEY3yz2DBBbDfcsPYp
         ZM7w==
X-Forwarded-Encrypted: i=1; AJvYcCXOvdv/6BkXV0D/NmjVv2JTuV/9wmaMLW2gLx0qlT7d1+KMAAPO38Kls4D+M2MwPgTbjugToVp9mDHQB8afrosw@lists.infradead.org
X-Gm-Message-State: AOJu0YzsgC6GlNRnzHRgIv55uekoDcLhNLpjGXyTTamYleHRqoVeCyna
	S58kZ56lss8nYLIZ7XkXMmgrEnP+CEjjn8lXKo9/aj71KDo9eQw/4nH9LHC7JXQmYIs=
X-Gm-Gg: ASbGncvL1u5eY0+FrNidfvhlSF5tFK92MBw3yxF++xKoaYm5FzRqV9PI4SfzJoUcav0
	YoLEM0NVHrmQvdEFJsMxt3UwwSOKghJ1SqU0QbJx9bpmzNiR3IGjgQK6IQ+ASwrg1CMMqpKodiI
	9gbQC9/lGEBa2eA+Fi9W0cbLf0v64og3NUGYX9LceXkxL7B0kUlWVbHyRwsgqMw/pPDmL4VYZgx
	epuh+m7HJqMWgn7u+ZUQfX7AW2lQMxrJTSAXeZMceCbQBPLB5qBvmDO9f7YH5vtTe0CBdhOdvME
	MDVoc1xg85C0X15MavLvg21qpXEqOUvZ8vZ/RID3hqRBhAs8MsNCtFehhHLQMvJ7N4nteOYi4je
	3yIN0EGTazigEPFAZM8ojEWlHo+OgT72u9zh0b6jSwQ5mUlTY1TzngF8LzMNz6AMKXX1lWgErs2
	NQiKSF5oX5NurgcYbtnHD9HYemZsx48HpP5w8ilDP72mXF/zd4QTExo7yFpyPlzfhihFAEsmIkb
	Q==
X-Google-Smtp-Source: AGHT+IGYnylqqVKrCTZY94vqPvipylQ/dkxetbC2sOasmr565marnizJOrsOZZOI5A86DycSGu2Bsg==
X-Received: by 2002:a05:6000:4715:b0:427:5ed:2d95 with SMTP id ffacd0b85a97d-42705ed2dbdmr18159704f8f.17.1761328264940;
        Fri, 24 Oct 2025 10:51:04 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429897e7622sm10321900f8f.8.2025.10.24.10.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 10:51:04 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 24 Oct 2025 17:51:00 +0000
Subject: [PATCH v2 1/2] dt-bindings: rng: add google,gs101-trng compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-gs101-trng-v2-1-c2bb81322da4@linaro.org>
References: <20251024-gs101-trng-v2-0-c2bb81322da4@linaro.org>
In-Reply-To: <20251024-gs101-trng-v2-0-c2bb81322da4@linaro.org>
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
 linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761328263; l=1419;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=8OtrpREBtZB1x192nC3r4mm44r4aYjTnAu6oo/Ofj2g=;
 b=EQv43Oor9EYwbIg+bkdEWKveNwuPK3fDoxFXHSnLdCDKDEvkdprIIYFqEghv/+a5an6lUJ7j5
 LF59aorIIHyBSZYPZRgaBHpL21gSRPECTAlmuIjbb2IRfV9mNHr9bOf
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_105106_922410_3FD61879 
X-CRM114-Status: GOOD (  11.43  )
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

The TRNG controller can be part of a power domain, allow the relevant
property 'power-domains'.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/rng/samsung,exynos5250-trng.yaml    | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/rng/samsung,exynos5250-trng.yaml b/Documentation/devicetree/bindings/rng/samsung,exynos5250-trng.yaml
index 1a71935d8a1906591439c03b7678538e656324b6..b85edb47036ae745b863bd8ded500891ea28c723 100644
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
@@ -27,6 +31,9 @@ properties:
   reg:
     maxItems: 1
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - clocks

-- 
2.51.1.851.g4ebd6896fd-goog


