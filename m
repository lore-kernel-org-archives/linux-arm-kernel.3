Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F38210F92E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 17:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZmLnySGgpX5qdaI09bcdNyFr/X6vDkvqTADZpSFZpVI=; b=CzE4pX7OfBAd1kktOXylSijJrX
	lVBmf0SrbywsVIifINheDBkoJk1AENinJijOuZ/iHQn/B4FHwA65vgk8Zuz3pY2ggasbdB6XZe/mu
	zkCajx0Nhqu6NMcJDW2SAe2iC/Qw3cCGo34B6Rs2PobVTqh9VwORQ8sNYlfOHqCO1mLPjZPucISHI
	Fr0f2OrqmqU4L4i+o7Jnlsb/S9fXF9eeN84YSTXIltPNKH4jxmZpfNJFz7lTJXwBZen45PHgwKK4W
	PkQ6VRNVagdWBSS6417z9pbTF5kcIYn6FVJHD92d76LRe5ZrMm+W/uP9tq7jixNsp4pWFw9o6N79u
	rq+YrSEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7cwA-0000000DLYv-3HnZ;
	Tue, 31 Mar 2026 17:31:34 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7cw8-0000000DLYZ-4AP8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 17:31:34 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2a871daa98fso45123235ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 10:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774978292; x=1775583092; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZmLnySGgpX5qdaI09bcdNyFr/X6vDkvqTADZpSFZpVI=;
        b=Xqe41DEIqzJ+IYk7VPkXB0L7shlz2xRpYDwufjIs3E2vZrINCfP3vP9ebWce2ZPEXK
         NoR9h5MQLUIhTzaQA2Qp+tq764xOd+3EI2q+mNgQC80Q8hYMVoEZO/4ML5zkiDh/H2oZ
         XLjIJtqkGwgMnX9wLDsT/vtZ2VPop43KaAsQ751W38z0GlsOQpSObZ7eYHVlMzEh82QD
         7/fsQDlIqKGaoUDOztt0WXmLGUenIq7TKf2FcBOLJ9CC66nGuXQBcTwalqUzM8eLJT+p
         pEUAgeuaXvEaHWWZsfWNRGZ+DUmQ141+N+jXsawPPWKewl1DllSI9P7azj2SriDM7sl+
         jv+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774978292; x=1775583092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZmLnySGgpX5qdaI09bcdNyFr/X6vDkvqTADZpSFZpVI=;
        b=aVBgog7h892Lu1DCUTGg4ZPlZU0xsN1bvfxH7llkWXe0tIxsSDP5ARNZ9fqBVvIZKQ
         Ps+Uz4Dhq4i6bKh4bXc+0ozf0E/xc4TeeNRKhaP+1U33tUiCQ9X68mIwCPcqASg/UiJw
         tLo6plaw4NR46+ELJT4xIBNSaBtFmmlAOiagRFwI2pA2elG/GlJJIon/od8MO55eTpP9
         Tc5cAeemZ+sDzuP5vFeNbugxop+Zsuj1u8h4QWZnwNWn/FnKoYhIe3qMEegFMo0f0how
         W1RS1GLDjhFc2YROkijj7m2n2FyFFCIOS2Sx9MHuL5OuZHA1I6QdwvCGkDV4buaupSEv
         0aUA==
X-Forwarded-Encrypted: i=1; AJvYcCV2lsaJVEHulSU9FVWCPTv3i5YwwvkTGC3qSWs2lqzPfblqUQ1SqsqF+yUOQ9GSgNrXTDmwdoLADbvXQ9twdYXR@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4OBH+wwualyDCcr7PUJBrsXb9id2vBbpQc+Dimv40aq4g4NAX
	NDzFVrE06iuUBVAneQNFBEwNeKUfBHRb8fiT+7M/2JhdxVyxaAvRKT/C
X-Gm-Gg: ATEYQzyBcN2ALTPYt56aIcDyLMUqtrPYAELRhGxHe+2/1VoDt4+748fvyFnfBI5R8xB
	Bw9NPpX4dn9hGF75rnyUMryrlSNVBkzfCVK63S+lmIgmYcnB7LsumjSOshS4hm+FqHX2qcREmsv
	Ubx3GQOBA2yi2cSr13i2lHwHmhz9XivIY8liB8AtaYfP7Pp1a/MGVkMm0iF9vqy7nYM3SN43CCR
	IglQzeYE5Eu5KfqPNa3CtdKXONdPzZinQU96EL1Zm41iXr756ZfCDe3Zxqkus+7KB+8SMMCZq0E
	UwgkFRNjdiFFYWsVqQPdMEU3qx3/Ui6jVI9nGa5wgdrdSTFHBaVJPv9Fd1/3sCfgyxg88pQ+wHc
	eYXiQb7IpbJSBIAchPzd2KwI66mY1MjH2WVoSLBIsJmqlhnRku82zCXd3vWSOcLOPBmVQJJR+0i
	yZzMZ66CJYIEypt0DAiX+SXjUTX55I8Q==
