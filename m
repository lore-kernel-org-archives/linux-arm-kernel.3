Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 957C5F3ED5D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 18:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O1ScsqIgcchK6ddkznfoLoUzc44ntc6r+7NNgsSVREk=; b=zznowXkEgZQUdOxTzYOiPjXmN5
	+XEksu4jJpjSYZ2KKCt7PUQ/re65sxOHCt3sAUlpWF2nJbdm7qMtgHgtWzTCEXx89SBHggSuEB1C+
	UgOhjBTJldOz7znz245Inr9784DTh9MZDlXyHDKRO9qvWFrw+C27Don2EVdnz8Di/VuCPabGrRArr
	SySkyq7YCVCHutJJYqvw18D8ibUJrwN8ne7A4HhtCmSPpC3lazGs41AdkSNZiP1UhS1m1lKwIy6zk
	e68FjeLnS30Yo+SHMkvVc3+mNXjQJet9QpvEu4Bew451IpZ7jBZmM2wQwDEfUvHE9kBdjw5bZcuM6
	ke/k/CIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBdCc-0000000DiRB-3PU5;
	Sat, 11 Apr 2026 18:37:06 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBdCa-0000000DiQo-2PT6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 18:37:05 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-82cf636dac8so1512334b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Apr 2026 11:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775932623; x=1776537423; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O1ScsqIgcchK6ddkznfoLoUzc44ntc6r+7NNgsSVREk=;
        b=CSaS8/cTH181VCBayw8PY/bOR8AkonOOXqaMIz4kl3ztp6vG8w1Cx013gJByR0Hv3t
         PXutQk4AuT/bMx4c9uPM13qEKmYK2nW9pzn76KTDwtmqdmaJjQIk5CyhMQ2/TTh0X9QC
         FdkS3+5JpNXVg85ljUaOXl3mTVfY8HR8Sn67VeTf5RlR9MVx//zJ6ECzXGLgGmMWWNE9
         8W1eRg9kacEhDMkiK5ewIf1AxaMsZ+5QLeDJXdQSNQwvrvi7mr1NUrpunZB8xOLH6WTI
         VU+L2JuMdHcOXNSv8ah9BPtXu0YDmAlp6qroI7bk4OVkuFDafQ4BZaqBmFT1BAhVMR72
         wEkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775932623; x=1776537423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1ScsqIgcchK6ddkznfoLoUzc44ntc6r+7NNgsSVREk=;
        b=WO9LtEKjM86x91S30i1KgsHfFtEPS82K82NxKNBVtceXLi2en5ro33vW2Px4Rfbiw9
         euhqNJO6Xqj1CoN2UqM4weJLCiyvNyxFa4bGZ9tY4WwMn/YqBGNY09bPt3Eg1m+2W5ln
         bIxXwe6dXyDnhPOjnjvahtruMLiCxPoF3qVQm5FxMIFBVX+zS9K7woWGLcDvrzyTMfPV
         QlscA1z4LLyhHuOBQg5kvl7oDxprIlijXf30ZVrfJnIL5zGZo3vyW2NSo9lIalZcsBza
         EfHKln+JOj5Qw8+U1x4ny+j5LkR7ECn9hQuOd7HEMOb0Q4YswrP1DjJmrs5aoTs4tQO8
         W6Og==
X-Forwarded-Encrypted: i=1; AJvYcCWTrjpFw9xZqKFZZ98jsEUXAVads8oZMHtKMB/KQ3GWBwaxUBKDUsiphKRVnAW87Bdznh93NXiwsSJXQk9jn/hl@lists.infradead.org
X-Gm-Message-State: AOJu0YzYSVRUQKNzacn7GmHleKaS6qRxOd67ZLOq2tF1xQ2ByJhmc62w
	6Um+c1ltMGkhwfgHXMXgRsQxk5YKtqvfFVwCxOwsqR+jsRlJKlI9zSFB
X-Gm-Gg: AeBDievXQuKAArkdrZRMDunbn3pBCt5kmxTBuywEg/K/FQyqtGcWYYdpi3HkebT24dW
	4sJJfpKOE7RYXFb286+6g8oqM9XdSshGPOsXPZ03eCxE5vOzsDWe1cKfy8hMcxVhhXFQN93Tm9b
	TcBxr/MPsruSw1wCkqNbfR78h9HJZj29hZyoG+elvMIZVc2tBGLwQTUUxfanR+ldhzhoqIHakFM
	qA7bY7s98EDZTRy8uLHwmKXnvH0gszL16ewEnFV79da0FmiU7Z1x9mwC8WR0EkPf6lZ9gJVFMIB
	xO1YWXCm/f8+DudmbBBugiTlFEcxW26tb5uFAwtS6+Sdg0oyvbCKoTS00PsGuzsin9UcIiBSeXq
	1gabAZ+tgVOg3S6PVLm2VbJ+OpSIO0EpfhsRSHNiJYE3spPPh9D4hM60CjS1hVlXkiVNkwbNClL
	Sr7Qz/T7bTuzXne3ofE9w8XcAojg==
X-Received: by 2002:a05:6a00:450d:b0:82c:ec3d:28b1 with SMTP id d2e1a72fcca58-82f0c402644mr8116511b3a.51.1775932622965;
        Sat, 11 Apr 2026 11:37:02 -0700 (PDT)
Received: from snowman ([2400:7be0:12:e4dd:27b5:1cbd:36ed:c390])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c337b1dsm7350091b3a.18.2026.04.11.11.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 11:37:02 -0700 (PDT)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	liviu.dudau@arm.com,
	sudeep.holla@kernel.org,
	lpieralisi@kernel.org
Cc: pawel.moll@arm.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH v2] dt-bindings: ARM: arm,vexpress-scc: convert to DT schema
Date: Sun, 12 Apr 2026 00:03:55 +0530
Message-ID: <20260411183355.8847-1-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_113704_658605_0E6A4092 
X-CRM114-Status: GOOD (  16.84  )
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
Changelog:
v1 -> v2:
- Modified compatible string to use an enum instead of a generic pattern.
- Updated maintainers list.

 .../bindings/arm/arm,vexpress-scc.yaml        | 53 +++++++++++++++++++
 .../devicetree/bindings/arm/vexpress-scc.txt  | 33 ------------
 2 files changed, 53 insertions(+), 33 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/arm,vexpress-scc.yaml
 delete mode 100644 Documentation/devicetree/bindings/arm/vexpress-scc.txt

diff --git a/Documentation/devicetree/bindings/arm/arm,vexpress-scc.yaml b/Documentation/devicetree/bindings/arm/arm,vexpress-scc.yaml
new file mode 100644
index 000000000000..9b8f7e0c4ea0
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/arm,vexpress-scc.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/arm,vexpress-scc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM Versatile Express Serial Configuration Controller
+
+maintainers:
+  - Liviu Dudau <liviu.dudau@arm.com>
+  - Sudeep Holla <sudeep.holla@arm.com>
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
+      - enum:
+          - arm,vexpress-scc,v2p-ca15_a7
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


