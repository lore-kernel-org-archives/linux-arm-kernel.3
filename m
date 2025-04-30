Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C0CC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 11:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uzZQqAJR+WqTIKqQI8DYjkIpauNuciSLhlQufPfaICY=; b=aUVRyA2xzo3a5YOVogi3CgIwGR
	Fstxd/n5nSMZEwapXPulWud7lXX2bmTsh4tLhG8dVr9wmZxECMnTWrTImLjG0V+Kkq8XbxAB6SFdo
	xvxKQkupzRNBsvSThu/gC2totVbXCt90UpCBaeqtxZ8jW0qZ8Ji3es7a8iTFr2qaPbDfGUPtOWD+y
	k5FhTTewSxTZg5i4Xl51QVpHeYn5OqSmHb/1papAgGAy6nR+7W3D9k/+NFxh6wgP8agxtBYxRxWhG
	VUqiJAfoezYr/XLKm6p6Oz51F10lpfE/tOnoDWSnQH8C6pCxP9HU13NoafyHNtPrbIakn2PavJMHR
	NMeip3vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA5gk-0000000ChU9-3dsU;
	Wed, 30 Apr 2025 11:33:18 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA4ue-0000000CZlD-0ViE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 10:43:37 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-22da3b26532so60748255ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 03:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746009815; x=1746614615; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uzZQqAJR+WqTIKqQI8DYjkIpauNuciSLhlQufPfaICY=;
        b=jT2kkvmUNu6hRnPK6U2PNGgcaGXOnyR7yjURV6VDtXW8cRvBcKICkjKoMMJIiwBujt
         JW2ijALHh47vVFZqxdnILtBoFSqMrIsBMpVdH45SmtO2sIE8uTbmbNFzMMU6Gz0a2w60
         AvwvuHzWLfRHvIs2Mvo5UGFc62JMi717KAgIbKd8EC8CHEU34RXcMN6NiYBE0iI/i8PQ
         uw1l3182z7Kebdy6eGFSu5kfh7ri+wf6mi7T5lHAVksAsT6fTZupd+8UeJi80wEs99wU
         EMCWumBZ+jGaJ8vIUb/DI5xlh27MqwN/62eo/zKAdyqqgB61NBL9/bxY5JKIc9QXCHYr
         tFaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746009815; x=1746614615;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uzZQqAJR+WqTIKqQI8DYjkIpauNuciSLhlQufPfaICY=;
        b=iRDkRu2hFjZ6GoBeOfQAkVBkYGorvuQbKBgTN3TWuyw/KogVIMvBvwJ+XLuJVPl4T/
         6LDSDPKebYtWYx5M5es20ikQ7OxpLPow7SxHDqA6eDK1SgrvvpReTootDlhamOFhirT2
         MfJ0er3222j8/dXnKCuD9OO8z3SqOZx0+JhSh/tqT1OLNKhjlFl9fZaTmY5TRZZ2BStM
         8WgxPL60DcS9b5/j3Q4XjjXYmPpZMVrW2AVXO+TfryeXbXopPprUW+M9N3j+x8L2jWfo
         8cBeJefVmoAq3p9FNfnOg8qHmCmRmFnaglk9OQOSdCXPM9qXDLKKrFtLAbi5FZz9fNB+
         BLdw==
X-Forwarded-Encrypted: i=1; AJvYcCW9ljQgNxasobKbDMlzhM4kXHzYz2bJT4L1PUKcbCfwV8KYPgazKJi1oXaSTw3FD+3blpLvsKUIS3en3stWdqz8@lists.infradead.org
X-Gm-Message-State: AOJu0Yyc5Z5S2LXUjSJKjcuczVN1zhPNnmump+x7AAlZI081sJ04Ms38
	bqnie3+0Ab/m28qGoQ15VS+8CJGAKT+dWkQ0ryFgBw381qRpY40Q
X-Gm-Gg: ASbGnctW9BHfLQ4S0bLYyrBo3+MUqYZxrYBRvcrQVhuW6p82iT7kzZXuOnp0QHUm8gR
	a7YUDWWE68MlGtdxTrbI2bnpuKzgiNnCMHVT9ZTywIFUa2TlmB0wbb0auXh2q82mSmYJxnEP/Yx
	CnmN1f0TFxIHuhMew+nu47qiNESx41yCDNToL30vJg0NCzSeNTj9KlfH19wtcp27lkZ3gfM1322
	aGlfVurfUPG4iPJO2+35cpFyOr09+XEUOf18HED5TZWjrv5qW04C6nUSfajGfUqAI0sSt2T6hP9
	7fvg0gQPE8Apv1RSh3GfslyJOkzNx2fwdkYleB1SkYawDLSH6uKm
