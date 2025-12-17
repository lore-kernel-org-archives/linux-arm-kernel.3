Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D9CCD6406C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 02:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g+r102hR9zDuFntSAOHLz1qhcLIKv7rvOLb1bWkWV94=; b=2bvvcNk55iwB+CVXJFWKl8XCo2
	RzBV1o5oU1dtal09+r6MJMQN+Dj6AKyOPQNxnIVbm4jX/n1ObDOkUx6T0/fBYFoMZR9IjPEPsnEaK
	qxkvhyuNn97ygIcXPUeQUwc7ZTGgtPEsXExwjgBLN8/ciR8esZpvDPI6Uf4xRXQQCGs2bFSfELvU/
	Ravqi87hE4dpxA1RdVN+rv1yQnoJRgV87+f8AZcjrlumVN9w8k3dbLf7hA190n/rrYXsEYpJrm7td
	uBy+6r6AgK3fBNZxYBhhrYjQCjUpTmlETP+04Un3S/lZzxwiWq+e2GLH3zNkBpL+fw95tan5LoTv1
	wAEONpjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVhUf-000000064IL-05GY;
	Wed, 17 Dec 2025 02:42:25 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVhUa-000000064GE-2R9R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 02:42:22 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7aa2170adf9so4300562b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 18:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765939340; x=1766544140; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g+r102hR9zDuFntSAOHLz1qhcLIKv7rvOLb1bWkWV94=;
        b=Xs+37NDJcVtc3r40AetajXNg85S79LGk/N8sSTRmtmIg4zm9vUD4WP8i+026YQNAu5
         m9QiPJzPBzNDGZu+/G40vc/KVtf6AwlvxfBD+MGfvqiHCUexWdA9WZutOCZX47Xj34Kg
         3TX3VrKZL1IVIMkz8lD5/L3BqMyjA3ig0CaLS/U030DPBBRung3AkNqFY6N9ULnpaY0D
         xh4m6y2k2rpYSntIkw/j+ZwwiFa/hFk1osLtnesDJO9DJOfbLrCNw0tRLNh0uGaLy5KA
         5MbjPbh0xGuPvWfFn1CGqfnV0kUf+Z9n+sOSlkJrSZtNOvL+ASc1iP7mKIcMJKpEHQuO
         ORgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765939340; x=1766544140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g+r102hR9zDuFntSAOHLz1qhcLIKv7rvOLb1bWkWV94=;
        b=HEAE9O0gOQYw9DT7bWiXoIi4u/t4T07V4VPYSGkQPDqnZx7oVW3xHz6+ZInTcELeSC
         ySaXdCTZTK/IKiV7HyqJs6iduzPSn2Q6KRzENuo2mjP/iPi2+JeE52JNZcF3IGO544H2
         ha1/E7EKPVxICC7VAU3L8J9uBceGHNHKFLlKNZW3OMFzExeqGp81UkMkeNONxF/G19s2
         5trP8g8VSOJ5k0wgqJj3ILy+V0wo0x5aZ9Wp1kkzExrQED39GSVhFNrXPllVKVBTcX8c
         iaLLQY6X42idCJbhOnaCkSSFTEG0Ui/LTUb5kj0mMs9CbQN+kzmzayJpDXRoNJUh9zZM
         wqGA==
X-Forwarded-Encrypted: i=1; AJvYcCWdM8bKoOb8LFbTNeRqkoc8HBPvo3gFEUce27oZOXY9eRaMbvN96Zdr/dmI0kEoPx3Eyc+pIQiPcbFk603dxWcK@lists.infradead.org
X-Gm-Message-State: AOJu0YwrEUg3c+wrUqVeuFYPPi7kpLN2SnXn/9r6qYZ6tFPjVqGFzkJg
	+TyF/9J6iW6qiBzsQs4A9Dv9t1VjSiH/IcbpdptIhXZsUUdraUIQyvAo
X-Gm-Gg: AY/fxX4XsRbDwvHsgQ7Tfz/Y+jM+d8MIFteQzCPYzqC1VMce2yLyZhItsjCb3KnZr4j
	ILjcrAIU96uXDiEgr5hCf5dEMHTEt+C1EA+G++vJyiAzftPNYUOPNJ9aARpUY4IPbObQqmY4KNn
	0rdFZCyyN5spV0SY/8dA+K1V+zC91K9Cunc+1iNuTqdWuN9DoPeV7XGwXhUzKkxRBgulDFkzGIZ
	uORUhiVjR/RI+4laCAeSqJRDFQIVKzb3sAfUVryZAwLrKnsmmVEgfoZUrOTR23UsRlMJoB/eWQG
	I0m7pOLu4WoUYpumcjr+RD6qNQfrqNFzLQmtkLoLz2nMi9HyLC1VS7hNXjVgXg7kmoyCMqNuMhs
	+YiW2oQi9e8IH8+wtmujBtYMkAyuXr4JCDMPEPLzN+1K9kk8TTov45KUCxeMsznbgVE4qWOZMl8
	YR+ir81g86wXSLnCVFlhWExb1xRlPUKiNIf3vGJGUXoJ/mcfHRwM0Eb3JOiSn0RjSj5HHUKjvR4
	Nyq5jXxkB/zaQKF1J4JRqmT2A==
