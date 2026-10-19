Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53738CCF2E4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 11:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EvDp0WFEeyAl+OoOvKN3vOw6sm+QjhbDzPXRSM8jJo0=; b=Gh9k7W+9bcYAqSTYNpvY1q2mUP
	o85Vu6pCmDy8Zue2f8RxSXz2OYPPctz4RNrfAcy6mmFqE3mnDMPZ5vlEZ0y91+AWp9mOrfM4/RmeZ
	7MlCioULGYFyEMz651bDrIH/pSu5zAroq81LqcYd5AK9/F3UAw4hFzQScqX3TYslmo2vOJrToCX+J
	O0S7erA4L85juolCC/ajGxZLckfaNMwLDkKuGJDfDzDSVaXmsdB3vDmnnV7sFOs87pl4+Md3Pb00D
	JXZe8xBszdfeWrfL0JLFim8BH9ys8cr9QUQrkiIfOL18Nx1fc7MDalvqroe2cwbh/0xi3TQv0RBzl
	QSIkjd7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIlOE-00000007H3t-33hI;
	Mon, 19 Oct 2026 11:18:50 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIlOA-00000007H0u-1aUf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 11:18:47 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so24773925e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 04:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792408724; x=1793013524; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EvDp0WFEeyAl+OoOvKN3vOw6sm+QjhbDzPXRSM8jJo0=;
        b=ATOOWJurbbFYTvASckou0o810mxNjcGOFow8ER3SVFAs98CF7DOyoJqQr6J5wnb4oD
         3zoO/J4c3JW3m5Zox2KDUyugKX2MATw0F7CcmfS4urAc9QZ2a7GQkmySZn8NMUheWMQz
         wBTKpne6gmOcxvkOvtSnaf86p2VTQ+7U4aZP9/k+MmtzUVeqsC7RIk4tKwN82izSJ/Ck
         cNtxJiKmigPwDJqnPIkkdx+4h4Qb3SLmgfgKXXNJgT6ERszuAVE80Ch1elQgvQ7p7040
         IQwQM427Ge77KVvlqGKVfLUMq0d9QDg8o/fOiUmaCbyzEn8AKaBOVo8SIAxlSoW6pgF0
         HKpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792408724; x=1793013524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EvDp0WFEeyAl+OoOvKN3vOw6sm+QjhbDzPXRSM8jJo0=;
        b=xqz5kfPDcrgfL1czhhuuM+GUR/D5FsjX4G6sqMR76r4E+HN7jTWnUxaDJR+GQ1HrHC
         to3ig3e29XfNDbQyTfEpGbRXosIceJrjZDIWKyjqWwek3+tl7EfYJgT9oyUcgogT2pTL
         uYAjJcUiRktoYU/KFuGWzJmwsDT1qwtP2fAzWo/712YA0NquqjmYGNjvdNaDEV3F/Fmi
         UQWbqm0ZdNxLEZgOoFkwuZFZe9u2Jqc+3yK1beuwP9JAsuMwtB7Nkl2xZ0D7b5Gm84gX
         FP/PoPmXY8oATgTvaHuHpzTs0HVbNdhI3QU93XHqRn2WEoDTXMXPyIpx8Ql9ywWEOZnx
         1UAg==
X-Forwarded-Encrypted: i=1; AKwUvBzChQbpxOhVMB1DOomiNfvfR/qMsskv1XpPbTf3mRnGw6HhcJEK/5XlAtq+0SigRRzSOntw8xIzXI75nb/4CdtV@lists.infradead.org
X-Gm-Message-State: AFq9FYJh4iFmnDKKsaekc8XByPLuox9/1qGKQz/Ugrp122byVapMusUS
	XoB8nCgnDfMeOfiYowWjakK1Uvgdo3QlHMzKnud0InMYySOarUAM6uZY
