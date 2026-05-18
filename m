Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C0B3CD4F52
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 12:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m2i+uQfRRuyO+cBYn5sId9z29omA5tqKq8/dTLKGEZ4=; b=DxGV+HmAFz7y8R2fTjgv/7X3nR
	gxQ9VJdLGKWxd7MJZVRYhcfXVAJ/A/du/GpF4lLLtYUB/GoCaXxF5vjHAnT3KWC4BTWo19KlAjWNO
	o8P5blvTcwedBd3iAmPOstzCD25PTUPIiQB3sLGn8apivRVBEMPuDemeo6RJJM0T3cSffdDEVyP59
	u5PfUorT34eaA1n7wWLbTqwdzCR+UoUj2FbC3NmrCwKCjlywLKnO75krjUkrmtWIoBKTU5teXbRko
	sjLQtz2e/IfBpCmT2AdFPJdtkCLyqbBWrH9Ikl6jjnHIle+hbmWTHi2+i0L8o418g6GF5KU+Uls6f
	+AouiZhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwim-0000000FYmO-3nLx;
	Mon, 18 May 2026 12:05:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwil-0000000FYlt-41Xc
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 May 2026 12:05:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=m2i+uQfRRuyO+cBYn5sId9z29omA5tqKq8/dTLKGEZ4=; b=QY+BfySnHd7pg9AZg2rZn80UH9
	E+cbOJqgMzdvVO7G9VZWodvbGtvKeXdXBciV2NrDzobDnb/GaU27hxg9m30E4yIoZwc8AiQPz7wGV
	TjlYnU9wrgKjjSjTFuCU3kaVNqx/I1C6U1OCls84Q4Xs6ADl99aoL6eQk3hgLQW0jRHvVV5/0gIcE
	Tx48eZ4q2xjeQf9dlkDbcC1uCHM+11j1UhzC+WMXjdKVj2AQKjSaNfpwVlFGc8/0RiLWMtlw/ggn+
	QGOi0iUHbCHOjqBRn+vt8nRsvwIzK9R4GeUg72eA7qEWAHV7pBwUG9in8nu1LHohTQv90dRZhhiUf
	wqzLJzMQ==;
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwii-0000000B3r7-1QT4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 12:05:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779105914;
	bh=m2i+uQfRRuyO+cBYn5sId9z29omA5tqKq8/dTLKGEZ4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=hbydWdv/VyzcYntc/hUc/vWUo12PrPBEfQSBcTxqk3cgndfZ2T0NSrx8L379vwRSa
	 KDcBErROmCDAdAhM9sZfuLu9QCXAZms05OoHHK9gufTUdl5gW2SnTq34B2S7sev1yh
	 Q+Yh6OxW5oxQpWIBaZ0hwUNiOH6u38xOUH1s0p/gHwUsWO0TlGQT8ECU9fw0klaXsn
	 mLdi0UVeg6+aAcIF1ePxkHrE9ZV6lXcVkP4txnp+itJQp6bASuDstkL/UEgM+LUMV9
	 qeEH1+DGZBG/O3u8lYzSkiCl/EfjRCvGxFrQ9sl8l7OuUFseq+gq65RGQmhijfLjgB
	 FQCeUtrARBLFA==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 20EFE6024D;
	Mon, 18 May 2026 20:05:13 +0800 (AWST)
Message-ID: <cad3cf7ada9425cf0aafef1cd568ea229401c6fb.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 0/3] ARM: dts: aspeed: anacapa: restructure
 devicetree for development-phase
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Colin Huang <u8813345@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	colin.huang2@amd.com
Date: Mon, 18 May 2026 21:35:12 +0930
In-Reply-To: <20260409-anacapa-devlop-phase-devicetree-v2-0-68f328671653@gmail.com>
References: <20260409-anacapa-devlop-phase-devicetree-v2-0-68f328671653@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_130517_063825_293B5005 
X-CRM114-Status: GOOD (  17.13  )
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

Hi Colin,

Firstly, apologies that it's taken some time for me to get to this.

Next, thanks for taking on-board the idea of separating the
devicetrees. I have some comments on that below, as I think we could
improve on what you've proposed.

