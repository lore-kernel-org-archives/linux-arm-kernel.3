Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C228F1076361
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 04:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H/kgDWAlaVKVnE11W8S3H0mE7bshX2fubcylJ0A4KM8=; b=nR2+AcMZ0zXW4DF0/VKkjuwKxl
	b3iHjTvilMesRsH8GOn+NganrpF5kz13wLC08w+PqARGnxAnIbs+9pvTSPwXokJj4COMclJBvfT5J
	ZTYZpTaebwRZzz+R5+uGpJuzPe71IKltLDGUJRz74D5Jog2Q2Fo0gO/LZw7VfBY1eJrNB9xKaRWCs
	UGKse+UY04aTCNIucm5l0qT3k2LfetTP9YqqJYJMJkcA7AgwPj14Xv23q3cUhtoFMLaf1rK65QG+9
	06y9jl05DLo7c7DBEe4XEzklDvRZdjA+Fvct56uPn+G6RtzyjIZCj1s3fiyyEnZBg+/PeI+LpK0Xb
	F5i/fKAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7nYt-0000000DxRM-2Nby;
	Wed, 01 Apr 2026 04:52:15 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7nYf-0000000DxMj-30Nr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 04:52:02 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-43cf906b007so1829463f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 21:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775019120; x=1775623920; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H/kgDWAlaVKVnE11W8S3H0mE7bshX2fubcylJ0A4KM8=;
        b=PAPkkTlvpf0Pmak9dVgPfFndEos7k3Ga+9vsY/KIfWf4wZhBLz7X/st8MJgtRuhoXf
         spi2/1dd49joDLyLIXE3HiLu/sTB/rIjjVP1e39x8MmEq3jS+MHZGhnt43Wm3HvDpWNG
         xXNhEKFJ1KNQ11QgAO1YnkdxW6Vpd4gTZz+l8d+RKTocJE05bFqD9P95Ne2jM5LEcRT1
         9ScgCFIq6w2/IcAax4ak9l9aJWyWPMO0q5js8IA222Y+2Ggw/l9pFmQjYDrETR2aE9pa
         KJtXI7HvKiocPNb6uUttKl/wAfcRZUPc9JRHaxSS6gTfyIhicIFtg3W7yvWU0ROg+JIn
         yPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775019120; x=1775623920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H/kgDWAlaVKVnE11W8S3H0mE7bshX2fubcylJ0A4KM8=;
        b=PxAGwqw0UO7LsPov0J2jHlIqqpOxtgZpaKfVk8CUdhyLUE7s+6i3GbYjqvgbkGsq8a
         3Hz69uEUMAewbGdCTE85Uqe4lMkLHiaa6wSq1crF0+y+D3ZZzgzwNi4aFAB7rpHCyXh7
         p24pps5GLzEO3jITA1nKawF4q40qk2fNfM6sXwSx7VYCEMr1wjba3HzfxF2WFf75TSnO
         u51eJIyNFB+QZUrV9iqq3L+17ToevLmHyt5dAort+xuiGUPaLYPJWB7yaoiZIsYaQ1XC
         Kqj61vgq/tzZONNKvzs0q8BiVjzkoOmtwJ7smz2qhM4hkFLAxdiox9e6FeuokuKy/eSF
         IG8A==
X-Forwarded-Encrypted: i=1; AJvYcCXdmJ91taTgVeGiVkzK2nDX6Bquela2yP2HlS5WiM6kLXNJopdmtCDiVIOm53vWkEm9S/0gIWwpKqg8+LyWzW3G@lists.infradead.org
X-Gm-Message-State: AOJu0YyFUWCZQXieFBHDJdZh60DuXzEKEgRkvPhssCCQb71NYmpYcFvs
	x39NFXyZRifZhI4dCX3fKXfAt+OeSj1ZbnDNmC5IMH1wgEW6D5ahKtVljQK1w0jHE2g=
X-Gm-Gg: ATEYQzzWJO7cEG/D3BZ6XkU/LBgo1NRk2W9I1BcX2/mdHRAxz3eoMF37IYSFtqdeurt
	7ayhWZIYtg6ysosmHG1AO9xDNzSUGcsxbLt0nd+vZFtZUUKDiA5GHq35JZhDX2D5gH5HALgZwoe
	o+3Hj9cJi661L7DWD9S7lBGaLnYFqhJ6kkBaFr/V0n48jz1MK+Q3GF6vgaq3JdppzS37iElV13q
	EVfsy8RpmhePAR7qTWKw4CJGvCrgyAKGVTotPrZFHE5Wqw5SMFYBpIrsOFXsdOFr9u8bm/PahMj
	dOiE8r+wYvVG1RV7v0AhTMSkGvF7rjEiCV4yc5tRJkKWouKEioW53mEyxYyQE+NjZ5wT8kYZtGe
	EgFjsymL9Fgvclmrdf18mcph6PNZwaAVs92a05VocQxOvNfGswXX7w1uJbmxXzRQpRMQA/vsQce
	0LQ/Nu+uoMPB/A5qGdX2WxUHlxtHAptPbYO5uP8gJY3qjsnczLzrpMBbIFN381CSjGdYEafP1Mo
	aqH8VsAjaNMTEU2ktXZHeZEmJg=
X-Received: by 2002:a05:6000:2889:b0:43c:ffee:ee94 with SMTP id ffacd0b85a97d-43d1506343amr3731299f8f.11.1775019119695;
        Tue, 31 Mar 2026 21:51:59 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf2463dc2sm32986442f8f.23.2026.03.31.21.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 21:51:59 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 01 Apr 2026 05:51:56 +0100
Subject: [PATCH v2 3/7] dt-bindings: soc: samsung: exynos-pmu: deprecate
 google,pmu-intr-gen-syscon
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-exynos850-cpuhotplug-v2-3-c5a760a3e259@linaro.org>
References: <20260401-exynos850-cpuhotplug-v2-0-c5a760a3e259@linaro.org>
In-Reply-To: <20260401-exynos850-cpuhotplug-v2-0-c5a760a3e259@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_215201_786089_5F543242 
X-CRM114-Status: GOOD (  10.73  )
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


