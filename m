Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F1B9CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 11:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WA6ihoM1lqsXloyq8orrS5aE2lQH5FPEqZNihMpid8o=; b=bPOb0kBhRGrIYmg2/Lsm84bpH0
	9MX9zOCYvbRcERIdPClMKT+YVRaWP12ltW/twgFO9Lk30POsOfh5/+/d2/JJEB/21hQ/Vb93Wbi30
	5XmCgAxshZpvp5qhBWUKSGvwl7HpoFJ/EP//z4cZEHX6AzNRZYkcnywTAC4voaucSEIl/LRPeCGgB
	PAl174m7t/zNnA3hLy/SM+XY6BZwee86jK6zcTxDsfyGU2CeDoTOHTdZ0EBMa0qcOu+iVXiIi8p0J
	1ps3k+e1SRfti5vrSrCgv2UHbtb++MjT0yR0wobKbEcmDq7b7K/DVHF82ArKJ1GsmL9YQoZjla+ar
	6zHT4JIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXH7L-00000007XHn-3sUb;
	Wed, 10 Jun 2026 11:29:07 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXH7J-00000007XG7-0oZ8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 11:29:06 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-36d8b644473so6261582a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 04:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781090944; x=1781695744; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WA6ihoM1lqsXloyq8orrS5aE2lQH5FPEqZNihMpid8o=;
        b=R310wIvr2nIQWnkWtAldYGuxULLFp4mpUIhHGf0217NCHkHGWeAyCGDw12jzvQCQGL
         GW665uqLBQwHrw/9XpMTTq3vjFDIdh0ehMHCjtOpG078chuot++isbuoKnaFFpLIm3oX
         hExwVzNj/98VSBEGkifhto8pabHny5N6WADDWgsXK8Fd8Cugyurlanuo2GogzM2/eVhk
         tHLqqN4fnhrvId14HJ8SDXfxtFC1b0egXne7cnQzkbl5ikQ36I9f81+FLDTt0Au6HJfB
         VwiA+wh21fx05j2gnFRCxrMfpTLNaFVyOYVpVOcdof19bIkMN04z6JTMlHSbpw9GFh96
         m9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781090944; x=1781695744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WA6ihoM1lqsXloyq8orrS5aE2lQH5FPEqZNihMpid8o=;
        b=qwBun3fw6FubJsEHg7/xRvYPFGl1umRVNGNunMyPcSIpKm0TljntMEoT+sPhqHfHfM
         462LliwGjMZBbFmiE+eBxfIjB64g1CnPTsR7oQo9EOtHNw0upUDeDBYT8xcowXVgl0MI
         YDGL78cKr93dbEPXz9N92HC6Kp7EC0DoLejYyn1ppiF4wONqBNMyDr5hOEq6hnbtzUl1
         U/JTmsfXXbkuRhHonMPhHGzOa0E0GWL4NPhBfCxvaDmVDDVPHBP0Y5tr+Gl17/nqvA+K
         YqEtCCluAxL/ib6fMKgTpMutc4h7Qan4iiVhVVA6UJpAnRzE98VwWH5lsvXXcyox5kzR
         E5/g==
X-Forwarded-Encrypted: i=1; AFNElJ/yZbnJ3X0nO/KeT5OmS16BZRj7xNoSVRHevbW/R/R3+bpGUkodbYKuoL65ActOF4phMon2vRHVGkNCuGbob5LR@lists.infradead.org
X-Gm-Message-State: AOJu0Yzl2NPt2ttNyxJI2iJQn6JOcUyEmA/Jj0DE85rp0e0TAWn+3psh
	TfpaqncFyilMz4CQMS/9g+QGb7JYGklEqerToROCMviL4WTOMd/AQTbu
X-Gm-Gg: Acq92OEPp7/PMzdpfwbgr5ohehY1votX/DaEv6bBN7ZPk5C9ZgW/LczxpxnOh1ztMuX
	/svIu3Ynj+o1rHkCpNfr02aFLK6h+rBvvLcZzaRoMqyRhVFruzGGIcBY6y+E0RpZtEeINGV7KUn
	0YtEmgY9NmDcSoeRiBi8NChN+kNqKOWY5VWot4z+Mp/f/yJ3txQcxJM/NajyJVDK+PVWeiOywg+
	3I+W6X4q7PrnlzVxaSf/rK4fuhw+YPUxMWoPxGXb//2r23EER1SSd7J3+TohfXPI8360xYCDiSY
	lV/ObuDN6888PHlqY2FRY9wTFWBHnF0P2S/lw4ejJwBeyHp+5vuPKU6vI4EuqXAoqU+YKbKBd63
	2pxE7JbSFYpfR5rmk9TWfqmWBgtJm6pJGM3DL+lD5Wnjq6d/MzLn8L35G7Vnvj2aI4PEaQpOtpv
	I0czTG+ne4oNoCautJLDZt9yFfEu/v1UxoaXTZwaRpN+RdiGepgifluA==
