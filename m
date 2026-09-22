Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC5FC98309
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 14:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o4lRt2va1gWTtMW/M8nVRxRv+uN2TcEpeTG/w57BdiI=; b=touoEpnFzQe4Kyx4z2rwhzJF2i
	ykePffTpMFxEmKoDJHAQEqk5/ZNmSEKPddohBsHLGwTAZyOQLh76KREgv2V97sKp7EPZvDZWEddED
	uOqbaTujqd+kg3yWpmPQ3aMfy2UVxJ/mzrW9hXnibQ5O2EQdZCAT8oLFCD0wxIzeBjknDicpYhdm7
	EYDEUYJQ+I6SkxpwNwsu2/OUWUHMUfjUn7vhSDjcLT2AA20xkh0XwIo4g73UDuQNKfCAGQsYbx3PP
	8UcztnsFHNrTuRPO7GfB6GDxBpIstPD2uEcs/5Yq+6TTx6ZyLyr0KTeblM56CZSibbHuhihoneUux
	AbllIodQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x91ZY-00000005hey-1YBa;
	Tue, 22 Sep 2026 14:34:16 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x91ZR-00000005hbb-4C1V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 14:34:11 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c294af0caa8so539090666b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 07:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790087648; x=1790692448; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o4lRt2va1gWTtMW/M8nVRxRv+uN2TcEpeTG/w57BdiI=;
        b=pQEQvbS9lcJjLqXm649sYYiaklhHyF64yDyZ/PG/p4U5UCAp/nb9YJW4eQJvZ1jtgh
         eeerMKY0hHJLP7UFjMTWC8Gh/QpH1/cKvcBd3Ut4abpQJZ6tRb6YPxVAwbsgx0VhCflz
         v7ddhiUcImLoccgs4qr5brqUPUnogP8fB5syVfbYaWSyW8QwY7sEzXriVWdn35JjX4HY
         ik/WL8rUTUKWe1HQ/qoaj5yQDmyESmgETTMX3I/tBaAWotIOJa3i3RCh5LL5y2vkZ3OX
         jiYYrC5kgWKSCW2gM+5Y0+R/HkpZFtJ8iU23g0Go7+FUA7d6sObxV+ZhYn29m+bPxDua
         kyUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790087648; x=1790692448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o4lRt2va1gWTtMW/M8nVRxRv+uN2TcEpeTG/w57BdiI=;
        b=UAd1RW9trziwpFIF6YtJ4Gez4lzATyzJINOqv4Lb2t0xlQZzWqQNcUHoA6XXyi+Me/
         Usy/7wI+c5w2Kp9dICjsvGCfYbOYHUMMs1eOUiIA2wG+kZE4E92Q+nBavCAUN9Jl11rC
         gTyWzY7Uh3yQ8m4vMiJQZ+SNpRlUvgXafbcV67WdhzOyLf7YOZL1Ae8qQN2+TkBiJwMC
         Ze2hOp0xE3JYCfQLS6YDpIzoU5CxGnx9h68Bggtu5uDsgZ1/khWI7vcIR1in+1jfIJ6X
         nHdBYWbiwroDfrywarbaYExAKVhw/WxcEeNMAbIliVmO00T5k6L+FpOavIcjnHBi+vp3
         O+Ug==
X-Forwarded-Encrypted: i=1; AKwUvByTssj4Y9xbOu+sHN5l9VDlAh9RAzdCCTHrZauCLsk87mc0vbv1/y6+cYoa9zyz3TBFquv1Zm+/glFbHJB8970t@lists.infradead.org
X-Gm-Message-State: AFuF++nsN4QWT7vIiNURrMzdJ8p4ISY2JLkuLH0IkO6iEI6cTlgMfqJ9
	mNGYsUTVmLyywoqHpvl33oFkS4G12qkUEtDrEPhxLAmiGfmyZZ7LdmE5
