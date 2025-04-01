Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE7FC36014
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 10:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f0fLcWG3xRCCoczcLQcRJk5lZ+cdqHvZLEk7m94iuVA=; b=IcOp0a0RFfVVhiu7c1C6tm4d4K
	Eni4hHBIPaxUQLppWNrY0/gmK5TJ/ynTk3oAQPd33yw98Z6Z6nRAxSkwNyi1Yc1yjs08dk+s5RP8Y
	FN27O7okgJDaBDjYIdnT/fLWmXwbIHSH5+wwgna2iUR8tfyoGH90eqjOVz/vZBwcIXGG0wMJOAhWG
	/pSdNn4+HwV6xpcAjCRw5NIt7kFdkqbPZYRLlErK59Var7+JpO4joNX+yv9ZMPAYK8YzBVf+8mG5A
	LNc0fSz5mSi53eP0EkEKra9yJzKehYH3n/sc2DLuldVyQjUC7taNxV9s/L1unhQQRs1jIhr38svZ+
	Ne6DzSRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzYuT-00000002dVs-18in;
	Tue, 01 Apr 2025 10:31:58 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzYaN-00000002aaA-3mwc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 10:11:13 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ac28e66c0e1so804659666b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 03:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743502270; x=1744107070; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f0fLcWG3xRCCoczcLQcRJk5lZ+cdqHvZLEk7m94iuVA=;
        b=NqvzdoyD2XoNQYYNeOlv0hGoJRk5q3pRUtf7ZV461LUGLkR0dHiW63EuxIAJtMc00c
         vrcAt/R3miqOkYFeeNisp3ME3C+ePQLosdLBCwE1VoeJ1JqUHboSUOqCbMO7dSeuB3OU
         OwKgS34h/V+ZCiZNYL42L13FAslg8ajbF7ZmDC98RUZR7APvDWm0SMqoAqhRanbcxr13
         RXLR/t//U8GhhEZpZMmgfCOwjDEFhggQOa/jV1cB33XIs+0gLbXXdlmtZYAmyU2Nj0qm
         rX+a+RZFJfXtAWP9fWC6SE6Wgbm4FQAdNkLZ8srFzcOIoGy0DuBW7SG5Uy4FYv2rkNAD
         dCWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743502270; x=1744107070;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f0fLcWG3xRCCoczcLQcRJk5lZ+cdqHvZLEk7m94iuVA=;
        b=HRKtukdCZD0fyttpxlxvV7DPwMgsodDZYo/+J4SNnkl0csyuvkjiV7Agm5B+ozHNxO
         WRte4QomP3puLAZdbF6rd95dzWvEydRjo/d37/ZOJN8Tnq4jTLjCzFW9vFcl3jLeBHpg
         T/W0+JYx+ocoq/c0N7eeC0M31ZKeQRkOQmZ2ts7763DIw7nKZvUy6qlDNgTUVJVi4M8P
         9LiRW2g3frBw/qs3+79rpVnZ7JGd8QiKYqyGT/b1U271YUxByvnFUezdGMS0lrdRSdpB
         rDZ+pZMriKb4HeFPT/5AQzna+CZcTNhx2KAufCZB8mOUzfGoUEAKbs90C9Ahy0NFYkq7
         Wpyg==
X-Forwarded-Encrypted: i=1; AJvYcCXgZd+potcOnaNF/9/TKGFgcO/1fHOrL7RECqtvN3yBCdSI/6xHdT8qEHDKoXMZ7fST4ECxJZZ6C9hHVRQhfDz4@lists.infradead.org
X-Gm-Message-State: AOJu0YzwUc0TWbNF9tDE+SofvIu6lUWkqRYDYcz9f4OskivrOQOkwCqL
	kZ3psAhreiMExwzvEWevtnY3T3m2fdFJ+vVteRb9xAeC2m3rOtSyJO/k/PXAcIYjM46o2toRTya
	43dU=
