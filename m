Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 272F1CA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 11:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FdoTR8foKMxX1L9+9/UOLyAvzqRk88KoY3avVxVRQJw=; b=RINzNPa4zjioC1RGx7QB+xAkPt
	5EBRqh51no75z6tIU0B4K9y2xA+wb8wi+3l/U84ZpITrIC42J3Es3h/25Je7jzDtSUge/7DUlGkgJ
	ZKCf23g192F7ax65I+kxaZ+P7NBhPbyrkpKh4oYwyj/7jj7qbVaPbJrX5JfFRxjZCb0Ivow9DjL3g
	7jRnwnkCE5f3j6k2UFrGYK0WaTWIxrgZjXuTB+1ktwefSUrTM7xEwb/FFKkYfXtmgIOXDnOipfDwo
	KsQz95rfXQFrqpKb2UW35aMwfPzSE4INbh4vQ1EJdhr9Smd1Lpe5Cvn6bdR8mTcCU1l6QHPp51OcP
	S6jI8bJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBsLE-00000005qTv-15zS;
	Wed, 30 Sep 2026 11:19:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBsL9-00000005qRg-1Oo6
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 11:19:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=FdoTR8foKMxX1L9+9/UOLyAvzqRk88KoY3avVxVRQJw=; b=XIhLdpJh0YLwUgkFUijRkTczgZ
	6Qond59i8J2YpSwdvBodOeNspNvsN5pG1f5vVLO9hdahHQ3am3LzNCxS4eh3UuE6UhRxlSP2IC5K/
	g8vqA/G9yusLadYK+x/vzYJ/YKTnYrgU2I4quxfPomUYGsV9xmToMmNV7xSvXKbztNlhNZPij57lL
	Ul/R/rbOdz+QpZv/pBqIQQ/2BBCUuFi1BmgRkW410bMSMCS4vUX1vlUOkfn3eHU+GY8Q8ikL/zkj8
	z/cm8tgWMdo2WWW0iFRo6dNJhXMhtbruf7cflK36U8jzd1VB3oM8iyIXiiBkRZo6SP0Qf+tv+vnTi
	RADsUybA==;
Received: from mail-pz2-x0d.google.com ([2607:f8b0:4864:3b::d])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBsL6-00000003hsb-0mjO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 11:19:10 +0000
Received: by mail-pz2-x0d.google.com with SMTP id d2e1a72fcca58-8692a8568e9so2258374b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 04:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790767146; x=1791371946; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FdoTR8foKMxX1L9+9/UOLyAvzqRk88KoY3avVxVRQJw=;
        b=Dv4fw9+bLp0bPYdfv6Vb1cAHV6BI7ShZeCpL5b1PFaHKKH3cdZ/y6cYIEHwB0UKuSK
         xTxDxVv2VUulJOdMK2uY3VSPkmGEM0VTIZOGU4KLngk+fqnf0KZi4df6tc9GBQUjGxFl
         SUqaVwRPJU5aieAP+OCmQ10kSGyvi3wI28Jw9rcVVQ1Bqbn0JdJJybXP7O/XHZkqzgwL
         JqolHmXCz+W/7OPFZKPcpfuDJmEA6lm5W9+PSMl2pCpSZhdYOaQjyXhP1ifAmYpIhShu
         5d6sw2dxTa2Q4UHOMkBvpECEC0BVnBTyHdNVfnDLUHKwjD6eqYmiqaZ4+NQNC0+bYVd6
         etOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790767146; x=1791371946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FdoTR8foKMxX1L9+9/UOLyAvzqRk88KoY3avVxVRQJw=;
        b=2Te0iuQ8UTuoSQVXs+sWtwUY4qC7Wvs6p2W5+vyvUD0LGyFQf3WojzBWd1ActSBi4B
         YvfMqAfgwsdnXTlf7imcM9A6gXB5U8Qx8EAOkoEEwgVMWpXt4/0c41cfbujfrWqxyHvT
         3QAWbOd6cJPHGIXY1MJN07rwzRP+LBfsO0QQnO3QDUSj9yNzAt87zidNmgeLWRZkzCJ3
         9jTgPfYjdFrDYC5ecmmziYX5ND4MVMzo/eV/5Uo88azZukGYRPrYW2I1V/o2+jjJVhq7
         RZYLn8qO8u2UjPInN3LHZblsZneGzN0nh1A045GtcV5iClKm8aRZOJiMlfE0cUaj7L14
         HJuA==
X-Forwarded-Encrypted: i=1; AKwUvByVExYbTGrVPl0ym/D7hbYHA0WW22RxRhPcPf2AaCnb5F8jVs6QUmS3dcdODCBKmjMQzXaBDb0PiRzj71f8TgAY@lists.infradead.org
X-Gm-Message-State: AFuF++nNKSTadzAul9/rQwcsTG9snjYCqX+8kYmVcp84Qt6yeSMtlHYm
	rCn3N+dr4Vd+wxFl52+0FQYxMAcyIw08i66mup/n2Nit8gk63EUhgTH9
