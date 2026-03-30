Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71CAA10D149C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 11:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uzIYPQw/5COzLY48k1UwENwJKiLAR2jrBv0FayowuYM=; b=D/I1bJXMjw2uFx0lUvOxxol2F+
	69r1FKYz823IhqlBs/XqpF9Js777PscTlL7rrGJfjhpS0NcdqHaBqBODbzFi/KpYfZlD4qSCPTPP0
	schmJ3FgXOYtw4KcCaE282aeOt8swzX+6ZVu4mtx71rTfyyfhcSZi8knEQXyHVeNCVSaZJXbf0yKd
	OITfxqJHk1f4P44vPvDLbC0KiTvYkKpa+YoQf+J/vTWGDSLTL7kLMobbrpkFMD2Wmpb0lngyYFszZ
	kBxotkX5Inrwuvb771foviF4MPa5Efj+oIHbYIOgr0CJYtW+Sva++e5yC+xCRWf3gcJE/8lmP2aAl
	z2CcJADw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ANd-0000000B7wy-2uzw;
	Mon, 30 Mar 2026 11:02:01 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ANb-0000000B7w7-03hz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 11:02:00 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2b2469e5117so8278945ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 04:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774868518; x=1775473318; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uzIYPQw/5COzLY48k1UwENwJKiLAR2jrBv0FayowuYM=;
        b=Lzeb7eT/1qe9ILeWyUIkUFqJweqXYBPSqdZ76n4YYhQHpuxAebiF+1NWk6xHzA2cy5
         J0SDkZflMb905WiboRSaNEcczedLojpBqRLurUqL8pHwxL+rHaM38Rx+MDkuv24KxBs8
         QWGTcX3jtRWbUJjMhVC5Rzjz0hnSTcb3sj/wSBv4XA7xf+MCCEg0ZGxliUdcBzCShIWA
         ceOH1IJF35uzZrKPJF/upcxInLFDOHe4rAju0g2bIFQ0x/ed77BKgkyk0zrBPo6qoTIc
         GEp8XAsaGjaV4jT1lXvHWEKjM+nwaWvirgT0uDbIOiNy6YOBBsNxkaxcn30SqrzUFfPC
         kYvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774868518; x=1775473318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uzIYPQw/5COzLY48k1UwENwJKiLAR2jrBv0FayowuYM=;
        b=ohlgc/PCrZPTC7cmf+onvbRxacjRfqet2SocyECYQRjh5OXP5IYVOzj10oe5EswyJe
         gFAzopzdd8Bx4Fx4oHF3S5PzDLUaD/6cxVOWek4+NUWuSWmVU/1DOWm9GZh47OhIdGZk
         JNbc3gwkie1Di+yOJEN2pAeaE+qA10fpxjTwgpmMrW/8rDGwGVQcbNXCRnHxIfCIPMtb
         2Ot8p9bcaiLALZCN7m7ep8t9/9nhHwm5jwuUXVMbhseM27sC+egFi7CaqVtiqI6SOEak
         MILwODKn3iQD4K6jsdf5zYpwiydoiA8f3d2haxtvqvBzZYzStDWjECxrEq+S8+4tNP/t
         ozhg==
X-Forwarded-Encrypted: i=1; AJvYcCUNaIfkEZnBHH3oHa21Pq2fEJI1Fy50bltvjJA0nDLjZruo3vcGm0h5DjNA5w2lOjjItYYCOVTP4KwbQrIe0WQz@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6o4lM4iQ/Z6yMmL7TSNn41OXntAHbXoTAbAca7tRH2GeQ7Hoe
	ozEb1d8n1yib+Acc1hCsg52GfexYiBw8NzAMl7QQwsGP2VyVZf5598Tf
