Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28264C55175
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 14:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=92K+kN30Lx+dxFo4FvP3f0D5FrIqEMjJrJBXkirUl40=; b=lRKPhS/in3j5mzKdVfbEBjYBwY
	kxxZv+Ul9p9iprHFe0vr9aAj0lWVSnwfLzsIVmjn5/ATaec8qDdEnI169g3eewztutz75HxNj5hle
	LEZO8YOQAi45JJRc4vvyj5N+e0fFU0a+ukUUT8W0HwGOrmR8hAgxkBMCWApcExp9rBjGoHDdiM8n0
	515pDc8AXWnUi+LiDJcD2uHeqk70YsxVDJXTvaC+7JVgZD+Xeu/pINyaUGdERDuQtG8CxruygBRnA
	GmqYuqzRDeCbVWJYLb7G8U1+/RoZZhwpCgeT9dzxpk53zKyTXB2L8QcJa2vsiIYFjCPX2/nxpK+ca
	bdjjTnqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqXXE-0000000FjLv-0l5B;
	Sun, 02 Aug 2026 14:51:28 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqXXB-0000000FjIl-0f1T
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 14:51:26 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-47f96c5b722so1476510f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Aug 2026 07:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785682283; x=1786287083; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=92K+kN30Lx+dxFo4FvP3f0D5FrIqEMjJrJBXkirUl40=;
        b=s1GoiDaVs4PGMxWNUhDdsKG27m/4F2Byw3l5LsH7GAMtxXjVGUe6rM8fx9X9Gqm3hI
         W5MSLnwQx+n4rTO1PJ86kmmCLP+rg4Z4JcjOnrPvLEjdU5nnWkpisJ0AgHq1nn6/133u
         Alp3uRHlH1r4xD3AKrmBdznspHKPRaGE4zYZ8Y8+Tm3LNQWd368qJKwBmUow5KzYJoDP
         EAUMIb7TVDJHeDpcaX1b9Dpns3pigNg88onBIUs9czrs8JyNPxp1q5pdjM6521rfJtyb
         pFCOWaWH/FufDjsWI9+FCYpQzmCoGouqDiZ85va9yYQw48hQ67WGilT4ybzi6r/uq9PV
         4XNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785682283; x=1786287083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=92K+kN30Lx+dxFo4FvP3f0D5FrIqEMjJrJBXkirUl40=;
        b=F2AUpyD4afX6vUhxThGu6nAgtcS6BqbuJwJrP9JKfTmhmSezeLGA1moO5LrtMFIb8Y
         i+wcJPss/SIkoxbsiGI1CGUjEHj8VsbTrrpduEYzmie1OBN0AE82NNGdfykk2+lSfmTp
         NTLPp6x4B3df1a+obzCGXsQLJX0elokqAkkve+BTyXe0eF9jARmDy5TAP5EP54cOjVAt
         26gZY+NffUYhjKHPWD1bo2qOaibYTT/Wi8C2K3jJUz94sKaLVSu6ORaiDNxMHSbZMN/m
         720ELt0fFXjlFtNnvkrM/38r3xYGg8hHmJw/KxCrKCSBmZ/EmvaMD7cNCN8x3NgrDpwN
         EbjQ==
X-Forwarded-Encrypted: i=1; AHgh+RpujeoQUiD2TAIqxJFEBIG+Ya3TkIWbTNKVNrPLYvI84ADVkXSApN0c2OXOniP86PzobyZteOVa0t2u3W8yMhK3@lists.infradead.org
X-Gm-Message-State: AOJu0YwTo1SRRzxO0pVD3wtGPTZaJLPIRDrfO7g3KhlgazoQwMej7akr
	CFurxo8Q0t8B3RiE+qrRzwGKW72s4Lc2zi9sVxx4pV/auDkxm3EuJOzr
