Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E94A5C5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 13:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9VTj5OSqqn1KbxjYRZ/gK5NtAndnbAvST9Z9adSq3CM=; b=y5y67qQ8bxTxIJWGaX+ClpqRjr
	nkmU0t3ohG08ZqM+eDpB+E3xzR8UpTFBHlACCEbaApiP7SGgBRs16aIbprPu+4URq/ifuqHYJabLQ
	xeXwZDJ6amuG6JWcKhMqJp1jC0zB5lm1P6JAU7JRNdXR7KCv6Hlo7top3ax2dxnywrb4VFz4Lf2XL
	OWpK9MEx8Gk/s60O3w5fqLU2DcllH73wAfEuB0br28wHnS+/OR9HcQlJJ+Ly1xatgZsQu15YoOiBm
	N4Wriy3SIGsEP4rbM4S+i0/OqQJiVvVACkxWXQxOfzMzzF3ISuFPDP2p1mjq6K04b98OGo2Yw021N
	r0codMEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuVaA-00000000kqi-27BB;
	Thu, 13 Aug 2026 13:34:54 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuVa5-00000000ko1-3WC6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 13:34:53 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c96c92c0980so1362406a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 06:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786628089; x=1787232889; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9VTj5OSqqn1KbxjYRZ/gK5NtAndnbAvST9Z9adSq3CM=;
        b=FZXkNjfaK9lklQaoh42gNptvXhWzZ7+1oDbEbYq/gHQHzRjdwXRvQv6tjPqclIaofZ
         wA9xPkEIz5F/Ter6hi3gzHWQQ880qNWHEFoR8M61MKe8PzqYUAsDNyLoiwqb0Gjbl+lL
         z7Gt9avkaToxg/QDkh0rTw90ErxLX+UlB7eItfopKkcfyMAP5LkCDxnUR3cBaJwU9KWZ
         R7u7V8TAM6cRIIk2LeSdAZF1PSrRAJ7DJZjT2N0s9p9pYMlJchE2Uto/UCma92SXTrre
         lo8bEulcuG96gdWHnzIXoYzoDz6g6gsMreXrk5g+CR1DDe/1ef6dJzvZ5XDyKZcAzN5I
         m5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786628089; x=1787232889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9VTj5OSqqn1KbxjYRZ/gK5NtAndnbAvST9Z9adSq3CM=;
        b=qnh7jlxuggVRIp5MTNtIlNYky3S2TuWmPt8G8JOtBgdAcAK1buRJUduIBmPtmdYqaX
         KyWqZC9NFjh9rFUUcjJS8RtIjGthPr0JXYejN5ayzua4/YVEMdoF4Bype+dmVVaWXWDx
         zPkTmgre3aewAL8uKbxzs6dhmKtZQCv05D/UI3JARvl/ZrOCOXLMQ4qmbtDailoACf98
         skrmRaQgFtVVGOb5Qnf0p7bhXmI5U+72twSha9pu7otQHGSDMyxOsJu1C832nLljqfoY
         ZH5rqPOCiJgbe3wrBYk6YmxE2pb/HJEBx4EAnlRFZf5S5wU2qVax3jtvG//N84RsucTq
         fZtw==
X-Forwarded-Encrypted: i=1; AHgh+Rp9yLeLIBPT2Sft0l+pzWZBXnEJJD/n1+HqyF4btn4W5Z/phx2z5jRN8XCLul7ZDKkDEzhJ0x4LIDQ7HS7oRQcY@lists.infradead.org
X-Gm-Message-State: AOJu0YzZ4i/066GYoAEAT1Yq+ir6D58gV39voz+MhOpcaA2R3Ip6nXJE
	ed0hpbrTuVS0F954UuXMhqFHpBUuy7cQPPLcKu8vfoeuhM+oZk2tcKN/
X-Gm-Gg: AR+sD12BPDbnU7MsSn6SK71XOZ1g9Wxq4YmhemZZM7KmM/2JJUorN1TrAvv8JgfmDOE
	DC27JBWHyYoZ/fY2wo7ldld+YtJ41vRWMIjtEqjpqLODjRXiMlK9TdvK/Rxpq/Nb2Wkzl3uqjUE
	zWDCA6OX3J2DDRz+h6itnSG0XS1UzhCAssQcJgstDs7xDoeb4l2GIICdRyX713tVLJNc9gRS8k5
	tZlHOUF32HVKB5f8j+rS8doZ7pG52Grc/svgQ4e53qWgxvPp13izcRI1YCsyUyQJLIutkQkmc6g
	9MpFrW+OhgKyqDyRiYpvyYWidfHyh+v82wclsQ5orJREKrumd00t8WpXFwSurZUTbJGIESVXLEU
	euKRtYNjny8xUmheI1xYYAJT7oWf2F7u5aj8QnMlGini5HEZx9zcGplhkqHUhewTrSiCMfofizz
	6r6pzvDa/T13uOPZIT0IHyfcHVYQ/038lbDNjoQTEagU4o3+pPW1NdQhJSaFSEakjVDxU=