X-Google-Smtp-Source: AGHT+IHrvYxDI1wKN1rkMDQ7eeuHkLXsOmiBRAnjf4RJ0ayJhK3kCarMO3qNBqmI7N4UpeLNLKZkEA==
X-Received: by 2002:a17:903:198d:b0:227:e980:919d with SMTP id d9443c01a7336-22df35bf45amr39338245ad.47.1746009814978;
        Wed, 30 Apr 2025 03:43:34 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e7a8dsm118992715ad.136.2025.04.30.03.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 03:43:34 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 30 Apr 2025 14:42:45 +0400
Subject: [PATCH v2] dt-bindings: net: via-rhine: Convert to YAML
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-rhine-binding-v2-1-4290156c0f57@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKT+EWgC/x3MQQqAIBBA0avIrBNME6yrRAvLSWczhUIE4t2Tl
 m/xf4WCmbDAIipkfKjQxR16EHAkzxElhW7QSls1GSVzIka5EwfiKBGNd86p2dgRenNnPOn9f+v
 W2gejrjv0XwAAAA==
X-Change-ID: 20250430-rhine-binding-ee3a88809351
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746009806; l=3022;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=NAKlta3XWitRCQ9CR0OeceOIu9uDJz/mQLmJc953vZc=;
 b=VQRHu3ZlD50RosJpgOF+6PVZZ5Cv2oP5/FHjW6pS9bL99am6fO+PKopyogJ245JBslAgUHZu1
 8oE61AMGgvOAujPa/xQbcZB8SPRwiahTx1WvHo98EBRm7BWCEIzdXPT
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_034336_162718_EA8C696C 
X-CRM114-Status: GOOD (  15.46  )
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

Rewrite the textual description for the VIA Rhine platform Ethernet
controller as YAML schema, and switch the filename to follow the
compatible string. These are used in several VIA/WonderMedia SoCs

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Changes in v2:
- Dropped the update to MAINTAINERS for now to reduce merge conflicts
  across different trees
- Split out the Rhine binding separately from the big series affecting
  multiple subsystems unnecessarily (thanks Rob)
- Link to v1: https://lore.kernel.org/all/20250416-wmt-updates-v1-4-f9af689cdfc2@gmail.com/
---
 .../devicetree/bindings/net/via,vt8500-rhine.yaml  | 41 ++++++++++++++++++++++
 .../devicetree/bindings/net/via-rhine.txt          | 17 ---------
 2 files changed, 41 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/via,vt8500-rhine.yaml b/Documentation/devicetree/bindings/net/via,vt8500-rhine.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..e663d5a2f014788481dfa0c612c261eb6adb6423
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/via,vt8500-rhine.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/via,vt8500-rhine.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: VIA Rhine 10/100 Network Controller
+
+description:
+  VIA's Ethernet controller integrated into VIA VT8500,
+  WonderMedia WM8950 and related SoCs
+
+maintainers:
+  - Alexey Charkov <alchark@gmail.com>
+
+allOf:
+  - $ref: ethernet-controller.yaml#
+
+properties:
+  compatible:
+    const: via,vt8500-rhine
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    ethernet@d8004000 {
+        compatible = "via,vt8500-rhine";
+        reg = <0xd8004000 0x100>;
+        interrupts = <10>;
+    };
diff --git a/Documentation/devicetree/bindings/net/via-rhine.txt b/Documentation/devicetree/bindings/net/via-rhine.txt
deleted file mode 100644
index 334eca2bf937cc4a383be87f952ed7b5acbbeb59..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/net/via-rhine.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-* VIA Rhine 10/100 Network Controller
-
-Required properties:
-- compatible : Should be "via,vt8500-rhine" for integrated
-	Rhine controllers found in VIA VT8500, WonderMedia WM8950
-	and similar. These are listed as 1106:3106 rev. 0x84 on the
-	virtual PCI bus under vendor-provided kernels
-- reg : Address and length of the io space
-- interrupts : Should contain the controller interrupt line
-
-Examples:
-
-ethernet@d8004000 {
-	compatible = "via,vt8500-rhine";
-	reg = <0xd8004000 0x100>;
-	interrupts = <10>;
-};

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250430-rhine-binding-ee3a88809351

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>


