Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC70EC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 May 2025 10:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qds94a7JGf5A2wL0TRcEuz3bSOwN8gxW6+2RO+JpYu8=; b=4t1bKfuBjXfpiQMrPtMXZxMrLn
	TX9zIi8e2RFjTG4WeTmKtU2MWfhbJ8lmAw5C8F0T5ZeeoIR9h03LFfG0HuwVmheechQQOF2a30Yvm
	+IZucWJtP6krzPSE+wtGm0Ez+QFWZJ6zOKhwhR2oHt6fu0m2undEeW8XtlxOm9nuVT/GXZKTY5dDE
	lQ8bk+vSP/n71bHwItZppTzBpqGrbXa6CIZ5+KbmdxfenkaCuIowY1F2npfVA9PFflrySxSaZPGeo
	49CSlpppNqQ9BDJNXo4MjexDPJ81T/dUk0VxKphzHe7qHju1otaEHa0IQhlmd9ostLmL2K8KGRBzL
	Z21ZhPew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uB9wZ-00000003k5x-0Wd1;
	Sat, 03 May 2025 10:18:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uB9m9-00000003iwa-0v9E
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 May 2025 10:07:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5663E5C47EF;
	Sat,  3 May 2025 10:04:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C3FD1C4CEE9;
	Sat,  3 May 2025 10:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746266835;
	bh=lmuGJqrtlK6jtLh4M5WPn7eIxSCZjPMLV6QMWO6aX4g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bsuMruynfVEaqUB/4MULWEq7jyzt/KNvtIjqWb8paPtYO3bPPsNm10zQ9EozwAOzI
	 gXTUNIt49C8q8oOxf7rzTJncHJKR/fNU5In5TlcL0DaYFx7lNsS6hO7UuIQdRtmWVl
	 ToElnwjLB5Ka1VeQrK1MLswmCoCvFULvx7Fp+KKhyOgAyFsaBJGryrO+5n7iG2RUSw
	 miyJYaNWB57DS+xF9kRWuI5dtFlcJlEGodz+eZWmUNX7Xl7mWITI3+ogrHLA9ecwub
	 zy9apYfuYacnCrLq2mz2BCT52t+1LxsRMa6DlwI2TWtp+RihSD6x4csSkXPXXpume2
	 azShGmCHOZLUA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7399C3ABB7;
	Sat,  3 May 2025 10:07:15 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Sat, 03 May 2025 10:06:49 +0000
Subject: [PATCH v4 2/9] dt-bindings: power: reboot: Add Apple Mac SMC
 Reboot Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-smc-6-15-v4-2-500b9b6546fc@svenpeter.dev>
References: <20250503-smc-6-15-v4-0-500b9b6546fc@svenpeter.dev>
In-Reply-To: <20250503-smc-6-15-v4-0-500b9b6546fc@svenpeter.dev>
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Hector Martin <marcan@marcan.st>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
 Lee Jones <lee@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3055; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=n/dAyQF+MHbfUNhqTnwgAGNCT95q0IoVEl/pbDNHSq8=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4boq6PXxCWrKmf13G3X4Vi5a5Odl3FW+KtvXP9eBEo95
 hKf/HRjRykLgxgHg6yYIsv2/famTx6+EVy66dJ7mDmsTCBDGLg4BWAiLG8Z/gou76yyWqb7+bD3
 jeC35dLNHqyTFwjmlXywNM/6X9zLLsfw37lE7A/L5gkL56utnxLY0uHP+zN4Sqrnr4rjLNPf/dE
 sZwQA
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250503_030717_385628_CE7F5730 
X-CRM114-Status: GOOD (  12.69  )
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
Reply-To: sven@svenpeter.dev
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Sven Peter <sven@svenpeter.dev>

On Apple Silicon machines a clean shutdown or reboot requires
talking to SMC and writing to NVMEM cells. Add a binding for
this MFD sub-device.

Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 .../bindings/power/reset/apple,smc-reboot.yaml     | 52 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 53 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/reset/apple,smc-reboot.yaml b/Documentation/devicetree/bindings/power/reset/apple,smc-reboot.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..e55e524914c2f57f7acf239fdefcbdc7a993b69f
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/reset/apple,smc-reboot.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/reset/apple,smc-reboot.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple SMC Reboot Controller
+
+description: |
+  The Apple System Management Controller (SMC) provides reboot functionality
+  on Apple Silicon SoCs. It uses NVMEM cells to store and track various
+  system state information related to boot, shutdown, and panic events.
+
+maintainers:
+  - Sven Peter <sven@svenpeter.dev>
+
+properties:
+  compatible:
+    const: apple,smc-reboot
+
+  nvmem-cells:
+    items:
+      - description: Flag indicating shutdown (as opposed to reboot)
+      - description: Stage at which the boot process stopped (0x30 for normal boot)
+      - description: Counter for boot errors
+      - description: Counter for system panics
+      - description: Power management settings
+
+  nvmem-cell-names:
+    items:
+      - const: shutdown_flag
+      - const: boot_stage
+      - const: boot_error_count
+      - const: panic_count
+      - const: pm_setting
+
+required:
+  - compatible
+  - nvmem-cells
+  - nvmem-cell-names
+
+additionalProperties: false
+
+examples:
+  - |
+    reboot {
+      compatible = "apple,smc-reboot";
+      nvmem-cells = <&shutdown_flag>, <&boot_stage>,
+                    <&boot_error_count>, <&panic_count>, <&pm_setting>;
+      nvmem-cell-names = "shutdown_flag", "boot_stage",
+                         "boot_error_count", "panic_count", "pm_setting";
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 7f91f0225133490607ba0d79ad4225892ef31a66..d85d9d9065db4dc5869788f8a81d9d9a425d7ce3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2282,6 +2282,7 @@ F:	Documentation/devicetree/bindings/nvmem/apple,spmi-nvmem.yaml
 F:	Documentation/devicetree/bindings/pci/apple,pcie.yaml
 F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
 F:	Documentation/devicetree/bindings/power/apple*
+F:	Documentation/devicetree/bindings/power/reset/apple,smc-reboot.yaml
 F:	Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
 F:	Documentation/devicetree/bindings/spi/apple,spi.yaml
 F:	Documentation/devicetree/bindings/spmi/apple,spmi.yaml

-- 
2.34.1



