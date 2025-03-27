Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDFAFC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 14:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dyd/G8UMS5Ev3nFa2e+b6IUVKqcLbE0qETb17ejIM0U=; b=cpxAWESGqo4nemDPQSzCNA/5b1
	7g4TNBnpaYqFDtqt8Xc2oql7RnxfLQwM/IoSbys8XLGzUxQ4KQNaSY1MARRorYbx0bvlMBzb+o1X6
	6Bd6AkhPa8MJybqJCRr4ubTyLBPNAFgcDs3z2mqcaKWCRhv3wNhl7q5R+HWrhPz51dc7J2mQI9LJZ
	nRHK9XTeK8+jHvJv7THi6TTer5Tq6fD+f2ukC7R+9wrXoe0rZAtxgpHA++r4NWHK7YNVjrQySWyjF
	6Rt1QjVkfjPuj4+Ni8hoTwEOc5lTqN/c9XbqSwdyOCc0gSYyXPMjOmSw2QU4t5GW0Isa4X7vNV78L
	YvCmwiDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txoc9-0000000BGkZ-3hCK;
	Thu, 27 Mar 2025 14:53:49 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txoQp-0000000BEll-2KxY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 14:42:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1743086527; x=1774622527;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Dyd/G8UMS5Ev3nFa2e+b6IUVKqcLbE0qETb17ejIM0U=;
  b=a4a37sReCQQlHF/bJuuR8Ad4SX6wPDrBEKZ34rTifw8IxuCGtECuas3d
   8FfNZFXW7ALkZx/wEl7GbEmYOf/sBL5IyuGHYYuNUqk3uGIWGIltpXSF4
   Lr6WGgAWRDK9+qGqP98Fq+A/2Gs5taKhUuy0hASLsATmVOS0sT3MkVSyf
   1DI8d1sgVZBbmGH1pbQoYqJHX6oPBvTXajOLipO5QfbR/a0kD393JEquF
   LC2/3LGtfn1w2YUZegK/yEoQn+Yk3QtdNcQG7sAcgrvJAmsjTaFXVQMyB
   bp9ai0ltZkrCKo5IaN5fk/XIZcnfnB/BDA8VKvCgM1ThIG+jSWytcswHR
   g==;
X-CSE-ConnectionGUID: qfX6IfFPQe+8zvf4J8TqAg==
X-CSE-MsgGUID: KDUy227MTOSbKnd+SqhOhw==
X-IronPort-AV: E=Sophos;i="6.14,280,1736809200"; 
   d="scan'208";a="43199521"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 27 Mar 2025 15:42:06 +0100
X-CheckPoint: {67E563BE-1A-2417938-F0170C2B}
X-MAIL-CPID: 273C908C772B6A21BDF104E7C9935432_2
X-Control-Analysis: str=0001.0A006368.67E563C5.0040,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 88B3E16C181;
	Thu, 27 Mar 2025 15:42:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1743086522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dyd/G8UMS5Ev3nFa2e+b6IUVKqcLbE0qETb17ejIM0U=;
	b=g3Srv2QMwXPymym/Pr7o1MzFNhKRCvNDDcUgOALwTOYU5lFKRo5yhyQ6Kvdo033G+Yt5mf
	BROZdQTHQ+BI4JnGyQX9zk5afgAwxU6e3hCSXUh/X3e3Wxz0WiIzNWO98xwWm0Hw1+6f97
	UMPKotXvDF8n+yT/qDSBP2JfhUei3htdQ6nzd5RwaI8iyCOTOIE10GJxFE0cEj1TMwpAXZ
	uTp54TKGPRoR9DFIihNura7uGzqcxHyX15jFuUPhhva+BiPUAEDUM/ZClXbekI0LNmN+Zy
	dx+4LmwGhr2AGfZVJ+nxJ7b1oGFaUaKrAJUxaNk+sLfdLwvXwPLQ5ZKbw6wPMA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] ARM: dts: ls1021a-tqmals1021a: Add overlay for CDTech FC21 RGB display
Date: Thu, 27 Mar 2025 15:41:11 +0100
Message-ID: <20250327144118.504260-6-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250327144118.504260-1-alexander.stein@ew.tq-group.com>
References: <20250327144118.504260-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_074207_890509_E5BE8532 
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

This adds an overlay for the supported RGB display CDTech FC21.
DCU graphics chain is configured accordingly.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/ls/Makefile             |  2 +
 ...-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtso | 56 +++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtso

diff --git a/arch/arm/boot/dts/nxp/ls/Makefile b/arch/arm/boot/dts/nxp/ls/Makefile
index 7f96de6f80224..7b97b718ebc16 100644
--- a/arch/arm/boot/dts/nxp/ls/Makefile
+++ b/arch/arm/boot/dts/nxp/ls/Makefile
@@ -9,5 +9,7 @@ dtb-$(CONFIG_SOC_LS1021A) += \
 
 ls1021a-tqmls1021a-mbls1021a-hdmi-dtbs += ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-hdmi.dtbo
 ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33-dtbs += ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtbo
+ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21-dtbs += ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtbo
 dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-hdmi.dtb
 dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtb
+dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtb
diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtso b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtso
new file mode 100644
index 0000000000000..31494d9d09f8f
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtso
@@ -0,0 +1,56 @@
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
+	compatible = "cdtech,s070pws19hp-fc21";
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
+
-- 
2.43.0


