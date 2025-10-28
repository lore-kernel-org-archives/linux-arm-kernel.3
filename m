Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B03A7CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 11:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g7D04cr7fjT7rjTu2A49pG6aFgCTS9pQ6fDcN6oGIi4=; b=2tKtnVNZgxu+K7f8LgUnmPhLai
	lNqRAlQgiBYBkmvP7lK2Ua2v4zlfhbcI7hR7TKC8t0vi+NAcKhQk8XOTyf7HsIFXmrtO9poYmCDJZ
	YlPpVZk6z6lbZIXbnVDQopUxXAI1mNtGMoRxSCI6k46N4AOU01nBOCFDEJwej7sqaXXhmgBRXZ+s+
	sDgtcGyaIhc3cMPvTJwPAIeDmucTnEc9G1F4h+itOhuYjojsAiME/CLnLpB5pcOurAA9P+VA+A7lw
	ZXyGROahHZF3BaioKSqWPvn0yIKslrYayBs5+PzTh9umI5vDwAiWYJz0EgBM0RqZ1rvU8A2XHDqWN
	qh6Mn35g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDiM9-0000000Fseh-13fU;
	Tue, 28 Oct 2025 11:59:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDiM7-0000000FseO-0T7s
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 28 Oct 2025 11:59:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=g7D04cr7fjT7rjTu2A49pG6aFgCTS9pQ6fDcN6oGIi4=; b=V3CMwdT9Xra0fwQGhS31Yjiy1g
	vVVNZ8IXMlYsmHLf0jf7uxUR2gt/I3C8hkPA9wGuLckGnrIUHvOYMNGEoLnMBQY+l8fm0b+o3L4Af
	2o3dkbC72L1JjoVgcIjpDqnZXtdKK+bon3VZHcllTd20JoZCOl1zaNi6bBXc42Js2LtGnprA2z0s6
	ZIHb30m5uA99VOaZrrPsZGmCzTDw6J++TihSXA8R7m/G/nQDdGf9YFEoxa6XHLBATSCKe1OJNsyjy
	u18p7U0wzzD6dySWZO5744OncmF2lOohrIQQMI4NrLD9fYg5mbbxdDVBiOFbAHzPXsroXr42GmwOX
	y7Eji5zw==;
Received: from cp2.siel.si ([46.19.12.180])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDhUK-00000004Iin-0za0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 11:03:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=g7D04cr7fjT7rjTu2A49pG6aFgCTS9pQ6fDcN6oGIi4=; b=KS/nLSgxgnKYjQobvtKiTe9AqP
	RMotu9k/Qw2lkfbODshME8Z5TEDmEqWTzO6/N1TBaFb646DxLw7vV2lmP01uRlUZ1wHip1Q2PFvZj
	/cvtBxHwMak6hKnSHcVAZYdZctkfWHo74oQPzqqQgo9z1KzpEh0kGCaQ562Yn3N4IzHlaq+kAq1Br
	3CUYFPmezmPL2zTTkT2u9YFdlC9xPQie36j0Sl3iMPPIo2GX7y3I20TXuuKEOyQUBqO7yxT44gvdy
	t4sveW2V78/2kI8fFFz6QYNjnUKp1LOCwmpeCd2T9rb6jP3hqfNHcGoAjg+N5UCch/NXg4QrWmIg0
	ClBNFqaw==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:39330 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1vDiLI-00000009Q7M-0E1n;
	Tue, 28 Oct 2025 12:58:22 +0100
From: Primoz Fiser <primoz.fiser@norik.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH v2 1/2] arm64: dts: freescale: imx93-phyboard-nash: Add jtag overlay
Date: Tue, 28 Oct 2025 12:58:19 +0100
Message-Id: <20251028115820.3165399-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_110340_611152_47436188 
X-CRM114-Status: UNSURE (   9.50  )
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

Add overlay to enable JTAG pins on the board's JTAG (X41) connector.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
Changes in v2:
- add suggested explanation comment

Link to v1: https://lore.kernel.org/all/20251007084028.1125185-1-primoz.fiser@norik.com/

 arch/arm64/boot/dts/freescale/Makefile        |  2 ++
 .../freescale/imx93-phyboard-nash-jtag.dtso   | 31 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-phyboard-nash-jtag.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 34a81d34de39..33151065684f 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -357,10 +357,12 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
 
+imx93-phyboard-nash-jtag-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-jtag.dtbo
 imx93-phyboard-nash-peb-wlbt-07-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-peb-wlbt-07.dtbo
 imx93-phyboard-segin-peb-eval-01-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-eval-01.dtbo
 imx93-phyboard-segin-peb-wlbt-05-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-wlbt-05.dtbo
 imx93-phycore-rpmsg-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-segin.dtb imx93-phycore-rpmsg.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash-jtag.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash-peb-wlbt-07.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-eval-01.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-wlbt-05.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-nash-jtag.dtso b/arch/arm64/boot/dts/freescale/imx93-phyboard-nash-jtag.dtso
new file mode 100644
index 000000000000..89f93dca3208
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-nash-jtag.dtso
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2025 PHYTEC Messtechnik GmbH
+ * Author: Primoz Fiser <primoz.fiser@norik.com>
+ */
+
+#include "imx93-pinfunc.h"
+
+/dts-v1/;
+/plugin/;
+
+/*
+ * NOTE: Bind pinctrl_jtag to gpio2 so that the pinctrl settings are applied.
+ * JTAG itself has no dedicated driver, so without attaching it to an active
+ * device node (like gpio2), the pinmux configuration would not take effect.
+ */
+&gpio2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_jtag>;
+};
+
+&iomuxc {
+	pinctrl_jtag: jtaggrp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO24__JTAG_MUX_TDO	0x31e
+			MX93_PAD_GPIO_IO25__JTAG_MUX_TCK	0x31e
+			MX93_PAD_GPIO_IO26__JTAG_MUX_TDI	0x31e
+			MX93_PAD_GPIO_IO27__JTAG_MUX_TMS	0x31e
+		>;
+	};
+};
-- 
2.34.1