X-Received: by 2002:a17:90b:5783:b0:36d:ae6a:22ed with SMTP id 98e67ed59e1d1-370f0f43e72mr27042985a91.22.1781090944288;
        Wed, 10 Jun 2026 04:29:04 -0700 (PDT)
Received: from hc-pb-01.realtek.com ([123.51.179.67])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-376460ee14fsm2027651a91.1.2026.06.10.04.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:29:03 -0700 (PDT)
From: Jason Li <jason.lee651024@gmail.com>
X-Google-Original-From: Jason Li <jason.li@cortina-access.com>
To: jason.li@cortina-access.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: serial: Add binding for Cortina-Access UART
Date: Wed, 10 Jun 2026 19:28:19 +0800
Message-Id: <20260610112821.3030099-3-jason.li@cortina-access.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260610112821.3030099-1-jason.li@cortina-access.com>
References: <20260610112821.3030099-1-jason.li@cortina-access.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_042905_240461_45F481B8 
X-CRM114-Status: GOOD (  16.25  )
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

Add DT binding schema for the Cortina-Access UART controller.
This IP is integrated into most CAXXXX SoC family members.

Also add the vendor prefix for Cortina Access, Inc. and the
top-level ARM board binding document for the CA8289 (Venus) SoC.

Signed-off-by: Jason Li <jason.li@cortina-access.com>
Assisted-by: Claude:claude-opus-4-8
---
 .../bindings/arm/cortina-access.yaml          | 29 ++++++++++++
 .../serial/cortina-access,serial.yaml         | 46 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 MAINTAINERS                                   |  7 +++
 4 files changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/cortina-access.yaml
 create mode 100644 Documentation/devicetree/bindings/serial/cortina-access,serial.yaml

diff --git a/Documentation/devicetree/bindings/arm/cortina-access.yaml b/Documentation/devicetree/bindings/arm/cortina-access.yaml
new file mode 100644
index 000000000000..ec0320ed0c0b
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/cortina-access.yaml
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/cortina-access.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cortina-Access SoC boards
+
+maintainers:
+  - Jason Li <jason.li@cortina-access.com>
+
+description:
+  Boards based on Cortina-Access ARMv8 SoCs targeting networking and
+  access applications.
+
+properties:
+  $nodename:
+    const: /
+  compatible:
+    oneOf:
+      - description: Cortina-Access CA8289 (Venus) engineering board
+        const: cortina-access,ca8289-engboard
+
+      - description: Cortina-Access CA8289 (Venus) reference board
+        const: cortina-access,ca8289-refboard
+
+additionalProperties: true
+
+...
diff --git a/Documentation/devicetree/bindings/serial/cortina-access,serial.yaml b/Documentation/devicetree/bindings/serial/cortina-access,serial.yaml
new file mode 100644
index 000000000000..5d7fdd954491
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/cortina-access,serial.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/serial/cortina-access,serial.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cortina-Access UART controller
+
+maintainers:
+  - Jason Li <jason.li@cortina-access.com>
+
+allOf:
+  - $ref: serial.yaml#
+
+properties:
+  compatible:
+    const: cortina-access,serial
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    serial@f4329188 {
+        compatible = "cortina-access,serial";
+        reg = <0 0xf4329188 0 0x30>;
+        interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&apb_pclk>;
+    };
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index dd94c50e97f9..837e2a92e7e8 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -367,6 +367,8 @@ patternProperties:
     description: Chengdu Corpro Technology Co., Ltd.
   "^corechips,.*":
     description: Shenzhen Corechips Microelectronics Co., Ltd.
+  "^cortina-access,.*":
+    description: Cortina Access, Inc.
   "^cortina,.*":
     description: Cortina Systems, Inc.
   "^cosmic,.*":
diff --git a/MAINTAINERS b/MAINTAINERS
index 20bd55913b2d..cc261888fae0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2820,6 +2820,13 @@ F:	tools/perf/tests/shell/lib/*coresight*
 F:	tools/perf/util/cs-etm-decoder/*
 F:	tools/perf/util/cs-etm.*
 
+ARM/CORTINA-ACCESS VENUS ARM ARCHITECTURE
+M:	Jason Li <jason.li@cortina-access.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/arm/cortina-access.yaml
+F:	Documentation/devicetree/bindings/serial/cortina-access,serial.yaml
+
 ARM/CORTINA SYSTEMS GEMINI ARM ARCHITECTURE
 M:	Hans Ulli Kroll <ulli.kroll@googlemail.com>
 M:	Linus Walleij <linusw@kernel.org>
-- 
2.39.5


