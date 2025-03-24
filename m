Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67357C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 13:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oDq573A1DEo78oa8q5EaQH/G4SAW0wK6UJ6KkottKQQ=; b=2iYbyglx5/y7GpwWKCGCcOOT/+
	7iS27FAzQgog/rZPezVu2vRpdUZ4uWch3/OH5QzRo4V747AfYVkpPfKuYpr/6zUTp6qax+XsvYGvg
	hOcpLpEjTZTqim5Ob8BSLI/ePivncIjwnUffzDj3VhsEccGpNFmGFhIazjh6OJoSp5piefL0blMYi
	aK/rtG+H7iE9eu2zFWSNhelFyMuc6ZUk8XInN4BkJ2do++HkWfSF1sxvHuZdQxpKMmr7HnTp7pN3B
	j4tBWsbEpEDyucDJWDl8rAbPidr7jSRgflVRnlDsoLniP4ltDcwK0VLQSgvf/EfYkY8mC80eKcFvT
	4qGgXpaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twhXq-00000003CZD-0Xfc;
	Mon, 24 Mar 2025 13:08:46 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twhIu-000000036Tu-3PXd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 12:53:22 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-39ab85402c9so122740f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 05:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742820799; x=1743425599; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oDq573A1DEo78oa8q5EaQH/G4SAW0wK6UJ6KkottKQQ=;
        b=mMXny+tr3wcWAyglqRoQJphtrwjFvIlSlSj6XeSRTyDWHew5Eg9tLxo3vJERtCy1G4
         ZA/hYpmHZvRIYQSsbITQdm5jKraVYVyzXlyxD/IzBwx2idtRCTgHe6nMiwXEM6WjNBB/
         TZfyCTPlsnpGRMug8k740TVbiXpLZJnYdu5sd+BOUA0EPaFKjl3ZzTgmg9gXABeYFKz5
         IPNcyvGNhHmA0S+ER84cdBN92uN+CgVD6QYH3pOTOcu2Twado8PbNeNtbicrLRETze+/
         3FtTQfY15aMZmpwL4UFLTwgXZvYs5i9+VYzx7wVkJRA+WLPH1rVdatqn1ZBvQ61Hnczk
         GtMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742820799; x=1743425599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oDq573A1DEo78oa8q5EaQH/G4SAW0wK6UJ6KkottKQQ=;
        b=M1jqPfWpF739IM7pDolUYeyY5KhUhB/KIBoTZvJk+9mIFs88V5C5maYm/sAI+1MEen
         2p3gtom16SbM0tbUTuDa+W+QUp3/52Uj3cv7hMJyt+dsfdo+TSPBV+wiL1AoKIMJoeOi
         ks17jaGSDKFfm7c1nh9zcbFnDA4RBpQ7r+W8wB/v5dE15LpB4EkWYP0B5kK/R5N5YIt/
         Yifb6IPvR+x24yFd8ZS6E6OQDqcUJUgrlRQqc6LltCbK62tNyKTqCXSOrM812rDPxGoA
         KCXMT/P5H8kcg2XtFFTFgZZgLToGuw4KlET1A9y3N1z50bWIAsD7cKU09G+fEcmXwKdI
         lL4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVEIa1JwyIuRD+YXmfezi+IcwvMvUySAGf5ZJWnBaan+ihlrvJWVMdrC1hW0Xb8U46w4ndl6ZXWnqWEt0Ssdzvg@lists.infradead.org
X-Gm-Message-State: AOJu0YzGqUcp4HhHlikjxsthpPqI3bEyJz+bqSdcewShhVixvDBL6y+x
	OtqYxqrv30Iyx2rLly7CY54/zzEjTVROjD2g7W2XE78vwdP4/gGRZq77Yhi1r9E=
X-Gm-Gg: ASbGncsJTTGrP98comiCjmY2KdN/wY9unh9In00esc5MWpdBwo8fRkNBt3BHWg1EKfG
	usOIu2iB4Gd7pggQnjAjycOFdgIJlSufHOUn9e7WaKSmAMDYzHNWGwPsj5ix5KVzj0Fx7nrQkQV
	vmPsV+uHsP3ylLQArzXyw7qJfCOfuK/YAa7dncPouzyYy5XC+OWEgm36ZBPZrwGtGwucerloyk6
	uvVxGM/gJKlL29VlWOqB8wBQX/46Ci0bAjSrA/yvoGmWCQeqf+HzkXjiHktcUWIuMddhRtRQWSe
	HPRbkNSwtsF8BLLGZQPtvupakrGJ/Y5lnJOgrtjLlCdlmkea1xJT5Wq4Rw==
X-Google-Smtp-Source: AGHT+IEyXr4XfE4jQQNiBxD85qyqtlDpxh8WZZdKdE91l17CgQn/QudC/yJi3NGWG6c+9LLhlw/Xcg==
X-Received: by 2002:a5d:6c61:0:b0:38d:be5e:b2a7 with SMTP id ffacd0b85a97d-3997f937550mr4866832f8f.10.1742820799028;
        Mon, 24 Mar 2025 05:53:19 -0700 (PDT)
Received: from krzk-bin.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9efd61sm11017167f8f.91.2025.03.24.05.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 05:53:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	Anshul Dalal <anshulusr@gmail.com>,
	Ramona Gradinariu <ramona.gradinariu@analog.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Robert Budai <robert.budai@analog.com>,
	Petre Rodan <petre.rodan@subdimension.ro>,
	Andreas Klinger <ak@it-klinger.de>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] dt-bindings: iio: Use unevaluatedProperties for SPI devices