X-Gm-Gg: AR+sD121j+mwabRDoruMtL3GwgchuxQuRxIWORulplQjQgUdxLii0Lg0rgjrIyx8uL9
	U0QQaoDfraEyM5jwylb/Hgl5cHEj2SmlD97kCwiMyC6J8C8ruS55mQnauJP70nGNk59pPEwqNy3
	NV8ZH5J+viUoe0LlVLQOpjA34PMhHodQHa2NEuzURem0/4PSqQIqvtZFqhU24W7zIVqZ+B83rlV
	3p3KEUq5PhZpWtLktYwkA+jwM++kaOLAowNcZixaoq7ZQwcT5KdgqJbN6ty7JAlp3B3ovTHRH8J
	h/44vqDnhafBd8+MkmD9YlyveRGhU2Rxer3WktpduRaOjGjuhD2Pab7diri2nfelrVQENaAblri
	YW3SFRObbxIBB19/arGkts+SAB+50z2vVw+Inc7b5lh3JgcwpmVOjKDFyCWH5B+/7gUGbDRx2Ev
	3Iw/U+hfjyHjsIX6XAlh7QPISrf/nBNS7WNZNwhYxZeVPk2wjNpO7sMOYiPZhvyI+dDwebdefnf
	DCU18hUXnhBmw7yRz7XVXwq3k4knZHdOZLL0XT+fbthduIkadcOpZTmlaxoKK2WbqPUDgPvmG09
	pfYTKA+842LksPKDbLy38yjowg5YYgSTNhb/BNHHOBfYTwzkKuwSNZVSxX2BmGWa7ga150xjlta
	/EEdjPVQ4OImml4gFr0YiBz0SKas/LJrvVd/shoAR/hZ0HRZLuKBWmLYrI86j
X-Received: by 2002:a05:600c:840f:b0:495:4b24:1b64 with SMTP id 5b1f17b1804b1-4980c601d19mr130181345e9.0.1785682283088;
        Sun, 02 Aug 2026 07:51:23 -0700 (PDT)
Received: from cypher.home.roving-it.com (1.e.2.e.9.4.4.d.0.e.6.8.9.8.8.3.0.0.0.0.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:0:3889:86e0:d449:e2e1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4980878dcb4sm234526335e9.13.2026.08.02.07.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 07:51:22 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Phil Elwell <phil@raspberrypi.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Andrea della Porta <andrea.porta@suse.com>
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH 3/3] arm64: dts: broadcom: bcm2712: Add USB OTG port
Date: Sun,  2 Aug 2026 15:50:54 +0100
Message-ID: <20260802145109.728793-4-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260802145109.728793-1-pbrobinson@gmail.com>
References: <20260802145109.728793-1-pbrobinson@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_075125_203840_3C3BB9F0 
X-CRM114-Status: GOOD (  13.04  )
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

The Raspberry Pi 5 has a USB2 OTG port wired up to the
Type-C that uses the same IP in earlier generations so
wire this up so it can be used.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com
---
 .../dts/broadcom/bcm2712-rpi-5-b-base.dtsi    |  6 +++++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi     | 25 +++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
index d998bfae91acb..e5030da60f9e7 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
@@ -3,6 +3,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/power/raspberrypi-power.h>
 #include "bcm2712.dtsi"
 
 / {
@@ -239,6 +240,11 @@ bluetooth: bluetooth {
 	};
 };
 
+&usb {
+	power-domains = <&power RPI_POWER_DOMAIN_USB>;
+	status = "okay";
+};
+
 &hvs {
 	clocks = <&firmware_clocks 4>, <&firmware_clocks 16>;
 	clock-names = "core", "disp";
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index c73ed9e066662..f650a5cd8462d 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -55,6 +55,13 @@ clk_sw_baud: clk-sw-baud {
 			clock-frequency = <96000000>;
 			clock-output-names = "sw-baud";
 		};
+
+		clk_usb: clk-usb {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <480000000>;
+			clock-output-names = "otg";
+		};
 	};
 
 	cpus: cpus {
@@ -693,6 +700,19 @@ v3d: gpu@1002000000 {
 			interrupts = <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>;
 		};
+
+		usb: usb@100480000 {
+			compatible = "brcm,bcm2835-usb";
+			reg = <0x10 0x00480000  0x0 0x10000>;
+			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clk_usb>;
+			clock-names = "otg";
+			phys = <&usbphy>;
+			phy-names = "usb2-phy";
+			status = "disabled";
+		};
 	};
 
 	vc4: gpu {
@@ -756,4 +776,9 @@ cooling_maps: cooling-maps {
 			};
 		};
 	};
+
+	usbphy: phy {
+		compatible = "usb-nop-xceiv";
+		#phy-cells = <0>;
+	};
 };
-- 
2.55.0


