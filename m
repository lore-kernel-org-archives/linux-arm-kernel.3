Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1EE8C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 00:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wWNqqAntiLueNlOOvISn5Xu4T7d1LNy1Kt3fgDDvAVM=; b=EnQvSPeUtJkgh/3WEXmSlBXFN1
	02f56W9fZFFlqkpqXv6xUIxz+WRo6zgy84qqy3Ywph34vv7iloN6VXGBOvt29osG6pfl8UAvz1OzM
	K8+r5Vnzc49jLP8jEQ3hcJgMO0bAUqApM80Jxpi2LHp5l+iQU90AmbFAVWZYuJqcU9/wtg9BpNKKt
	dMihtWKgVUwkHIi47a6KSCHEp4xuvHReJNiL7dtp5aFRB3L6cDcfso/vuIzu+wuirc4XG/HwTU4kn
	UZXQDDx5AXydPGSmQpwKBSGVHi+95G4O1rUADdRRnTI0X92Ws2VjOwDLsk/fv2l5KDthi6A+L/o54
	HtPdrYcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uejSU-00000006Ck9-23qf;
	Thu, 24 Jul 2025 00:05:14 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueiv4-000000069P0-1t8G
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 23:30:43 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-236470b2dceso2969945ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 16:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753313442; x=1753918242; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wWNqqAntiLueNlOOvISn5Xu4T7d1LNy1Kt3fgDDvAVM=;
        b=Z5gI/M+Vykbgqk2OJWQySsV1Pml2AW2uk5Wf+L7x7JvpsYEFfNkFHNjUBCEoSKqxb4
         F+ykJTBJYddpoyrsX1S7tMk0QeFV+R5Yrz/lMOSGXhxaLR+V6Sp3ciN64Qd3wGdygY2S
         BMQ/TAvEL+lx7EO+6+Y8K44Wta/lVtbQmnapvxm2UbbegtSvrPmxK+YKwTCH86YZyB0b
         y2JGz7mxu5AiEpmipqLzisHmuPo2kelSp7ZPF7VHIUpspS29Z2N5CPsJAvH6kqn7uhmX
         Pyi4r1KoGQlnuR2OKZlmHKL0058pkX8rc1t0OX22AfK6PMfhN/ZFCgzeLyPcESuUyTNC
         PqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753313442; x=1753918242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wWNqqAntiLueNlOOvISn5Xu4T7d1LNy1Kt3fgDDvAVM=;
        b=vJo2X0zPxjfsoTZQ2bSxGylSgvvmL8LgO/l7BFGYLzQTl4VKYioWO3NOQ1RzLvrdn3
         cSnoh6LPTrd6wlNl+k4D1pb6zZkDeTZ9dVxkGQDhMSzfBvwsWgWLY9oR+T1S3uJnwgYP
         HphZfVdgkQ6j+9EQv63043uktmyaZW3qXPh0qqp/pt1a+lpwEZPsV/A+eO1TMihzUguV
         V8q9Am+4inydQ0PSX8aZO518p0O/SEU2oH9nbWkvTJRrn3CjRik7JO8eiaTTEDtS46l0
         wRFmKt2Ss+S66OQpPLUyBBnQ6XpoUNiRmS0qh93W3UC9HTX5QR9mF8b7kGz7bW4aIMOo
         JIAA==
X-Forwarded-Encrypted: i=1; AJvYcCX00uiCY8/JjVnWXDaSEUSZJlBfE9VlII4zY8tZ4wJ67FkucmepCc+MeNd4VvFZ4c3clvuU4sQHrkvZWNCbEYRi@lists.infradead.org
X-Gm-Message-State: AOJu0YwEa6nsuA9S2OccQ4EAdxXhEKg34EnVtcFSHbP/QnAki2jS+MeV
	3VMRHVH6AFRiZgN5kotes5/DdyYxhbDIt7Lcm6NJ9TuJIJdXweaha4TvpslRaiPD
X-Gm-Gg: ASbGncsD2QO0zEQ2ZpTxqSAL3/zJG8Hvn/dppXG22Qk7+Fce3q8Go91r5v4D6NEuLn8
	IFCgr4hjLsvTOlffPpGIz8LkJ6biqxmjYgcNzxnZADwIrlai7qJBs7eobZZx7CO7Z/sRDWD6lG8
	naY/CqUkfTxauMNimqJ14XYloYBsmWUjMtXGwM1vIzX9BICvZb/dqV46b7uNDKpUjvlNsr7Y3Cf
	aqsO2dpQ6WJLuJFJBBbi5TQ0Jqj12WQENeMX1tNf9d/v2BtanzdHh7Y6zILc+8Erpa45UY5Tiyk
	cm4UIpbSUuSjJwqdygy5hZwwn2IZCYveP+PwTQeypG15H4+oRNaEFSLzB4olbPyczo1Y0PxIL/M
	4kSpN4fi++woeJbbNTAgO2XDd4cyiDHqNkKS2oLSGM712ZGKpItEp0qDgd4GoewFd1IvZFvrr5B
	U=
