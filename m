Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0049D75BA3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 02:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7hFpMGE8s7psUHx3+Wdj8euFlIX9fVjcGzp1EwkK8LE=; b=DDfa3DBU7zet0Tx5CepIDFiTx/
	vOGqIovC/CMFtA6lEIXdtlqUurz8IiWyZVdohktarvT7g5TQiBZM+2r5fMJWNiIk/RsamGyIHgHAS
	MIDcKD3fQm+e+/aBoVWhKU67/nhrULILwTAmZJWT1hu+8jtyGfmh9c9jr5toqZjv4W0EpTAXz4jd8
	l8NzdoDk+2N+2CezDyDHyi2z33SDytbVWLFmsA+xlfxgE6jkeabbxsp13JGcbBHQ7ZKPw9y38POcU
	z170ccQqIa0st0QTJnQxFpe3hvV8TVTgUF6/qcGi0iYJo/MbmOu2FnW92RNqbjcQGO21a6HD1G+Ia
	s4m4Oe7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDxNf-0000000GdqU-24Gr;
	Thu, 21 Nov 2024 02:57:19 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDxK7-0000000GdAe-06Ni
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 02:53:40 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-71811707775so195915a34.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Nov 2024 18:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732157618; x=1732762418; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7hFpMGE8s7psUHx3+Wdj8euFlIX9fVjcGzp1EwkK8LE=;
        b=fRUOe4gAQdCsKHeuwKIJYg3t9emR79XxvQxbEko4MJFQTzo0nGL23y4nWyGhjkz4Hc
         lU5K8LRq5WXu3saaNXroXjx6BzvEruEgLxVWMxwAmH9iyJXNJffwknX2P6g0VOZDNLgW
         jmznS5xYY2toupZ7uDAsx7cDOUPhv3pX4XL0Qlf/U948eIcGa3Yo+A4b1FQJl3XVLrnN
         nCDqdypQOleJCr+rSlsBCjQLWegswFTCIEoWLYxEydXjGyjHIFdjX28887PL0exff4YO
         fqzAhdU0587T5YPxd2OULKxbtvQObDwtAK6QUK8gYcJiTWCpOyS3ClwGSeS6AK/SL5IP
         ZCOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732157618; x=1732762418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7hFpMGE8s7psUHx3+Wdj8euFlIX9fVjcGzp1EwkK8LE=;
        b=W66zCV8JWI0FL9+YTZa1rHjORWCVRk+pLfKVz5Dk2+IkW1oxANyJ9HoH2x1P7l8W2D
         wm4LbRPF6vCN7gVgj22yg1BmG3o9pMzBXR7pyaB2vVqBKesc+U0gtzACUbzlVsS2S5kW
         0TGF+2evDavVQqI2iTthxrKXo/HmEqQXcu/r6YzO7xajm78wrjOND3AKVJ0CZCJRXk7i
         MP3ngguxNb3CiAuSwv4CtV7ghTtAz0Qshnnn5IgSJsrlwx/Sz9UeiBJvygtrH/2SM4UD
         S5rfnUbInrrZ+alOwqT+W00QtDI88h4j8HOLNjDhzXoOoyc2aw+NjZjy/a2hSTyXoQjx
         kV1A==
X-Forwarded-Encrypted: i=1; AJvYcCXzSv0rpqABzExX32yo7QA90BVuqxBrBWKE42FP3UgQMl4oYfuvTpzKzQKqrQMheaTwayLvXpfeRbbRKeXfR09T@lists.infradead.org
X-Gm-Message-State: AOJu0YxZ3o7qrsGXPks17oKZkCZ3hQfV28z3OdIjn7cp7sFVLDwKhP2O
	OqQEuSt3yzWA5gfM+cCiWkfhdFWnihjQwzgyNFSARm8SGmrINWVRbY1A1Q==
X-Google-Smtp-Source: AGHT+IFinVzwidv3KxbK4poEFtxDXiNYFFKy7ns+/JV5m2BWBfiQ/ywhmjk5vggcq044ZI8cYP3oKQ==
X-Received: by 2002:a05:6830:6e99:b0:71a:6cbf:7e96 with SMTP id 46e09a7af769-71ab30ed2c8mr6011687a34.9.1732157617978;
        Wed, 20 Nov 2024 18:53:37 -0800 (PST)
