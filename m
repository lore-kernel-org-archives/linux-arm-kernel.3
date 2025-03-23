Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E471EC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Mar 2025 22:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=76PH5cHSw8HwRSSvCBVkDwYPjRgUpAN3tWdOoIM1T/Y=; b=Eefl4ogIG22muLmbnorWmpiMzr
	4Dy8MxrfXRE6LAYvuzU5frazbSpEJRDBNbz0B6Iy3StzzHCyRnfn7ZECNpXKmFOX7Mwr1UPUemJcP
	+odbfu9tpxGt1kQ9VgcpbzcKnSA4U7vIB8sdPRTCrpM5s6zNLVYDk6cCqLLG5I4H4fhXPpU2jCII5
	9HeNJJ+VBnfjz8Dikgh6dKGv/V8IHjO09gVwfqzga8S8/H2/5/pvjkzPvkpmVT3ENy4OMrRZkOS6z
	BhwjKpGzum2AneukPdj7vIvtLhREM/wR/UsiE1bl2fu5q5ZIMlF1qDLIYKYLbe+jkmvVagiu4UA3+
	e7QrLfzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twU0G-00000001pVi-0rse;
	Sun, 23 Mar 2025 22:41:12 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twTyY-00000001p3l-0KBO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Mar 2025 22:39:27 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ac25d2b2354so632202266b.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Mar 2025 15:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769565; x=1743374365; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=76PH5cHSw8HwRSSvCBVkDwYPjRgUpAN3tWdOoIM1T/Y=;
        b=G0CjfqlZ/C4MktyLQJAqpr34quaHSpAdRkjlCRbCG/LvoHvPUBMoPoSDpbIT/LJlPP
         4iXiLVHweoQBiGa0r48vQSnC0gWshSKLlxS3cCI6lrgDJmQgJiIGRHH7qZpCtngI8fUY
         R1uPgQlWgZBESyCIJIGRbbCNJuHC4u0TieNEeUpqjWmyHlRwJNKDmCiW0gPCHJf6Rjxw
         tjtlHaJUHKhdvrjS/pPotlHbiciwfMowlsVLY8bbRGahNrgfsOkuPFQEBcnvfQt1eUz1
         c5W7Ba5AiqJZr0PZK1VXfjozGg713jEED09oJn+p5AzZdIc0lRuivktA1dwSH28rzu1J
         5GOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769565; x=1743374365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=76PH5cHSw8HwRSSvCBVkDwYPjRgUpAN3tWdOoIM1T/Y=;
        b=EUWfgojsWFpqfPRD3IbMmvCHCVnsLjPG94VLkvZIYmJIHjI+548kYKbkE2FkMRGtSi
         TS5Q5TzPuuogzWY27VoHCcexl+Dchorr/K6x0HxJ8BjETSeE+46JpbUL7t1/bcZ1uIpA
         he608R3PQnWM0V5EPKxuMvVH6qAWE7Oha7y7Yt6Ab/FYaqWtRehjM+QVhnvS1GRsIg+/
         Tb6nrk31e/AvGtHaW8GF/xk0GYxAj59t1l4NpqSTnhoIX5gN30yJCFbH9Ab+hBvqQfGn
         JBCoTn19vx1BVP+niOz4+EMKyA5/n+7kRA8KWPGngLkupRXQ8wybk1tWx2n7N6YN8uae
         +y+g==
X-Forwarded-Encrypted: i=1; AJvYcCUeLlxLa8GFF3eY5bbTcfmDxZ4Egnt+ggbd8D5ObkUrKV2DCo59yCizWWf/t05ZDmhxYxbZH/3AprXDpfj+dIi6@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5nuLkC3cyhOinF/ErBDytpnsQzoGqaHoy+ozz6YeNOdmXnnIR
	s5DiaMKrM90GcJyofFmd2q7f6XRDs7Pv2D7+5VQP3+8MdFsrk6/zU/acr8fviic=
X-Gm-Gg: ASbGncuadhBQHlYeGRC8HsIRGYwth7d41hJwq+EHVChuKWci7XC1HOulltqATCYzwtN
	eEapiGUzryKjtEeMVzC6KPA1XhEma8VEqgaudaDZI9QLWwewEMvuLfJCx6kowKL2xPIvZ6h5OJw
	GOrg0MuaYxMcjHiLsrC5fqCeUbPmEN8Na3s47QvZvS5Ov+A+aPPvZG5kJ8OpnMR5A4sAK3l4Fid
	8FsBo/VF5lZ11F+M7UrVVW2Q5f6PFFFMOycLi3rEpfGPpUieZ0+C2IQYsvoFzLMpBtMrVRwSEJu
	rHP1wDT6aG2mp2iPO81eF37xQc7gljLRscJiCtIX4xt0JfMlXgEAdYrgncgOlq6uRTiUUrNqg/c
	AUeCv6hp89Fbbp+xQETmR4D35KtOP
X-Google-Smtp-Source: AGHT+IEYfWzNbR+K5DYstAqClR9nSakyWw/N8LzTya4wskfRe5KrC67EU110F2zXc4Z6WRaZMMlhIQ==
X-Received: by 2002:a17:907:7292:b0:ab7:6fa9:b0a9 with SMTP id a640c23a62f3a-ac3f208a29emr1120053966b.11.1742769564738;
        Sun, 23 Mar 2025 15:39:24 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:24 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:18 +0000
Subject: [PATCH 02/34] dt-bindings: clock: samsung,s2mps11: add s2mpg10
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-2-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
In-Reply-To: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_153926_112454_CE7A7C26 
X-CRM114-Status: UNSURE (   9.40  )
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

The Samsung S2MPG10 clock controller is similar to the existing clock
controllers supported by this binding. Register offsets / layout are
slightly different, so it needs its own compatible.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
index d5296e6053a1881650b8e8ff2524ea01689b7395..91d455155a606a60ed2006e57709466ae8d72664 100644
--- a/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
@@ -25,6 +25,7 @@ description: |
 properties:
   compatible:
     enum:
+      - samsung,s2mpg10-clk
       - samsung,s2mps11-clk
       - samsung,s2mps13-clk # S2MPS13 and S2MPS15
       - samsung,s2mps14-clk

-- 
2.49.0.395.g12beb8f557-goog