X-Gm-Gg: AYBFou2/J7U4LjA2Wwgw/V9HIgFEUHi0kH+uCrl70u3FxkjFS452zVVUq9VKUeGJ+CU
	rONVygLvWUzT9JmAWl9dXTNE22Iuwosx36N5RRBIyhBftubEEIjcAueAHomXUft2OSh9dmvS8RZ
	rx7GvCLlwlUYiZJsCMwyq33gjNsAtI40LbishpwGe52wg5+SrvZb6jZfMc1a9iheWy+yABsRMKr
	YgUhx8jWTV/7GDcaR133Bw0b145k5jsfSyfu2xdxfm2365eoCA18FCZ+OsxwsbaK6x7wjAQ94wu
	SEetiNIKavYL9rSrX7lriIV+wEKvuOnL86UBINIJ82SrwT9enAJbLbRyFlflLn0kOLNQOOv/SL0
	ZrrHa00Ajz3N0h4Bs6fHeq68/oL1e6/W8KW4toNdiHktNmJU6WpRbRQEnvPn7Ur2B7h+b9i9M5m
	DEKS1ZKoNKni01L/uCQfrH8UirjZq8D4iCw3HX0GqRpCjXBbq3oahckJxskGO4a1na67EOo86La
	U2vspZPSUAMk3z+wk/wP+v3Y3LYnPe9D0gTmkRsf7KRStcDnYnizOIITwV4WVAgnh4lKrK8Yxmr
	TDyXumwD1N14wpnYnmWCGA==
X-Received: by 2002:a05:600c:1392:b0:4a1:62b8:9aa1 with SMTP id 5b1f17b1804b1-4a1d75aa87cmr173201555e9.2.1792408724379;
        Mon, 19 Oct 2026 04:18:44 -0700 (PDT)
Received: from [10.0.0.136] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1e3ebb3aasm193183505e9.0.2026.10.19.04.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:18:43 -0700 (PDT)
From: Antoine Gouby <antoine.gouby@gmail.com>
Date: Mon, 19 Oct 2026 13:18:32 +0200
Subject: [PATCH 3/5] ARM: dts: imx6dl-colibri: Add Toradex Capacitive Touch
 Display 7" Parallel with Touch Adapter
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-colibri-imx6-overlays-v1-3-e4d028727382@toradex.com>
References: <20261019-colibri-imx6-overlays-v1-0-e4d028727382@toradex.com>
In-Reply-To: <20261019-colibri-imx6-overlays-v1-0-e4d028727382@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Antoine Gouby <antoine.gouby@toradex.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4582;
 i=antoine.gouby@toradex.com; h=from:subject:message-id;
 bh=tztsGziNQEcNmWY0BqahbIqgqteAXBpXCYB6S3NjaSU=;
 b=owGbwMvMwCWm0rPo7MxLN2YynlZLYsi6+qd//yk2n7UTMx/2TFWIXJbWnRq3JTe8fVqVxCcfo
 Zo9k0qiOkpZGMS4GGTFFFkynqgK8imEyHpwNCfDzGFlAhnCwMUpABOxrWRkmJbC/FhV+sWVskVP
 dvye6bT02PxTFiKS1fsNEu88z/pVqsnwz7LKsY+NQdNhx3s/38ZTRvd97BbpWNct4N3C+vyTogg
 XNwA=
X-Developer-Key: i=antoine.gouby@toradex.com; a=openpgp;
 fpr=68E425110E20541D48088363248CA2CD99D2D899
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_041846_475026_09D90C41 
X-CRM114-Status: GOOD (  16.38  )
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

From: Antoine Gouby <antoine.gouby@toradex.com>

Add a device tree overlay for the Capacitive Touch Display 7" Parallel
on the Colibri iMX6 parallel RGB LCD interface.

The panel is a LogicTechno LT161010-2NHC 7" WVGA TFT Transmissive LCD
and the touch input is provided by an Atmel MaxTouch capacitive touch
controller.

The touch controller is connected to the Toradex Capacitive Touch
Adapter, the connection to the various carrier boards is documented in
the datasheet [1].

