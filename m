Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE55E9A049
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 13:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mGeo8dYdvtlQJ0tSEweLlRpTjA9CiDK23fAEfe4GJ3I=; b=NICkLbQ8dK88l0WGPD+DVxTNPU
	m4aLsMCnap48BR3v3t0k8pexiB3u8kq9pOj04qFMCFFe8WRvnwYXq2IOTCmjWBRli0f+FW3KWxgaH
	mtsjDwDMWDTbGKbFDymB1VYptUBeQxNGeEH7U0S7pX5CYXVpMp2KJ+e6MqvNRTY8y6k7TfHK7Kn8S
	8TCnghigWOyGBP5sC3qMhFcRlr7AAYUYvSdjRsCf/wmNUrAzKuN0FaYpnAu0fqdjJQRVU1irYTOT9
	/paRYt2R2CWc0Nin/mrLgr8xJ3h/IfDIO5mlv2CcE7h/yFKbuhi8G+Bia+g9V/oPSoxMZ2bakBj6X
	HWAfkJdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vshYe-00000009sDp-3CLY;
	Wed, 18 Feb 2026 13:25:36 +0000
Received: from mail.fris.de ([116.203.77.234] helo=mail2.fris.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vshYY-00000009s83-161X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 13:25:31 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1771421128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mGeo8dYdvtlQJ0tSEweLlRpTjA9CiDK23fAEfe4GJ3I=;
	b=NIYooHC9JWGN5V42jrdND52uDeFM87SsrJYbw+1Up4KNbOXMh4fn4USAjofro0Of1pO1DX
	c8HkXG5rjMNWf1dVOBBE0TRjaxirYpW0v7YSYMx3QnGu4nF+JgZuMo1o2uDt8o9/nFE7sJ
	BDISRBuIQpgFg6W1YdN+j+7EA1zaR60EyPs6Bl6dEJ54UKkYNH4vQm/8Jf0qjR+jTbXRzt
	bc66/ZROYbtfCScYGpqqzPK/WN/GSxX4TD6yZ5wb9CaU8nDAH3vrQyRxDOTqVqsbI4XU2W
	TVQ+m/kDM9kEDqKf+gQhaS4ttKHhaC9mXhwWdkLzd9GWjtOjFnNaXX0R1UfQLw==
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 4/4] arm64: dts: imx8mp-kontron: Use GPIO/IRQ defines in DL devicetree
Date: Wed, 18 Feb 2026 14:25:08 +0100
Message-ID: <20260218132519.74570-5-frieder@fris.de>
In-Reply-To: <20260218132519.74570-1-frieder@fris.de>
References: <20260218132519.74570-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_052530_472082_B8383AA9 
X-CRM114-Status: UNSURE (   8.80  )
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

To make the code more readable, use the macros for the GPIO and IRQ
settings.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso b/arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso
index 7131e9a499ae1..41a2bb74f1565 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso
@@ -7,6 +7,7 @@
 /plugin/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 #include "imx8mp-pinfunc.h"
 
 &{/} {
@@ -80,11 +81,11 @@ touchscreen@5d {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_touch>;
 		interrupt-parent = <&gpio1>;
-		interrupts = <6 8>;
-		irq-gpios = <&gpio1 6 0>;
+		interrupts = <6 IRQ_TYPE_LEVEL_LOW>;
+		irq-gpios = <&gpio1 6 GPIO_ACTIVE_HIGH>;
 		AVDD28-supply = <&reg_vcc_panel>;
 		VDDIO-supply = <&reg_vcc_panel>;
-		reset-gpios = <&gpio1 7 0>;
+		reset-gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
 	};
 };
 
-- 
2.52.0


