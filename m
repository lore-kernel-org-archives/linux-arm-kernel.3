Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C1CDC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 12:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P9iOMNCqnm556i6iWSK9mE2UkHu3B2asZSKy8c1kTbA=; b=U9bbzz1ZXJs3IDph7oKiCAgTIz
	5bq2EadY+lb9Gix5a4X5DuG0LAL/yELQraHHhh+jey8x0tTtsmcipoYDWUvLA0jOk2YEq7YZ7sADb
	DE4CQ/k0O/o4vRww33CMpQae/r+G+ej2/2zSZPA+eD/Zoz6bD0tczcal/doWxtyJ9cC94lzaQsRtp
	GAWGKdVP6hRlAR0lzj3StU87/8fRdGb6y9Sm/ngd4A4uDJIs3qlD0neu1Ov7ud1XrCArx9SiJH76B
	tiguzr0Zd7dFZVFqQrBakwVYZIZ7PqUtGEaySdVPCSy/wZLhVkv203Sg5Er0pjMPVRfUgx4yJkDoi
	EdMGu/0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMQNL-0000000AsNm-3Kwe;
	Tue, 03 Jun 2025 12:04:15 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMQGo-0000000ArTR-2Q6D
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 11:57:31 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-450ca8e6d05so1739105e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 04:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748951849; x=1749556649; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P9iOMNCqnm556i6iWSK9mE2UkHu3B2asZSKy8c1kTbA=;
        b=ZsYrLQOBZAOnCFUkkHwCOD618ExaOS/5hApijfVpFmU1ks0L+Qw5ZJG/TJwgifTdEx
         Evr76x+XMY39ZZF8xj5uCZeErbXrDSOzfdQIGN0spRVQgg5nQKHop3I67CcRKWLADUqD
         gX+jiXepHERGli4sYXF/HMJeE20yk9tkXCJUJFPBvSV/aA4g5iM+ySizxJom0mQmG4iG
         oXFuzaDq68h7t0x+AeT1xVazu3Gnf/+oN+mvZJlKQ5xgzRMg0Acch7qMqL3ZiBDPwEZI
         KXb2jXxHR1wYnmHrBR0uNOdacNvz5Ku0M9Y7rE4WFnvEdrI0o7yPh9ADIAAB2EFfGEx9
         05Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748951849; x=1749556649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P9iOMNCqnm556i6iWSK9mE2UkHu3B2asZSKy8c1kTbA=;
        b=Xr9rSyM2Niojfp32zIQqoXp7mT0hAE8WbwHZjBDEa2aJEjo3TPD45G/0zHc9KGq8AY
         2uYKdPUtHASeGTv2mM9eZCO9muydxW7p9sHjvsh4iYxWMcqQb/q6gkl/R6+MorSwJ1cf
         Qg4BheCRYWikcOIVqB3frOp0gQZQ3yoSWU60HsiozqyIxMdaJ+JnsivL+htqWVTRhrKc
         zgtsGeyplSW2KADZwTWp/XpjjCKb6kwwu5pBGDrWspFtV3YGnLMQ5enlup3aP+wmacaz
         zX7FSCb9XGkcvQoMBHlnScb/Z540cayf6lZkgm94I5xWx2gn5GxuXo3fts2Hhv6yNvs6
         kbkw==
X-Forwarded-Encrypted: i=1; AJvYcCUkDxUvNkHhDOrbUAFJTcO70T8eVhSQ2OkUZYEGByoUIoY5mr+RlUspIiA6HXCWb9xRT3ThjsG1bQlRDPKB4w8b@lists.infradead.org
X-Gm-Message-State: AOJu0Yyg8GblVSkAxQ9tqh54foZc7xlYaK+kdFvI7HJUQXWLO5F1FNjE
	OgRfQ0994T13Ex+hxwWDdYZPYuId7l712gHPe7GqkvsLqiAYtFUP8RAdO/kbB717L+s=
