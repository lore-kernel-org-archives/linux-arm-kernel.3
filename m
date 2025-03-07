Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 126CDC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 08:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j+MTI6lenJ5SoYqxmjz85tlz7lwO/ohKIw56Vcc4SGc=; b=MYEc48hgKYqOAYns5k3+61ZP5n
	LeMcguqBxqb3ArxbmAD/kXcW4kU3y9A+fISE9TUVkbxv9Fj6RJ02xbrm3cZMFZkPmIDeR2H8mhgQ5
	jeJ8GE3RXPSWXAqC9WF+ShbIGaGwGgU3SQvR/LAosGATOCI9JvmKGklRuclBZ63tu3KMu8Dm+sC+K
	/NLmheh+srV4dSonvkivUFI+l08TrKcYgAQbOaSKawiegt3RbyijGqPEVWmJ4V2F7eocnI59Y9JGk
	TPblecbA7T98QQKpgXPCPny1jatitapm4hla7ofmHLxJhMxjU0GDSVDj9/yYO7sxMJY0fSTvLjmD0
	/DOCYEgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqTQA-0000000DcCo-2JCW;
	Fri, 07 Mar 2025 08:51:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqTOX-0000000DbrN-2YOI;
	Fri, 07 Mar 2025 08:49:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ACEDE5C5460;
	Fri,  7 Mar 2025 08:47:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 29963C4CED1;
	Fri,  7 Mar 2025 08:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741337364;
	bh=nihZMnrVDd7TJRXIuYb/tP7cMRc4zru34Wv/fPSdlu8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qkWJ0Xx6lFCGYcbgqSPnBDdYk1/MLKXeJWCxowuFML76xmbH2ZOdyIabuZ1ul875X
	 stpwHhw5HCnQ88y/bCIdp4g0+9twqCyHzMXn5YkeUg7woeXyzF/yMw/8h8niFNHoPp
	 oFWMfS1oLUV2Uu3S9xNg9/pIWFgMR0csXDoFmdA3yz29BAJw2nMakWP5p8ytg1ipi8
	 EAp6wk7jbc/kKbuSV52SfeGfl3Bk8rTWbjXZsxqPpuATY35s6NbEpjGtlZwWscgVgs
	 htkonqj7R1VhOeh6rdyI9ItV6T3vFLRKWb3FA29uscEJeTQPThls86SMdhD6YBeH0J
	 hngmDwcbqpzug==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1403FC282D0;
	Fri,  7 Mar 2025 08:49:24 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 07 Mar 2025 16:49:22 +0800
Subject: [PATCH v4 1/4] dt-bindings: interrupt-controller: Add support for
 Amlogic A4 and A5 SoCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250307-irqchip-gpio-a4-a5-v4-1-d03a9424151b@amlogic.com>
References: <20250307-irqchip-gpio-a4-a5-v4-0-d03a9424151b@amlogic.com>
In-Reply-To: <20250307-irqchip-gpio-a4-a5-v4-0-d03a9424151b@amlogic.com>
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741337362; l=1746;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=xKF/9ztq9L+jNut2ufcUJxWS/0WXkNy4prgakjvZ2cY=;
 b=OR8fxCTg1IY7uojg5DIL8MhPQP8C/gDZ6JeRHuYUrFPAw96ZC7hGynk4ZYFcnep0hI0KGxqap
 dmmXaYAAiHmDOqwbdpmmJfzZ/9esuVEw3gsfG9oyjWUWebYGpY2ps88
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_004925_766079_B38E617E 
X-CRM114-Status: UNSURE (   8.64  )
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Update dt-binding document for GPIO interrupt controller
of Amlogic A4 and A5 SoCs

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../interrupt-controller/amlogic,meson-gpio-intc.yaml | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml
index a93744763787..3d60d9e9e208 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml
@@ -35,6 +35,9 @@ properties:
               - amlogic,meson-sm1-gpio-intc
               - amlogic,meson-a1-gpio-intc
               - amlogic,meson-s4-gpio-intc
+              - amlogic,a4-gpio-intc
+              - amlogic,a4-gpio-ao-intc
+              - amlogic,a5-gpio-intc
               - amlogic,c3-gpio-intc
               - amlogic,t7-gpio-intc
           - const: amlogic,meson-gpio-intc
@@ -49,7 +52,7 @@ properties:
 
   amlogic,channel-interrupts:
     description: Array with the upstream hwirq numbers
-    minItems: 8
+    minItems: 2
     maxItems: 12
     $ref: /schemas/types.yaml#/definitions/uint32-array
 
@@ -60,6 +63,20 @@ required:
   - "#interrupt-cells"
   - amlogic,channel-interrupts
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: amlogic,a4-gpio-ao-intc
+then:
+  properties:
+    amlogic,channel-interrupts:
+      maxItems: 2
+else:
+  properties:
+    amlogic,channel-interrupts:
+      minItems: 8
+
 additionalProperties: false
 
 examples:

-- 
2.37.1



