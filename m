Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E94E63CA4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 21:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zNMUkIoLTalpAd3ZRQES5uiVuV25MXRQWddLJpJTYAY=; b=S8e8l/dD8TU4AE7MPH2C4Th3VB
	jHTlvN/pQ3+mBkr/0V2dEvWq1RBsOFYhSp0QYhiq/e5wqdCe7AD6DZqv+CVombyWqJxuxMZtkS7TV
	dMciZzBSqEsLAzsBuJSgumDT51BvfGnf3/FQQfDbgluzFFoN5DKHgaMfgrr08gk4gnrForcdfX1Ix
	718lW8jQ/JrwU5uZ9b44BadYD0g8ln4B5JbFRo6v8kX9w/Ri+buqtAgsY0kmwG0JS0oh1hK+tTYVP
	ALpanryl0yyYHPG0JHrSU/6E6PP4BdUa7SEH2DiHG1Xg4pqp3Lvox3REo8ECqc7yYw8CEkCUkODNr
	1pc4YKng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk7EC-0000000BVQj-12py;
	Sun, 25 Jan 2026 21:01:00 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk7E2-0000000BVOn-3nBv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Jan 2026 21:00:52 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-79456d5dda4so7125537b3.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Jan 2026 13:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769374850; x=1769979650; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zNMUkIoLTalpAd3ZRQES5uiVuV25MXRQWddLJpJTYAY=;
        b=JwiUK5iY7rXnfAWXnOkG+plyx1KnWAiqcS3gYP+Aai0rdiIRZjcp+lhLbV8VF+Jvmr
         JeqCIGRFA99l9A00b6RMrj+26kpAit/rPm4V8Kfp1O343MxMCIJ7lMnWs8y110H80zlu
         vbGVKz69hSxsPLEShOmEyaYNgx4HPXhxNiII8nlomhSwT1vTb6ZRhg04XWWI2c1DPnSG
         fv7all5YM6LdqCVrolGjXjLp8VPQcKET0taMlOv4twG1V3yl5MfbRhMIB++Gm8XEWHjQ
         AtZekLMymvfiUBtUUmlctsrQSuK1yQnZCNF2Ec9fnEHe6QHhgbEZg+0zNG7lQ5jH1Wbt
         MbTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769374850; x=1769979650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zNMUkIoLTalpAd3ZRQES5uiVuV25MXRQWddLJpJTYAY=;
        b=qfVhGPZ0aOuqajig7M/x3RH0QgC5DVlEZErCWbxn7etrwyhbffCxh/iBafig3THZXi
         OkvgyfB+vcZFr8u56NkP/buT5b5iAPcQjSwaQHK2AP8VcAXHnH+i6qP/EtTJ8p/dI8T/
         DFS+mjRc/d9EuStCHIieuLb7nrmLePU9oeljOaWSND+w965zye1mvAZiGqXiwQcwtbNt
         mnqjtwQkPqgclyraizSj0sBE58zielqRCmjy3G8ftOyx0LVxvjGbNn/MIbx3YCWnCY6L
         fiaWCn+XSJ1EnSs0Ikm5sjxTG/wGfvC6ucG32OQPCh7/FkONMrW4ouQowKkrj6TnNpPP
         85Ww==
X-Forwarded-Encrypted: i=1; AJvYcCW6Ipul7pOqOsEkrIWKdv+g85XkKIsv6phLiLmY6reflIzDjDvSJflml9AIl2SE1n+cXKlaN3J78WqxMX1x3Hys@lists.infradead.org
X-Gm-Message-State: AOJu0YxjdB9COBrpA9+8rr1z7iGC+eO4s3ZJXqtoVgLOpJ6p2wgyr8iu
	V2xADMhZdKcQSLpy/3NQMg9+9G48fPNMjKtEZ9UqIy5XEuT0vrk4Kfm2
