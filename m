Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 691FBCA5FA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 16:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BpUlBI/TZ2/z/cI75UbimRM1YcGKhoHyCnq9jL1vi8A=; b=rza0KJYyJa7DZzqwZvpvEvuz7t
	T1LPg61L+dSlaOmG3Qj/lIfWxNowLa2KSE6Mwi3Ek1+p86UOO2dFtUThQ0QoXdTjfbnMwHfXhVdou
	HzSNIN8iGPjzELW9vGQzEHCXdxSWNcVZVDNT5HSmEoRuTPIZsa2+S06atRIG2wZBqj262hWHfRfqI
	cOrdXE6OvUqZBciowsHrDahxXlpyi3UnDbRo8md05yjihnffywUJ7tt2i3HT8QOLGZa6aR2/h3hf5
	nhP0xYZBy+aAqTZ/PaPoMd8KOU9qVq/LW7VD0+g2LDPgQpQqvFCwiCnKI04YPKN3g6JIqeXLolgLa
	SWE7lvow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBanM-000000044K7-0hwq;
	Tue, 29 Sep 2026 16:35:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBanL-000000044Jl-0XTJ
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 16:35:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=BpUlBI/TZ2/z/cI75UbimRM1YcGKhoHyCnq9jL1vi8A=; b=doWYc38MROfyOLGVj8896jI2CQ
	0NNfeRMZ1Ehk21OPFLxX7XDvrXZMIElDA1bA/gcWbV1H1QlucRCAuly1T54+yNAux3o0mNkP30jCf
	pxGxZ0/GSCMEBtlVCPUeDc1qyc8BLUeekCDrPWwjSGeibHM65Fn2sVzRC40WQQ+AZJNUA9rDYVcCD
	jHvpcrcd054BCY6pn+WJJrW9Xqr6hQjUViv+Aa16by7c7BZeO0xVeS+2GaFdCh/yj+5kO+mtzgWbc
	ngA/D3x4REDHcossqLal6sMADVCq2VF9M9Pw2o3keaL7WfuyOhWsMK4T+j7iyO/xM2W6dF39Cn8/O
	aUkuyETg==;
Received: from mail-qv2-x0d.google.com ([2607:f8b0:4864:33::d])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBanI-00000002r6W-1AzG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 16:35:05 +0000
Received: by mail-qv2-x0d.google.com with SMTP id 6a1803df08f44-91786b004f2so2143076d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 09:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brivo.com; s=google; t=1790699701; x=1791304501; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BpUlBI/TZ2/z/cI75UbimRM1YcGKhoHyCnq9jL1vi8A=;
        b=RKfUwnLOvbFzIDysOXpM3GK8iUvFCBsWBJKRf7E93H3nYHLSTh5uspT3KuneTIVEsy
         r+VWR3FV4i5QAqGueC9UYOiFxdml2wGTxEHXXtmKWakZjH+fd9FWgX2xvklp3UbMSc5c
         SLliCfpQbjKD+hBRklhRV15LNjvU2NYbfqvamOdgY3X5O+RJ/LKXMex3RLCdevG66IBt
         JML5q6k0RRy0YrrIZTlO/duPpI/KRsS0k29SForo7jhytrbp8UrpQnnMWt5JvtlrtNj1
         N9zFEGKlYI28c/kfeoRHuL0Yg2kuhQklHP/hymiWvhoowTLJQrowVpQoydqs9Kooja1I
         3Vzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790699701; x=1791304501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BpUlBI/TZ2/z/cI75UbimRM1YcGKhoHyCnq9jL1vi8A=;
        b=GFpQc8hjowbp69S7Q2JZjZylaL5fOcl5oO8fFSo/FUuURz+eAz3aEzQMqCbqhYYAXT
         o03VhAdfYxkZ3PKebOkgFgAsx4I5CVk4TlIcVu6uAQ+7xwLgwKmwqyuf62UhPuPKYTPB
         Pksexj9rwUbbM+/nlJDLFwBNMIupPynr4GzIMhkNH/9/BsLvRU0TPpJD3JdE9YqRmW9t
         iFxTvwF+WC22+GBBpFjVRgD6OJR6tbaJenosAkODplniQCWnLhXoTl5ilhW3VVapdGyy
         cgVK1IvTSpm2KjI3abDEGv6XiUtUbCUloJZ5z5L9Ejs73dWpEndYPcu88tFaVYcA/Nyd
         GHAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFFQNMX0HYpF84u0+oDB4+3pmfUzF0nZgrqlY786TeFs03pWL6p1wkxs/OH7E3KU/yRScbewOibCGOX2Euh9l5@lists.infradead.org
X-Gm-Message-State: AFq9FYI1tm3WqaqFqJ3pJ14V81l9O+u8PcnC07c9Sr7qD4obA5wLiFf7
	gnvrQwxmVpCPKYCBNzTaHtPTKnChIiGDxEFVfRQluei9KigkEY2sS822QWpqUgTJHx6jwE6TRK6
	Z1Zbm0HrAj44Zm9nyijORmpH5ek+W6Ez1k0iJB/nTHDzfZVCyO9pw0cIkp4OITFFTBtCDeA==
