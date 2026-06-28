Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49655C43602
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 23:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SxbKV8/skOsXsZRqmSrDPZIzaZs8hTaFDlWnRA4ZiJM=; b=UWOhDh4uS3hj8PjavXF1hRjjrU
	QUEKcEYZeXva3NWj3HWhYDoWJ/vq33JpaQhooJk5L45Nv5vP6isEO3jPTDfsREkgSGNzdSm83JzI4
	Jg9qOySvkUPlY5R/2CCvAhHg2AEun6uparVYd2Ro5vTBs7NIMz2EL3AgWgjoTIzjGpep9sl+PWk4P
	tE11SoAlK2VEB13jnTCy2WeIowqM0TGkBSe08TeiyKHx9n/iExpaJtWDfNM1bzT7L+4ewHmS9eOTd
	wRQQB8HMon1BTeSH9o0Gi/SpKf9LrPvVfFCpmKCCesZcIQsBERcLsd1t7ZImc6vuifz9Cap2UfUiJ
	PWuVqnpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdyUl-0000000DTXU-0aV4;
	Sun, 28 Jun 2026 23:00:59 +0000
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdyUf-0000000DTV9-0J0Z
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Jun 2026 23:00:54 +0000
Received: by mail-dl1-x1236.google.com with SMTP id a92af1059eb24-1390f75d8bbso5863856c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 16:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782687652; x=1783292452; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SxbKV8/skOsXsZRqmSrDPZIzaZs8hTaFDlWnRA4ZiJM=;
        b=ccWdF7DewOlA+ST4PTDzVxZSh8Daxp3JlVXr0G9wmICNnDYW9/PZEL7JiEYWrHeQwY
         FDpaGLQx1a8xMfRI1Ta7ZCQopZSGfTLXsQ30ltbzt7k7VnyzHnMWStp46TSiCk6vd+hF
         BkimeKOa3Doopq9BdXNkXe8pXoJa30Ryi2SudG/G+KHips37PTx+on/q5yl/MwbAX+1w
         x4Kt8utjb0mWTdp3JSdxVpRuWqrqy9HtNv/JTHI85747zUXCD/UH0SgalgGcAKN7QEO+
         8kxAufPK+gDs5JCZ/nqHL5B74yXsuBG2nI9qM4DW3Qa7KHFpHDtOTG7lc5uQrCkvU+dC
         egNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782687652; x=1783292452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SxbKV8/skOsXsZRqmSrDPZIzaZs8hTaFDlWnRA4ZiJM=;
        b=OxWhGKAOs+TIeA0S3ihJ/zcN+pMmOBAnrNcaYPseXpPayqrAxL2sshXMXmpliZKB6H
         zXMp+3uBecfObot5V2u7avBjKcX4HyWTMmBUvK3OOq0jCrDSY80aUA8aNtGf1SRhzuU6
         azYoQlqcGVOQpmND/FstzUuhMGIye8OAOWrjXgg/n8u3F6LqjopgzouCpuDXDVpVUNqu
         skJC0rwgHy2usqsYHfsIaYGl+dh9wxAiwHTVvx6N5md8DTA9W1qeQFBRrQmQh8/WtmD0
         Ezwql4g9Wi3SY62+5LgrEyBcMyi/eBUWcu5xUqYpl+MlU1Q7FsNbugKe6Txja1NDYMq8
         F5jg==
X-Forwarded-Encrypted: i=1; AFNElJ+kk1FsmwGrms6rs0gVR2+YfcF8lcOJqr8fq89v+mZzJOV64eQgRdwi/L+KScfzYa+qwC9knmw6bQ2xrjEp2FXz@lists.infradead.org
X-Gm-Message-State: AOJu0YzoHWuC8iUUy2aFKWm7/wn+5aaRoNk9uuK0qRx1znIjiX6QpG2r
	OLE092wi6a14490WVXEP7hz2IKIk4EP70G3zL8f3IQPiuKd9C/2dagSN
