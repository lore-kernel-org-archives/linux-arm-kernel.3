Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99059C98307
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 14:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qRRIQhX840mlDu5Jy0TZNaTjmaBVQgWoS7rcef0gYQM=; b=vXPqZyWZqJNPyuY8CZiH6rN2QU
	xMM2LZkHU+Xm0isiuejE79jVhKdGgroT6FedtE8MzxJIGMfOjtNFFUflH7k3TNUVIktqiOf/IOsN6
	uUt8g60YgiYPqXurNkOrmRug0gyED5WxXeI4o2Wkget+fo9mIJde3SufYB5j+jCTJgxvh9Fb2eZ74
	GRE/xthYW7NIRhkn7nDvdotqE7bH6vdM6vhka4DYYrVkwPM2D7f51r68BpPGh319QYbg9gMgXPUNl
	IoZPHjVURv/uKv7PyvD6w7XbFAkvbmqQ4h74PNq2th6Ey1yKWuvIm5TzxEgyKvTKHRfX7NTqnhYKd
	KLSeGf+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x91ZY-00000005heg-0twD;
	Tue, 22 Sep 2026 14:34:16 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x91ZQ-00000005hag-2jjy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 14:34:09 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c254f56039dso557332566b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 07:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790087647; x=1790692447; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qRRIQhX840mlDu5Jy0TZNaTjmaBVQgWoS7rcef0gYQM=;
        b=H4ykUP40ho0ZJE+EkuOK6kmojKiOcyVsFFmum5SlM3h18rHuL3O5sgbioOhwoJJ4Fl
         MGry9LKt/vZDPK69g9UTaGLfsgW1kMjbX1131u3s3OPE15nFSOWzNrG0jxISlWs4u69e
         xuLZnYUlm42CJgFtBqiYjb5IM6eeed/6gUewS15dQ9zTJJTDQI87LsMUClUODy9xAfNP
         9YvVnDpwvr5HzIOxIk0ZjB8wT0dWH33xG1XirOoacpBL5FFNFbjIGEslKoBoY/zOW7Gg
         dnn+FmxcRs10MgtNFxlys2KVUb5G9lc3ZiwKF8kAngM9ZTbEY/Lox5A4z6KEwlI5k6i4
         x/NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790087647; x=1790692447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qRRIQhX840mlDu5Jy0TZNaTjmaBVQgWoS7rcef0gYQM=;
        b=v+9nFhkCAPbgw2G5U9nyIrfLsg/SQyC5jIVQ/HHFLW0F75EG9ZfXjVHXmxbQpeeKNy
         m2tm1m1Be9yjlnbEU3+A8nvrMMomz1v6LQp3ItnzJ7Q8mhBonStLs4X+6TsjWbjStZFy
         6ijPxJ0/WiygxFbh96weaH5LTdAkoocxltNvM2no1s8zp00WwvEIC7NsmkvUPxOuYQfb
         5EBlMzVa7joZ5htX7llyERM34Qt8/RDbwcRGhiq/i9VcT+QAOwX99D8h0jcOwLgU8Hul
         gyL9GqMQ021dqi0tLnBPhVzxGo/cY2p52hDylolAvb/PGyke+Kd3w4ezySi3ufjYWrXw
         +Pvg==
X-Forwarded-Encrypted: i=1; AKwUvBz8ePUJLpEP0kLpVk4KREqb6qrda1WhoVEc97ZmTNUOzewPH3yr0G7bvFicakgYdCMBoQSRCCtl035k94u0Yo7d@lists.infradead.org
X-Gm-Message-State: AFuF++nLIx0RKzX8lNFFHhPI1hfOBFvgpVsEq9H/kkUwoSIuwbM7Hrfo
	rzHkaBKeth1SS6JZotSRMuXsdBrMQVd10iJckJhV7hWt04FGSAJyT4dS