X-Google-Smtp-Source: AGHT+IGMpmU9/y8jlws7TyyqNLtoPH3duLJVbY+xZiyyDKkZpeNxiVfJuwOA88XEZKJDN/jVR3l4cw==
X-Received: by 2002:a17:903:1aa6:b0:234:c5c1:9b63 with SMTP id d9443c01a7336-23f9814eb24mr64705765ad.18.1753313441648;
        Wed, 23 Jul 2025 16:30:41 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48bc6fbsm1260765ad.120.2025.07.23.16.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 16:30:41 -0700 (PDT)
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
Subject: [PATCH v3 13/13] ARM: dts: aspeed: Add Facebook Darwin (AST2600) BMC
Date: Wed, 23 Jul 2025 16:30:09 -0700
Message-ID: <20250723233013.142337-14-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250723233013.142337-1-rentao.bupt@gmail.com>
References: <20250723233013.142337-1-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_163042_492352_5D5869E6 
X-CRM114-Status: GOOD (  14.97  )
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

Add initial device tree for the Meta (Facebook) Darwin AST2600 BMC.

Darwin is Meta's rack switch platform with an AST2600 BMC integrated for
health monitoring purpose.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
Changes in v3:
  - Removed flash layout (use the "default" in common.dtsi).
Changes in v2:
  - Removed mac3 controller.
  - Fixed DTB warnings.

 arch/arm/boot/dts/aspeed/Makefile             |  1 +
 .../dts/aspeed/aspeed-bmc-facebook-darwin.dts | 72 +++++++++++++++++++
 2 files changed, 73 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dts

diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
index f6e714b7db2d..dce32ee0ace7 100644
--- a/arch/arm/boot/dts/aspeed/Makefile
+++ b/arch/arm/boot/dts/aspeed/Makefile
@@ -20,6 +20,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-facebook-bletchley.dtb \
 	aspeed-bmc-facebook-catalina.dtb \
 	aspeed-bmc-facebook-cmm.dtb \
+	aspeed-bmc-facebook-darwin.dtb \
 	aspeed-bmc-facebook-elbert.dtb \
 	aspeed-bmc-facebook-fuji-data64.dtb \
 	aspeed-bmc-facebook-fuji.dtb \
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dts
new file mode 100644
index 000000000000..58c107a1b6cf
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dts
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (c) 2021 Facebook Inc.
+
+/dts-v1/;
+
+#include "ast2600-facebook-netbmc-common.dtsi"
+
+/ {
+	model = "Facebook Darwin BMC";
+	compatible = "facebook,darwin-bmc", "aspeed,ast2600";
+
+	aliases {
+		serial0 = &uart5;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
+	};
+
+	chosen {
+		stdout-path = &uart5;
+	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
+			      <&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
+			      <&adc1 0>, <&adc1 1>, <&adc1 2>, <&adc1 3>,
+			      <&adc1 4>, <&adc1 5>, <&adc1 6>, <&adc1 7>;
+	};
+
+	spi_gpio: spi {
+		num-chipselects = <1>;
+		cs-gpios = <&gpio0 ASPEED_GPIO(X, 0) GPIO_ACTIVE_LOW>;
+	};
+};
+
+&i2c0 {
+	eeprom@50 {
+		compatible = "atmel,24c512";
+		reg = <0x50>;
+	};
+};
+
+&adc0 {
+	status = "okay";
+
+	pinctrl-0 = <&pinctrl_adc0_default &pinctrl_adc1_default
+		     &pinctrl_adc2_default &pinctrl_adc3_default
+		     &pinctrl_adc4_default &pinctrl_adc5_default
+		     &pinctrl_adc6_default &pinctrl_adc7_default>;
+};
+
+&adc1 {
+	status = "okay";
+
+	pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc9_default
+		     &pinctrl_adc10_default &pinctrl_adc11_default
+		     &pinctrl_adc12_default &pinctrl_adc13_default
+		     &pinctrl_adc14_default &pinctrl_adc15_default>;
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


