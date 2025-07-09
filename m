Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A69DC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 00:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=JmtiAJIx4OJnYhoun1Y6mRhQPBpKeZEivxGm5Al8d1c=; b=L1s95lE/MR92X/hjjY5/cDIkeq
	rh8G++BcgBFYoujYF91PLiJPnMyB4yJ9llCsTVIl5wiP754nKgEPMU1UMXuq8IItU3vhbr32JMNGv
	NgZwG08eh0X5qePBg4jOTMTNOkQjn6RidQmqYNpRp7jsfGDDL/MEtzyuZ63Z2c2BUdFq7wKTbeoz2
	+cTnFQtFaCKrTn+IyiOZxZxaFVtSO6I+SYD56WUbkekUjS5NbaLvyqjdcNE7O35wSfoIrufzFw69G
	xZ2aUf6wg9qEngIvXaMXCW8qqk6U07Gq9FVYZwRMWcTtjSyYRujGvHeVSGRtw3aRRGUYiMPXCdMK+
	qiQw8M/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZIhm-000000070Fh-0Jbe;
	Wed, 09 Jul 2025 00:30:34 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZIbk-00000006ynW-0NTp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 00:24:21 +0000
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250709002410epoutp0452338a18f73e11c81d3cb9dcf2ad6b64~QbX-TDcY70179401794epoutp04T
	for <linux-arm-kernel@lists.infradead.org>; Wed,  9 Jul 2025 00:24:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250709002410epoutp0452338a18f73e11c81d3cb9dcf2ad6b64~QbX-TDcY70179401794epoutp04T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752020650;
	bh=JmtiAJIx4OJnYhoun1Y6mRhQPBpKeZEivxGm5Al8d1c=;
	h=From:To:Cc:Subject:Date:References:From;
	b=vXa31CsqaCNCfH042OntLj6d6RXXTHVeJfehiL4mjGpBIY6TrOKhUOdeUeOF8orss
	 F4SDuXdTD7JOJ0NZHj30LuoNWvl8RWiPQEpqRD+HP1SYGziAtPYMT97HheycQMjx6h
	 nI/uFdUgctefm+yfZPYsLV1sBG//+A8cFF9gxAag=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20250709002410epcas2p187128c3c29a82d5752edd758cfc3b21a~QbX_3tXqI0630606306epcas2p1Z;
	Wed,  9 Jul 2025 00:24:10 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.102]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4bcJcn2fSDz6B9mB; Wed,  9 Jul
	2025 00:24:09 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20250709002408epcas2p25248bf1a397fc308d91ffef3889c41d5~QbX9emyK01430814308epcas2p2I;
	Wed,  9 Jul 2025 00:24:08 +0000 (GMT)
Received: from AProject.dsn.sec.samsung.com (unknown [10.229.9.52]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250709002408epsmtip1e2456747b63928e1cc20f961d1d7e29b~QbX9b90_b3159031590epsmtip1A;
	Wed,  9 Jul 2025 00:24:08 +0000 (GMT)
From: ew kim <ew.kim@samsung.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: alim.akhtar@samsung.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, ew kim <ew.kim@samsung.com>
Subject: [PATCH] arm64: dts: exynos: add abox generic for ExynosAutov920
Date: Wed,  9 Jul 2025 09:12:10 +0900
Message-Id: <20250709001210.379418-1-ew.kim@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250709002408epcas2p25248bf1a397fc308d91ffef3889c41d5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250709002408epcas2p25248bf1a397fc308d91ffef3889c41d5
References: <CGME20250709002408epcas2p25248bf1a397fc308d91ffef3889c41d5@epcas2p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_172420_458150_4ADDFD07 
X-CRM114-Status: GOOD (  15.99  )
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

Add a node for Abox generic. This driver, exynosautov920, connects to
the SoC and allows you to configure a sound card.

Signed-off-by: ew kim <ew.kim@samsung.com>
---
 .../boot/dts/exynos/exynosautov920-audio.dtsi | 20 +++++++++++++++++++
 .../arm64/boot/dts/exynos/exynosautov920.dtsi |  1 +
 2 files changed, 21 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynosautov920-audio.dtsi

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920-audio.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920-audio.dtsi
new file mode 100644
index 000000000000..4a1341ccdc2e
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynosautov920-audio.dtsi
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 Samsung Electronics Co., Ltd.
+ *        http://www.samsung.com/
+ *
+ * EXYNOS - Audio Device Tree source
+ */
+
+/ {
+	abox_generic: abox_generic@generic {
+		compatible = "samsung,abox_generic";
+		samsung,num-of-pcm_playback = <32>;
+		samsung,num-of-pcm_capture = <32>;
+		samsung,num-of-i2s-dummy-backend = <5>;
+		status = "disabled";
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges;
+	};
+};
diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index 2cb8041c8a9f..6893fd36485e 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -1129,3 +1129,4 @@ timer {
 };
 
 #include "exynosautov920-pinctrl.dtsi"
+#include "exynosautov920-audio.dtsi"
-- 
2.25.1


