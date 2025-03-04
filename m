Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF48CC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 06:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qyiEiO+lrv2EFnXfMGMyPw5E4yChu6zGBy6NaYQRiQY=; b=C7nQuOVM+DFsU/5BnKD35d4hNT
	0rsSjFKmvMHwfPm+ouLUPZDp5oC9CBXm3C2oPY+8cMzqRfh+EWCToyXRQrPiOF9h1UIG8qAfY1PSx
	KKinvmQUAZPi+YAI+JW/NHh1ryV5Xs03/Aulm1yVGnAd/rHixn78X1wgR29xESrCCXYl12vLl1sHB
	YByY1SSCJd50mqrw/rkjlLShqaEYsd5PGogWOzsvGeSsQ4zAyJ6zU4U4+4wFtnzagl81C8qffGtJe
	r5nH6V/ZH4vP8/+o2+bi60OqBiyiymsngMP3N0cSX+XpmqlZ6vQwlmL2hfhIVgf3hbl54CsjLFRrE
	sVYv2HqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpLkF-00000003Glz-1pru;
	Tue, 04 Mar 2025 06:27:11 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpLe5-00000003Esx-2qFY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 06:20:50 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5e55ec94962so2555244a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 22:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741069248; x=1741674048; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qyiEiO+lrv2EFnXfMGMyPw5E4yChu6zGBy6NaYQRiQY=;
        b=Yr3TbwBJ1vIvRB0ucKY3cdUaPNSffb9dQmF8ZqVZxUK33fxgTbw7T/yiUQJSTHPW1k
         H7R5D50XQWM/MSfvyDEUIi2qywGlBKl3WB613OJNOYaZqfPhqsmYWkqcit0MZ7Vt0TJ/
         eDYcD18Nihn61vpHpknmYxnUY5xfShApYnTM+jL5fdJWCygMaHXng1F0zRwGDoaMn9Dk
         rIpsUs0S4FKtfEryvaQ/copb4bcc3LSusqND47HkgaxJSKHzazYta0gx/HTYciiM9TGh
         jKKmdq8HvNn+ci5GcgvA3cZWoDsAZ0q2L+YauGHMHQDOghoBVbIBa9uc4VfDEu2ZVNbV
         O+bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741069248; x=1741674048;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qyiEiO+lrv2EFnXfMGMyPw5E4yChu6zGBy6NaYQRiQY=;
        b=w7Vc6A4JR6P9rlQSdrD+SQcEplgRoispcTyUX6AvR0K+dzv3401OxFPceSBLV4VddW
         KuxlfZFfvid2hrnc3PATx4mCY1sx244duYfB428JPOgtgD5msYGOmoLpWgWIPEi4ET1R
         2ZHFu0bv9PIRibuFJdvqzOLfmq4425lmxxcMK4BV/8dwjvTbtIDkAidXc/UUl2TAP6SG
         sHYLzKS5izy+f5SV/DOzGBUs6KtQO6NYmPvpK29QVaXHYgL2DWaqauYgKnXu6BQpM9dC
         kD92Z42ARt3iXfZRoUhnI5FBJzGYxzpt+SKxtu08XopVsa913xDnYBpfey3L2qMerlpL
         9bXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWs+yRIomGwBJ66JQ2/8dZ2ZeIoN7sAptSTpv1hdv2nhv8DbGuKGef8iMRH0dYgZ4NAIbN+oFc2HrLxeKdlSK2+@lists.infradead.org
X-Gm-Message-State: AOJu0YwG6F5c2orHOdTRFmkZRoMilNW8Kbuh1CLgPhWYdu4lBa8SZeTf
	WmWcJK4Vi98CLCMy+h3KM1hTQVSJ21Qq2/zeZjgbMlkxR81K+R4+
X-Gm-Gg: ASbGnctdgNqs3NHE/3E/MCB0nmfeUllWo/PIFrWXbqRN87QRbp/S1/8unxyD772Xmpo
	jaNKsQpm0SCYuWZSUZiuks9lGzMtuTHhHGbp2W63apVOZvsOuaS208fr7jQtFgaLB3P4z2bDAQF
	qJAvRvttImIEEXseePd1NzrWDtV+bJGb4c5PrS77GVIwcfx+HFIIwe1tUmWNig7G+o5H8DYGrCm
	jIiiVtRDNRuByjQO9MUs9LHJzhky7HhIPRydeL4emshjsHUw7EyfHKwy4mXxG1URkAA70leDEBs
	a3rp6jeNYGca+HeyYP5YUeiZFvN5AVgXqLhMlnqgw/2YLdqCfjhsAt6kin68k8n7plFbruGawO+
	dGqa7iS7UpXoLEEU=
