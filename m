Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB7BC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 05:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nY2bkwe4Ms1YR5T2qpLvwGyBuZUiXgIpzcZu8MUXFDI=; b=CKgP5QSdF9XCm9jLfqKC62J/I0
	QoQXIf6WnNFHpe/ZTkEY79Q6J13iJwhTNGdxGUBsZ8boso/ps6HJczMSVZmEBf9OX8lFMVI4yHFKJ
	jTht+D+FNdPzmqfOKpfI0mRr7JeiWG9SVLOpU5FbMWRAhy1q74qA04n6qFqrNknYXsEnjmUhdPc/7
	1iwgzkfYMLmEky9zhpCCkmaDA3Vg0OlZPO09M2DvJ19k0slGpgrV4uzGsT9H48305tQO6K/sMnqau
	SdYL4Xi4CdQ/M8wsryEamvsjm0KgApbmz1k2aVOYskDSl89rX8QuqNeSMqH2A01voJNEVfUfsQwYm
	W83tz36g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCAkx-0000000APwX-1xnC;
	Tue, 06 May 2025 05:22:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC7wl-00000009j5O-29WJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 02:22:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C185629CB;
	Tue,  6 May 2025 02:21:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7226C4CEE4;
	Tue,  6 May 2025 02:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746498134;
	bh=WwQNWZIozN2u7MiGY37rkvfNiCqmdGGwWW/oTcOrhIo=;
	h=From:To:Cc:Subject:Date:From;
	b=cW3f+epTDMJ0pFITUeQWYQLmP+nRxKGT3UTgGn2S7txOjpaxghbPvjJdNWLL1ssFT
	 uw/j0outlVGIri6j7UiYXAnHWzhIu32Fxmp83ryGjQhlGwyh7MCU5BOfmVDumbpiXO
	 mS3uQ2/FRKJL6rR5yUlkFzvfnZDzQr7OVNXlq/cQo4TnH2CdK4+N3+E0anlJ4whiZ+
	 B60SVH1tkYvOzuTXn558X6ZoX609GxU4pXKOfDvXC3/nZxS8+VWOlZOxHHdMBnIQKK
	 ZHLqewR4eY5WJu5E6AFU32hHWPovgzVSXfBZlvamFn3WVwnaTG0SVS5NDSlyOTPEOQ
	 qlATpXNe+curw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Vladimir Murzin <vladimir.murzin@arm.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: timer: Convert arm,mps2-timer to DT schema
Date: Mon,  5 May 2025 21:22:09 -0500
Message-ID: <20250506022210.2586404-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Convert the Arm MPS2 Timer binding to DT schema format. It's a
straight-forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/timer/arm,mps2-timer.txt         | 28 -----------
 .../bindings/timer/arm,mps2-timer.yaml        | 49 +++++++++++++++++++
 2 files changed, 49 insertions(+), 28 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/timer/arm,mps2-timer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/arm,mps2-timer.yaml

diff --git a/Documentation/devicetree/bindings/timer/arm,mps2-timer.txt b/Documentation/devicetree/bindings/timer/arm,mps2-timer.txt
deleted file mode 100644
index 48f84d74edde..000000000000
--- a/Documentation/devicetree/bindings/timer/arm,mps2-timer.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-ARM MPS2 timer
-
-The MPS2 platform has simple general-purpose 32 bits timers.
-
-Required properties:
-- compatible	: Should be "arm,mps2-timer"
-- reg		: Address and length of the register set
-- interrupts	: Reference to the timer interrupt
-
-Required clocking property, have to be one of:
-- clocks	  : The input clock of the timer
-- clock-frequency : The rate in HZ in input of the ARM MPS2 timer
-
-Examples:
-
-timer1: mps2-timer@40000000 {
-	compatible = "arm,mps2-timer";
-	reg = <0x40000000 0x1000>;
-	interrupts = <8>;
-	clocks = <&sysclk>;
-};
-
-timer2: mps2-timer@40001000 {
-	compatible = "arm,mps2-timer";
-	reg = <0x40001000 0x1000>;
-	interrupts = <9>;
-	clock-frequency = <25000000>;
-};
diff --git a/Documentation/devicetree/bindings/timer/arm,mps2-timer.yaml b/Documentation/devicetree/bindings/timer/arm,mps2-timer.yaml
new file mode 100644
index 000000000000..64c6aedd7e8e
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/arm,mps2-timer.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm,mps2-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM MPS2 timer
+
+maintainers:
+  - Vladimir Murzin <vladimir.murzin@arm.com>
+
+description:
+  The MPS2 platform has simple general-purpose 32 bits timers.
+
+properties:
+  compatible:
+    const: arm,mps2-timer
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-frequency:
+    description: Rate in Hz of the timer input clock
+
+oneOf:
+  - required: [clocks]
+  - required: [clock-frequency]
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
+    timer@40000000 {
+        compatible = "arm,mps2-timer";
+        reg = <0x40000000 0x1000>;
+        interrupts = <8>;
+        clocks = <&sysclk>;
+    };
-- 
2.47.2