X-Gm-Gg: ATEYQzxArf51iynzv9VV0dyB/iNc+UvNTZRQ7I/YwQi6MvmYDOdsRh0vHOaLt1CJ2Hg
	2UVmJYxC0AlOweJ9g5qT6K6hBIQdHnqpFc0yLTVbjmR9MRO2EI10UF2cE+l+LZBKUMU+Vr8AWjn
	1xHwXcco2KXYsKer2yqu2YiSXBWD74+bH4ocXw5bxZeM0IUaHZjj7NdZcob8KcbIj1K+7xMnOIK
	C/g0G7tfLmWChUT31P16exDspu6eonU+EbQHxF2DOs7/HK5cUuqVacwSnDzJUkK/+0v1qw5R+Dk
	2sD7fxRtQK/ZEW5gLSq53z2ZBf91ccTTTjmWw/PnOZ6sDzLwdvtF3FS11r1mpm8OkLecnVWQExc
	HKp6xstI+1SIcPl0OjFDJnOIB8gtVM871wD7TdmZEH+Ag0Ednq0XneE01SBEIM4wcgbwZQWpz/T
	k9HdAaoTf0W9WQ+lVoES56+wmDNvlz4zGRPwxJpLA=
X-Received: by 2002:a17:903:b83:b0:2ae:cd8c:bd04 with SMTP id d9443c01a7336-2b0c485870amr154320775ad.10.1774868518033;
        Mon, 30 Mar 2026 04:01:58 -0700 (PDT)
Received: from snowman ([2401:4900:646d:9a6e:3eae:13fa:fe3c:864])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24279113fsm77701375ad.60.2026.03.30.04.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 04:01:57 -0700 (PDT)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: sre@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ulli.kroll@googlemail.com,
	linusw@kernel.org
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	d-gole@ti.com,
	m-chawdhry@ti.com,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: power: reset: cortina,gemini-power-controller: convert to DT schema
Date: Mon, 30 Mar 2026 16:31:34 +0530
Message-ID: <20260330110135.10316-2-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330110135.10316-1-khushalchitturi@gmail.com>
References: <20260330110135.10316-1-khushalchitturi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_040159_054370_0F259CC1 
X-CRM114-Status: GOOD (  15.98  )
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

Convert the Cortina Systems Gemini Poweroff Controller bindings to
DT schema.

Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>
---
Changelog:
v2 -> v3:
- Used generic node name "poweroff" instead of "gemini-poweroff".
v1 -> v2:
- Renamed the node from "power-controller" to "gemini-poweroff" to resolve dtschema warnings.

Note:
* This patch series is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

 .../cortina,gemini-power-controller.yaml      | 42 +++++++++++++++++++
 .../bindings/power/reset/gemini-poweroff.txt  | 17 --------
 2 files changed, 42 insertions(+), 17 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/power/reset/cortina,gemini-power-controller.yaml
 delete mode 100644 Documentation/devicetree/bindings/power/reset/gemini-poweroff.txt

diff --git a/Documentation/devicetree/bindings/power/reset/cortina,gemini-power-controller.yaml b/Documentation/devicetree/bindings/power/reset/cortina,gemini-power-controller.yaml
new file mode 100644
index 000000000000..ef5e04f86be1
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/reset/cortina,gemini-power-controller.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/reset/cortina,gemini-power-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cortina Systems Gemini Poweroff Controller
+
+maintainers:
+  - Linus Walleij <linusw@kernel.org>
+
+description: |
+  The Gemini power controller is a dedicated IP block in the Cortina Gemini SoC that
+  controls system power-down operations.
+
+properties:
+  compatible:
+    const: cortina,gemini-power-controller
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    poweroff@4b000000 {
+      compatible = "cortina,gemini-power-controller";
+      reg = <0x4b000000 0x100>;
+      interrupts = <26 IRQ_TYPE_EDGE_FALLING>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/power/reset/gemini-poweroff.txt b/Documentation/devicetree/bindings/power/reset/gemini-poweroff.txt
deleted file mode 100644
index 7fec3e100214..000000000000
--- a/Documentation/devicetree/bindings/power/reset/gemini-poweroff.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-* Device-Tree bindings for Cortina Systems Gemini Poweroff
-
-This is a special IP block in the Cortina Gemini SoC that only
-deals with different ways to power the system down.
-
-Required properties:
-- compatible: should be "cortina,gemini-power-controller"
-- reg: should contain the physical memory base and size
-- interrupts: should contain the power management interrupt
-
-Example:
-
-power-controller@4b000000 {
-	compatible = "cortina,gemini-power-controller";
-	reg = <0x4b000000 0x100>;
-	interrupts = <26 IRQ_TYPE_EDGE_FALLING>;
-};
-- 
2.53.0


