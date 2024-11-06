Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCBACD29FBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 09:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gkHWyYIKfFDhAZ5vn6/ZhGd9wV02p4FQmn3m/eJ5Tsc=; b=O45Y+V6b1xd9UYa0ZnjCL7eXhH
	NXrPuIniaEqb5k6upqlYsjCTDMDaCyftxzTubJ6bL82ziJrdbUUWZtcVbZaRg8eMJ+xNYBQ5wda+J
	qzQcQI9DWmD+jUjgQD2KycStvD62V6qHESFDI7uRNmv3vGCBUUGVFDxPBNoW+FtesSAa5QVzBmuBe
	W91CFmlbe6EDCWXjM1Yrsf4yGw9Fp17WLA/5e1NHUouoZ8sL2kHTqIGsmZDbZycocXsMsJNnPknqn
	IOaOjfjXCbeb2A0tL3KaiXeCbxgU7g83B+FkZtsiwHj9LuVstrTGKZwTJ8YZH8raZTDTtvnRSCunU
	zichH2kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8c0X-00000002Pk7-0juP;
	Wed, 06 Nov 2024 09:07:21 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8buq-00000002O6S-2hR4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 09:01:29 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2110a622d76so49250785ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 01:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730883687; x=1731488487; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gkHWyYIKfFDhAZ5vn6/ZhGd9wV02p4FQmn3m/eJ5Tsc=;
        b=EnZPAqi/fAW8P6AbpBUbdb9+SkaSlSt6GUu2bI5UPjWsfJoAlyQa4Yd0XwHy54wz6V
         QbsXc+faEAL7NFjp/cp+wn1M/WuyRADZ8TiCOM3/xRJCAeBmIwtAoflYEj+WKVSKvLec
         Cgg356P8QQ4C3MKBfgfZTgB9ah2ueyjw8FqnipnQrYsUIiqPOuFGEuVYYED+N6V7Sr8t
         LpGZpw8QMqdIrnZaYD6l5diw55Jj6ttmJK++6ysMGfiY96jzvW8c0vaocQvISVy6Ukfh
         qGSmwKPhUyCIdjAVZXpme/L7BobJwPrIw+QiVSmRv7zSJtORYdh6E007E2rdh4PaZyhx
         D9uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730883687; x=1731488487;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gkHWyYIKfFDhAZ5vn6/ZhGd9wV02p4FQmn3m/eJ5Tsc=;
        b=eyUY3VAf+xGCYx/z/HboS7ZV/7GuPPpO+lfcEZToyj0ddlQv7G7eeESCP60zLwq2Px
         Szo3Nl0DNi9m6DwjiKXpHlwjld+SrFxOkd+nZL2loWA4s3hr4psSg4KmpNtGtRUS3ZhV
         oGDpTqYZ1DMoWSV7j6j43en7cPnYc7DfMoRxK3zEw6LadmJKlbEEQmR+0g7AjKRjR1Cm
         JD1acWGNkNfBjq9rhBQORFRrtfb63Rg1/A3FMXmU4qGtQ4cgVNg9e2XNXZ98PpdmvMqj
         RUUv+oHrGLQtSyLzY5JEHp4B2bIdeH1h4JnMxcN3JUXO6A+hWmirpWDPAnHoYkF3Mt02
         ViVw==
X-Forwarded-Encrypted: i=1; AJvYcCWDBvsoRQ2JZ4B4xRLB3oOVCzeitH1wqYNyoLyin12j2/5u9pEaWK31n5XECDTBLx71w79KnKh8p8/Jvc44p6nR@lists.infradead.org
X-Gm-Message-State: AOJu0Yynagoi0GCTNPrZcgWa5G9KLeyb1AGoi1N3J2lfR+N3UwmJsoCy
	fiGK4EJNmCkPOj6m22HnZCX2BvKnpvbw7r2GylWdo1XB5GSA3Crg9EWClQ==
X-Google-Smtp-Source: AGHT+IHkffsRtd6EA2zoMDxncdUpDGCX04PghiP3RUmDMHfbnoPeC+5oXmEJ9X6fEookxlW1OKhnOg==
X-Received: by 2002:a17:902:db0f:b0:20c:9c09:8280 with SMTP id d9443c01a7336-210c6cc207amr494628845ad.54.1730883687187;
        Wed, 06 Nov 2024 01:01:27 -0800 (PST)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057d380fsm91317665ad.240.2024.11.06.01.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 01:01:26 -0800 (PST)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Wed, 06 Nov 2024 16:58:51 +0800
