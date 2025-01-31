Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26095C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 18:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9+pPKfqXieDOQM2ayfee2XUul8g+kNgXcNPv52SLqjM=; b=WAZ0sz9CJFNq4rbbSZ2hly+dQb
	NvRkvhXF0GXSp0Wy7IUQ/xKrh92mrpFrkRBPwnr5ThNxJyFWL7vHsR2R42lDLZKA44i5KtzQNg1gO
	Pm261Ix/2am28xhd1CATRXOZNa4S2qmTv9Ppovwj9xM2HIII4H/mx76UOusdzJ1LzFB6vyNOUcfcs
	OuLgs09Fc4aqBi5mL9++75t3oocUjY1L97dgcwgWuEBUHw2RaHr8LzoGFdPuzAmGRLdOY4F3uIULV
	jVLx4noNvdgyYfe1DOek4KgtI98rc5UTsrSCSgsir0/1sxWQza8q7GYb+JbT1pAFF2Gfxka+DwBMH
	cJaCNPFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdvaW-0000000BBsG-151A;
	Fri, 31 Jan 2025 18:17:56 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdvWg-0000000BBFs-2slh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 18:14:00 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5d3f57582a2so6554004a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jan 2025 10:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738347237; x=1738952037; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9+pPKfqXieDOQM2ayfee2XUul8g+kNgXcNPv52SLqjM=;
        b=SGyBOgFX10nMoyKKLoWZqheHR8bePQsgZ3cQh8lpRqjppXRWF2ZOMS9Bvb3R8OkIeb
         wky60vMXywkfQ3XkzgeR2X+Z7WCjavWtL1/xZr7GivOSpPG5Az7WQ+IjjHGCvN2+eaRM
         WoqihrWK0lWzJB2muypf5BpMgBQ6IVxto7djfvrAbsdKDIFpdNv+vJjO7whgYRl8pYQJ
         zJbv4lg2QmjCfVdgzpH5WWxuS8OInBALdbx6zOegSlikATNC5jU1qz4ny3z/Zi7etrCV
         aRu3kwPP4gQ28EkWrMzfRrsdvlSzGr2brt/ZddEtOCbtTm+NuI6j7ncgZI4wHNtPIY9l
         HACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738347237; x=1738952037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9+pPKfqXieDOQM2ayfee2XUul8g+kNgXcNPv52SLqjM=;
        b=iNa8+gO65V2Gp0Q3Utc7laEsjBG++JzwFBF7zziFGw8IxSolspd/9pIn8irQyFzJAE
         fuU0fQ6fXgLo1OUXSVi+JR6RgRDGlnwQVLR5+gbcF+qR45S8t/bmvzaKmYX/1koGwanZ
         HSpgNGCrmkp00We1CFHsPyXVKE1ysr8iCa2+tAKB4BsiPnMLOt6gpMnlITDIGBPCrpax
         HhkXvOB6LPxwd//Opz48G/B8DHhavaG1BKL1fwpNXZZke8pzM89NFuSzVSp+kYSJa3ZS
         3dDmgOFJ2Gceqx+2/fsHB2M7QzN3U5DXaOArLZWcEj1ZgD4zjrrdzF6TChlxDFUkHhXM
         MgPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOlJL9uZw+AaWOBem9I/GnwNYksxmEkYFChtb1LKc962aCtSOM8GEeb5wZxrjIQQPEU3XnfcMq1KNz097Dv8Xl@lists.infradead.org
X-Gm-Message-State: AOJu0Yyzl+60VjwNvuLkRTgOkYP2DKFKp5XA4t4MX9UG+vBYpnVu+t1/
	IDDXZahfw1AyiZhjJFBdwL1LB45fwaI4ANVH5ZlJsVCsY4WI/NXZ
X-Gm-Gg: ASbGncuVS5wC4SFxVgRDS05UQBpIA/G0x6lRP9w5Plh7MRbuACLcWZvVy950qFflng2
	39GT6kO0PyQyUzVz9UGrhma3a0QwJI/GFNgVk3U85aXuBVCzrX1AksboYF6a6JpVMXJxCAYwyce
	KFNLk03TuJ/L2pRoQfaSKvNoAg0XEpPs5h/rjRaHsBIsLZdZKU3Dwxjrb8PbkMbZO5xaeYe0caT
	qek3TxSVzTCwgHgWfivVMmzJs1xEmANKO7L/nOcKfimBmlMNgOP4vlVMbLouvvdKsjJsYJtQ1H6
	SqL1QimV0B5ZPafdC9FzVU0zjFP0eqX9XbqJSRxI3h5vU0G5cUJdhTeOgES92g==
