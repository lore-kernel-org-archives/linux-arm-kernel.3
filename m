Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F28A9CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 10:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RQkwG3esvRsRXcGjq0nlDl6dBfzj0vcyqIdzAb+t90U=; b=2E2MyTeO1GoqPhTEYmuGLBQA7J
	EM9XnztueO4pvrzkQ8Ttf3qpzPv3DBL02GMYdR6Mg0RNi94wollcsOUsyh0zPZCOdG/5EpZssKjsP
	qikVTdx/rrsaCBRi5BC0QhTkFwOzgfeTwArIwrtkkepKp7sw9S8sJ7P44y4kf0vRHSBuPUeU6Jglo
	elJ1H/m76stE9jmtSTVILyZ31SACTm7kfQgZmK5bXLxP+a+H2yiBihySLFMXl0WsaRCCQfw+O5+yK
	wkdYpsTF5UOtyYYLQDN83fFzkgfKUlzI5beSbYqToILvDBLDMYBoSIQi3qoK829ES0itm8OlPpZXs
	jgQkiP9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usIqk-00000007kCy-2FIk;
	Sat, 30 Aug 2025 10:30:22 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usIfv-00000007jIY-2ZBW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 10:19:12 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-45a29314d39so257245e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 03:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756549150; x=1757153950; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RQkwG3esvRsRXcGjq0nlDl6dBfzj0vcyqIdzAb+t90U=;
        b=jFUI8iXuiR9Ye6jv2LLCHObrdX1D+ghae8JNrTNfQDwGq2vhOHPcjpkCqoAiQRlXRG
         s6f27vQi9V9JGwaImMELq9Rzjf8rWqOAKYKG7rNuZLssc0QXAdLuXTIUU7QkjeDe1iLG
         uVtKsUkIKq0AhT6Vs6HMdiJW+u16r5xavcAyFUkMGZIKOjrGIgbKpaGFFaAkAnpvDGUo
         jp2fSjZw6S+Xi2ACxDWIWo6VduIl7qq03lGF6Y/ONmTkMNrqh4K7V2QzZu0OJJgD0znn
         KV4mhl5aBKRJCNS5NUNXE3HvHIOY534G3WJr5GKkG0YrBIGixKvVcYOGcrJAqYLyHGDQ
         j5OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756549150; x=1757153950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RQkwG3esvRsRXcGjq0nlDl6dBfzj0vcyqIdzAb+t90U=;
        b=plPeQpxQONen68/t3JCHFYrGc8EhmcDiE+dNEQ413+jfIP/f/k5fL64t1zqphkFprO
         PAqQyLMipno0fZHpzWRFWZpflAR2mH3v4K7YjxCmYA0z3zNnixG5b8h9wgT9bfgkPS9v
         6TnEbMorNmH29oDThwX4HfZkAA38ip/ir57sEvgrpM/3CPx4cGTRsQh9t0zBBukWDqmq
         D2A0dDVPWe1y8W7JHVFSMZKNkcdekWW2RN7pm0aUOY1mHHqPSF7kPhuqL8UzcCmswVAe
         5uUlQayX8iw0Af2USugL69+T6C4nnoFASUA4l0pSSjATK/wLqOAqNkNLVF3teG7ORojP
         AqdA==
X-Forwarded-Encrypted: i=1; AJvYcCW39amFKgH4CdJBU1JoYnsXOdsHzicz5MfVKsrmeX31cT/5h8wkgpvBbJ3bqIdyAnBPfn3M6u55x3aQGpq5mI1I@lists.infradead.org
X-Gm-Message-State: AOJu0YwElmrzHLX0B75L8pi6x7AgCLX+NzzUtuolDdoYgusNeGEnizy6
	R8x7kGAVHt7vn1NApt+hqZp+UyiOjtTR5S61nTR4d7AocUCjP+VjGvNeG1GaJoMkfHM=
X-Gm-Gg: ASbGncv8f2EHBGBBQ5yGkPUaQ+8AEocltIzIO6XnZ7DYShD3tNhDCjYCqr82O245st6
	9qOVp2ZEmwxdKDR86SQ+ot7MgSczcIWCe3bzuT6a2DN3NV0hyM6aG6++GMvhCwnnmh4bC+HhfN/
	fpyy1OjpVAaKbZkveBgpxnYo6DaHr1Duv/HvhmH7EvPnG5Xrkhf0DrgLp91XdBjFa+pMz31t4p5
	8YOIisGFi7Sj0Bm9aGNN/yOMjslwczprJOwH6t6ueYkPGfe0kOMIp3JvXZ5JtnfDjSxCSEzeLi+
	L6NCi44TpwlAiYRzE6fp3bxtlJtwHN3C2QaamHdyuIXgWFqy1O7y1nfWLI1mOhFWuRHXAzdP32+
	TCw5VxlDG2Go61EYIlHa+9kOkVxwR/lofheDDm9Lv18v06PYD2Q==
