Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D75C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 12:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c6C4oOxGjBlu5W/aodx9doW+zfgNMm+PVJPx4R0Gj5A=; b=oS6E3grBHaP4OpIKlP0k7/+dQ7
	b0gb0P3kX2va7BpzFn9A8722ntBzCtagiMWWN90JUKtltzzEHZrzLZXO7mg6BFovo2D1In/jcKyhv
	dm/BQ46gbV5KmDZ/Wx6wwUJvO2/fpHzNy0i+du24h2H0J2hYKf+HzATkWPqZj8xOVBlgN12NMMV2t
	f9K8x8IQEVhziI2zJA54A+KV+e+9yZgoaEk1KzyCfhlli3vsunUhv5K27HpnB8MODIIVs1nDPz0SK
	/zld062GP8YEs3kypa9+re8TosNtbaumLt6o4v4ocpPYIOyvEJfkg496btKZAZvfAbvSREh7QVmAZ
	0wIh4tvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCdWu-0000000FJGx-1lbS;
	Wed, 07 May 2025 12:05:40 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCdSd-0000000FIOP-2vUt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 12:01:17 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 547C15V21501229
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 7 May 2025 07:01:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746619265;
	bh=c6C4oOxGjBlu5W/aodx9doW+zfgNMm+PVJPx4R0Gj5A=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=rOdT6gPRt6s2LZ3uBjsGQtHGW/+rIRkOLRFHmFGnUqj8n6M9c2y/C3h8bdP/Q3tH9
	 9CzO/9lNJCCWhpC86JrEOAmYr4VG3vnGLO2X1cRKiK/wtq1ziiJQmmpwaCRnlcsylJ
	 61/1UtpX7mGlg/ICWUVzU6RLbkkAfu4adHlxL1aI=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 547C14me064429
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 May 2025 07:01:05 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 May 2025 07:01:04 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 May 2025 07:01:04 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 547C14Vm019074;
	Wed, 7 May 2025 07:01:04 -0500
Date: Wed, 7 May 2025 07:01:04 -0500
From: Nishanth Menon <nm@ti.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-am625-sk: Add power/temperature
 sensors
Message-ID: <20250507120104.4mhuaabe5auukarn@banter>
References: <20250505-am625-sk-sensors-v1-1-688fb928b390@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250505-am625-sk-sensors-v1-1-688fb928b390@pengutronix.de>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_050115_905873_6B3655F7 
X-CRM114-Status: GOOD (  25.32  )
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

On 15:24-20250505, Sascha Hauer wrote:
> The AM625-SK has six power sensors and two temperature sensors connected
> to I2C. Add them to the device tree.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
> The AM625-SK has six power sensors and two temperature sensors connected
> to I2C. Add them to the device tree.

Sascha,

I suggest making this as overlay. The reason is as follows: AM625-SK
among other TI evms do have automated power measurement capability from
XDS110 (accessible via USB port for jtag - appears as a rudimentary
menu option). The way this works is that it uses TM4C1294NCPDT to use
I2C commands to control the INA226/231 depending on the evm.

This firmware should be flashed by default on production boards (if
not, starting up CCS[1], autodetects older firmware and updates - at
least to my understanding) - by the way, this firmware also does test
automation, such as boot mode switch control, reset control etc.

This is the primary framework meant to be used by test automation and
indeed it is the default inside TI.

Challenge here is this: if we make this default in Linux, the test
automation system configures the INA226/231 in a different sampling
mode depending on usecase etc Vs what Linux does (even though the
shunt and the bus voltage for a given INA is the same). And just like
Linux, the firmware power measurement logic has changed over the
years.

Anyways, while I know that the SoC and TM4C can both handle
multi-master, the challenge is the same INA controlled and
mix-configured by two masters (and there is no synchronization between
the two).

To avoid this entire conflict and headache, I suggest adding it as
overlay that can be applied depending on the preference of measurement
desired.

[1] https://www.ti.com/tool/CCSTUDIO

> ---
>  arch/arm64/boot/dts/ti/k3-am625-sk.dts | 68 ++++++++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am625-sk.dts b/arch/arm64/boot/dts/ti/k3-am625-sk.dts
> index 2fbfa371934575efc4e9118a705f062bdea55f4f..e900d3134c72dc2616e3820b273d84b0db64bed5 100644
> --- a/arch/arm64/boot/dts/ti/k3-am625-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am625-sk.dts
> @@ -193,6 +193,74 @@ exp1: gpio@22 {
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&main_gpio1_ioexp_intr_pins_default>;
>  	};
> +
> +	power-sensor@40 {
> +		compatible = "ti,ina231";
> +		reg = <0x40>;
> +		#io-channel-cells = <1>;
> +		label = "vdd_core";
> +		shunt-resistor = <10000>;
> +		vs-supply = <&vcc_3v3_sys>;
> +	};
> +
> +	power-sensor@41 {
> +		compatible = "ti,ina231";
> +		reg = <0x41>;
> +		#io-channel-cells = <1>;
> +		label = "vddr_core";
> +		shunt-resistor = <10000>;
> +		vs-supply = <&vcc_3v3_sys>;
> +	};
> +
> +	power-sensor@45 {
> +		compatible = "ti,ina231";
> +		reg = <0x45>;
> +		#io-channel-cells = <1>;
> +		label = "dvdd_1v8";
> +		shunt-resistor = <10000>;
> +		vs-supply = <&vcc_3v3_sys>;
> +	};
> +
> +	power-sensor@47 {
> +		compatible = "ti,ina231";
> +		reg = <0x47>;
> +		#io-channel-cells = <1>;
> +		label = "vdd_ddr";
> +		shunt-resistor = <10000>;
> +		vs-supply = <&vcc_3v3_sys>;
> +	};
> +
> +	temperature-sensor@48 {
> +		compatible = "ti,tmp100";
> +		reg = <0x48>;
> +		label = "soc";
> +		vs-supply = <&vcc_3v3_sys>;
> +	};
> +
> +	temperature-sensor@49 {
> +		compatible = "ti,tmp100";
> +		reg = <0x49>;
> +		label = "ddr";
> +		vs-supply = <&vcc_3v3_sys>;
> +	};
> +
> +	power-sensor@4c {
> +		compatible = "ti,ina231";
> +		reg = <0x4c>;
> +		#io-channel-cells = <1>;
> +		label = "dvdd_3v3";
> +		shunt-resistor = <10000>;
> +		vs-supply = <&vcc_3v3_sys>;
> +	};
> +
> +	power-sensor@4d {
> +		compatible = "ti,ina231";
> +		reg = <0x4d>;
> +		#io-channel-cells = <1>;
> +		label = "vdda_1v8";
> +		shunt-resistor = <10000>;
> +		vs-supply = <&vcc_3v3_sys>;
> +	};
>  };
>  
>  &sdhci1 {
> 
> ---
> base-commit: 92a09c47464d040866cf2b4cd052bc60555185fb
> change-id: 20250505-am625-sk-sensors-bb255e2baa47
> 
> Best regards,
> -- 
> Sascha Hauer <s.hauer@pengutronix.de>
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

