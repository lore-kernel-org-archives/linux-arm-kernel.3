Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D76BEC53200
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 16:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oca1257RcNleArjY25A/HuTOrlgfLsamKajTMfVExe0=; b=117q1yp3liEX5DQadUlFBbb+rD
	49uSKQhayAKJo3O9gPFzDsmr5A9xWeApR3v+QJfWBDBeJfletSeJYOBuYXl0jgKq7jva+g/qllpAw
	aDwrxAwCYqiZfGAP7JPKwEdpi74iyHigGfPYSPQAYgxZUHBjtUCGsYGcmN5Tp3DGwKP1vahyRPefl
	g+sastljyG3DfVM874fC7kv8GtAzH1Udtmg7/tqo1STpr4SodtevzXvel+3riNXmc1AwEslVUhmbR
	qTEczYgqw9WqB+M6uO2rdmy3LwOPTOoMGvY650FmhoQyn2njKuPDahvJDIMzRII2kvqu1MS3DZDY+
	GjnT2U/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnIiJ-0000000Gq2Q-2U74;
	Fri, 24 Jul 2026 16:25:31 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnIhf-0000000GpYo-0UqM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 16:24:52 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-47de0093c42so544207f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 09:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784910289; x=1785515089; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oca1257RcNleArjY25A/HuTOrlgfLsamKajTMfVExe0=;
        b=iEvsNCP7JXDIFneRI5EsMUNzPBh506HWE9Kii+ulFi/ItJOiBe9nx4Ktz+kTH9JFIz
         obrCLqdNUBv2wQ0i8eG2vuopoBX4CvwucOdWy/1ngTj3zfdEzeNNYT/jPkD6MyXVbEjk
         rfFmq/ahlmNElbfUzRWHVu4xF51D/NV8VarwaCa9JT1gXuDZ1I81yIeAvRG+PFOurKzc
         Om4mOpYOSQJlDPHl3j1iVVX0DjfJIXPaMrRm1VjBioV+5Kyy7PNyDg7TE0Mshoi0AXzE
         AdWvDOuYaTKtFrqpxYeD+IBDkzokHxC0zhgOm+dztz36Xopb30uqxrZfVLtxfWM1noqw
         5Tvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784910289; x=1785515089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oca1257RcNleArjY25A/HuTOrlgfLsamKajTMfVExe0=;
        b=eMYyOTIlbFfBEF4IHErDp53h2z2krE0UWZ6wTecddvwzlgboWaZZyhddAOOedcq/n7
         78CpPCE7PvxOgs8GMDNcppPWHF6xokt0TgO+j2C2KcvC1kKyjjqD0XCLw2V4Ik/WR9Q3
         g+9uEhYl85AJFBXmUds10rXYNMd20WREfxUeI2nfDnNLIoo2zzlG6vg89bmgpR3Noz0Q
         bg3pnJYSEHJ5KU+uQQpbsd+lfO6iXcsuJBLOS9ySf75+o/RKd/MLciJMyZcMP38mLYUd
         vzCIDdOAhWWuN9IzJZ4r5zxFI8me3FRUWwAg3n6FF8xaSfv90sppg2ULSlPOS0MSg+rO
         KitQ==
X-Forwarded-Encrypted: i=1; AHgh+RpCQuwFByugPdAu1HUR22LsParK9h2yS1u8xNwuVWE4iMNhabq9yt+DWXqCnMzYUI+6SWsx9uSarwgRb/Fy+v2p@lists.infradead.org
X-Gm-Message-State: AOJu0Yzij3+WIYLhuPtD2aYvYxCTdB4R5qMU+f6WJ3vzYlJ0RmbRTq75
	0XHb84E5Uq8lCHfgCtIyR3Kdv21w8/I0va/xa2buUcGTvgeH+LIcpaHe