Subject: [PATCH 1/2] ARM: dts: aspeed: catalina: update pdb board cpld
 ioexp linename
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241106-catalina-cpld-ioexp-update-v1-1-3437bcfcb608@gmail.com>
References: <20241106-catalina-cpld-ioexp-update-v1-0-3437bcfcb608@gmail.com>
In-Reply-To: <20241106-catalina-cpld-ioexp-update-v1-0-3437bcfcb608@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Potin Lai <potin.lai@quantatw.com>, Cosmo Chou <cosmo.chou@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730883681; l=5069;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=nyuZFMsNp/CjM9UzYTg0cqEV/NdG/xPxUypZLXNSJj8=;
 b=Ze0ie0kcmnjxo/e5uJQYgqpRrMIjUT1WXgfcU6c8AqMXDe68EhULrw20/M9OKtdFRqbSHmuKZ
 nsLJsIq2guHAK5hSFXmN0DT4nM77oThw4ZITq853Oe8pam8MrMEQ4I0
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_010128_719390_5968DE26 
X-CRM114-Status: GOOD (  11.15  )
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

Update the GPIO linename of each PDB CPLD IO expander based on latest
CPLD firmware.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-catalina.dts    | 99 +++++++---------------
 1 file changed, 29 insertions(+), 70 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
index 82835e96317d..10a9fca1b803 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
@@ -802,26 +802,6 @@ io_expander12: gpio@13 {
 		gpio-controller;
 		#gpio-cells = <2>;
 	};
