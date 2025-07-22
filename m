Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA4BBC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 12:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lx+ZVMuygWM6iK3n5i4Qy5l+eUl2JVt18wiRP2PvZQs=; b=LnNvehUos567XkOkPypYXsp8Zw
	jTQLsWOw+nYVkC5Hw+TsupQqxvOzlqvhipklUDHwobzrEaTAPwdFGPc+t4p5EloJNZW7dHWXAI3ZA
	y0aHyVLMrEotqm6i+1Z2p5SlBxuMI0CHy63UHmkiivUY8qf62f/vw0cFrX8c/idiEeiKhrWq2FhXa
	jrkhdclh9rBPLBOmdIikHBsKvIVV2yqlwjqpUE32jgpL6wcbyy7Hdw24CXLGHrcqWSpnsoSPsZrv6
	FmpxdwDmO0wo5qZAcExeECZraNwCJ6i4Sz9048XXAAM7jXhnCGBckSF8JjWievV52mIh5NTq1s+C6
	OUKyDvBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueBtl-00000002OeL-1zox;
	Tue, 22 Jul 2025 12:15:09 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueBpz-00000002O50-1ZG4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 12:11:16 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-611f74c1837so10397971a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 05:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753186274; x=1753791074; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lx+ZVMuygWM6iK3n5i4Qy5l+eUl2JVt18wiRP2PvZQs=;
        b=Y9kUErFsT3LQjyB8oAanEQQIsBq9LYop9QUkeAI9irSJ19CDsPNgWK70WGSgvQVBKc
         V3I/6tSVag6QEVA1TRCF5mqzOe1T/X1UDmtdb3gcc1kkhc8p6pr9M32gUTte06EqYE4L
         xU9mIRemBUSBTDmDl5nIw4g8mL1KOnG8bSSexPCbwdSViOmRLMu4CVWJdvKyJVIgkaDv
         M5kQHq/dTQvEPzw19BmidmRq4w7iVnGw0Q4kFfgpBZtJRq3nlj20kxXZLWwmg0lkfz/z
         uDQggSy+6FvGUt4r4POF9JcAGeOmdK5H16FXWSpSeyO2fDXCL+shRJkfxR6qVw68SYkf
         esjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753186274; x=1753791074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lx+ZVMuygWM6iK3n5i4Qy5l+eUl2JVt18wiRP2PvZQs=;
        b=DnHNM9hDjFFF8Jzl77Q1S79Zth+chXImggwH2rhV7Up686kp8d8/fPMQ8wdJsF8856
         IhMmuxWW51jxIdb4fCxAEjHDvII+m4rl4mVC75LWYEXDmNnskbrrum7Vf3tCyDePnZZq
         CRpOT4MNvXstWK4f4/AZjeXYUho9x7Cv4fAAFwSxOUG8jxhFvSMYj9b7SBMnzbEuia0B
         8rSoW2q62xpabgLo45g2pRyuDJpsMHGh7120fgOTizoH6bBDSBC8cN4IGFVXyFWbigJ6
         H0bJ7qVEhb/ttIQ2ZEzxXN0vDED6lAjeT6fp7jvZBiuReZUnjFx2hyXTcDDzAXZq36mG
         bVyw==
X-Forwarded-Encrypted: i=1; AJvYcCX////hrdkDpzr1pfXSf1St2XTiwVbFzaawi7Spk5IJohiZ+RQQAJTqS2JaFltARln+SFsjifAPfKYMihlzOLzl@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7k9+XTmZ9OWI9YPwyrX+x86l6QQQTVLjjSECgr1tGJPPIRsQG
	21GzbWOv5mxqJRiPR0LipHQl6Igv+EHQ2AUcc/rak79R07Pq6I9CjMPC
X-Gm-Gg: ASbGnctZl547xOy8tl+0+hO1bmA0WVppa0NSfhfseycbu9+BEb2XOlKUCd/DF+HkMgI
	5U0buXa+pLwiPbal9KbJujK2aGVna+UUKY9mc8l8TSh4d+amde0xArA+DaarzZH5EqqFfrXD9Iw
	PtR84S0lUAcFyqYvXUzoJ2mH+Wyu2r9QOJUhNl2gC/DLcZJtgjxC6GsKJQjPyHpqGCaPEkO98uS
	tFW+GDVTxnJcrpYB0/rPtqC9Jbr8TIhxVbw8wCCrHnKQa+B4A1Q8IaOJ5NymZBZ9bYOsW3GG6PB
	sc3nOxNjE2K3B5S3mUFFsnOLITDAxrrVzXW2bSD+iAqgu1fyRBSY7Jndz+XPNVAkZVhF3qaZnwH
	OaM7RWxYyaDN4IAVTWH6OTygHyVIOT2X0dhJDGqUwgAKIo7v7LhoWUkocwZ3bltDpCt4vU9UpRQ
	==
X-Google-Smtp-Source: AGHT+IGED88fhPyhrYgJcmSWIkwvCbWfNUN8i7LvAClr6ahEphO0Z2rfiWIHbCtX4nZVH0UIjwz71g==
X-Received: by 2002:a05:6402:2689:b0:612:b67f:d512 with SMTP id 4fb4d7f45d1cf-612c731f0a7mr14639047a12.4.1753186273485;
        Tue, 22 Jul 2025 05:11:13 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612f15f596dsm5090257a12.51.2025.07.22.05.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 05:11:13 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: soc: samsung: usi: allow 64-bit address space
Date: Tue, 22 Jul 2025 15:10:36 +0300
Message-ID: <20250722121037.443385-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_051115_410502_332085D7 
X-CRM114-Status: GOOD (  11.68  )
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

Some device trees, like the exynos2200 one, configure the root node
with #address-cells and #size-cells set to 2. However, the usi binding
expects 32 bit address space only. Allow these determining properties to
be set as 1 or 2 instead of a constant 1.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
index cb2263709..4ce871676 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
@@ -57,10 +57,10 @@ properties:
   ranges: true
 
   "#address-cells":
-    const: 1
+    enum: [1, 2]
 
   "#size-cells":
-    const: 1
+    enum: [1, 2]
 
   samsung,sysreg:
     $ref: /schemas/types.yaml#/definitions/phandle-array
-- 
2.43.0