X-Received: by 2002:a17:902:e78c:b0:2b0:665b:c7de with SMTP id d9443c01a7336-2b269cbe40emr468325ad.40.1774978291526;
        Tue, 31 Mar 2026 10:31:31 -0700 (PDT)
Received: from snowman ([2401:4900:646d:8c67:2583:bc87:aa68:3bee])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24265aa9fsm114499935ad.20.2026.03.31.10.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 10:31:30 -0700 (PDT)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	liviu.dudau@arm.com,
	sudeep.holla@kernel.org,
	lpieralisi@kernel.org,
	pawel.moll@arm.com
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH] dt-bindings: arm: arm,vexpress-scc: convert to DT schema
Date: Tue, 31 Mar 2026 22:59:59 +0530
Message-ID: <20260331172959.35745-1-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_103133_038777_6020A130 
X-CRM114-Status: GOOD (  16.45  )
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

Convert the ARM Versatile Express Serial Configuration Controller
bindings to DT schema.

Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>
---
Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

 .../bindings/arm/arm,vexpress-scc.yaml        | 51 +++++++++++++++++++
 .../devicetree/bindings/arm/vexpress-scc.txt  | 33 ------------
 2 files changed, 51 insertions(+), 33 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/arm,vexpress-scc.yaml
 delete mode 100644 Documentation/devicetree/bindings/arm/vexpress-scc.txt

diff --git a/Documentation/devicetree/bindings/arm/arm,vexpress-scc.yaml b/Documentation/devicetree/bindings/arm/arm,vexpress-scc.yaml
new file mode 100644
index 000000000000..7870410211a0
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/arm,vexpress-scc.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/arm,vexpress-scc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM Versatile Express Serial Configuration Controller
+
+maintainers:
+  - Pawel Moll <pawel.moll@arm.com>
+
+description: |
+  Test chips for ARM Versatile Express platform implement SCC (Serial
+  Configuration Controller) interface, used to set initial conditions
+  for the test chip.
+
+  In some cases its registers are also mapped in normal address space
+  and can be used to obtain runtime information about the chip internals
+  (like silicon temperature sensors) and as interface to other subsystems
+  like platform configuration control and power management.
+
+properties:
+  compatible:
+    items:
+      - pattern: "^arm,vexpress-scc,[a-z0-9_-]+$"
+      - const: arm,vexpress-scc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        scc@7fff0000 {
+            compatible = "arm,vexpress-scc,v2p-ca15_a7", "arm,vexpress-scc";
+            reg = <0 0x7fff0000 0 0x1000>;
+            interrupts = <0 95 4>;
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/arm/vexpress-scc.txt b/Documentation/devicetree/bindings/arm/vexpress-scc.txt
deleted file mode 100644
index ae5043e42e5d..000000000000
--- a/Documentation/devicetree/bindings/arm/vexpress-scc.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-ARM Versatile Express Serial Configuration Controller
------------------------------------------------------
-
-Test chips for ARM Versatile Express platform implement SCC (Serial
-Configuration Controller) interface, used to set initial conditions
-for the test chip.
-
-In some cases its registers are also mapped in normal address space
-and can be used to obtain runtime information about the chip internals
-(like silicon temperature sensors) and as interface to other subsystems
-like platform configuration control and power management.
-
-Required properties:
-
-- compatible value: "arm,vexpress-scc,<model>", "arm,vexpress-scc";
-		    where <model> is the full tile model name (as used
-		    in the tile's Technical Reference Manual),
-		    eg. for Coretile Express A15x2 A7x3 (V2P-CA15_A7):
-	compatible = "arm,vexpress-scc,v2p-ca15_a7", "arm,vexpress-scc";
-
-Optional properties:
-
-- reg: when the SCC is memory mapped, physical address and size of the
-       registers window
-- interrupts: when the SCC can generate a system-level interrupt
-
-Example:
-
-	scc@7fff0000 {
-		compatible = "arm,vexpress-scc,v2p-ca15_a7", "arm,vexpress-scc";
-		reg = <0 0x7fff0000 0 0x1000>;
-		interrupts = <0 95 4>;
-	};
-- 
2.53.0


