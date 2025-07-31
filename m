Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3FC9C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 22:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3NZ6SufYrkjXdgD6YyUWmxuMnyEMDpHdR4fnqfnN0PY=; b=n9IdtAWXV6Tstc9tPP9n9lx4kp
	d6RnVW4XILQoO30nHMVetkytiZp6oDCQzif778oN6KyKaLvwFpOAvu2l/hwKa6/oEPzRKqQe61i1u
	s2NQgCYLVG0XX75TS6ZhUDIk/c8WZ9m5ve1YMjxfktmtqW4LwttHeWsCXXNaB/JG+8Mk6/9t7DonG
	qgvIawU6KgfBED9ZldAbu/AncuhaK+lewLiwBXDQ0/iCMAbtvIYDFctPn5prVC0EywgcyJVKLdhZS
	fM1Pdih9pqkCPildaxxuZbCKHpw+O4PSYrA84CGjP/d3K/6KI0uL9wmhYSaZgjimfjJVARRWd4H48
	FUmJtOBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhblG-00000004YNU-3WGF;
	Thu, 31 Jul 2025 22:28:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhbW0-00000004XBP-2wHD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 22:12:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5DE32463F8;
	Thu, 31 Jul 2025 22:12:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DE92C4CEEF;
	Thu, 31 Jul 2025 22:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753999964;
	bh=0kFL/C/HEWZ7M63kG+iOdTn4GO2S1xBbGOGTtJ8z7AU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NSufTE42qvM3qg+eoMVzRekmq5HV2zU9DsPTV8PcbUnk49s3/opccp9/r9nRriXgw
	 DfePqI1+sRuRDtI6hXXQcIBcbwMOHQ84oVunKRVMq/mWGjhaU6WVRgrAt9DEZld6k/
	 yJFyW0NhLIZqoU+FBDxvijhVyqZfVn+Ah31oNJyjfyJjpxLHRZkbFGrydB0fLx+vFI
	 i2bB+B/Bt8a1qxDu3NSZjDYrlqTwZh1q3DO1AqQiAJPMufBUI7qDBvfzlg3z3ItNLu
	 FBKPrtcbhMbI+VmIpBxNI68r85IMFrhmBbRFQ8ZamDDj90JEmJq0tc/ZeeeRO3Yn7o
	 NjnK6AoKUlPOg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 31 Jul 2025 17:12:22 -0500
Subject: [PATCH 5/6] dt-bindings: fsi: Convert fsi-master-gpio to DT schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250731-dt-fsi-cleanups-v1-5-e7b695a29fc3@kernel.org>
References: <20250731-dt-fsi-cleanups-v1-0-e7b695a29fc3@kernel.org>
In-Reply-To: <20250731-dt-fsi-cleanups-v1-0-e7b695a29fc3@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Eddie James <eajames@linux.ibm.com>, Ninad Palsule <ninad@linux.ibm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-fsi@lists.ozlabs.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_151244_785091_E08EEBC7 
X-CRM114-Status: GOOD (  13.55  )
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

Convert the GPIO-based FSI master binding to DT schema format.

Drop the "fsi-master" compatible as it has not be used consistently and
doesn't represent anything.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/fsi/fsi-master-gpio.txt    | 28 ----------
 .../devicetree/bindings/fsi/fsi-master-gpio.yaml   | 63 ++++++++++++++++++++++
 2 files changed, 63 insertions(+), 28 deletions(-)

diff --git a/Documentation/devicetree/bindings/fsi/fsi-master-gpio.txt b/Documentation/devicetree/bindings/fsi/fsi-master-gpio.txt
deleted file mode 100644
index 1e442450747f..000000000000
--- a/Documentation/devicetree/bindings/fsi/fsi-master-gpio.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-Device-tree bindings for gpio-based FSI master driver
------------------------------------------------------
-
-Required properties:
- - compatible = "fsi-master-gpio";
- - clock-gpios = <gpio-descriptor>;	: GPIO for FSI clock
- - data-gpios = <gpio-descriptor>;	: GPIO for FSI data signal
-
-Optional properties:
- - enable-gpios = <gpio-descriptor>;	: GPIO for enable signal
- - trans-gpios = <gpio-descriptor>;	: GPIO for voltage translator enable
- - mux-gpios = <gpio-descriptor>;	: GPIO for pin multiplexing with other
-                                          functions (eg, external FSI masters)
- - no-gpio-delays;			: Don't add extra delays between GPIO
-                                          accesses. This is useful when the HW
-					  GPIO block is running at a low enough
-					  frequency.
-
-Examples:
-
-    fsi-master {
-        compatible = "fsi-master-gpio", "fsi-master";
-        clock-gpios = <&gpio 0>;
-        data-gpios = <&gpio 1>;
-        enable-gpios = <&gpio 2>;
-        trans-gpios = <&gpio 3>;
-        mux-gpios = <&gpio 4>;
-    }
diff --git a/Documentation/devicetree/bindings/fsi/fsi-master-gpio.yaml b/Documentation/devicetree/bindings/fsi/fsi-master-gpio.yaml
new file mode 100644
index 000000000000..21bfbad595b3
--- /dev/null
+++ b/Documentation/devicetree/bindings/fsi/fsi-master-gpio.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/fsi/fsi-master-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: fsi-master-gpio
+
+maintainers:
+  - Eddie James <eajames@linux.ibm.com>
+
+allOf:
+  - $ref: /schemas/fsi/fsi-controller.yaml
+
+properties:
+  compatible:
+    items:
+      - const: fsi-master-gpio
+
+  clock-gpios:
+    description: GPIO for FSI clock
+    maxItems: 1
+
+  data-gpios:
+    description: GPIO for FSI data signal
+    maxItems: 1
+
+  enable-gpios:
+    description: GPIO for enable signal
+    maxItems: 1
+
+  trans-gpios:
+    description: GPIO for voltage translator enable
+    maxItems: 1
+
+  mux-gpios:
+    description: GPIO for pin multiplexing with other functions (eg, external
+      FSI masters)
+    maxItems: 1
+
+  no-gpio-delays:
+    description:
+      Don't add extra delays between GPIO accesses. This is useful when the HW
+      GPIO block is running at a low enough frequency.
+    type: boolean
+
+required:
+  - compatible
+  - clock-gpios
+  - data-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    fsi-master {
+        compatible = "fsi-master-gpio";
+        clock-gpios = <&gpio 0>;
+        data-gpios = <&gpio 1>;
+        enable-gpios = <&gpio 2>;
+        trans-gpios = <&gpio 3>;
+        mux-gpios = <&gpio 4>;
+    };

-- 
2.47.2


