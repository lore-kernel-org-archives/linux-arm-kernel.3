Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C29D32D8B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 10:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9eK4+Dy+MTR23V7WUN+8WPVlDRGMusnRNV08EPjNvno=; b=GzBZn1uj5kyzGzAY30hXSCZPdC
	wTqR4Pg3JOrnFF8HjqkU4ZqKaJUcZAg7ZzCbFUwVVw/UolVuEYfiL2qQsaI1m0F+TYR1MjP8Uxll4
	K9fwcUJ2d9O9qoOBk4VGBkaAikFbj85JrrVXFaGNygr3Oq6DFk4pH4tGLVBGjn0E01bzc5dw+sZUB
	c3EDYcEv+Y8Rl7HJv6Z3VcAYsgjwcnAberxgH9r7m+KsS0ct1ZIKda2s9Dl4F+7RFa2CTG3GOSsiB
	G7G5xOWlK2qCZTcEnTR5VW7m8WWvaZ7rj9erznZgxlCm5MbJG6IlsKOd0BLAG/txQ5dfOU6UkxObu
	FiEOjLlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAoNq-0000000367T-44wT;
	Tue, 12 Nov 2024 10:44:30 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAo6x-000000032f1-03xX;
	Tue, 12 Nov 2024 10:27:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F20D9A41908;
	Tue, 12 Nov 2024 10:25:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B4D6BC4CED7;
	Tue, 12 Nov 2024 10:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731407221;
	bh=D/M0/A3lpkOUWkgP+FbRFsJh3b6bYgyAz3r/L66iK5U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UbRW3gYFoPzhsSp3AddNltboro3niP6XarNVfTo7qzo0rxWWgUm2wyPh7xNaVgYBQ
	 BakM7gWrmvdydq7y/sP5GeXyA9iv8O50NP98YEwnY8ZHAJ2NXxpx5NirF9jP4+0pZm
	 CvyQFUA4FNTh3WSUPkN4/zlBpJojhsBDzbZ4zWsiZVsHZIlZbCWQ0eZqcrbuiIPoTT
	 Irme0CbWI5M/3Wm5cJy/upyvN7V9EwVyPP9YpLNbU+H/ZUl7e+4pbYLPSv6ScAKRVP
	 35oqcl36rUnFoM2cVXv9QLmFb7KdlQ5uRaEspvUhX0Hrjk1TUMP8mfxfhwpq3qG9md
	 sQXXdWl4vgpFA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A56E0D32D8D;
	Tue, 12 Nov 2024 10:27:01 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 12 Nov 2024 18:26:56 +0800
Subject: [PATCH v5 2/5] dt-bindings: pinctrl: Add support for Amlogic A4
 SoCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241112-a4_pinctrl-v5-2-3460ce10c480@amlogic.com>
References: <20241112-a4_pinctrl-v5-0-3460ce10c480@amlogic.com>
In-Reply-To: <20241112-a4_pinctrl-v5-0-3460ce10c480@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731407219; l=2582;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=uO4TJ2ja77acTbAqMRXIRWimmcaql9Ax5+y2igpzZwU=;
 b=kgdeyuL6lEctCLbfExo6Bnu7GSA/W0Nx4PY3zuhgWy9uBoBeFBleplnEKVhzLbq66GFX832GU
 2HuIu4MfGemAK18lIX0Fz1eLT8rVSh1nwpQWMw0LLj0LdO0J22AOGZP
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_022703_260142_C0A98969 
X-CRM114-Status: GOOD (  11.89  )
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

Add the new compatible name for Amlogic A4 pin controller, and add
a new dt-binding header file which document the GPIO bank names of
all Amlogic subsequent SoCs.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml |  2 +
 include/dt-bindings/gpio/amlogic-gpio.h            | 45 ++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
index d9e0b2c48e84..f5eefa0fab5b 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
@@ -15,6 +15,8 @@ allOf:
 properties:
   compatible:
     enum:
+      - amlogic,a4-aobus-pinctrl
+      - amlogic,a4-periphs-pinctrl
       - amlogic,c3-periphs-pinctrl
       - amlogic,t7-periphs-pinctrl
       - amlogic,meson-a1-periphs-pinctrl
diff --git a/include/dt-bindings/gpio/amlogic-gpio.h b/include/dt-bindings/gpio/amlogic-gpio.h
new file mode 100644
index 000000000000..5bfdb39eeda8
--- /dev/null
+++ b/include/dt-bindings/gpio/amlogic-gpio.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
+ * Author: Xianwei Zhao <xianwei.zhao@amlogic.com>
+ */
+
+#ifndef _DT_BINDINGS_AMLOGIC_GPIO_H
+#define _DT_BINDINGS_AMLOGIC_GPIO_H
+
+#include <dt-bindings/gpio/gpio.h>
+
+/* Normal GPIO bank */
+#define AMLOGIC_GPIO_A		0
+#define AMLOGIC_GPIO_B		1
+#define AMLOGIC_GPIO_C		2
+#define AMLOGIC_GPIO_D		3
+#define AMLOGIC_GPIO_E		4
+#define AMLOGIC_GPIO_F		5
+#define AMLOGIC_GPIO_G		6
+#define AMLOGIC_GPIO_H		7
+#define AMLOGIC_GPIO_I		8
+#define AMLOGIC_GPIO_J		9
+#define AMLOGIC_GPIO_K		10
+#define AMLOGIC_GPIO_L		11
+#define AMLOGIC_GPIO_M		12
+#define AMLOGIC_GPIO_N		13
+#define AMLOGIC_GPIO_O		14
+#define AMLOGIC_GPIO_P		15
+#define AMLOGIC_GPIO_Q		16
+#define AMLOGIC_GPIO_R		17
+#define AMLOGIC_GPIO_S		18
+#define AMLOGIC_GPIO_T		19
+#define AMLOGIC_GPIO_U		20
+#define AMLOGIC_GPIO_V		21
+#define AMLOGIC_GPIO_W		22
+#define AMLOGIC_GPIO_X		23
+#define AMLOGIC_GPIO_Y		24
+#define AMLOGIC_GPIO_Z		25
+/* Special GPIO bank */
+#define AMLOGIC_GPIO_DV		26
+#define AMLOGIC_GPIO_AO		27
+#define AMLOGIC_GPIO_CC		28
+#define AMLOGIC_GPIO_TEST_N	29
+
+#endif /* _DT_BINDINGS_AMLOGIC_GPIO_H */

-- 
2.37.1



