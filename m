Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30ED8CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 02:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mE/QA9NRrIBzmpaNm7qJKCCCXhuuJ1hBihamFPKJO/0=; b=aTD5AH9pMvjtEQ0tGsQnme0H5C
	L942LFRVFiNdPHNF6ih4p7ZBKRBHg/LQrvpDmGGT8pa7BmKc6aMdyLd5G7R4L+ZG+OmIPiq31zDzJ
	Qt69LKUYZZ2jpFjaekUSfFt0UaxVRYK7Lgy3HwXnfDZ0YkN/egnpytZfsV1qfSLsyWBpJhjRXNB+k
	1UlXqLbevRKGE8g7wmAR7E/xgz3FNt99NyERVokmcBQ1gRE5eS9d2UTn9uUfKB6GXroLkxKWRQU4g
	BQjmPjQKYcHnxM9RJd5g/VcjxbfOQVW5cibTFImZKjYiBi3Sb6ggciLYDf4DXxG9nTqrP3pLjwpBX
	g///BQRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWPnG-00000002j1l-12Uo;
	Mon, 08 Jun 2026 02:32:50 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWPnE-00000002j14-1DsE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 02:32:49 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2bf2e8ccca1so26099285ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Jun 2026 19:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780885967; x=1781490767; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mE/QA9NRrIBzmpaNm7qJKCCCXhuuJ1hBihamFPKJO/0=;
        b=dfvHZ8kn/AGDmEtcdaAVGZf3StwdfwlJpJZpnw6ayRPSJwUuBwlVs9Ji27AFrScsKV
         ynYWRkZK17iNaGn1jGk0+z1Ab0pdblS46QWIP4zgUCF1onMYFt27KKV8uFs/3mJn8ejq
         2EvaUUpksidw5zJi2ZLUAVm9FI6InxddKG5UhtJg9MRh+airrVyfAEs4bsTsEB7YGnsn
         Bp0t1H9tvBpSRm23eyLV/jbleP6rIbOZfUNz7/7PKZlECcyKYRXeNM4ozKR2ZwJT1jqq
         NKkdYAeQLOEQ5ojgOTGsVSMTJzCx99HbYB16FBL8u6x0wnKx6mt59ZsaKboLZSeKoKro
         NnmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780885967; x=1781490767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mE/QA9NRrIBzmpaNm7qJKCCCXhuuJ1hBihamFPKJO/0=;
        b=eTQECGzCqWBdsGMQjniSHbtCcFa/7x5jOVes/0muMW7X3vdmSpKMyTjtsz8vSFsN/i
         uUGiKairbXDGdWbilDTiE/mAknNiAy7VhK/HrAM5W5ejeSx4oTEPA2RKNjkdFiPz1+lj
         R0p/tLUE8zHyhWRza99FPbb435hA0hf83Kt8m1J9GxiJj5c3CGyxuT11dXUp0udkGjfK
         eKs2AdgpwYydPED8tPE2BxCSld7lpqOkMEHuwGXZot6PHBJjoYeo4r7ENdzVRnNDYZfR
         APoI1XPsjrDg3CB+fOHBbPKuh/EqEOMJmg7OrczgdJpSDqzTogW2FlY9zi4+gdHjLmis
         zVDw==
X-Forwarded-Encrypted: i=1; AFNElJ+yaa49nVOYxOiyeOoR0tTIKRrMVUcVdpJwYmatKZmWaOTx8uC7rL5WueD65vnDxkYytvM75aostJ6pgaaFx+GZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxiQ1kt09yNJMxqIjDjvhWzmbq9yhV4q9idcF5ldHHAOgmrruwE
	n161GepM6gYaaUDTZV8QVpN+ldIlGMys9+oEQvI7mA7CV/oyo/iIacVk
X-Gm-Gg: Acq92OGJSCU3Bm91Vid5XsrHbmNCqF8Eldjj5X1zSCAUTvZ6lH+gPHez/Ajw/kXqDFG
	aALuLsT8QlP5sf/OJ4/lEyXGbZgD7J2jOmOJMqJtuMC5XHs9RVVCH4LBrnZ78pHyIgDA/egA/Zy
	Xkbfw4sYPw9k8pT3c78wPwlx0Fl2tTL+fHsqWXNMWlpyL9DlkXgtB9FmK6l+BPCyB9SqKscHx3D
	bhjPYZuuDgrLB69EOEGjAfhHdm8Qr/Recd8XTFUQd/DSdBcBeoVxxxtb0nWEuiXo4OyKjqAkZrK
	5NsToKvFYycbDghEbTQF0kiJzW/RuR39PlpwZOvLqx59YXAqBTXDhIDkam6qyPitcOurQ+4JOgg
	5EV3DajwOJHHZUjRLnKACR+aThrzKxs07WbXEmBnLrpq8mJymgDZ0nuiYxEDmUiSHyhtnRdeR7V
	rGd6g8uB/UQeJgk0xYjxlmj2JhjUQ51f/NMIUYsnnkX0M74joNLnNOdpPalVkN5EdbIXB3oTxs/
	ySYY/7uiKAEbe4KuRQI648jCYQ21XDt9w==