X-Google-Smtp-Source: AGHT+IGzXtV/pP5X31xR86Zl+foQoI5ZOx0o6hr3iWfkE+akqdst4RveLg7C30cUfY07vcJgFJiDIQ==
X-Received: by 2002:a05:6a00:6c95:b0:7e8:43f5:bd3f with SMTP id d2e1a72fcca58-7f6692aadf6mr15691763b3a.43.1765939339626;
        Tue, 16 Dec 2025 18:42:19 -0800 (PST)
Received: from cosmo-ubuntu-2404.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7fcb8c29738sm941342b3a.17.2025.12.16.18.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 18:42:19 -0800 (PST)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	cosmo.chou@quantatw.com,
	Cosmo Chou <chou.cosmo@gmail.com>
Subject: [PATCH v2 1/5] ARM: dts: aspeed: bletchley: Use generic node names
Date: Wed, 17 Dec 2025 10:39:34 +0800
Message-ID: <20251217023938.445721-2-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217023938.445721-1-chou.cosmo@gmail.com>
References: <20251217023938.445721-1-chou.cosmo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_184220_649064_A0F989A0 
X-CRM114-Status: UNSURE (   9.75  )
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

Use generic node names to fix dt-schema warnings:
- spi1_gpio: rename to generic "spi" node name
- LED nodes: rename to led-N and move names to label properties
- GPIO key nodes: add "-switch" suffix to node names

Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
---
 .../aspeed/aspeed-bmc-facebook-bletchley.dts  | 77 ++++++++++++-------
 1 file changed, 49 insertions(+), 28 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
index abdb1562115a..9cb01381e482 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
@@ -34,7 +34,7 @@ iio-hwmon {
 			<&adc1 4>, <&adc1 5>, <&adc1 6>, <&adc1 7>;
 	};
 