X-Gm-Gg: AR+sD13bstz2gKqzWtzYQjyJECAZyQ2+WbVjQuZ5n6tlQhDB5tJkrze11Onj5AtTrjR
	XJGmGPOMiVMtIohZ8cr65JZrKUzmKz2jv1FiPyKprpf4yaO+zknWRQ/ipzxUGEDKVryQvIPH8+B
	/vFL9ka8LTD/uFpN/XjVbRihIBgH9wDX0C04VCo31XDWQSbguvZgw4goxiJA/Q7kIAsWT8JoKPW
	Soiz6HoZ7vQruKimrahSYx7u59tQIQM51EzxwEFegCDQhbZ74mz9+o3VZgt0NSiPj/31O7uQYT5
	7sUdHOaXBBGPugF0YbXt2rdSd1GEDgGW1nRRN9wr/5I2qApXhM1vL2HEkOQf4kgsC+5aWdY8HS0
	cuyL/e/BjdimOE1voYqqnTHjvK9yjRhgFvhn/ECM2cteORtWIsz6ab1dMj376E3IdGEUEgox9CK
	68hhw3Cd/K8CLhzYT96ERfa2tNl1NmudrkSqKT5FjHsm6MUsr72v/EtnOECYjw4uEjkd8ru7fiO
	VoPyQ==
X-Received: by 2002:a05:6000:1869:b0:47e:8e8a:43f5 with SMTP id ffacd0b85a97d-47f8d71c758mr10505852f8f.20.1784910288925;
        Fri, 24 Jul 2026 09:24:48 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a5d9sm24366255f8f.5.2026.07.24.09.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 09:24:48 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Fri, 24 Jul 2026 18:24:33 +0200
Subject: [PATCH v2 7/7] arm64: dts: freescale: imx8mm-verdin: Add
 Cortex-M4F UART_4 overlay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-v1-verdin-imx8mm-dtbos-v2-7-9d7988bd76f6@toradex.com>
References: <20260724-v1-verdin-imx8mm-dtbos-v2-0-9d7988bd76f6@toradex.com>
In-Reply-To: <20260724-v1-verdin-imx8mm-dtbos-v2-0-9d7988bd76f6@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_092451_182974_F8FF884A 
X-CRM114-Status: GOOD (  12.34  )
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

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Verdin UART_4 can be assigned to Cortex-M4F firmware. Add an overlay
that marks the UART as reserved so Linux does not claim the port.

The overlay is also combined with the Verdin iMX8M Mini Development
Board device tree to provide a ready-to-use DTB for the WiFi SoM
variant.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile                     |  3 +++
 arch/arm64/boot/dts/freescale/imx8mm-verdin-uart4-mcu.dtso | 14 ++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index fe261d7bdab5..95ae85ab4adf 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -192,6 +192,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-panel-cap-touch-7inch-dsi.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-uart4-mcu.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia.dtb
@@ -199,6 +200,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-panel-cap-touch-7inch-dsi.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-uart4-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-mallow.dtb
@@ -220,6 +222,7 @@ imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := imx8mm-verdin-
 imx8mm-verdin-wifi-dev-nau8822-btl-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-dev-nau8822-btl.dtbo
 imx8mm-verdin-wifi-dev-panel-cap-touch-7inch-dsi-dtbs := imx8mm-verdin-wifi-dev.dtb \
 	imx8mm-verdin-panel-cap-touch-7inch-dsi.dtbo
+imx8mm-verdin-wifi-dev-uart4-mcu-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-uart4-mcu.dtbo
 imx8mm-verdin-wifi-yavia-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-yavia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
 
 imx8mm-tqma8mqml-mba8mx-lvds-g133han01-dtbs += imx8mm-tqma8mqml-mba8mx.dtb imx8mm-tqma8mqml-mba8mx-lvds-g133han01.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-uart4-mcu.dtso b/arch/arm64/boot/dts/freescale/imx8mm-verdin-uart4-mcu.dtso
new file mode 100644
index 000000000000..8dbecffe9e7b
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-uart4-mcu.dtso
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Verdin iMX8M Mini UART_4 for Cortex-M4F
+ */
+
+/dts-v1/;
+/plugin/;
+
+/* Verdin UART_4 */
+&uart4 {
+	status = "reserved";
+};

-- 
2.43.0