Date: Mon, 24 Mar 2025 13:53:13 +0100
Message-ID: <20250324125313.82226-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250324125313.82226-1-krzysztof.kozlowski@linaro.org>
References: <20250324125313.82226-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_055320_850483_62073316 
X-CRM114-Status: GOOD (  11.33  )
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

SPI devices should use unevaluatedProperties:false instead of
additionalProperties:false, to allow any SPI device properties listed in
spi-peripheral-props.yaml.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/iio/dac/adi,ad3552r.yaml      | 2 +-
 Documentation/devicetree/bindings/iio/dac/adi,ltc2664.yaml      | 2 +-
 Documentation/devicetree/bindings/iio/dac/adi,ltc2672.yaml      | 2 +-
 .../devicetree/bindings/iio/dac/microchip,mcp4821.yaml          | 2 +-
 Documentation/devicetree/bindings/iio/dac/rohm,bd79703.yaml     | 2 +-
 Documentation/devicetree/bindings/iio/imu/adi,adis16550.yaml    | 2 +-
 .../devicetree/bindings/iio/pressure/honeywell,hsc030pa.yaml    | 2 +-
 .../devicetree/bindings/iio/pressure/honeywell,mprls0025pa.yaml | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/dac/adi,ad3552r.yaml b/Documentation/devicetree/bindings/iio/dac/adi,ad3552r.yaml
index 2d2561a52683..547044b8e246 100644
--- a/Documentation/devicetree/bindings/iio/dac/adi,ad3552r.yaml
+++ b/Documentation/devicetree/bindings/iio/dac/adi,ad3552r.yaml
@@ -217,7 +217,7 @@ required:
   - reg
   - spi-max-frequency
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/iio/dac/adi,ltc2664.yaml b/Documentation/devicetree/bindings/iio/dac/adi,ltc2664.yaml
index 33490853497b..1aece3392b77 100644
--- a/Documentation/devicetree/bindings/iio/dac/adi,ltc2664.yaml
+++ b/Documentation/devicetree/bindings/iio/dac/adi,ltc2664.yaml
@@ -144,7 +144,7 @@ required:
 allOf:
   - $ref: /schemas/spi/spi-peripheral-props.yaml#
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/iio/dac/adi,ltc2672.yaml b/Documentation/devicetree/bindings/iio/dac/adi,ltc2672.yaml
index c8c434c10643..3c8e5781e42c 100644
--- a/Documentation/devicetree/bindings/iio/dac/adi,ltc2672.yaml
+++ b/Documentation/devicetree/bindings/iio/dac/adi,ltc2672.yaml
@@ -124,7 +124,7 @@ required:
 allOf:
   - $ref: /schemas/spi/spi-peripheral-props.yaml#
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/iio/dac/microchip,mcp4821.yaml b/Documentation/devicetree/bindings/iio/dac/microchip,mcp4821.yaml
index 0dc577c33918..26011b5639d8 100644
--- a/Documentation/devicetree/bindings/iio/dac/microchip,mcp4821.yaml
+++ b/Documentation/devicetree/bindings/iio/dac/microchip,mcp4821.yaml
@@ -64,7 +64,7 @@ required:
   - reg
   - vdd-supply
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/iio/dac/rohm,bd79703.yaml b/Documentation/devicetree/bindings/iio/dac/rohm,bd79703.yaml
index 941a49c93943..188b00333dfb 100644
--- a/Documentation/devicetree/bindings/iio/dac/rohm,bd79703.yaml
+++ b/Documentation/devicetree/bindings/iio/dac/rohm,bd79703.yaml
@@ -43,7 +43,7 @@ required:
 allOf:
   - $ref: /schemas/spi/spi-peripheral-props.yaml#
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/iio/imu/adi,adis16550.yaml b/Documentation/devicetree/bindings/iio/imu/adi,adis16550.yaml
index a4c273c7a67f..cf5324de4fd6 100644
--- a/Documentation/devicetree/bindings/iio/imu/adi,adis16550.yaml
+++ b/Documentation/devicetree/bindings/iio/imu/adi,adis16550.yaml
@@ -53,7 +53,7 @@ required:
 allOf:
   - $ref: /schemas/spi/spi-peripheral-props.yaml#
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/iio/pressure/honeywell,hsc030pa.yaml b/Documentation/devicetree/bindings/iio/pressure/honeywell,hsc030pa.yaml
index 89977b9f01cf..412c7bcc310f 100644
--- a/Documentation/devicetree/bindings/iio/pressure/honeywell,hsc030pa.yaml
+++ b/Documentation/devicetree/bindings/iio/pressure/honeywell,hsc030pa.yaml
@@ -102,7 +102,7 @@ required:
 allOf:
   - $ref: /schemas/spi/spi-peripheral-props.yaml
 
-additionalProperties: false
+unevaluatedProperties: false
 
 dependentSchemas:
   honeywell,pmin-pascal:
diff --git a/Documentation/devicetree/bindings/iio/pressure/honeywell,mprls0025pa.yaml b/Documentation/devicetree/bindings/iio/pressure/honeywell,mprls0025pa.yaml
index 6994b30015bd..c756aa863103 100644
--- a/Documentation/devicetree/bindings/iio/pressure/honeywell,mprls0025pa.yaml
+++ b/Documentation/devicetree/bindings/iio/pressure/honeywell,mprls0025pa.yaml
@@ -115,7 +115,7 @@ allOf:
         honeywell,pmin-pascal: false
         honeywell,pmax-pascal: false
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.43.0