X-Gm-Gg: AYBFou1naP0szpkZi6P72aQWOi7IRr84l4jE8s2JrB0hNupgDlFB0yxeH5S8J6g2Oqz
	RjJPeY6/fsK6m8nToRr6D8STZE852OgOCFxXSs65G6FKj5bzxhaTyKDUxFBE/69oAzhI3yWRfap
	sqpN/4WCKxf4jCjzcUrnGZC1w63c6iCU4Ld6dMVkX6ffouBxxaQQpSL32gBnYAxlY/ceRatmHiK
	iUg/yLfKcnOhCK9yEn1mqBNnXbEH9r/Oxxkui6F2bOMs4Fsaps2C/peBtNlw4ZtUD+heGiNDEsS
	+qHAhbrY7BAvd9xruEHzMe2fN7v4HxwDVbnYDW7Te/Kvt+5kF4arWbISocW07lQWPSr5eI1KYi8
	yo3Z0kmd7S/3b3Pjz5rQZ+04T364laFjzxb5r/Id5A98LNkwu9pv6w81VbYZVGx/jGpWk3YkUri
	KGOlzOIVrx9u8ac18lvKR8XHTg78POmmB34JYKzs/VrKkIbFttjgLAVIDpSSBXjWBO9BcMYugvp
	eOp86Ji+JAEAEr5j07yFP/aK8ptW7C+8WE93kaIhJbHip/YVk+iJk/sd2yGe/xlaUAmCw09tw==
X-Received: by 2002:a17:906:ef02:b0:c26:19de:9aec with SMTP id a640c23a62f3a-c2a15877713mr1237309166b.43.1790087648344;
        Tue, 22 Sep 2026 07:34:08 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c5814e2sm103469966b.27.2026.09.22.07.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 07:34:07 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Tue, 22 Sep 2026 16:33:49 +0200
Subject: [PATCH 4/4] arm64: dts: freescale: imx95-toradex-smarc: Add
 Cortex-M7 SER0 overlay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-v1-imx95-overlays-v1-4-694100afb4bc@toradex.com>
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
X-CRM114-CacheID: sfid-20260922_073410_068504_E9D6F00C 
X-CRM114-Status: GOOD (  14.18  )
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

SMARC SER0 can be assigned to Cortex-M7 firmware. Add an overlay that
reserves LPUART2 so Linux does not claim the port. On the Development
Board this removes the Linux RS485 port on SER0, while the console on
SER1 (LPUART1) remains available. Firmware must configure the UART and
its pads for the intended MCU application.

The overlay is also combined with the Toradex SMARC iMX95 Development
Board device tree to provide a ready-to-use DTB.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile                     |  4 ++++
 .../boot/dts/freescale/imx95-toradex-smarc-ser0-mcu.dtso   | 14 ++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index b17fd5b067de..489da1fb0012 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -957,7 +957,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-clover.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-dev-uart4-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-uart4-mcu.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev-ser0-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-ser0-mcu.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596la-mba95xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596sa-mb-smarc-2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-var-dart-sonata.dtb
@@ -980,6 +982,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-zinnia.dtb
 
 imx95-aquila-dev-uart4-mcu-dtbs := imx95-aquila-dev.dtb imx95-aquila-uart4-mcu.dtbo
 
+imx95-toradex-smarc-dev-ser0-mcu-dtbs := imx95-toradex-smarc-dev.dtb imx95-toradex-smarc-ser0-mcu.dtbo
+
 imx95-verdin-wifi-dev-nau8822-btl-dtbs := imx95-verdin-wifi-dev.dtb imx95-verdin-dev-nau8822-btl.dtbo
 imx95-verdin-wifi-dev-uart4-mcu-dtbs := imx95-verdin-wifi-dev.dtb imx95-verdin-uart4-mcu.dtbo
 
diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-ser0-mcu.dtso b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-ser0-mcu.dtso
new file mode 100644
index 000000000000..cbc58f1af41d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-ser0-mcu.dtso
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex SMARC iMX95 SER0 for Cortex-M7
+ */
+
+/dts-v1/;
+/plugin/;
+
+/* SMARC SER0 */
+&lpuart2 {
+	status = "reserved";
+};

-- 
2.43.0


