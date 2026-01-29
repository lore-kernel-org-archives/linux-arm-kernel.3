Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05656D3569F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 04:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E68djXKo/Qb6+8kiZNd4FljhUOa17e5P51Qp4W2uY20=; b=ELRbOu9Q3sJu4LDLxeRHPdcIqh
	ZuQqZ9Ay1zZGYjh16CQRpadJac1FJ53zNpQfSI5HCDEoULbG289p7PMAhTOYVk7ugYfjSKzwrvg9/
	ABPwIqkn8W6GqtH9jt4oDY17Xy5t94nd94nCifY/PfNQYCor6TETs6qSlKtGX7Qozbz4V7gnq5xpb
	be55muKVzXP7W+khLHjj5zpd5i08//hbvPS+MZYifOYk61dYf/CTF7tkb7JYj68DIQqQe19NLCt23
	Jgh9gUFI0hUaVhNmvUJ6YhDqCdAcbcBbytme3OvUrWfqr6Y8Z2IF3YMS+FsXr3BaLICxZ64sTVfrH
	7i7vwDHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlJHv-0000000HDVy-11sn;
	Thu, 29 Jan 2026 04:05:47 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlJHq-0000000HDUF-1ANa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 04:05:43 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-81ecbdfdcebso257226b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 20:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769659541; x=1770264341; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E68djXKo/Qb6+8kiZNd4FljhUOa17e5P51Qp4W2uY20=;
        b=TQD70iyoQq0UbWQn1mD0a5DXA+xbRMcZTql572BhCMUATNAYhkOGTRlUxHm/adnsL2
         OzK0okeUTZw4EqHR+KZWFtNNL0dXcJJ6n9WI3xByrbIwlw9LLw+Hn5bdb4grwUCsFimq
         TZ75YtjyDEun7NsOYt12r5YwLlvI8S+L/+DZOxEDZfRHf1BTmuVNQXb0NOE9E8HTnH5p
         fwY7AW7svktRu4xpxd8nvkcc8gXByeAnrB5Jt9hLBC1uEZO1414lmzT/Z1ewMsUEwzOd
         zurTciCt8w/eMMK0+OPcxJwYb/U7YThAHQsgzrvOxEe5c6SCZtPtdwtkm2jURUN6QI/K
         bi3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769659541; x=1770264341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E68djXKo/Qb6+8kiZNd4FljhUOa17e5P51Qp4W2uY20=;
        b=e2kE7aJd6pmeyIqVNTeEXc+3NRxKxIe79MmWlTDHktZWMpsDREz+t1a8yoRqVCP7gQ
         /xuEBSQ/+mlgi1exeQIJdT17LmnYPDP0LrxTega31QjRRDANZYD/h0M+uDfQ7mltPyTz
         mX7P2K8JSYHjF/eJEQSSMEqEpHoQ01yK5gP/rhsqY9yueEwK9Pl4rcL6AxXFhiOi+eBL
         23Jzd6xf1Nyt9IbvLn4+eLJGNh5lHiMn91nSIgMs++dpiR03DOfZ0UtIMuDmSeerVL24
         Qc5CNUmfVA1eF9b/lN+gKA961M8lRw5QnK5vDcNoGar3P0WQ6NsAATyjeyueUBvvSBo1
         a7hA==
X-Forwarded-Encrypted: i=1; AJvYcCUsw/g/ZnpsBVpZPb9wgLsJ78Y+OMEcvqQbMzVCOlF8BEeOFH3Giogi8NiyHsryCiNYGmKNf46fi4uWkADaCvgY@lists.infradead.org
X-Gm-Message-State: AOJu0YxOvHuwqXMnnQUjkFGeTuARkMnq4ZmEavjvFt0/QaXoKRaaKRhJ
	qw3MSWDickEIXc9g24UseL1Ug4EbCBqrX3Pc6UhsxM4M9F3nOa05TIVx
X-Gm-Gg: AZuq6aLBzN7SwWnIB46QecSUDUnFOmjZK+6FlYjJvzzt9MKDBnmU56nf+1HA8ZHyNSm
	47vwgPgRov81zQkDfBQtV5TFmOsyGMV3S32sdP+pgkfCLjM6d4oZhG6t6xRI6cBLJZbEophwEoK
	0egc+EKleT1q5/IDb+v5Rp/8MANImG2aX8bQGwKTz7XZChtsI1SDdtCdl0JjCI5eE1KiW1XqJke
	zCeNxCnZP0Xdym3QEfx9oaGEDBVbBqTSE0W9xoj30WKh010txIXcTuiP+xlRZhdTJsDlwLwBAtP
	cFW0+ZlaePCJHWnBNcue7hiJdUgTV8liW8fRKT1f5h/9JLXqzEDuzCFg0lxzThXYlhHSDnWVFS+
	B2CgxdaT7OG9Jvr6GzcV/ua0dk7/P07DuoDEPwMQHTigXUPRT0wYJFJg/OhoTxs0C2dlMYEXzEN
	z38fEkJ2MmE7BkMcHMBVBBIjf4O/QVELNpfPcRtQxd4SUtuw/yShwD2cVVHr8KVQugAgdwyAzE
X-Received: by 2002:a05:6a00:94f5:b0:81f:3bcb:af2a with SMTP id d2e1a72fcca58-8236917be3fmr6772085b3a.26.1769659541008;
        Wed, 28 Jan 2026 20:05:41 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379c22672sm3857721b3a.51.2026.01.28.20.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 20:05:40 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	a0987203069@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: display: nuvoton: add MA35D1 DCU binding
Date: Thu, 29 Jan 2026 12:05:30 +0800
Message-ID: <20260129040532.382693-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129040532.382693-1-a0987203069@gmail.com>
References: <20260129040532.382693-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_200542_321130_50642423 
X-CRM114-Status: GOOD (  12.45  )
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

Add Device Tree binding documentation for the Display Control
Unit (DCU) found in Nuvoton MA35D1 SoCs.

The DCU is a DPI-based display controller supporting RGB output
with optional external bridges or panels.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../bindings/display/nuvoton,ma35d1-dcu.yaml  | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/nuvoton,ma35d1-dcu.yaml

diff --git a/Documentation/devicetree/bindings/display/nuvoton,ma35d1-dcu.yaml b/Documentation/devicetree/bindings/display/nuvoton,ma35d1-dcu.yaml
new file mode 100644
index 000000000000..adfc20117eb7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/nuvoton,ma35d1-dcu.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/nuvoton,ma35d1-dcu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 Display Controller Unit (DCU)
+
+maintainers:
+  - Joey Lu <a0987203069@gmail.com>
+
+description:
+  The Nuvoton MA35D1 Display Controller Unit (DCU) supports multiple
+  layers of composition, blending, and output to parallel RGB (DPI)
+  interfaces.
+
+properties:
+  compatible:
+    const: nuvoton,ma35d1-dcu
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: DCU Gate clock for register access
+      - description: DCU Pixel clock for display timing
+
+  clock-names:
+    items:
+      - const: dcu_gate
+      - const: dcup_div
+
+  resets:
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: Video output port
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
+
+    display@40260000 {
+        compatible = "nuvoton,ma35d1-dcu";
+        reg = <0x40260000 0x2000>;
+        interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clk DCU_GATE>, <&clk DCUP_DIV>;
+        clock-names = "dcu_gate", "dcup_div";
+        resets = <&sys MA35D1_RESET_DISP>;
+
+        port {
+            dpi_out: endpoint {
+                remote-endpoint = <&panel_in>;
+            };
+        };
+    };
-- 
2.43.0


