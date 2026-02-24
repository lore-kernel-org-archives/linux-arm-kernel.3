Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2283F3C985
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 14:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pmLq0qmeV50CrbxLujz4IkdUyCeZ40OrRobR1+C3o9U=; b=GRt6YZBgdCTlBxRMt/JHjnEg1/
	jUy91Z6TGa8N7CXJGbo3sHN63kK+MnCHRDa0BUMW0UqWdpGANHhypZK/A/Lt0iJKlSrr55eswznHK
	xI1TkiBBJRnRdr73rxz1o64tPUKTGLWK2J/s/47xcpmjP5eEkCgX911jShrajEJKKXinpI40FSMxd
	ayRe8+je9C6vpDHK80WQLagzrQw4p1FkXR4HyLHSkpJdgddO0LnWiBE3/Usxr9eeHORw72YpRFGBM
	/1lpQNuiGb5TqT/JxF+Mu9nszzF3R+5KU7KQmrtILDefgAb2yYvNyp0h0rwGNtm63HEcp3EtRtkDe
	q7ZnQDdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuth2-00000002GNU-2R8B;
	Tue, 24 Feb 2026 14:47:20 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vutgz-00000002GL9-42X0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 14:47:19 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-824ac5d28f9so5820845b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 06:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771944437; x=1772549237; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pmLq0qmeV50CrbxLujz4IkdUyCeZ40OrRobR1+C3o9U=;
        b=i9b24VqEBGimewobrnrybBOcf3wmWh5nlOZZnWn5Wu0Gys9au+x5BGLu83UnyERFYl
         CCakKfnaERrrdh/8L3xkQiID0tpuDLTPOaXvudbvbgU7Bh140hdRneJM9vDeram4uZe/
         aCqBzVWP0yQYHUMHdpKm5tg/H5nfqwltYomvl7+GVKTSZKJNd6WIbkzQsz13NfcoNT0J
         EzyiIV/GNDbFxZMhJWWQpYpP9JRAhw+ZXHzj3G7Afyjei0AsgMtb17rPOnx/SLfqRjZ1
         B/t2+OQlRKVNPoabhZbkWWUwoD9otna8BLfQCA+hFjV4Z76Nf0SmBMtilmhaD+XMGjkm
         kG0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771944437; x=1772549237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pmLq0qmeV50CrbxLujz4IkdUyCeZ40OrRobR1+C3o9U=;
        b=Y/EgwdiCJFxSfnGwxHn0gksAPi/2Dn0TAtVxEjbBPLuqY613eMn29BXHvd2yrCOK14
         HNe9GiD46DRzl4/5+Spdj8FJ1Ss9I34lCnXgiemd+rXCUdAHomeWHnsQpvllOcPilmiL
         mHDLKeLryo0BVK92RVnN0vBiUfDRnx2L2d5DsEDVPAR8HpoMrl/DGPiqqPIAyQtAwAVb
         C0NPiG+zpaWBU26187pP3gA5dGaacKVaxpkK5mcNhYvoOkOA3fz78vYQ5Rx//3Vl79oa
         m6uVGg324QMQfGxAPkjrpYY9x+G3Vz4WOjzZhslpYHzdduioYVZsq8ZgYrOkpqRmJ/+1
         yQzw==
X-Forwarded-Encrypted: i=1; AJvYcCVwEUS8mZjBppB6UMsSB5RLFst3mNKBn6hj2J/h30M/uulRulc8RJeh6ybi8c+hBDsWQZ03sINa7LKwQw7ZD8iy@lists.infradead.org
X-Gm-Message-State: AOJu0YwrkeE8OiGHp5XYNOpwrkTzfQqLpQdj/BBob2QqIxEwby0P/Fzc
	fXYTkd4qPvTXAPiFN2/GIbCu+YB/k3PSNzQQUv/oxFFWGF+Pi9e9exS3
