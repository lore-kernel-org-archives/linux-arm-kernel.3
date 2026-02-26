Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D3B7FCE08C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 14:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C5lmdRrYKAkps9LQDtVzFXDdak8+cj9tclXWqs/XbLs=; b=anLuLKzhMGfxEaYnMbrPXbps2o
	Fufh5/4EOQ7oCJ+qM8nIWjPZfpiqGuviIm9qN/gKKXmnz4bz+Jg9+Thjq+OMIj2pp0WnEvH4mCNyo
	pY43V0EXX4ozpX1FyMUE3uS3L+qbjsLA4/2tBY5hPXphtcz27RRsSBs8KZJ+wV0tgbbFIWKmnYcod
	ChcUplmuvAQk0Ib0VX0zhoKZmE79j7YmvasA6OGZ0HFPcngwIMW9WjMiupKSbQOXXnD/dG9RHccJ0
	lxLrtM2jLAecVzDJjr2G9Vh7hAvDeX4e+OjWdb/unzbJOLK1GCnfL6W+4fpMCtrCHDLtOOpYyoR3d
	/uJ1eSMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvc2r-00000006Hmg-0qFY;
	Thu, 26 Feb 2026 14:08:49 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvc2o-00000006Hm8-1Y7i
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 14:08:48 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2aaf59c4f7cso4131795ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 06:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772114925; x=1772719725; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C5lmdRrYKAkps9LQDtVzFXDdak8+cj9tclXWqs/XbLs=;
        b=cpBP554LjG39Sg+yKif5/t5p8IIOnau2luZiA4QGJEvtHtzj4/ybaFIaNeuYTCzpPq
         WB0mC1l81DmqK7kinCAuHLJC9m8eeXvP9JBEXzBJqE8rx+mt02VL+NPkEOaYb5iqXHE4
         VOUoDI3Hi08g8YpkEc/L3VIayYy6VZa+1TnbAdc2lj69BekL79ejviD0STQHSvlea1Mp
         9LG+ksBpNzN/9luX79erIxXca2KoU4B7BKqwJnL+Pwn6K4BmA5SQCbcjql8UnZquA5zX
         lEUKjcSFZs5C6N+6Jg2QWl1ue/Rja26nf+4NPh/nQP7vCVIxSXfBL8GtRiM1+kUDisbc
         D8/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772114925; x=1772719725;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C5lmdRrYKAkps9LQDtVzFXDdak8+cj9tclXWqs/XbLs=;
        b=IpDxLmiCi5R9NsCkTy4+eKopWvVMejR7q9btDaMqUZWSiaMBJWDRGLgrFcmgeogi//
         YNHIe3tnAwynRzypcBsAjgs/vyG+gxiNwZY2AaY+uHmfvgyjmnizoF7NLgpaYFV3IYkq
         aGy5YGhNl9geVmwOspz8MlacfLrxSKNTBBLGw91+PWVt1bGwUiaqDfNu983Yq2z03eQ3
         qLnPlkQK/WI6NzuHf8dOxvXTl9v/KPN8iAAu2CgIc4jtinmRZHLYnHSRBkGT/jQ+OIw/
         eE6Cirv3jDVizFx2pSpcJzyAM745r+p6//qyBLkKPlQXdoF1s614uog8yGPD/71jSfzl
         R7LA==
X-Forwarded-Encrypted: i=1; AJvYcCUebMJsMLiMHhKlHwYkvkz/MfKcuxINhcIM8W1wWYI6e65JFZ6W3amcog8TWCgJdTA/vCqQKnNwT+XJRE1M+YzF@lists.infradead.org
X-Gm-Message-State: AOJu0YzsWMz0AcwM6voampCoIRQvDSR/95a9iLi2haZSjo8y9JKFlVvE
	pGZmbYAFL0ieiaHy1ubv246sRgy4yLN8IS8VDxVaBwpd24ja8gQHG9O4
