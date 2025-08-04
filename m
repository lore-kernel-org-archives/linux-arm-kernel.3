Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB6FC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 15:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7BdDyeXNR+ncRe9UxbtOY4iObNp86fe42fYo4B+1O6U=; b=3nH5yz1Mj+f/G7DOpkfF1Tyqjn
	CMgYnF5CrdiNKmFwyPdOO2Y5qSFyAhACMSmSldfGo6gWUTTq6oLme2qE0noz74doQCivZXfbQEmud
	O7B2cTorXQFxkLN3PTzxHKLdTVEV6w3Zc6IaIMFthETOslZLQbwTllPIt2yxTjdZKiF/cnqfjaY5Z
	9gGSnB7sAZL2+0aqvKMjIeADj4JD0ZUaa3/97vgtBPigSUilHmImqK3R197IpfmFdwV1/ol6uarfN
	k7Y0L0qhZ9HI2jYgaJso2PxwO2bsZ/NYOi5YFVz/AuP3Wz7xnDefHRP0taSWQqSaMAfPaUQslgXOK
	FKSXeXCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiwpF-0000000AkhF-0m7A;
	Mon, 04 Aug 2025 15:10:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiw7v-0000000Af9X-0jQc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 14:25:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 74DA645DF9;
	Mon,  4 Aug 2025 14:25:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3BCB0C4CEF0;
	Mon,  4 Aug 2025 14:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754317522;
	bh=phXVktnsQFsRlCPE6gQZzgzGOtAWOzVU4TdMa++7y/o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AIzpMlPDVnGXezvDECm4IubKoW3sHxSkk8/TRBOLjyRdhxEOIQDpagLmRRRwdme8a
	 2WFkjR0Fo/edEN7jD1ZgYrVyk8p6AssX3jqUx6pnz6OViiEiIyWuvHffBhz/hY96F3
	 uL0CpFBSjNcH+xeemMpj9iBp32mdO4wLhryOx2FxsjxI9vfdn1sRvbK0xrfXopMW4D
	 Q+LmALnrUqMgcblaiMJEsx/+cnXhr8+VBe+hUrWDCqCVWzgY7TWNPwsbr2i8e2LTWn
	 DjmAU4q86kLWDwrNwCEj+MwqewIzYZO6PLkethQD4sWI/Jv7fIuThcKhxlwvehTqg7
	 Z04lOp14fcpzA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3036CC87FD1;
	Mon,  4 Aug 2025 14:25:22 +0000 (UTC)
From: Thomas Antoine via B4 Relay <devnull+t.antoine.uclouvain.be@kernel.org>
Date: Mon, 04 Aug 2025 16:26:39 +0200
Subject: [PATCH v5 2/4] dt-bindings: power: supply: add support for
 MAX77759 fuel gauge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250804-b4-gs101_max77759_fg-v5-2-03a40e6c0e3d@uclouvain.be>
References: <20250804-b4-gs101_max77759_fg-v5-0-03a40e6c0e3d@uclouvain.be>
In-Reply-To: <20250804-b4-gs101_max77759_fg-v5-0-03a40e6c0e3d@uclouvain.be>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dimitri Fedrau <dima.fedrau@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, Thomas Antoine <t.antoine@uclouvain.be>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754317658; l=3442;
 i=t.antoine@uclouvain.be; s=20241202; h=from:subject:message-id;
 bh=/JRl4+oKCLeCuqYwla/ChjnUkO3GOKVE7rQTxDRH5UQ=;
 b=tgtf8lqDV0ObDF50iRsgPV1Unq9+iIRAg+SVhyYpWX3tGCMpZB1+Vp5TRqf0bItrLaWJRaSXD
 jP8ijQYNxeMAs3RY+62WWnpJ1nea18tByTxj2rCoBfOakT7zAYND03I
X-Developer-Key: i=t.antoine@uclouvain.be; a=ed25519;
 pk=sw7UYl31W1LTpgWRiX4xIF5x6ok7YWZ6XZnHqy/d3dY=
X-Endpoint-Received: by B4 Relay for t.antoine@uclouvain.be/20241202 with
 auth_id=289
X-Original-From: Thomas Antoine <t.antoine@uclouvain.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_072523_260554_9FC97C3F 
X-CRM114-Status: GOOD (  16.22  )
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
Reply-To: t.antoine@uclouvain.be
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Thomas Antoine <t.antoine@uclouvain.be>

The Maxim MAX77759 is a companion PMIC for USB Type-C. It contains
Battery Charger, Fuel Gauge, temperature sensors, USB Type-C Port
Controller (TCPC), NVMEM, and additional GPIO interfaces

Use max77759-fg compatible to avoid conflict with drivers for other
functions.

The battery node is used to pass the REPCAP and ICHGTERM values
needed for the initialization of the fuel gauge.

The nvmem cells are used to get initialization values and to backup
the learning and the number of cycles. It should work out of the box
with gs101-oriole and gs101-raven which were previously running
Android.

Signed-off-by: Thomas Antoine <t.antoine@uclouvain.be>
---
 .../bindings/power/supply/maxim,max77759.yaml      | 76 ++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/supply/maxim,max77759.yaml b/Documentation/devicetree/bindings/power/supply/maxim,max77759.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..5e160e3ad86849f9ee0be54e20e195fc455eba6d
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/maxim,max77759.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/supply/maxim,max77759.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim Integrated MAX77759 fuel gauge
+
+maintainers:
+  - Thomas Antoine <t.antoine@uclouvain.be>
+
+properties:
+  compatible:
+    const: maxim,max77759-fg
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  shunt-resistor-micro-ohms:
+    description: The value of the current sense resistor in microohms.
+
+  monitored-battery:
+    description: |
+      The fuel gauge needs the following battery properties:
+      - charge-full-design-microamp-hours
+      - charge-term-current-microamp
+
+  nvmem-cells:
+    maxItems: 1
+    description: |
+      Saved fuel gauge state. This state will be used during the initialization
+      and saved on exit. It must be initialized beforehand.
+      Its layout must be composed of
+        - RCOMP0 (characterization of the open-circuit voltage)
+        - TCOMPO (temperature compensation information)
+        - FULLCAPREP (reported full capacity)
+        - QRTABLE00, QRTABLE10, QRTABLE20, QRTABLE30 (cell capacity information)
+        - cv_mixcap (remaining capacity of the cell without empty compensation)
+        - cv_halftime (time-to-full characterization time constant)
+      They must all be aligned on 2 bytes. A valid CRC8 checksum must
+      also be found at the end (polynomial x^8 + x^2 + x + 1).
+
+  nvmem-cell-names:
+    const: fg_state
+
+required:
+  - compatible
+  - reg
+  - shunt-resistor-micro-ohms
+  - monitored-battery
+  - nvmem-cells
+  - nvmem-cell-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      fuel-gauge@36 {
+        compatible = "maxim,max77759-fg";
+        reg = <0x36>;
+        interrupt-parent = <&gpa9>;
+        interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+        shunt-resistor-micro-ohms = <5000>;
+        monitored-battery = <&battery>;
+        nvmem-cell-names = "fg_state";
+        nvmem-cells = <&fg_state>;
+      };
+    };

-- 
2.50.1