X-Received: by 2002:a05:6a20:3d1c:b0:3c3:9df0:2d66 with SMTP id adf61e73a8af0-3cc550cb92amr8355198637.6.1786628088759;
        Thu, 13 Aug 2026 06:34:48 -0700 (PDT)
Received: from leonardoc-nb ([179.160.38.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebc75d891sm8447990eec.5.2026.08.13.06.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 06:34:48 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: [PATCH 3/6] arm64: dts: freescale: imx8mp-verdin: Add Mezzanine with Toradex Display 10.1" LVDS
Date: Thu, 13 Aug 2026 10:33:32 -0300
Message-ID: <20260813133335.1941580-4-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260813133335.1941580-1-leoreis.costa@gmail.com>
References: <20260813133335.1941580-1-leoreis.costa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_063449_885926_B531F778 
X-CRM114-Status: GOOD (  14.45  )
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

From: Leonardo Costa <leonardo.costa@toradex.com>

Add a device tree overlay enabling the Toradex Capacitive Touch Display
10.1" LVDS on the Verdin Development Board with Verdin iMX8M Plus
Mezzanine expansion board. The panel connects via the i.MX8M Plus LCDIF
on the Mezzanine LVDS interface (J10). The panel is a LogicTechno
LT170410-2WHC 10.1" WXGA IPS LCD and the touch input is provided by an
Atmel MaxTouch capacitive touch controller.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Link: https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  5 ++
 ...mezzanine-panel-cap-touch-10inch-lvds.dtso | 71 +++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index c55269a0532a..37ae0954d02f 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -508,6 +508,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw73xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw74xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw75xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw82xx-2x.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev.dtb
@@ -519,6 +520,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-panel-cap-touch-10inch-lvds.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-mezzanine-panel-cap-touch-10inch-lvds.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow-panel-cap-touch-10inch-lvds.dtb
@@ -528,6 +530,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-zinnia.dtb
 imx8mp-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := \
 	imx8mp-verdin-wifi-dev.dtb \
 	imx8mp-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
+imx8mp-verdin-wifi-dev-mezzanine-panel-cap-touch-10inch-lvds-dtbs := \
+	imx8mp-verdin-wifi-dev.dtb \
+	imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtbo
 imx8mp-verdin-wifi-mallow-panel-cap-touch-10inch-lvds-dtbs := \
 	imx8mp-verdin-wifi-mallow.dtb \
 	imx8mp-verdin-panel-cap-touch-10inch-lvds.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtso
new file mode 100644
index 000000000000..ce426288081c
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtso
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" LVDS on the Verdin iMX8M Plus
+ * Mezzanine LVDS interface (J10), used with the Verdin Development Board.
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
+ * https://www.toradex.com/accessories/capacitive-touch-display-10.1-inch-lvds
+ * https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine
+ * https://www.toradex.com/accessories/verdin-imx8m-plus-mezzanine
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/imx8mp-clock.h>
+
+#include "imx8mp-pinfunc.h"
+
+&{/} {
+	panel-lvds-native {
+		compatible = "logictechno,lt170410-2whc";
+		backlight = <&backlight_mezzanine>;
+		power-supply = <&reg_3p3v>;
+
+		port {
+			panel_lvds_native_in: endpoint {
+				remote-endpoint = <&ldb_lvds_ch0>;
+			};
+		};
+	};
+};
+
+&atmel_mxt_ts_mezzanine {
+	status = "okay";
+};
+
+&backlight_mezzanine {
+	status = "okay";
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
+&lvds_bridge {
+	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>,
+			  <&clk IMX8MP_VIDEO_PLL1>;
+	/*
+	 * This display uses 71.1 MHz pixel clock, so IMX8MP_VIDEO_PLL1 needs
+	 * to be 7 times 71.1MHz, or 497.7 MHz as the internal divider will
+	 * always divide the output LVDS clock by 7.
+	 */
+	assigned-clock-rates = <0>, <497700000>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			ldb_lvds_ch0: endpoint {
+				remote-endpoint = <&panel_lvds_native_in>;
+			};
+		};
+	};
+};

