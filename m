Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4677ACA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 11:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=60upd+BKvn0xz+C5I56bG/z3TpNZllLyLlel/0JDTmo=; b=z5+uCsJ9uAYqliZDVGd7D+tR/J
	bHx4p8bAMiRj7PIgg4NcgLK2wpZjH9T3A/8CiSRVJemNZM/Zt/zHrUcL38IaqCe9+QSgFAoTLFzH8
	+MvZ2hb2oo4G6ydiDMKWhj/5dV3PSxCgsfNSu5KMpB1rpWXbhbnDk6mwHtlchxZ+m9RIjqvDifBul
	F4M6PIAQTbMmo+lDuPPFYJK0fNXP9oWFYY+JA+u7HrlhPv87DnM2uC5ScZbQv5GQtmvyhWP3yiFEa
	hW/iQ6/vG4BrMfPy1Vmyheh6m3CeYVmzlyTDOFXsh37mEDTQ3JJcBwMHR7X9EwGQj8Cf0yFkubIYS
	WoLXBhiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usJq8-00000007omT-0Pb6;
	Sat, 30 Aug 2025 11:33:48 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usJZy-00000007nVp-1rGt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 11:17:07 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-aff0811f3caso18982066b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 04:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756552625; x=1757157425; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=60upd+BKvn0xz+C5I56bG/z3TpNZllLyLlel/0JDTmo=;
        b=dv/Tw42jfJ9RuA2DFCxqhTrZKs80NPeIzAohWpvmKo+vrRaAL+aIqvbRULLq0X9JfU
         S3jhioQYp0PO/+U7GjjIvC/7YHTpgadw1RHYVRDJ070rcWBFXI7bZvvJHjIPOJLGd36c
         gLXPKZCJwha/yidh+AeYFnlNAs+LjNAMnmfz/2IjpHk2uXEMSw8WhxQwgxqnsVsl98U+
         26odt9YuaYHV8AsGP3ggrDAaAW2Ut0bmxvv6L1jY5oeZvPUU/46VMBADDsLf4ZnOl/hZ
         OVDMejNTG5rhVRou7Zp/GLuYqEBShuA5D3tlmTv+EAYAmVNzkME54EcoYIX7ze9Vjwpf
         CR3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756552625; x=1757157425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=60upd+BKvn0xz+C5I56bG/z3TpNZllLyLlel/0JDTmo=;
        b=J5BiQ45Kk7MECLSEtat+QkKO7H4JIMcZkmx4VF8UhUDAJOczmi7egOy5wQfzTFHVi+
         SoOQP+RmI/NJ4br6e86zzhMt3vTbqhMLFR72G2CdXweOlCfy/zeqNkVK+iuBInr2uIwQ
         rpLUSXgECDNAAFItGEVZFJKZ8zHop2/ciaKRA2yFhEivSTjWoRrW0QYjbfkxn1F4SjAQ
         tIeSNwRVHFC65qM92jBwpOlaHatRTlSaQbLC1jpfqkA0/x1Jbi4P7nIZ7A6AMouPBseO
         W3Ze62ecJd6SCLEWtL8U1t0CkS63/skDNgpfD0uurg5UX1a5WREFrAFf8Yxxwrzkvm1l
         l37g==
X-Forwarded-Encrypted: i=1; AJvYcCXQaTCuFod8ApRwNNNLEz03S5VcFjkxCYL+QUDNMFSEIsx0NfA42b9CswfX9SigdGfs7Tm5k4jjveMaf3Ch4O43@lists.infradead.org
X-Gm-Message-State: AOJu0YytFIVJS1zz7hUN0fB7qhx3+3rAZxwdRIvv5OqkZn2tpovz0zc2
	JxLLYsCQFHu1LPshV52oVFpEBwtPYbKt0h9E3FBECcDXyAyYMP8GlNpvaIa5sQApy/g=
X-Gm-Gg: ASbGnctJbhp2FrNimEdKDk8uRW44u9njuSjfBze3GYxO6ss0bdEgv5TAyUP8g7vL0Ys
	yOhujOijmQe6tO3YZxcZtX6CxMcAxqmcaaulEdDkkn1cZNuAjCyRcifIS5MEgzBq8+1biDfafZq
	DYRUQpTwmPzNogdh60NaIZx+Tzb1KKZ54UbS/Cf5qpW2rWiAKLKypUSNHVLzaDsNPRX3rQKspKy
	bgWcX+Q17L9ud+yrn/b/2ODuFYexyi1zh2kdUgliAbf3vikD54OVDD45wJakNrkbbCqmGJSRZSY
	3GjVfoMVq5p062ojEB0MI8I83ETK+zhb2vIsIJQhPRc9degjC0icTJPSEHPCyGJ5sRN+/SRcvwV
	OV08eFMd9wOTeyO+Plq3mYS5OCyDl75D0dg==
