Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ADC7C531F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 16:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CZ7DrWSeI6duZxzkpJi6xcP41u69UUs7TUTlnDPTSiw=; b=Eh+Q9rj6JXnXvqBrQ6+xvICpH1
	eh1JxjMW1XVGrcsph/Sj0VsqWrTvCel+YsSsDvq60SBGrUUDJRNMx5OdmnYzXv86R5oj0mJ6M27DZ
	Xb7wQYXp+z2JzweFmgXMW1P6VVIuZ2hWe7Yp8ANDmuVqBUlDJrdfX3HR3Lkl0rnl3e7R7MdpYAWlK
	wc6ABA63pDzX7OAclQXvt+qy7yVGu7ZXq804ZYYyBIgeHPWgPdp0BcPSx4mChNxfQwXRhnFe3pG4h
	qAxCKfIdLdUOJlz4GJu2H8z8nlZ79FB3f8VGIP4vKiFz87F1g16esONtlLPQ6ZXuLSPJ71GN1gtII
	Y0qDzhYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmvN3-0000000Ebke-2wz4;
	Thu, 23 Jul 2026 15:30:01 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmvMx-0000000EbiB-0iIN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 15:29:57 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so6143875e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 08:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784820593; x=1785425393; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CZ7DrWSeI6duZxzkpJi6xcP41u69UUs7TUTlnDPTSiw=;
        b=VwrzP7EMliZvQda+3hQek/fvkMArVdCM7YiA0OUUEEDkJhmHzJYF7vrDYcBekAmuKe
         ovElJoUDMRXbjZ2xANOsLLrTZXW2AkTguYbEAVOXeLb2hsAMCF2180fqh8kOLK1icOFH
         ENc5lcczc6P5GmZma5VrETt1kTi2/mP4A8siCLTlXkv2lWy8UrP1HRXwKGpCceF+YGWe
         dPqwl2yIKWoyjTR42BvmcDAk4t8uN99OmKqDnVIALJ2kwVocik2rXTyd1wIBfMx9pDV8
         JawYvkgTy+ng5oVYkJRq5HaEGBSLrAc+hCe53fN12uoPsgxOpC39d6UzZFj28xJ1xFXt
         /tww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784820593; x=1785425393;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CZ7DrWSeI6duZxzkpJi6xcP41u69UUs7TUTlnDPTSiw=;
        b=DsnJ54+B155iAVeSM/f7bTMPEMp6Tz4fjoyRvQc1jIRwtOUT0Y07qnrwO2xwQlJgHf
         gs0A81/z3HKRh8scXe6TpFg+WAViUP3gr8PasxEbQ93tlOrkf9Xua6MUIVfrHscPCXM7
         M7pO00UwfJ27Vpsi81jDHkC5OqplK7TiS1eSyT85UvTUNgwjPVUuA3kPlKTH3CMcPjmm
         l3VEN+kBIS4rDvFgAqGCfb6v1zG1/KZ01ufXl8HE82ugD6b04yGF7xAX7CKpD6xfCnIt
         HUaYGZRLm1LYSOtWCcF66zrWFIiMxmVk0zAgZ4VvpB4RPi2fRkocgGiSPtnG0Sgn6ATK
         ItEw==
X-Forwarded-Encrypted: i=1; AHgh+Rq+DILXplcuy/PlhJqzAFBfP+xYchqjZByOV/rjmTOGmmKdkTwJ3kBdGigWEw4nq64cKBQ+Z/wP5vUwrU1xPy09@lists.infradead.org
X-Gm-Message-State: AOJu0YwblOzi8UUPNCuC3lTJkd/XEKPeAU9A0nVKxceIOhnFi8pewFhD
	o9Qv9FfIfbJP9JzawPibayu1/CoP1q73vcsiwSx9T5x7jfBJNEabiVCpN4LyoV7oc7c=
X-Gm-Gg: AR+sD11rqIBAYBgZ/JclrbPPd2xlmPCUkEZ0GPUy9tqAgwOriccobPyM1iqhcHWeova
	3gz6QBTdz23P9euNCxvP1ajiM+Gw+06a3CPCtQRgHA3kGa/jCYHwuKYQRDcSEiUAJD/Nuk3zqd4
	MXgUDKJyeOUImW8GZp2JLJ0kUGsKAQHHXt3tizXSphS1ibrbeOBwFQqEyGRiEonamcJLLzLIDSr
	+chAshY+q9MQnoIoC5zDp5+uRmthFC0m+DvWKWTw3mJGrnnwMj0VQg/UB9zLLb6UaZjvbW+ZHWe
	kfPImgN1iKNJFGCG5OhEIqcJe+c5IXHMaAldt+OMrK3nSkvqcxFXJ3N0Sn8GvKoHUbTjCE6qbG+
	pdaB/c4NcDXWuT+jkiBNL/zpj9/8d/JsuE++/5voupuLZtTRQBuoi0JgbzIXxHJDOceqpt58JrP
	Jan/r56Gya5zI1u9wp+LRAjy+Ho723eE//41Ejgz1ffr3HRpJ0bukqHHPXOYvRvj1hhw==
X-Received: by 2002:a7b:c446:0:b0:493:a966:d5b5 with SMTP id 5b1f17b1804b1-49573cc18bcmr28824395e9.2.1784820593118;
        Thu, 23 Jul 2026 08:29:53 -0700 (PDT)
Received: from [127.0.1.1] ([2.122.8.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49574653f83sm36952525e9.0.2026.07.23.08.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 08:29:52 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 23 Jul 2026 16:29:46 +0100
Subject: [PATCH v2 1/2] dt-bindings: sram: Document
 samsung,exynos850-acpm-sram
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-exynos850_sram-v2-1-c94968e52f42@linaro.org>
References: <20260723-exynos850_sram-v2-0-c94968e52f42@linaro.org>
In-Reply-To: <20260723-exynos850_sram-v2-0-c94968e52f42@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_082956_281090_2AB818A9 
X-CRM114-Status: UNSURE (   9.33  )
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

Document "samsung,exynos850-acpm-sram" which represents an SRAM region used
for ACPM communication on Samsung-based SoCs.

The SRAM is consumed as a whole, is not split up using child nodes and
properties related to this are not required.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index b83fc6831947..b9c4d4f3199b 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -43,6 +43,7 @@ properties:
         - qcom,rpm-msg-ram
         - qcom,shikra-imem
         - rockchip,rk3288-pmu-sram
+        - samsung,exynos850-acpm-sram
 
   reg:
     maxItems: 1
@@ -159,6 +160,7 @@ if:
           enum:
             - qcom,rpm-msg-ram
             - rockchip,rk3288-pmu-sram
+            - samsung,exynos850-acpm-sram
 then:
   required:
     - "#address-cells"

-- 
2.51.0