Received: from peter-bmc.dhcpserver.bu9bmc.local (2001-b400-e309-7a4e-e779-1177-8427-3602.emome-ip6.hinet.net. [2001:b400:e309:7a4e:e779:1177:8427:3602])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbb64f5514sm285513a12.34.2024.11.20.18.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 18:53:37 -0800 (PST)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/6] ARM: dts: aspeed: Harma: Revise GPIO line name
Date: Thu, 21 Nov 2024 10:53:20 +0800
Message-Id: <20241121025323.1403409-4-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241121025323.1403409-1-peteryin.openbmc@gmail.com>
References: <20241121025323.1403409-1-peteryin.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_185339_066333_57C78C01 
X-CRM114-Status: GOOD (  10.48  )
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

Add:
"ac-power-button",              // AC power button input signal
"asic0-card-type-detection0-n", // ASIC0 detection signal 0
"asic0-card-type-detection1-n", // ASIC0 detection signal 1
"asic0-card-type-detection2-n", // ASIC0 detection signal 2

"cpu0-prochot-alert",           // CPU 0 processor hot alert signal
"cpu0-thermtrip-alert",         // CPU 0 thermal trip alert signal

"irq-uv-detect-alert",          // IRQ for undervoltage detection alert
"irq-hsc-alert",                // IRQ for hot-swap controller alert

"uart-switch-button",           // Button to switch UART interfaces
"uart-switch-lsb",              // UART switch signal, least significant bit
"uart-switch-msb",              // UART switch signal, most significant bit

"leakage-detect-alert",         // Leakage detection alert signal

"power-card-enable",            // Power card enable signal
"power-fault-n",                // Power fault signal
"power-hsc-good",               // Hot-swap controller power good signal
"power-chassis-good",           // Chassis power good signal
"presence-post-card",           // Presence for debug card
"presence-cmm",                 // Presence for chassis manager
"pvdd11-ocp-alert",             // PVDD11 overcurrent protection alert signal

"reset-control-cmos-clear",     // Reset control signal for clearing CMOS
"reset-cause-pcie",             // Reset cause indication for PCIe
"reset-cause-platrst",          // Reset cause indication for platform reset

"P0_I3C_APML_ALERT_L",          // APML alert signal

Rename:
// Rename the power signal to match PSM defined
"power-cpu-good" to "host0-ready",
"host-ready-n" to "post-end-n

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 58 ++++++++++++-------
 1 file changed, 37 insertions(+), 21 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index fd85d5e34a55..ce1731bdc1af 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -416,12 +416,6 @@ gpio@31 {
 		reg = <0x31>;
 		gpio-controller;
 		#gpio-cells = <2>;
-
-		gpio-line-names =
-		"","","","",
-		"","","presence-cmm","",
-		"","","","",
-		"","","","";
 	};
 
 	// Aegis FRU