X-Gm-Gg: AYBFou1RzEHCGVR0Hr4SgiDERiATcipBdL6Qh3xMFVZG5arIhoXChmQqqUD2uwNp+V9
	3l8I+6cNQuhc8oqd28ccFySlhLqIKJwFZSPBC0dHU8B4xhk2iQqBp5RVQ9bORpe6oHkEHnp2Wre
	0jlSnV//8yYkNT5YeUsE4H+QzkHKFvpPgLvbEHFGVf98SihmSt1+C9CtboJu8qQovbVdP/nxMRm
	R62182/2tfYRPDllkjH/x3ATBpQSv9Mj0NEUDJNm5ZtCC/5c6rQNtzcK2/0bR6xPUgX0BWdxaiK
	xVcnhfbkzFFAeS5uH7Qo3ohqxTfkoNBf+Ke+V02s0YrSBsiZf3S1zKtEwSoYLOgXQ3246MzxeLh
	I6/GxZVvh1lB1VhZyVrex9/tfHT+kb6KLDXz4+qudftCwnZKC94e6Xk+K+4ZKaow4E29roHHqqr
	E/aB7roJk/R13Q395kdzPXwZi1vnLwXEhFRfI3QG0waLbBah10hsLzD66r8EDykgXCz1Hn7LJXO
	MfvQ6UfPTJw/diwYvg6FUXJkVgeahBE5Z+RO7gPxpz3
X-Received: by 2002:a05:6a00:430a:b0:886:29a4:a00 with SMTP id d2e1a72fcca58-8874b357ec8mr806821b3a.47.1790767145766;
        Wed, 30 Sep 2026 04:19:05 -0700 (PDT)
Received: from cosmo-ubuntu-2404.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-887253992a9sm650257b3a.17.2026.09.30.04.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:19:05 -0700 (PDT)
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
Subject: [PATCH v3 2/4] ARM: dts: aspeed: bletchley: Fix style warnings
Date: Wed, 30 Sep 2026 19:18:11 +0800
Message-ID: <20260930111813.52396-3-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930111813.52396-1-chou.cosmo@gmail.com>
References: <20260930111813.52396-1-chou.cosmo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_121908_703010_9824D21F 
X-CRM114-Status: GOOD (  13.82  )
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

Refactor the device tree to resolve all strict mode warnings reported
by scripts/dtc/dt-check-style.

Changes include:
- Sorting properties into their canonical order.
- Reordering child nodes alphabetically.
- Aligning multi-line continuation strings.
- Inserting required blank lines before child nodes and status
  properties.
- Removing unused node labels to resolve unused-labels warnings.
- Wrap lines exceeding 80 columns.

No functional changes.

Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
---
 .../aspeed/aspeed-bmc-facebook-bletchley.dts  | 538 ++++++++++--------
 1 file changed, 297 insertions(+), 241 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
