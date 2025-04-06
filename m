Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D3DC3601A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Apr 2025 15:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Bizm6h1CDdffqhCM31Ev0bSZrO0bxrQbCDmltlpuTU=; b=CKpgnuiB5d37AkCQlpSvxWKT2p
	LFRkKMNIxnu0rXEmYGuEKEPGOTpstm0q7i2nE9TCxgqGA53iRiOW/HcWneItm8uYF8pIEkEay3fMu
	iM+XfhQFlcpyTd+zb9UYPeiSwynnEKu/x6WgEUOczAZH0RzQP++wWa4NFHZaMkPSYL8+frPj/fTuQ
	cOnW20t/hw0ZTg1S7Zt50xyM0Nhpo7WQJxsz0zLXJpyV26qPysNnzNVyxz8/MgYFTu6WLfG2kLaed
	u0Tb08m8zqZtV+Div/YegAflfAFJc5ym3TPwSXa/fX2y93tuvCjb+mD1QELkiN0qOinpaw8Gvrc49
	sDWuJCNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1S4V-0000000FUja-0LE8;
	Sun, 06 Apr 2025 15:38:07 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1RzN-0000000FUAU-0TX1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Apr 2025 15:32:50 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5493b5bc6e8so4501762e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Apr 2025 08:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743953567; x=1744558367; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Bizm6h1CDdffqhCM31Ev0bSZrO0bxrQbCDmltlpuTU=;
        b=GyR7H+EgWeGJDUykXGrqDYQ+5eIMesfHCO6Mz9DKZU97WFXvw7yJjKQyP+DZbveUBM
         MP3WL3etJvNNkKFZ4YPCGJZ9gpfzUhz0B6M3rY49JUDWaDBWG98ZNha6iGKQz2oyn78Y
         GSbg2PKQikGTaE4AIsQIl+ZsuHi3yFhwJ0X7oxoUYEHc8l4HkUOeo3uETn4lpl882O+6
         JMm7j6WcFkkZ8cHw6UMK2NCBAey2B9DDh018HmpIXeK1S3d51McbeNSGPisYh3OLqHCP
         1p4BRi12NTjV+vUFK0lt5zQN9XnlDb0jMH9/i52Z73044tDfRXHnLbr4cpMg6q5CCd0H
         R6nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743953567; x=1744558367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Bizm6h1CDdffqhCM31Ev0bSZrO0bxrQbCDmltlpuTU=;
        b=NgFTE5NtyIl6pkjWoMD9L7t2TkV3JYxZkoDjGJtOLwnUMEQySO7viUK4tPDR8eJ11z
         jNA7Wc4QyJd7OekzbxmiNot+Df+bpjSsF6YLzgWTD/Hn1hP5MuYKoGT/i1F3f2NQXlXb
         DSTDleoxHO3j8CiR8FkHR9zVyYijJ26X6IDPTFoc+udadHxk1nkxuDoY4hes2gOGdPgH
         T2OOkvoUwdehN5JnaSt6FOFjbllb8WNeqyJ20qOOFAruUXZ1Afzc1vzcCs6ZhXxSIJ74
         DI37s2Pf/7k+8YUECIXPrMAm6iEViGGT0474kNeT5WLDTGqZ6aXJq+lXxf9p+OEvbaIF
         Lwjg==
X-Forwarded-Encrypted: i=1; AJvYcCVFPiPUF5WSnU/8ALQGV1GapjFcVbEqwwLPbDfS10SoW9gu2xfm40lLoA7lwNtGyEEu6vE1p3+zwIeMa3bU/+YR@lists.infradead.org
X-Gm-Message-State: AOJu0YzF8SH9dZLeCrSZ3T4g51BIOPxV2+6ug9MSCoZE7oGRyEgF7Uyq
	m9XsxnW/LAMuJ2ivGa05+mlCmwhHZsNrZI+PGofHLKDrxPfr/MVQ8fEy5aHe5CY=
X-Gm-Gg: ASbGncvq+22a2Jq+c+kaxlfvJ1dHYOfN0evHDi0euXnYN0sRDNa4ZO7E9LxwFAY+cyA
	FWYloek0lhTAhf4ZZ5Q5de6W0n4lFhihOIKFb3BDmdaFprcDZ5pNr8F2BfPaIpl8/NaFNt+DGoX
	WZA73DEPZ05UWm0TV7LcYarkNotn0g3/nTlnobHlmbal53DfzouWxh16osFXPHiu7zOhqedJrrc
	iv8QVi8ygvushky5rFKuMWHPST9n93qZwg2tvpYHOaMXesbyJ2cP4CNPYyMJMMYadbCvQtjMDge
	0/8D/slwp1KKA8tcfWfCxr0tycjDINpsc9KT/LR30dZMExNiW00eMUM=
X-Google-Smtp-Source: AGHT+IFie+5iQdZTFiEqXLdGG/9Obz2+zMwWEcSfzmmzsP0hfhvXebqGm8T5GChopGRfGqsSOpyx0g==
X-Received: by 2002:a05:6512:1253:b0:549:7330:6a5a with SMTP id 2adb3069b0e04-54c232e23d2mr2694580e87.23.1743953567253;
        Sun, 06 Apr 2025 08:32:47 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e671fa8sm989747e87.218.2025.04.06.08.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 08:32:46 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 06 Apr 2025 17:32:42 +0200
Subject: [PATCH v2 02/12] dt-bindings: rng: r200: Add interrupt property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250406-bcmbca-peripherals-arm-v2-2-22130836c2ed@linaro.org>
References: <20250406-bcmbca-peripherals-arm-v2-0-22130836c2ed@linaro.org>
In-Reply-To: <20250406-bcmbca-peripherals-arm-v2-0-22130836c2ed@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Olivia Mackall <olivia@selenic.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Florian Fainelli <f.fainelli@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-crypto@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_083249_157602_623A4DC0 
X-CRM114-Status: GOOD (  10.18  )
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

This IP block has an interrupt. Add it and add it to the
example as well.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/devicetree/bindings/rng/brcm,iproc-rng200.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/rng/brcm,iproc-rng200.yaml b/Documentation/devicetree/bindings/rng/brcm,iproc-rng200.yaml
index 827983008ecf707019f45847cd86d5686e3b2469..817cbdaa2b2d75705eda212521186c40a9975ea0 100644
--- a/Documentation/devicetree/bindings/rng/brcm,iproc-rng200.yaml
+++ b/Documentation/devicetree/bindings/rng/brcm,iproc-rng200.yaml
@@ -20,11 +20,17 @@ properties:
   reg:
     maxItems: 1
 
+  interrupts:
+    maxItems: 1
+
 additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     rng@18032000 {
         compatible = "brcm,iproc-rng200";
         reg = <0x18032000 0x28>;
+        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
     };

-- 
2.49.0