X-Gm-Gg: AZuq6aLorrv4hnqNQWIoE62/9VCg0j/Ubzm5rRbD/vK4IGsPhwlYVBooaIbjNrDSShu
	0uC5OO7iPph24Lui04u2pcHKpE4l+Ep8dNCsxXHp3/84Ya4Yab0FpSnjJtvmS597qdkkqWfi9EK
	xxTfxxerYIHhWxwfspWIrFGci0Cjae+000GisU8Y1Cl1TM9kd7ozkhHgsDFrPxDdxyeAV4naPyS
	mvMrep9ckgypFUU8x3JzZlbTnsjk23e55h/QzEdfq6gZodK03XwMimOGqS6/CEhdR414jE2hs7T
	z9A8+0ybkh2MT7PsxcKFNZF9WSxXinn1LJ1ebJHZFkebYIPq1YuXS6itbSGqUUOXQoPvWZIu2+e
	R7jNXqsFDU5X5Qe3UE7DQmcMP8tZdBSkLaNQ2hzHF9NeXEWCggueywaoOeoU+DmQA47pFMzInFM
	GyK54k
X-Received: by 2002:a05:690c:e3ce:b0:794:35b:af5e with SMTP id 00721157ae682-7945a86ee06mr44305837b3.5.1769374849589;
        Sun, 25 Jan 2026 13:00:49 -0800 (PST)
Received: from [192.168.2.165] ([2600:1700:220:59e0::914])
        by smtp.googlemail.com with ESMTPSA id 956f58d0204a3-6496855d65esm2518183d50.12.2026.01.25.13.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 13:00:49 -0800 (PST)
From: Anirudh Srinivasan <anirudhsriniv@gmail.com>
Date: Sun, 25 Jan 2026 15:00:39 -0600
Subject: [PATCH 2/2] ARM: dts: aspeed: Add Asrock Paul IPMI card
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-asrock-paul-v1-2-956085a4bd06@gmail.com>
References: <20260125-asrock-paul-v1-0-956085a4bd06@gmail.com>
In-Reply-To: <20260125-asrock-paul-v1-0-956085a4bd06@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Zev Weiss <zev@bewilderbeest.net>, Renze Nicolai <renze@rnplus.nl>, 
 Anirudh Srinivasan <anirudhsriniv@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_130050_966552_CB0A938D 
X-CRM114-Status: GOOD (  14.13  )
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

Add device tree for Asrock Paul IPMI card, an AST2500 based PCIe BMC
card.

Signed-off-by: Anirudh Srinivasan <anirudhsriniv@gmail.com>
---
 arch/arm/boot/dts/aspeed/Makefile                  |   1 +
 .../aspeed/aspeed-bmc-asrock-paul-ipmi-card.dts    | 131 +++++++++++++++++++++
 2 files changed, 132 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
index 9adf9278dc94f84653775296c93150e61cc99328..be3c84a8462353996e0503cd95326ed88f6b8723 100644
--- a/arch/arm/boot/dts/aspeed/Makefile
+++ b/arch/arm/boot/dts/aspeed/Makefile
@@ -11,6 +11,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-arm-stardragon4800-rep2.dtb \
 	aspeed-bmc-asrock-e3c246d4i.dtb \
 	aspeed-bmc-asrock-e3c256d4i.dtb \
