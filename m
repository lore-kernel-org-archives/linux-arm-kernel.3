Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2341EC61DCD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 08:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JlG6+PUtIXZNwnf7x0S0fxthA7NmbjioQPaAPnBJ7dU=; b=uE97/0Q2/dMSx88gCS2gtei8ns
	lhTfc1VkoCb2SsVv8rYvXFmWtVmGcJ/QIdl/v1scVGM7pxyzYxop8OcRODzNrC5a0DBwVdbeJ0yvK
	r/mOdqoESbNDFkJmDyguhOiPPzoOeHPDUFIdIfQAHpcyyGdHnVnDaVLVszJPXHzjpOfwJjK80dEoy
	AYlYUZF5ExUu1NoxcFLGDFq3caKYyilTV18mvIr3Sn86XOwE9mHbssoG7NrKANcK1mp0WA3VF2X2P
	ZIFJkiUsA6nYMNg2j1L7gbFYi99W/as3zKT2z4PQJWYC817clezY8vdQ6cBtclyJL8m7N2vq5uktq
	uAZgENJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsQl-00000005O4c-3lqd;
	Fri, 28 Aug 2026 08:59:23 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsQZ-00000005Nw8-2oDx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 08:59:14 +0000
Received: by chaosmail.tech (Postfix) id 4B02F1CC005;
	Fri, 28 Aug 2026 08:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1787907545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JlG6+PUtIXZNwnf7x0S0fxthA7NmbjioQPaAPnBJ7dU=;
	b=M9ls31GFjmt8LCfrUUNc7Ri029gwjvtGZralr2btExEbGWHWzbnLkbwXBm+ZbO9kjFlS0b
	OpyH8FrBTzLvzZyxDiUEHv7ANfM0lpcXf45aWAMhFj828x70UL81jc+jU1HtVaD74RlzFd
	lvB+pLjdpc00quRM+3ZwHSZmnc8FFXI=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Fri, 28 Aug 2026 10:58:57 +0200
Subject: [PATCH v8 1/6] dt-bindings: spmi: apple,spmi: Add t603x and t8122
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-t603x-spmi-v8-1-708d4d12e0fd@chaosmail.tech>
References: <20260828-t603x-spmi-v8-0-708d4d12e0fd@chaosmail.tech>
In-Reply-To: <20260828-t603x-spmi-v8-0-708d4d12e0fd@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787907544; l=1674;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=l9SbAnlWZkh5y3/Jt2jLmujwt/iglb+nl42d9KhKbcQ=;
 b=iK66TXlyqc4dLyt60dj3klyet2zYmXW69OmBSTI6wIFZT5EDat66QWM/T1UL5cUPwG0QHZ8t4
 J1e0GAc9AfDB+oN8l4b87DLcQPnmUiC6GxaQeeeR4iM5IWjLQFpxu9c
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_015912_214877_181D9A89 
X-CRM114-Status: UNSURE (   8.65  )
X-CRM114-Notice: Please train this message.
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

Add t603x and t8122 compatibles, interrupt support, and support for
SPMI controllers that are not always-on.

Reviewed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 Documentation/devicetree/bindings/spmi/apple,spmi.yaml | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
index 3e5b14bc8c31..09d383bb4fec 100644
--- a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
+++ b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
@@ -20,8 +20,11 @@ properties:
       - items:
           - enum:
               - apple,t6020-spmi
+              - apple,t6030-spmi
+              - apple,t6031-spmi
               - apple,t8012-spmi
               - apple,t8015-spmi
+              - apple,t8122-spmi
           - const: apple,t8103-spmi
       - items:
           - enum:
@@ -34,10 +37,38 @@ properties:
   reg:
     maxItems: 1
 
+  interrupts:
+    maxItems: 1
+    description: Optional, operates in polled mode if not present
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
 
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - apple,t8122-spmi
+          - apple,t6030-spmi
+          - apple,t6031-spmi
+then:
+  required:
+    - compatible
+    - reg
+    - interrupt-controller
+    - "#interrupt-cells"
+    - interrupts
+
 unevaluatedProperties: false
 
 examples:

-- 
2.55.0


