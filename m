Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962C3CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 15:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WJ3wgMAYUBjmffEpxEcFsRtBghftLqNL1ylvJ36Y1bw=; b=atd0dXYq6qdb9kDE+/3VyJGuvy
	2ci/7PXCs5RRpUU5EBpUviEpX+mFM3OwUbdRmo0MKrYXCm2cDvt/asUSKcOnziqsoz6l+Gv6KS3C+
	02mUY787i6wKgFC+p062v873NumWWmiiVYIQqm5RMe29Mm+eUMJl1YcRTXEzF34pbxb0r/6Rt0LRR
	t7002ki0pDOe/i3F1eucNDG1UXc9uPdnA0q2aFXAN9hBmbgKPwJGSzHQx2SGqwfWZ4HA+lPfd5fXx
	P8OcPtuAwCNhAR+dEAniQLBtoZWl/3gY6bnKptWSjRWgOcjYbofyuCVsIGK/cDQQ17TJ7WbYPBW0W
	E19jwPmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gyJ-0000000GqSY-3T6E;
	Tue, 14 Oct 2025 15:29:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gyI-0000000GqRk-0szu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 15:29:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 85CDC6230A;
	Tue, 14 Oct 2025 15:29:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F40A1C4CEE7;
	Tue, 14 Oct 2025 15:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760455793;
	bh=zYExi83W0RHyJrqMwtyqJRZDpbfqUykmcag8kOhkVUI=;
	h=From:To:Cc:Subject:Date:From;
	b=eMkaAH4VUyJhLA+HEJG27I9pneelGaB8Y6DWmSQOO2qeeoZXmbHeHdaRSz/LHr53U
	 JPYOf98BlNoLSMpffIHQoztBZpWlMtYt//Z+NMY0C8lTN6IkgBtGj+7sZaFBKvazQK
	 E9CtgO2JZrsSYLEub6xnkVsKyOp4AhLYEisIjvdpRIP1O2+7+P2jkRaUBf1tzHqlfH
	 Od4tZLfPZ1AKRu1RegKMPhC2hGkEE4jilFtA7C3oxCdksozbgdtDOoVcIe2rNQvbih
	 2H4v9pDdDYwYpxfza+OAhd/gDcolFANkctu1tFo+4aYdsjhR+LX7aiqEH1EE3GDS1/
	 ocRhZ/HwW3phw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Corey Minyard <corey@minyard.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: openipmi-developer@lists.sourceforge.net,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: ipmi: Convert aspeed,ast2400-ibt-bmc to DT schema
Date: Tue, 14 Oct 2025 10:29:47 -0500
Message-ID: <20251014152948.3782738-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
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

Convert the aspeed,ast2400-ibt-bmc binding to DT schema format. It's a
straight-forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/ipmi/aspeed,ast2400-ibt-bmc.txt  | 28 ------------
 .../bindings/ipmi/aspeed,ast2400-ibt-bmc.yaml | 44 +++++++++++++++++++
 2 files changed, 44 insertions(+), 28 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.txt
 create mode 100644 Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.yaml

diff --git a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.txt b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.txt
deleted file mode 100644
index 25f86da804b7..000000000000
--- a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-* Aspeed BT (Block Transfer) IPMI interface
-
-The Aspeed SOCs (AST2400 and AST2500) are commonly used as BMCs
-(BaseBoard Management Controllers) and the BT interface can be used to
-perform in-band IPMI communication with their host.
-
-Required properties:
-
-- compatible : should be one of
-	"aspeed,ast2400-ibt-bmc"
-	"aspeed,ast2500-ibt-bmc"
-	"aspeed,ast2600-ibt-bmc"
-- reg: physical address and size of the registers
-- clocks: clock for the device
-
-Optional properties:
-
-- interrupts: interrupt generated by the BT interface. without an
-  interrupt, the driver will operate in poll mode.
-
-Example:
-
-	ibt@1e789140 {
-		compatible = "aspeed,ast2400-ibt-bmc";
-		reg = <0x1e789140 0x18>;
-		interrupts = <8>;
-		clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
-	};
diff --git a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.yaml b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.yaml
new file mode 100644
index 000000000000..c4f7cdbbe16b
--- /dev/null
+++ b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-ibt-bmc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Aspeed Block Transfer (BT) IPMI interface
+
+maintainers:
+  - Joel Stanley <joel@jms.id.au>
+
+properties:
+  compatible:
+    enum:
+      - aspeed,ast2400-ibt-bmc
+      - aspeed,ast2500-ibt-bmc
+      - aspeed,ast2600-ibt-bmc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/aspeed-clock.h>
+
+    bt@1e789140 {
+        compatible = "aspeed,ast2400-ibt-bmc";
+        reg = <0x1e789140 0x18>;
+        interrupts = <8>;
+        clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
+    };
-- 
2.51.0


