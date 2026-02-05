Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E2D0ECD9B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 21:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ykCzK4+rV2dgKa7+qS2lLnqsh4ES+AwZxLAa8QRXGOg=; b=VGHWFr8Ivmcn/9FlGNBoYDCZra
	hc3vcyOi3Z25ynyyZLcmdM0XdrE1uwSkvLqPVg7m0w7NpZQY7WxC8dQhEiMsZPcQ5vSIh0qkwpES8
	K5bqMYCTRITSRtq7PUxzS6ohvGaVmROThLg1nsrO8TJ4El82p4RTNSvhuDOdCXcTeIYDS5gM/Qw75
	fcFI2D9zRnUvU8BHw6zGB/fxdPxw7RQ+zRLv7VSSAwjSw0guCrlkETw7oNQ4gRHwHEhAPNl843aBh
	4vedbZoFu4tmjGlyP0/WCUg+DevVvF9UhJkKBvPk6K17DQOeGOQtx8T4fCJrug4vQhF4FY3P8ecLx
	dwcUekEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo77Z-0000000AWue-0k1p;
	Thu, 05 Feb 2026 21:42:41 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo77T-0000000AWqA-1Pg3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 21:42:37 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-b8869cd7bb1so3465966b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Feb 2026 13:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770327753; x=1770932553; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ykCzK4+rV2dgKa7+qS2lLnqsh4ES+AwZxLAa8QRXGOg=;
        b=qyxzdHRBf+bR5eiNOpXaXw+6Nu5oMiV4kPS+b80OSqg+PMZNQz4yPzbgkp78bRFL5r
         IhyhAeouRU1bzWtDop//Tf3wqoMUNpblJwNPI6JmOr8vRRQgtPVPAywd+F6lQC/DVevj
         zdieQYBFF+Ni4qp0rML88xgHXPya9VJKbMhfyYk/8W3Mkh1xukD3bURV6uvExvom9lXb
         QiEXS8hXi0oZny4fEZCeN5EhwFYVKVcDO6r8kDZbu1Vxa4MnYh6P2dMOjmHHl19ehkgk
         NvMTuOsCS98rYes8+utN9sM2Luo8KGvomMs6M9p/BOBKvJedLhIecZZegQR97osTBzFZ
         yxOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770327753; x=1770932553;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ykCzK4+rV2dgKa7+qS2lLnqsh4ES+AwZxLAa8QRXGOg=;
        b=GMyvScZJkmIRy7yAgt+07M5hPE69YhLTIjRBqjVulrbAQb9J29aWNDTaKN4Gr6/vt5
         7AvLP+68MJTRk+O1RoGd6LO8bUsn4Ad77G5jWClR8kCdj1izbRRNN7/nYnCusdFYwAsq
         HOqxdp2iNVFLUYjcJx8VuRyw7NYW+jgKMhB1i8vo5rnDZm3PD4b7sT7QUecDcPOFtq95
         BW8W4ojvkD3Lh7sabW+3J96iUBq87QzZaZ5MIsmGEcvq1bTYIY3bhh0VsYaysEQdktxC
         BBDAxCVInJ5FJL0UK9JbwM0muzowwmKW1t09ON9VQl3SbH/0GpDQYELMDvKEkKNMy6oO
         OPdg==
X-Forwarded-Encrypted: i=1; AJvYcCUjwAvaOVkoins18IpqHFN5uah7ExsO++qroQkpicKWxmDdH2PLpEcsmDveUx8CCHllNrW8bealPuRP6rlkqdUk@lists.infradead.org
X-Gm-Message-State: AOJu0YxhCudoB5dL/uC9n2PCz0PiO8bs77wRGFRi2gTutQpv8PQ/616b
	ZgdS3EEvRXLdyDbmYZHb27zGx0tIDCWOdBDWRrQoU6L7Qc8piR3giViaAyb/mj4oAik=
