Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC78CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 06:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lenEIxoLi6+YCq/tfMwIzvmfL+sfiBY8pQSkNEn0Xhs=; b=lO1Yrngo7wLsyoBSuMXVbvihWw
	kaN4Rpq8hCBM3Pj0naNjk0e8NOJu+osCaG/3gqQ0fVArhIJ517mK7G+FFQGb6KMKw0op4/MMUVj5j
	wTzOzPhLLsxzrxDZSXLNOT1CxxsjlBGTi3oDcfKYYNUskMStodiQdvhzHVLvlWRMHtMu2aqdiXKW7
	OCxC/ZaygJtHBLPpZXLw9PC/1/PYAiCjW6tku1DQ08yCB7DVAWdL1oRcZj4izeVLZsp2HAwAL7SKv
	QpJrH1OhooooUIj59r6hW3priwWX8ILmp1aY/irbmfUrsF/bflm59EkfmLsG64alE31gWSK+KFgeE
	seh1usGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ19I-0000000Di0T-19XT;
	Mon, 15 Jun 2026 06:50:20 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ19D-0000000Dhym-0vXT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 06:50:16 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-306f36df4feso2024497eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 23:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781506214; x=1782111014; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lenEIxoLi6+YCq/tfMwIzvmfL+sfiBY8pQSkNEn0Xhs=;
        b=NMdRQXh0yiMowM6uXoG3Gqsa7LsEoKDvMmfY4W5M2LCcljEBB8UxsZa0ZdxIaYzBVi
         h7V2I1PLQQoaVfgUlQ4aTPSp7D0f4XucPLQDrAABl0AJo8LJqKNa0vVZxomOTAy/cCI9
         18cp2YoJ1VDoqdDWpYX+0oYcnAEg5tgsTs3VvdHpYKWu51Ej5tkm2h4XzfpnKJXDJCYD
         IfKBx2TZaWmUtHQlDPTat/AmZganAd9AH8QY/GrU5i4b52TZK+GDH40kcsYG7evlqHXf
         O4mv8tQ1h/t3tz6nEf2YsFpC12FhPv+KKlU3dAYIMqb5msYLJz0QYcxuf/Hj6QykF99u
         wDaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781506214; x=1782111014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lenEIxoLi6+YCq/tfMwIzvmfL+sfiBY8pQSkNEn0Xhs=;
        b=ieum1SEnEJAO7OAFoKM9RAnWH33Mu3pSHWNr+9w/0Kh8Cxfv60ZsGgHVsXNtYL7qv5
         7Gk+12xq/IFonZJsnR20UZLUHT686EEEdMCb873YL9qZabErRrdXtDtL3VPHfQNloI0Q
         pk9/Fr14qOntE3DrRaOmxLDCOAxNoDNpgKAE1mRXTAbjE4+PCPacl8J7YAJD3PAoTp2T
         qMH1tOd75+oXL8mjXjxhyzQ6KEg19N05n0MwKbRtUcoYuHWFOISRM+E7TJZX80MzrL5O
         K+U18LG0gmsFg6jrI7ljPbDtdcBXxG5rCQbASJK+5/OU6CG2iv+hSBghTDx/lEHrxVXp
         0yLA==
X-Forwarded-Encrypted: i=1; AFNElJ9hoFNodshPPfMCF+ug2TPe1O+17cPF/KYECFfCPbttLpjIhxvJKT8iGwfTjM21Nr0jSjWHH1j/j3Z7UWPp90SX@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8OM3sT9tIgOmRuNe5/1G6/X9ia4gMOgmY9bcwKwH7PNjXBkKx
	AZc/o3M2UyeaZdFnf14W00z6DOGVvbCxNH65sGYCNuwpsAKGlvAswXT8
X-Gm-Gg: Acq92OE+5MBtqfKJUhqu+5daKS481eN6bTQN8pE7h/dr+H3hg8kjMyyPWm7HQ9z6drw
	itiet1ZSUy8XWFsvPlbMJNns4LDdCDz3iC78O89pTqxh9xWn69hB6Mo0hNlE9ZsQ7xJ5xszu1Df
	aquXrjX6ZqjGKMURYhPPZ8vHHXGroYsS81ZnH3OuHQdXf6QT7C74YWv16Aygpws693GvLhoUHrg
	nvXrocPhirjAkFmD0m3JmJR12ADiXWF2+CpUTvk0OoLsxw2oI/WVnMpvJd15KVo0YHApUCdqJJu
	eFh75rJ0RXbch/m8TSANt6bWx0XKCmhZCu3/lbV0Dgf37/jB2fZyq4+1tkxXZ+XK4DlAK9VdTsg
	NLNBnPA8vDEdie0XdsZyUnVmiUv158UExONO7/DvQJV1+p0ce7LTXKbjtxJvUcpTA66xA+RBuS+
	tWbDiwcw1vOTjzpQNc8p/2wSGaJLDYbJP/uzKPiHFQ+0mukPYgZsYl0QCzxM8bFIKZplcZ0EJCs
	iy8O66/GtED
