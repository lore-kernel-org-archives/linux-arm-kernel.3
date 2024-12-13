Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5EC1E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 18:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZiXtRse753j+DxWe1l5vCc1FuT3NFlbx5vgI3bsEGjg=; b=huL7lYHVFqc88azZawSo8DIkoq
	m0ICg9g3zrzXw6nPJ9DnrLcraXWTIkp8VmSlW7SD0ZTkLdLLl2UgQR7qDNxmVjH2HWRctlBLe2jWo
	4LZ5ixmyexhI4N8qXO5J26xIbYPHIKcHyXoi2EjnMsIVb8eyHQlHItdQizHdcK7CATLnDp+hnicdt
	ofqBAGqhMpGBb4GCOY5vgjrR4kFPCp1Fm+nB6tM2vbENhpB/kuhMIwVbj87089JFu+n6RhhhTgoN/
	ygap11Ks57IzImv86jOawCHSfRYkn4YaVn19jT0BH94qkcrpJ64WjdeK6bIVKcikPcJl2hmA6NnqZ
	cxTCUhRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM9y1-00000004dsU-2beR;
	Fri, 13 Dec 2024 18:00:45 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM8n2-00000004Rtl-04eJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 16:45:21 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso18842575e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 08:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734108318; x=1734713118; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZiXtRse753j+DxWe1l5vCc1FuT3NFlbx5vgI3bsEGjg=;
        b=l9yCnu60TkriuPuWBLCyzSDUQMS9Dsv1p65gBDscBD1SrdCDSalr3Lzc6KJef5ju9R
         JSzUEblPOU4cAnvl3P7hvRTfsxnl3RVEqssDvceM+Tj/3wk8IxWuMInueIcGQNqU8aLX
         UtXO4apt01CJ3roXJ778B3OlSJY2MGpIQM+wIxrw2Bkao6UC8RTwA5Eg6bMvkMp0eOgt
         8LN/Q3LYXaeA7SvEyfNtsXWLJxSujboqKtn8TXJjtAj+O+TCXFxl4pvHbczHMqI90bGU
         lgyizhVOkFzL6Byvbflh7nDbEzUYyqKJSG4eCapPCDW3QZxnpJHFUZR/VG6qDuT5O0w1
         8Uog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734108318; x=1734713118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZiXtRse753j+DxWe1l5vCc1FuT3NFlbx5vgI3bsEGjg=;
        b=rLbJ9waMKa5BRWy0xnaHls2m0ZUnbXQPWwxtkaiu3Z9lqxcYo6Nsb5NruXK4zAXBdr
         Md4mRguvADmN08LZGyLXgQUZrP2DjACb+Y11Qs7hhVrZ3KIT2rovYhrc7HYAtMCJDL1S
         +51uLyi3N1LAD/3cOp6iPlghgW01X67cvrnajoUmV+J8QT1h1synolaAoN8hPtciidwt
         aLtXI8+mORyN3DJILBlCpao9+wtWzrKDUwMXFt7Hns5enHMeF36yEHuaRYh+HDSaCbbm
         yEiQDIZWrfaOI39nsqoelUIo+2ZrKsxLbF5UAW7W84NHVT9VvVtdFRKjakQrm+KeRbAf
         lq/A==
X-Forwarded-Encrypted: i=1; AJvYcCUSfQuk+8V5eqiVBQGqokHdSBo58r3VUUfqnsXQ2DnSkXNRuj8F4qc6Fgjr9HNHrov5ajuGBmS/eX+qXS7HEW0x@lists.infradead.org
X-Gm-Message-State: AOJu0Yzjt2S7QnmLAHSYPZlS9IdI43auAM6A2nTB7AEaBVoYyCCzrEL4
	yUkXRcjEzNAGJ7KE7y/t5y5GYmD+8Ux2opGolmbKw47BAK6LVOdPThJNKra7CWA=
X-Gm-Gg: ASbGncv5LY4rTWOow2yIsLmKKx/FbrkBYL9vuIcqVHi6/kaKEhZA5J7KRWPao9W//Qm
	1PLQFIHWHZt+L5xjRqCS0gYMxKadj1irhxeIx2zC9vuk1f8wrhnrgiMmAmA2ok5CM4cUJfgNMnN
	lvdVWuwl/6y/iiMIrjJGw87pMofLA3kL+jv4nF6OzS0Z5A7E2MK6udTEbodO+/oagChiom8DOa+
	2xaFsP2oRFvUO0CBHKqU+W5v92SWX6I5qCJUdN4tLr+7kk1wkx9t2oySFJuDyOETKw55N4oYtoJ
	XBDAvemjTQ==
