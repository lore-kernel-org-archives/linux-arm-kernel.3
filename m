Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19415C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 06:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Df9KJQGwN+4BY13mT7BAtNM2SG+EkBQ538Vnt+/tQFY=; b=gGSXdWU7YA7xtAfAwzayBM/+tn
	SViWgY3OGwp3GIHlY9PRXiezO8XB632cRbYAgJuthhRSMRII01OX57ndJucscMHct2weMLypcPQHG
	wlXsCr5rgq0j6aTU2MIZf3KUSDieIvLmwtTbjLApGMWru60eqJy/6jO6mTZs1dUhD1JxITOkUQge7
	UVjLoUKxm/t3Rlv4Fy4oW+KH7Y7hVreRxh5dJRw5VXsiHOaDIcK8yehZNHlyAAp341nAndt2K7lLp
	AS1cXUrvCheZlTqGylTjS5FI3HH+6tn7gVxq2aP07oI+CxTO9dTW/nUcdFxtwsqebI40A9CvfZUdY
	sbScx4+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5oF-0000000Dni5-2t9X;
	Mon, 29 Jun 2026 06:49:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5oE-0000000DnhJ-2RTS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 06:49:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3011443D98;
	Mon, 29 Jun 2026 06:49:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 12AC0C4AF0F;
	Mon, 29 Jun 2026 06:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782715774;
	bh=nBvnhkraAlhGHXXmcPBOJhkaZz0VzUTiD+ls+OA6G2k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=SSwEZKs83e6+QTrEKzagUVnFW/IOgcDcpy+iaAn1t081H8LzVxAcJzQf35og+tL70
	 om6TdRvoHWlIclhSpcSzpW2NmEb2AqkOG+Z8LVYS/pf7FL26td+/RevoGfni8M9Zk+
	 SFjmLdCRSonP/rLpeMecLhVDMK9uWgivKQeEKmb/aVe6VcRKg/4VE/62gqBoP102FI
	 BM9AOskNHU3MNvLb100K9x5Jju0jQuU9P9dtNryzcziwvh7Rd5cr0pyoCAPmh4tmEC
	 7kqIqTsgVheFudAo4TobAubW4RI2qufprx8wJzezum3MB2PyHR1CO+IEhlXYD+Y1DD
	 WpoXAV+9Kr7XA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0EA1C44500;
	Mon, 29 Jun 2026 06:49:33 +0000 (UTC)
From: Yu-Che Hsieh via B4 Relay <devnull+yc_hsieh.aspeedtech.com@kernel.org>
Date: Mon, 29 Jun 2026 14:49:00 +0800
Subject: [PATCH 3/4] dt-bindings: ipmi: Add optional LPC properties to
 ASPEED BT devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-aspeed-bt-bmc-multichannel-v1-3-fc23ee337f7a@aspeedtech.com>
References: <20260629-aspeed-bt-bmc-multichannel-v1-0-fc23ee337f7a@aspeedtech.com>
In-Reply-To: <20260629-aspeed-bt-bmc-multichannel-v1-0-fc23ee337f7a@aspeedtech.com>
To: Corey Minyard <corey@minyard.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: openipmi-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, Yu-Che Hsieh <yc_hsieh@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782715772; l=2189;
 i=yc_hsieh@aspeedtech.com; s=20260629; h=from:subject:message-id;
 bh=z+ycFWmOaDIg3MLyJDHKU8ALQWWy3TelygSh1S01hYI=;
 b=2Z9HfF4G2QEiNPdhd3fE4XoWv99voNdrQ8WCW9S6YS9YMCZkCHI4FWveW74mN6CgGvTdjwiDC
 DSvofFpp5H7Dr21dT5wgMlRNWm301BGtmyyzOF1GLUFzkHN5ot/asz7
X-Developer-Key: i=yc_hsieh@aspeedtech.com; a=ed25519;
 pk=kLxUeF7g6teciq79it9N3tYNgp3yCspZ+AHlYSnZ0gs=
X-Endpoint-Received: by B4 Relay for yc_hsieh@aspeedtech.com/20260629 with
 auth_id=844
X-Original-From: Yu-Che Hsieh <yc_hsieh@aspeedtech.com>
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
Reply-To: yc_hsieh@aspeedtech.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Yu-Che Hsieh <yc_hsieh@aspeedtech.com>

Allocating IO and IRQ resources to LPC devices is in-theory an operation

for the host, however ASPEED systems describe these resources through

BMC-internal configuration, as already supported by the ASPEED KCS BMC

binding.

Add aspeed,lpc-io-reg and aspeed,lpc-interrupts to the ASPEED BT BMC

binding so firmware can describe the host LPC IO address and SerIRQ

configuration using the same properties as KCS devices.

Signed-off-by: Yu-Che Hsieh <yc_hsieh@aspeedtech.com>
---
 .../bindings/ipmi/aspeed,ast2400-ibt-bmc.yaml       | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.yaml b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.yaml
index c4f7cdbbe16b..1803c6bbae93 100644
--- a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.yaml
+++ b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.yaml
@@ -25,6 +25,24 @@ properties:
   interrupts:
     maxItems: 1
 
+  aspeed,lpc-io-reg:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    maxItems: 1
+    description: |
+      The host CPU LPC IO address for the BT device.
+
+  aspeed,lpc-interrupts:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 2
+    maxItems: 2
+    description: |
+      A 2-cell property expressing the LPC SerIRQ number and the interrupt
+      level/sense encoding (specified in the standard fashion).
+
+      Note that the generated interrupt is issued from the BMC to the host, and
+      thus the target interrupt controller is not captured by the BMC's
+      devicetree.
+
 required:
   - compatible
   - reg
@@ -35,10 +53,13 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/clock/aspeed-clock.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
 
     bt@1e789140 {
         compatible = "aspeed,ast2400-ibt-bmc";
         reg = <0x1e789140 0x18>;
         interrupts = <8>;
         clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
+        aspeed,lpc-io-reg = <0xe4>;
+        aspeed,lpc-interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
     };

-- 
2.34.1