-
-	// PDB CPLD IOEXP 0x14
-	io_expander13: gpio@14 {
-		compatible = "nxp,pca9555";
-		interrupt-parent = <&gpio0>;
-		interrupts = <ASPEED_GPIO(I, 6) IRQ_TYPE_LEVEL_LOW>;
-		reg = <0x14>;
-		gpio-controller;
-		#gpio-cells = <2>;
-	};
-
-	// PDB CPLD IOEXP 0x15
-	io_expander14: gpio@15 {
-		compatible = "nxp,pca9555";
-		interrupt-parent = <&gpio0>;
-		interrupts = <ASPEED_GPIO(I, 6) IRQ_TYPE_LEVEL_LOW>;
-		reg = <0x15>;
-		gpio-controller;
-		#gpio-cells = <2>;
-	};
 };
 
 &i2c15 {
@@ -1040,71 +1020,50 @@ &io_expander8 {
 
 &io_expander9 {
 	gpio-line-names =
-		"LEAK3_DETECT_R","LEAK1_DETECT_R",
-		"LEAK2_DETECT_R","LEAK0_DETECT_R",
-		"CHASSIS3_LEAK_Q_N_PLD","CHASSIS1_LEAK_Q_N_PLD",
-		"CHASSIS2_LEAK_Q_N_PLD","CHASSIS0_LEAK_Q_N_PLD",
-		"P12V_AUX_FAN_ALERT_PLD_N","P12V_AUX_FAN_OC_PLD_N",
-		"P12V_AUX_FAN_FAULT_PLD_N","LEAK_DETECT_RMC_N_R",
-		"RSVD_RMC_GPIO3_R","SMB_RJ45_FIO_TMP_ALERT",
-		"","";
+		"wSequence_Latch_State_N","wP12V_N1N2_RUNTIME_FLT_N",
+		"wP12V_FAN_RUNTIME_FLT_N","wP12V_AUX_RUNTIME_FLT_N",
+		"wHost_PERST_SEQPWR_FLT_N","wP12V_N1N2_SEQPWR_FLT_N",
+		"wP12V_FAN_SEQPWR_FLT_N","wP12V_AUX_SEQPWR_FLT_N",
+		"wP12V_RUNTIME_FLT_NIC1_N","wAUX_RUNTIME_FLT_NIC1_N",
+		"wP12V_SEQPWR_FLT_NIC1_N","wAUX_SEQPWR_FLT_NIC1_N",
+		"wP12V_RUNTIME_FLT_NIC0_N","wAUX_RUNTIME_FLT_NIC0_N",
+		"wP12V_SEQPWR_FLT_NIC0_N","wAUX_SEQPWR_FLT_NIC0_N";
 };
 
 &io_expander10 {
 	gpio-line-names =
 		"FM_P12V_NIC1_FLTB_R_N","FM_P3V3_NIC1_FAULT_R_N",
-		"OCP_V3_2_PWRBRK_FROM_HOST_ISO_PLD_N",
-		"P12V_AUX_NIC1_SENSE_ALERT_R_N",
 		"FM_P12V_NIC0_FLTB_R_N","FM_P3V3_NIC0_FAULT_R_N",
-		"OCP_SFF_PWRBRK_FROM_HOST_ISO_PLD_N",
-		"P12V_AUX_NIC0_SENSE_ALERT_R_N",
+		"P48V_HS2_FAULT_N_PLD","P48V_HS1_FAULT_N_PLD",
+		"P12V_AUX_FAN_OC_PLD_N","P12V_AUX_FAN_FAULT_PLD_N",
+		"","",
+		"","",
+		"","FM_SYS_THROTTLE_N",
+		"OCP_V3_2_PWRBRK_FROM_HOST_ISO_PLD_N",
+		"OCP_SFF_PWRBRK_FROM_HOST_ISO_PLD_N";
+};
+
+&io_expander11 {
+	gpio-line-names =
 		"P12V_AUX_PSU_SMB_ALERT_R_L","P12V_SCM_SENSE_ALERT_R_N",
+		"P12V_AUX_NIC1_SENSE_ALERT_R_N","P12V_AUX_NIC0_SENSE_ALERT_R_N",
 		"NODEB_PSU_SMB_ALERT_R_L","NODEA_PSU_SMB_ALERT_R_L",
-		"P52V_SENSE_ALERT_PLD_N","P48V_HS2_FAULT_N_PLD",
-		"P48V_HS1_FAULT_N_PLD","";
+		"P12V_AUX_FAN_ALERT_PLD_N","P52V_SENSE_ALERT_PLD_N",
+		"PRSNT_RJ45_FIO_N_R","FM_MAIN_PWREN_RMC_EN_ISO_R",
+		"CHASSIS3_LEAK_Q_N_PLD","CHASSIS2_LEAK_Q_N_PLD",
+		"CHASSIS1_LEAK_Q_N_PLD","CHASSIS0_LEAK_Q_N_PLD",
+		"","SMB_RJ45_FIO_TMP_ALERT";
 };
 
-&io_expander11 {
+&io_expander12 {
 	gpio-line-names =
 		"FAN_7_PRESENT_N","FAN_6_PRESENT_N",
 		"FAN_5_PRESENT_N","FAN_4_PRESENT_N",
 		"FAN_3_PRESENT_N","FAN_2_PRESENT_N",
 		"FAN_1_PRESENT_N","FAN_0_PRESENT_N",
-		"PRSNT_CHASSIS3_LEAK_CABLE_R_N","PRSNT_CHASSIS1_LEAK_CABLE_R_N",
-		"PRSNT_CHASSIS2_LEAK_CABLE_R_N","PRSNT_CHASSIS0_LEAK_CABLE_R_N",
-		"PRSNT_RJ45_FIO_N_R","PRSNT_HDDBD_POWER_CABLE_N",
-		"PRSNT_OSFP_POWER_CABLE_N","";
-};
-
-&io_expander12 {
-	gpio-line-names =
-		"RST_OCP_V3_1_R_N","NIC0_PERST_N",
-		"OCP_SFF_PERST_FROM_HOST_ISO_PLD_N","OCP_SFF_MAIN_PWR_EN",
-		"FM_OCP_SFF_PWR_GOOD_PLD","OCP_SFF_AUX_PWR_PLD_EN_R",
-		"HP_LVC3_OCP_V3_1_PWRGD_PLD","HP_OCP_V3_1_HSC_PWRGD_PLD_R",
-		"RST_OCP_V3_2_R_N","NIC1_PERST_N",
-		"OCP_V3_2_PERST_FROM_HOST_ISO_PLD_N","OCP_V3_2_MAIN_PWR_EN",
-		"FM_OCP_V3_2_PWR_GOOD_PLD","OCP_V3_2_AUX_PWR_PLD_EN_R",
-		"HP_LVC3_OCP_V3_2_PWRGD_PLD","HP_OCP_V3_2_HSC_PWRGD_PLD_R";
-};
-
-&io_expander13 {
-	gpio-line-names =
-		"NODEA_NODEB_PWOK_PLD_ISO_R","PWR_EN_NICS",
-		"PWRGD_P12V_AUX_FAN_PLD","P12V_AUX_FAN_EN_PLD",
-		"PWRGD_P3V3_AUX_PLD","PWRGD_P12V_AUX_PLD_ISO_R",
-		"FM_MAIN_PWREN_FROM_RMC_R","FM_MAIN_PWREN_RMC_EN_ISO_R",
-		"PWRGD_RMC_R","PWRGD_P12V_AUX_FAN_PLD",
-		"P12V_AUX_FAN_EN_PLD","FM_SYS_THROTTLE_N",
 		"HP_LVC3_OCP_V3_2_PRSNT2_PLD_N","HP_LVC3_OCP_V3_1_PRSNT2_PLD_N",
-		"","";
+		"PRSNT_HDDBD_POWER_CABLE_N","PRSNT_OSFP0_POWER_CABLE_N",
+		"PRSNT_CHASSIS3_LEAK_CABLE_R_N","PRSNT_CHASSIS2_LEAK_CABLE_R_N",
+		"PRSNT_CHASSIS1_LEAK_CABLE_R_N","PRSNT_CHASSIS0_LEAK_CABLE_R_N";
 };
 
-&io_expander14 {
-	gpio-line-names =
-		"","","","","","","","",
-		"FM_BOARD_BMC_SKU_ID3","FM_BOARD_BMC_SKU_ID2",
-		"FM_BOARD_BMC_SKU_ID1","FM_BOARD_BMC_SKU_ID0",
-		"FAB_BMC_REV_ID2","FAB_BMC_REV_ID1",
-		"FAB_BMC_REV_ID0","";
-};

-- 
2.31.1


