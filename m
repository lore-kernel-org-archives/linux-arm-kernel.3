Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13C9C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 14:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6YNfkmjBEpl78C8o+VXKeiiZ5HsFlTCVKYcfoP2BLoQ=; b=SDKkuVbuS+97FInddOzfoBIPJV
	VPX75TAAxBAuS5jhjeXFrGEC2hq+ib7QSIHAd3j4YfURX0NEk1OJIbvnXW8mPjdBvaXjmQ/R+Labb
	VBU3hQJukXXuMYGn2owMtOQUanf8F7sXDOAhWeUE9kHdoWNDzM295HQa33HN2j9XKa1nDohTs4mfI
	HkwFOP8TSNwGLyo0s7kslter7HrLq7Xxc1YivEDR11rqGAxS/fntNButrQzLmmk27VMyhX/YBCAqw
	ZhoQEL3nL+463HXK+/6I0EogFkGwCb72smmdAz1PMFfgfmux17/OnPQ9xmCGOvrgg7skQKGNdTBLK
	gJ6YMdww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txodr-0000000BGyF-2IGh;
	Thu, 27 Mar 2025 14:55:35 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txoQx-0000000BErS-2zFA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 14:42:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1743086536; x=1774622536;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6YNfkmjBEpl78C8o+VXKeiiZ5HsFlTCVKYcfoP2BLoQ=;
  b=byGMFyXlHntb+TOYw1Uys4g0oxuVUf2RvPb5CKF2VWkhPiBv+gbVywoV
   TL8yY3VloyHBvTfdhc95EceAOIq6mozYM9BpH6R0r9G4Hcp8xs5+r89N6
   +f+eQlzqMDGOa94rmDJ6sJweGZ/b3jtNRXTH9pM01WEnneAmBCLFslwrT
   XTWygHmKyIgNJwvWrhwrPaDza5HNd+oWHi+ZIGR4Th9xeC9Qivj3YjluC
   CbOJsh1oif6rtX1PjFcGkbzLvWv4rMleaw8PUxIzdsFiD3PJq0VRlSULr
   qw5R+VPYCRme8KN2BapM4Yf7TJ8lDUhxc6fr1qOeQt0rzkMjLRedZPZPX
   g==;
X-CSE-ConnectionGUID: Br8qnwf0Qq60ESe56KU3NQ==
X-CSE-MsgGUID: BLyB5sCWQPKYXU1SEfhd7w==
X-IronPort-AV: E=Sophos;i="6.14,280,1736809200"; 
   d="scan'208";a="43199529"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 27 Mar 2025 15:42:14 +0100
X-CheckPoint: {67E563C5-2A-2417938-F0170C2B}
X-MAIL-CPID: 75030C97507DB47327ED4CC8C6056591_2
X-Control-Analysis: str=0001.0A006378.67E563BF.0005,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B671E16C181;
	Thu, 27 Mar 2025 15:42:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1743086529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6YNfkmjBEpl78C8o+VXKeiiZ5HsFlTCVKYcfoP2BLoQ=;
	b=Kv7Xr2NNYpuS7yGBvdEV7vx+l+Oz1rICsQjR1xUZSTZBoprZZWoXuH2ToqgyP9K6LxPv7o
	nyzwSiSxb9fceQXmxwFSGz1lDCzK2mcqkoxgPrY4X156MGYmGQSeOMZiohmC5Iknng7UH/
	tjN6uf35QC4YSk8Y+oNJcanzxvk5VwpDAeVt7cNz0CIh8jwHlTLxF2EufXqOPcxto0rks6
	3SIe8ddk98a7KHJ1Kvr8rejmjHt11gbqAUWdwZvreye/kQCG4zPFJrDt2Jq5j3VQy9//av
	dHl5gb71ZXYPvAEuaJq3/kodRPrv6Av9aK+N8XO1w0EcNtkoVH4weOU+7J0L1w==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] ARM: dts: ls1021a-tqmals1021a: Add overlay for CDTech DC44 RGB display
Date: Thu, 27 Mar 2025 15:41:12 +0100
Message-ID: <20250327144118.504260-7-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250327144118.504260-1-alexander.stein@ew.tq-group.com>
References: <20250327144118.504260-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_074216_043694_B7FCA306 
X-CRM114-Status: GOOD (  13.59  )
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

This adds an overlay for the supported RGB display CDTech DC44.
DCU graphics chain is configured accordingly.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/ls/Makefile             |  2 +
 ...-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtso | 55 +++++++++++++++++++
 2 files changed, 57 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtso

diff --git a/arch/arm/boot/dts/nxp/ls/Makefile b/arch/arm/boot/dts/nxp/ls/Makefile
index 7b97b718ebc16..53240b04c9688 100644
--- a/arch/arm/boot/dts/nxp/ls/Makefile
+++ b/arch/arm/boot/dts/nxp/ls/Makefile
@@ -9,7 +9,9 @@ dtb-$(CONFIG_SOC_LS1021A) += \
 
 ls1021a-tqmls1021a-mbls1021a-hdmi-dtbs += ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-hdmi.dtbo
 ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33-dtbs += ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtbo
+ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-dc44-dtbs += ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtbo
 ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21-dtbs += ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtbo
 dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-hdmi.dtb
 dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtb
+dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtb
 dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtb
diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtso b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtso
new file mode 100644
index 0000000000000..146d45601f693
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtso
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright 2013-2014 Freescale Semiconductor, Inc.
+ * Copyright 2018-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/dts-v1/;
+/plugin/;
+
+&backlight_dcu {
+	status = "okay";
+};
+
+&dcu {
+	status = "okay";
+
+	port {
+		dcu_out: endpoint {
+			remote-endpoint = <&panel_in>;
+		};
+	};
+};
+
+&display {
+	compatible = "cdtech,s070swv29hg-dc44";
+	status = "okay";
+};
+
+&i2c0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	polytouch: touchscreen@38 {
+		compatible = "edt,edt-ft5406", "edt,edt-ft5x06";
+		reg = <0x38>;
+		interrupt-parent = <&pca9554_0>;
+		interrupts = <6 IRQ_TYPE_EDGE_FALLING>;
+		/* LCD_PWR_EN -> TSC_WAKE */
+		wake-gpios = <&pca9554_1 4 GPIO_ACTIVE_HIGH>;
+		iovcc-supply = <&reg_3p3v>;
+		vcc-supply = <&reg_3p3v>;
+		gain = <20>;
+		touchscreen-size-x = <800>;
+		touchscreen-size-y = <480>;
+	};
+};
+
+&panel_in {
+	remote-endpoint = <&dcu_out>;
+};
-- 
2.43.0


