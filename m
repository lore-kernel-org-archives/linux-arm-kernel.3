Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD9B9CAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 09:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3Gusk5zt0HMd76bDL+pQKEW4NdN74ndDk79BJJ1+vw8=; b=KGp7iRysKai1TyNykAKaLENVSN
	L+aQ0+c1y1wgoEBHmx2MtIzbp7lFwW5f6bZIoqPi2fx9uXYHOMbAhXsJ9fdAOL0JUqIXRV862K5nA
	dkOuPBOASbgyxPhCRZPhWaZuJNHShjnzPHiiyRY6roRRyoTjLAD3S9eNCvAgS137MLcSkwovGTrF9
	L3yfaofOw91zyqb/j3Op4fR8UMCOIiTycbkp+t077AX+HldcFy8gQJ8Z32cRXxbucjGXrCLzItOm/
	Z1prN02pcqMMk1wyNRhJCiSAXGWpbUdDeQxVuh+gZeaiAi3H42PfJUR3vv7B7bv2yzNvgOCMP2nZG
	877Ub6cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzteA-000000055pX-1NU6;
	Sat, 20 Sep 2025 09:12:46 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzte8-000000055oI-1JCy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 09:12:45 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-45df7dc1b98so17229695e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 20 Sep 2025 02:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758359562; x=1758964362; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Gusk5zt0HMd76bDL+pQKEW4NdN74ndDk79BJJ1+vw8=;
        b=BzIYRLQ1thzpJX1xaeX5fn4rgHV2y/DCwA6vnkF7ePfgIxnKcQA0WGyEhFS32tIA2H
         GSo9jF1/wg8DoWGg7SeOJNrby3bfmJkSqhQEjsdaYyIGGhX6OauZQmI3xhCWMYzU01lO
         puf867i9cHp2wMBxET2gzzIYHqZpje305lAyElrQaW1uatJEcSizHmjQdq3z+f+sxM3o
         3XPhHmMF5IY11c4uhdndk/Ox/e+M26tq5DvmVIP8HEN9yoAVismXZna1HhKAh1BP0sNG
         F4o5eXRRTfCJ4r+LNQMdFEjPUGPfbULX4E028PylihZY3KT0LZWveeSXBwgKw+Yv6L1x
         5bSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758359562; x=1758964362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Gusk5zt0HMd76bDL+pQKEW4NdN74ndDk79BJJ1+vw8=;
        b=pP6lG5FkKn0oI3JOXlqFoQUoQRcd5mbr+Bx4kRtgDrxCQKPpCnHbsaukQzkmI+8Zio
         AlnVit5tPeiFmp+TfmziTd37/UaDlkCkMoWCCkY931F5X4ppBO8SuqrVspCnMx3i1a0D
         nDWXzBuzASjjTOGrgEAyQDKLSXIUBRaMzcmnJHTbfd8umzAgadt/i6opfy9DIh5ARmik
         Rb0aFwS4q9VqE02ii74ZhgZ99OFEzmQwPcEtBnXqycB72M1Twb6ZDBqTQB7nV0Janwsg
         5e1fH4tf8iyBPMjtrDvQg1K/TgbjeOd7KcEiYEb4LwqUsplOJF/HIdehjJGfyWgBE479
         UWqg==
X-Forwarded-Encrypted: i=1; AJvYcCVjf6oJHIl2iDEHdWlGAy6v9YQLp7YDfQj6BtDzO9aoBR7WBuO1e3UbzURefCvOT7D2H5xlhXgqc7Q8jKE7Az3y@lists.infradead.org
X-Gm-Message-State: AOJu0YyGiNM9c2yFCVjxTPhtuNxmLa64+TJG1i7bUirqiwjwY+F6TWJ/
	pZs/kq66lOET49tndbbSW9+O3Ky7rVx7P0pyuqnUPYK1sRjTPdNEWWdl
X-Gm-Gg: ASbGnctRL3G45CaWp1uePrtM2NQfm09NasUn544mbmdZRkr9mjkDLw7xHe5NnxkIrqF
	oroielSZAP+SzOGsIyFiTdQR3PWEF4l6RTtAMmvT6xlhlYLoCI9N2PrFXALGM1rOaplnqu0dzTO
	ImEONlxlHRCpeH0chNRNL5lvZ8nQOb/nzXxZsv8zI0vjacut664s9YydNM9U5L+IPwZY0iqhS+C
	Xqe/wsNBixqwuQJBYZIz5AZAV9SAE6232ezWBUYy8B0id4eIljj70UYmqKcVH6JLME3XurFgPWt
	WKyLyUfvsHVcptoCmHFCgG4oXBQPQdYUQDD8f3KoAuKP+LNjL4ZfpDrGWVhIEc3BdkWmshckHRe
	JZoXBOaJkkUaTHsN7YGKy5P2Y4jcHXd06OqJEZ0PZk5GYhjH3mhkADlsTVOR2VjZE4we9sCnyof
	Z3RlldPA==
X-Google-Smtp-Source: AGHT+IGeCGycSjOjMk8oko1TsOrOMJVtki4nnFeQ3rx2NoALaXwxO2K0x5BUb16MSvGQYr/OhAVjnA==
X-Received: by 2002:a05:6000:310f:b0:3ec:dc87:26a8 with SMTP id ffacd0b85a97d-3ee7c5527damr6050719f8f.10.1758359562015;
        Sat, 20 Sep 2025 02:12:42 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3ef166e62e5sm6375782f8f.40.2025.09.20.02.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 02:12:41 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: arm64: dts: airoha: Add AN7583 compatible
Date: Sat, 20 Sep 2025 11:12:28 +0200
Message-ID: <20250920091230.17702-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_021244_363181_00EC3CD1 
X-CRM114-Status: GOOD (  10.58  )
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

Add Airoha AN7583 compatible to the list of enum for Airoha Supported
SoCs.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 Documentation/devicetree/bindings/arm/airoha.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/airoha.yaml b/Documentation/devicetree/bindings/arm/airoha.yaml
index 7c38c08dbf3f..6506c64af4f3 100644
--- a/Documentation/devicetree/bindings/arm/airoha.yaml
+++ b/Documentation/devicetree/bindings/arm/airoha.yaml
@@ -26,6 +26,10 @@ properties:
           - enum:
               - airoha,en7581-evb
           - const: airoha,en7581
+      - items:
+          - enum:
+              - airoha,an7583-evb
+          - const: airoha,an7583
 
 additionalProperties: true
 
-- 
2.51.0