X-Google-Smtp-Source: AGHT+IETyJSvR8KA8pphR1pBfr5KTpzF4NmNkeh7zYSJzCimMSajiU46jqPt2jw1d/p/w6ZGTou/bw==
X-Received: by 2002:a05:600c:1d86:b0:435:330d:de86 with SMTP id 5b1f17b1804b1-4362a98a563mr32579905e9.0.1734108317815;
        Fri, 13 Dec 2024 08:45:17 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.66.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43625550523sm53900665e9.7.2024.12.13.08.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 08:45:17 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Dec 2024 16:44:38 +0000
Subject: [PATCH 1/4] dt-bindings: soc: samsung: exynos-pmu: gs101: add
 pmu-intr-gen reg region
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v1-1-c72978f63713@linaro.org>
References: <20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v1-0-c72978f63713@linaro.org>
In-Reply-To: <20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v1-0-c72978f63713@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1571;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=o8gcbchdk+NEFXIHiXqU7JXHFaPHjD7Nwegm7SL02NE=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBnXGSZluJfObTMSPxr05UelRIQWthOmoBtn2uyW
 PFgIFrAApqJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ1xkmQAKCRDO6LjWAjRy
 una2D/9ZUhnENnkW7zC4mxp8Vfkdy2PN4PE1leFf6JLDKZSIi/C5o5bed2t5p3af9nupwWd2zbX
 peM58sEtA9ZUAqP/1YmiJadFo6sfuhtOypo2wYYzUjE8HGMfxKIuTg5nyd9D18H+K0e/NOmC7z3
 4gXcz52PlvDSsyAzxNtNdLgWLxSYiRRz9bltIjIePks1DMvTs96xR90k60cSLQWMRZxWxiczhFz
 pau6fIRsTGS+6c7e96EyW5mzt3F9+HP0s5jGpGt8HvnfuAmVgNaWSS7sXM5pRGxl92yL4dJK3VN
 NFnDPSGlozXblKBJVE6TxYlVUFoZnuOvMSEmL+k8up/Q+cE6JFHEwGlYoWghHLT0FNNEgT0SQzo
 u7j2psGxS3tUrrReg16UlSZNmSwWUgeeGjjvEZetP1bYE4cAGyC9ahPfnDJy83i90fYQ4kpE0F5
 g3xcS+JgbFWGZSKW7YfoTfztDRs4V43smbO+NsuqMX2p1JuENDC8J4vnZBuk2aKGcdLR66tjqJE
 vNrzh2qAynTwCuDTYpR0ilARhUboWOrzH/QFABBXe/EAsLHSWFEX04W9sj7OU9n1clJJhjo2AN0
 R1m5zqd47YsjZziMZYDcdvozt7t0nEMDeuUTUuLU91/3XAaZzVXhx3yCv1JuWwfrH/jVy7D9zZk
 f8dW7IgVRHpeT4Q==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_084520_068383_51270F1B 
X-CRM114-Status: GOOD (  10.49  )
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

gs101 also requires access to the pmu interrupt generation register region.
Update the exynos-pmu bindings documentation to reflect this.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../bindings/soc/samsung/exynos-pmu.yaml           | 29 +++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 6cdfe7e059a3..5ac4864e4cde 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -73,7 +73,11 @@ properties:
           - const: syscon
 
   reg:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
+
+  reg-names:
+    maxItems: 2
 
   '#clock-cells':
     const: 1
@@ -186,6 +190,29 @@ allOf:
       properties:
         dp-phy: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - google,gs101-pmu
+    then:
+      properties:
+        reg:
+          items:
+            - description: PMU register region
+            - description: PMU Interrupt Generation register region
+        reg-names:
+          items:
+            - const: pmu
+            - const: pmu-intr-gen
+    else:
+      properties:
+        reg:
+          maxItems: 1
+        reg-name:
+          maxItems: 1
+
 examples:
   - |
     #include <dt-bindings/clock/exynos5250.h>

-- 
2.47.1.613.gc27f4b7a9f-goog