X-Received: by 2002:a05:7300:6da4:b0:2d9:db50:c6ce with SMTP id 5a478bee46e88-30820c0a172mr6428010eec.3.1781506214227;
        Sun, 14 Jun 2026 23:50:14 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb9a2e7sm13516812eec.30.2026.06.14.23.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 23:50:13 -0700 (PDT)
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
Subject: [PATCH v4 1/6] dt-bindings: display: verisilicon,dc: generalize for single-output variants
Date: Mon, 15 Jun 2026 14:49:58 +0800
Message-ID: <20260615065003.76661-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615065003.76661-1-a0987203069@gmail.com>
References: <20260615065003.76661-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_235015_264766_F8F2A9D1 
X-CRM114-Status: GOOD (  12.52  )
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
- Move clock and reset items descriptions into the per-variant allOf/if
  blocks; keep only minItems/maxItems at the top level so the base schema
  accepts all variants.
- Restore full items lists for clock-names and reset-names at the top
  level with minItems so the names are validated against the descriptions.
- Keep ports in the global required list and keep additionalProperties: false.
- Add an allOf/if block for thead,th1520-dc8200: five-clock (core, axi,
  ahb, pix0, pix1), three-reset (core, axi, ahb), required resets.
- Add an allOf/if block for nuvoton,ma35d1-dcu: two-clock (core, pix0),
  one-reset (core), required resets.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../bindings/display/verisilicon,dc.yaml      | 80 +++++++++++++++++--
 1 file changed, 73 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
index 9dc35ab973f2..0c41286b8223 100644
--- a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
+++ b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
@@ -17,6 +17,7 @@ properties:
     items:
       - enum:
           - thead,th1520-dc8200
+          - nuvoton,ma35d1-dcu
       - const: verisilicon,dc # DC IPs have discoverable ID/revision registers
 
   reg:
@@ -26,14 +27,12 @@ properties:
     maxItems: 1
 
   clocks:
-    items:
-      - description: DC Core clock
-      - description: DMA AXI bus clock
-      - description: Configuration AHB bus clock
-      - description: Pixel clock of output 0
-      - description: Pixel clock of output 1
+    minItems: 2
+    maxItems: 5
 
   clock-names:
+    minItems: 2
+    maxItems: 5
     items:
       - const: core
       - const: axi
@@ -42,12 +41,16 @@ properties:
       - const: pix1
 
   resets:
+    minItems: 1
+    maxItems: 3
     items:
       - description: DC Core reset
       - description: DMA AXI bus reset
       - description: Configuration AHB bus reset
 
   reset-names:
+    minItems: 1
+    maxItems: 3
     items:
       - const: core
       - const: axi
@@ -59,7 +62,7 @@ properties:
     properties:
       port@0:
         $ref: /schemas/graph.yaml#/properties/port
-        description: The first output channel , endpoint 0 should be
+        description: The first output channel, endpoint 0 should be
           used for DPI format output and endpoint 1 should be used
           for DP format output.
 
@@ -77,6 +80,69 @@ required:
   - clock-names
   - ports
 
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
+          items:
+            - description: DC Core clock
+            - description: DMA AXI bus clock
+            - description: Configuration AHB bus clock
+            - description: Pixel clock of output 0
+            - description: Pixel clock of output 1
+
+        clock-names:
+          minItems: 5
+          maxItems: 5
+
+        resets:
+          minItems: 3
+          maxItems: 3
+
+        reset-names:
+          minItems: 3
+          maxItems: 3
+
+      required:
+        - resets
+        - reset-names
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
+          items:
+            - description: DC Core clock
+            - description: Pixel clock of output 0
+
+        clock-names:
+          minItems: 2
+          maxItems: 2
+
+        resets:
+          minItems: 1
+          maxItems: 1
+
+        reset-names:
+          maxItems: 1
+
+      required:
+        - resets
+        - reset-names
+
 additionalProperties: false
 
 examples:
-- 
2.43.0