+	aspeed-bmc-asrock-paul-ipmi-card.dtb \
 	aspeed-bmc-asrock-romed8hm3.dtb \
 	aspeed-bmc-asrock-spc621d8hm3.dtb \
 	aspeed-bmc-asrock-x570d4u.dtb \
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-paul-ipmi-card.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-paul-ipmi-card.dts
new file mode 100644
index 0000000000000000000000000000000000000000..f74f8fee9e1edb6cc1c0a0aef1268bdf91fc03f7
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-paul-ipmi-card.dts
@@ -0,0 +1,131 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright 2025 Anirudh Srinivasan
+
+/dts-v1/;
+
+#include "aspeed-g5.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+
+/{
+	model = "ASRock Paul IPMI Card";
+	compatible = "asrock,ast2500-paul-ipmi-card", "aspeed,ast2500";
+
+	aliases {
+		serial4 = &uart5;
+	};
+
+	chosen {
+		stdout-path = &uart5;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-fan-1 {
+			gpios = <&gpio ASPEED_GPIO(AA, 0) GPIO_ACTIVE_LOW>;
+			label = "fan1_red";
+			default-state = "off";
+		};
+
+		led-fan-2 {
+			gpios = <&gpio ASPEED_GPIO(AA, 1) GPIO_ACTIVE_LOW>;
+			label = "fan2_red";
+			default-state = "off";
+		};
+
+		led-fault {
+			gpios = <&gpio ASPEED_GPIO(Y, 3) GPIO_ACTIVE_LOW>;
+			label = "panic_red";
+			panic-indicator;
+			default-state = "off";
+		};
+
+		led-heartbeat {
+			gpios = <&gpio ASPEED_GPIO(H, 6) GPIO_ACTIVE_LOW>;
+			label = "heartbeat_green";
+			linux,default-trigger = "timer";
+		};
+	};
+
+	memory@80000000 {
+		reg = <0x80000000 0x20000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		video_engine_memory: video {
+			size = <0x02000000>;
+			alignment = <0x01000000>;
+			compatible = "shared-dma-pool";
+			reusable;
+		};
+	};
+};
+
+&fmc {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "bmc";
+		spi-max-frequency = <50000000>; /* 50 MHz */
+#include "openbmc-flash-layout.dtsi"
+	};
+};
+
+&gpio {
+	status = "okay";
+	gpio-line-names =
+		/*  A */ "", "", "", "", "", "", "", "",
+		/*  B */ "", "", "", "", "", "", "", "",
+		/*  C */ "", "", "", "", "", "", "", "",
+		/*  D */ "", "BMC_PWRBTN", "", "BMC_RESETCON", "", "", "", "",
+		/*  E */ "", "", "", "", "", "", "", "",
+		/*  F */ "", "", "", "", "", "", "", "",
+		/*  G */ "", "", "", "", "", "", "", "",
+		/*  H */ "", "", "", "", "", "", "BMC_LED1", "",
+		/*  I */ "", "", "", "", "", "", "", "",
+		/*  J */ "", "", "", "", "", "", "", "",
+		/*  K */ "", "", "", "", "", "", "", "",
+		/*  L */ "", "", "", "", "", "", "", "",
+		/*  M */ "", "", "", "", "", "", "", "",
+		/*  N */ "", "", "", "", "", "", "", "",
+		/*  O */ "", "", "", "", "", "", "", "",
+		/*  P */ "", "", "", "", "", "", "", "",
+		/*  Q */ "", "", "", "", "", "", "", "",
+		/*  R */ "", "", "", "", "", "", "", "",
+		/*  S */ "", "", "", "", "", "", "", "",
+		/*  T */ "", "", "", "", "", "", "", "",
+		/*  U */ "", "", "", "", "", "", "", "",
+		/*  V */ "", "", "", "", "", "", "", "",
+		/*  W */ "", "", "", "", "", "", "", "",
+		/*  X */ "", "", "", "", "", "PCIE_STNDBY", "", "",
+		/*  Y */ "", "", "", "SYSTEM_ERR_LED", "", "", "", "",
+		/*  Z */ "", "", "", "", "", "", "", "",
+		/* AA */ "FAN_1_LED", "FAN_2_LED", "", "", "", "", "", "",
+		/* AB */ "", "", "", "", "", "", "", "",
+		/* AC */ "", "", "", "", "", "", "", "";
+};
+
+&mac0 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii1_default &pinctrl_mdio1_default>;
+};
+
+&uart5 {
+	status = "okay";
+};
+
+&vhub {
+	status = "okay";
+};
+
+&video {
+	status = "okay";
+	memory-region = <&video_engine_memory>;
+};

-- 
2.52.0