X-Google-Smtp-Source: AGHT+IGvK4zWnlaCkD0f/IQFYVOmByD4kqH4uguG0N/BCo4r6RwhrUrDJK8xeOPyv5jvg1TSq2X0mQ==
X-Received: by 2002:a05:600c:444f:b0:459:d7c4:9e14 with SMTP id 5b1f17b1804b1-45b800cecd5mr22607935e9.0.1756549150034;
        Sat, 30 Aug 2025 03:19:10 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf276c8eccsm6547492f8f.20.2025.08.30.03.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 03:19:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Aug 2025 12:18:59 +0200
Subject: [PATCH 3/4] dt-bindings: watchdog: samsung-wdt: Drop S3C2410
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-watchdog-s3c-cleanup-v1-3-837ae94a21b5@linaro.org>
References: <20250830-watchdog-s3c-cleanup-v1-0-837ae94a21b5@linaro.org>
In-Reply-To: <20250830-watchdog-s3c-cleanup-v1-0-837ae94a21b5@linaro.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-watchdog@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1400;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=NvFVk53JPURQUDV8Y4c/VLoYIsxRD0yXmhCyTafaDzY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBostAVi1bpYXyeIxAn9++1KZjZ2KpRpiB3xHjRF
 uAMEVQ8RMaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLLQFQAKCRDBN2bmhouD
 1xxQD/4ii3iTngoFf9A4Dgol3h6dIma/GS0zpvssmtqke8BXY3xVZWg+j4w7cvobY7VQckDxOMN
 ZFnQ9kmddkcXTuKB33VdUlZLd2qnZiGZohnl0EEdDzQRJj99lfwINF9GdMgxuX9urIcCV7bXLV2
 rNmOLdOfoyTOl7NJjQvBVGyN5dAk/dEPbzqcHkKSSVxuu13deyIZhOQwhagA1j3JKhIYZPUwf9b
 k4bPN0yBvoC8bz474FsU/awElM4pRLcqAObicKeyMhzLZ33U0C0+vQvfp30YF+GIP9HVw7OoufF
 WxE93XppZpgXfHnXgMoph9qXjMycTUkipcX9hpvs2Vt82bfBUlKaSxlz815RMpQ3VgluSoNNS7D
 q9SjLMj6Nnm5AdreDm2wQLpJQ1HM05jlEPU4wYgK/NBDUrF6UCmEeFjBbIJGnUNnHRO6r+xb4y+
 A2njgktciBlZ9ZbtyZ/GAvm5tcorVl5ztTRAkWGFgDaFV4HGhQfqDAaNklgkdwFwT79KwLNodLV
 YrPI48t4HlPiPNk7TbpUBJObPFc9qYgSQmWDB5sBVcZ5Q55sL1/T5VPPlFTG01BNDz3S4qF0tyy
 XinK4XV82zUsIa8JyFcfsqlGlf5VzO4bVfrZ0Knwr6CJ5ZgR/PZpKm3XBz7gISM2seUqrvy2pF2
 XbheD6X0aTBjwDA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_031911_655140_75FE13B7 
X-CRM114-Status: GOOD (  11.83  )
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

Samsung S3C2410 SoC was removed from Linux kernel in the
commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
2023.  There are no in-kernel users of samsung,s3c2410-wdt compatible
anymore and platform is so old, that there should be no out-of-tree
users.  If such existed, they would have enough of time to object
dropping Samsung S3C2410 SoC removal from the kernel (which did not
happen).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
index 445c5271879f002f2b05645a0e748dd9be5aaf72..51e597ba7db2615da41f5d3b6dc4e70f6bb72bb6 100644
--- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
@@ -19,7 +19,6 @@ properties:
     oneOf:
       - enum:
           - google,gs101-wdt                      # for Google gs101
-          - samsung,s3c2410-wdt                   # for S3C2410
           - samsung,s3c6410-wdt                   # for S3C6410, S5PV210 and Exynos4
           - samsung,exynos5250-wdt                # for Exynos5250
           - samsung,exynos5420-wdt                # for Exynos5420

-- 
2.48.1


