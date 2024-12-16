Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018B8E77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 13:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Exe9dwySnGZoKQ0X6jvc3tMxyy8NWCLxusuFPVGkXUc=; b=WlDzehdUbaMHRVTUqs5475w6Xd
	W1dhHRqzmW1pUYiV1JWv6wVgF3MqIjaBmMijXFFzrJ5bexvIf6ZOGc6wzxTYzak3Ivwv2gjkIj4ua
	VXj+44n4BaNfrSl7Vd1avBopd5iK1nJQgcFmA+agBjF1v2SsaVEKbknAGExnVVXbtUOn3AmjQquLj
	NQ/YvPBMwgDRIARVZh4SK3ilKo6hGY4PpDee2vMcwjLl9brwyA7nHL20hT4hHf4EePmHy9Fkd3ILU
	qRqXf+NDxiLE0Ad5hhqtV29RCwEBZ4D3Ye5VqU/pYuwMIaFejKbxARSTunCOos+Ljjdobrdqpq7ES
	yvaTmO/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNApy-0000000A3U3-3qTr;
	Mon, 16 Dec 2024 13:08:38 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNAnt-0000000A2u9-2MgX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 13:06:30 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a9f1d76dab1so844208066b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 05:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734354387; x=1734959187; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Exe9dwySnGZoKQ0X6jvc3tMxyy8NWCLxusuFPVGkXUc=;
        b=TM1SFvwtkINpNlSZ+koj+x+t5vswyjCzBzwX2MnEVk6wjDax9oj/6bGMH/wVwzYLI9
         0jtoim2ueQgafN6cJ6Zc6PHGYi0RXX+ILSCf0BtO66YS7WfiBCqw03K+wDW0Qhs7jgme
         sUG4cm9K/qWXtGZCswnZwtqKmf4iKsv0TjNY9tXfOomKdd3QXCop3aXFIj/s3ayI6Nov
         O1pV7V/AylPxP+NoHFQVGzRmFWEEK1rZXCnwNvcH0kv6ynm8HvySyW+FMsPFuDaZ0VJW
         MyqonhD8jrA4bjt1Xj6mpR5kGF/kfTG48TwQhn7V3zEd7SBghKWTn1oDm0rvU1R+M8JK
         dyrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734354387; x=1734959187;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Exe9dwySnGZoKQ0X6jvc3tMxyy8NWCLxusuFPVGkXUc=;
        b=XNQQLKRkSNfXNfbJgwuXMaZy1JxKSliyyGe1NOgZFoUIxBM2pjQs2Fej4sxoXthfu5
         nhoJWUSOx0YnwEiIGCBHFM3rneBAdhBgkeJYK1/uJUYWytDABxLMn0E/2PRl8JakHVml
         MUBj0t79Q0w9bSY9qyX4K5EpOOCC5blMqk+XW52aLCZKaHkxlgtO6bV/fNEdqPrQo3cn
         dVYeCyM3arqU0/NXLKIJjPNWQEx4C+0GspTFUl+E8H6maNbpEf/khZqAYEjvuOVULWb2
         lNt+kB3iqY49KzJBRCkkwQ2cufbzBRrxDQmjwyVR6j4IZeqzi3rTpsnesRZzxdMJV5wi
         zlxA==
X-Forwarded-Encrypted: i=1; AJvYcCVDJ1a0qzmg/G5VXlsrKLkwL2MMYqLWHYxgvYwxCtQSawLSQvJKlkwrCHmQXMQvy1LjT8wPOacEPNRcg36pqE53@lists.infradead.org
X-Gm-Message-State: AOJu0YwilYvgJuOn9mbOzitprRbrUtFBG6pt0BVphOfDyenO+Rw30eYd
	r4z2i25lbIRnhl2QxT6eVjt+R0AZZbXdNr9J5vVHvqBEie0z5raH+kUcw4pP/V4ET6ntWZSpt7Q
	RAIc=
X-Gm-Gg: ASbGnctT4CQzdCIIq4tPdlsAMEnwG5yCu3sSEK2tKfCsniLnx3BBaOGBI3Lh7bJCLou
	VLQ34HJ7b1OsWn1b2a/lBa6xPM79nJOZOszaGjS9c7yM8NLlIBAIHPFZKIGPcYfLjz6I3Tyf+CO
	adNDu7UVxc63KOvOhmsDRA4eEZ+09s57koCLzyNRkfgTZFMepONCnvG4fPMUkzbEirxpcnGWMNB
	9Wenc+IzfUAMoZ1tZSBcVASgWvepqy8ELsjvPW3q6OrGf+RcqdbmMY9VRC3wCprO0bRDuBYWYMW
	KC/AstcxQy2YXKNtjvgh4z3gcQ8gsxvi82Aq0Tuy
X-Google-Smtp-Source: AGHT+IH7g2VjztEudNhKR5bGxsFAdjhgJPghCK5aQefPDo7GYqFTFAnMVFJ8tAQLM6OtNQ2IyoaP1Q==
X-Received: by 2002:a17:907:94cd:b0:aa6:8a1b:8b74 with SMTP id a640c23a62f3a-aab77ec424cmr986404166b.53.1734354386928;
        Mon, 16 Dec 2024 05:06:26 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab960681dbsm326648666b.52.2024.12.16.05.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 05:06:26 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 16 Dec 2024 13:06:26 +0000
Subject: [PATCH 1/4] dt-bindings: arm: google: add gs101-raven
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241216-gs101-simplefb-v1-1-8ccad1830281@linaro.org>
References: <20241216-gs101-simplefb-v1-0-8ccad1830281@linaro.org>
In-Reply-To: <20241216-gs101-simplefb-v1-0-8ccad1830281@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_050629_606520_7416249D 
X-CRM114-Status: GOOD (  10.08  )
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

Raven is Google's code name for Pixel 6 Pro. Since there are
differences compared to Pixel 6 (Oriole), we need to add a separate
compatible for it.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 Documentation/devicetree/bindings/arm/google.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/google.yaml b/Documentation/devicetree/bindings/arm/google.yaml
index e20b5c9b16bc..99961e5282e5 100644
--- a/Documentation/devicetree/bindings/arm/google.yaml
+++ b/Documentation/devicetree/bindings/arm/google.yaml
@@ -34,10 +34,11 @@ properties:
     const: '/'
   compatible:
     oneOf:
-      - description: Google Pixel 6 / Oriole
+      - description: Google Pixel 6 or 6 Pro (Oriole or Raven)
         items:
           - enum:
               - google,gs101-oriole
+              - google,gs101-raven
           - const: google,gs101
 
   # Bootloader requires empty ect node to be present

-- 
2.47.1.613.gc27f4b7a9f-goog


