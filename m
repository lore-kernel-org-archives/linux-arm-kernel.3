Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DBE2CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 06:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dStcbhY+rumd3OvNKAll20rKoWFwQ08aAwWyl88q55Y=; b=kevVZakLKdELxLPt4+zOx8Mukj
	cEN5d83rApxygxe4Rzi4QhpwiKDW0iB4niJoni35x02SAY+tbkA/vq+KBSLJLOdR0Y+CeyKX7KDqW
	MskUS/0xlUn4dGH94PH9K4QhXDlo7tcyNngG++6P3xw3kVH7v2aVR4cciL7m9ElAbZNLI2EEpAi9A
	BRV+MEiJxxaaxp5Nw0wR0CQ/bSmGqEkIoctstwOy9XW6lWtaODwZ9lriVy0b49GDpGIVfJqdT+Ybb
	6kwHmtL1ell4H9p65F6UVRbupCoKvDD9qw122UIBxdhQb3pkRKXxnh16MNfB+QthOx0w72FWIJntK
	5Gc4Eb3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCWmO-0000000AiXs-2F0e;
	Fri, 02 Oct 2026 06:30:00 +0000
Received: from mail-dy2-x0e.google.com ([2607:f8b0:4864:36::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCWmL-0000000AiWi-3nyq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 06:29:59 +0000
Received: by mail-dy2-x0e.google.com with SMTP id 5a478bee46e88-3411e0ace58so9417312eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 23:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790922597; x=1791527397; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dStcbhY+rumd3OvNKAll20rKoWFwQ08aAwWyl88q55Y=;
        b=HWnNcZdtBESRTFtywOX5LkImMQt/W7zD84Q6TpUx4Xbwc7iWIbGwN7pqCBtY0VQn6X
         ZlS5vJl7jPG+b7fEV7eyYCukpTpDYXMeC4FDdk6WBQTq9FoGLorHcT7h/w5jpe9fBmj9
         +2ec2+bGFuN9IJleGBn/yecnjKynB2dHiDl2jOAbHli8sdxCXPruO+ogQdjq4yBlrsfH
         9izT4BM2JOzkcSg56mbHvxhWcFkwpAkjdGRZAI7PRw/IK7j2kbZ0IujKYNk/YE/6EHzD
         U64KWBm7WniG2OOFVyILV2uuzEuj+covcfSZIPjZl45BiU43XVz7s8P4Vx+KC/QXLSBP
         CDEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790922597; x=1791527397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dStcbhY+rumd3OvNKAll20rKoWFwQ08aAwWyl88q55Y=;
        b=NaG4dFLNROuW0Eum79SKX8n0ebD8W9qrLohE4WH6MmhtbLkZNyJ/2dAeztjlQ7UUL7
         /hLynSnT+ddvKQqVhlErcuvqAUfKbeIKYzisEfq6SqhHzUpmCZyGKchDt9fihthfz1od
         2N72KnNJ2VLPJyh0eLsZqzw3tG6IdhFLIyuE1Or6aid4XCszxwRurwdHjBm5pLclmRcF
         2QIVzmb0D88huE3clrvVKpl6ImpOiFUAYGsgmxJUT8RpAZ3TCxXdKl/H0oBQoluw0Fu7
         4N+yot/X0XaX/LqQj0IZVRK1Hfys82GJyJgaSW6eRMpj5TdiR+haVIsfDlgwAyH1hhWF
         D8Qw==
X-Forwarded-Encrypted: i=1; AKwUvByOTjc/BLHG8vYY+c2GD0e//C59+zoOVnp5liP1QtfWCqiern4oo1ldkJCVdmsL2wecahOFzbApB+NJaNujJZVt@lists.infradead.org
X-Gm-Message-State: AFuF++nHVY65q9RPVeyGRBe5yXSf4PscKv7UHYJJkAR8IP6fq4VSDCaq
	eeSqFXo/7Gp+Ll1PjAn9VXMIdL4fznEsWxLVsLI9nr74lwwJPMVgPGkg
X-Gm-Gg: AYBFou00wAIf7ytx/7IAAGJmhuPemXZLJMDTtYfFCjNghOFZcvBxur77ZBF5rXjJ9XT
	B1nqKkxRZ1tmBQCazbPTPuNEQqYMMkGawlVAreUSJ2sa5gUmRZaGppcPjoi1IjiYqpRn+No+B9w
	3YV1xbo0iJ4AcBGCIWz0NhWrox+6/GwXORzh01DtS8W4E5xa1wTjjC86ezJ/1oEhiELGC4HrEbn
	myRb9oKpPsv22fWljAeydTfHZfyVKsBzPS3/0gS9fP8sxjP0dHNqkJQ2xnE6PdY5UJ3yRI49cvx
	csp12H1+cDXJdB5cy7X3YN51jFlnFti/UXpojtWUG+XMr6zx4tyd9tc7eNeZIwJRL/DQHqNcp8V
	ie5ujx1kg1kvspq50mg3grYGILUXRxEm9buPtVNwk2/AQ8nTLqHMV5z2VV0BVo5xfbSqcG+NqE2
	00So1dCl6xMPNlqr1jg/hWpvBIKOJ+jbOnuSwtXgExu0mY5jXWptdWhGm2q14Xdd5poU6L9TTYB
	7quGAjvgRKrEUBc
X-Received: by 2002:a05:701b:291c:b0:143:298e:45a1 with SMTP id a92af1059eb24-14f5c7e2290mr1802049c88.40.1790922596939;
        Thu, 01 Oct 2026 23:29:56 -0700 (PDT)
Received: from debian.prasanth ([103.183.205.240])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f45fedd43sm6236636c88.4.2026.10.01.23.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 23:29:56 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v8 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
Date: Fri,  2 Oct 2026 11:59:33 +0530
Message-ID: <20261002062933.26497-3-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261002062933.26497-1-prasanth.padarthi10@gmail.com>
References: <20261002062933.26497-1-prasanth.padarthi10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_232958_056632_4F2D332F 
X-CRM114-Status: GOOD (  15.93  )
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

Add the device tree for the ASRock Rack B650D4U BMC, which is
based on the ASPEED AST2600 SoC.

Describe the BMC memory, SPI NOR flash layout, UART console,
GPIO line names, video framebuffer memory, I2C EEPROM, and MAC0
connected to an RTL8211F Ethernet PHY.

Use the EEPROM on I2C7 as the NVMEM provider for the MAC0 address.

Configure MAC0 to use the RTL8211F in RGMII-ID mode.

Reviewed-by: Andrew Lunn <andrew@lunn.ch> # MAC0 and MDIO nodes only
Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  | 135 ++++++++++++++++++
 2 files changed, 136 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts

diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
index 6b68671f9379..b109491d5c8f 100644
--- a/arch/arm/boot/dts/aspeed/Makefile
+++ b/arch/arm/boot/dts/aspeed/Makefile
@@ -10,6 +10,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-ampere-mtmitchell.dtb \
 	aspeed-bmc-arm-stardragon4800-rep2.dtb \
 	aspeed-bmc-asrock-altrad8.dtb \
+	aspeed-bmc-asrock-b650d4u.dtb \
 	aspeed-bmc-asrock-e3c246d4i.dtb \
 	aspeed-bmc-asrock-e3c256d4i.dtb \
 	aspeed-bmc-asrock-paul-ipmi-card.dtb \
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
new file mode 100644
index 000000000000..a4e384588a54
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
@@ -0,0 +1,135 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "aspeed-g6.dtsi"
+
+/ {
+	compatible = "asrock,b650d4u-bmc", "aspeed,ast2600";
+	model = "ASRock Rack B650D4U BMC";
+
+	aliases {
+		serial0 = &uart5;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x20000000>;
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		gfx_memory: framebuffer {
+			compatible = "shared-dma-pool";
+			alignment = <0x01000000>;
+			reusable;
+			size = <0x01000000>;
+		};
+	};
+};
+
+&fmc {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		label = "bmc";
+		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <4>;
+		m25p,fast-read;
+
+		status = "okay";
+
+#include "openbmc-flash-layout-64.dtsi"
+	};
+};
+
+&gfx {
+	memory-region = <&gfx_memory>;
+
+	status = "okay";
+};
+
+&gpio0 {
+	gpio-line-names =
+		/* A0-A7 */	"","","","","","","","",
+		/* B0-B7 */	"","","","","","","","",
+		/* C0-C7 */	"","","","","","","","",
+		/* D0-D7 */	"","","","","","","","",
+		/* E0-E7 */	"","","","","","","","",
+		/* F0-F7 */	"","","","","","","","",
+		/* G0-G7 */	"","","","","","","","",
+		/* H0-H7 */	"","","","","","","","",
+		/* I0-I7 */	"","","","","","","","",
+		/* J0-J7 */	"","","","","","","","",
+		/* K0-K7 */	"","","","","","","","",
+		/* L0-L7 */	"","","","","","","","",
+		/* M0-M7 */	"","","","","","","","",
+		/* N0-N7 */	"","","","","","","","",
+		/* O0-O7 */	"","","","","","","","",
+		/* P0-P7 */	"button-reset-n","control-reset-n",
+		"button-power-n","control-power-n",
+		"button-nmi-n","control-nmi-n",
+		"","",
+		/* Q0-Q7 */	"","","","","","","","",
+		/* R0-R7 */	"","","","","","","","",
+		/* S0-S7 */	"","","","","","","","",
+		/* T0-T7 */	"","","","","","","","",
+		/* U0-U7 */	"","","","","","","","",
+		/* V0-V7 */	"","","","","","","","",
+		/* W0-W7 */	"","","","","","","","",
+		/* X0-X7 */	"","","","","","","","",
+		/* Y0-Y7 */	"","","","","","","","",
+		/* Z0-Z7 */	"","","","","","","","";
+};
+
+&i2c7 {
+	status = "okay";
+
+	eeprom@57 {
+		compatible = "atmel,24c128";
+		reg = <0x57>;
+		pagesize = <16>;
+
+		nvmem-layout {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			eth0_macaddress: macaddress@3f80 {
+				reg = <0x3f80 6>;
+			};
+		};
+	};
+};
+
+&mac0 {
+	nvmem-cells = <&eth0_macaddress>;
+	nvmem-cell-names = "mac-address";
+	phy-handle = <&ethphy0>;
+	phy-mode = "rgmii-id";
+	pinctrl-0 = <&pinctrl_rgmii1_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&mdio0 {
+	status = "okay";
+
+	ethphy0: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
+	};
+};
+
+&uart5 {
+	status = "okay";
+};
-- 
2.47.3


