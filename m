Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 129FACCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 17:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bdUt0RNaR2iDfSWCYFBAweXOdPy+lzj4EhVJE8ZDdzw=; b=dOK2bn7v+knKTgMqNow49qcRtX
	m4xoReKd3vn4JakBmG6g65Wr9golNPw9lb17/wTYl+UuB7S8vmUYphqPPpV25Xa5HVO+8Nl1hgZIb
	8y/t6jlWERKLd3+TH85b9ybDF9YLuZ7Iwyb07aPmHq6x5l2XglLZk1XdlKa1uj++8YovGzYV98W/e
	GNeFveu9w7t9uizaRNfT2MO7y/Qa5joyH7xokaMDZT5C0+cIXLB9MNalWafJK3UakUaUWiZM0geH6
	o3/sNOlXf7RkalTKzGnjOXTbt0klEs6ZcCpKHa4O4lEOW+ovKYV0RMqS9ESYZLs2WBKrLywYGdzYz
	fE4n1SGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCM35-0000000AAMN-29YA;
	Fri, 24 Oct 2025 17:57:59 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCM33-0000000AAKy-18Ue
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 17:57:58 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-475ca9237c2so12945085e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 10:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761328675; x=1761933475; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bdUt0RNaR2iDfSWCYFBAweXOdPy+lzj4EhVJE8ZDdzw=;
        b=zl30AkOKpDLd8YXfUzNC854auxR4JtUNdIClBEk9N5B9ibeF/m1AD1xBD/m/s8o724
         GPlSi0ieVheuuBa3rdSMFVm1EAnVUmlTKjBnkGua6LTvfy2kHUPQVLzvT43lDBfB6WiF
         2P6820ufx7t/D2VkfxeMVFfS9AkLIJLgLsrj0uzNtieLcHdPTgBWWp9UGDyXyPQo4leq
         Yf9S3w1S+Aty0NLcfg1LIh9ymKAi1P9OW6Hb+QGGGtU/MIrJHFAbGQI0f1ieZ8JNnkIB
         +xbHhD6SOAmZnGz2LTFdc1VVDd6+oel8O8cFv8mAJa/ubGhQmwqU6baZ+PEK+6LyIlhr
         OiTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761328675; x=1761933475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bdUt0RNaR2iDfSWCYFBAweXOdPy+lzj4EhVJE8ZDdzw=;
        b=ZJ9BBEQ2EXD9UEPFI08+x+jb4nVNF1Y8isMd5qX4w0IpYd7HkXj4uu4Dzszudw3P50
         tFEYB2WRHjq3HeiS9Yv4EuCqB5Vob5FRINjgW8z+mcI3VPr2X/nnbM331+CaTjYUcpwh
         +GgPdW2aCCAB97X6wSu2qlomH3XzL+GWHCMYYIPmqwtzu/51MNidtJUfDnIXTFnb/FUD
         K3dbEXfgnLI88yqJ7XEnBWDS0yOwK85SUmAp2+bk2Pa/P5E2KFnOg0IrUMYSmekftY8+
         TD5/A3fnOFx8EbNOw1ez9fAIEw36nizAF3JJwa5MmhqA6+HRQXXCzPdMCiYbeErNgYkM
         Hwlg==
X-Forwarded-Encrypted: i=1; AJvYcCVHyWOGWqLp92lq5Vsv3MZX7VGyBKO5x9V6htLIu9w+F80EVxqiwAiWf3HmvfNVZJbo/1LV746TzG3kixOcf/qB@lists.infradead.org
X-Gm-Message-State: AOJu0YyhTac3BX07QXkqz030NNZ0DaGmiOrEi1vHV0RbUP3fAtu7zziH
	/mcce18EBgN2bLcHsGuhhifWrHDECQ4HKzz5Z3fqS+0yBExY1UmunLx7WW+DdXkTTzw=
X-Gm-Gg: ASbGncuCeckek51V6F8tYlVv67spOHUwDkhEHuRdHSzje1F1Ul6U+Rz2HgMId2QGpI4
	4xjQs73AjP8iEPhbGHbkBqa+Z4mPDvIwBb2SbtBR330iOGchLuUq7j4h16Rno9F0J02Sh7AEA+q
	8mJGHyPuaAEJwazWw+GZvqQXjzdz6QB2V9HSQfNt0rPcdiRqAy/sg+g4JaDJwaAYNXPkVcoao2a
	SbHjxBVeECDlkfciuhqLNRUMnEy5Cae3Vw9qXRsndIwKMj7fbj+sldIxE3n/GkhqFezQ+NKBQtY
	5dBWQRat+cPR9iHdk79q7YfkbBBrEPFcwDi9O8dfsGrr7y+4kSR2v8lXFAB2U5Zoof7sKCnbbA4
	vUGpLDZVNZl4K50gRLZRb+OA5FsHBjq5vIrIFd6ChtouOia5/NIgRzePYE0GAU1uzxVj8Bfhzi9
	uypiBFSoocN3GWM7vGKTryQ91JbUJ/OUQUj1F9z99l9TzcEhaC50lx
X-Google-Smtp-Source: AGHT+IFsoZFB0tp8+Ix3Ahj2qQkKTO41JFdcnIV2Y9pnCVaB8qxrPU8f/giCj+VPzq5b0sapD/+AIg==
X-Received: by 2002:a05:600c:8215:b0:471:a3b:56d with SMTP id 5b1f17b1804b1-475d2edace1mr37349155e9.34.1761328675489;
        Fri, 24 Oct 2025 10:57:55 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475cad4c81dsm104062465e9.0.2025.10.24.10.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 10:57:55 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 24 Oct 2025 17:57:34 +0000
Subject: [PATCH v3 1/2] dt-bindings: rng: add google,gs101-trng compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-gs101-trng-v3-1-5d3403738f39@linaro.org>
References: <20251024-gs101-trng-v3-0-5d3403738f39@linaro.org>
In-Reply-To: <20251024-gs101-trng-v3-0-5d3403738f39@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761328674; l=1416;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=VSqkKAfAsASQV1wNAEnHQHuaUPvFzGicTvWIh5Er0fs=;
 b=TUEcoNwwAwQ353epU4/TqYF+EqZtHiYEB5oZJTslCHQ7ANEPvO/wg0+dwkmN8uBeXDUXaXNFX
 K5fWbcR9GfPAkSc1/TSFsux2yQMkPQd5vyNUQWzGoc0j25Oqei9aMM2
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_105757_329330_C0070BFB 
X-CRM114-Status: GOOD (  11.45  )
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
index 1a71935d8a1906591439c03b7678538e656324b6..699831927932949a433fa5dca767ad366fb76f2c 100644
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
@@ -24,6 +28,9 @@ properties:
     minItems: 1
     maxItems: 2
 
+  power-domains:
+    maxItems: 1
+
   reg:
     maxItems: 1
 

-- 
2.51.1.851.g4ebd6896fd-goog


