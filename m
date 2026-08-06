Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DD8C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 09:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W5DiJCajdy+f7EAjWHD0E6m9Wp5JC04xl4hwWKQ+e9c=; b=vrgLJ6rNzTvF+YBq3Tgr0XdyLZ
	8lDMU6YA1a1DjJpY+NsaYT3A5+OcUK+vTarDVHY5LhmOJ4hIvPZKS3USz6PMJVIruP9ICSFtKQ3yw
	He6o6sBN/U+iI2oOlDZRj/mnbwt16Ip03qDkBUafvqNwadkWmh8YWfLMdaUsmtwgAMz+kdAqFiGtG
	D2xitWZB/WnrUctFUlxNQGF4C0zFqQ0F+3ejZRtxeciuJW21H/ev1OsWz7UsFEYjpHuZ66XqcjFvI
	pDLKd2F9WR0FH9uIrh6GRF4ijJqJ3e7Tk9VYy3Gy1qHRRHphEgkfjMRzElDK9mAZqKthIlA+XBZU0
	Xb23bRuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruZ6-00000005RiE-1DSV;
	Thu, 06 Aug 2026 09:39:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruZ4-00000005RhY-3Dzx
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 06 Aug 2026 09:39:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=W5DiJCajdy+f7EAjWHD0E6m9Wp5JC04xl4hwWKQ+e9c=; b=P9guQl3XpNe19Nox20CuwyUeiv
	kuK9MqJkuCm6f+RwVlR5NTHid3CdG/1e8jWWoyJpz7W6KhLURN2xRBnN+EbJzSdtdDYIdSnQWQEv5
	UFrFYMkofBP94nR+F+R/FO5vCdc09WLTfHXDZ4wnK6Lb3sty82rWDjmbwbjB5gzwxC9xB4H39DhWi
	c8Nf55/8TF/BNKCU5KWzvLIMr4nJCBd5mHLvKdb4LHLPCVyjGj+LjWQUl7EunT5EDw7eHLe4pP9H3
	tFh3Nq2K/JxirSLFEXA4iHHHA0SXlnDMJ/EI2drVfrtrPEUgb24y5n0W/Knoozkbr+nW9iCYYQNPE
	Wf5sy/Vg==;
Received: from chaosmail.tech ([77.81.229.115])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wruZ0-0000000BNq0-4127
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 09:39:01 +0000
Received: by chaosmail.tech (Postfix) id 1787D1C878A;
	Thu, 06 Aug 2026 09:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1786009132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W5DiJCajdy+f7EAjWHD0E6m9Wp5JC04xl4hwWKQ+e9c=;
	b=j1EcAyfgWyNcXvfG9uoioG/ZXIQjvCEDYlG6nTcljPdPoKYAgMzlxtQLCLiE53XzRJJd2o
	DfAo5nxBIZHXcJJYmeY9PuM1F5zph/7yZEwMHUlEtJn01hDIjTvwpurdFPc8MZmTj1Ia8P
	JSfoX+QQ9OWNIxmyYvl6HKSfi9Yd0Kk=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Thu, 06 Aug 2026 11:37:20 +0200
Subject: [PATCH v4 1/3] dt-bindings: usb: tps6598x: Add sn201202x/ACE3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-tipd-ace3-v4-1-79855b150914@chaosmail.tech>
References: <20260806-tipd-ace3-v4-0-79855b150914@chaosmail.tech>
In-Reply-To: <20260806-tipd-ace3-v4-0-79855b150914@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786009131; l=3417;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=HLfrMJHx/3cQgTp030Hr466tjj0ppbN8Q6eIcTsqdII=;
 b=YZnlNro5x77oqa518LBe1iV1+Sk4dF/q2K85L9zHY+JXXQWilgaVQKDbZWPkw8TVaAPAM8nG+
 e1ZA6gqxto5DZfHe5jTa6BBgFamTxGf4C14VlsSj+nr8ZkOVR4mHve+
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_103859_273393_2CB54F71 
X-CRM114-Status: GOOD (  12.99  )
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

A variant of tps6598x that is attached to a SPMI bus and is found on
Apple devices starting from the M3 series

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 Documentation/devicetree/bindings/usb/apple,sn201202x.yaml | 78 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS                                                |  1 +
 2 files changed, 79 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/apple,sn201202x.yaml b/Documentation/devicetree/bindings/usb/apple,sn201202x.yaml
new file mode 100644
index 000000000000..133a71bbedb7
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/apple,sn201202x.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/apple,sn201202x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments sn201202x Type-C Power Delivery controller
+
+maintainers:
+  - Sasha Finkelstein <k@chaosmail.tech>
+
+description: |
+  Texas Instruments sn201202x Type-C Power Delivery controller
+
+  A variant of tps6598x controller also known as Apple ACE3
+  present on hardware with Apple SoCs starting from the M3.
+
+properties:
+  compatible:
+    enum:
+      - apple,sn201202x
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Primary irq used for tps6598x events
+      - description: Logical register selection completed
+      - description: Standby command completed
+      - description: Wakeup command completed
+
+  interrupt-names:
+    items:
+      - const: irq
+      - const: select
+      - const: sleep
+      - const: wake
+
+  connector:
+    $ref: /schemas/connector/usb-connector.yaml#
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/spmi/spmi.h>
+    spmi {
+        #address-cells = <2>;
+        #size-cells = <0>;
+        usb-pd@c {
+            compatible = "apple,sn201202x";
+            reg = <0xc SPMI_USID>;
+            interrupts = <11 IRQ_TYPE_EDGE_RISING>,
+                         <13 IRQ_TYPE_EDGE_RISING>,
+                         <17 IRQ_TYPE_EDGE_RISING>,
+                         <19 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "irq", "select", "sleep", "wake";
+
+            connector {
+                compatible = "usb-c-connector";
+                label = "USB-C";
+
+                port {
+                    typec_ep: endpoint {
+                        remote-endpoint = <&otg_ep>;
+                    };
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index ff08a65d942a..b2819ca62e0c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2610,6 +2610,7 @@ F:	Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml
 F:	Documentation/devicetree/bindings/spi/apple,spi.yaml
 F:	Documentation/devicetree/bindings/spmi/apple,spmi.yaml
 F:	Documentation/devicetree/bindings/usb/apple,dwc3.yaml
+F:	Documentation/devicetree/bindings/usb/apple,sn201202x.yaml
 F:	Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
 F:	Documentation/hwmon/macsmc-hwmon.rst
 F:	arch/arm64/boot/dts/apple/

-- 
2.55.0