X-Gm-Gg: AZuq6aLD4LOczCYBkHkp3kg3HRVgcevaT24wLVWUxQheuWwGJKs2Sr6ZBn4F/wtDm+0
	CYULotWNBIKarzTALCQ68XhVH3TZbrnl5pQJ8S4UcqIm5ZdgACN4iQTsETixXhEfCtUOxTPZsY7
	jrklLoEszDCwhqeNyvMvsnoifFUqsYZ8Byzk5lmPp27mN6ZofSiZLMFCiDZ/g4ID1JVuLfrrMat
	z7Z4jMZWz/dsZU53UxWqlPRdtCHZJDynPiB+90JDm8nY537zUE7A2mwiSpLYm+2MjfR7KECn/FD
	lg33RgCJg+px2ofdUhEi0UCrVXcZlupNmwNtk302MKjx9cxmfIMlgGZOuXZ9dbr2OITI1JD/Ljv
	/R9ir3rE39QyTcdD6H6IAxkJL/4Rlxt4hP08ap653SHDRZNnEepBrdx2kr/QcKEz3CaHT4UQZuU
	3nRS3S52LOH4J4aG8IPmmsYC5h4CtRTY8bbMG7/GjGoMrgfAqq
X-Received: by 2002:a05:6a00:c83:b0:81f:852b:a91c with SMTP id d2e1a72fcca58-826daaad4aemr9634315b3a.64.1771944436969;
        Tue, 24 Feb 2026 06:47:16 -0800 (PST)
Received: from LAPTOP-872M7T80.localdomain ([122.168.64.105])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-826dd64367bsm11149895b3a.4.2026.02.24.06.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:47:16 -0800 (PST)
From: Akhila YS <akhilayalmati@gmail.com>
Date: Tue, 24 Feb 2026 14:46:49 +0000
Subject: [PATCH v2 4/5] dt-bindings: arm: atmel,at91rm9200-st: convert to
 DT schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-arm-microchip-v2-4-8bedacd2cdcb@gmail.com>
References: <20260224-arm-microchip-v2-0-8bedacd2cdcb@gmail.com>
In-Reply-To: <20260224-arm-microchip-v2-0-8bedacd2cdcb@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu@tuxon.dev>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Akhila YS <akhilayalmati@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_064718_008006_DAA4231F 
X-CRM114-Status: GOOD (  12.76  )
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

Convert System Timer binding to YAML format.

Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
---
 .../bindings/arm/atmel,at91rm9200-st.yaml          | 65 ++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/atmel,at91rm9200-st.yaml b/Documentation/devicetree/bindings/arm/atmel,at91rm9200-st.yaml
new file mode 100644
index 000000000000..ff485b37cba8
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/atmel,at91rm9200-st.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/atmel,at91rm9200-st.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atmel System Timer
+
+maintainers:
+  - Nicolas Ferre <nicolas.ferre@microchip.com>
+  - Claudiu Beznea <claudiu@tuxon.dev>
+
+description:
+  The System Timer (ST) module in AT91RM9200 provides periodic tick and
+  alarm capabilities. It is exposed as a simple multi-function device
+  (simple-mfd + syscon) because it shares its register space and interrupt
+  with other System Controller blocks.
+
+properties:
+  compatible:
+    items:
+      - const: atmel,at91rm9200-st
+      - const: syscon
+      - const: simple-mfd
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
+  watchdog:
+    type: object
+    description: Watchdog timer subnode.
+    properties:
+      compatible:
+        const: atmel,at91rm9200-wdt
+    required:
+      - compatible
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
+    timer@fffffd00 {
+        compatible = "atmel,at91rm9200-st", "syscon", "simple-mfd";
+        reg = <0xfffffd00 0x100>;
+        interrupts = <1 IRQ_TYPE_LEVEL_HIGH 7>;
+        clocks = <&slow_xtal>;
+
+        watchdog {
+                compatible = "atmel,at91rm9200-wdt";
+        };
+    };
+...

-- 
2.43.0