-	spi1_gpio: spi1-gpio {
+	spi1_gpio: spi {
 		compatible = "spi-gpio";
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -54,7 +54,8 @@ tpm@0 {
 
 	front_gpio_leds {
 		compatible = "gpio-leds";
-		sys_log_id {
+		led-0 {
+			label = "sys_log_id";
 			default-state = "off";
 			gpios = <&front_leds 0 GPIO_ACTIVE_LOW>;
 		};
@@ -62,42 +63,50 @@ sys_log_id {
 
 	fan_gpio_leds {
 		compatible = "gpio-leds";
-		fan0_blue {
+		led-0 {
+			label = "fan0_blue";
 			retain-state-shutdown;
 			default-state = "on";
 			gpios = <&fan_leds 8 GPIO_ACTIVE_HIGH>;
 		};
-		fan1_blue {
+		led-1 {
+			label = "fan1_blue";
 			retain-state-shutdown;
 			default-state = "on";
 			gpios = <&fan_leds 9 GPIO_ACTIVE_HIGH>;
 		};
-		fan2_blue {
+		led-2 {
+			label = "fan2_blue";
 			retain-state-shutdown;
 			default-state = "on";
 			gpios = <&fan_leds 10 GPIO_ACTIVE_HIGH>;
 		};
-		fan3_blue {
+		led-3 {
+			label = "fan3_blue";
 			retain-state-shutdown;
 			default-state = "on";
 			gpios = <&fan_leds 11 GPIO_ACTIVE_HIGH>;
 		};
-		fan0_amber {
+		led-4 {
+			label = "fan0_amber";
 			retain-state-shutdown;
 			default-state = "off";
 			gpios = <&fan_leds 12 GPIO_ACTIVE_HIGH>;
 		};
-		fan1_amber {
+		led-5 {
+			label = "fan1_amber";
 			retain-state-shutdown;
 			default-state = "off";
 			gpios = <&fan_leds 13 GPIO_ACTIVE_HIGH>;
 		};
-		fan2_amber {
+		led-6 {
+			label = "fan2_amber";
 			retain-state-shutdown;
 			default-state = "off";
 			gpios = <&fan_leds 14 GPIO_ACTIVE_HIGH>;
 		};
-		fan3_amber {
+		led-7 {
+			label = "fan3_amber";
 			retain-state-shutdown;
 			default-state = "off";
 			gpios = <&fan_leds 15 GPIO_ACTIVE_HIGH>;
@@ -106,12 +115,14 @@ fan3_amber {
 
 	sled1_gpio_leds {
 		compatible = "gpio-leds";
-		sled1_amber {
+		led-0 {
+			label = "sled1_amber";
 			retain-state-shutdown;
 			default-state = "keep";
 			gpios = <&sled1_leds 0 GPIO_ACTIVE_LOW>;
 		};
-		sled1_blue {
+		led-1 {
+			label = "sled1_blue";
 			retain-state-shutdown;
 			default-state = "keep";
 			gpios = <&sled1_leds 1 GPIO_ACTIVE_LOW>;
@@ -120,12 +131,14 @@ sled1_blue {
 
 	sled2_gpio_leds {
 		compatible = "gpio-leds";
-		sled2_amber {
+		led-0 {
+			label = "sled2_amber";
 			retain-state-shutdown;
 			default-state = "keep";
 			gpios = <&sled2_leds 0 GPIO_ACTIVE_LOW>;
 		};
-		sled2_blue {
+		led-1 {
+			label = "sled2_blue";
 			retain-state-shutdown;
 			default-state = "keep";
 			gpios = <&sled2_leds 1 GPIO_ACTIVE_LOW>;
@@ -134,12 +147,14 @@ sled2_blue {
 
 	sled3_gpio_leds {
 		compatible = "gpio-leds";
-		sled3_amber {
+		led-0 {
+			label = "sled3_amber";
 			retain-state-shutdown;
 			default-state = "keep";
 			gpios = <&sled3_leds 0 GPIO_ACTIVE_LOW>;
 		};
-		sled3_blue {
+		led-1 {
+			label = "sled3_blue";
 			retain-state-shutdown;
 			default-state = "keep";
 			gpios = <&sled3_leds 1 GPIO_ACTIVE_LOW>;
@@ -148,12 +163,14 @@ sled3_blue {
 
 	sled4_gpio_leds {
 		compatible = "gpio-leds";
-		sled4_amber {
+		led-0 {
+			label = "sled4_amber";
 			retain-state-shutdown;
 			default-state = "keep";
 			gpios = <&sled4_leds 0 GPIO_ACTIVE_LOW>;
 		};
-		sled4_blue {
+		led-1 {
+			label = "sled4_blue";
 			retain-state-shutdown;
 			default-state = "keep";
 			gpios = <&sled4_leds 1 GPIO_ACTIVE_LOW>;
@@ -162,12 +179,14 @@ sled4_blue {
 
 	sled5_gpio_leds {
 		compatible = "gpio-leds";
-		sled5_amber {
+		led-0 {
+			label = "sled5_amber";
 			retain-state-shutdown;
 			default-state = "keep";
 			gpios = <&sled5_leds 0 GPIO_ACTIVE_LOW>;
 		};
-		sled5_blue {
+		led-1 {
+			label = "sled5_blue";
 			retain-state-shutdown;
 			default-state = "keep";
 			gpios = <&sled5_leds 1 GPIO_ACTIVE_LOW>;
@@ -176,12 +195,14 @@ sled5_blue {
 
 	sled6_gpio_leds {
 		compatible = "gpio-leds";
-		sled6_amber {
+		led-0 {
+			label = "sled6_amber";
 			retain-state-shutdown;
 			default-state = "keep";
 			gpios = <&sled6_leds 0 GPIO_ACTIVE_LOW>;
 		};
-		sled6_blue {
+		led-1 {
+			label = "sled6_blue";
 			retain-state-shutdown;
 			default-state = "keep";
 			gpios = <&sled6_leds 1 GPIO_ACTIVE_LOW>;
@@ -191,32 +212,32 @@ sled6_blue {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		presence-sled1 {
+		presence-sled1-switch {
 			label = "presence-sled1";
 			gpios = <&gpio0 ASPEED_GPIO(H, 2) GPIO_ACTIVE_LOW>;
 			linux,code = <ASPEED_GPIO(H, 2)>;
 		};
-		presence-sled2 {
+		presence-sled2-switch {
 			label = "presence-sled2";
 			gpios = <&gpio0 ASPEED_GPIO(H, 3) GPIO_ACTIVE_LOW>;
 			linux,code = <ASPEED_GPIO(H, 3)>;
 		};
-		presence-sled3 {
+		presence-sled3-switch {
 			label = "presence-sled3";
 			gpios = <&gpio0 ASPEED_GPIO(H, 4) GPIO_ACTIVE_LOW>;
 			linux,code = <ASPEED_GPIO(H, 4)>;
 		};
-		presence-sled4 {
+		presence-sled4-switch {
 			label = "presence-sled4";
 			gpios = <&gpio0 ASPEED_GPIO(H, 5) GPIO_ACTIVE_LOW>;
 			linux,code = <ASPEED_GPIO(H, 5)>;
 		};
-		presence-sled5 {
+		presence-sled5-switch {
 			label = "presence-sled5";
 			gpios = <&gpio0 ASPEED_GPIO(H, 6) GPIO_ACTIVE_LOW>;
 			linux,code = <ASPEED_GPIO(H, 6)>;
 		};
-		presence-sled6 {
+		presence-sled6-switch {
 			label = "presence-sled6";
 			gpios = <&gpio0 ASPEED_GPIO(H, 7) GPIO_ACTIVE_LOW>;
 			linux,code = <ASPEED_GPIO(H, 7)>;
-- 
2.43.0


