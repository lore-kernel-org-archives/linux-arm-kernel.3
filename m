Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B03C36016
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 15:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QbMd9XdkWBLdkj8rOcFnOleEDKh/N4y+bdq1J1Qswv0=; b=rmIcsdb7X+dYYHI1h8B87Et78p
	lHppIa2nQ+l0rSnsEJVBQCVxUbbUSS5Et9ZxHa4WH6G8XuJiG24GIEGvGWQFiU5OKPbKp2IFDpvjV
	1Xixzc3ZIWbRM8bwrMm+jPMB/Ncu6fcBrN2IHZH9WEsTeUWo3UEWU7h9AQZ5dvW4pbo7roykf/nRM
	LXTiJ75kwpSiV0C97dIYCDrBs3VLS/OezFZHeZIES8TJZa6MMIEvPZJ3v1ZW4YSs7xvZqVQaz3+B6
	kMCFv+IIXkSB+Bl9EyUD7q4bMyiSSfa9E+jswt/UKzRIGCS7JoQBmFsqKqCUciXGvirNELjbSBTTc
	RZj+Th/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyC2H-0000000DpA0-3ABx;
	Fri, 28 Mar 2025 15:54:21 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyBQa-0000000Djjd-0FLp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 15:15:26 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ac29af3382dso361636166b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 08:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743174922; x=1743779722; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QbMd9XdkWBLdkj8rOcFnOleEDKh/N4y+bdq1J1Qswv0=;
        b=mGeDilX8Z/YHpkp7HmMYGoW5pamWTh2WIRYTHtxwol8KXNPtj+3ZIeqJBam9Cn4RTg
         nJIH4TlaEevJ+r6KwXPDblb7XTPtqmfV2edDpYJrLKgLPmzCrHA95wwXL3c7B+vkc10b
         xHmohwzUx4ClvbnkBYnrM7ZuJfFrXE0f7TiHdcMMQMD0k3xSgqpMSqfJbi+DQ4+DPD2M
         KPFp1cFz1u/M/PvOy2EZ9PZLk6NdIdLkTX0iPIYPaMFGkcj0npZT1MvMlXcYx7S1Sbm5
         xG02oTFuzIc0wnch1ZsCzVhYi2ZhNNW8WOu93CXLImQUU3FRmQPgUogqZpUJq3bc3knE
         OCGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743174922; x=1743779722;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QbMd9XdkWBLdkj8rOcFnOleEDKh/N4y+bdq1J1Qswv0=;
        b=wB2fBQi2h2GBpWh3Rz/uqlO3k2dcThQtslxYGSamq79FdUxzYPp0hTgBzSvmqp5sQo
         RVF1ItgdmW2gp9Viy3F9lh/fXUrCic9ZTHl670n7J710jThiZKtUiNzCKeiDaMIKYK2g
         M52DDibphi6fWAGN98Qwl/vaJCFXN68zDYycij2nqXt3lRsjBQoVBgchTw49VD1/t/Fa
         5AC2cvaF2l4q0EgbElx9HXY/wj2WXe5r3IhEgA87QAYIE/2tCXIyhnQVI7n3trOE4WFb
         r4c2M6T5b6WU6FOl4dLAz8/fZC/hSLecwHOVRUA3yD7f8/evesfh2X7Mwo19HTTqk9Yh
         ydaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKST7/aGnW9foqgzhhE9lkRdhLjre48TErkgOQKT6Whee3cimckJSIDPTHgwEmgSa3zysT+Z0neUdUHvNuhR+O@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0tjuLHCVlkLRBCPe5trkcox3/vT9UdaeHoUEyWqR/8uQlo2Wi
	Jd4BskJxpHCjLC3bZ3aQ3djqy2guYWg7XOvRrK3rIPS+PNpdG3Nh71haBSkiyeo=
X-Gm-Gg: ASbGncty7/9SK9JHQ3/2KO3puZI9skTE2EyV7hHT8OINRcqkp1ZMEvilK9lq3U4EqU3
	e6bmZq30hlI1yN465bQrpaUEYdcOwX0IXoYp6sMo2AubxhruvaeDHk4LHvSPFALIO+cTZZ0p+U/
	KkIlXVR2C68epjdlN8+zfuhXGLSVMCnRoa9aro0FjnSJeWaOiHxhBY9di6SB78vS6mEvhLYbGfC
	lTUpXnT+dDWPXTeELC1CM5d+M2yKZf68oVOIkqmd7RvSK8y60p73dQzSw9g8UgDW9cW2Owj4Nfb
	05AzFqkMQjDt1q5hc3zKVbLzeg62uDuMp/LRDbHCPwcGYNg8XzlNgZgcRbitCZeG7XgXLD7eLFV
	qDBz10PuM7427mQfvznwKDmxcJp7M
X-Google-Smtp-Source: AGHT+IHlWUcyOlOhaiUcfzknimHxQgiCSYmuaKhmBSK+QhakuXA6Sp7y7IZq0RbnF2cO1nyQaKeRzw==
X-Received: by 2002:a17:907:971d:b0:ac4:3e0:7ca3 with SMTP id a640c23a62f3a-ac6fae9bf5bmr718303266b.18.1743174922099;
        Fri, 28 Mar 2025 08:15:22 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71927b742sm178789266b.65.2025.03.28.08.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 08:15:21 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 15:15:20 +0000
Subject: [PATCH v4 2/3] dt-bindings: soc: samsung: exynos-pmu: update reset
 for gs101
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-syscon-reboot-reset-mode-v4-2-77ba57703ace@linaro.org>
References: <20250328-syscon-reboot-reset-mode-v4-0-77ba57703ace@linaro.org>
In-Reply-To: <20250328-syscon-reboot-reset-mode-v4-0-77ba57703ace@linaro.org>
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
X-CRM114-CacheID: sfid-20250328_081524_111994_D6A5E2A4 
X-CRM114-Status: UNSURE (   8.32  )
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

Add the gs101-specific reset node, allow it on gs101, and disallow it
on !gs101. Similarly, disallow the generic 'syscon-reboot' on gs101, as
we want the specific one in that case.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 .../devicetree/bindings/soc/samsung/exynos-pmu.yaml | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 204da6fe458d2d4bfeee1471ebc5c38247477ae2..8c7362cf3eeab11f6bb13a27eb295d5ee6721b71 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -97,6 +97,12 @@ properties:
     $ref: /schemas/phy/samsung,dp-video-phy.yaml
     unevaluatedProperties: false
 
+  gs101-reboot:
+    $ref: /schemas/power/reset/google,gs101-reboot.yaml#
+    type: object
+    description:
+      Node for gs101-specific reboot method
+
   interrupt-controller:
     description:
       Some PMUs are capable of behaving as an interrupt controller (mostly
@@ -136,6 +142,21 @@ required:
 additionalProperties: false
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: google,gs101-pmu
+    then:
+      properties:
+        gs101-reboot: true
+        syscon-reboot: false
+
+    else:
+      properties:
+        gs101-reboot: false
+        syscon-reboot: true
+
   - if:
       properties:
         compatible:

-- 
2.49.0.472.ge94155a9ec-goog


