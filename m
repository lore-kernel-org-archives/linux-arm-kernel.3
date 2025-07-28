Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE72C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 06:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qdyCZeHB/n3cd/0AsmLmHKyQ7YtcK5SMST6G1p7Lyqo=; b=bCJa3joli/XWoR9LA11LBC5AJ6
	ygxyTjUw8yIcEVqaf2hIcthVIpT8wDUawOKxFNgRQ4shKBkFQ8E85vIEdSsclVGqLATiQpspmOHxG
	tla24tihfJNsE8F3lnF+PHQmcn7NA1bsbhKtIHL7lK85dpgx21F7fbAtT89NmSDP8wGhy6TfMKcF9
	ozlZgIpEZc52nNqXWlj1O11dbN/kXSmQl89AmTjB0WkizfNr/LpIeN7dEiXYryUvwW8QDJu+HMDEH
	0L9Gt7wQ5NWevkV64Rb62Jt6aMJG0y2bCHppXZAq1XBd0fO9Q36EF8J3DhRv1SUoNB2wBRwWool2v
	IabtUTGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugHJS-0000000DlCJ-2Iwp;
	Mon, 28 Jul 2025 06:26:18 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugGqm-0000000DhQB-21US
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 05:56:42 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-23c8f179e1bso45892065ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 22:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753682200; x=1754287000; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qdyCZeHB/n3cd/0AsmLmHKyQ7YtcK5SMST6G1p7Lyqo=;
        b=RAlpVIt1x4ImeTHLoB9ZozalEaK5bZ2YnmczMGcda3Trlb7LY8pU3q7fcBur629WiX
         29MYmwGpNiVvRcwAcSwih8RV7lRE1kkuPZYhkJ/iGKugeYK8VIDteK9nbmDJU6gc1LKC
         74yG3Gq0vMRJeDHAO4YsSRfOSjjGVkMKT7o6OffxIOYq4vVRAlbw5suWtMRD8BQQ95YE
         0tqh0CYYs+WXEuYWAQpgGACloH2iwXYNKD1lNIHezTnIQ5NmwKQIAB6U/DeFdBapQPiZ
         YOOaKE2jImZBF3RYalcVtZAst92yQzBTKzeLZEI75mUtHVx4galLW3bIbogbNaUjNKGi
         6DNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753682200; x=1754287000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qdyCZeHB/n3cd/0AsmLmHKyQ7YtcK5SMST6G1p7Lyqo=;
        b=Fw6A2z+fe3rCv08xwtNjcgPHmHW3yN/oHmnuR6vZ1gZWGlMjB+MS5h0+DvoyMr98sM
         HarzNGJCKWb5d2C1wR5qYl3mC49UXnNY/phQdThEQmrx3qDJBRG2JM6J3lBVyXZ8Vhwp
         u9lUgvPiJxQaW2ufEwf9sW5OVkEAycW979vyX2qh1oA886kTwIXyhmWnm8GwzQaciDEz
         96z1UA3cyNfh2Fg7rrB2ENF5MlXnqbvqXH1slAHga2piiYDYRrTluEJH7BUgT47r8Ppb
         8yCC1IN7ZSOsV+HOjXIOz9TQRDVFiuhKzFeAJ7Wc/qhQaAWpiGychwKN33djTUFg49Zf
         ghSg==
X-Forwarded-Encrypted: i=1; AJvYcCX/Uapn28IZUqk6Q147NVxgkP3qDRFwg1uIYXMlKo3w50wBlWG+TsF8kp0iqmTMeVDZyP1ZKge8L8SWRIG+ONjo@lists.infradead.org
X-Gm-Message-State: AOJu0YztcxCrvsIEE3JyuZWjLDCsTPCXpe2Ewz/zqU04JyqYw0gIO44w
	uEHhQqk/ZMZEGsUYKLhJhdNQYjrrDDN1uEA5R2aprqM2Jyu/Iy7KxTkF
