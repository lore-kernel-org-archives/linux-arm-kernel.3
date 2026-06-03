Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C2DCD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 04:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1WhyjqFeKhuYhkhKO1bR1hDfl8+mFdDMpPiPRXHEMcE=; b=ks5n36wBRN6HwKq31wR6ftxr05
	CePmSedghOBFxchhZJO9R8sJj1UB1gdBNcdBBU1xskVcdTBkXSCeIELhbTXJzHbVPpoAiyRQopHNi
	XQZbYao9uEsp+ehvEKgTDqEOyEP+1ZWlgImW5pCbtzBeFOxxej+viL944vSmEGpne59+nV6LeJrwf
	oHoOblwVujlYc9xuCFiVjiCBySBc/ZmMdW9J0p0GT2pm3JpV5srcLNoB2hd3LigLWuYZAq+7UGtl6
	c2JsHWnfGAIl4f7MIq7vg2uvOoB5sH+GLY+q308nJvpVBVhDwpoaICdulOuKDvZ+Mj44PNaWF1lQd
	AIqk0sEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUdKr-0000000EFJe-2YNj;
	Wed, 03 Jun 2026 04:36:09 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUdKp-0000000EFIt-1hTF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 04:36:08 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-8423f420455so1413230b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 21:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780461366; x=1781066166; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1WhyjqFeKhuYhkhKO1bR1hDfl8+mFdDMpPiPRXHEMcE=;
        b=HYrKK0fNDi8db2fGTlE4Uvk/LCUSjkV5tsowHZdsKcdZKPQnzkTiL1llIDmeBICZNt
         rya2442+/lc54vB8SMjXQuaEGtkuUU4cRu4Q28wwF4gwDe9HgFaeSD/zeoliBy5V7e2l
         P62aOLYKfhUxld8vC/1DhLrJatJHnDw7/pq3qa9prL8uxYKqcZgG7a+kVSOhWyEJWgS+
         8YtogEiFKawOcCMiQeF28YAUuNBZ/FfPB3vwZh5D9kRrw/fqypdS5u+HmcatumgynvR+
         L6wPmLBAuqgyL31ne7dGVjj2yTy2EDyCm3zlAJw0gFxmGM4cNsKNoj5c4c1VJSgNbs27
         ruwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780461366; x=1781066166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1WhyjqFeKhuYhkhKO1bR1hDfl8+mFdDMpPiPRXHEMcE=;
        b=XXnX6izduE89iSMuDpoKaTQri2hq0lHJbN/1+umtXLuXy59Cz5XAqP6HNhyfA6gftY
         O5GmyEGrEEyTFDr07q5Lb31Yz3IFH8gKvAPCxWIr36VwdF7yN8u5xBi5ihfuNr/5o351
         3Xs8XOPAhOLLaYg33emmSkuUNSolYD515sNgOujeVwkpROkqFHJDjlgBFnXoECnzS7UO
         3VmGw4W9xl9zInFEEGwafbZBoNKerG1qilFudCIYWyq9A8WFSIXGFI7Lbp702g57wWG2
         E05+E0O7dWjlM/hMeRaElhF912zvyy7FFKDMosDoNlalrjtlCzM5ujhRzB4z49ZY5J+v
         WTEA==
X-Gm-Message-State: AOJu0YzFsB5mwfbxvW4NrrNV+sfIk+Yb2uHKZzzGy56ceP1h51WyeC7L
	5u0011IwXwQME+6eGfyv9haNnnD0565GTiUZpVmyj3FyrSUqaE6mzmfS
X-Gm-Gg: Acq92OE48cZ1KFboR5gowvOhWT9/L/JtURZv/hNQATL3GU7ETM/aszmFk/YbK0lhKHg
	ozT+gq4lcUG06VbnpSC+vNhJjHX8kpViUFURui7NwBhZOkILMix11XRSqeJ8N1LpqMAGJHbyEkM
	PbSNrhZzMu2lIwd7vF2lOIVI+7Fb6tNZgV9Fp/YRdyysJcaLJmg5rA7xUbesVO2nkDq6cHYEZC+
	rQQCwbFpLnOVSYkupHyBhVyy5JresIjZFfrLBqzpPUlcl9aEM9jx03S+9EjlBKvcSEBr0IdSBwp
	qnrALbhX1zFlXYx4M0W65DvLgY8Q8SELudfk9PoM6cyq7cUpUsPaQtfPUbAEPecY9SlTJGxeA9q
	9RGpPNxQ1eLb7/GbHCLZBnBJO0HKmXmn3s+Jxju/6efSQurcc6+VJj9wtM4GaKH+G3V5cm5hsn+
	Q9gxjj+BNWUTloChq8c5xfopsmF7pRH4hYUQi5daC3ByQFu5VvS0l83N6DhOJxnGsijtVtZUJur
	6sVj9D5lPSIPwx7bARKIzqz
X-Received: by 2002:a05:6a00:1d9e:b0:82c:e60c:f36d with SMTP id d2e1a72fcca58-84284facfd3mr1597329b3a.48.1780461366633;
        Tue, 02 Jun 2026 21:36:06 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282904889sm1478742b3a.55.2026.06.02.21.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 21:36:06 -0700 (PDT)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	Chi-Wen Weng <cwweng.linux@gmail.com>
Subject: [PATCH 1/2] dt-bindings: spi: Add for Nuvoton MA35D1 SoC QSPI Controller
Date: Wed,  3 Jun 2026 12:35:50 +0800
Message-Id: <20260603043551.1062112-2-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260603043551.1062112-1-cwweng.linux@gmail.com>
References: <20260603043551.1062112-1-cwweng.linux@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_213607_449092_08917E4D 
X-CRM114-Status: GOOD (  12.96  )
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

Signed-off-by: Chi-Wen Weng <cwweng.linux@gmail.com>
---
 .../bindings/spi/nuvoton,ma35d1-qspi.yaml     | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml

diff --git a/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
new file mode 100644
index 000000000000..f7b9cb52d8e5
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/nuvoton,ma35d1-qspi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 Quad SPI Controller
+
+maintainers:
+  - Chi-Wen Weng <cwweng@nuvoton.com>
+
+allOf:
+  - $ref: spi-controller.yaml#
+
+properties:
+  compatible:
+    const: nuvoton,ma35d1-qspi
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
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        spi@40680000 {
+            compatible = "nuvoton,ma35d1-qspi";
+            reg = <0x0 0x40680000 0x0 0x100>;
+            interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&clk QSPI0_GATE>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            flash@0 {
+                compatible = "jedec,spi-nor";
+                spi-max-frequency = <30000000>;
+                reg = <0>;
+                spi-rx-bus-width = <4>;
+                spi-tx-bus-width = <1>;
+            };
+        };
+    };
+
-- 
2.25.1