@@ -559,7 +553,8 @@ &gpio0 {
 	/*A0-A7*/	"","","","","","","","",
 	/*B0-B7*/	"","","","",
 			"bmc-spi-mux-select-0","led-identify","","",
-	/*C0-C7*/	"","","","","","","","",
+	/*C0-C7*/	"reset-cause-platrst","","","","",
+			"power-hsc-good","power-chassis-good","",
 	/*D0-D7*/	"","","sol-uart-select","","","","","",
 	/*E0-E7*/	"","","","","","","","",
 	/*F0-F7*/	"","","","","","","","",
@@ -568,7 +563,8 @@ &gpio0 {
 	/*I0-I7*/	"","","","","","","","",
 	/*J0-J7*/	"","","","","","","","",
 	/*K0-K7*/	"","","","","","","","",
-	/*L0-L7*/	"","","","","","","","",
+	/*L0-L7*/	"","","","",
+			"leakage-detect-alert","","","",
 	/*M0-M7*/	"","","","","","","","",
 	/*N0-N7*/	"led-postcode-0","led-postcode-1",
 			"led-postcode-2","led-postcode-3",
@@ -577,18 +573,29 @@ &gpio0 {
 	/*O0-O7*/	"","","","","","","","",
 	/*P0-P7*/	"power-button","power-host-control",
 			"reset-button","","led-power","","","",
-	/*Q0-Q7*/	"","","","","","power-chassis-control","","",
+	/*Q0-Q7*/
+			"","","","",
+			"","power-chassis-control","","uart-switch-button",
 	/*R0-R7*/	"","","","","","","","",
 	/*S0-S7*/	"","","","","","","","",
 	/*T0-T7*/	"","","","","","","","",
 	/*U0-U7*/	"","","","","","","led-identify-gate","",
 	/*V0-V7*/	"","","","",
 			"rtc-battery-voltage-read-enable","",
-			"power-chassis-good","",
+			"","",
 	/*W0-W7*/	"","","","","","","","",
 	/*X0-X7*/	"","","","","","","","",
 	/*Y0-Y7*/	"","","","","","","","",
-	/*Z0-Z7*/	"","","","","","","","";
+	/*Z0-Z7*/	"","","","","","","presence-post-card","";
+};
+
+&gpio1 {
+	gpio-line-names =
+	/*18A0-18A7*/ "ac-power-button","","","","","","","",
+	/*18B0-18B7*/ "","","","","","","","",
+	/*18C0-18C7*/ "","","","","","","","",
+	/*18D0-18D7*/ "","","","","","","","",
+	/*18E0-18E3*/ "","","","","","","","";
 };
 
 &sgpiom0 {
@@ -636,10 +643,10 @@ &sgpiom0 {
 	"","reset-control-cpu0-p1-mux",
 	"","reset-control-e1s-mux",
 	"power-host-good","reset-control-mb-mux",
-	"power-cpu-good","reset-control-smb-e1s-0",
+	"host0-ready","reset-control-smb-e1s-0",
 	/*E0-E3 line 64-71*/
 	"","reset-control-smb-e1s-1",
-	"host-ready-n","reset-control-srst",
+	"post-end-n","reset-control-srst",
 	"presence-e1s-0","reset-control-usb-hub",
 	"","reset-control",
 	/*E4-E7 line 72-79*/
@@ -656,7 +663,7 @@ &sgpiom0 {
 	"presence-asic-modules-0","rt-cpu0-p1-force-enable",
 	"presence-asic-modules-1","bios-debug-msg-disable",
 	"","uart-control-buffer-select",
-	"","ac-control-n",
+	"presence-cmm","ac-control-n",
 	/*G0-G3 line 96-103*/
 	"FM_CPU_CORETYPE2","",
 	"FM_CPU_CORETYPE1","",
@@ -668,7 +675,7 @@ &sgpiom0 {
 	"FM_BOARD_REV_ID2","",
 	"FM_BOARD_REV_ID1","",
 	/*H0-H3 line 112-119*/
-	"FM_BOARD_REV_ID0","",
+	"FM_BOARD_REV_ID0","reset-control-cmos-clear",
 	"","","","","","",
 	/*H4-H7 line 120-127*/
 	"","",
@@ -683,22 +690,31 @@ &sgpiom0 {
 	/*I4-I7 line 136-143*/
 	"","","","","","","","",
 	/*J0-J3 line 144-151*/
-	"","","","","","","","",
+	"","","power-card-enable","","","","","",
 	/*J4-J7 line 152-159*/
 	"SLOT_ID_BCB_0","",
 	"SLOT_ID_BCB_1","",
 	"SLOT_ID_BCB_2","",
 	"SLOT_ID_BCB_3","",
 	/*K0-K3 line 160-167*/
-	"","","","","","","","",
+	"","","","","","","P0_I3C_APML_ALERT_L","",
 	/*K4-K7 line 168-175*/
-	"","","","","","","","",
+	"","","","","","","irq-uv-detect-alert","",
 	/*L0-L3 line 176-183*/
-	"","","","","","","","",
+	"irq-hsc-alert","",
+	"cpu0-prochot-alert","",
+	"cpu0-thermtrip-alert","",
+	"reset-cause-pcie","",
 	/*L4-L7 line 184-191*/
-	"","","","","","","","",
+	"pvdd11-ocp-alert","",
+	"power-fault-n","",
+	"asic0-card-type-detection0-n","",
+	"asic0-card-type-detection1-n","",
 	/*M0-M3 line 192-199*/
-	"","","","","","","","",
+	"asic0-card-type-detection2-n","",
+	"uart-switch-lsb","",
+	"uart-switch-msb","",
+	"","",
 	/*M4-M7 line 200-207*/
 	"","","","","","","","",
 	/*N0-N3 line 208-215*/
-- 
2.25.1


