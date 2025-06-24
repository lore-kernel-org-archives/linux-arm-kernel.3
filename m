Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960F0C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 15:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1pNAOsr7oBRaoQ01PVf9vESlXHVYj7tbDwKZX+rkhTE=; b=AM/Q0TR5ZYtZ3V1pKnwRX5TIPW
	0sVYW4bVrCNZX9bUXHGmP4RCsl+HTUkZQCYbGkphEh9rkDlR8mN9RKat/NSHPT3xYaAHKmfqU6/se
	wDy4EZZExZJgEKU1ITzv1hJBayLVb9dLKjz3vnonQDi0MXnEqZI9Q7UimvmMXGMx3Gpl2d2NpKzTI
	S4YT6W7Y7BAyCsr5UPcwBYLrbnrbGTfxC81+KnR9eg6Jn6Xkzf/qW2muefJO89X1V+adr4WW7CkcY
	xJxlJ1xy2EYe8W3PBv8QIIEx/cC94mGUHRPDbEMXGHQZZY66lN04aVy7QEeFXbtInT7rxewUdQbBG
	cPXW6rIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU5xI-00000006CKj-23iY;
	Tue, 24 Jun 2025 15:53:04 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU45g-00000005nEZ-2uHa;
	Tue, 24 Jun 2025 13:53:37 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-553b60de463so5806612e87.3;
        Tue, 24 Jun 2025 06:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750773215; x=1751378015; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1pNAOsr7oBRaoQ01PVf9vESlXHVYj7tbDwKZX+rkhTE=;
        b=jWYTzna7D2rmvqg7dyxBloXF7CLrJ+UvE1vGRVlD8q6Axm2YcBiSaPzN/29DfQwDTP
         efffmLvdq36lEvS7I8T7nRfs9ZEj0pe2apg4Rw4VDWiFkS78OWf4is7ZPv6AYRr6I93j
         rjVJCSoLe+aOjUH2VowVTBF3bQpFxeEs2INehyiO0sltidKhKwMBUElIDbFnKNDy7HRt
         h/Hm1FspfGdxG5cxT0fi5FMg7nqO+BHiLyejuQHtQ7jKX53wRG2XJheA+t2+Eor1yI2e
         ozq2tLZlNrQt1yK4C9pClYcGwVdaCgg2q6m/sMYJVnXCWx73u5FNYV9wBIpDm/9taLBy
         kXDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750773215; x=1751378015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1pNAOsr7oBRaoQ01PVf9vESlXHVYj7tbDwKZX+rkhTE=;
        b=bJmCbLxPYojxSNcdkiBhAFaZHAumixpvdRqPGij6YFQAo6TTSq5L2z7rJLCFPnASY0
         Ikzx3ADtaJfjTIi76Omvz6MgegVWt84agR2TmNFilI4JAQ763QbshNyYhMs9rsfJ5yhH
         UDqdQTQsSUIMbJ1PWL5PDveMTCBdENvm3ztHJ9XEsnXReGOa/mjP6hzAodN+fYB4mFCE
         ZBIy0a5UNj4PvbxAPKpFFkkbLEUM9ea6rCsNAXxGYvrZG7UDZZsiF36VHbCSw80iN7JI
         KBH7qwWH5amEoz6xwUVQf9A2pz5AYB4M9um+y6kP1vLcrLOMK6LxzXHlYWRZrK5IhIkh
         bmlQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5I4ToKdLIHeAQlpWSfnj9Gvil+vqRc8OxDXNWi+C2HTb6YKPUmPAqdNIycfRkPDlsshqFLe3HYLWGhCE5xwZkQw==@lists.infradead.org, AJvYcCXBBqk4+kNwFFLkHbx8dowrjuYzJTOfe9+7JuZ73dc3UtXEhwOdkRuvlh85wfGX4WZRzXCXuA2Yisvp2B6y@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6xEQIBNYxbqnFfcVrb9imLwok9aTaiyT1oyrmRc0UOzwGkwWr
	RI4QTb7BIby9FeEIxIuctCIErLDpVzUXQ8sSKWR4EdqwIq9wlxWYBA7l