X-Gm-Gg: ATEYQzyt/UHX6g/ZcKBb7reX1BxqNPLgFS5ug+ME7XHigJbwXJunVxMaNXM2bOTG9uQ
	3RuGXd0xXumGEi1kOvovLqBP7edrkVj/NDukdMXFtKmJxIo6BSrtAMKRj0glSOoUW9pWYDaRBZR
	JvV0ecmvrcM2OQgnbKjb0R/j8juc6n3CesFiM7OrUqhO8f8UMiGpgjDqhQaV19bKxuXr+Xv4ws2
	nLTUVhmlo0ATT08KZy6mFP9DizAuzoqJJxMzX2QCiH7eHZz2DZi630OPKdKrzaz/kZ8wW8amiJj
	1dPDoSZ5czR5A/qBPEhOFSl1UMXEZS/q1sv5OVvJk4KAvXQ33Vzo6HqcJP5pGiJ6FV2ySvmVJZc
	XHYt7aOl9X5w8do2BOzCOVN9ZHdT/XStXMxQLFmhO3b3msWzchHoPqsM6vcf9GmicKaU5Kg7lGd
	Mv+FXTYQZZoI+k5y9Or4crYsVPXAui4Q==
X-Received: by 2002:a17:903:3848:b0:2ad:cede:3a1a with SMTP id d9443c01a7336-2ae03495f6fmr26068205ad.39.1772114924973;
        Thu, 26 Feb 2026 06:08:44 -0800 (PST)
Received: from [127.0.1.1] ([218.32.81.133])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6e190fsm28037205ad.82.2026.02.26.06.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 06:08:44 -0800 (PST)
From: Colin Huang <u8813345@gmail.com>
Date: Thu, 26 Feb 2026 22:08:16 +0800
Subject: [PATCH v2] ARM: dts: aspeed: anacapa: update SGPIO and PCA9555
 settings for DFT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-anacapa-dts-sgpio-v2-1-fd76828616b8@gmail.com>
X-B4-Tracking: v=1; b=H4sIAM9ToGkC/32NQQqDMBBFryKz7pSY1lq68h7FxSQZ40A1IRFpE
 e/e1AN08+F9+O9vkDkJZ3hUGyReJUuYC+hTBXak2TOKKwxa6ZsqgTSTpUjolozZRwnIV1aGGqu
 ta6DsYuJB3ofz2RceJS8hfY6Ltf61/2xrjTXShVqjjLq3g+r8RPI62zBBv+/7F9hMW2SyAAAA
X-Change-ID: 20260202-anacapa-dts-sgpio-e4e0ba5c2cd5
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Colin.Huang2@amd.com, Carl.Lee@amd.com, Peter.Shen@amd.com, 
 Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772114922; l=8780;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=zOozJ3zv4ZVEOtjpoT9fTG9xriUnw/ZReMGwbHGkXqE=;
 b=FPqErmaXHAqA92QS3zYhsA6YIjvUzR/2fJt5KhjFcR9qgDGYtiJvJlo2Zi02Xg35kWutD0MEo
 cF5byFwicGlD1gJ+XHDQlwjR+iLQFU6GKETWF86db6p6IBdbtgflcHl
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_060846_431187_1C170B1E 
X-CRM114-Status: GOOD (  13.07  )
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

This update adjusts SGPIO mappings and enables interrupt support for the
PCA9555 GPIO expanders. These changes are required as part of the DFT
(Design For Tooling) integration and are aligned with the SGPIO signal
definitions provided in Helios_SGPIO_BIT_MAP.xlsx (rev: 2026-02-16).

Updates include:
- Add interrupt-parent and interrupts properties to PCA9555 nodes to
  enable proper interrupt handling required by phosphor-gpio-monitor.
- Correct placement of LEAK_DETECT_RMC_N.
- Update SGPIO line-name mappings per the latest Helios SGPIO bit map to
  reflect leakage channels, presence pins, module power-good, and other
  DFT-related monitoring signals.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
Update SGPIO line names for the Facebook Anacapa platform and enable
interrupt support for PCA9555 GPIO expanders. These changes are part of
DFT (Design For Tooling) integration and align the device tree with the
latest SGPIO bit mapping used during board validation.

The updates are based on: Helios_SGPIO_BIT_MAP.xlsx (rev: 2026-02-16).

The following changes are included:
- Add BMC_AINIC0_WP_R2_L and BMC_AINIC1_WP_R2_L
- Correct placement of LEAK_DETECT_RMC_N
- Add PRSNT_NFC_BOARD_R
- Add IRQ_NFC_BOARD_R and RSMRST_N
- Add DC_OFF, EAM_MOD_PWR_GD_TIMEOUT, CPLD_AMC_STBY_PWR_EN
- Add FM_MAIN_PWREN_RMC_EN_ISO
---
Changes in v2:
- Add interrupt-parent and interrupts properties to PCA9555 nodes to
  enable proper interrupt handling required by phosphor-gpio-monitor.