X-Gm-Gg: AYBFou3qRY/ZY+ivkPPj5qg+SZzgOE/Erp9JSsTI/avEckDoW2xolrPDT7fPkbo4Z7W
	lFJZONMZmB6QR/DjvrHwg9nGRRa3Fq1Josj7IwgRpAbZOGLHPGHeCkxcKFVM1c1IBCoU7Yx1LkV
	GRpmpIz6bEFEvKWdOibrvNEoWl5H3NwMPN2mwJbm4quZSyxV2u2KU3PAXJ0env3Ba4bfnmXTm2j
	Ry6z8odSdfTcIVx+wFagORSxuRMdHDfOgD9o7ICZrPu4X2kWI3xeqhpDqNH4Dsf420k0zlL04BJ
	q1lYPAwQTCIwB4VNL4iIG4+dD3HUAMEY1T7fRgPKeqjIMpVSXevtE+LsJxyEhcLTlVLEy/QC8Cq
	7yOVqnZlUSwCpAq4AzKm7OrbI2vRFRyn61xGZofeL6D4b4Bt1PQArNdcVfIUrtArQanDBkZly/e
	zUEZtx3WrcNRZDpBW4r6pMAHrQTVcwH9EGHDkHu64/BpnpIDlsO2XOOqM+yNIZTFux
X-Received: by 2002:a05:6214:248d:b0:917:8d04:deae with SMTP id 6a1803df08f44-9178d04e0b4mr37336786d6.35.1790699701212;
        Tue, 29 Sep 2026 09:35:01 -0700 (PDT)
Received: from strozzi ([71.163.254.246])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d39627asm14065896d6.45.2026.09.29.09.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:35:00 -0700 (PDT)
From: Sean Anderson <sanderson@brivo.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-arm-kernel@lists.infradead.org
Cc: linux-amlogic@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Sean Anderson <sanderson@brivo.com>
Subject: [PATCH] arm64: dts: amlogic: meson-s4: Set stdout-path to uart_b
Date: Tue, 29 Sep 2026 12:34:10 -0400
Message-ID: <20260929163457.3237394-1-sanderson@brivo.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_173504_456119_FF5C7917 
X-CRM114-Status: GOOD (  19.94  )
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

If stdout-path is not set then bootloaders such as U-Boot may fail to
boot when they cannot find the serial console. Normally, this would be
added to the board devicetree, but in this case the boot ROM,
first-stage bootloader, ATF, and TEE all use this serial port with this
baud rate [1]. All of the listed components are signed by Amlogic and can't
be modified by OEMs. So while someone might want to use a different
port, they can't prevent previous stages of the boot process from
printing to this port. Therefore, set the serial port in the SoC
devicetree. Boards can override it in their devicetree if necessary.

[1] Actually, the baud rate used by the ROM et al. is 888888, but some
    userspace tools (such as agetty) choke on non-standard baud rates,
    so we use 921600 which is close enough for most serial adapters.

Signed-off-by: Sean Anderson <sanderson@brivo.com>
---

 arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts    | 8 --------
 .../boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts    | 5 -----
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi                | 9 ++++++++-
 3 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
index 0a3f81ea0fb0a..15bf143317a2d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
@@ -14,10 +14,6 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	aliases {
-		serial0 = &uart_b;
-	};
-
 	memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x0 0x0 0x40000000>;
@@ -141,10 +137,6 @@ &pwm_ij {
 	status = "okay";
 };
 
-&uart_b {
-	status = "okay";
-};
-
 &ir {
 	status = "okay";
 	pinctrl-0 = <&remote_pins>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
index 99d5df71b9cd4..c602091bca0a6 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
@@ -22,7 +22,6 @@ aliases {
 		mmc2 = &sdio; /* SDIO */
 		rtc0 = &rtc;
 		rtc1 = &vrtc;
-		serial0 = &uart_b;
 	};
 
 	memory@0 {
@@ -334,7 +333,3 @@ bluetooth {
 		clock-names = "lpo";
 	};
 };
-
-&uart_b {
-	status = "okay";
-};
diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 2a6fbd5308362..3e432e232a76a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -13,6 +13,14 @@
 #include <dt-bindings/reset/amlogic,meson-s4-reset.h>
 
 / {
+	aliases {
+		serial0 = &uart_b;
+	};
+
+	chosen {
+		stdout-path = "serial0:921600n8";
+	};
+
 	cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
@@ -794,7 +802,6 @@ uart_b: serial@7a000 {
 				interrupts = <GIC_SPI 169 IRQ_TYPE_EDGE_RISING>;
 				clocks = <&xtal>, <&clkc_periphs CLKID_UART_B>, <&xtal>;
 				clock-names = "xtal", "pclk", "baud";
-				status = "disabled";
 			};
 
 			reset: reset-controller@2000 {
---
base-commit: 6f8319e3e9a44dd537d17f41565a8453c560a581
branch: s4_stdout

-- 
2.53.0