index b022bdd02c1e..4bc436ef3562 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
@@ -10,8 +10,8 @@
 #include <dt-bindings/i2c/i2c.h>
 
 / {
-	model = "Facebook Bletchley BMC";
 	compatible = "facebook,bletchley-bmc", "aspeed,ast2600";
+	model = "Facebook Bletchley BMC";
 
 	aliases {
 		serial4 = &uart5;
@@ -26,325 +26,357 @@ memory@80000000 {
 		reg = <0x80000000 0x80000000>;
 	};
 
-	iio-hwmon {
-		compatible = "iio-hwmon";
-		io-channels = <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
-			<&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
-			<&adc1 0>, <&adc1 1>, <&adc1 2>, <&adc1 3>,
-			<&adc1 4>, <&adc1 5>, <&adc1 6>, <&adc1 7>;
-	};
-
-	spi1_gpio: spi {
-		compatible = "spi-gpio";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		sck-gpios = <&gpio0 ASPEED_GPIO(Z, 3) GPIO_ACTIVE_HIGH>;
-		mosi-gpios = <&gpio0 ASPEED_GPIO(Z, 4) GPIO_ACTIVE_HIGH>;
-		miso-gpios = <&gpio0 ASPEED_GPIO(Z, 5) GPIO_ACTIVE_HIGH>;
-		num-chipselects = <1>;
-		cs-gpios = <&gpio0 ASPEED_GPIO(Z, 0) GPIO_ACTIVE_LOW>;
-
-		tpm@0 {
-			compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
-			spi-max-frequency = <33000000>;
-			reg = <0>;
-		};
-	};
-
-	front_gpio_leds {
-		compatible = "gpio-leds";
-		led-0 {
-			label = "sys_log_id";
-			default-state = "off";
-			gpios = <&front_leds 0 GPIO_ACTIVE_LOW>;
-		};
-	};
-
 	fan_gpio_leds {
 		compatible = "gpio-leds";
+
 		led-0 {
-			label = "fan0_blue";
-			retain-state-shutdown;
 			default-state = "on";
 			gpios = <&fan_leds 8 GPIO_ACTIVE_HIGH>;
+			label = "fan0_blue";
+			retain-state-shutdown;
 		};
+
 		led-1 {
-			label = "fan1_blue";
-			retain-state-shutdown;
 			default-state = "on";
 			gpios = <&fan_leds 9 GPIO_ACTIVE_HIGH>;
+			label = "fan1_blue";
+			retain-state-shutdown;
 		};
+
 		led-2 {
-			label = "fan2_blue";
-			retain-state-shutdown;
 			default-state = "on";
 			gpios = <&fan_leds 10 GPIO_ACTIVE_HIGH>;
+			label = "fan2_blue";
+			retain-state-shutdown;
 		};
+
 		led-3 {
-			label = "fan3_blue";
-			retain-state-shutdown;
 			default-state = "on";
 			gpios = <&fan_leds 11 GPIO_ACTIVE_HIGH>;
+			label = "fan3_blue";
+			retain-state-shutdown;
 		};
+
 		led-4 {
-			label = "fan0_amber";
-			retain-state-shutdown;
 			default-state = "off";
 			gpios = <&fan_leds 12 GPIO_ACTIVE_HIGH>;
+			label = "fan0_amber";
+			retain-state-shutdown;
 		};
+
 		led-5 {
-			label = "fan1_amber";
-			retain-state-shutdown;
 			default-state = "off";
 			gpios = <&fan_leds 13 GPIO_ACTIVE_HIGH>;
+			label = "fan1_amber";
+			retain-state-shutdown;
 		};
+
 		led-6 {
-			label = "fan2_amber";
-			retain-state-shutdown;
 			default-state = "off";
 			gpios = <&fan_leds 14 GPIO_ACTIVE_HIGH>;
+			label = "fan2_amber";
+			retain-state-shutdown;
 		};
+
 		led-7 {
+			default-state = "off";
+			gpios = <&fan_leds 15 GPIO_ACTIVE_HIGH>;
 			label = "fan3_amber";
 			retain-state-shutdown;
+		};
+	};
+
+	front_gpio_leds {
+		compatible = "gpio-leds";
+
+		led-0 {
 			default-state = "off";
-			gpios = <&fan_leds 15 GPIO_ACTIVE_HIGH>;
+			gpios = <&front_leds 0 GPIO_ACTIVE_LOW>;
+			label = "sys_log_id";
 		};
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		presence-sled1-switch {
+			gpios = <&gpio0 ASPEED_GPIO(H, 2) GPIO_ACTIVE_LOW>;
+			label = "presence-sled1";
+			linux,code = <ASPEED_GPIO(H, 2)>;
+		};
+
+		presence-sled2-switch {
+			gpios = <&gpio0 ASPEED_GPIO(H, 3) GPIO_ACTIVE_LOW>;
+			label = "presence-sled2";
+			linux,code = <ASPEED_GPIO(H, 3)>;
+		};
+
+		presence-sled3-switch {
+			gpios = <&gpio0 ASPEED_GPIO(H, 4) GPIO_ACTIVE_LOW>;
+			label = "presence-sled3";
+			linux,code = <ASPEED_GPIO(H, 4)>;
+		};
+
+		presence-sled4-switch {
+			gpios = <&gpio0 ASPEED_GPIO(H, 5) GPIO_ACTIVE_LOW>;
+			label = "presence-sled4";
+			linux,code = <ASPEED_GPIO(H, 5)>;
+		};
+
+		presence-sled5-switch {
+			gpios = <&gpio0 ASPEED_GPIO(H, 6) GPIO_ACTIVE_LOW>;
+			label = "presence-sled5";
+			linux,code = <ASPEED_GPIO(H, 6)>;
+		};
+
+		presence-sled6-switch {
+			gpios = <&gpio0 ASPEED_GPIO(H, 7) GPIO_ACTIVE_LOW>;
+			label = "presence-sled6";
+			linux,code = <ASPEED_GPIO(H, 7)>;
+		};
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
 	sled1_gpio_leds {
 		compatible = "gpio-leds";
+
 		led-0 {
-			label = "sled1_amber";
-			retain-state-shutdown;
 			default-state = "keep";
 			gpios = <&sled1_leds 0 GPIO_ACTIVE_LOW>;
+			label = "sled1_amber";
+			retain-state-shutdown;
 		};
+
 		led-1 {
-			label = "sled1_blue";
-			retain-state-shutdown;
 			default-state = "keep";
 			gpios = <&sled1_leds 1 GPIO_ACTIVE_LOW>;
+			label = "sled1_blue";
+			retain-state-shutdown;
 		};
 	};
 
 	sled2_gpio_leds {
 		compatible = "gpio-leds";
+
 		led-0 {
-			label = "sled2_amber";
-			retain-state-shutdown;
 			default-state = "keep";
 			gpios = <&sled2_leds 0 GPIO_ACTIVE_LOW>;
+			label = "sled2_amber";
+			retain-state-shutdown;
 		};
+
 		led-1 {
-			label = "sled2_blue";
-			retain-state-shutdown;
 			default-state = "keep";
 			gpios = <&sled2_leds 1 GPIO_ACTIVE_LOW>;
+			label = "sled2_blue";
+			retain-state-shutdown;
 		};
 	};
 
 	sled3_gpio_leds {
 		compatible = "gpio-leds";
+
 		led-0 {
-			label = "sled3_amber";
-			retain-state-shutdown;
 			default-state = "keep";
 			gpios = <&sled3_leds 0 GPIO_ACTIVE_LOW>;
+			label = "sled3_amber";
+			retain-state-shutdown;
 		};
+
 		led-1 {
-			label = "sled3_blue";
-			retain-state-shutdown;
 			default-state = "keep";
 			gpios = <&sled3_leds 1 GPIO_ACTIVE_LOW>;
+			label = "sled3_blue";
+			retain-state-shutdown;
 		};
 	};
 
 	sled4_gpio_leds {
 		compatible = "gpio-leds";
+
 		led-0 {
-			label = "sled4_amber";
-			retain-state-shutdown;
 			default-state = "keep";
 			gpios = <&sled4_leds 0 GPIO_ACTIVE_LOW>;
+			label = "sled4_amber";
+			retain-state-shutdown;
 		};
+
 		led-1 {
-			label = "sled4_blue";
-			retain-state-shutdown;
 			default-state = "keep";
 			gpios = <&sled4_leds 1 GPIO_ACTIVE_LOW>;
+			label = "sled4_blue";
+			retain-state-shutdown;
 		};
 	};
 
 	sled5_gpio_leds {
 		compatible = "gpio-leds";
+
 		led-0 {
-			label = "sled5_amber";
-			retain-state-shutdown;
 			default-state = "keep";
 			gpios = <&sled5_leds 0 GPIO_ACTIVE_LOW>;
+			label = "sled5_amber";
+			retain-state-shutdown;
 		};
+
 		led-1 {
-			label = "sled5_blue";
-			retain-state-shutdown;
 			default-state = "keep";
 			gpios = <&sled5_leds 1 GPIO_ACTIVE_LOW>;
+			label = "sled5_blue";
+			retain-state-shutdown;
 		};
 	};
 
 	sled6_gpio_leds {
 		compatible = "gpio-leds";
+
 		led-0 {
-			label = "sled6_amber";
-			retain-state-shutdown;
 			default-state = "keep";
 			gpios = <&sled6_leds 0 GPIO_ACTIVE_LOW>;
+			label = "sled6_amber";
+			retain-state-shutdown;
 		};
+
 		led-1 {
-			label = "sled6_blue";
-			retain-state-shutdown;
 			default-state = "keep";
 			gpios = <&sled6_leds 1 GPIO_ACTIVE_LOW>;
+			label = "sled6_blue";
+			retain-state-shutdown;
 		};
 	};
 
-	gpio-keys {
-		compatible = "gpio-keys";
+	spi {
+		compatible = "spi-gpio";
+		#address-cells = <1>;
+		cs-gpios = <&gpio0 ASPEED_GPIO(Z, 0) GPIO_ACTIVE_LOW>;
+		miso-gpios = <&gpio0 ASPEED_GPIO(Z, 5) GPIO_ACTIVE_HIGH>;
+		mosi-gpios = <&gpio0 ASPEED_GPIO(Z, 4) GPIO_ACTIVE_HIGH>;
+		num-chipselects = <1>;
+		sck-gpios = <&gpio0 ASPEED_GPIO(Z, 3) GPIO_ACTIVE_HIGH>;
+		#size-cells = <0>;
 
-		presence-sled1-switch {
-			label = "presence-sled1";
-			gpios = <&gpio0 ASPEED_GPIO(H, 2) GPIO_ACTIVE_LOW>;
-			linux,code = <ASPEED_GPIO(H, 2)>;
-		};
-		presence-sled2-switch {
-			label = "presence-sled2";
-			gpios = <&gpio0 ASPEED_GPIO(H, 3) GPIO_ACTIVE_LOW>;
-			linux,code = <ASPEED_GPIO(H, 3)>;
-		};
-		presence-sled3-switch {
-			label = "presence-sled3";
-			gpios = <&gpio0 ASPEED_GPIO(H, 4) GPIO_ACTIVE_LOW>;
-			linux,code = <ASPEED_GPIO(H, 4)>;
-		};
-		presence-sled4-switch {
-			label = "presence-sled4";
-			gpios = <&gpio0 ASPEED_GPIO(H, 5) GPIO_ACTIVE_LOW>;
-			linux,code = <ASPEED_GPIO(H, 5)>;
-		};
-		presence-sled5-switch {
-			label = "presence-sled5";
-			gpios = <&gpio0 ASPEED_GPIO(H, 6) GPIO_ACTIVE_LOW>;
-			linux,code = <ASPEED_GPIO(H, 6)>;
-		};
-		presence-sled6-switch {
-			label = "presence-sled6";
-			gpios = <&gpio0 ASPEED_GPIO(H, 7) GPIO_ACTIVE_LOW>;
-			linux,code = <ASPEED_GPIO(H, 7)>;
+		tpm@0 {
+			compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
+			reg = <0>;
+			spi-max-frequency = <33000000>;
 		};
 	};
 
 	vbus_sled1: vbus_sled1 {
 		compatible = "regulator-fixed";
-		regulator-name = "vbus_sled1";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		gpio = <&sled1_ioexp 1 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
+		gpio = <&sled1_ioexp 1 GPIO_ACTIVE_HIGH>;
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		regulator-name = "vbus_sled1";
 	};
 
 	vbus_sled2: vbus_sled2 {
 		compatible = "regulator-fixed";
-		regulator-name = "vbus_sled2";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		gpio = <&sled2_ioexp 1 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
+		gpio = <&sled2_ioexp 1 GPIO_ACTIVE_HIGH>;
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		regulator-name = "vbus_sled2";
 	};
 
 	vbus_sled3: vbus_sled3 {
 		compatible = "regulator-fixed";
-		regulator-name = "vbus_sled3";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		gpio = <&sled3_ioexp 1 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
+		gpio = <&sled3_ioexp 1 GPIO_ACTIVE_HIGH>;
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		regulator-name = "vbus_sled3";
 	};
 
 	vbus_sled4: vbus_sled4 {
 		compatible = "regulator-fixed";
-		regulator-name = "vbus_sled4";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		gpio = <&sled4_ioexp 1 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
+		gpio = <&sled4_ioexp 1 GPIO_ACTIVE_HIGH>;
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		regulator-name = "vbus_sled4";
 	};
 
 	vbus_sled5: vbus_sled5 {
 		compatible = "regulator-fixed";
-		regulator-name = "vbus_sled5";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		gpio = <&sled5_ioexp 1 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
+		gpio = <&sled5_ioexp 1 GPIO_ACTIVE_HIGH>;
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		regulator-name = "vbus_sled5";
 	};
 
 	vbus_sled6: vbus_sled6 {
 		compatible = "regulator-fixed";
-		regulator-name = "vbus_sled6";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		gpio = <&sled6_ioexp 1 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
+		gpio = <&sled6_ioexp 1 GPIO_ACTIVE_HIGH>;
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		regulator-name = "vbus_sled6";
 	};
 };
 
 &mac2 {
-	status = "okay";
 	phy-mode = "rgmii";
-	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rgmii3_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
 
 	fixed-link {
-		speed = <1000>;
 		full-duplex;
+		speed = <1000>;
 	};
 };
 
 &fmc {
 	status = "okay";
+
 	flash@0 {
-		status = "okay";
-		m25p,fast-read;
 		label = "bmc";
 		spi-max-frequency = <50000000>;
+		m25p,fast-read;
+
+		status = "okay";
 #include "openbmc-flash-layout-128.dtsi"
 	};
+
 	flash@1 {
-		status = "okay";
-		m25p,fast-read;
 		label = "alt-bmc";
 		spi-max-frequency = <50000000>;
+		m25p,fast-read;
+
+		status = "okay";
 	};
 };
 
 &spi2 {
-	status = "okay";
-	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_spi2_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
 
 	flash@0 {
-		status = "okay";
-		m25p,fast-read;
 		label = "pnor";
 		spi-max-frequency = <50000000>;
+		m25p,fast-read;
+
+		status = "okay";
 	};
 };
 
 &i2c0 {
 	status = "okay";
 
-	sled1_fusb302: typec-portc@22 {
+	typec-portc@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 
@@ -354,13 +386,15 @@ sled1_fusb302: typec-portc@22 {
 
 		connector {
 			compatible = "usb-c-connector";
+			data-role = "dual";
 			label = "USB-C";
+			op-sink-microwatt = <10000000>;
 			pd-revision = /bits/ 8 <0x2 0x0 0x1 0x20>;
 			power-role = "dual";
-			data-role = "dual";
-			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
-			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
-			op-sink-microwatt = <10000000>;
+			sink-pdos =
+				<PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			source-pdos =
+				<PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
 		};
 	};
 
@@ -369,11 +403,11 @@ mp5023@40 {
 		reg = <0x40>;
 	};
 
-	sled1_ioexp41: pca9536@41 {
+	pca9536@41 {
 		compatible = "nxp,pca9536";
 		reg = <0x41>;
-		gpio-controller;
 		#gpio-cells = <2>;
+		gpio-controller;
 
 		gpio-line-names =
 		"SLED1_SWD_MUX", "SLED1_XRES_SWD_N",
@@ -400,38 +434,39 @@ sled1_leds: pca9552@67 {
 		compatible = "nxp,pca9552";
 		reg = <0x67>;
 		#address-cells = <1>;
-		#size-cells = <0>;
-		gpio-controller;
 		#gpio-cells = <2>;
+		gpio-controller;
 
 		gpio-line-names =
 		"led-sled1-amber","led-sled1-blue","SLED1_RST_IOEXP","SLED1_MD_REF_PWM",
 		"","","","",
 		"","","","",
 		"","","","";
+
+		#size-cells = <0>;
 	};
 
 	sled1_ioexp: pca9539@76 {
 		compatible = "nxp,pca9539";
 		reg = <0x76>;
-		gpio-controller;
 		#gpio-cells = <2>;
-
-		interrupt-parent = <&gpio0>;
-		interrupts = <ASPEED_GPIO(M, 0) IRQ_TYPE_LEVEL_LOW>;
+		gpio-controller;
 
 		gpio-line-names =
 		"SLED1_MS_DETECT1","SLED1_VBUS_BMC_EN","SLED1_INA230_ALERT","SLED1_P12V_STBY_ALERT",
 		"SLED1_SSD_ALERT","SLED1_MS_DETECT0","SLED1_RST_CCG5","SLED1_FUSB302_INT",
 		"SLED1_MD_STBY_RESET","SLED1_MD_IOEXP_EN_FAULT","SLED1_MD_DIR","SLED1_MD_DECAY",
 		"SLED1_MD_MODE1","SLED1_MD_MODE2","SLED1_MD_MODE3","power-host1";
+
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(M, 0) IRQ_TYPE_LEVEL_LOW>;
 	};
 };
 
 &i2c1 {
 	status = "okay";
 
-	sled2_fusb302: typec-portc@22 {
+	typec-portc@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 
@@ -441,13 +476,15 @@ sled2_fusb302: typec-portc@22 {
 
 		connector {
 			compatible = "usb-c-connector";
+			data-role = "dual";
 			label = "USB-C";
+			op-sink-microwatt = <10000000>;
 			pd-revision = /bits/ 8 <0x2 0x0 0x1 0x20>;
 			power-role = "dual";
-			data-role = "dual";
-			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
-			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
-			op-sink-microwatt = <10000000>;
+			sink-pdos =
+				<PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			source-pdos =
+				<PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
 		};
 	};
 
@@ -456,11 +493,11 @@ mp5023@40 {
 		reg = <0x40>;
 	};
 
-	sled2_ioexp41: pca9536@41 {
+	pca9536@41 {
 		compatible = "nxp,pca9536";
 		reg = <0x41>;
-		gpio-controller;
 		#gpio-cells = <2>;
+		gpio-controller;
 
 		gpio-line-names =
 		"SLED2_SWD_MUX", "SLED2_XRES_SWD_N",
@@ -487,38 +524,39 @@ sled2_leds: pca9552@67 {
 		compatible = "nxp,pca9552";
 		reg = <0x67>;
 		#address-cells = <1>;
-		#size-cells = <0>;
-		gpio-controller;
 		#gpio-cells = <2>;
+		gpio-controller;
 
 		gpio-line-names =
 		"led-sled2-amber","led-sled2-blue","SLED2_RST_IOEXP","SLED2_MD_REF_PWM",
 		"","","","",
 		"","","","",
 		"","","","";
+
+		#size-cells = <0>;
 	};
 
 	sled2_ioexp: pca9539@76 {
 		compatible = "nxp,pca9539";
 		reg = <0x76>;
-		gpio-controller;
 		#gpio-cells = <2>;
-
-		interrupt-parent = <&gpio0>;
-		interrupts = <ASPEED_GPIO(M, 1) IRQ_TYPE_LEVEL_LOW>;
+		gpio-controller;
 
 		gpio-line-names =
 		"SLED2_MS_DETECT1","SLED2_VBUS_BMC_EN","SLED2_INA230_ALERT","SLED2_P12V_STBY_ALERT",
 		"SLED2_SSD_ALERT","SLED2_MS_DETECT0","SLED2_RST_CCG5","SLED2_FUSB302_INT",
 		"SLED2_MD_STBY_RESET","SLED2_MD_IOEXP_EN_FAULT","SLED2_MD_DIR","SLED2_MD_DECAY",
 		"SLED2_MD_MODE1","SLED2_MD_MODE2","SLED2_MD_MODE3","power-host2";
+
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(M, 1) IRQ_TYPE_LEVEL_LOW>;
 	};
 };
 
 &i2c2 {
 	status = "okay";
 
-	sled3_fusb302: typec-portc@22 {
+	typec-portc@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 
@@ -528,13 +566,15 @@ sled3_fusb302: typec-portc@22 {
 
 		connector {
 			compatible = "usb-c-connector";
+			data-role = "dual";
 			label = "USB-C";
+			op-sink-microwatt = <10000000>;
 			pd-revision = /bits/ 8 <0x2 0x0 0x1 0x20>;
 			power-role = "dual";
-			data-role = "dual";
-			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
-			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
-			op-sink-microwatt = <10000000>;
+			sink-pdos =
+				<PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			source-pdos =
+				<PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
 		};
 	};
 
@@ -543,11 +583,11 @@ mp5023@40 {
 		reg = <0x40>;
 	};
 
-	sled3_ioexp41: pca9536@41 {
+	pca9536@41 {
 		compatible = "nxp,pca9536";
 		reg = <0x41>;
-		gpio-controller;
 		#gpio-cells = <2>;
+		gpio-controller;
 
 		gpio-line-names =
 		"SLED3_SWD_MUX", "SLED3_XRES_SWD_N",
@@ -574,38 +614,39 @@ sled3_leds: pca9552@67 {
 		compatible = "nxp,pca9552";
 		reg = <0x67>;
 		#address-cells = <1>;
-		#size-cells = <0>;
-		gpio-controller;
 		#gpio-cells = <2>;
+		gpio-controller;
 
 		gpio-line-names =
 		"led-sled3-amber","led-sled3-blue","SLED3_RST_IOEXP","SLED3_MD_REF_PWM",
 		"","","","",
 		"","","","",
 		"","","","";
+
+		#size-cells = <0>;
 	};
 
 	sled3_ioexp: pca9539@76 {
 		compatible = "nxp,pca9539";
 		reg = <0x76>;
-		gpio-controller;
 		#gpio-cells = <2>;
-
-		interrupt-parent = <&gpio0>;
-		interrupts = <ASPEED_GPIO(M, 2) IRQ_TYPE_LEVEL_LOW>;
+		gpio-controller;
 
 		gpio-line-names =
 		"SLED3_MS_DETECT1","SLED3_VBUS_BMC_EN","SLED3_INA230_ALERT","SLED3_P12V_STBY_ALERT",
 		"SLED3_SSD_ALERT","SLED3_MS_DETECT0","SLED3_RST_CCG5","SLED3_FUSB302_INT",
 		"SLED3_MD_STBY_RESET","SLED3_MD_IOEXP_EN_FAULT","SLED3_MD_DIR","SLED3_MD_DECAY",
 		"SLED3_MD_MODE1","SLED3_MD_MODE2","SLED3_MD_MODE3","power-host3";
+
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(M, 2) IRQ_TYPE_LEVEL_LOW>;
 	};
 };
 
 &i2c3 {
 	status = "okay";
 
-	sled4_fusb302: typec-portc@22 {
+	typec-portc@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 
@@ -615,13 +656,15 @@ sled4_fusb302: typec-portc@22 {
 
 		connector {
 			compatible = "usb-c-connector";
+			data-role = "dual";
 			label = "USB-C";
+			op-sink-microwatt = <10000000>;
 			pd-revision = /bits/ 8 <0x2 0x0 0x1 0x20>;
 			power-role = "dual";
-			data-role = "dual";
-			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
-			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
-			op-sink-microwatt = <10000000>;
+			sink-pdos =
+				<PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			source-pdos =
+				<PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
 		};
 	};
 
@@ -630,11 +673,11 @@ mp5023@40 {
 		reg = <0x40>;
 	};
 
-	sled4_ioexp41: pca9536@41 {
+	pca9536@41 {
 		compatible = "nxp,pca9536";
 		reg = <0x41>;
-		gpio-controller;
 		#gpio-cells = <2>;
+		gpio-controller;
 
 		gpio-line-names =
 		"SLED4_SWD_MUX", "SLED4_XRES_SWD_N",
@@ -661,38 +704,39 @@ sled4_leds: pca9552@67 {
 		compatible = "nxp,pca9552";
 		reg = <0x67>;
 		#address-cells = <1>;
-		#size-cells = <0>;
-		gpio-controller;
 		#gpio-cells = <2>;
+		gpio-controller;
 
 		gpio-line-names =
 		"led-sled4-amber","led-sled4-blue","SLED4_RST_IOEXP","SLED4_MD_REF_PWM",
 		"","","","",
 		"","","","",
 		"","","","";
+
+		#size-cells = <0>;
 	};
 
 	sled4_ioexp: pca9539@76 {
 		compatible = "nxp,pca9539";
 		reg = <0x76>;
-		gpio-controller;
 		#gpio-cells = <2>;
-
-		interrupt-parent = <&gpio0>;
-		interrupts = <ASPEED_GPIO(M, 3) IRQ_TYPE_LEVEL_LOW>;
+		gpio-controller;
 
 		gpio-line-names =
 		"SLED4_MS_DETECT1","SLED4_VBUS_BMC_EN","SLED4_INA230_ALERT","SLED4_P12V_STBY_ALERT",
 		"SLED4_SSD_ALERT","SLED4_MS_DETECT0","SLED4_RST_CCG5","SLED4_FUSB302_INT",
 		"SLED4_MD_STBY_RESET","SLED4_MD_IOEXP_EN_FAULT","SLED4_MD_DIR","SLED4_MD_DECAY",
 		"SLED4_MD_MODE1","SLED4_MD_MODE2","SLED4_MD_MODE3","power-host4";
+
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(M, 3) IRQ_TYPE_LEVEL_LOW>;
 	};
 };
 
 &i2c4 {
 	status = "okay";
 
-	sled5_fusb302: typec-portc@22 {
+	typec-portc@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 
@@ -702,13 +746,15 @@ sled5_fusb302: typec-portc@22 {
 
 		connector {
 			compatible = "usb-c-connector";
+			data-role = "dual";
 			label = "USB-C";
+			op-sink-microwatt = <10000000>;
 			pd-revision = /bits/ 8 <0x2 0x0 0x1 0x20>;
 			power-role = "dual";
-			data-role = "dual";
-			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
-			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
-			op-sink-microwatt = <10000000>;
+			sink-pdos =
+				<PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			source-pdos =
+				<PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
 		};
 	};
 
@@ -717,11 +763,11 @@ mp5023@40 {
 		reg = <0x40>;
 	};
 
-	sled5_ioexp41: pca9536@41 {
+	pca9536@41 {
 		compatible = "nxp,pca9536";
 		reg = <0x41>;
-		gpio-controller;
 		#gpio-cells = <2>;
+		gpio-controller;
 
 		gpio-line-names =
 		"SLED5_SWD_MUX", "SLED5_XRES_SWD_N",
@@ -748,38 +794,39 @@ sled5_leds: pca9552@67 {
 		compatible = "nxp,pca9552";
 		reg = <0x67>;
 		#address-cells = <1>;
-		#size-cells = <0>;
-		gpio-controller;
 		#gpio-cells = <2>;
+		gpio-controller;
 
 		gpio-line-names =
 		"led-sled5-amber","led-sled5-blue","SLED5_RST_IOEXP","SLED5_MD_REF_PWM",
 		"","","","",
 		"","","","",
 		"","","","";
+
+		#size-cells = <0>;
 	};
 
 	sled5_ioexp: pca9539@76 {
 		compatible = "nxp,pca9539";
 		reg = <0x76>;
-		gpio-controller;
 		#gpio-cells = <2>;
-
-		interrupt-parent = <&gpio0>;
-		interrupts = <ASPEED_GPIO(M, 4) IRQ_TYPE_LEVEL_LOW>;
+		gpio-controller;
 
 		gpio-line-names =
 		"SLED5_MS_DETECT1","SLED5_VBUS_BMC_EN","SLED5_INA230_ALERT","SLED5_P12V_STBY_ALERT",
 		"SLED5_SSD_ALERT","SLED5_MS_DETECT0","SLED5_RST_CCG5","SLED5_FUSB302_INT",
 		"SLED5_MD_STBY_RESET","SLED5_MD_IOEXP_EN_FAULT","SLED5_MD_DIR","SLED5_MD_DECAY",
 		"SLED5_MD_MODE1","SLED5_MD_MODE2","SLED5_MD_MODE3","power-host5";
+
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(M, 4) IRQ_TYPE_LEVEL_LOW>;
 	};
 };
 
 &i2c5 {
 	status = "okay";
 
-	sled6_fusb302: typec-portc@22 {
+	typec-portc@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 
@@ -789,13 +836,15 @@ sled6_fusb302: typec-portc@22 {
 
 		connector {
 			compatible = "usb-c-connector";
+			data-role = "dual";
 			label = "USB-C";
+			op-sink-microwatt = <10000000>;
 			pd-revision = /bits/ 8 <0x2 0x0 0x1 0x20>;
 			power-role = "dual";
-			data-role = "dual";
-			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
-			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
-			op-sink-microwatt = <10000000>;
+			sink-pdos =
+				<PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			source-pdos =
+				<PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
 		};
 	};
 
@@ -804,11 +853,11 @@ mp5023@40 {
 		reg = <0x40>;
 	};
 
-	sled6_ioexp41: pca9536@41 {
+	pca9536@41 {
 		compatible = "nxp,pca9536";
 		reg = <0x41>;
-		gpio-controller;
 		#gpio-cells = <2>;
+		gpio-controller;
 
 		gpio-line-names =
 		"SLED6_SWD_MUX", "SLED6_XRES_SWD_N",
@@ -835,31 +884,32 @@ sled6_leds: pca9552@67 {
 		compatible = "nxp,pca9552";
 		reg = <0x67>;
 		#address-cells = <1>;
-		#size-cells = <0>;
-		gpio-controller;
 		#gpio-cells = <2>;
+		gpio-controller;
 
 		gpio-line-names =
 		"led-sled6-amber","led-sled6-blue","SLED6_RST_IOEXP","SLED6_MD_REF_PWM",
 		"","","","",
 		"","","","",
 		"","","","";
+
+		#size-cells = <0>;
 	};
 
 	sled6_ioexp: pca9539@76 {
 		compatible = "nxp,pca9539";
 		reg = <0x76>;
-		gpio-controller;
 		#gpio-cells = <2>;
-
-		interrupt-parent = <&gpio0>;
-		interrupts = <ASPEED_GPIO(M, 5) IRQ_TYPE_LEVEL_LOW>;
+		gpio-controller;
 
 		gpio-line-names =
 		"SLED6_MS_DETECT1","SLED6_VBUS_BMC_EN","SLED6_INA230_ALERT","SLED6_P12V_STBY_ALERT",
 		"SLED6_SSD_ALERT","SLED6_MS_DETECT0","SLED6_RST_CCG5","SLED6_FUSB302_INT",
 		"SLED6_MD_STBY_RESET","SLED6_MD_IOEXP_EN_FAULT","SLED6_MD_DIR","SLED6_MD_DECAY",
 		"SLED6_MD_MODE1","SLED6_MD_MODE2","SLED6_MD_MODE3","power-host6";
+
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(M, 5) IRQ_TYPE_LEVEL_LOW>;
 	};
 };
 
@@ -908,9 +958,8 @@ front_leds: pca9552@67 {
 		compatible = "nxp,pca9552";
 		reg = <0x67>;
 		#address-cells = <1>;
-		#size-cells = <0>;
-		gpio-controller;
 		#gpio-cells = <2>;
+		gpio-controller;
 
 		gpio-line-names =
 		"led-fault-identify","power-p5v-stby-good",
@@ -918,6 +967,8 @@ front_leds: pca9552@67 {
 		"","","","",
 		"","","","",
 		"","","","";
+
+		#size-cells = <0>;
 	};
 };
 
@@ -928,8 +979,8 @@ adm1278@11 {
 		compatible = "adi,adm1278";
 		reg = <0x11>;
 		shunt-resistor-micro-ohms = <300>;
-		adi,volt-curr-sample-average = <128>;
 		adi,power-sample-average = <128>;
+		adi,volt-curr-sample-average = <128>;
 	};
 
 	tmp421@4c {
@@ -946,9 +997,8 @@ fan_leds: pca9552@67 {
 		compatible = "nxp,pca9552";
 		reg = <0x67>;
 		#address-cells = <1>;
-		#size-cells = <0>;
-		gpio-controller;
 		#gpio-cells = <2>;
+		gpio-controller;
 
 		gpio-line-names =
 		"presence-fan0","presence-fan1",
@@ -957,11 +1007,14 @@ fan_leds: pca9552@67 {
 		"power-fan2-good","power-fan3-good",
 		"","","","",
 		"","","","";
+
+		#size-cells = <0>;
 	};
 };
 
 &i2c13 {
 	multi-master;
+
 	status = "okay";
 
 	//USB Debug Connector
@@ -973,9 +1026,6 @@ ipmb13@10 {
 };
 
 &gpio0 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_gpiov2_unbiased_default>;
-
 	gpio-line-names =
 	/*A0-A7*/	"","","","","","","","",
 	/*B0-B7*/	"FUSB302_SLED1_INT_N","FUSB302_SLED2_INT_N",
@@ -1029,28 +1079,33 @@ &gpio0 {
 			"BSM_FLASH_LATCH_N","FUSB302_SLED5_INT_N",
 			"","","","",
 	/*Z0-Z7*/	"","","","","","","","";
+
+	pinctrl-0 = <&pinctrl_gpiov2_unbiased_default>;
+	pinctrl-names = "default";
 };
 
 &adc0 {
+	pinctrl-0 = <&pinctrl_adc0_default &pinctrl_adc1_default
+		    &pinctrl_adc2_default &pinctrl_adc3_default
+		    &pinctrl_adc4_default &pinctrl_adc5_default
+		    &pinctrl_adc6_default &pinctrl_adc7_default>;
+	pinctrl-names = "default";
+
 	aspeed,int-vref-microvolt = <2500000>;
-	status = "okay";
 
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_adc0_default &pinctrl_adc1_default
-		&pinctrl_adc2_default &pinctrl_adc3_default
-		&pinctrl_adc4_default &pinctrl_adc5_default
-		&pinctrl_adc6_default &pinctrl_adc7_default>;
+	status = "okay";
 };
 
 &adc1 {
+	pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc9_default
+		    &pinctrl_adc10_default &pinctrl_adc11_default
+		    &pinctrl_adc12_default &pinctrl_adc13_default
+		    &pinctrl_adc14_default &pinctrl_adc15_default>;
+	pinctrl-names = "default";
+
 	aspeed,int-vref-microvolt = <2500000>;
-	status = "okay";
 
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc9_default
-		&pinctrl_adc10_default &pinctrl_adc11_default
-		&pinctrl_adc12_default &pinctrl_adc13_default
-		&pinctrl_adc14_default &pinctrl_adc15_default>;
+	status = "okay";
 };
 
 &mdio0 {
@@ -1081,12 +1136,13 @@ &emmc {
 
 &pinctrl {
 	pinctrl_gpiov2_unbiased_default: gpiov2 {
-		pins = "AD14";
 		bias-disable;
+		pins = "AD14";
 	};
 };
 
 &wdt1 {
-	status = "okay";
 	aspeed,reset-type = "soc";
+
+	status = "okay";
 };
-- 
2.43.0