X-Gm-Gg: AYBFou13M3Zn0SJI5I3EjoQMHG7+uzNkaj8FbJrGBgjqhTHBijH+9FqswJM14wJpCnq
	0+Q7Lfh+xRQWQWb/7yGiJe0PFn7mNEbg4fP3gpPXByLJgm3VaJW6kpgZfgtWGUaCArwMDawPMwE
	zQ/HTJxeKr/LRmUU6uoK9i49Surx/ouNS83TSd11iTVdVzArq6oYlw5q3O0e33TSoFBtpU+Q52R
	GOcT/lKGPq9mzFulf/4yVpTuKPcMIHU4CIkjphIzqvwzipPB6xUpXBDe7wUAA5kkhS7docqqjQN
	5MRzh02ODO23Xi62flznEH+FwOnwlLoCcY/uWm5kvl4i7TjmuE1c+04rgWCHtevt3V6T/Qd06wx
	Ch23f1KLkTOLKrlPpIi0lnDeaD8+Gm6k0vZkXFEkYOch8mtq+FRrQyFxc2E9Ch+FzEu7xz/Zs8v
	UdofVU/3uhR71F3ZFTW3IiLVDXmmFWRJ4d+SjhxkTVHdr7mHt2WXPWV/Twa3AJqcuEkvQfdXZ87
	8e8AofidrMITjZELUUUZWMC2joq46DAKPn61HyHm50YjPywccpFJaW0ZojRpl0/4HZyuxU01A==
X-Received: by 2002:a17:907:d18:b0:c27:420b:7c82 with SMTP id a640c23a62f3a-c2a15e0e909mr1269150166b.48.1790087646940;
        Tue, 22 Sep 2026 07:34:06 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c5814e2sm103469966b.27.2026.09.22.07.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 07:34:06 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Tue, 22 Sep 2026 16:33:48 +0200
Subject: [PATCH 3/4] arm64: dts: freescale: imx95-aquila: Add Cortex-M7
 UART_4 overlay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-v1-imx95-overlays-v1-3-694100afb4bc@toradex.com>
References: <20260922-v1-imx95-overlays-v1-0-694100afb4bc@toradex.com>
In-Reply-To: <20260922-v1-imx95-overlays-v1-0-694100afb4bc@toradex.com>
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
X-CRM114-CacheID: sfid-20260922_073408_717275_DFD5400C 
X-CRM114-Status: GOOD (  13.56  )
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

Aquila UART_4 can be assigned to Cortex-M7 firmware. Add an overlay
that reserves LPUART2 so Linux does not claim the port. Firmware must
configure the UART and its pads for the intended MCU application.

The overlay is also combined with the Aquila iMX95 Development Board
device tree to provide a ready-to-use DTB.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile                    |  4 ++++
 arch/arm64/boot/dts/freescale/imx95-aquila-uart4-mcu.dtso | 14 ++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index c283c582d974..b17fd5b067de 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -954,7 +954,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-frdm-pro.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-clover.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-dev-uart4-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-dev.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-uart4-mcu.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596la-mba95xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596sa-mb-smarc-2.dtb
@@ -976,6 +978,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-zinnia.dtb
 
+imx95-aquila-dev-uart4-mcu-dtbs := imx95-aquila-dev.dtb imx95-aquila-uart4-mcu.dtbo
+
 imx95-verdin-wifi-dev-nau8822-btl-dtbs := imx95-verdin-wifi-dev.dtb imx95-verdin-dev-nau8822-btl.dtbo
 imx95-verdin-wifi-dev-uart4-mcu-dtbs := imx95-verdin-wifi-dev.dtb imx95-verdin-uart4-mcu.dtbo
 
diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila-uart4-mcu.dtso b/arch/arm64/boot/dts/freescale/imx95-aquila-uart4-mcu.dtso
new file mode 100644
index 000000000000..140025af4d53
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila-uart4-mcu.dtso
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Aquila iMX95 UART_4 for Cortex-M7
+ */
+
+/dts-v1/;
+/plugin/;
+
+/* Aquila UART_4 */
+&lpuart2 {
+	status = "reserved";
+};

-- 
2.43.0


