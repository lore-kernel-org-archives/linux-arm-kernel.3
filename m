Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C428C36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 14:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bHKxmG8ByngkXQTkMpyDFQIrJdv7U/tLvQeFlUSDHEw=; b=HLI4lsT6B2kpZnYwmgXF02DrjL
	AnydsQdP58k4t0eLyNq7mM3jIniJwS/cwKxv0jbnXcxjJ0nNrtS83bQKhYU9SH/QHKwb3vSwGq1dd
	9DJqH9BNaTVfjfhMDRlMKuoq7DG3UT5p7rF9WZTtgh4+aBMkNTQAtd6SATbT0ehFn4ww6aYjq8bD1
	XvA0Xlr07HcKx+4CIG0VeBfYOMy0TYqt3CsB4n66ZFoOS62IsU3W+irUW06XkkV2tmnv8mmtqd11U
	8d7PfBfxEy5Y6jorSYFCY6/wBMj5Uu9GuhbjaknVtwA3H8X1fUjoyBE5mK97fpirqHK0XBY31ayFi
	XWxsf5rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvcx9-0000000F1JQ-3e9H;
	Fri, 21 Mar 2025 14:02:27 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvctp-0000000F0UQ-0ur3;
	Fri, 21 Mar 2025 13:59:02 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-39133f709f5so1091056f8f.0;
        Fri, 21 Mar 2025 06:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742565539; x=1743170339; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bHKxmG8ByngkXQTkMpyDFQIrJdv7U/tLvQeFlUSDHEw=;
        b=meTjGJgawbi/mOKKgR/8vzmNIdRr4kahbZpH7iVJ8FXD6vz1Py/Sri1BpseJCilRah
         wmm5XkeBi3h/XVkPzAEiY9YS7eY/rZNqdBdhu1arG4slo3YTgJKWTRtZi9mJy5oFNvbm
         +G5lQGRFMDwoWaPjmhbNcnDHWU6sQ0U2AF+ierU8qDrPu+watBh7MjHFz71+lHl9/kIj
         9Jv2XI1OSNMj3woFYvObVwPgrxuXnTxGjFio1gZ8WBubbZwlPk/ygMWtDI95Xjws4tPK
         TL+Brp8bgHqiVB8JmZfmlG5BEujn7RsmVCNaSHVwc2OUk4toYUyEvfDmR4N0pkS8Ea4U
         rc7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742565539; x=1743170339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bHKxmG8ByngkXQTkMpyDFQIrJdv7U/tLvQeFlUSDHEw=;
        b=cWdbsWXKMFZZ6VZEGlVN2onPEWD8S4PlfDrVy32lBbq8LplHYTMIEKgoG51QWCxqeL
         orl7OM+UA+NgjrCe2AksEhAr2kTlpmAPmoTayLDuGXoi4fNPhKvGXrdoWdPUZututwNH
         fgRvbxZWzuD2Y4A0qhiurg1abwKQuVEMenl/MAT6onT9vjXfNjjg3SiBg8jvit7SrXHk
         yImAhtdOh7xNDJpiMOGb6v/osQMQ7U9YQPQJeZ4wUU5pdr1hbkIoQpFsSQAy1uGkTTsO
         m/bHMAgX6gq6UdQncLbQCQpzscsC3m6pClFMpCcQDq66z9I8oslBp+Ek8U5o4tZBR7YH
         OPtw==
X-Forwarded-Encrypted: i=1; AJvYcCWXFvnmY16QHr6DDopD9U+5Y4Hh+ubecvF877DN+HCUw+9VKLj0L38KkG/1uWcvYOn+a3qJZP3P3Luw@lists.infradead.org, AJvYcCXOVHmSW2Isr1bb2MR8fmylB6cgiM8DWjx5tUKACZfaf7aE0e8rAum2r9XLW1zlkl758pG3u6pMXeY49BLJBTMn@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6KHbKb6Vvp5lFIoZ3AlaUbmmeOFTsyGHvECPpnXHZyrDlxADE
	uEveHZ2osemU/DAqJRVDesR5+MJ4MymVHHWcFLT16u9ID0qUJ/pI
X-Gm-Gg: ASbGncvSKiWPsI9+8nlEHqRaGm+PRr+r+TlgLOaxbUwzdehFdraCWvUPz+Z0NSGDJ4o
	yq+PeetBx8He0+4iSFWKsTk5kUL/iCwv2za3QW9BE3wVu60w2CTsZG+QWsL+7aOBOnHFlIoYanA
	eA3NGkFFVQndnKT8kXj2ni7+DyI2Xuc++0Ws2KYkDEeky2GmM0s5ndUPPGX7m3oq62jREbT9i27
	yMuGeGVOTuwZjrcYljiUNBj7THcTX5h+plSGvzK8C8hhhodCDvDUoWbsHX1MnIV6zMYeJwwZ+ZK
	iihz/67ZF/qMc79JP5K+tq97FyahwETM+EGIwtvcYHP+UJbhcPnTmF0jSEPK2Vn003Ry30V+Kmh
	wa8p47P8EwT2zd8yAlO6b
X-Google-Smtp-Source: AGHT+IE4BN38JBiKx76BxP/6BUTVPP+3ckbM6pNBbK+SmHspfVRVwIu2YBrzhMH7wBCy1RoE1+z6EQ==
X-Received: by 2002:a05:6000:1445:b0:390:e655:f998 with SMTP id ffacd0b85a97d-3997f909fa6mr2839938f8f.26.1742565539267;
        Fri, 21 Mar 2025 06:58:59 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e6651sm2437162f8f.75.2025.03.21.06.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 06:58:58 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3 01/10] dt-bindings: phy: add exynos2200 eusb2 phy support
Date: Fri, 21 Mar 2025 15:58:45 +0200
Message-ID: <20250321135854.1431375-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321135854.1431375-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250321135854.1431375-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_065901_254454_C46F29B7 
X-CRM114-Status: UNSURE (   8.66  )
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

As Samsung has been using the same Synopsys eUSB2 IP in Exynos2200,
albeit with a different register layout, rename qcom,snps-eusb2-phy
to snps,eusb2-phy and drop mentions of it being only for Qualcomm SoCs
in the binding description. Document the exynos2200 eUSB2 compatible.
Unlike the currently documented Qualcomm SoCs, it doesn't provide
reset lines for reset control and uses more clocks.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 ...nps-eusb2-phy.yaml => snps,eusb2-phy.yaml} | 62 ++++++++++++++++---
 1 file changed, 54 insertions(+), 8 deletions(-)
 rename Documentation/devicetree/bindings/phy/{qcom,snps-eusb2-phy.yaml => snps,eusb2-phy.yaml} (59%)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/snps,eusb2-phy.yaml
similarity index 59%
rename from Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
rename to Documentation/devicetree/bindings/phy/snps,eusb2-phy.yaml
index 142b3c883..87f2c6756 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/snps,eusb2-phy.yaml
@@ -1,16 +1,16 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/phy/qcom,snps-eusb2-phy.yaml#
+$id: http://devicetree.org/schemas/phy/snps,eusb2-phy.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm SNPS eUSB2 phy controller
+title: SNPS eUSB2 phy controller
 
 maintainers:
   - Abel Vesa <abel.vesa@linaro.org>
 
 description:
-  eUSB2 controller supports LS/FS/HS usb connectivity on Qualcomm chipsets.
+  eUSB2 controller supports LS/FS/HS usb connectivity.
 
 properties:
   compatible:
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
@@ -62,7 +63,52 @@ required:
   - clock-names
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
 
 additionalProperties: false
 
-- 
2.43.0


