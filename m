Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D39B7CA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 11:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ysAADyX7pTvl47KCk7d/xYWK0poDe65ojjsRPrIY4mw=; b=IeuCDT8QdOSi9ILzAUL9KxJZ6D
	IlPunklfLJaN0HAhWcxEMq54h/a4uDzu0AnGrxBxiZoZAI2CFrRuASQUgVimLOkeKedOEZS+VKxIN
	8YyL+We+kJl+Wpm/so+oPolqFjshqRxlKrXP48JlSypIOTPU0UIBhFHpnrjbUyJPAYSvADwXVs5eA
	1Q2zVu1XB8dWnblFEV2Fc5vl6y/Qt9rgjTwHmByYl0fQz9lqRJG+E/7EaO29QS1ytUgm1iRXPACGM
	HjrOjHPPEBpdmWAdaZQEl46zKbpEBofJQwkpP/Iw/oDamitiKdDFSIG/y/j8fcY1yvt8YxaP2TPNm
	z6yu/Dxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCFD3-00000008fGd-3Xu7;
	Thu, 01 Oct 2026 11:44:21 +0000
Received: from mail-wr2-x0e.google.com ([2a00:1450:4864:30::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCFD1-00000008fDz-0Ftv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 11:44:20 +0000
Received: by mail-wr2-x0e.google.com with SMTP id ffacd0b85a97d-48af0707d41so1436732f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 04:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790855057; x=1791459857; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ysAADyX7pTvl47KCk7d/xYWK0poDe65ojjsRPrIY4mw=;
        b=ppzjIWvHGAAENZNZ+tHNp15PQwgV/5KY7epLMCzqc43kt+JLQ8NWvfN9Y1l/dWflcU
         YngWXxjhiO4LM0daFN2oBwOpsxufK1kWWAgkXzKWxqdGIJrsG586I97wZjwvvGKtTCf4
         SrTQY5Fugdw5kaLnu/aaJmwovRGR+hRUqyD4EGPbwP3twFSb0KNVUb0iTtvs2msT8JWB
         6+tVes6AU9ndyWIMCRVfHyEIHxo/tdu5UlMwF4rpfr1Wvp+GdIwOBsZ7qVawXvgTaTvL
         /7NiMcSOVZDk1mSGTWHzvfSI1Zgk2+Wyk+wgtkZUjyaPMn9XdJGWBSS6s5F8dNBe/fde
         +PqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790855057; x=1791459857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ysAADyX7pTvl47KCk7d/xYWK0poDe65ojjsRPrIY4mw=;
        b=dGwwm+xkI39b5XJdxLdbXet+8LteNGlcAkIi3J7B3HQPMb9PByoQXjTyUY2bT10JVB
         JVyHS4J323o4C9IAY9fvT9peS62SNp1y+DoL800A7xkE4WhI69QzfN4Yx5k18oSfmDuG
         XnGO6GbSdVBX+SI2RgM3sYjfbFnYmfjPsKHGrdEZUQhhPPuUdlAyiQfVMATlClLhcxwu
         1R9MP/738lE8ZLLfqj8kkdZvHu4b4GSa1XFYyvKf/ENQTdl7c/A709l/C207CmKMH9k/
         oLK57dKh3PcOLj7dIiLvRCszfmDVHu3nJs7B1/9+RH+FTCEmddnN3rolj2G+iQapqhUT
         wd3Q==
X-Forwarded-Encrypted: i=1; AKwUvBzvrZuacxBiEllYJoJWZvusIcSQRW0uL3LiYIbKgXU5r9pcauXQ/2we1GGLyGfjc5OLKbXQ4+J86xwob1hWHYZl@lists.infradead.org
X-Gm-Message-State: AFq9FYKSQL8xy+rKIq8gDAvgTD2nJhIRe0RdwKXrqLwAVSwRn3Xi/vb0
	9E1Pwo0py7M6ydFigxnixXYDFRFK1Ryot/82McVXHH4h7iw0xNGij+Hj
X-Gm-Gg: AYBFou2YiGzsZwTj5BAS1HGmaZwFGx2XXe5JeFy1r9SThfMyeZ1qVujkVGH8o3Dhbi+
	VHImuMaD5ttsXUi3Mi73iu6pmUfRk5XMLEzW6HRZ/MKOqAtubOXjwBoC2xvedQeSL/E/YuFybO4
	f9/vGl2rAM0tbHfyHEyc/u35JVjkiEPzHbbtireOCkM1izH69djkal3K+I3uSBqQtPwjc09ZtF8
	jbXfhEsW5KME8aY4wPHauJK6fYvtChLhbhHkJMNjacYTotcZ/+z8yOq9wBCFc7ObnRL+egTNDWi
	bZjbL9VSIR/hLCiGlbjAEUW2/NIAxtQAlKD18oo0N/xG6cI4h7NoU8XYli9yrwHBxHlgJLj77Nd
	y0XRLqEfW2VjZ97IdoBV4pQwXWCAB4CwQrqi/btZwhUTXmDn4y5+j4JIFtUSkDKDs7YynrMP3yv
	WRFe3ZEv2ktMmbJ+gTTMe4xzaoHQ9PJautGOcjrbwLbKVDQctPWcFn3F5ZTYNJFZnRcPr5BmQcI
	j0llGnsng/nP9y8ekocRLNvOF7jNs/KTz32relJIQmbDoIF+w6FX2sHXEeHCkgZJfRQzhgoKA==
X-Received: by 2002:a5d:5601:0:b0:488:5468:c23a with SMTP id ffacd0b85a97d-48b068c8ed3mr4376902f8f.17.1790855057014;
        Thu, 01 Oct 2026 04:44:17 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b1035eff8sm1243705f8f.7.2026.10.01.04.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 04:44:16 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 01 Oct 2026 13:44:10 +0200
Subject: [PATCH v2 2/6] arm64: dts: freescale: imx8mp-verdin: Add Cortex-M7
 UART_4 overlay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-verdin-imx8mp-hmp-camera-ready-v2-2-7d1343ecd3ec@toradex.com>
References: <20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com>
In-Reply-To: <20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_044419_132067_A21DAEDB 
X-CRM114-Status: GOOD (  12.85  )
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

Verdin UART_4 can be assigned to Cortex-M7 firmware. Add an overlay
that marks the UART as reserved so Linux does not claim the port.

The overlay is also combined with the Verdin iMX8M Plus Development
Board device tree to provide a ready-to-use DTB for the non-WiFi SoM
variant. UART_4 carries Bluetooth on WiFi SoMs.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile                     |  3 +++
 arch/arm64/boot/dts/freescale/imx8mp-verdin-uart4-mcu.dtso | 14 ++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 23e2684d6923..649be5b6aab4 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -736,6 +736,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev-dsi-to-hdmi.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev-uart4-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-mallow.dtb
@@ -744,6 +745,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-panel-cap-touch-7inch-dsi.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-uart4-mcu.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
@@ -761,6 +763,7 @@ imx8mp-verdin-nonwifi-dahlia-dsi-to-hdmi-dtbs := imx8mp-verdin-nonwifi-dahlia.dt
 imx8mp-verdin-nonwifi-dahlia-panel-cap-touch-10inch-dsi-dtbs := imx8mp-verdin-nonwifi-dahlia.dtb \
 	imx8mp-verdin-panel-cap-touch-10inch-dsi.dtbo
 imx8mp-verdin-nonwifi-dev-dsi-to-hdmi-dtbs := imx8mp-verdin-nonwifi-dev.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
+imx8mp-verdin-nonwifi-dev-uart4-mcu-dtbs := imx8mp-verdin-nonwifi-dev.dtb imx8mp-verdin-uart4-mcu.dtbo
 imx8mp-verdin-nonwifi-yavia-dsi-to-hdmi-dtbs := imx8mp-verdin-nonwifi-yavia.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
 imx8mp-verdin-wifi-dahlia-dsi-to-hdmi-dtbs := imx8mp-verdin-wifi-dahlia.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
 imx8mp-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi-dtbs := imx8mp-verdin-wifi-dahlia.dtb \
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-uart4-mcu.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-uart4-mcu.dtso
new file mode 100644
index 000000000000..74d90b39faec
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-uart4-mcu.dtso
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Verdin iMX8M Plus UART_4 for Cortex-M7
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