X-Gm-Gg: ASbGncs+qK4Lhcn9W4wo4q8vxAAE3tQpXNV2pgu+u94x9lYuziYa5RX2XiUFCPK28Vh
	66NukYtwnbSfqCmVTt/N08xe0oxPlDRT6my/hQx+896qeFZCWNXdWYjz+UjBczreoVD5Cs/KR4j
	Kp5aVbxHmRuMJ95iMYy3idd1DuEKLigPK+C/yuctcFWTpTNaNrfY656TPETIHfl/qgfXjDt2I5O
	GSWDkZHn56/BPhEfs6vviFKGW1YPyQ4BwmWUQnX4LvYJLOHHRHSDKl5MCqwIAc2ZCv0W53YyZky
	uTJNFscTJ8AXy92qY7ClEvekq6tNzFzYFkmxjmXYOLN3cPP+BNWv3eyCPAfno3IhPNMsVQPaHNa
	fMk8GTAJHdz4hy/9sjf9WiOjRNcGZWQT7e/hiVkaj5jk1aFb2dq4L1BektlOjDqOrLI6T6u/zfu
	U=
X-Google-Smtp-Source: AGHT+IH9oH30nS5jAWWPJQcB86ywoCK/pWz3RRF2xO5I4bcrved4+5AwQJNnFvkzdpkJ5fipJR4yeQ==
X-Received: by 2002:a17:903:f8e:b0:224:23be:c569 with SMTP id d9443c01a7336-23fb30dfcc0mr171084835ad.22.1753682199461;
        Sun, 27 Jul 2025 22:56:39 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe514b59sm45091795ad.128.2025.07.27.22.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 22:56:38 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Tao Ren <taoren@meta.com>
Cc: Tao Ren <rentao.bupt@gmail.com>
Subject: [PATCH v4 10/13] ARM: dts: aspeed: Add Facebook Fuji-data64 (AST2600) Board
Date: Sun, 27 Jul 2025 22:56:12 -0700
Message-ID: <20250728055618.61616-11-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250728055618.61616-1-rentao.bupt@gmail.com>
References: <20250728055618.61616-1-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_225640_533355_06DE33BD 
X-CRM114-Status: GOOD (  16.59  )
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

From: Tao Ren <rentao.bupt@gmail.com>

Introduce fuji-data64.dts to extend Meta/Facebook Fuji BMC's data0
partition without breaking the existing users.

Fuji-data64.dts is copied from fuji.dts with below changes:
  - updating model/compatible strings.
  - updating FMC flash0' data0 partition to 64MB.
  - removing mac3.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
Changes in v4:
  - Removed mac3 from dts.
Changes in v3:
  - None (the patch is introduced in v3).

 arch/arm/boot/dts/aspeed/Makefile             |    1 +
 .../aspeed-bmc-facebook-fuji-data64.dts       | 1256 +++++++++++++++++
 2 files changed, 1257 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji-data64.dts

diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
index 55be25acfc80..f6e714b7db2d 100644
--- a/arch/arm/boot/dts/aspeed/Makefile
+++ b/arch/arm/boot/dts/aspeed/Makefile
@@ -21,6 +21,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-facebook-catalina.dtb \
 	aspeed-bmc-facebook-cmm.dtb \
 	aspeed-bmc-facebook-elbert.dtb \