X-Google-Smtp-Source: AGHT+IESzw14SfBx5ze5UZKu76aylPC6/8IATI5aiR9tuQyDgPAZqo4yCWAwk6R7aQI2r6EYS73T+w==
X-Received: by 2002:a17:907:d17:b0:af9:8748:2bb0 with SMTP id a640c23a62f3a-aff045d17ebmr294201866b.10.1756552624846;
        Sat, 30 Aug 2025 04:17:04 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0236d310casm117780166b.44.2025.08.30.04.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 04:17:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] dt-bindings: pinctrl: samsung: Drop S3C2410
Date: Sat, 30 Aug 2025 13:16:59 +0200
Message-ID: <20250830111657.126190-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250830111657.126190-3-krzysztof.kozlowski@linaro.org>
References: <20250830111657.126190-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2422; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=BRm9jhP8w8rU/kwHuy64JB8q87TYx9kSQxPNxxu95xA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBost2qIP+/+3cfZa+euI3pngE+iT+a+WHylVNyo
 UKZDkyDRr2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLLdqgAKCRDBN2bmhouD
 15g7D/4uTfN6vaakcLmeYTWcMPINmB+4QHznc3DmRIsvt/HwJlEfzF3cf9vWU0kan2QhXIVns+q
 osqNMKWIneBJC3JaHTi9sTGnUGW9cj/SIuOKolDRvHS70gxzN+l7IQoJDVO0N01F1GgTFSolDIF
 Oq1RMQw1uwSgG0gGI5xTlLeTmcnCIe8NQ881Gh9TTzL/e26qUKQUWm+O+ITpje5wIUYCfxGP3BC
 xfLKdAEI6PFqAj97TaWtOt7uOsK2IUjvnahfTgaI3wiSrqfQH19tx+DTd2eSQP83hiQZtZqXqtE
 bBUZrdiYpIaZ/jaSNkt397mWi5QqHvw58QqUu6FpoPA7NkZ2F0Ak2rZ03ff7+jcLdIy6W2cGRTN
 O1ladZxpP8BIsUM3aPCFmLFf/Bo8LnYD+CMsCFRHuBTH0BTRMS1PJRDPeLNVdadIuY7VQOcEtrs
 FhiOv0agVPkld1UV8kwakqAwNSWWDIriYUZu0TdxjoUCXfuTRqyFg+ieR8znv6hxfW5Rw3AyO5p
 2SQjgT+PKM4cT9wSIN0y/EFqdTiupaB6keiPPwxdVxJFkDQYxv3Lxmv3aIccKPFUWSqY+IqcVWD
 WmN/pvjTj707/EFVbyzRxJyKHFWhL+sNh36dTmJTv9E58DdWMDhTFppTm5Bp/7k7XQ52MIWyj41 rCOtHz+e2oSiWQQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_041706_486782_84127CD2 
X-CRM114-Status: GOOD (  11.78  )
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

Samsung S3C24xx family of SoCs was removed the Linux kernel in the
commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
2023.  There are no in-kernel users of remaining S3C24xx compatibles.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../samsung,pinctrl-wakeup-interrupt.yaml     | 19 +------------------
 .../bindings/pinctrl/samsung,pinctrl.yaml     |  4 ----
 2 files changed, 1 insertion(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
index 0da6d69f5991..dd11c73a55da 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
@@ -30,8 +30,6 @@ properties:
   compatible:
     oneOf:
       - enum:
-          - samsung,s3c2410-wakeup-eint
-          - samsung,s3c2412-wakeup-eint
           - samsung,s3c64xx-wakeup-eint
           - samsung,s5pv210-wakeup-eint
           - samsung,exynos4210-wakeup-eint
@@ -59,27 +57,12 @@ properties:
     description:
       Interrupt used by multiplexed external wake-up interrupts.
     minItems: 1
-    maxItems: 6
+    maxItems: 4
 
 required:
   - compatible
 
 allOf:
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - samsung,s3c2410-wakeup-eint
-              - samsung,s3c2412-wakeup-eint
-    then:
-      properties:
-        interrupts:
-          minItems: 6
-          maxItems: 6
-      required:
-        - interrupts
-
   - if:
       properties:
         compatible:
diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index de8460856141..e48c4f467a28 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -36,10 +36,6 @@ properties:
   compatible:
     enum:
       - google,gs101-pinctrl
-      - samsung,s3c2412-pinctrl
-      - samsung,s3c2416-pinctrl
-      - samsung,s3c2440-pinctrl
-      - samsung,s3c2450-pinctrl
       - samsung,s3c64xx-pinctrl
       - samsung,s5pv210-pinctrl
       - samsung,exynos2200-pinctrl
-- 
2.48.1


