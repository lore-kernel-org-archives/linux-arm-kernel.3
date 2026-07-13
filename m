Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 560EBC44509
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 15:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pfh4lLbCVK5LG8yB3IA/+fVz0G2PykpCGfs0ou1iHvM=; b=FdaqmqQuuGIefwXyI4I+wfK3li
	/hq+cPBdMIofvbcWz5Ctg0f/YVJKGbdUJ80eON33H+ngtw46D6eH51qcUpFkbK+vBzC/kKKj6s+Rd
	XzO3HDnpXKPy1m/jouUjQZd963sA1vDvz8r+PmwrlDzAg19cIcTCnhGx8Yso4OyPi3DAOSXIWKuvE
	hq3xVoxHs7r9YxI636iyrhFecDlp+qbwcYQSqYixhFfm/v5LQdxZYGhYNagBc33UNNt5iAjCzhCSO
	CRbqQ13cNgDNqLx0Lrr9D5+uNHvzo136CCrIqhzgeVzPA1jr5pbCeEJzuZVBR69ajYZsP7g5bZpur
	yMNUCfFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjIFW-00000009jKm-1Mjg;
	Mon, 13 Jul 2026 15:07:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjIFN-00000009jEP-2cBK
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Jul 2026 15:07:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=pfh4lLbCVK5LG8yB3IA/+fVz0G2PykpCGfs0ou1iHvM=; b=IZ+2MoUSXBO9aKvsJEFjuRcud1
	JsHR8NDjLQDlOA/wTLZmrVObQ4bDPI6Rwcf9Gh7CVVA4qi2hwMdBJw7CWO6rC1uMQV4CX67XKN+Ky
	C0Wij7zCFaYHEMOWKID6L9C9IOEw3zdlmEQ5IDXN//xTzlJCVqZe1rKiasqOBRbRIsjqeIWd1P3la
	LV1VHBuyE9LKFDdcib7ZHzc0oJsPbQJo6Ag63lRKT2e3IOtFV/gQyEgckkZ2Bs65h7MJeqrLd/RCA
	boP8cEk9JM7SKk8npO1StfjPckowph6TmRuHtU0jq97DLTGFEBI8rf/aVqLHTgwQNwN0hBffT8nnH
	eJPmoQWg==;
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjIFK-0000000Bkyg-2ceY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 15:07:04 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-471eeac43bfso3212885f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 08:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783955221; x=1784560021; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pfh4lLbCVK5LG8yB3IA/+fVz0G2PykpCGfs0ou1iHvM=;
        b=JNJY42ghE2sG4YNfYIUYsrqSEFU+A8G/y1Chl1Dw2d5X1nikwI17eCaHekPJnkafzU
         7gUIVmQ+o2KQPtYdAC2rcn9UzapbbKtywdZgBekfX5TX8d3uqiujnBd77U0N3cZcGGgD
         dqHZwwO1yJsuEnswkSp3vZNsjAa7grp54c9rODz4fP0OKeQ8RqaMgAJfeAfmur4f9Qyz
         KNdO+9LUtmwz1KRUBk4iDjCDSTNYb3FQAO+GYBoFXAokT2ZmoeMv0QYtErwE9H5LwI2G
         NHTtT4CxGv7Dkm2UCTVq3fMJgBPAywRLk4UnxK1oHf9cmipQGVaDzBu22oOC/tDAQJye
         TUUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783955221; x=1784560021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pfh4lLbCVK5LG8yB3IA/+fVz0G2PykpCGfs0ou1iHvM=;
        b=fNfO5gA477dXFLiJVD1H4/pXmneS/DRR4LNEebIQrx04urnb1a+rP+5lxdzEdxykOs
         8xNuFhPPVtsbkzQwdxjS0Rp3SSKxfGQlMGHqo+H2SuSN5cEmOS24DoCzVFl4GTJgS7Lr
         AAjPap1k/Q39SDUxndFEVH+KmvDIVs06uUgMaYu5HD89lKXiRNZCYNmIWom4i7WDWhlU
         3xHMsjOApwjKRLOjpo9ik6OYFKCxCI0cqdvV9rhpYu+9cv57uiUa413HnObaJsA62f8O
         JDGDcRIe4cj9x5g4OacWvPhaXG4UE9iaiTpRDBzTihATNwCQIgpIxatQdyc+FIB+c8W1
         6VZw==
X-Forwarded-Encrypted: i=1; AHgh+RrFjTGPwMDSEOKQ7ylChBgMCUd9r7V8BvZ0c73NRpMeVOs2CcFJRk5+T1TFPWd2wPgpKQq4S8X5vl2VBJ7DJpTH@lists.infradead.org
X-Gm-Message-State: AOJu0YwrxUsAf/oIFWaUXVc3ynD67ehxPgzifYXsxLrUYZE2PaN/GEzB
	iS0hZpZ/iozaAV79ETxspli3yeu1dOU+oqQu7Pff2CY41nfEYcX3e+ZT
X-Gm-Gg: AfdE7clBrAPaJ63mz2hTWrXvEGLvnwOVmcVyrPtfzCugGeyDd2QTSPg4ylQ3NHta8e+
	3Nxua6z/ild6ei/NaWogL8S7LEaBbiAPDAAvB/9iX4Qhf1uePi0sxmpqMiovFTYF+82YKCo86/O
	56JPi4AhMdNHR6mIf920u85JQxBwkeSgmTscwj8OUUteJiO6JenQ9sGbtK2j8B9LWVOlWW5NSBS
	HbTB7YTC9Pb8yO0JUA4/P59TV7FW5HRVOb2laBfHkmEZbWPmZl8e26j51lsXdsVuBdWLF65rFF4
	UswyPHrVbNTQKUnhWrA8rUWcEhGwdtYDR0zq8cHdZrkMhEu7ihp06EZYZhS9xWJ8QUxhEns4S1W
	6hqabQ8QE5aqaqZLpQyZwDIMloQ+PCHsXf7g01fHxlygc2IriOYIHttf4Bf28/XLZkq8j5jX/vl
	KLUsoBRlM1T2q+dIMfyMfevnk4wB+pIOFaJtSRNHty50qXjsIOFyrr4KCoAkg9Z5Dg2gebrpZbH
	LxjRWxtavuN+wMU
X-Received: by 2002:a05:6000:4381:b0:47d:eedb:ee62 with SMTP id ffacd0b85a97d-47f2dcb50f2mr11326337f8f.14.1783955220701;
        Mon, 13 Jul 2026 08:07:00 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4635a5d7sm19389f8f.10.2026.07.13.08.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 08:07:00 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Mon, 13 Jul 2026 17:06:29 +0200
Subject: [PATCH 8/8] arm64: dts: freescale: imx8mm-verdin: Add Cortex-M4F
 UART_4 overlay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-v1-verdin-imx8mm-dtbos-v1-8-4acd63db4504@toradex.com>
References: <20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com>
In-Reply-To: <20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_160702_940392_E9A03748 
X-CRM114-Status: GOOD (  12.80  )
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
index ed3d678e7c5e..605008d7fe6e 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -193,6 +193,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-ov5640-24mhz.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-ov5640.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-panel-cap-touch-7inch-dsi.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-uart4-mcu.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia.dtb
@@ -202,6 +203,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-ov5640-24mhz.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-ov5640.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-panel-cap-touch-7inch-dsi.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-uart4-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-mallow.dtb
@@ -225,6 +227,7 @@ imx8mm-verdin-wifi-dev-ov5640-24mhz-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-ve
 imx8mm-verdin-wifi-dev-ov5640-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-ov5640.dtbo
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