The touch interrupt and reset signals on SODIMM 28 and SODIMM 30 share
their pads with the Colibri PWM<B> and PWM<C> outputs, disable PWM1 and
PWM4 to avoid the pin conflict.

The overlay is also combined with the Colibri iMX6 V1.2 Evaluation
Board v3 device tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
Link: https://developer.toradex.com/hardware/accessories/add-ons/capacitive-touch-adapter/
Link: https://docs.toradex.com/104615-capacitive-touch-adapter-datasheet.pdf [1]
Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                 |  6 +++
 ...nel-cap-touch-7inch-parallel-touch-adapter.dtso | 57 ++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 7897d9dbdfac..4f59ef0855cb 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -88,6 +88,10 @@ imx6dl-colibri-v1.2-eval-v3-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx6dl-colibri-hdmi.dtbo
 
+imx6dl-colibri-v1.2-eval-v3-panel-cap-touch-7inch-parallel-touch-adapter-dtbs := \
+	imx6dl-colibri-v1.2-eval-v3.dtb \
+	imx6dl-colibri-panel-cap-touch-7inch-parallel-touch-adapter.dtbo
+
 imx6dl-colibri-v1.2-iris-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-iris.dtb \
 	imx6dl-colibri-hdmi.dtbo
@@ -141,11 +145,13 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-colibri-iris-v2.dtb \
 	imx6dl-colibri-iris-v2-hdmi.dtb \
 	imx6dl-colibri-panel-cap-touch-7inch-parallel.dtbo \
+	imx6dl-colibri-panel-cap-touch-7inch-parallel-touch-adapter.dtbo \
 	imx6dl-colibri-v1.2-aster.dtb \
 	imx6dl-colibri-v1.2-aster-hdmi.dtb \
 	imx6dl-colibri-v1.2-aster-panel-cap-touch-7inch-parallel.dtb \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx6dl-colibri-v1.2-eval-v3-hdmi.dtb \
+	imx6dl-colibri-v1.2-eval-v3-panel-cap-touch-7inch-parallel-touch-adapter.dtb \
 	imx6dl-colibri-v1.2-iris.dtb \
 	imx6dl-colibri-v1.2-iris-hdmi.dtb \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-panel-cap-touch-7inch-parallel-touch-adapter.dtso b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-panel-cap-touch-7inch-parallel-touch-adapter.dtso
new file mode 100644
index 000000000000..ffc54438d33b
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-panel-cap-touch-7inch-parallel-touch-adapter.dtso
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 7" Parallel connected through the 40-way
+ * Unified Interface Display connector and Toradex Capacitive Touch Adapter.
+ *
+ * Toradex Capacitive Touch Adapter connection with the various carrier boards
+ * is documented in the datasheet [1].
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
+ * https://docs.toradex.com/104497-7-inch-parallel-capacitive-touch-display-800x480-datasheet.pdf
+ * https://www.toradex.com/accessories/capacitive-touch-display-7-inch-parallel
+ * https://developer.toradex.com/hardware/accessories/add-ons/capacitive-touch-adapter/
+ * https://docs.toradex.com/104615-capacitive-touch-adapter-datasheet.pdf [1]
+ * https://www.toradex.com/accessories/capacitive-touch-adapter
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&atmel_mxt_ts {
+	pinctrl-0 = <&pinctrl_atmel_adap>;
+	/* Colibri SODIMM 28 - TOUCH_INT# */
+	interrupt-parent = <&gpio1>;
+	interrupts = <9 IRQ_TYPE_EDGE_FALLING>;
+	/* Colibri SODIMM 30 - TOUCH_RST# */
+	reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+};
+
+&backlight {
+	status = "okay";
+};
+
+&lcd_display {
+	status = "okay";
+};
+
+&panel_dpi {
+	compatible = "logictechno,lt161010-2nhc";
+	power-supply = <&reg_module_3v3>;
+
+	status = "okay";
+};
+
+&pwm1 {
+	status = "disabled";
+};
+
+&pwm4 {
+	status = "disabled";
+};

-- 
2.55.0


