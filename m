Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F41C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 09:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BC+kwoVAr3DKkerz52sg03mJQPqBZjjq89g1vIcQW6U=; b=1eDsfL5YR11DzciaMT1iaBc7R8
	QUQi2mUkzYEHGK6O1KXCDOqMSd+Jrv2GtKTM4mTMr7csX92t0sgTXG4fnuhsIU14Zi7oGtlPwYyoK
	JkdVkSrEct0Y5Nw5w/2UjpWtld5p05jrRepR+c7a85L7bRf9xRYqAFD8pwX/NJkF7G1n6yV33dm8S
	CP4dpFH8qVqm9qyD/JPA6UR5dLZU02D8wlV3g8qOXpIcmqlhEHYEYNjv9OFy6POpnw6a9OrrIHjsT
	IgnFa09JIsPx07kUxfYJEGkajtwJsDWMfboRBQdayIzEYd06ex6Kbtf3vKOlK28PM9uAzKCh2DM39
	y0u7R76A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25Y7-00000003VEv-3ZNd;
	Tue, 08 Apr 2025 09:47:19 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25J8-00000003SH5-3Ig1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 09:31:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744104710; x=1775640710;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BC+kwoVAr3DKkerz52sg03mJQPqBZjjq89g1vIcQW6U=;
  b=A2BogLqqrkKXTewcWcHrcF6ahe23N4TA4eSfiomRhK/A7Wi/7tGU8sDa
   QKPl52R6uedF3y1nH7GFvrj9izOBXOs+8ikuivFt34966KPvDtFevvvJH
   p+zyZoI+xA9SQn8lbInHe7TDVjBwUtRMiaXbOs7MDdhJ7bbBmifwhN6Nq
   L2Mx6StdIFMshEPC/XuX2FZ5xgAvxxW58L2GlIoYLQGZZ9DgEvYdtxAhU
   BCUVsLHB3m5wRukIjA1JPLSUwtW9b91ZwCsQr3/0oP22rnklITLOkTUjx
   bR18rI9yjcWvsQFG8MK3VHgqxT4xHK1qWjyHBEXBFwVbOZlYjeEArODew
   w==;
X-CSE-ConnectionGUID: JbgMUJd8SQ6ivHccM5rvSA==
X-CSE-MsgGUID: 7BUzCS2bQDaaKFPDC9awTw==
X-IronPort-AV: E=Sophos;i="6.15,197,1739833200"; 
   d="scan'208";a="43397405"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 Apr 2025 11:31:48 +0200
X-CheckPoint: {67F4ED04-1C-7141A0B0-E6EDEC14}
X-MAIL-CPID: 85B7DA6F25BE624F0F4F2E5BBE0CCC1C_3
X-Control-Analysis: str=0001.0A006368.67F4ED0E.0042,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D264C1697D9;
	Tue,  8 Apr 2025 11:31:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744104704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BC+kwoVAr3DKkerz52sg03mJQPqBZjjq89g1vIcQW6U=;
	b=ZK7O/PK17MX11bWsdyyzDZzuHy+szGat4TYZHWGlxd8QLQnUIashucVz7o94TFlHe41cDO
	Llnp/Wcg3boWVKI3eKdnWcggisPVWBgw46OZQBrPgWUnaR9B/ZItpzAoBNJK1KesGG6i6b
	OLC8ZPNBaciSkxN6knrArsuT+c+FY4RoU4yNuZCGWdaJU/6Noz0HcU3dglzWNcBxySKjL4
	rTFzuILD/cYyf+NN9qzwlpUB9MO5169C2h58uLexXinYZPEU0mKviBgai0FoccGwwuo/F0
	HN4Nk69O7a+2Q5bl0yGd+lVKOS6KX7M9dxmMmzE0//kgNpKnuk+dIfSwvOH9gg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2 6/7] ARM: dts: ls1021a-tqmals1021a: Add overlay for CDTech DC44 RGB display
Date: Tue,  8 Apr 2025 11:30:53 +0200
Message-ID: <20250408093059.551700-7-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408093059.551700-1-alexander.stein@ew.tq-group.com>
References: <20250408093059.551700-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_023151_182531_DA0AB66B 
X-CRM114-Status: GOOD (  12.15  )
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
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