On Thu, 2026-04-09 at 19:40 +0800, Colin Huang wrote:
> This series refactors the Anacapa BMC devicetree layout to better support
> development-phase hardware revisions (EVT1/EVT2) while keeping a platform
> entrypoint.
>=20
> Signed-off-by: Colin Huang <u8813345@gmail.com>
> ---
> Changes in v2:
> - Fix dtbs_check fail.
> =C2=A0 Validated by following command:
> =C2=A0=C2=A0=C2=A0 make dt_binding_check DT_SCHEMA_FILES=3Darm/aspeed/asp=
eed.yaml
> =C2=A0=C2=A0=C2=A0 make CHECK_DTBS=3Dy DT_SCHEMA_FILES=3Darm/aspeed/aspee=
d.yaml aspeed/aspeed-bmc-facebook-anacapa.dtb
> =C2=A0=C2=A0=C2=A0 make CHECK_DTBS=3Dy DT_SCHEMA_FILES=3Darm/aspeed/aspee=
d.yaml aspeed/aspeed-bmc-facebook-anacapa-evt1.dtb
> =C2=A0=C2=A0=C2=A0 make CHECK_DTBS=3Dy DT_SCHEMA_FILES=3Darm/aspeed/aspee=
d.yaml aspeed/aspeed-bmc-facebook-anacapa-evt2.dtb
> - Link to v1: https://lore.kernel.org/r/20260407-anacapa-devlop-phase-dev=
icetree-v1-0-97b96367cac3@gmail.com
>=20
> ---
> Colin Huang (3):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dt-bindings: arm: aspeed: add Anacapa EVT1=
 EVT2 board
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARM: dts: aspeed: anacapa: add EVT1 device=
tree and point wrapper to it
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARM: dts: aspeed: anacapa: add EVT2 device=
tree and update wrapper
>=20
> =C2=A0.../devicetree/bindings/arm/aspeed/aspeed.yaml=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0=C2=A0 2 +
> =C2=A0.../aspeed/aspeed-bmc-facebook-anacapa-evt1.dts=C2=A0=C2=A0=C2=A0 |=
 1067 +++++++++++++++++++
> =C2=A0.../aspeed/aspeed-bmc-facebook-anacapa-evt2.dts=C2=A0=C2=A0=C2=A0 |=
 1123 ++++++++++++++++++++

So it appears you've copy/pasted the evt1 content into evt2. Taking the
diff between them we see mainly changes to GPIO names. I've pasted the
diff below for reference.

I think it would be rather more succinct and maintainable to include
the evt1 dts then override the gpio-line-names properties in evt2 for
the relevant devices.

Similarly for the root compatible and the extra I2C EEPROM.

   --- aspeed-bmc-facebook-anacapa-evt1.dts	2026-05-18 21:23:03.480670629 +=
0930
   +++ aspeed-bmc-facebook-anacapa-evt2.dts	2026-05-18 21:23:03.532671920 +=