X-Received: by 2002:a17:902:ced1:b0:2c0:fa4e:91f6 with SMTP id d9443c01a7336-2c1e7d41eabmr144113125ad.13.1780885967308;
        Sun, 07 Jun 2026 19:32:47 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c245dd3b5dsm38143485ad.81.2026.06.07.19.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 19:32:46 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: zhengxingda@iscas.ac.cn,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v3 1/5] dt-bindings: display: verisilicon,dc: generalize for single-output variants
Date: Mon,  8 Jun 2026 10:32:33 +0800
Message-ID: <20260608023237.305036-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608023237.305036-1-a0987203069@gmail.com>
References: <20260608023237.305036-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_193248_358040_1CC74449 
X-CRM114-Status: GOOD (  13.68  )
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

The existing schema hard-codes the five-clock/three-reset/dual-port
topology of the DC8200 IP block, preventing reuse for single-output
variants such as the Verisilicon DCUltraLite used in the Nuvoton MA35D1
SoC.

Rework the schema so that variant-specific constraints are expressed via
allOf/if blocks:

- Add nuvoton,ma35d1-dcu to the SoC-specific compatible enum.  The
  generic verisilicon,dc fallback remains the driver-binding string.
- Relax the top-level clocks/resets definitions to minItems ranges so
  the base schema accepts both variants.
- Keep ports in the global required list and keep additionalProperties
  tightened to unevaluatedProperties.
- Add an allOf/if block for thead,th1520-dc8200: five-clock (core, axi,
  ahb, pix0, pix1), three-reset (core, axi, ahb).
- Add an allOf/if block for nuvoton,ma35d1-dcu: two-clock (core, pix0),
  one-reset (core).
- Fix a stray space in the port@0 description.
- Add a DT example for the Nuvoton MA35D1 DCU Lite using ports/port@0.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../bindings/display/verisilicon,dc.yaml      | 103 +++++++++++++++---
 1 file changed, 90 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
index 9dc35ab973f2..db0260d874c5 100644
--- a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
+++ b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
@@ -17,7 +17,8 @@ properties:
     items:
       - enum:
           - thead,th1520-dc8200
-      - const: verisilicon,dc # DC IPs have discoverable ID/revision registers
+          - nuvoton,ma35d1-dcu
+      - const: verisilicon,dc  # DC IPs have discoverable ID/revision registers
 
   reg:
     maxItems: 1
@@ -26,6 +27,7 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 2
     items:
       - description: DC Core clock
       - description: DMA AXI bus clock
@@ -34,24 +36,19 @@ properties:
       - description: Pixel clock of output 1
 
   clock-names:
-    items:
-      - const: core
-      - const: axi
-      - const: ahb
-      - const: pix0
-      - const: pix1
+    minItems: 2
+    maxItems: 5
 
   resets:
+    minItems: 1
     items:
       - description: DC Core reset
       - description: DMA AXI bus reset
       - description: Configuration AHB bus reset
 
   reset-names:
-    items:
-      - const: core
-      - const: axi
-      - const: ahb
+    minItems: 1
+    maxItems: 3
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
@@ -59,7 +56,7 @@ properties:
     properties:
       port@0:
         $ref: /schemas/graph.yaml#/properties/port
-        description: The first output channel , endpoint 0 should be
+        description: The first output channel, endpoint 0 should be
           used for DPI format output and endpoint 1 should be used
           for DP format output.
 
@@ -77,7 +74,60 @@ required:
   - clock-names
   - ports
 
-additionalProperties: false
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: thead,th1520-dc8200
+    then:
+      properties:
+        clocks:
+          minItems: 5
+          maxItems: 5
+
+        clock-names:
+          items:
+            - const: core
+            - const: axi
+            - const: ahb
+            - const: pix0
+            - const: pix1
+
+        resets:
+          minItems: 3
+          maxItems: 3
+
+        reset-names:
+          items:
+            - const: core
+            - const: axi
+            - const: ahb
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nuvoton,ma35d1-dcu
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+
+        clock-names:
+          items:
+            - const: core
+            - const: pix0
+
+        resets:
+          maxItems: 1
+
+        reset-names:
+          items:
+            - const: core
+
+unevaluatedProperties: false
 
 examples:
   - |
@@ -120,3 +170,30 @@ examples:
         };
       };
     };
+
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
+
+    display@40260000 {
+        compatible = "nuvoton,ma35d1-dcu", "verisilicon,dc";
+        reg = <0x40260000 0x20000>;
+        interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clk DCU_GATE>, <&clk DCUP_DIV>;
+        clock-names = "core", "pix0";
+        resets = <&sys MA35D1_RESET_DISP>;
+        reset-names = "core";
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                dpi_out: endpoint {
+                    remote-endpoint = <&panel_in>;
+                };
+            };
+        };
+    };
-- 
2.43.0