X-Gm-Gg: ASbGncvEpK1N5++C2SRTGbVTYURZBwe0d0RVqXEYmd/BVVDMzLwTgI7iJt2MCsEFB/0
	V8NwKG975J28PpWeN2W8EGLCHHxRZ+Y+2M3ScABua2CO4SqaPD+WIa7zS9jRGSg1I1eT778JfwZ
	Ly/JK4WDL/a7XqdDrAmGWW43NE41dAFfcytaT8VGIfPBFWOWWfGJeFaLOZ3lM5H/DfANKtxCGL2
	XzPHeXxCqSMXkROs6uCpmgzY6Ty7QXb9wFa40t3JvtUqQUOeNqptRvAa5qkLmJ7xPTXh/ZknTOB
	z8SyIbUmxrJ2wl3ic/G1mo8A4fcgXeajxsXWSBCzXvBRrTchyHLs0MftnnrbOWOEjHSffM5oPAA
	Ot3z7S1n/hpIEvTGFojI5TkHW8lJy
X-Google-Smtp-Source: AGHT+IELZUBLM5q9YYlt+lD2I0tWCOgW2YPV6e8Gm9HIS3wyPkKW8jVGcaajvDyvq1766HKI/b1QYg==
X-Received: by 2002:a17:907:7eaa:b0:ac3:45c6:a1ec with SMTP id a640c23a62f3a-ac738a841a3mr1407550166b.25.1743502269931;
        Tue, 01 Apr 2025 03:11:09 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71967ffcdsm757406966b.140.2025.04.01.03.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 03:11:09 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 01 Apr 2025 11:11:02 +0100
Subject: [PATCH v5 1/2] dt-bindings: reset: syscon-reboot: add
 google,gs101-reboot
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250401-syscon-reboot-reset-mode-v5-1-5b9357442363@linaro.org>
References: <20250401-syscon-reboot-reset-mode-v5-0-5b9357442363@linaro.org>
In-Reply-To: <20250401-syscon-reboot-reset-mode-v5-0-5b9357442363@linaro.org>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_031111_946437_F3CBF30F 
X-CRM114-Status: GOOD (  10.15  )
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

GS101 supports a couple different reset types via certain registers in
the SYSCON register map.

Add a compatible for it. When in effect, all register values and offsets
are implied, hence they shall not be specified in that case.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 .../bindings/power/reset/syscon-reboot.yaml        | 42 +++++++++++++++-------
 1 file changed, 30 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml b/Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml
index 19d3093e6cd2f7e39d94c56636dc202a4427ffc3..ccd5558700943ef56f5e1c866400bcc21c0115f0 100644
--- a/Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml
+++ b/Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml
@@ -21,7 +21,9 @@ description: |+
 
 properties:
   compatible:
-    const: syscon-reboot
+    enum:
+      - syscon-reboot
+      - google,gs101-reboot
 
   mask:
     $ref: /schemas/types.yaml#/definitions/uint32
@@ -49,12 +51,6 @@ properties:
   priority:
     default: 192
 
-oneOf:
-  - required:
-      - offset
-  - required:
-      - reg
-
 required:
   - compatible
 
@@ -63,12 +59,29 @@ additionalProperties: false
 allOf:
   - $ref: restart-handler.yaml#
   - if:
-      not:
-        required:
-          - mask
+      properties:
+        compatible:
+          contains:
+            const: google,gs101-reboot
     then:
-      required:
-        - value
+      properties:
+        mask: false
+        offset: false
+        reg: false
+        value: false
+
+    else:
+      if:
+        not:
+          required:
+            - mask
+      then:
+        required:
+          - value
+
+      oneOf:
+        - required: [offset]
+        - required: [reg]
 
 examples:
   - |
@@ -78,3 +91,8 @@ examples:
         offset = <0x0>;
         mask = <0x1>;
     };
+
+  - |
+    reboot {
+        compatible = "google,gs101-reboot";
+    };

-- 
2.49.0.472.ge94155a9ec-goog