0930
   @@ -7,7 +7,7 @@
   =20
    / {
    	model =3D "Facebook Anacapa BMC";
   -	compatible =3D "facebook,anacapa-bmc-evt1", "aspeed,ast2600";
   +	compatible =3D "facebook,anacapa-bmc-evt2", "aspeed,ast2600";
   =20
    	aliases {
    		serial0 =3D &uart1;
   @@ -129,8 +129,8 @@
    		sck-gpios =3D <&gpio0 ASPEED_GPIO(Z, 3) GPIO_ACTIVE_HIGH>;
    		mosi-gpios =3D <&gpio0 ASPEED_GPIO(Z, 4) GPIO_ACTIVE_HIGH>;
    		miso-gpios =3D <&gpio0 ASPEED_GPIO(Z, 5) GPIO_ACTIVE_HIGH>;
   -		cs-gpios =3D <&gpio0 ASPEED_GPIO(Z, 0) GPIO_ACTIVE_LOW>;
    		num-chipselects =3D <1>;
   +		cs-gpios =3D <&gpio0 ASPEED_GPIO(Z, 0) GPIO_ACTIVE_LOW>;
    		status =3D "okay";
   =20
    		tpm@0 {
   @@ -193,11 +193,15 @@
    	"","","","","","","","",
   =20
    	/*B0-B7*/
   -	"BATTERY_DETECT", "", "", "BMC_READY",
   -	"", "FM_ID_LED", "", "",
   +	"BATTERY_DETECT", "",
   +	"BMC_I2C1_FPGA_ALERT", "BMC_READY",
   +	"IOEXP_INT_3V3", "FM_ID_LED",
   +	"", "",
   =20
    	/*C0-C7*/
   -	"","","","","","","","",
   +	"","","","",
   +	"PMBUS_REQ_N", "PSU_FW_UPDATE_REQ_N",
   +	"", "",
   =20
    	/*D0-D7*/
    	"","","","","","","","",
   @@ -209,15 +213,17 @@
    	"","","","","","","","",
   =20
    	/*G0-G7*/
   -	"FM_MUX1_SEL", "", "", "",
   -	"", "", "FM_DEBUG_PORT_PRSNT_N", "FM_BMC_DBP_PRESENT_N",
   +	"FM_MUX1_SEL", "",
   +	"", "",	"", "",
   +	"FM_DEBUG_PORT_PRSNT_N", "FM_BMC_DBP_PRESENT_N",
   =20
    	/*H0-H7*/
    	"","","","","","","","",
   =20
    	/*I0-I7*/
   -	"", "", "", "",
   -	"", "FLASH_WP_STATUS", "BMC_JTAG_MUX_SEL", "",
   +	"","","","",
   +	"", "FLASH_WP_STATUS",
   +	"BMC_JTAG_MUX_SEL", "",
   =20
    	/*J0-J7*/
    	"","","","","","","","",
   @@ -229,29 +235,46 @@
    	"","","","","","","","",
   =20
    	/*M0-M7*/
   -	"", "BMC_FRU_WP", "", "",
   -	"", "", "", "",
   +	"PCIE_EP_RST_EN", "BMC_FRU_WP",
   +	"SCM_HPM_STBY_RST_N", "SCM_HPM_STBY_EN",
   +	"STBY_POWER_PG_3V3", "TH500_SHDN_OK",
   +	"", "",
   =20
    	/*N0-N7*/
   -	"LED_POSTCODE_0", "LED_POSTCODE_1", "LED_POSTCODE_2", "LED_POSTCODE_3"=
,
   -	"LED_POSTCODE_4", "LED_POSTCODE_5", "LED_POSTCODE_6", "LED_POSTCODE_7"=
,
   +	"LED_POSTCODE_0", "LED_POSTCODE_1",
   +	"LED_POSTCODE_2", "LED_POSTCODE_3",
   +	"LED_POSTCODE_4", "LED_POSTCODE_5",
   +	"LED_POSTCODE_6", "LED_POSTCODE_7",
   =20
    	/*O0-O7*/
   -	"","","","","","","","",
   +	"RUN_POWER_PG", "PWR_BRAKE",
   +	"CHASSIS_AC_LOSS", "BSM_PRSNT_N",
   +	"PSU_SMB_ALERT", "FM_TPM_PRSNT_0_N",
   +	"PSU_FW_UPDATING_N", "",
   =20
    	/*P0-P7*/
   -	"PWR_BTN_BMC_BUF_N", "", "ID_RST_BTN_BMC_N", "",
   -	"PWR_LED", "", "", "BMC_HEARTBEAT_N",
   +	"PWR_BTN_BMC_BUF_N", "IPEX_CABLE_PRSNT",
   +	"ID_RST_BTN_BMC_N", "RST_BMC_RSTBTN_OUT_N",
   +	"PWR_LED", "RUN_POWER_EN",
   +	"SHDN_FORCE", "BMC_HEARTBEAT_N",
   =20
    	/*Q0-Q7*/
   -	"","","","","","","","",
   +	"IRQ_PCH_TPM_SPI_LV3_N", "USB_OC0_REAR_N",
   +	"UART_MUX_SEL", "I2C_MUX_RESET",
   +	"RSVD_NV_PLT_DETECT", "SPI_TPM_INT",
   +	"CPU_JTAG_MUX_SELECT", "THERM_BB_OVERT",
   =20
    	/*R0-R7*/
   -	"","","","","","","","",
   +	"THERM_BB_WARN", "SPI_BMC_FPGA_INT",
   +	"CPU_BOOT_DONE", "PMBUS_GNT",
   +	"CHASSIS_PWR_BRK", "PCIE_WAKE",
   +	"PDB_THERM_OVERT", "SHDN_REQ",
   =20
    	/*S0-S7*/
   -	"", "", "SYS_BMC_PWRBTN_N", "",
   -	"", "", "", "RUN_POWER_FAULT",
   +	"", "",
   +	"SYS_BMC_PWRBTN_N", "FM_TPM_PRSNT_1_N",
   +	"FM_BMC_DEBUG_SW_N", "UID_LED_N",
   +	"SYS_FAULT_LED_N", "RUN_POWER_FAULT",
   =20
    	/*T0-T7*/
    	"","","","","","","","",
   @@ -260,7 +283,10 @@
    	"","","","","","","","",
   =20
    	/*V0-V7*/
   -	"","","","","","","","",
   +	"L2_RST_REQ_OUT", "L0L1_RST_REQ_OUT",
   +	"BMC_ID_BEEP_SEL", "BMC_I2C0_FPGA_ALERT",
   +	"SMB_BMC_TMP_ALERT", "PWR_LED_N",
   +	"SYS_RST_OUT", "IRQ_TPM_SPI_N",
   =20
    	/*W0-W7*/
    	"","","","","","","","",
   @@ -269,11 +295,12 @@
    	"","","","","","","","",
   =20
    	/*Y0-Y7*/
   -	"","","","","","","","",
   +	"RST_WDTRST_PLD_N", "RST_BMC_SELF_HW",
   +	"FM_FLASH_LATCH_N", "BMC_EMMC_RST_N",
   +	"","","","",
   =20
    	/*Z0-Z7*/
   -	"SPI_BMC_TPM_CS2_N", "", "", "SPI_BMC_TPM_CLK",
   -	"SPI_BMC_TPM_MOSI", "SPI_BMC_TPM_MISO", "", "";
   +	"","","","","","","","";
    };
   =20
    &gpio1 {
   @@ -287,7 +314,8 @@
    	"FM_BOARD_BMC_REV_ID2", "",
   =20
    	/*18C0-18C7*/
   -	"","","","","","","","",
   +	"", "", "SPI_BMC_BIOS_ROM_IRQ0_N", "",
   +	"", "", "", "",
   =20
    	/*18D0-18D7*/
    	"","","","","","","","",
   @@ -586,6 +614,11 @@
    		reg =3D <0x50>;
    	};
   =20
   +	eeprom@51 {
   +		compatible =3D "atmel,24c128";
   +		reg =3D <0x51>;
   +	};
   +
    	// BSM FRU
    	eeprom@56 {
    		compatible =3D "atmel,24c64";
   @@ -862,89 +895,106 @@
    	ngpios =3D <128>;
    	bus-frequency =3D <2000000>;
    	gpio-line-names =3D
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
   =20
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
   =20
    	/* C0-C7 line 32-47 */
   -	"RSVD_RMC_GPIO3", "", "", "",
   -	"", "", "", "",
   -	"LEAK_DETECT_RMC_N", "", "", "",
   -	"", "", "", "",
   +	"RSVD_RMC_GPIO3", "RTM_MUX_L",
   +	"LEAK_DETECT_RMC_N", "RTM_MUX_R",
   +	"HDR_P0_NMI_BTN_BUF_R_N", "FPGA_JTAG_SCM_DBREQ_N",
   +	"No_Leak_Sensor_flag", "whdt_sel",
   +	"", "",
   +	"", "",
   +	"", "",
   +	"", "",
   =20
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
   =20
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
   =20
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
   =20
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
    	"", "",
   +	"", "",
   +	"PRSNT_NFC_BOARD_R", "",
   =20
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
   =20
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
   =20
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
   =20
    	/* K0-K7 line 160-175 */
    	"ADC_I2C_ALERT_N", "",
   @@ -957,10 +1007,14 @@
    	"PDB_ALERT_R_N", "",
   =20
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
   =20
    	/* M0-M7 line 192-207 */
    	"EAM0_SMERR_CPLD_R_L", "",
   @@ -978,27 +1032,29 @@
    	"AMC_STBY_PGOOD_R", "",
    	"CPU_AMC_SLP_S5_R_L", "",
    	"AMC_CPU_EAMPG_R", "",
   -	"", "", "", "",
   +	"DIMM_PMIC_PG_TIMEOUT", "",
   +	"EAM_MOD_PWR_GD_TIMEOUT", "",
   +	"CPLD_AMC_STBY_PWR_EN", "",
   =20
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
   =20
    	/* P0-P7 line 240-255 */
    	"CPU0_SLP_S5_N_R", "NFC_VEN",
    	"CPU0_SLP_S3_N_R", "",
    	"FM_CPU0_PWRGD", "",
    	"PWRGD_RMC", "",
   -	"FM_RST_CPU0_RESET_N", "",
   -	"FM_PWRGD_CPU0_PWROK", "",
   -	"wS5_PWR_Ready", "",
   -	"wS0_ON_N", "PWRGD_P1V0_AUX";
   +	"FM_RST_CPU0_RESET_N", "RBB_CPLD_RISCV_RST",
   +	"FM_PWRGD_CPU0_PWROK", "LBB_CPLD_RISCV_RST",
   +	"AMC_FAIL", "HPM_CPLD_RISCV_RST",
   +	"wS0_ON_N", "";
    	status =3D "okay";
    };
   =20
  =20

