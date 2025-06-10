Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D34EC7113C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 22:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WVR/ruFkAaXY3k1WhgF1CY8d4HqYjgWEFqLyDBt2Ks8=; b=0UC9UAuMPK3HNTSFj4TUzLuGpi
	9/5BYPgolc6p1vNA/dqwwz+v8z4ROS5wFIPYAi0D8RajizdYqRHPbsKPSX2zM5pyGVIbT47p+0C7t
	WLHuS59gb/g27LliXBQbvEXWQUhCaKaUGVjLP2LPtQPKXruLgSd7L/+5CZ6KNgNfo7u2CRb0qqeZM
	CNMI7pXXMXBVgU3QkmMk06Y5nQjW0kPMnfsaz/3XnKY5cHSPzQVuc/jvHrK9pf6sc8ykK6yxX6BJ/
	WB2wnqq2qICXdEuGJzbwD1QP7DtpI/4sPy4nefcPZbCV78+vRPAVhbns5qmGXNd2G9/1pOEyc++MA
	eXssXo2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7l7-00000008EZI-1mxe;
	Tue, 10 Jun 2025 22:47:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1Yk-00000007Qny-1HPf
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Jun 2025 16:10:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=WVR/ruFkAaXY3k1WhgF1CY8d4HqYjgWEFqLyDBt2Ks8=; b=BsQWrXNuWzf079L9qYB9cjA1es
	eLKOgcAqY7gRk5ghVv1aKGmGH/7nQhl6lwUVua3cnauvrWXCjn3cbVNJ3U48FsEF07ZZFA+0vBXaM
	twQZYjCYeTU1Ao+66CrfFFmf8P98VxnJyvXraZ838k/MGXZk6U2UvFtZvXNTr/YIwAueY5l7t9mL/
	5ynsCEexUxzZaEoTWK6zVJF044dStiTANLsZq4oRyAE2Rf0UCamL23wjZbUkQZF0SymYH4OWR9rv3
	fj//TzTrKiT+m9aQIbvuuhehyWBUoeNSRWD+51d8dO89p5j+VZDh8TKtxACdgEGLCWjA0V28lO1iI
	77ygPqDw==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1Yi-00000001vX0-0Ur0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 16:10:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E6E4BA5146B;
	Tue, 10 Jun 2025 16:10:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 67FAFC4CEF2;
	Tue, 10 Jun 2025 16:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749571839;
	bh=QLsFhzpHRYmA1ajW0KypVDBYFMUVDXC7AICzYhpICrc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OUx/WFc+WeDHtK2TSCOwJd4TFXkbevR7wu9y4wrq1Do1CL5Rx8TPQGaVScpPfEmCJ
	 jE92dmiY0qOXWKxjbrc4evGQPiaryiwQbiK46SbROpGEqh+WhbHLoem74q1TTrI0e0
	 FcSHByHErtFeuP2otQ4kV5GzwZ5krv4NFKDRbqWlMwtl0VpDJ1hAOy0j7lYoWk3qS1
	 7KEj/rQdficA6VFps3Z5gqeohrFoFPcTNmTz11EmrNorUU5zjD3LxOC29WTT1/8ZgN
	 yqR2V6nxkn1GqfD0rLkVa5XHhCFDBWb8U5zAdAGfuHOsTDjgMcSL3cRD8EP+LNizuf
	 BkWdFBrQiPd9Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 579BFC677C4;
	Tue, 10 Jun 2025 16:10:39 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Tue, 10 Jun 2025 15:29:43 +0000
Subject: [PATCH v7 02/10] dt-bindings: power: reboot: Add Apple Mac SMC
 Reboot Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-smc-6-15-v7-2-556cafd771d3@kernel.org>
References: <20250610-smc-6-15-v7-0-556cafd771d3@kernel.org>
In-Reply-To: <20250610-smc-6-15-v7-0-556cafd771d3@kernel.org>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2766; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=QLsFhzpHRYmA1ajW0KypVDBYFMUVDXC7AICzYhpICrc=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4aHf9Hn32suSFhNTdyT4XxIdtv/vq9WUZ8t3ito7c3md
 lU8sWtRRykLgxgHg6yYIsv2/famTx6+EVy66dJ7mDmsTCBDGLg4BWAiS1YyMrxafbupQ+HVTJml
 H3eWNJ/Z/VrT3bPr9/6dTx+WvvJMkMpnZFiwed2Gbx5mE+9u3arxZd6EnX5xrZFzvSarHTncdlh
 ymhIfAA==
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_171044_393204_90189FFC 
X-CRM114-Status: GOOD (  11.98  )
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

On Apple Silicon machines a clean shutdown or reboot requires
talking to SMC and writing to NVMEM cells. Add a binding for
this MFD sub-device.

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Sven Peter <sven@kernel.org>
---
 .../bindings/power/reset/apple,smc-reboot.yaml     | 40 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 41 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/reset/apple,smc-reboot.yaml b/Documentation/devicetree/bindings/power/reset/apple,smc-reboot.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..ce5ed88493cdb60bfc8b444cd9e1d36714890ffe
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/reset/apple,smc-reboot.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/reset/apple,smc-reboot.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple SMC Reboot Controller
+
+description:
+  The Apple System Management Controller (SMC) provides reboot functionality
+  on Apple Silicon SoCs. It uses NVMEM cells to store and track various
+  system state information related to boot, shutdown, and panic events.
+
+maintainers:
+  - Sven Peter <sven@kernel.org>
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
+
+  nvmem-cell-names:
+    items:
+      - const: shutdown_flag
+      - const: boot_stage
+      - const: boot_error_count
+      - const: panic_count
+
+required:
+  - compatible
+  - nvmem-cells
+  - nvmem-cell-names
+
+additionalProperties: false
diff --git a/MAINTAINERS b/MAINTAINERS
index 68097b1a44251b076bfd55cc07cffa5d0e3e83c5..1dd004f7dff669e3a3609e5f1702887129d8ff35 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2346,6 +2346,7 @@ F:	Documentation/devicetree/bindings/nvmem/apple,spmi-nvmem.yaml
 F:	Documentation/devicetree/bindings/pci/apple,pcie.yaml
 F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
 F:	Documentation/devicetree/bindings/power/apple*
+F:	Documentation/devicetree/bindings/power/reset/apple,smc-reboot.yaml
 F:	Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
 F:	Documentation/devicetree/bindings/spi/apple,spi.yaml
 F:	Documentation/devicetree/bindings/spmi/apple,spmi.yaml

-- 
2.34.1



