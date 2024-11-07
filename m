Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE595D4335A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 12:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kNEGN+X9jsQkgFs6oV9OB2bKgz2zTu7nBPwDRCmjXSM=; b=G7xlY7byumh+UVmmlQ3B8QXWEF
	5IO5kW/YIfGDf8FgqCJBC1UMXzhi+YqDlFc5tnBNKbjMpH3//5ZkOv3beyPji9P2LPJECInk/5Uff
	FiIy/ue0Tydyt27IbwFeLgRsY+gK5Eoa1jG1J84OO5/IrrN5gBT1Vov3XDzKntwy0HqEDc9XRR8tw
	wyMS1xBqbA3LT0oe8ZOsqZrPevqeQ8lMrBG1c/uW04kdPTWwwru8NJN3SCkzIqUc8tTVXv1TDeskb
	FSbkar3zccDkm5UA+/VGAevlQbjJQcAFIhgYBAPwz+0pG2CAzTRjDZbv0rvhWDqpNsqPnqhl5BD4K
	6jyMdSCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t91tg-00000006yfN-07aM;
	Thu, 07 Nov 2024 12:46:00 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t91qC-00000006xxL-1sZW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 12:42:25 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2114214c63eso7329255ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 04:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730983343; x=1731588143; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kNEGN+X9jsQkgFs6oV9OB2bKgz2zTu7nBPwDRCmjXSM=;
        b=iFoSZW4VYAnDeSB+nhryQeqOJhIw86G82EyST7t30S1aNaUrNY1ZM+mutUzCy6Cgmu
         9kK15w+stzVhU00mhabrB3tuL05gYIZaYjcofp7vjSRhqADq/K4TasZRYVkixhub4qOt
         T4xJSA1JEDJBWV1EaEOUt/sOXRmhwuHg5JTcDEJyleB+TZaspHf8eNJ+I/bdlYB6Bq50
         iAfK6Hk7ARR4iJ0BnlMCuoMM1K479RupcsySi92nfd84WHirNuyW0Lvr/pLkLF0L67P3
         lj1dTv45ZeB81Md9HAvwkfvu/BGEaAbvqbXl7kHRwsquR2aK3E1M1HGaV2JI4fqxhnGH
         CImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730983343; x=1731588143;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kNEGN+X9jsQkgFs6oV9OB2bKgz2zTu7nBPwDRCmjXSM=;
        b=lwSg763dgLK9CPy3XH7LkaqpkhZia+fMGEMfLPhO16GERneNFtYmS5zrnZg2RBiNKY
         F+UbkAlvpKZUfBBUuLKgq3v2rd5PeJH54tHDtl8dEYXZIPYvcgeuA+PD/rU1rDXLIJeZ
         jcTTXBOHlWU8MmJhXh7KFoX9hU6wiS/F/Cvy71OV79mjJeoNOm592XXlNj6/CvmUZzVE
         2sKRjq8sGE/U+LxbbKImahfGSiUcQegxVLGpZ0IZebfcXQFPZJKOPCOikC4ETMx3WVEn
         8uep5qCmi69a5y4Kg+Lk1B2iriw5D5/SjZD/LlOVVcrx3bYyseStZ6ds37sKRr2/yho4
         99/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVHNbNWQvofOKmV1FEDtdYRw1o2kZHa12YYBGZWRooaBrUyyUDhxpG8/krZXdSFE9ycNP3BnV0XRvEGEM7X5f8Y@lists.infradead.org
X-Gm-Message-State: AOJu0YwO17s42zpnPLKx8aP9BUsNnF65mgK6yXiMJihD9qL/gjlZldpz
	4EbsgLZP3O6R8yWoDGDHTyZoJhzy44fzH+a/ydjQWhYvvO6Zu2XY
X-Google-Smtp-Source: AGHT+IHw/mIi4fwHrLjEvutGISRpw2hBcjcLrIxv45YZ6jpB08x+XFdXcXJdJpfX20IYT1A5uLofKw==
X-Received: by 2002:a17:902:f712:b0:20c:9821:6998 with SMTP id d9443c01a7336-210c6872732mr605679035ad.10.1730983343366;
        Thu, 07 Nov 2024 04:42:23 -0800 (PST)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e412d8sm11101975ad.113.2024.11.07.04.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 04:42:23 -0800 (PST)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Thu, 07 Nov 2024 20:39:57 +0800
Subject: [PATCH v2 1/2] ARM: dts: aspeed: catalina: update pdb board cpld
 ioexp linename
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241107-catalina-cpld-ioexp-update-v2-1-d7742eabc0e6@gmail.com>
References: <20241107-catalina-cpld-ioexp-update-v2-0-d7742eabc0e6@gmail.com>
In-Reply-To: <20241107-catalina-cpld-ioexp-update-v2-0-d7742eabc0e6@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Potin Lai <potin.lai@quantatw.com>, Cosmo Chou <cosmo.chou@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730983338; l=5178;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=1KzXfE/phY4WB98wge7x+4YWA7p6w9FVqaeKow5FPSk=;
 b=NF2Z2IzMN510NJ9FefMB9c/twk4An6ui3Mq83g5ytYdN4WzcYsXz5D1tHkzQGQH4nG7H2tVKS
 BkJ8NKmke4PBLoCY8hubUHyq1XcrWFhs2T3JsdPHSGAkXsLMx+wEVj7
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_044224_526257_6DCF9D99 
X-CRM114-Status: GOOD (  11.01  )
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

Due to there are huge changes of PDB CPLD IOEXP pin definitions since
DVT version, Update the CPLD IOEXP nodes and GPIO linename of each PDB
CPLD IO expander based on latest DVT CPLD firmware.

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