X-Gm-Gg: ASbGncsfuUg/ZYrFt06/h+CVT8aThQpT9WDcnrBeOVQy8+rSiBi0ma5RBWS1dDMI863
	8vfIORQhfUCv04YhV8qhHI81Z0TFLSj1ylczkIAWEVdGBFxqtc+zsgl9yJYa6x2ehTIsyZpGmUl
	KcuaJO7mfNKVLR+OtkVzrUCyE5rWxr8LovRJbhbXa5QCEjK05peQApYZjswtTPj8+TJ0BeBhgqt
	0opX/7eZLkPzuMJba3YfZMum/NkfUMZeLMZoANdUe3+nz9ZK60dmT+H6AzyZokxZTu7WNphCb8N
	RC5hF1qSMOoBP7LWfZlxlMJlpIBuXROzGGpWr9eRyE+MVoxZ69RL966B+29n4WtCIn6LfKuL4DM
	3UwvxXpFiLekoa/ew4D4RYtuHc62QwLVBJTLCmsHuMOVY1W+/lM/jjrqdRYi8ToDZgMvrmY0Q
X-Google-Smtp-Source: AGHT+IFHoqsn5l+6wnf/gfhqMIvTUVLCfhefWnXG0QHSCeZSMNDwhCUiamUKfO/EUExW2EQxIREwaw==
X-Received: by 2002:a05:6512:3e0d:b0:553:50c6:b86c with SMTP id 2adb3069b0e04-553e3d15539mr4868398e87.57.1750773214903;
        Tue, 24 Jun 2025 06:53:34 -0700 (PDT)
Received: from user-A520M-DS3H.sberdevices.ru (broadband-188-32-30-96.ip.moscow.rt.ru. [188.32.30.96])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-554e6dc186esm1282905e87.114.2025.06.24.06.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:53:34 -0700 (PDT)
From: Alexey Romanov <romanov.alexey2000@gmail.com>
To: neil.armstrong@linaro.org,
	clabbe@baylibre.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexey Romanov <romanov.alexey2000@gmail.com>
Subject: [PATCH v12 17/22] dt-bindings: crypto: amlogic,gxl-crypto: support new SoC's
Date: Tue, 24 Jun 2025 16:52:09 +0300
Message-Id: <20250624135214.1355051-18-romanov.alexey2000@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624135214.1355051-1-romanov.alexey2000@gmail.com>
References: <20250624135214.1355051-1-romanov.alexey2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_065336_730211_C706066F 
X-CRM114-Status: UNSURE (   9.29  )
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

Now crypto module available at G12A/G12B/S4/A1/SM1/AXG.

1. Add new compatibles:
  - amlogic,g12a-crypto
  - amlogic,axg-crypto
  - amlogic,a1-crypto
  - amlogic,s4-crypto (uses a1-crypto as fallback)

Difference between this compatibles:
 * Different registers offset and the number of setup descriptors.
 * GXL doesn't support hashing like the others.
 * G12A/B and A1/S4 crypto HW don't support 192 AES key.
 * GXL, G12A/B and AXG require a reverse IV key before processing.

2. Add power-domains in schema, which is required only for A1.
This is specific vendor design: in old SoC's power domain for
crypto HW was not configurable, but in A1-series it is configurable.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/crypto/amlogic,gxl-crypto.yaml   | 24 +++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
index fdc39797a2a9..106a9d1fed69 100644
--- a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
+++ b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
@@ -11,8 +11,16 @@ maintainers:
 
 properties:
   compatible:
-    items:
-      - const: amlogic,gxl-crypto
+    oneOf:
+      - items:
+          - enum:
+              - amlogic,s4-crypto
+          - const: amlogic,a1-crypto
+      - enum:
+          - amlogic,gxl-crypto
+          - amlogic,axg-crypto
+          - amlogic,g12a-crypto
+          - amlogic,a1-crypto
 
   reg:
     maxItems: 1
@@ -24,12 +32,24 @@ properties:
   clocks:
     maxItems: 1
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
   - interrupts
   - clocks
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          const: amlogic,a1-crypto
+    then:
+      required:
+        - power-domains
+
 additionalProperties: false
 
 examples:
-- 
2.34.1