+	aspeed-bmc-facebook-fuji-data64.dtb \
 	aspeed-bmc-facebook-fuji.dtb \
 	aspeed-bmc-facebook-galaxy100.dtb \
 	aspeed-bmc-facebook-greatlakes.dtb \
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji-data64.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji-data64.dts
new file mode 100644
index 000000000000..aa9576d8ab56
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji-data64.dts
@@ -0,0 +1,1256 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (c) 2020 Facebook Inc.
+
+/dts-v1/;
+
+#include <dt-bindings/leds/common.h>
+#include "ast2600-facebook-netbmc-common.dtsi"
+
+/ {
+	model = "Facebook Fuji BMC (64MB Datastore)";
+	compatible = "facebook,fuji-data64-bmc", "aspeed,ast2600";
+
+	aliases {
+		/*
+		 * PCA9548 (2-0070) provides 8 channels connecting to
+		 * SCM (System Controller Module).
+		 */
+		i2c16 = &imux16;
+		i2c17 = &imux17;
+		i2c18 = &imux18;
+		i2c19 = &imux19;
+		i2c20 = &imux20;
+		i2c21 = &imux21;
+		i2c22 = &imux22;
+		i2c23 = &imux23;
+
+		/*
+		 * PCA9548 (8-0070) provides 8 channels connecting to
+		 * SMB (Switch Main Board).
+		 */
+		i2c24 = &imux24;
+		i2c25 = &imux25;
+		i2c26 = &imux26;
+		i2c27 = &imux27;
+		i2c28 = &imux28;
+		i2c29 = &imux29;
+		i2c30 = &imux30;
+		i2c31 = &imux31;
+
+		/*
+		 * PCA9548 (11-0077) provides 8 channels connecting to
+		 * SMB (Switch Main Board).
+		 */
+		i2c40 = &imux40;
+		i2c41 = &imux41;
+		i2c42 = &imux42;
+		i2c43 = &imux43;
+		i2c44 = &imux44;
+		i2c45 = &imux45;
+		i2c46 = &imux46;
+		i2c47 = &imux47;
+
+		/*
+		 * PCA9548 (24-0071) provides 8 channels connecting to
+		 * PDB-Left.
+		 */
+		i2c48 = &imux48;
+		i2c49 = &imux49;
+		i2c50 = &imux50;
+		i2c51 = &imux51;
+		i2c52 = &imux52;
+		i2c53 = &imux53;
+		i2c54 = &imux54;
+		i2c55 = &imux55;
+
+		/*
+		 * PCA9548 (25-0072) provides 8 channels connecting to
+		 * PDB-Right.
+		 */
+		i2c56 = &imux56;
+		i2c57 = &imux57;
+		i2c58 = &imux58;
+		i2c59 = &imux59;
+		i2c60 = &imux60;
+		i2c61 = &imux61;
+		i2c62 = &imux62;
+		i2c63 = &imux63;
+
+		/*
+		 * PCA9548 (26-0076) provides 8 channels connecting to
+		 * FCM1.
+		 */
+		i2c64 = &imux64;
+		i2c65 = &imux65;
+		i2c66 = &imux66;
+		i2c67 = &imux67;
+		i2c68 = &imux68;
+		i2c69 = &imux69;
+		i2c70 = &imux70;
+		i2c71 = &imux71;
+
+		/*
+		 * PCA9548 (27-0076) provides 8 channels connecting to
+		 * FCM2.
+		 */
+		i2c72 = &imux72;
+		i2c73 = &imux73;
+		i2c74 = &imux74;
+		i2c75 = &imux75;
+		i2c76 = &imux76;
+		i2c77 = &imux77;
+		i2c78 = &imux78;
+		i2c79 = &imux79;
+
+		/*
+		 * PCA9548 (40-0076) provides 8 channels connecting to
+		 * PIM1.
+		 */
+		i2c80 = &imux80;
+		i2c81 = &imux81;
+		i2c82 = &imux82;
+		i2c83 = &imux83;
+		i2c84 = &imux84;
+		i2c85 = &imux85;
+		i2c86 = &imux86;
+		i2c87 = &imux87;
+
+		/*
+		 * PCA9548 (41-0076) provides 8 channels connecting to
+		 * PIM2.
+		 */
+		i2c88 = &imux88;
+		i2c89 = &imux89;
+		i2c90 = &imux90;
+		i2c91 = &imux91;
+		i2c92 = &imux92;
+		i2c93 = &imux93;
+		i2c94 = &imux94;
+		i2c95 = &imux95;
+
+		/*
+		 * PCA9548 (42-0076) provides 8 channels connecting to
+		 * PIM3.
+		 */
+		i2c96 = &imux96;
+		i2c97 = &imux97;
+		i2c98 = &imux98;
+		i2c99 = &imux99;
+		i2c100 = &imux100;
+		i2c101 = &imux101;
+		i2c102 = &imux102;
+		i2c103 = &imux103;
+
+		/*
+		 * PCA9548 (43-0076) provides 8 channels connecting to
+		 * PIM4.
+		 */
+		i2c104 = &imux104;
+		i2c105 = &imux105;
+		i2c106 = &imux106;
+		i2c107 = &imux107;
+		i2c108 = &imux108;
+		i2c109 = &imux109;
+		i2c110 = &imux110;
+		i2c111 = &imux111;
+
+		/*
+		 * PCA9548 (44-0076) provides 8 channels connecting to
+		 * PIM5.
+		 */
+		i2c112 = &imux112;
+		i2c113 = &imux113;
+		i2c114 = &imux114;
+		i2c115 = &imux115;
+		i2c116 = &imux116;
+		i2c117 = &imux117;
+		i2c118 = &imux118;
+		i2c119 = &imux119;
+
+		/*
+		 * PCA9548 (45-0076) provides 8 channels connecting to
+		 * PIM6.
+		 */
+		i2c120 = &imux120;
+		i2c121 = &imux121;
+		i2c122 = &imux122;
+		i2c123 = &imux123;
+		i2c124 = &imux124;
+		i2c125 = &imux125;
+		i2c126 = &imux126;
+		i2c127 = &imux127;
+
+		/*
+		 * PCA9548 (46-0076) provides 8 channels connecting to
+		 * PIM7.
+		 */
+		i2c128 = &imux128;
+		i2c129 = &imux129;
+		i2c130 = &imux130;
+		i2c131 = &imux131;
+		i2c132 = &imux132;
+		i2c133 = &imux133;
+		i2c134 = &imux134;
+		i2c135 = &imux135;
+
+		/*
+		 * PCA9548 (47-0076) provides 8 channels connecting to
+		 * PIM8.
+		 */
+		i2c136 = &imux136;
+		i2c137 = &imux137;
+		i2c138 = &imux138;
+		i2c139 = &imux139;
+		i2c140 = &imux140;
+		i2c141 = &imux141;
+		i2c142 = &imux142;
+		i2c143 = &imux143;
+	};
+
+	spi_gpio: spi {
+		num-chipselects = <3>;
+		cs-gpios = <&gpio0 ASPEED_GPIO(X, 0) GPIO_ACTIVE_LOW>,
+			   <0>,	/* device reg=<1> does not exist */
+			   <&gpio0 ASPEED_GPIO(X, 2) GPIO_ACTIVE_HIGH>;
+
+		eeprom@2 {
+			compatible = "atmel,at93c46d";
+			spi-max-frequency = <250000>;
+			data-size = <16>;
+			spi-cs-high;
+			reg = <2>;
+		};
+	};
+};
+
+&fmc {
+	flash@0 {
+		/delete-node/partitions;
+#include "facebook-bmc-flash-layout-128-data64.dtsi"
+	};
+};
+
+&i2c0 {
+	multi-master;
+	bus-frequency = <1000000>;
+};
+
+&i2c2 {
+	/*
+	 * PCA9548 (2-0070) provides 8 channels connecting to SCM (System
+	 * Controller Module).
+	 */
+	i2c-mux@70 {
+		compatible = "nxp,pca9548";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x70>;
+		i2c-mux-idle-disconnect;
+
+		imux16: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			adm1278@10 {
+				compatible = "adi,adm1278";
+				reg = <0x10>;
+				shunt-resistor-micro-ohms = <1500>;
+			};
+		};
+
+		imux17: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		imux18: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		imux19: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+
+		imux20: i2c@4 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <4>;
+		};
+
+		imux21: i2c@5 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <5>;
+		};
+
+		imux22: i2c@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <6>;
+		};
+
+		imux23: i2c@7 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <7>;
+		};
+	};
+};
+
+&i2c8 {
+	/*
+	 * PCA9548 (8-0070) provides 8 channels connecting to SMB (Switch
+	 * Main Board).
+	 */
+	i2c-mux@70 {
+		compatible = "nxp,pca9548";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x70>;
+		i2c-mux-idle-disconnect;
+
+		imux24: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			i2c-mux@71 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x71>;
+				i2c-mux-idle-disconnect;
+
+				imux48: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+
+				imux49: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+
+				imux50: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+
+					lp5012@14 {
+						compatible = "ti,lp5012";
+						reg = <0x14>;
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						multi-led@0 {
+							#address-cells = <1>;
+							#size-cells = <0>;
+							reg = <0>;
+							color = <LED_COLOR_ID_MULTI>;
+							function = LED_FUNCTION_ACTIVITY;
+							label = "sys";
+
+							led@0 {
+								reg = <0>;
+								color = <LED_COLOR_ID_RED>;
+							};
+
+							led@1 {
+								reg = <1>;
+								color = <LED_COLOR_ID_BLUE>;
+							};
+
+							led@2 {
+								reg = <2>;
+								color = <LED_COLOR_ID_GREEN>;
+							};
+						};
+
+						multi-led@1 {
+							#address-cells = <1>;
+							#size-cells = <0>;
+							reg = <1>;
+							color = <LED_COLOR_ID_MULTI>;
+							function = LED_FUNCTION_ACTIVITY;
+							label = "fan";
+
+							led@0 {
+								reg = <0>;
+								color = <LED_COLOR_ID_RED>;
+							};
+
+							led@1 {
+								reg = <1>;
+								color = <LED_COLOR_ID_BLUE>;
+							};
+
+							led@2 {
+								reg = <2>;
+								color = <LED_COLOR_ID_GREEN>;
+							};
+						};
+
+						multi-led@2 {
+							#address-cells = <1>;
+							#size-cells = <0>;
+							reg = <2>;
+							color = <LED_COLOR_ID_MULTI>;
+							function = LED_FUNCTION_ACTIVITY;
+							label = "psu";
+
+							led@0 {
+								reg = <0>;
+								color = <LED_COLOR_ID_RED>;
+							};
+
+							led@1 {
+								reg = <1>;
+								color = <LED_COLOR_ID_BLUE>;
+							};
+
+							led@2 {
+								reg = <2>;
+								color = <LED_COLOR_ID_GREEN>;
+							};
+						};
+
+						multi-led@3 {
+							#address-cells = <1>;
+							#size-cells = <0>;
+							reg = <3>;
+							color = <LED_COLOR_ID_MULTI>;
+							function = LED_FUNCTION_ACTIVITY;
+							label = "smb";
+
+							led@0 {
+								reg = <0>;
+								color = <LED_COLOR_ID_RED>;
+							};
+
+							led@1 {
+								reg = <1>;
+								color = <LED_COLOR_ID_BLUE>;
+							};
+
+							led@2 {
+								reg = <2>;
+								color = <LED_COLOR_ID_GREEN>;
+							};
+						};
+					};
+				};
+
+				imux51: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+
+				imux52: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+				};
+
+				imux53: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <5>;
+				};
+
+				imux54: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <6>;
+				};
+
+				imux55: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <7>;
+				};
+			};
+
+		};
+
+		imux25: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			i2c-mux@72 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x72>;
+				i2c-mux-idle-disconnect;
+
+				imux56: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+
+				imux57: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+
+				imux58: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+
+				imux59: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+
+				imux60: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+				};
+
+				imux61: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <5>;
+				};
+
+				imux62: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <6>;
+				};
+
+				imux63: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <7>;
+				};
+			};
+
+		};
+
+		imux26: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+
+			i2c-mux@76 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x76>;
+				i2c-mux-idle-disconnect;
+
+				imux64: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+
+				imux65: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+
+				imux66: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+
+				imux67: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+
+					adm1278@10 {
+						compatible = "adi,adm1278";
+						reg = <0x10>;
+						shunt-resistor-micro-ohms = <250>;
+					};
+				};
+
+				imux68: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+				};
+
+				imux69: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <5>;
+				};
+
+				imux70: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <6>;
+				};
+
+				imux71: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <7>;
+				};
+			};
+
+		};
+
+		imux27: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+
+			i2c-mux@76 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x76>;
+				i2c-mux-idle-disconnect;
+
+				imux72: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+
+				imux73: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+
+				imux74: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+
+				imux75: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+
+					adm1278@10 {
+						compatible = "adi,adm1278";
+						reg = <0x10>;
+						shunt-resistor-micro-ohms = <250>;
+					};
+				};
+
+				imux76: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+				};
+
+				imux77: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <5>;
+				};
+
+				imux78: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <6>;
+				};
+
+				imux79: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <7>;
+				};
+			};
+
+		};
+
+		imux28: i2c@4 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <4>;
+		};
+
+		imux29: i2c@5 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <5>;
+		};
+
+		imux30: i2c@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <6>;
+		};
+
+		imux31: i2c@7 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <7>;
+		};
+
+	};
+};
+
+&i2c11 {
+	status = "okay";
+
+	/*
+	 * PCA9548 (11-0077) provides 8 channels connecting to SMB (Switch
+	 * Main Board).
+	 */
+	i2c-mux@77 {
+		compatible = "nxp,pca9548";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x77>;
+		i2c-mux-idle-disconnect;
+
+		imux40: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			i2c-mux@76 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x76>;
+				i2c-mux-idle-disconnect;
+
+				imux80: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+
+				imux81: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+
+				imux82: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+
+				imux83: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+
+				imux84: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+				};
+
+				imux85: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <5>;
+				};
+
+				imux86: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <6>;
+				};
+
+				imux87: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <7>;
+				};
+			};
+
+		};
+
+		imux41: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			i2c-mux@76 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x76>;
+				i2c-mux-idle-disconnect;
+
+				imux88: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+
+				imux89: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+
+				imux90: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+
+				imux91: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+
+				imux92: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+				};
+
+				imux93: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <5>;
+				};
+
+				imux94: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <6>;
+				};
+
+				imux95: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <7>;
+				};
+			};
+
+		};
+
+		imux42: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+
+			i2c-mux@76 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x76>;
+				i2c-mux-idle-disconnect;
+
+				imux96: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+
+				imux97: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+
+				imux98: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+
+				imux99: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+
+				imux100: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+				};
+
+				imux101: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <5>;
+				};
+
+				imux102: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <6>;
+				};
+
+				imux103: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <7>;
+				};
+			};
+
+		};
+
+		imux43: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+
+			i2c-mux@76 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x76>;
+				i2c-mux-idle-disconnect;
+
+				imux104: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+
+				imux105: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+
+				imux106: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+
+				imux107: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+
+				imux108: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+				};
+
+				imux109: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <5>;
+				};
+
+				imux110: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <6>;
+				};
+
+				imux111: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <7>;
+				};
+			};
+
+		};
+
+		imux44: i2c@4 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <4>;
+
+			i2c-mux@76 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x76>;
+				i2c-mux-idle-disconnect;
+
+				imux112: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+
+				imux113: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+
+				imux114: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+
+				imux115: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+
+				imux116: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+				};
+
+				imux117: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <5>;
+				};
+
+				imux118: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <6>;
+				};
+
+				imux119: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <7>;
+				};
+			};
+
+		};
+
+		imux45: i2c@5 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <5>;
+
+			i2c-mux@76 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x76>;
+				i2c-mux-idle-disconnect;
+
+				imux120: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+
+				imux121: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+
+				imux122: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+
+				imux123: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+
+				imux124: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+				};
+
+				imux125: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <5>;
+				};
+
+				imux126: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <6>;
+				};
+
+				imux127: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <7>;
+				};
+			};
+
+		};
+
+		imux46: i2c@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <6>;
+
+			i2c-mux@76 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x76>;
+				i2c-mux-idle-disconnect;
+
+				imux128: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+
+				imux129: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+
+				imux130: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+
+				imux131: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+
+				imux132: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+				};
+
+				imux133: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <5>;
+				};
+
+				imux134: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <6>;
+				};
+
+				imux135: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <7>;
+				};
+			};
+
+		};
+
+		imux47: i2c@7 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <7>;
+
+			i2c-mux@76 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x76>;
+				i2c-mux-idle-disconnect;
+
+				imux136: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+
+				imux137: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+
+				imux138: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+
+				imux139: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+
+				imux140: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+				};
+
+				imux141: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <5>;
+				};
+
+				imux142: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <6>;
+				};
+
+				imux143: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <7>;
+				};
+			};
+
+		};
+
+	};
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&mdio1 {
+	status = "okay";
+
+	ethphy3: ethernet-phy@13 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0x0d>;
+	};
+};
+
+&emmc_controller {
+	status = "okay";
+};
+
+&emmc {
+	status = "okay";
+
+	non-removable;
+	max-frequency = <25000000>;
+	bus-width = <4>;
+};
-- 
2.47.3


