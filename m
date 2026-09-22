Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12156C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 12:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7irEIIBgzty36UKE5fbvUb/seFCiEiq/bxnIonis9JA=; b=y0b6tlA+vLHG9jYwI0QldktSHp
	uPdTp+D5BGqbTF8LUtZaqmb79Cg+55OHVH0VnO1HDfxDh8hwDIXCLBRXOko6ayGWGpELvHMjVLtSm
	hHyX+AvlyXH3v6XZdSyLQVgOMjdFqgHLdk+1uBt88OIaUKjNuGPCJQ/IT+YygGzHSr7ToX0/CRyKh
	wwsGgmir4S/cFQlJmNQGhnNn46asBCMx7j4+iWTDWjR8enrrJHu+cFrF006XkbhgdkQqV4fYbxHsb
	Ru5B0bHAtc90RuATDR1yJivlcbWYTJZZ7lRhZ6w47IE8WlUgmWygQ4weVDsNvtz+/c839bulbHw7Z
	krKbchZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8zkh-00000005KCQ-2fx3;
	Tue, 22 Sep 2026 12:37:39 +0000
Received: from mail-pz2-x24.google.com ([2607:f8b0:4864:3b::24])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8zka-00000005KA2-3eLE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 12:37:34 +0000
Received: by mail-pz2-x24.google.com with SMTP id 41be03b00d2f7-cc4d04d73b8so3417180a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 05:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790080652; x=1790685452; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7irEIIBgzty36UKE5fbvUb/seFCiEiq/bxnIonis9JA=;
        b=k5FlScr0m8gvrwYhCFcAXUh7zTXU/aZwN9NKVvGNnMuWLzYStda+JBlpzL7Cz2S/Wo
         bEb6asQZU5uiGzf6xKTEXzVROf6K9tlgG9h8LWgBJCrfGZvmPp+Qp0C/u9r1CaoyirGa
         eDAlg0/Qs15Uan2UdUPHs6U/+XL11U7YlNzjfbRKjVzacOnT3KpdOsz4B4JP+IJ7wNJ9
         8NcW0NbJlMe+mSyTUHkNl78n1Bkf4byKDgfxCGCXm9U1hKSkapfsqb0VR+BfppWWcy4M
         Tb/jrO3Z8Flme3rXZwrvpQph6w7oviNtMsnsxMcZKXp/j6R4/HoAslWWQOuhsnNQeHaV
         3PXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790080652; x=1790685452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7irEIIBgzty36UKE5fbvUb/seFCiEiq/bxnIonis9JA=;
        b=A5mvS68+qYK/33zP5UXxQASMrBxnSMu7wS25tuE+6P3BF2Az5UFXWlysRsqaerPxGw
         rlXSkWOUZR8qA3AdeOyuZ/xqoeM9wLM2xiNE247KFlr1xppPKrOHvRUiaUI7JdfuEYP8
         PednXQmo23ku5gKr9Z/yPcp/0T2DC0FvUI82kRfuaEY1Tg1uL4PffrYGC9XAnnTvTTIk
         mJRa382xW4wh4d4EVPsWj60z0H826GrU9QAEggjz3t3uUTo8HTiMmqQuUh1wP8D3cVfv
         Ju5EgiipqGELGrZtECjfeMW+oNdYYVuOu4QgYoDbiAy+TFeW4q3vTN9ZrzV427ZUxK2S
         dx+Q==
X-Forwarded-Encrypted: i=1; AKwUvBwY+qOAxqoawgrws87etTn8yFEuN+Ies6aEniAAasTbzLHb9r243cLRD5T+/Y3bAvLANuxVhxKKiR17BSfh3pFH@lists.infradead.org
X-Gm-Message-State: AFuF++kSH1mmC6VT3i27LjGyKC2/NakUEZq2YpObCyDT7cq5hkd2soaP
	eg5dNrOTDO2LmZtF/vR1PSJ2MMIbLLSj1/rztUEhn0h7I8sI7gHfwqSK
X-Gm-Gg: AYBFou0cnUA1nina2VHww08v+cAhbwOIYmvTq1aXU1pzj7QZJ93dMxaHqA/Rx1wHD81
	q1IY26Dl4/KuIdh+9D9Ui+s/XLpr4Pw6oPSiW3L4ax3xWpHm1TDcA3T821CyFht6ucftV4jN4EE
	Z6uOgNI9HbmXsrWHILXA/lKVsuC9ZASmue/LYaA2YI5TKVie0Av+IclGSGtEH1Qm0Op03Ao5UVI
	yjFpDPmjX/aYE2x9Mj/39RhUbCHR0oJL3Kq5wvX3hYupXRAma01NJbN0YoWVlTalR8aTxK3OL7U
	BBJwBPK+Q7kHeD5WUhP19wdcpiKodF/3JqBXRW6N0iQq60gnklCjJ/+Bzm70sbMu5h7wGqkWYlc
	8i9gUpX+EIfIT1xT/lBdaImrJgqUuMjuKLk69oi5O7smCkLHQO8P71q1skbPRIjHSXutc2Z8iQT
	p9ReYxnV2x8Skqs41qyKlm/fsm3XeJeBvkABFKLaw2S3THr8dV5SulKEHxfoyBsQ0+QAatv4+Gi
	pi6xzdO+TeDA1g7aiXnbRvphKE=
X-Received: by 2002:a05:6a20:e290:b0:3dd:a196:9076 with SMTP id adf61e73a8af0-3ddec87d5f9mr1250509637.64.1790080651785;
        Tue, 22 Sep 2026 05:37:31 -0700 (PDT)
Received: from debian.prasanth ([103.183.205.140])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e612ccd46sm6453922eec.18.2026.09.22.05.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:37:31 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: joel@jms.id.au
Cc: andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	andrew@lunn.ch,
	tan.siewert@9elements.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v7 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
Date: Tue, 22 Sep 2026 18:05:00 +0530
Message-ID: <cb05fc2f4158b03d312b94cd9361173fe92ac528.1790079398.git.prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790079398.git.prasanth.padarthi10@gmail.com>
References: <cover.1790079398.git.prasanth.padarthi10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_053732_913225_692EBA38 
X-CRM114-Status: GOOD (  16.17  )
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