X-Google-Smtp-Source: AGHT+IFtTQye6C3PynwMaQIyS58K2Z5A6uetfs4VIhAtqWyYJRvYEwXPz0AnJMxAM7WDcKCtun4YpQ==
X-Received: by 2002:a05:6402:354a:b0:5d3:eb50:4e33 with SMTP id 4fb4d7f45d1cf-5dc7fbb5845mr5223948a12.5.1738347237063;
        Fri, 31 Jan 2025 10:13:57 -0800 (PST)
Received: from hex.my.domain (83.11.225.21.ipv4.supernova.orange.pl. [83.11.225.21])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc723cff67sm3223744a12.16.2025.01.31.10.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 10:13:56 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Fri, 31 Jan 2025 19:13:50 +0100
Subject: [PATCH v3 2/7] dt-bindings: mfd: brcm,bcm59056: Add compatible for
 BCM59054
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-bcm59054-v3-2-bbac52a84787@gmail.com>
References: <20250131-bcm59054-v3-0-bbac52a84787@gmail.com>
In-Reply-To: <20250131-bcm59054-v3-0-bbac52a84787@gmail.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Stanislav Jakubek <stano.jakubek@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738347232; l=3753;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=OZ9dPuuxBTKP3Wt2se5BJr4wjcpa5aP2mHso7Suck2o=;
 b=sqaHEVnsUFrd0UYoHhD18OH9xeCEUeiPUJ+MowEyl9X/4ehA8iO40GJsD7V1cKqk2u2x9y2Xs
 lj0TeVO3mrzBXZ+b9IySsXfgeTaE+S4Mt/Jd6wNhdheDaNvKl3KjfZv
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_101358_737100_C7D04D22 
X-CRM114-Status: GOOD (  15.69  )
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

The BCM59054 MFD is fairly similar to the BCM59056, and will use
the same driver. Add compatible and specify the allowed regulator
nodes.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v3:
- Split regulator node into separate file
- Removed quotes around compatible
---
 .../devicetree/bindings/mfd/brcm,bcm59056.yaml     | 26 +++++++++-
 .../bindings/regulator/brcm,bcm59054.yaml          | 55 ++++++++++++++++++++++
 2 files changed, 79 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml b/Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml
index 3296799eb452fca2a4b03699fcb5aa27005a8e8d..87d663416ed9e7f5ec4aa25c1aa2d9e650c42e2c 100644
--- a/Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml
+++ b/Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml
@@ -11,7 +11,9 @@ maintainers:
 
 properties:
   compatible:
-    const: brcm,bcm59056
+    enum:
+      - brcm,bcm59054
+      - brcm,bcm59056
 
   reg:
     maxItems: 1
@@ -22,7 +24,6 @@ properties:
   regulators:
     type: object
     description: Container node for regulators.
-    $ref: ../regulator/brcm,bcm59056.yaml
 
 required:
   - compatible
@@ -31,6 +32,27 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: brcm,bcm59054
+    then:
+      properties:
+        regulators:
+          $ref: ../regulator/brcm,bcm59054.yaml
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: brcm,bcm59056
+    then:
+      properties:
+        regulators:
+          $ref: ../regulator/brcm,bcm59056.yaml
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
diff --git a/Documentation/devicetree/bindings/regulator/brcm,bcm59054.yaml b/Documentation/devicetree/bindings/regulator/brcm,bcm59054.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..719621c7f0e71cd9368f4d7243c79aaa97ca7255
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/brcm,bcm59054.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/brcm,bcm59054.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM59054 Power Management IC regulators
+
+description: |
+  This is a part of device tree bindings for the BCM590XX family of power
+  management ICs.
+
+  See also Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml for
+  additional information and example.
+
+maintainers:
+  - Artur Weber <aweber.kernel@gmail.com>
+
+# The valid regulator node names for BCM59054 are:
+#   rfldo, camldo1, camldo2, simldo1, simldo2, sdldo, sdxldo,
+#   mmcldo1, mmcldo2, audldo, micldo, usbldo, vibldo,
+#   csr, iosr1, iosr2, mmsr, sdsr1, sdsr2, vsr,
+#   gpldo1, gpldo2, gpldo3, tcxldo, lvldo1, lvldo2
+
+patternProperties:
+  "^(cam|sim|mmc)ldo[1-2]$":
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+
+  "^(rf|sd|sdx|aud|mic|usb|vib|tcx)ldo$":
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+
+  "^(c|mm|v)sr$":
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+
+  "^(io|sd)sr[1-2]$":
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+
+  "^gpldo[1-3]$":
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+
+  "^lvldo[1-2]$":
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+
+properties:
+  "vbus":
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+
+additionalProperties: false

-- 
2.48.1


