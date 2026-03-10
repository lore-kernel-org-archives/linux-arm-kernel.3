Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8B7F3C27D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 09:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JRV4bgMFvwTiPj1crtu8ZWYHwIXJvbIRCeZGSRG6JB8=; b=058ve8cu4+leM1I8yy3qCNLPnE
	k17R49i+//9dpTxAhLFQ8p9cvQuK0YaIjI2DAkmiA5DhNtGyTgHt26ovI1lr3w0+kMwfE9oIqUpXe
	qiOAUG4JVqDmycnly5x57O3sbjG38aTJUOwWiW+PjwM9qjmYGVhNvpeAqiN2jawT3RfhARl4vW9Nr
	Hm1e2mNc2PSlM5uRjGdef6pS4IabAmLv+5bJn9utyGKaL24v92dXKbkYVaxYpsbY1bWcgAtBhJSP5
	nA+/Ia841Mu2dsBO8dkxkCDoiqm78oLzGgZyM7irsfOleqZeBleBjSwNzwE1UsC5cPMyqTxe0AK7T
	dcJ4XCGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztit-000000098CS-2ZWp;
	Tue, 10 Mar 2026 09:49:55 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztir-000000098B9-20N0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 09:49:54 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2ae505619baso55434215ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 02:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773136193; x=1773740993; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JRV4bgMFvwTiPj1crtu8ZWYHwIXJvbIRCeZGSRG6JB8=;
        b=JgVTgvkVPQiliNH31L5zch2i6b7LXnmWvaoxgaf/eW2vYoTpeZ81MjEcQjWUqaAjQt
         GVSH/1+AcyS2nomzlwnt4LhpNMPwZBFk28tslXgg79qUTy0UuLS0wo7pRgEC9AFcPQTq
         yOTkg7yvjjFcEPE4+DNQk5CmJOuXiaeNyiKNMx5mxDVJMKD3uixw5FD0hrw1+EN03WUg
         t525dMP+YIMILXDV1uQwPfsh7HkHMXoF2E5PyfLvjwK2jeYTmaiSkkIlJCrIjR5NQvDT
         PqugVdX+8j76v2NlOSEGMiSqRf/ejST9yzbEtRT4GuVpdbEDPEtTbc5sTJmOK3EdtLrA
         VqOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773136193; x=1773740993;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JRV4bgMFvwTiPj1crtu8ZWYHwIXJvbIRCeZGSRG6JB8=;
        b=WT2XhqYbI+6pMd1uxT/+AdmFAEbYg2GIzd8hhyVJCYLc8smUXZI0P8SZr3p0KN9EzE
         VUpi8nQcl75plGao+2+3EIV6WDU3OeafSMijMn6wzHvPEqz3hpdLvgE3lkGDEvUt1yUe
         SiyJWlIz0TxY+ZxWbL6KkNaSDZ70++/a0TKI0xlacgV+L58hoM4l0xeHXayN+loJqOhs
         3J0YwqXIVttX3aIefGsm43cJuwbQH9FMPS/aEznS2Tw6bJAR6NmMk+YP03lj7rEwhJ8i
         jvOgEjrsgc2piah/qRUkNtv+z0OslXBdEvyAUr0gOffVv7b80iaPf9V053W2AupU3ro1
         TW1A==
X-Forwarded-Encrypted: i=1; AJvYcCXjLhP7LDzGuHyZSbNwOp/1P7Sbtf9UPWP+rZ3id4UTptxSDNPkEBxVhASZxsz7AE9+/5Jp+mzqRchzD4Le436H@lists.infradead.org
X-Gm-Message-State: AOJu0Yzz4sOqr2Xpaqmtpkr8qcoy+P7F/JccPOUwbMyW3iRO8nIoSMYY
	QCcWNAQXVvSRfNpHHaBtqT5XDaQW8yulXYZgq1kyepuy0Bv4OKsHUSh7
