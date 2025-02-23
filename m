Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA91AC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 12:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vMvQlF05mCiAYcMEroKJ0h4q5UvU+zcKze89brABNJQ=; b=iaX1mi2XyZaCx4br13m4H/sg8E
	ZYHvNDnnWYvJaEyv8hPNV2ta9jKZ/N4q9lJq+0dnrA5+p1DPwxDzRCqSuAvOzDDZzPjJdrXtQdl3B
	sAFuyZiEV9E+9q79odp8IdFkNk4CS7G9mVhwUnA57MzucAMCcz+iVl2vO8/LlrqN9h+SWATpnm2We
	jqSbIaFUr2j3HhoOvMYOn2iGgYYgHsW3tpElnIDwCK3yPzsl9+ReGfycAtXcyYZAjeMjnSZjHoV+9
	Eui1saTjf+s5VwzFgkpnPfQAzCf7njB37ArpfoA+uAs3QEUA3w0We1MV6BOuxLMJSTqr0oHFU8A4u
	orT8BWeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmB4b-0000000B5gp-0Z0S;
	Sun, 23 Feb 2025 12:27:05 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmB0G-0000000B4qh-1iKB;
	Sun, 23 Feb 2025 12:22:37 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so2000792f8f.0;
        Sun, 23 Feb 2025 04:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740313355; x=1740918155; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vMvQlF05mCiAYcMEroKJ0h4q5UvU+zcKze89brABNJQ=;
        b=hW6KfXvW42eQCalr9AxnUCcESwb9qQdzZfr6DMtI150/Bj3IOb2ieAA9ZWesoLLTfZ
         uhE0t3gKXo+qFlfLKfxUrO9gidj1Mjmlb7zmIcec2gLqHX+qdR4eri7C1vS1OwumeDwj
         idyD6JYlCgPKm07SL3bA/k8xVbZqFJcGDAwHm+LpjPEbnvmlZuDCj9WpeOUcNuXpyvIY
         mOqTfIaEoR1XcQLrhYEzDVhXnE3E2vfRUERlRdMST9rVCeC8b106MQvv1hSBIl0jGXb1
         lMsYGMh/1e4MRMiQ+IIOnh2E2ff6QUJTEQ6ecoMwpFyXN7FS3YsxZw0xxIn31NZdIoxs
         xmkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740313355; x=1740918155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vMvQlF05mCiAYcMEroKJ0h4q5UvU+zcKze89brABNJQ=;
        b=kafT7nC72gkwcdTOoAVY+tEtWUJXX0exzeGA/S/4Vi7vRpFW6sUY9QT5ZEHoPaPX8k
         wSCmUXhRwTuHyCPTTwYVbu/4UDfIeq63n10np12Wp2JjePnoBVUn/IvRbzkcbiIGR9BI
         +ip2P/UUwCV0ulzgXSvoF1FgKsK1qjJuqiXNoqm9f11HqQ3CYRqBjkMcDgZvkHZTbqkw
         3829//64Rqy0mIfRNZJXo4OiiGxV+/B+gCTeAn8DnRg3GBGROqselQmGm4cDKHQsfmBO
         mDe+r6WGYHFxtzrIZEhM6uGypc4cpmg6STfc/8Rt/mAaGGxVt/lA1r9911HwCHdXcmA/
         nTzg==
X-Forwarded-Encrypted: i=1; AJvYcCVeDo9XL3JF/qhaHfM6wwOk0HKjiwVdFADiztM8/e6bdxwS56SG+6e8DGIs1cUNOHe7G9xF294sRUlFn3WTufHA@lists.infradead.org, AJvYcCWyYvL7N1DLhMv8UJzvacoA1r1EYosI9NzvYizZxVfOIPwcnH5pSFYbF7dEoERYd09vuI8gRM3p39V/@lists.infradead.org
X-Gm-Message-State: AOJu0YzkWJcJbZxWTW1Aeaz/Hnnk1DckDIg/tmQVlJDEAdWRmNbhibJQ
	ndMOSp4QhC48nh1mv/HP1LjIyUw+d6wAy++BTd/EWbfpLWvsYxx9qJNKTA==
