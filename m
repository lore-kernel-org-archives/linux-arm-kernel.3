Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54304C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 05:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cvs8LAS7Huj3bMJpCAxAacy2DIEjuJcgg/WN2oc764E=; b=4UHsBCe9QDAhl4khWs9vToKqrT
	qLZkbRl092wgxY+VQQdjJQoF66oQln5ki0VZnMijTwdDKmpcOa7bCP5E3xRPC8NVEPc3hkMLljGQR
	Pl6Nu4Uun18ZKFiitv3GjJQTVtZNsrF3IpFX4qjdBlevJe0Sbtl0CaxPg0dmHppiXKiL6M8NPzwIX
	sgpvQ2BWgIPjgK8jz29YQtvB+Q3BX9KQYNk0/PlosfFKzprIArtji5zfcKN3vgjkGiGPVt09eOk57
	7Vo3rHIj11Xd8DRo+q9Mp/V2Nv7F8LEgdDQ0qHsQdxuWOC5oZfLauy2ZPLCdrI/iobPQDFBDNFvTR
	P6xKjKrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCAoy-0000000AQtb-0AWG;
	Tue, 06 May 2025 05:26:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC7xt-00000009jXF-1XsD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 02:23:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 12BAE44807;
	Tue,  6 May 2025 02:23:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77979C4CEE4;
	Tue,  6 May 2025 02:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746498204;
	bh=VYqt9DWjk14rZvscK0rSZmyFfhPRc7UasEOv2asQgE0=;
	h=From:To:Cc:Subject:Date:From;
	b=IX2absoElCxa0lrfcxKxpXMMm3r/7y7tKfSFFK+snkogVDpKeTPLx0uOG8fX7tHza
	 dNjDvkkLGHieTF0LV3Nv+NUmuKCnZMwt0r30RqaAzWgJaYyXn/uKlE5GYiphePB/b7
	 gtbKoZf6hFem3dv5EXFyPa8iUczbdlRujZVa8zNcWUNNR+gwiVack78/xnwk3r6UMV
	 90CrheoiBjqwdFlk4etxy0vb2VwrUqqc6pHO6Qw0GqAfXrbyfP6EB7zRKwuIFRfnKT
	 eyxPJldC34Tyrmugk8gDAmL9ZaFYUMOmEHMBekac9EY+dB3ZxCZybZebNpwVPP5U+B
	 UdXBwaXo5LsDA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: timer: Convert socionext,milbeaut-timer to DT schema
Date: Mon,  5 May 2025 21:23:20 -0500
Message-ID: <20250506022322.2589193-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_192325_426859_58517F57 
X-CRM114-Status: GOOD (  13.80  )
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

Convert the Socionext Milbeaut Timer binding to DT schema format.
It's a straight-forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../timer/socionext,milbeaut-timer.txt        | 17 --------
 .../timer/socionext,milbeaut-timer.yaml       | 40 +++++++++++++++++++
 2 files changed, 40 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/timer/socionext,milbeaut-timer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/socionext,milbeaut-timer.yaml

diff --git a/Documentation/devicetree/bindings/timer/socionext,milbeaut-timer.txt b/Documentation/devicetree/bindings/timer/socionext,milbeaut-timer.txt
deleted file mode 100644
index ac44c4b67530..000000000000
--- a/Documentation/devicetree/bindings/timer/socionext,milbeaut-timer.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-Milbeaut SoCs Timer Controller
-
-Required properties:
-
-- compatible : should be "socionext,milbeaut-timer".
-- reg : Specifies base physical address and size of the registers.
-- interrupts : The interrupt of the first timer.
-- clocks: phandle to the input clk.
-
-Example:
-
-timer {
-	compatible = "socionext,milbeaut-timer";
-	reg = <0x1e000050 0x20>
-	interrupts = <0 91 4>;
-	clocks = <&clk 4>;
-};
diff --git a/Documentation/devicetree/bindings/timer/socionext,milbeaut-timer.yaml b/Documentation/devicetree/bindings/timer/socionext,milbeaut-timer.yaml
new file mode 100644
index 000000000000..9ab72b762314
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/socionext,milbeaut-timer.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/socionext,milbeaut-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Milbeaut SoCs Timer Controller
+
+maintainers:
+  - Sugaya Taichi <sugaya.taichi@socionext.com>
+
+properties:
+  compatible:
+    const: socionext,milbeaut-timer
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
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    timer@1e000050 {
+        compatible = "socionext,milbeaut-timer";
+        reg = <0x1e000050 0x20>;
+        interrupts = <0 91 4>;
+        clocks = <&clk 4>;
+    };
-- 
2.47.2