X-Gm-Gg: AfdE7ckVM+b61spgWBLL1v7cGA6gDog4WoHktnGb8GZGkBoYHx26hrM/bPGmrot0aSL
	P0UQuMZaGp8fX3a0LBar5oDoDmYCNsANqwGhfEKO3ODBrIUXaFu+Lmu4htNOVbQRbIywmSVun4E
	mOkUcFtfAO4+wdmA2AIsL4s1cDxcxY/pLnH61Ecxuc/zfa09cWuD/p5vnIo+KaCjrBCmMuuDb0J
	HJTXhpiwTdE3Cvz/h8WNLbL+HjocKUnmbDXkUa16WWJP23CRIZHYOAecJB+brdlJW55v3ZKHsFc
	3MJGufaGq2dMaLc9QTHOP1WF03Tu8v7Wuh5fnZPQx+v2tUphD2zOHuNmZ1XgQAk0dhfQhaDHLt9
	Vnt5E/EswqQyxDMMOLkSl8ruA1h9xcjE1ECDqhhzUEhDIHnobnwuWDaCn5DmzzgRbvv39kFSDuk
	s0ujoNF3KJWwEUYLftKqlpwswXWR6Ka5deno1JxFaKZWi/48yIVZbE/sQxBndZEEpiJbeQdgN1q
	/5hMNlvh+f9t7dfQkxX
X-Received: by 2002:a05:7022:79a:b0:12d:ff1b:92f5 with SMTP id a92af1059eb24-139dbb6ab18mr12709829c88.28.1782687651819;
        Sun, 28 Jun 2026 16:00:51 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d8f318e7sm41359030c88.3.2026.06.28.16.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 16:00:51 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dennis Gilmore <dennis@ausil.us>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 4/4] ARM: dts: helios4: wire LM75 into a thermal zone with fan cooling
Date: Sun, 28 Jun 2026 16:00:42 -0700
Message-ID: <20260628230042.1204293-5-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628230042.1204293-1-rosenp@gmail.com>
References: <20260628230042.1204293-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_160053_135067_34303486 
X-CRM114-Status: GOOD (  11.36  )
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

The LM75 temperature sensor on i2c0 creates a hwmon interface but was
not referenced by any thermal zone, producing:
  hwmon hwmon0: temp1_input not attached to any thermal zone

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../boot/dts/marvell/armada-388-helios4.dts   | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index 626a7339a5d0..6e0452217265 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -8,6 +8,7 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/thermal/thermal.h>
 #include "armada-388.dtsi"
 #include "armada-38x-solidrun-microsom.dtsi"
 
@@ -68,6 +69,35 @@ reg_5p0v_usb: regulator-5v-usb {
 		vin-supply = <&reg_12v>;
 	};
 
+	thermal-zones {
+		board-thermal {
+			polling-delay-passive = <2000>;
+			polling-delay = <10000>;
+			thermal-sensors = <&temp_sensor>;
+
+			trips {
+				board_alert: board-alert {
+					temperature = <55000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+				board_crit: board-crit {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&board_alert>;
+					cooling-device = <&fan1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&fan2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+	};
+
 	system-leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
@@ -129,6 +159,7 @@ fan1: j10-pwm {
 		pwms = <&gpio1 9 40000>;	/* Target freq:25 kHz */
 		pinctrl-names = "default";
 		pinctrl-0 = <&helios_fan1_pins>;
+		#cooling-cells = <2>;
 	};
 
 	fan2: j17-pwm {
@@ -136,6 +167,7 @@ fan2: j17-pwm {
 		pwms = <&gpio1 23 40000>;	/* Target freq:25 kHz */
 		pinctrl-names = "default";
 		pinctrl-0 = <&helios_fan2_pins>;
+		#cooling-cells = <2>;
 	};
 
 	usb2_phy: usb2-phy {
@@ -201,6 +233,7 @@ temp_sensor: temp@4c {
 					compatible = "ti,lm75";
 					reg = <0x4c>;
 					vcc-supply = <&reg_3p3v>;
+					#thermal-sensor-cells = <0>;
 				};
 
 				eeprom@53 {
-- 
2.54.0