X-Gm-Gg: ATEYQzzHnMjm/p1VxBM8yvnTFtydNe69A8eznnyp9kogLFumVCczw1ovbes0oawWCnC
	sYAIzY0/Jy879RrWFWRH3LQZmEoZQ1INoVK3NZVKeEwOgABb3l8/EAI4oGFUdnLfSv7KHb3Lljl
	+Nmi1S5V80BX4JV5Nq07sqPbCo7U2fHakLyevcBrFHqfibYuvRKInJBRDGwApzSDDbMLKpRhpl8
	ye7Tqc8vInydjR0Qvg2n8aLtaub5NAPkCF3xlCwVtlG02S/ldaKga2ip5UMcYFTDm6bNFDGnNHm
	Bh12wYeamxBH2MlNn3kAIJnMm8Y8HrW0pVB6BY3rNB01xn8MBPuK8Q5lvetGA6X0/5a4ijQf52n
	3Op/VvoLHaULIQhF6kOcfa6w64CY2/ubXjDYPFD6gt8vP6DgM6smJAra32jgoLll2DMdvvqOv7p
	UzwNMm6fFO72wxSxsFbLw=
X-Received: by 2002:a17:902:c946:b0:2ae:5655:b42 with SMTP id d9443c01a7336-2ae823ff2e7mr146847895ad.12.1773136192671;
        Tue, 10 Mar 2026 02:49:52 -0700 (PDT)
Received: from [127.0.1.1] ([218.32.81.133])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f8a67esm199459775ad.61.2026.03.10.02.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 02:49:52 -0700 (PDT)
From: Colin Huang <u8813345@gmail.com>
Date: Tue, 10 Mar 2026 17:49:36 +0800
Subject: [PATCH v3 2/3] ARM: dts: aspeed: anacapa: update SGPIO mappings
 for DFT integration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-anacapa-dts-sgpio-v3-2-12d9b7f1202e@gmail.com>
References: <20260310-anacapa-dts-sgpio-v3-0-12d9b7f1202e@gmail.com>
In-Reply-To: <20260310-anacapa-dts-sgpio-v3-0-12d9b7f1202e@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Colin.Huang2@amd.com, Carl.Lee@amd.com, Peter.Shen@amd.com, 
 Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773136185; l=6745;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=v/LRXhLIF0yd7V29cZg5G1XTEDL1TBrOYIcbE+/BVbc=;
 b=Hq0F8fihREKMsfW+ctFW+xs2hNYwsN7OOcZmVaIlEsBoYlO5juDIcQwMZ/v9oJIGcRZhngGVW
 pqliDEpcGmzAD40ZtczhMDbQLrQZbn9jlk8s0Xn5HTG69FTbLwU9vJR
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_024953_530739_F740DC79 
X-CRM114-Status: GOOD (  11.54  )
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

Update SGPIOM0 GPIO line names and signal mappings to align with the
latest DFT (Design For Tooling) integration requirements.

This change reworks SGPIO input/output assignments, replaces legacy
or reserved placeholders, and updates signal naming to match the
definitions provided by the CPLD on 2026-03-03. The update improves
signal clarity and correctness across leakage detection, presence,
fault, power-good, and debug-related GPIOs.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-anacapa.dts     | 143 ++++++++++++---------
 1 file changed, 83 insertions(+), 60 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
index 3e297abc5ba4..85b7e027daef 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
@@ -862,89 +862,106 @@ &sgpiom0 {
 	ngpios = <128>;
 	bus-frequency = <2000000>;
 	gpio-line-names =
-	/*in - out - in - out */
+	/*in - out */
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
-	"RSVD_RMC_GPIO3", "", "LEAK_DETECT_RMC_N", "",
-	"", "", "", "",
-	"", "", "", "",
-	"", "", "", "",
+	"RSVD_RMC_GPIO3", "RTM_MUX_L",
+	"LEAK_DETECT_RMC_N", "RTM_MUX_R",
+	"HDR_P0_NMI_BTN_BUF_R_N", "FPGA_JTAG_SCM_DBREQ_N",
+	"No_Leak_Sensor_flag", "whdt_sel",
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
@@ -957,10 +974,14 @@ &sgpiom0 {
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
@@ -978,17 +999,19 @@ &sgpiom0 {
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
@@ -997,8 +1020,8 @@ &sgpiom0 {
 	"PWRGD_RMC", "",
 	"FM_RST_CPU0_RESET_N", "",
 	"FM_PWRGD_CPU0_PWROK", "",
-	"wS5_PWR_Ready", "",
-	"wS0_ON_N", "PWRGD_P1V0_AUX";
+	"AMC_FAIL", "",
+	"wS0_ON_N", "";
 	status = "okay";
 };
 

-- 
2.34.1