X-Google-Smtp-Source: AGHT+IF2tnU7nvXtOlGzN4lOLDFoWcyh4RVs6EFLjb17C7DUOfM5XfLgvmFycbkrGKgTPU1KHz2BuQ==
X-Received: by 2002:a05:6402:2714:b0:5e4:d530:31a0 with SMTP id 4fb4d7f45d1cf-5e4d6921913mr18579693a12.0.1741069247649;
        Mon, 03 Mar 2025 22:20:47 -0800 (PST)
Received: from hex.my.domain (83.8.122.142.ipv4.supernova.orange.pl. [83.8.122.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c43a663fsm7609036a12.68.2025.03.03.22.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 22:20:46 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Tue, 04 Mar 2025 07:20:33 +0100
Subject: [PATCH v6 02/10] dt-bindings: mfd: brcm,bcm59056: Add compatible
 for BCM59054
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-bcm59054-v6-2-ae8302358443@gmail.com>
References: <20250304-bcm59054-v6-0-ae8302358443@gmail.com>
In-Reply-To: <20250304-bcm59054-v6-0-ae8302358443@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741069239; l=4438;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=uKY/pvKOppCATK1lW8BOBHq0yCrMNbql6EnLBlHnpBs=;
 b=pEI/t3Zh4tTV3f80cqxONxxxBDb+oiyEgfqUMy+9olMlnTzzZ8+zz2vnLPEEeyX+Ol2tEsCIz
 fUVEMSEFQdnC6amEbP4VVcm3z4uPmimF4NRxs2+r7N+XS7GcuauXJOf
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_222049_726020_088E68F3 
X-CRM114-Status: GOOD (  17.11  )
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
Changes in v6:
- Replace mfd/brcm,bcm590xx.yaml with mfd/brcm,bcm59056.yaml

Changes in v5:
- Replace mfd/brcm,bcm59056.yaml with mfd/brcm,bcm590xx.yaml in
  regulator bindings description

Changes in v4:
- Fix yamllint errors (missing unevaluatedProperties)
- Drop comment with regulator name list
- Use full schema paths for $reg
- Change description of regulator binding to mention BCM59054
  explicitly
- Drop quotes around vbus reg name
- Change "Power Management IC" to "Power Management Unit" to match
  official Broadcom naming

Note that I did not end up moving the regulator refs from
allOf compatible matches; I explained my reasoning in [1].

[1] https://lore.kernel.org/lkml/ab853605-859d-44c6-8cbd-44391cd677e6@gmail.com/

Changes in v3:
- Split regulator node into separate file
- Removed quotes around compatible
---
 .../devicetree/bindings/mfd/brcm,bcm59056.yaml     | 26 +++++++++-
 .../bindings/regulator/brcm,bcm59054.yaml          | 56 ++++++++++++++++++++++
 2 files changed, 80 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml b/Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml
index b387ef9885c3ac524e0782545dbca9c0e81a556c..b67d7a723fc242869e5bdc6b3602785f62af45bd 100644
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
@@ -21,7 +23,6 @@ properties:
 
   regulators:
     type: object
-    $ref: /schemas/regulator/brcm,bcm59056.yaml#
 
 required:
   - compatible
@@ -30,6 +31,27 @@ required:
 
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
+          $ref: /schemas/regulator/brcm,bcm59054.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: brcm,bcm59056
+    then:
+      properties:
+        regulators:
+          $ref: /schemas/regulator/brcm,bcm59056.yaml#
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
diff --git a/Documentation/devicetree/bindings/regulator/brcm,bcm59054.yaml b/Documentation/devicetree/bindings/regulator/brcm,bcm59054.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..5b46d7fca05e21aa1eae991b5f9f60b444f20c1c
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/brcm,bcm59054.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/brcm,bcm59054.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM59054 Power Management Unit regulators
+
+description: |
+  This is a part of device tree bindings for the BCM59054 power
+  management unit.
+
+  See Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml for
+  additional information and example.
+
+maintainers:
+  - Artur Weber <aweber.kernel@gmail.com>
+
+patternProperties:
+  "^(cam|sim|mmc)ldo[1-2]$":
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+    unevaluatedProperties: false
+
+  "^(rf|sd|sdx|aud|mic|usb|vib|tcx)ldo$":
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+    unevaluatedProperties: false
+
+  "^(c|mm|v)sr$":
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+    unevaluatedProperties: false
+
+  "^(io|sd)sr[1-2]$":
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+    unevaluatedProperties: false
+
+  "^gpldo[1-3]$":
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+    unevaluatedProperties: false
+
+  "^lvldo[1-2]$":
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+    unevaluatedProperties: false
+
+properties:
+  vbus:
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+    unevaluatedProperties: false
+
+additionalProperties: false

-- 
2.48.1