X-Gm-Gg: ASbGncsYSl79N3VG1PeR8cp0GSlVF4MQ/RbJd3ALc4yzdmRytlzwd2+m7xAnsRAfh5F
	DLVNGeuBOB1V+KcQTGVA/o+fH08IGLhi6jHt2XfajAW853orcb/+gLQtAFp+MV4I6U8wOQUvYJ+
	r/DOTLsAlxk9dV3iehUo4VRNtmh4iy99fraE7qFZMLWPo/ykcB6uG7hfrgbz/V3a07QkgShSpnG
	/PwGny1lf043JwuvrtTPuBEDPMKqJU2KY62XSFJL4k+U8UCL7hamfp3FEGgaO2pWSyooAgI+fWi
	nrTs+56jPi5YpYxW+ipOMtaP2gmXEwism0uu76v+4PeHFNmYgZu5Ovh8+DUYGRyUmDsRsjVf7Im
	hUg==
X-Google-Smtp-Source: AGHT+IG+0MAODFk+p1TBCBtE4y4nFsqlItck+UeuAIWOTYDShqxnT5f5tx5xGljZ6owFfPbJmR567A==
X-Received: by 2002:a5d:648a:0:b0:38f:43c8:f751 with SMTP id ffacd0b85a97d-38f6f0959c5mr10354553f8f.35.1740313353094;
        Sun, 23 Feb 2025 04:22:33 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f8602sm29611608f8f.94.2025.02.23.04.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 04:22:32 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/8] dt-bindings: phy: snps-eusb2: add exynos2200 support
Date: Sun, 23 Feb 2025 14:22:21 +0200
Message-ID: <20250223122227.725233-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_042236_450511_1FAF9A75 
X-CRM114-Status: UNSURE (   7.86  )
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

Exynos 2200 makes use of the Synposys eUSB2 IP, so document it in the
binding. Unlike the currently documented Qualcomm SoCs, it doesn't provide
reset lines for reset control and uses more clocks.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov@gmail.com>
---
 .../bindings/phy/snps,eusb2-phy.yaml          | 64 +++++++++++++++++--
 1 file changed, 57 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/snps,eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/snps,eusb2-phy.yaml
index 22c77968f..f4164db71 100644
--- a/Documentation/devicetree/bindings/phy/snps,eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/snps,eusb2-phy.yaml
@@ -23,6 +23,7 @@ properties:
               - qcom,x1e80100-snps-eusb2-phy
           - const: qcom,sm8550-snps-eusb2-phy
       - const: qcom,sm8550-snps-eusb2-phy
+      - const: samsung,exynos2200-snps-eusb2-phy
 
   reg:
     maxItems: 1
@@ -31,12 +32,12 @@ properties:
     const: 0
 
   clocks:
-    items:
-      - description: ref
+    minItems: 1
+    maxItems: 3
 
   clock-names:
-    items:
-      - const: ref
+    minItems: 1
+    maxItems: 3
 
   resets:
     maxItems: 1
@@ -58,11 +59,60 @@ required:
   - compatible
   - reg
   - "#phy-cells"
-  - clocks
-  - clock-names
   - vdd-supply
   - vdda12-supply
-  - resets
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm8550-snps-eusb2-phy
+
+    then:
+      properties:
+        reg:
+          maxItems: 1
+
+        clocks:
+          items:
+            - description: ref
+
+        clock-names:
+          items:
+            - const: ref
+
+      required:
+        - clocks
+        - clock-names
+        - resets
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos2200-snps-eusb2-phy
+
+    then:
+      properties:
+
+        clocks:
+          items:
+            - description: Reference clock
+            - description: Bus (APB) clock
+            - description: Control clock
+
+        clock-names:
+          items:
+            - const: ref
+            - const: bus
+            - const: ctrl
+
+      required:
+        - clocks
+        - clock-names
 
 additionalProperties: false
 
-- 
2.43.0


