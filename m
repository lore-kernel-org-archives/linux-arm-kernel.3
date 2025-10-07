Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159B1CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 09:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I4koABzEQoGKLzAtw8KpjOXYdJpMHOXjILBXMLZGWaA=; b=SmIQ/xSdTmCHXsgC495aPOwNfr
	AZr5xjN7aHkCthIwG3VFNzLj51rEEW0q9pwF6s9ABZ7jedFXTJTX7LhBTcsu+x9ZTermCkrRYii01
	QX97d0JnnuX0GHFrb9b/iJipXr07/YYudtmE56QFTT/51XgyyHLlg+wR6mx9tWGtaDmNJCbeqwCo6
	wVWF7CJfiXCPNyzd6H/tAmJCOSD6KKF2aB5MrQwQwJuzz/UkBBOWjYPQHvqkZGxuP9RVr8/Qksu9I
	T0sDm+lJItzZHSnDMMIEj5MVo0Qwus/rACYkejQFkAdFnQxYydDgIVEU1lJOebwoSWCr67mkj6OoD
	Ew91R0Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v63Yy-00000001erH-0CcT;
	Tue, 07 Oct 2025 09:00:52 +0000
Received: from cp2.siel.si ([46.19.12.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v63Yv-00000001epm-1ht0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 09:00:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=I4koABzEQoGKLzAtw8KpjOXYdJpMHOXjILBXMLZGWaA=; b=n7TiSlUD+1OiiL2GO9Zg04Yicn
	+AW9x+mJuW8/d/6gEzO8FiNlc6QKmEzzY8FgVATJcGTSgvckJbwMiedxDg9rJrVDft2g/gGhNYuWO
	YtC7ozZyWSYT0Cu4UcllSw09QpTBGbsIGM54U3cL1eQarFNjgd7Wfm33zx0o7vDqmiCcsHmrXkjxW
	myUgBIha7g329UqhgAJI/DubMAjCZbv4wjBZC2ApPpkdzqQLh83sG1LD2ube6hUD5XVh9hTAqLYUc
	jsTfRh3VMd9yf3Wxr2zP7Ru+A5BDtNYuZy1MuDLwYSbQ/oJMauruCS80dQLf5nzl/zSQLnS9aWF0J
	z7NgHwDA==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:34170 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1v63FJ-0000000BgWm-0nsq;
	Tue, 07 Oct 2025 10:40:31 +0200
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
Subject: [PATCH 1/2] arm64: dts: freescale: imx93-phyboard-nash: Add jtag overlay
Date: Tue,  7 Oct 2025 10:40:27 +0200
Message-Id: <20251007084028.1125185-1-primoz.fiser@norik.com>
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
X-CRM114-CacheID: sfid-20251007_020049_620350_707D34D1 
X-CRM114-Status: UNSURE (   9.23  )
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
 arch/arm64/boot/dts/freescale/Makefile        |  2 ++
 .../freescale/imx93-phyboard-nash-jtag.dtso   | 26 +++++++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-phyboard-nash-jtag.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 525ef180481d..c72a6fdc5412 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -356,10 +356,12 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
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
index 000000000000..4744eabf95f3
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-nash-jtag.dtso
@@ -0,0 +1,26 @@
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


