Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3040ECA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 08:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5CmcYL0XK1JJEyDbPwadIyEyX0pGtm4tcAMQK4meqBo=; b=p4of3BplPfREnoQRTp+fVPtZIb
	1Ybq+9LyXEbCAYdfcrVO6L/uLEpo/t2FMy6Pw8jBL4HNyc1/LYDDKDBLeByIpxgFET2c9a51sY7Vv
	sXF2yY2EaQKx5uF3ix7xljQVyRmT1e6mMCE0PCX1qO849cSkNpyqaBoghK0VB5av3fdDoAKYtronZ
	39mgwcYbWvg6W6npcv19CVlyXqzT00IGeVt6cch4kZlANrBVt0as/w3bw5fKe/d+WjZjMXgQt5Tf8
	V3GdocIgGUturZL3k+5gEcEEyPYFzzZ3IHxhK1DRn+LWVpWiXmEOBMcbt9Yg5aH9sdWm8Pc8GMVs+
	2BQlpKhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCNw-00000008EAJ-0CnF;
	Thu, 01 Oct 2026 08:43:24 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCNs-00000008E2v-2fPr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 08:43:21 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso57265155e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 01:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790844199; x=1791448999; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5CmcYL0XK1JJEyDbPwadIyEyX0pGtm4tcAMQK4meqBo=;
        b=dBH+wh9hrElIailLk7AqDuSK30wlr8XJGerGf9mVUzRTH5de0x1MX5Ymp0wI3EMsU2
         VnRAxK3N2YojSz97d6riDKLmF3NPG6doIMFNGjzd/zCUCPs7OEhwv89XdH656TzBvQdE
         xOdPnQMjfiT8m4Yd18ysgvd73jfWaEcn5FKStKzY4BTm9sPhxDokLSfJqU1th6KU/wu/
         FelwbYKqAs3IxwOa6SFmUTfGbXI0LhxgasLnlaheu9mrCr3lvmNMFI0srcq0EshNshsY
         nuvxqycPZPGqLmu3ehQrUQwMSXLshrFWDYa1b8rX3PcG7hpAXvB9ego8RXq8aLX0oiXm
         N/dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790844199; x=1791448999;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5CmcYL0XK1JJEyDbPwadIyEyX0pGtm4tcAMQK4meqBo=;
        b=r/GTeqi29ZVB3AUFa1DjZxkIlHPGux6jry2QJkfyX5a9Nr7QaMc+OBguZqVBzyh4+6
         5r2NLdk4DnjuWfvZg8r9IzOlZxXTvnS6hkz8RA0A9WOUSmYeSHBwnwjxhPdwRmo3s/RA
         WZ1YeSreO4c2dZIR3Qgt8ODwCEY65nOsvUdOt6tLO5nTBkQcWy7sC31Tqc+TDPpbDUwd
         6vVY+3RXogC2vb5iegTfb/hHspwCbFB4RwnkEULxRDRyjqZqtkfZcM44Ky3VVeaIuOjO
         PDOi41STlWwPoebg7C3Pro2vJf2JbLlkl2Lnc6Qa4n/PSLYVyQ4m1ACPxtk/afzVFgqY
         n/pA==
X-Forwarded-Encrypted: i=1; AKwUvBwpj8opLw/AUgogwN2uJW98azpvFXeDyGmxnI1AT/3vm5dzIQLLnnI7+zy4iil/1C+vaYkn3OmiWf06C/3fgSnh@lists.infradead.org
X-Gm-Message-State: AFuF++laQ7c8mmT+q47jS4fgrneU0d4ApqMxZD3Av17Ym97NDV2be/hX
	nlNxO8E1qlf7vHe5aovdgJdIKnSdjJmB0vFpRDYy4sZStDCeuMyaEr6D
