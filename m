Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0445D1076368
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 04:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jbyRS2OprBLXmu9ZROhNbQV7yptB8B7WNK7cYLjfz08=; b=O/CkAzA5qaGL5Fg7ufSUIPJuB1
	gkCt5CdXZWjCZw5xuHwBQcQiSt+2ssUyFsUqO633PZ0F4yqAdtSiCjwpcj5U/4ErkVwfXEhR4lZyI
	7BGVT0AJpYPooR4nJ/zSMmsMW89ufGfnTbborvOC7Bes6LcqSAm7PJ5E11D1q3RKiPL4aNYtgvmPM
	ireANb47UExumMoHiz8DsoJVa3/f0m0mGogf1aArm7FB/P3S8h2UaVSWP9+uLr5nNy+UnVd4F6y9w
	FvjBeWc/LWeDS34C0ErrYodOlOrHwNBQdQyWWAxN3M6Z036Wou+FOuZiJ6/uvksqYPWSticrwMxVq
	Dy1TOeMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7nYt-0000000DxQw-115r;
	Wed, 01 Apr 2026 04:52:15 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7nYe-0000000DxM4-2c2c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 04:52:01 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-43cfb723793so1891313f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 21:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775019118; x=1775623918; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jbyRS2OprBLXmu9ZROhNbQV7yptB8B7WNK7cYLjfz08=;
        b=hIKlbBYqrs/dIgpmt5HvYxlJyF7D5hY1p7Jqr+zSCFD0O09jOIsKjGe3sbK1oNgg4T
         GvDwmnxXjnuOb93piiMcG4Ac4k0t70QCqHYrVhmDJLOBThSDBS/7yaYu/0Ni4TEGq2yv
         /5OahoO5SCXwhf1w7SfppNc8N2qKozlXr5hu8dqR49rpdHmqelYgCMa6XcoP9Gt95YI6
         ZG7bVs0vffuasuK+LHeJycv+DxwS+Q0wMNTjkzcP5H/xjn1NNtr3CR/CD2iEVcf8bANp
         HX3N/cfpSL6ik6wF81+jJ1d7ILl4/LnCMYASJsMUoLFejew+dvKU08YDWcrvWEBrmh/v
         Vzjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775019118; x=1775623918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jbyRS2OprBLXmu9ZROhNbQV7yptB8B7WNK7cYLjfz08=;
        b=I/qx2edti4fDdWxbLD3FSP0Rxpw8TSxzyUBTr6ijSnboj2Otjkjx8vzH50kzv3uwPw
         uiaX9BlR07mnElIUiAwStzW+8A2EleMVvsHb7UuBC7EbfKq3Zgg4Mz78ILlNpGcJv5i4
         5IbwzPaYK6Q467B62V481qfOuX4aAajcP1PsH+5ouWF6rMZC4z5ItwaGRAhzGRFgB1mY
         akIQFZ+M8eJZLNDbzcpLHMCBgVmeY+MJbJDGzufwSPlbS9PkfvUFhiCtyTeGYrFB/hqy
         /HDRLTUk7EogTFkfMBhSVOfGU2I71a2ONm3Ss+ftUl6zxD2Dm/aUEkv4neBxzinkdD+h
         /6WQ==
X-Forwarded-Encrypted: i=1; AJvYcCVM22ZbFt81I8KrKgs9Y4sqpEK8MgBXqEs42d8/AEsJ/Q20EGcrKDSBW9FJm4AUD9mCQ2lnMwlF1MqX2Ebd/+Sy@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0vYIMtXY3d9VfQ1QPLRMyetmSRJOtWH4mohuUE+fb7hhy/elr
	yz4Zy58pks3luFoPEF2fUK4QFZJJ12K/ngX3mwqM9VdmDY5z8tEDXm/R9PqkNNozAxE=
X-Gm-Gg: ATEYQzyKxrpUyxwzfOGkNgQ7m2P0q0r9OKThd2S9v2RgZwhznVOX2l5o9NQRNHBC/cr
	CXFCbqmyyLtrRRoLnx7ONMiMazN5xGYL7W4e6WFJ7OiG+bGoBBwXg9+vFEI7PgEHPHXbrnskQcE
	D/QwxOg8Ts5cQ/ttIlsr88DjRJ3yiL8NNLMExb0yTUTLZwqlKJOhAp7lTR3wllIK/3ZjPHVyEJH
	OSXcORJ1nQab3l0gdP/tfxP9D7GsbX+D8y5yj1cMn7n7Vp2bKBjc/GJLyhYI4q10Fkj/t9p2Jw+
	ZH2IAkRjhwHhpdGEsKwT9lwdByNVcV+dhwuY8y8khISIxDFOU6K5U+dy31s2b3NtCPzI7os1U8D
	5ipYijpcJtrPwW3nXIv8Orev8HZZ8BBmGta8t1/hZqhHSJtR5F3PnMikOplzxQlyIlHzKVl4t8T
	55kPQktvjKemds8jxBccBzyz88b9YQ4mw2mWIORhx9QYwqYaKkWPgHaoT2iJp3B2Ra0JS+QW6Bi
	R1eUEAGYqT/CJMrexYWCFFUIzw=
X-Received: by 2002:a05:6000:2384:b0:43c:ff58:35d2 with SMTP id ffacd0b85a97d-43d15047d3bmr3946162f8f.2.1775019118574;
        Tue, 31 Mar 2026 21:51:58 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf2463dc2sm32986442f8f.23.2026.03.31.21.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 21:51:58 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 01 Apr 2026 05:51:55 +0100
Subject: [PATCH v2 2/7] dt-bindings: soc: samsung: exynos-pmu: add
 samsung,pmu-intr-gen phandle
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-exynos850-cpuhotplug-v2-2-c5a760a3e259@linaro.org>
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
X-CRM114-CacheID: sfid-20260331_215200_694449_1DF9EBEF 
X-CRM114-Status: UNSURE (   9.79  )
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

Some Exynos-based SoCs, for instance Exynos850, require access
to the pmu interrupt generation register region which is exposed
as a syscon. Update the exynos-pmu bindings documentation to
reflect this.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 .../devicetree/bindings/soc/samsung/exynos-pmu.yaml    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 76ce7e98c10f..92acdfd5d44e 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -110,6 +110,11 @@ properties:
     description:
       Node for reboot method
 
+  samsung,pmu-intr-gen-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to PMU interrupt generation interface.
+
   google,pmu-intr-gen-syscon:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
@@ -189,6 +194,19 @@ allOf:
       properties:
         google,pmu-intr-gen-syscon: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos850-pmu
+    then:
+      required:
+        - samsung,pmu-intr-gen-syscon
+    else:
+      properties:
+        samsung,pmu-intr-gen-syscon: false
+
 examples:
   - |
     #include <dt-bindings/clock/exynos5250.h>

-- 
2.51.0


