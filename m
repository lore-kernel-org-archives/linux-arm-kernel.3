Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A64C021BC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 05:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T51EjBFpTpJBKid91ZvNUXaS1XeJFaA1To5mbW7XJcs=; b=xim4+nGUPB6W5AyBNDJcL+ZVa/
	L+YLVyYJbIByPLoFPfJf0e029iWQ+15klHhBRT9HHG3xmm/cpowg6vER7/A+0nnZ0ser/Abr/TIWt
	d+a1xRkp2ID+s8uohXGLOhRxJU2SsYABm8Y3FUyQrD37QUYVuXjY9mE3KPVYs8QWsJrmBfEBK/DQh
	+hKMwUtC7uF2w8sgPSD6G2k2ynojLexHTa8gLm/AFUR+Z2CK52xZkVyxOh/arpNKL13pneS5uouQQ
	07yDJ3R50Cu6X9d6V8Ho2H6NL/Mg7wLLZpYN0PxShiJqcgOD3bpwLNiE/+mg/iYezqA1S6/GoMt+Y
	5TeRNmDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnAIs-00000002SSC-1yRl;
	Wed, 26 Feb 2025 05:49:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnAHL-00000002S9l-3hIG;
	Wed, 26 Feb 2025 05:48:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 769F46121F;
	Wed, 26 Feb 2025 05:48:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 522B3C4CEE2;
	Wed, 26 Feb 2025 05:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740548893;
	bh=YTxbX1SMFkLdHdgjkg6WxDuNfCvkz1KnuWwEm3xpV2A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nl/h3NGzrKmEpmw9o6+dWiz1wIIakggxjRRYaWBQnnTIMrE8pSw1fkQZUMhFj/vI8
	 gc5bghXqaCOZA+WwYWDAm194rwEQ/YYrLgwOQjiYDtpXVDmnPSobvO63hHDj+AHlFT
	 XcS46/FN7aoGkdDqV/b++B3VcGJv+k+HcHmRI8/ND9W0reUyv0a1O1N9Gl6RucispA
	 epw/6yXyDCtq13PL/zF4fUahQ5gLjLlS49LLdJsFR7xcx4fDdwIt5K+NYCeIF6PsGh
	 IjXg4zn3XfYkYpbtPxuE0Km7qnYEaiJncr8xynWx3wTNjjjVP+voDk+iWOS+VoTKTM
	 LZbYFpDr7G3ow==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B087C021BC;
	Wed, 26 Feb 2025 05:48:13 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 26 Feb 2025 13:47:52 +0800
Subject: [PATCH v2 1/4] dt-bindings: interrupt-controller: Add support for
 Amlogic A4 and A5 SoCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-irqchip-gpio-a4-a5-v2-1-c55b1050cb55@amlogic.com>
References: <20250226-irqchip-gpio-a4-a5-v2-0-c55b1050cb55@amlogic.com>
In-Reply-To: <20250226-irqchip-gpio-a4-a5-v2-0-c55b1050cb55@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740548891; l=1414;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=dTNRfdsA0Oz62Y/8dKTOWQTma5Yw707SFzuW8wJM278=;
 b=wum+/0VoVVxzdMJaWSVjZnlXMAoByA44plvy4Ip2dSTsPLGWZWq1Ez/JPN7RCUpdvyxTJPmhU
 h7dQe/c1TKQBLZZp3t5C5yuW4Skj9pb8kWa0/sfU0/xHvvDIlsXQ2dx
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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
 .../interrupt-controller/amlogic,meson-gpio-intc.yaml       | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml
index a93744763787..4decf1262a6f 100644
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
@@ -60,6 +63,16 @@ required:
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
+      minItems: 2
+
 additionalProperties: false
 
 examples:

-- 
2.37.1