X-Gm-Gg: AYBFou11ENMAAhbMxwe3KZgyuqDNAuYcxFy7z6bCF1TsXIT5alLWuMusZRrlfgtmoio
	JHg7vjc3V43K3n0qpHb0tzb0JQxFrreAsHG6YqYFzMDvohAB1cSMfLmUQV22kyCFAzBzjmmfwLN
	nLQCSxgsyJ6WnQLsOJqeo0EFxvErVJNyziiI33/YRykvnyQEuUiUbtalUM3CSUbp7I2ggHfCMo8
	CulF2xXK0z9YQGpSTorItGIWdeGAnmMhTUi4XvySoal5yk578OvE4jhKEAHwMmhzj1N7cjjDwAy
	88j8aYOmFAzWQlipPqqARb1h70OW5TbBjakN9L+ip0SGfFFH878YPVziQa5U9679A9EP3ZaJi0t
	H+fKN9WCgJX/SsV6fA/4HoyspcBsxMtGDhtBVZvMc9EVWZCduPca1Y6SrvTOb8M2yReN27CMwa8
	fOlKrndJ+yWuvDblER8xmMNETxKBJlQo7wWeq8Bxq9GGfJyGxwDYOHhPwqzJmbv6xJru/YEaXZe
	RGJZLvIp9+Ow+qLWPo0e7UodlqQ0Q2rbM6gnEQI0xuwbmZ9NfjreJtFQTSeIB+oIRyTLGKejw==
X-Received: by 2002:a05:600c:3b1a:b0:49f:c451:b4ab with SMTP id 5b1f17b1804b1-4a01b12b310mr67078895e9.29.1790844198541;
        Thu, 01 Oct 2026 01:43:18 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f949709sm78177885e9.12.2026.10.01.01.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 01:43:18 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 01 Oct 2026 10:43:12 +0200
Subject: [PATCH 3/3] arm64: dts: freescale: imx8x-colibri: Add Cortex-M4
 UART overlay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-v1-apalis-colibri-imx8-dtsos-v1-3-21881dc324c1@toradex.com>
References: <20261001-v1-apalis-colibri-imx8-dtsos-v1-0-21881dc324c1@toradex.com>
In-Reply-To: <20261001-v1-apalis-colibri-imx8-dtsos-v1-0-21881dc324c1@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_014320_712807_88E8FBAE 
X-CRM114-Status: GOOD (  14.64  )
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

Reserve the Cortex-M4 UART and its LPCG clock provider for firmware.
The UART is already disabled in the base tree, but its clock provider
can still probe and participate in Linux clock and power management.
Mark both devices "reserved" rather than "disabled", as they remain
operational but are owned by the Cortex-M4 firmware. Firmware must
configure the UART and its pads for the intended MCU application.

Add a combination with Colibri iMX8QXP on Evaluation Board V3 to
validate the ownership changes against a supported base.

The overlay supports both Colibri iMX8DX and iMX8QXP modules.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile                 |  5 +++++
 .../boot/dts/freescale/imx8x-colibri-uart-m4.dtso      | 18 ++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 2732b223eb3d..61dbab287a35 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -832,9 +832,14 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qp-apalis-v1.1-ixora-v1.2.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-ai_ml.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-colibri-aster.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8qxp-colibri-eval-v3-uart-m4.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-colibri-eval-v3.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-colibri-iris.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-colibri-iris-v2.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8x-colibri-uart-m4.dtbo
+
+imx8qxp-colibri-eval-v3-uart-m4-dtbs := imx8qxp-colibri-eval-v3.dtb imx8x-colibri-uart-m4.dtbo
+
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek.dtb
 
 imx8qxp-mek-pcie-ep-dtbs += imx8qxp-mek.dtb imx-pcie0-ep.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8x-colibri-uart-m4.dtso b/arch/arm64/boot/dts/freescale/imx8x-colibri-uart-m4.dtso
new file mode 100644
index 000000000000..c43be136a46d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8x-colibri-uart-m4.dtso
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Colibri iMX8X Cortex-M4 UART, reserved for firmware and not used by Linux
+ */
+
+/dts-v1/;
+/plugin/;
+
+/* Cortex-M4 UART */
+&cm40_lpuart {
+	status = "reserved";
+};
+
+&cm40_uart_lpcg {
+	status = "reserved";
+};

-- 
2.43.0


