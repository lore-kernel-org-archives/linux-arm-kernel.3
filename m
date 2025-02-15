Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C744C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 09:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=690yNEMRJUQKTJ4PZeQTvHRlaj1/iV8n9Szh8khPTAs=; b=s4EQscwSkRCElPOxG1iJlP22tR
	xWxwisQyoaHXltES9ybJocWtUuq3v1XCf1f459+n170owFCXbCsl5SIksz+H0YQVzbv9DfmtWMNdM
	dzEUvkRWemSl3Z1/x/C9Gm77qcNfrM3mfHPVze5wH2IB3Y6sJiw89/1vXehIKLqVdGctmWiGIjQyf
	a9xO+xcEqSXaLIAgzseKKAzj0L3LWkD0e6MWDv5OUFej807KFxMhGRPFAy4J7JrEUtwkLIOGkLHnt
	uvKdpbe1Ov6u1NJra7NDX/brjxoxbXnldQPN9tJzx1LDGVd/vZ7laMR4++Pc8GPa5MrXfXs2wlx8T
	2W0xk9Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjEib-0000000HMOf-1ozl;
	Sat, 15 Feb 2025 09:44:13 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjEeM-0000000HLax-3GTH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 09:39:51 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-ab7fa1bc957so510022966b.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Feb 2025 01:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739612389; x=1740217189; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=690yNEMRJUQKTJ4PZeQTvHRlaj1/iV8n9Szh8khPTAs=;
        b=i34wCbYwWG0TFnp9mA+Bzq6Cj5WsLOiyJKcq7YSmeMKh0CUTmr4zxIQKhAh2sutBTo
         OtvFDvlNt+xA92+hp8mODQiZn/RGFtcwsY7FUnQi9AMNihnwusGkdeSMzYxo9sB8s51u
         qpwXWfJqaQ4jKoe/yIgX0741rpbKByqMDg3yCaqdG2juAgnANWb4/9LIwIl5DLfWPDZW
         jS+4ri5hDowBAk19sFZKtUTdBsf7h2rmbmsyR8IGnqruvFXLbC7JcvfRHKEz1dLnG1mU
         W5WKPi5EX61vAvoAlk3PzyGE54hniVrCn9F9DRLbuZYib0u6plnuMUJ/JjXI69qrRSz8
         KtIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739612389; x=1740217189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=690yNEMRJUQKTJ4PZeQTvHRlaj1/iV8n9Szh8khPTAs=;
        b=SSyaaYS17mPf4KrAc3WllA+Ix4vr35AhE/RlO1JrRT40FeHFN0ZQqV3nz49NXwaAR0
         y4+U4TPPWKddA/87hp1oBncu9A0xOE2I+Y9YgF+X/nEfFhT406pgJAOhhTLyEmUNjrPv
         daVugW9ZieYtEBQ8aLS4aHBzRG9leuBNRdTjER0gZhVUzdhb7hwgVnZTvQ2t5DpDZL1O
         VsxxunMxmRtZvwLt7lbmAlMxlomSlTW/BWJx33Z8xajmfhAaVh7FiPJmC0T86nvKp8gx
         WpFtJQorFOLPQ8VZMhePm3jNsRD/8S3A3k6vbu5b+CacNTw9WMlRhZ922ZTVfN4PXIou
         l+xg==
X-Forwarded-Encrypted: i=1; AJvYcCWQbeY6suQTyElZZD31C96fNU0Mlu8hFyVchlgOFFtAnAZDrM2M7U4ML5mj4Xf011Zx+jhFPJ1c4ZEErwfcoMdU@lists.infradead.org
X-Gm-Message-State: AOJu0YywvZ5JG+KHQ9bYwv2qSdjc4yCY50ZVOnSQv4vIcszqWuLbnFvo
	T47ywkCinKKgMMfvfB82cfJJJ1j3Dt/Qs4fGK5I++1tjuBKkC0eS
X-Gm-Gg: ASbGncsBXTxVjaKsms8X0M8RY2T2yWvssD+/KPJnlTN7AUbe5SVDmsqn/a7cnhjDzoc
	JoAG1BKDUsySmqCGKt/xm8d0aJB43fT4xZ3EiucPNH8+hhinKQ5fE3UbRhoTuoJgmDuizavqLwm
	joaGM/IRfB4aeFZhg4DNKFroZ3E6gJ583FJuKR77SPxgXMy6VjXKbr8+9Ggtc80AuVTspkTVjB8
	snkiArwHpBwQAJjGAJSiLt1tPc2L55SuKuPhcIcsGNvZgkevC06thIRlOj9QxDdcD4Z0aNSiRvo
	2pMj7YqpvIqKMmbJxMdu3wHuFSuOWQ+ka39SRE35vTQEhRV9dIecJ0CXfUfCzQ==
X-Google-Smtp-Source: AGHT+IGRt2lvRvkQVFVRuLTCOx2v96wzbj/nYz9InSF2pKokdGYUIbB2j6Hc4x4sHep58Tdi8XfSoA==
X-Received: by 2002:a17:907:60d6:b0:ab7:ef48:1668 with SMTP id a640c23a62f3a-abb711c382fmr182639366b.57.1739612388994;
        Sat, 15 Feb 2025 01:39:48 -0800 (PST)
Received: from hex.my.domain (83.8.115.239.ipv4.supernova.orange.pl. [83.8.115.239])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb7aecd3d5sm69698966b.148.2025.02.15.01.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 01:39:47 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sat, 15 Feb 2025 10:39:37 +0100
Subject: [PATCH v4 2/9] dt-bindings: mfd: brcm,bcm59056: Add compatible for
 BCM59054
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250215-bcm59054-v4-2-dbfb2d76a855@gmail.com>
References: <20250215-bcm59054-v4-0-dbfb2d76a855@gmail.com>
In-Reply-To: <20250215-bcm59054-v4-0-dbfb2d76a855@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739612381; l=4241;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=IXmy1wf9hQDBFD9ExgsaM7f4FQfMLJwJNC7wgFzoiQw=;
 b=3QR9JLkpHbg4uaWGeMx5lFIUF/L+fawYMGrzvwrd6dbSkAWUuSKciSpG+f8Cbbmy6ugqiPH4c
 KA+qlzshrURDqljsyhSBh663jbW0DV+Vev80QfCFzLJcnMF2j16hDOs
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_013950_821657_88650BCB 
X-CRM114-Status: GOOD (  16.75  )
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
 .../devicetree/bindings/mfd/brcm,bcm590xx.yaml     | 26 +++++++++-
 .../bindings/regulator/brcm,bcm59054.yaml          | 56 ++++++++++++++++++++++
 2 files changed, 80 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/brcm,bcm590xx.yaml b/Documentation/devicetree/bindings/mfd/brcm,bcm590xx.yaml
index ec02486978efdc66846b33963f075b79184425fb..d9977091e9da2055c7ee1187210aa03844385971 100644
--- a/Documentation/devicetree/bindings/mfd/brcm,bcm590xx.yaml
+++ b/Documentation/devicetree/bindings/mfd/brcm,bcm590xx.yaml
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