X-Gm-Gg: ASbGncuyNNKXdW0+L8QabHZuttexB72tBhajQXs8SEdnKi6DxhFUwnyFF50wNS8uXRC
	XPnNersqENRSdxaH0bXVGECuvwjkhto05ZwdkC1N52c64cUvoGNDfmNljAk1ZZBEOPgjBm1qrLt
	XWVf6wvkvE61IdLJ4SGU9nnb9Z+UA7EpuKs/uCL/hoW6QG/UlNF1vYf5z1YkWb6NY9T1MH2+2oF
	Ww1rO47J61BDGInoxhZ6ytTeFhSCdJg3crXn6ey3afg830tVFZt3JP7WMScJQvUAp8kAI3ZtYw1
	1EEQz6ffdd8vA2cCbo7AsZ0mk0Vcmt9oRt18Pazllz1xuhhqrcsmABbQmUKiIaaxE4yN2DeuMU9
	LxaqAPhRTKv5J4ky8aUevIw==
X-Google-Smtp-Source: AGHT+IG6CmWM3RslzVJ9Zs6x2OnxvGd9okADIrUTxvkVwVY0rJS07w9DnVo5m/6fQdGbvnL2BjUAIg==
X-Received: by 2002:a05:6000:2886:b0:3a3:7049:f947 with SMTP id ffacd0b85a97d-3a4f897bc88mr4781768f8f.10.1748951849223;
        Tue, 03 Jun 2025 04:57:29 -0700 (PDT)
Received: from [172.16.23.13] (adsl-84-227-104-5.adslplus.ch. [84.227.104.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c7adsm17671666f8f.26.2025.06.03.04.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 04:57:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 03 Jun 2025 13:57:09 +0200
Subject: [PATCH 2/5] dt-bindings: mailbox: ti,secure-proxy: Add missing reg
 maxItems
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-dt-bindings-mailbox-cleanup-v1-2-724407563997@linaro.org>
References: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
In-Reply-To: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Nishanth Menon <nm@ti.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Suman Anna <s-anna@ti.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, asahi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=902;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=PmQVq4hQS35gwAsgZYe0MBq9ErqtT+mom2oZuUDxvi4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoPuMb6qbPyHvmIRIrN/4NfNvZ2r6JN2VnhQ/rt
 P/6fx1bFIiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaD7jGwAKCRDBN2bmhouD
 11okD/9H8uQVKm6Fba6vs1oJEhpW2E6WDVf76MJKju/FQ59Kihwd3IlRjqvGcI3JVd0sghwfs5E
 dVHRZW7lejfKzozTRGlzYKm8jWya/bma153cjRkvzpDQ4dCBvIRrkIYg1uIO2KFYZbF+V1iRT3b
 g7UmqkWQqU2Xb3Vf2CVYNjeCKU7YQMZfAM2zsm2XqrHunsByEHhmiuPvSN4lljzOe//vWePZRWG
 oO8322aArQSfeBI4C52Yg3eKV9fHdvXpB6DijXi8YYx1Wb7SNfaj4LhVu8ODa/+DU8SGRNlxNP1
 Z9PDMuPCdkOOHza9p/Gzg96ZEX6jiKXZKNLNsZ+MjGfjP+789AdQqGGgMgnuGAk8XzT9GFl8lwQ
 fiu3PECrJ9h2dK0zIrh7fps9SVMjmuxVr4ap/yatDj2cnoKj1Ecc3/++X50tuN4BcbhEcrwOBNX
 KhkMPb8L/I7QgZ5Au5q7TpxMhDVfJXNqe+Iy+pY/JEE4GthRQjtzicDApK+RT8f+pceNlH4Ic/c
 Z1yMhvvNcKbEQkmwRPFyFCJHuv4iX9VNx0nZOxzJnR5Lc+ILPanys9dW3fr6NbwJo5ZlEyyJujQ
 JAyTMfMPK7r9ETJN711C9Myj4NJ76EYYBkR/8yBzgRKUIZmx+mA4WHhJApZvSUkhlTtOCzwMCuu
 LpLpbn5wLmTgrQA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_045730_623114_62626DAA 
X-CRM114-Status: GOOD (  12.51  )
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

Lists should have fixed constraint, so add missing maxItems to the "reg"
property.  Since minItems=maxItems, the minItems is implied by dtschema
so can be dropped.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml b/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml
index eea822861804c259068aa8c4598188db28895518..682ccd76f5c25fc13bb3375007d39e6208cdddc0 100644
--- a/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml
+++ b/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml
@@ -36,7 +36,7 @@ properties:
       - const: scfg
 
   reg:
-    minItems: 3
+    maxItems: 3
 
   interrupt-names:
     minItems: 1

-- 
2.45.2