- Clarify DFT motivation in the commit message and mention the source
  mapping (Helios_SGPIO_BIT_MAP.xlsx rev: 2026-02-16).
- Minor wording cleanups in the commit message (line names vs. mappings).
- Rebase onto the latest tree to account for intervening commits.
- Link to v1: https://lore.kernel.org/r/20260202-anacapa-dts-sgpio-v1-1-a3a7b0b087f0@gmail.com
---
 .../dts/aspeed/aspeed-bmc-facebook-anacapa.dts     | 147 ++++++++++++---------
 1 file changed, 88 insertions(+), 59 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
index 2cb7bd128d24..aa53ae8eb61f 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
@@ -500,6 +500,9 @@ gpio@24 {
 				gpio-controller;
 				#gpio-cells = <2>;
 
+				interrupt-parent = <&sgpiom0>;
+				interrupts = <174 IRQ_TYPE_LEVEL_LOW>;
+
 				gpio-line-names =
 					"RPDB_EAM2_PRSNT_MOS_N_R", "RPDB_EAM3_PRSNT_MOS_N_R",
 					"RPDB_PWRGD_P50V_HSC4_SYS_R",
@@ -546,6 +549,9 @@ gpio@24 {
 				gpio-controller;
 				#gpio-cells = <2>;
 
+				interrupt-parent = <&sgpiom0>;
+				interrupts = <174 IRQ_TYPE_LEVEL_LOW>;
+
 				gpio-line-names =
 					"LPDB_P50V_FAN1_R2_PG","LPDB_P50V_FAN2_R2_PG",
 					"LPDB_P50V_FAN3_R2_PG","LPDB_P50V_FAN4_R2_PG",
@@ -864,87 +870,104 @@ &sgpiom0 {
 	gpio-line-names =
 	/*in - out - in - out */
 	/* A0-A7 line 0-15 */
-	"", "FM_CPU0_SYS_RESET_N", "", "CPU0_KBRST_N",
-	"", "FM_CPU0_PROCHOT_trigger_N", "", "FM_CLR_CMOS_R_P0",
-	"", "Force_I3C_SEL", "", "SYSTEM_Force_Run_AC_Cycle",
-	"", "", "", "",
+	"L_FNIC_FLT", "FM_CPU0_SYS_RESET_N",
+	"L_BNIC0_FLT", "CPU0_KBRST_N",
+	"L_BNIC1_FLT", "FM_CPU0_PROCHOT_trigger_N",
+	"L_BNIC2_FLT", "FM_CLR_CMOS_R_P0",
+	"L_BNIC3_FLT", "Force_I3C_SEL",
+	"L_RTM_SW_FLT", "SYSTEM_Force_Run_AC_Cycle",
+	"", "",
+	"", "",
 
 	/* B0-B7 line 16-31 */
 	"Channel0_leakage_EAM3", "FM_CPU_FPGA_JTAG_MUX_SEL",
 	"Channel1_leakage_EAM0", "FM_SCM_JTAG_MUX_SEL",
 	"Channel2_leakage_Manifold1", "FM_BRIDGE_JTAG_MUX_SEL",
 	"Channel3_leakage", "FM_CPU0_NMI_SYNC_FLOOD_N",
-	"Channel4_leakage_Manifold2", "",
-	"Channel5_leakage_EAM1", "",
-	"Channel6_leakage_CPU_DIMM", "",
-	"Channel7_leakage_EAM2", "",
+	"Channel4_leakage_Manifold2", "BMC_AINIC0_WP_R2_L",
+	"Channel5_leakage_EAM1", "BMC_AINIC1_WP_R2_L",
+	"Channel6_leakage_CPU_DIMM", "CPLD_BUF_R_AGPIO330",
+	"Channel7_leakage_EAM2", "CPLD_BUF_R_AGPIO331",
 
 	/* C0-C7 line 32-47 */
-	"RSVD_RMC_GPIO3", "", "", "",
-	"", "", "", "",
-	"LEAK_DETECT_RMC_N", "", "", "",
-	"", "", "", "",
+	"RSVD_RMC_GPIO3", "RTM_MUX_L",
+	"LEAK_DETECT_RMC_N", "RTM_MUX_R",
+	"HDR_P0_NMI_BTN_BUF_R_N", "",
+	"No_Leak_Sensor_flag", "",
+	"", "",
+	"", "",
+	"", "",
+	"", "",
 
 	/* D0-D7 line 48-63 */
-	"PWRGD_PDB_EAMHSC0_CPLD_PG_R", "",
-	"PWRGD_PDB_EAMHSC1_CPLD_PG_R", "",
-	"PWRGD_PDB_EAMHSC2_CPLD_PG_R", "",
-	"PWRGD_PDB_EAMHSC3_CPLD_PG_R", "",
-	"AMC_BRD_PRSNT_CPLD_L", "", "", "",
-	"", "", "", "",
+	"PWRGD_CHAD_CPU0_FPGA", "",
+	"PWRGD_CHEH_CPU0_FPGA", "",
+	"PWRGD_CHIL_CPU0_FPGA", "",
+	"PWRGD_CHMP_CPU0_FPGA", "",
+	"AMC_BRD_PRSNT_CPLD_L", "",
+	"", "",
+	"", "",
+	"", "",
 
 	/* E0-E7 line 64-79 */
-	"AMC_PDB_EAMHSC0_CPLD_EN_R", "",
-	"AMC_PDB_EAMHSC1_CPLD_EN_R", "",
-	"AMC_PDB_EAMHSC2_CPLD_EN_R", "",
-	"AMC_PDB_EAMHSC3_CPLD_EN_R", "",
-	"", "", "", "",
-	"", "", "", "",
+	"L_PRSNT_B_FENIC_R2_N", "",
+	"L_PRSNT_B_BENIC0_R2_N", "",
+	"L_PRSNT_B_BENIC1_R2_N", "",
+	"L_PRSNT_B_BENIC2_R2_N", "",
+	"L_PRSNT_B_BENIC3_R2_N", "",
+	"", "",
+	"", "",
+	"", "",
 
 	/* F0-F7 line 80-95 */
-	"PWRGD_PVDDCR_CPU1_P0", "SGPIO_READY",
-	"PWRGD_PVDDCR_CPU0_P0", "",
-	"", "", "", "",
-	"", "", "", "",
+	"R_PRSNT_B_FENIC_R2_N", "SGPIO_READY",
+	"R_PRSNT_B_BENIC0_R2_N", "",
+	"R_PRSNT_B_BENIC1_R2_N", "",
+	"R_PRSNT_B_BENIC2_R2_N", "",
+	"R_PRSNT_B_BENIC3_R2_N", "",
+	"", "",
+	"", "",
+	"", "",
 
 	/* G0-G7 line 96-111 */
-	"PWRGD_PVDDCR_SOC_P0", "",
-	"PWRGD_PVDDIO_P0", "",
-	"PWRGD_PVDDIO_MEM_S3_P0", "",
-	"PWRGD_CHMP_CPU0_FPGA", "",
-	"PWRGD_CHIL_CPU0_FPGA", "",
-	"PWRGD_CHEH_CPU0_FPGA", "",
-	"PWRGD_CHAD_CPU0_FPGA", "FM_BMC_READY_PLD",
+	"L_PRSNT_EDSFF2_N", "",
+	"L_PRSNT_EDSFF3_N", "",
+	"R_PRSNT_EDSFF2_N", "",
+	"R_PRSNT_EDSFF3_N", "",
+	"", "",
+	"", "",
 	"", "",
+	"PRSNT_NFC_BOARD_R", "",
 
 	/* H0-H7 line 112-127 */
-	"PWRGD_P3V3", "",
-	"P12V_DDR_IP_PWRGD_R", "",
-	"P12V_DDR_AH_PWRGD_R", "",
-	"PWRGD_P12V_VRM1_CPLD_PG_R", "",
-	"PWRGD_P12V_VRM0_CPLD_PG_R", "",
-	"PWRGD_PDB_HSC4_CPLD_PG_R", "",
-	"PWRGD_PVDD18_S5_P0_PG", "",
-	"PWRGD_PVDD33_S5_P0_PG", "",
+	"R_FNIC_FLT", "",
+	"R_BNIC0_FLT", "",
+	"R_BNIC1_FLT", "",
+	"R_BNIC2_FLT", "",
+	"R_BNIC3_FLT", "",
+	"R_RTM_SW_FLT", "",
+	"", "",
+	"", "",
 
 	/* I0-I7 line 128-143 */
 	"EAM0_BRD_PRSNT_R_L", "",
 	"EAM1_BRD_PRSNT_R_L", "",
 	"EAM2_BRD_PRSNT_R_L", "",
 	"EAM3_BRD_PRSNT_R_L", "",
-	"EAM0_CPU_MOD_PWR_GD_R", "",
-	"EAM1_CPU_MOD_PWR_GD_R", "",
-	"EAM2_CPU_MOD_PWR_GD_R", "",
-	"EAM3_CPU_MOD_PWR_GD_R", "",
+	"FM_TPM_PRSNT_R_N", "",
+	"PDB_PRSNT_R_N", "",
+	"PRSNT_EDSFF0_N", "",
+	"PRSNT_CPU0_N", "",
 
 	/* J0-J7 line 144-159 */
-	"PRSNT_L_BIRDGE_R", "",
-	"PRSNT_R_BIRDGE_R", "",
+	"PRSNT_L_BRIDGE_R", "",
+	"PRSNT_R_BRIDGE_R", "",
 	"BRIDGE_L_MAIN_PG_R", "",
 	"BRIDGE_R_MAIN_PG_R", "",
 	"BRIDGE_L_STBY_PG_R", "",
 	"BRIDGE_R_STBY_PG_R", "",
-	"", "", "", "",
+	"IRQ_NFC_BOARD_R", "",
+	"RSMRST_N", "",
 
 	/* K0-K7 line 160-175 */
 	"ADC_I2C_ALERT_N", "",
@@ -957,10 +980,14 @@ &sgpiom0 {
 	"PDB_ALERT_R_N", "",
 
 	/* L0-L7 line 176-191 */
-	"CPU0_SP7R1", "", "CPU0_SP7R2", "",
-	"CPU0_SP7R3", "", "CPU0_SP7R4", "",
-	"CPU0_CORETYPE0", "", "CPU0_CORETYPE1", "",
-	"CPU0_CORETYPE2", "", "FM_BIOS_POST_CMPLT_R_N", "",
+	"CPU0_SP7R1", "",
+	"CPU0_SP7R2", "",
+	"CPU0_SP7R3", "",
+	"CPU0_SP7R4", "",
+	"CPU0_CORETYPE0", "",
+	"CPU0_CORETYPE1", "",
+	"CPU0_CORETYPE2", "",
+	"FM_BIOS_POST_CMPLT_R_N", "",
 
 	/* M0-M7 line 192-207 */
 	"EAM0_SMERR_CPLD_R_L", "",
@@ -978,17 +1005,19 @@ &sgpiom0 {
 	"AMC_STBY_PGOOD_R", "",
 	"CPU_AMC_SLP_S5_R_L", "",
 	"AMC_CPU_EAMPG_R", "",
-	"", "", "", "",
+	"DIMM_PMIC_PG_TIMEOUT", "",
+	"EAM_MOD_PWR_GD_TIMEOUT", "",
+	"CPLD_AMC_STBY_PWR_EN", "",
 
 	/* O0-O7 line 224-239 */
 	"HPM_PWR_FAIL", "Port80_b0",
 	"FM_DIMM_IP_FAIL", "Port80_b1",
 	"FM_DIMM_AH_FAIL", "Port80_b2",
 	"HPM_AMC_THERMTRIP_R_L", "Port80_b3",
-	"FM_CPU0_THERMTRIP_N", "Port80_b4",
+	"cpu_thermtrip_detect", "Port80_b4",
 	"PVDDCR_SOC_P0_OCP_L", "Port80_b5",
 	"CPLD_SGPIO_RDY", "Port80_b6",
-	"", "Port80_b7",
+	"FM_MAIN_PWREN_RMC_EN_ISO", "Port80_b7",
 
 	/* P0-P7 line 240-255 */
 	"CPU0_SLP_S5_N_R", "NFC_VEN",
@@ -997,8 +1026,8 @@ &sgpiom0 {
 	"PWRGD_RMC", "",
 	"FM_RST_CPU0_RESET_N", "",
 	"FM_PWRGD_CPU0_PWROK", "",
-	"wS5_PWR_Ready", "",
-	"wS0_ON_N", "PWRGD_P1V0_AUX";
+	"AMC_FAIL", "",
+	"wS0_ON_N", "";
 	status = "okay";
 };
 

---
base-commit: 710dbb13377c80a6e39ef049a517665841e3221e
change-id: 20260202-anacapa-dts-sgpio-e4e0ba5c2cd5

Best regards,
-- 
Colin Huang <u8813345@gmail.com>


