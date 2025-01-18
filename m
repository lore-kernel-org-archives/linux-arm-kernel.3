Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3038C02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 10:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eiAkN9lM6+KhhfeepI/5N0TsoSs8qSwlei2DZBWENpE=; b=y7d6NbqP5dieYBBSTR6ZV/z+Mt
	1Cqt/VJEFpR0QPkX64SXfGh/xaw1gyTT187IbWCU76UVqy6aN77Mo5aq3lhydvxip26MN8+mLg2UR
	fmwFSCT8SnmC47NrO9lYpCGQJCy6yV0w/sTaSzNqHkUiVDz+gHfPfdIPAZdwegyku5mhFuJj3Ua3k
	qWY95HIssrtDDHqbt16Hca1aqsw6gy3ReOPuWeez/lHgHvvvJAh8tr3e189DMvdxWmPnd4+/C1Aaw
	fCRdvH7aBDq6HwxR4oyti4Ab0Fc8VhXMIvYADET7XxstF2LvLkmeV5z7Wkau6VNiywhf5oEMb4U8f
	lrGyOknQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ620-00000002BZu-0EiN;
	Sat, 18 Jan 2025 10:26:20 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ5yL-00000002B3y-46NW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jan 2025 10:22:35 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4361f65ca01so28528255e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jan 2025 02:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737195752; x=1737800552; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eiAkN9lM6+KhhfeepI/5N0TsoSs8qSwlei2DZBWENpE=;
        b=lfcU8pB5JgtGEcksKAmHLD8wFL54fnAlBKc9uUNuWMILxtfoLHXjJR0RZMzFPkV9c1
         M6QlwfQEa52VJVSi+7ey6X9j0LISG7M2kGKqPVoQklijbFI9HKdGcl19E609hQxzgPwn
         GhBFlZe7S1mIF+XgkUNv2bmVnl05XcMgvn3yDKJBMIS2F8VVyrqPMb60vVNK7FAwqmce
         2mpv4nT6KiXlcBYzGWIFsTVA1sAWvBSZpoueBx/krqX8+Fq9GQVrsOGb7h6vZ0z99kIH
         fIOtC8sOmdqtzbLRFeON2jTZZxEsGfQLRaikzFk5btJ8LkQLwVrSGd0MuIM+bXQn3rql
         dLdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737195752; x=1737800552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eiAkN9lM6+KhhfeepI/5N0TsoSs8qSwlei2DZBWENpE=;
        b=HY+F6mWKbxOoiDqbn1VyrNhi/3E54gQtnmFQ0CbfyI8mOsK9q7s24RA4d03Xmgg3zg
         nOJdT/Mo4yULg09atqHAU0uQjCmZx5uIZzNrNy2AbHEPLvoLFbmVD/0qes+XxfAXxopB
         BZgueee4zU6KUobAYqnfgQwSkWZoD1rnXwDwrq/fgpPoSX/GmvO5R+6ewQHvlFPkWjQT
         l7wjWUjMAOax2MWpOFZqEOGba+UYnSd58f67/iYqNRxXKGnMKQfGr1S3aZdg5BElBRxL
         HvS5gQd4L3BEZu76m+sX7hc/WOpqfYu4CoPmVSkEkF5aMo03sMShXXJc+JlR+AFrkjc9
         tj8w==
X-Forwarded-Encrypted: i=1; AJvYcCXXEi1THhsBIc0ulgbM2DPRSKKp7tL0Hcl0l+716VxVlxALgBw+OlG4CmLcwkAGmMIrB9RkbSTu+VPBfax07hxO@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7A52yjmaQjmeDcGdcLnbU98Mq8duoR7B32Zap7l6TmzD7ExbN
	yW59StNH8rYOzmrWbMXC7u2BbbbdQIBmzqxIqQoNRjIup+lcqJw+
X-Gm-Gg: ASbGnctZExe6WDScu209TEg3td5N0ZvH+RVA9TDfYMpulQiPwN81vmGcAdaHLUeJoTv
	/ZssbbKw75BX6hIM1Ctr6eJ/zY8YcZigA/Po97sXGPpgdMShhhkTIGlSjNL+OWBzjLYiV7Q55xf
	2gQ3Cuax+0hGlDhtkVwhZwdeIzShykXPL6NUXBUh0a+RPNoAhtbDaoxlvBxkumDe/tMu35Gt3I6
	iMaL64qJEsUVFlyJDfl+Gn2BcGDwJeA9IYFfZxQ1ItrmHi7HJ3BYUGeCVZAPgSYQC6uXSmiwXXg
	H/G0i4XFdnmwtiqJUd02X7CevHgquNmmd2S/ffm1AXn+vOj1tW5/w8gL
X-Google-Smtp-Source: AGHT+IEg75B51PBOkr41mFVL8S0eZZqlWUj0q/2aF0Yoeffu4iW9O1RDKnjkpOJD7XMKrnqAu7NcQg==
X-Received: by 2002:a05:600c:1c9d:b0:434:ffd7:6fd2 with SMTP id 5b1f17b1804b1-438913ca1ccmr55465325e9.7.1737195752087;
        Sat, 18 Jan 2025 02:22:32 -0800 (PST)
Received: from localhost.localdomain (146.10-240-81.adsl-dyn.isp.belgacom.be. [81.240.10.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438904625f5sm64954515e9.28.2025.01.18.02.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 02:22:31 -0800 (PST)
From: Philippe Simons <simons.philippe@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC support),
	linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Philippe Simons <simons.philippe@gmail.com>
Subject: [RFC PATCH 3/3] arm64: dts: allwinner: h700: Enable USB OTG
Date: Sat, 18 Jan 2025 11:22:06 +0100
Message-ID: <20250118102207.9339-3-simons.philippe@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250118102207.9339-1-simons.philippe@gmail.com>
References: <20250118102207.9339-1-simons.philippe@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_022234_020057_5258ADFB 
X-CRM114-Status: GOOD (  12.38  )
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

RG35XX have a GPIO controlled regulator for phy0 vbus, add it.
Enable HCI0s controllers and otg for dr_mode.
Add phy0 properties to descrive id_det, external vbus, and internal vbus

Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
---
 .../sun50i-h700-anbernic-rg35xx-2024.dts      | 25 +++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
index 80ccab7b5..5a6ae42de 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
@@ -175,6 +175,16 @@ reg_vcc5v: regulator-vcc5v { /* USB-C power input */
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 	};
+
+	reg_usb0_vbus: regulator-usb0-vbus {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&pio 8 16 GPIO_ACTIVE_HIGH>; /* PI16 */
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-name = "usb0-vbus";
+		vin-supply = <&reg_boost>;
+	};
 };
 
 &cpu0 {
@@ -337,12 +347,23 @@ &uart0 {
 	status = "okay";
 };
 
-/* the AXP717 has USB type-C role switch functionality, not yet described by the binding */
+/* the AXP717 has USB type-C role switch functionality */
 &usbotg {
-	dr_mode = "peripheral";   /* USB type-C receptable */
+	dr_mode = "otg";   /* USB type-C receptable */
+	status = "okay";
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&ohci0 {
 	status = "okay";
 };
 
 &usbphy {
+	usb0_id_det-gpios = <&pio 8 4 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PI4 */
+	usb0_vbus_power-supply = <&usb_power>;
+	usb0_vbus-supply = <&reg_usb0_vbus>;
 	status = "okay";
 };
-- 
2.47.1


