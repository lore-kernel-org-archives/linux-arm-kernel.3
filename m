Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D12AEC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 16:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G+Z5tO3GODKfqrnPsiikglYSIdtJzrzy+9eK4sw+PJo=; b=2WgLfXWnCEXDZwvmwnlcZ07Tbs
	+F86NrVi/qhk6aATyvMV9U2rpPajaVqNUP5CrXYL/WiAO48JhjYIGYfJ7Wl4GuAcMOu5oE7g9fMQT
	lP/Z4VO1SABKv2XozSENL4GXIAZMcIhR0VDRbHdueBDTlDGJs4bUU+3sUmFVqN0aAbKCocd+BdiX4
	H3KHIBbfQcgv1/VaMCQ7oAj/JXOr6pOP38/B0RRkMdjc508XSFODeXFbGOZu5RVMBjk6YtMU1eZ7P
	KOCu733CMMhLrB+D0Rrj/S7sczRvRYiePXwjNWs06dCzmOjsbnWOTJalJQIdjhwuh4cdr3nui0oa3
	sNqHp/Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5RyD-0000000DeFL-0ve5;
	Thu, 17 Apr 2025 16:20:09 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5RMv-0000000DYGU-2DIf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 15:41:38 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-54b10594812so1011647e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 08:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744904495; x=1745509295; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G+Z5tO3GODKfqrnPsiikglYSIdtJzrzy+9eK4sw+PJo=;
        b=qmRntqcFpGk0yOceVjGsmk7jUXIROyqUNp68pqbNdNJHET9cJ0GjSUpqkAk/uTFKCg
         3IcEjltJWOydTKNMezPQ6f2g9OFtzFzf1cXngxBgrarNcFpdF4GvpYSD+F1uuA3KYPxq
         n/Fh6EADBC6zwgHQS4FqG5Xo86a5HF/VnqHoAGhLHh482mD1BOwG83IeL011vriqwXJz
         KJtraSPQvmHyIrpSKq20BxWCopw6lCSahFY5fKIyTvyaOa5s8FD3iFyF2glZERwR2YpZ
         Zk6PVeFtj/fgdJ1lFcO7qS0BA8jKFr+8XTWHIroKKXUV94PgbomsLCt0gCx8aTeeIIiF
         yWtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744904495; x=1745509295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G+Z5tO3GODKfqrnPsiikglYSIdtJzrzy+9eK4sw+PJo=;
        b=jnvUz65p8Vvna3EGDPEqHtVkjS3mstf5YqRA2VVo3vwPSXTzd3VPWrYWEqow/RohUE
         BWhbLJolrRp2rChFrqe4waiTIRxUCQmMWn/SbvK1AnNVZEiL/UV4abfqiNNAzMXHj7tB
         jRzAa0KJ2dVvhFVOlDN4x3Ct8MiWz/LqmsdApeIk9nrvINi+6xtn6UM4+JonYh3gKsdD
         Xgm36cprCW6JwtawYQWAHKiCggpyCWvRI6v5MZjAyeTDhb7v/g7/quZHZYDkOUSULE4h
         zm207ZZ3nQiTAgZ78aTevkVuJsulrBZG6McB30IoHKRZ+G9/n79EAijHNVfIyAKSDWgr
         LPnA==
X-Forwarded-Encrypted: i=1; AJvYcCXdB7rv9ImqTtJO/r0an92vIAxtd3lK7APpTma3a/4USRBb7J4KSLZ7spR2iSpvNFWBPtQxNZdVu1Q6es+/63+C@lists.infradead.org
X-Gm-Message-State: AOJu0YztnhSbUTgm1kXLcpoEmXTUNZwgPNVzZyRVAug1cxN0T0eHHJMN
	YwyNMVIsx5HuWH6AIuM2jF+dyvb3U2xjZD828L2nhVsD97eqRUBlKflVP6YJbpZGM0Ah/ujrIyb
	3
X-Gm-Gg: ASbGncv/744+wgZwfZwofgF+HvALVssfXEKM+sSmvNHXORpUunXemHVxUxf8USMlRtW
	argGFiaw+m9/6AQMclBoR2U3AJF/3k0mBQFFWBNqJLUVOeHDEVSes2KVIuTenWi66eGQ+BkMYc0
	c9T82ZpScyil922nM/VJ7Dpq3Sx3DzK3Fu8KYYcseZrYQVomKc1/PWW4PgDeWdHFeCR7yJX/T+/
	GwylFdrnyaUAYOfjZI0iQokpfDhCYnX/D8cgox9jimB/LD1RNz9xAuvKmkVDdumzV++e33aVPCH
	dm4K3i5+ijFSXeGPN/4Ai3kBV8kAuWdorF/dZ0l3CN1tT32h1SEiI0JBCQ8wz68pXSw=
X-Google-Smtp-Source: AGHT+IFZYzUX82Ksuo0S1uAg+PqHG6T59fFdOzMPnqwGCV02MTZaP2xSEO83gicXA+9vGukmp3V9xw==
X-Received: by 2002:a05:6000:4014:b0:391:3aab:a7d0 with SMTP id ffacd0b85a97d-39ee5b19f5cmr4872897f8f.19.1744903009074;
        Thu, 17 Apr 2025 08:16:49 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf445315sm20528346f8f.82.2025.04.17.08.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 08:16:48 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org,
	thomas.fossati@linaro.org,
	Larisa.Grigore@nxp.com,
	ghennadi.procopciuc@nxp.com,
	krzysztof.kozlowski@linaro.org,
	S32@nxp.com,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE)
Subject: [PATCH v5 1/2] dt-bindings: timer: Add NXP System Timer Module
Date: Thu, 17 Apr 2025 17:16:18 +0200
Message-ID: <20250417151623.121109-2-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417151623.121109-1-daniel.lezcano@linaro.org>
References: <20250417151623.121109-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_084137_562790_C4B64759 
X-CRM114-Status: GOOD (  12.10  )
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

Add the System Timer Module description found on the NXP s32 platform
and the compatible for the s32g2 variant.

Cc: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
Cc: Thomas Fossati <thomas.fossati@linaro.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 .../bindings/timer/nxp,s32g2-stm.yaml         | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/nxp,s32g2-stm.yaml

diff --git a/Documentation/devicetree/bindings/timer/nxp,s32g2-stm.yaml b/Documentation/devicetree/bindings/timer/nxp,s32g2-stm.yaml
new file mode 100644
index 000000000000..b44b9794bb85
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/nxp,s32g2-stm.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/nxp,s32g2-stm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP System Timer Module (STM)
+
+maintainers:
+  - Daniel Lezcano <daniel.lezcano@kernel.org>
+
+description:
+  The System Timer Module supports commonly required system and application
+  software timing functions. STM includes a 32-bit count-up timer and four
+  32-bit compare channels with a separate interrupt source for each channel.
+  The timer is driven by the STM module clock divided by an 8-bit prescale
+  value.
+
+properties:
+  compatible:
+    oneOf:
+      - const: nxp,s32g2-stm
+      - items:
+          - const: nxp,s32g3-stm
+          - const: nxp,s32g2-stm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Counter clock
+      - description: Module clock
+      - description: Register clock
+
+  clock-names:
+    items:
+      - const: counter
+      - const: module
+      - const: register
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    timer@4011c000 {
+        compatible = "nxp,s32g2-stm";
+        reg = <0x4011c000 0x3000>;
+        interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+        clock-names = "counter", "module", "register";
+    };
-- 
2.43.0