X-Gm-Gg: AZuq6aKvLSRG2HZgG4k3rIclv8TdF3Fb9qgRcxFHCby6MpXA0TLAzSGTVCTAPSLVmwi
	MSXF+it04tZzbi+PvXOJ0jvppFNUDyyTP7dTgjyoSlsQi06WIQ6wo9QjDAWPsdoE+k7cA1c8P7M
	kEIpTqpWKKAp8NiH6BgOIW/ucqR4CG3Utc/Sh+rGbDEDw3f1FEgZLzS89C4rNzarkhM/OJXm6C3
	Shn1cRSxelbqsl6mqmqpnxVLx3ETbLlv6Zhx47Fy97LobixBh7S0jc3jZ8D/GT4zAcOuz9XWYrU
	ldzLgkDHQ4keDBwPCY2AQ+jDsK6sPhhmuy2mtbWp0Td+LGC0EaSKEJ1jVhU/GP5nAJFdoK0DGmF
	BAL2BuVY80lROhm//sMnEQq6o7gvBhzMS1zOY3CthWUUx4ZbmMJLYgQIrbqWa4HtOFtAN4GERVk
	6ykVUPF49t6w3eA83SNVnSQ/YZJDfFcPjX9KoNI+O8AIC8iDFspGCPAkKMHVB+6bX3Sdg2KHHgN
	kIk4g==
X-Received: by 2002:a17:907:ea7:b0:b8d:be69:78bf with SMTP id a640c23a62f3a-b8edf19e91fmr26932766b.20.1770327753301;
        Thu, 05 Feb 2026 13:42:33 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda7a0074sm21859966b.18.2026.02.05.13.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:42:32 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Feb 2026 21:42:30 +0000
Subject: [PATCH v5 02/10] dt-bindings: power: samsung: add google,gs101-pd
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260205-gs101-pd-v5-2-ede49cdb57a6@linaro.org>
References: <20260205-gs101-pd-v5-0-ede49cdb57a6@linaro.org>
In-Reply-To: <20260205-gs101-pd-v5-0-ede49cdb57a6@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_134235_391059_B82010E2 
X-CRM114-Status: GOOD (  13.41  )
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

Add support for the Google gs101 version of the Exynos power domains. A
new compatible is needed because register fields have changed and
because power domain operations involve interfacing with the TrustZone
protection control on newer Exynos SoCs.

Power domains can also have a power supply linked to them, so add
optional support for that, too. It is believed that all (existing)
platforms could benefit from this, hence it's not being limited to
gs101-pd.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v5:
- add domain-supply and update commit message

v4:
- add new vendor property samsung,dtzpc
- drop previous tags due to that
---
 .../devicetree/bindings/power/pd-samsung.yaml      | 33 ++++++++++++++++++++--
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/pd-samsung.yaml b/Documentation/devicetree/bindings/power/pd-samsung.yaml
index 9c2c51133457112ca0098c043e123f0a02fa1291..3f1a2dc178625f8cfdbb913d0c7cb5b2519fe477 100644
--- a/Documentation/devicetree/bindings/power/pd-samsung.yaml
+++ b/Documentation/devicetree/bindings/power/pd-samsung.yaml
@@ -13,12 +13,10 @@ description: |+
   Exynos processors include support for multiple power domains which are used
   to gate power to one or more peripherals on the processor.
 
-allOf:
-  - $ref: power-domain.yaml#
-
 properties:
   compatible:
     enum:
+      - google,gs101-pd
       - samsung,exynos4210-pd
       - samsung,exynos5433-pd
 
@@ -33,6 +31,9 @@ properties:
     deprecated: true
     maxItems: 1
 
+  domain-supply:
+    description: domain regulator supply.
+
   label:
     description:
       Human readable string with domain name. Will be visible in userspace
@@ -44,11 +45,28 @@ properties:
   power-domains:
     maxItems: 1
 
+  samsung,dtzpc:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Distributed TrustZone Protection Control (DTZPC) node.
+
 required:
   - compatible
   - "#power-domain-cells"
   - reg
 
+allOf:
+  - $ref: power-domain.yaml#
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: google,gs101-pd
+    then:
+      properties:
+        samsung,dtzpc: false
+
 unevaluatedProperties: false
 
 examples:
@@ -66,3 +84,12 @@ examples:
         #power-domain-cells = <0>;
         label = "MFC";
     };
+
+    power-domain@2080 {
+        compatible = "google,gs101-pd";
+        reg = <0x2080 0x80>;
+        #power-domain-cells = <0>;
+        label = "hsi0";
+        domain-supply = <&ldo7m>;
+        samsung,dtzpc = <&dtzpc_hsi0>;
+    };

-- 
2.53.0.rc2.204.g2597b5adb4-goog


