Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F4FC43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 10:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l421AJzNoZ/8d4zrVEG3NJ6ngSRBxoXdW4wIVrCayIg=; b=u8MvYAAJI/QfWlNAacjFuWVPCH
	5qHNtm9rLnPp0TcHPN7Qs6xiEoY7Doek8ae1WO+vehhfvXNJrDVuZocOZRPeTUwrxsMnsqwuW9YXY
	+fLuSSaQgiMaKkskunbFG3XvDM3V+6B8d7ksxzpMynA5RcMOR6KARusArvdL41yP8G/OHFtQ0ECm9
	06POycMdBjEShh/rUOfoTdfL/eB7hQ/Il3I9vhSBAx8wNEAavKhcuUGQJCVsvoTGN2aMYwtaCM11Q
	8IRiEvJ6G6QhndJOikyuLkxnfRSWgiUB3HteWGgxgtRogUbY3qTeMp18K45+7BXt2mbjLAkoRWxF+
	lq34jHLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPK5-0000000GqLz-05RA;
	Wed, 08 Jul 2026 10:16:09 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPJv-0000000GqAG-1Mse
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 10:16:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D0FA34E40CF2;
	Wed,  8 Jul 2026 10:15:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 95C0360337;
	Wed,  8 Jul 2026 10:15:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2654A11BC3441;
	Wed,  8 Jul 2026 12:15:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783505756; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=l421AJzNoZ/8d4zrVEG3NJ6ngSRBxoXdW4wIVrCayIg=;
	b=kGMh6oVszdIL8ZmOiaG6EhdeLsnl4mPpd6rq930p9ZNleIkHrAgYI1YtaOf7WFeKDKFRHb
	NyQz4EZunNE33lRCktmFN6jMFo+bk7Og3I1Ld0e7Fj14ObHHUaoQhTG1JYZZ7Z9B1BgBCd
	lopgbxsz758BpobJd3LbNA/QXKzrCQbEsHXEu5ZIP/z4fFfZlUx4zJ8vJpwv/lZb+QrKxb
	4oyoIkdGjSxc/7X+U6ZbyaRVyFRVh7fqCCOB0GW3CfcBckjfIJL93Mg8XVnuCB+JUaTJLT
	Yu93+hk/TED2FSVTKMY8zEvWE48QXtNVjsycKdPGocJ0GWDXlOPdGHGdo/QGww==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Wed, 08 Jul 2026 12:15:17 +0200
Subject: [PATCH v2 04/10] dt-bindings: soc: fsl: qe: Add support of IRQ in
 QE GPIO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-qe-pic-gpios-v2-4-1972044cfbd1@bootlin.com>
References: <20260708-qe-pic-gpios-v2-0-1972044cfbd1@bootlin.com>
In-Reply-To: <20260708-qe-pic-gpios-v2-0-1972044cfbd1@bootlin.com>
To: Qiang Zhao <qiang.zhao@nxp.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Paul Louvel <paul.louvel@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783505738; l=3392;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=DXzRspf6ZI8lMhz8y8ptUUL+MANU3WgrG0e6AbqI2G0=;
 b=o+41FxZCX1nWEkemW4T4DWPopS4yskNGZ/HGQGoq5Tx3HdVVJgQ5QrZ6oxTKD1/xCuEbCVXpd
 XtpfTeBeTtoAANPHFAM0i+9WfwLolsl4KVYpBZfSIG9yGfTqimRG4fk
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_031559_611046_77453F3C 
X-CRM114-Status: GOOD (  13.60  )
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

Some QE GPIO pins have an associated interrupt line in the QE PIC to
signal state changes on the pin.  Add the corresponding
interrupt-controller / nexus properties to the QE GPIO binding.

Because the GPIO controller does not perform any interrupt handling
itself, a nexus node (interrupt-map) is used to map each GPIO line
supporting IRQ to the parent QE PIC interrupt domain.

As the QE PIC can be configured to generate an interrupt on either a
high-to-low transition or any change in signal state, three
interrupt-map entries are needed per GPIO pin that can yield an
interrupt (falling, both, and the "none" case which defaults to both in
QE PIC).  This overhead is necessary because the interrupt-map-pass-thru
property is not part of the DT specification.

The interrupt-map property is optional: it is not required for GPIO
banks that have no interrupt capable GPIO line (e.g. port D on MPC8323),
or when interrupt functionality is not used.

Update the example to show a scenario where each bank supports a
different numbers of IRQs, or no IRQs at all.

Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
---
 .../bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml   | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml b/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
index 1af99339ff40..1d2ab44fcd3c 100644
--- a/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
+++ b/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
@@ -27,6 +27,17 @@ properties:
   "#gpio-cells":
     const: 2
 
+  "#address-cells":
+    const: 0
+
+  "#interrupt-cells":
+    const: 2
+
+  interrupt-map:
+    description: |
+      Specifies the mapping of GPIO lines to the parent interrupt controller, as the
+      GPIO controller does not do interrupt handling itself.
+
 required:
   - compatible
   - reg
@@ -37,9 +48,37 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
     gpio-controller@1400 {
         compatible = "fsl,mpc8360-qe-pario-bank", "fsl,mpc8323-qe-pario-bank";
         reg = <0x1400 0x18>;
         gpio-controller;
         #gpio-cells = <2>;
     };
+
+    gpio-controller@1418 {
+        compatible = "fsl,mpc8323-qe-pario-bank";
+        reg = <0x1418 0x18>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        #address-cells = <0>;
+        #interrupt-cells = <2>;
+        interrupt-map = <
+          7 IRQ_TYPE_EDGE_FALLING  &pic 4 IRQ_TYPE_EDGE_FALLING
+          7 IRQ_TYPE_EDGE_BOTH     &pic 4 IRQ_TYPE_EDGE_BOTH
+          7 0                      &pic 4 IRQ_TYPE_NONE
+
+          9 IRQ_TYPE_EDGE_FALLING  &pic 5 IRQ_TYPE_EDGE_FALLING
+          9 IRQ_TYPE_EDGE_BOTH     &pic 5 IRQ_TYPE_EDGE_BOTH
+          9 0                      &pic 5 IRQ_TYPE_NONE
+
+          25 IRQ_TYPE_EDGE_FALLING &pic 6 IRQ_TYPE_EDGE_FALLING
+          25 IRQ_TYPE_EDGE_BOTH    &pic 6 IRQ_TYPE_EDGE_BOTH
+          25 0                     &pic 6 IRQ_TYPE_NONE
+
+          27 IRQ_TYPE_EDGE_FALLING &pic 7 IRQ_TYPE_EDGE_FALLING
+          27 IRQ_TYPE_EDGE_BOTH    &pic 7 IRQ_TYPE_EDGE_BOTH
+          27 0                     &pic 7 IRQ_TYPE_NONE
+        >;
+    };

-- 
2.55.0


