Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2628D2E9CF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 09:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hnd0dMgn8pF5mC6ybOYdJ6wVojOcLARfVRQ6oD52meo=; b=3MOKz5DBBQ1NHktt/An4Iz+ebP
	1g9yvKQpfxG5YbPOeXAfMHREQ3tX3usr2dS6W3IAys8NtBri18v2UKgnhRdZRymcSk37UdSYjoJzx
	nVSg0AKyOghje9nlTDskeqG40JpGurUG2S9SfyXFzFgbSHxFWL+s2VKyqmXlvHhnXDHshHZLMpi82
	nsAZe5iD4MJ1LpZDaF+5h2zysdmbA5E036nqlZXDdYzC/W6k3sms3wksnrQUYo2gEKbY6jf1xhAwL
	U46+ebMIbgjpzW0nPcUWU3s0j+0WTbflS2JccSjFqGUnb6Kt6/l2rJRkvXKaejAzXiJU1IAEo/QXl
	uTB81hVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAR9J-0000000HBrJ-3FWM;
	Mon, 11 Nov 2024 09:55:57 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQzh-0000000HA5w-38yh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 09:46:03 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-21116b187c4so33942295ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 01:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731318361; x=1731923161; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hnd0dMgn8pF5mC6ybOYdJ6wVojOcLARfVRQ6oD52meo=;
        b=ODpCPkSJo9PyF8HdZARR4Mt8gaQgY9rhzGslyS0ty8phjpRD48dCuxkhumeu2JuLNB
         jqGECbB2BUOnmNKJsgcDkF3LMmrBfgV2+mKGBLsU+0R97pDr5ZvsXCJMqMxed4n3n5Jw
         BL1P8ENJ9p4zr3Wtnvs+JkD/e4lXIHiFsozQqPZ6JWvje1e2zUS2HBCvAlvF0y7McM06
         A7bs/TecMSjfvHEh8LrwzjzmZswqeyqdVG4UZtnV2IBdf+KXkvm2syno9Oq+F2Dk+XrM
         q+mC9IgMKEoKkCewrWWiaV34OqsckLy2pONHv7NFRYu43TncLSb4hky/pMdez+Iu9OvW
         uyYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731318361; x=1731923161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hnd0dMgn8pF5mC6ybOYdJ6wVojOcLARfVRQ6oD52meo=;
        b=VVO+nejhf4dwbqGh1BVGkYE0wVKJ3YO06Y7u0SEDsZIJ/qVDVO8z9/6ZhHKdKRda+d
         ZHCp3VxU+dy1GBsOxHheBAv/Kt4l1CQFLCpdSeB1xRlC0vH0HtxjHPJJVAqME4LX4yNg
         5/bOq2BEK+gwBoA0IN/dOXOCq78PoCRecRBI+bytVZx0s3m+gqdE+owjZ5SH/vCnCnig
         24yJaZDkMvtbv3Gxs1ppFCXjNQs53BBcHFg5VQqcJyVsCcPtcEQ8OtvrBG2LzvhlPvEg
         e5TUyHZybih4E7FPydIuvdm7mm8BxPjHyqYeavXsKbv8KoZUv7De8e/lNFRhO7ztQZX5
         o3pg==
X-Forwarded-Encrypted: i=1; AJvYcCUX3QzizI47A5nCgX1fLNy9Zzv9XQyReUrZRxAmn6nKoam9Gj4t7fr3yNaJMk6CMUiHAKW2XKjFgn7fOuLH69v6@lists.infradead.org
X-Gm-Message-State: AOJu0Ywlok+1G4eCn4jqYOfi8oeqWQykLBRtJZlrCyWwjC0KPqyRriEw
	5EgnsBW7ON/7vcL6KjTYw05E7u8qoHWvQTTMi6PSB3YkZW/B9tlb
X-Google-Smtp-Source: AGHT+IHJPX81v+bCNaryh8mrbkn4Vw2k+4EN2NzDFSUrUCEELhKBfLTnc5EyUfjXpNmdcZ3GqJq0Xw==
X-Received: by 2002:a17:903:2347:b0:20b:b455:eb4f with SMTP id d9443c01a7336-21183d6eff4mr178322555ad.25.1731318360826;
        Mon, 11 Nov 2024 01:46:00 -0800 (PST)
Received: from peter-bmc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177dc826fsm72248725ad.11.2024.11.11.01.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 01:46:00 -0800 (PST)
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
Subject: [PATCH v1 3/5] ARM: dts: aspeed: Harma: Revise GPIO line name
Date: Mon, 11 Nov 2024 17:43:47 +0800
Message-Id: <20241111094349.2894060-4-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241111094349.2894060-1-peteryin.openbmc@gmail.com>
References: <20241111094349.2894060-1-peteryin.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_014601_810452_ACA75C69 
X-CRM114-Status: UNSURE (   9.84  )
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

  Add:
    "ac-power-button",
    "asic0-card-type-detection0-n"
    "asic0-card-type-detection1-n"
    "asic0-card-type-detection2-n"

    "cpu0-prochot-alert",
    "cpu0-thermtrip-alert",

    "irq-uv-detect-alert",
    "irq-hsc-alert",

    "uart-switch-button"
    "uart-switch-lsb"
    "uart-switch-msb"

    "leakage-detect-alert",

    "power-card-enable",
    "power-fault-n",
    "power-hsc-good",
    "power-chassis-good"
    "presence-post-card",
    "presence-cmm"
    "pvdd11-ocp-alert"

    "reset-control-cmos-clear"
    "reset-cause-pcie",
    "reset-cause-platrst",

    "P0_I3C_APML_ALERT_L",

  Rename:
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


