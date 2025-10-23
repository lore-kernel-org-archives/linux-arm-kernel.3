Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F11CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 13:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c/jmxjXdmq0SXF1W7GJIW60cMtCZ5BeVt+jY+t/MAbo=; b=kqTP7KYwVrTRZQUaPxNhI9hkV/
	eeqX6WcOwFnsyI6wz1r/j/1fNscwi2GffEs/NQMHrR/9FcKOw/3lbgq4q+u/aIobZ3elCQrF0vjTw
	pzv04iBlHzYcGqn/KgTiyMo3Nl2A09FGPgza/EwTcnQwxXMXdQkkYh46TdmSmoGA4ICFGmCnpy6h7
	unv/bayERArWCdEHGu55sha37LYoAXI3NyHAoaLjtwY755o6EQC35vlY3Vd7IHyChxam72/zqLVZ2
	ZCh+n/O18hzPy1t+w7olL7GkSJ40RF9f1GaKBPZHlIGD3SYhngG45o2T4x9LB79X6/Rii+aBcU1A9
	+O77t/YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvDD-00000006Ldi-2JKr;
	Thu, 23 Oct 2025 13:18:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvDC-00000006LdP-11Af
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 23 Oct 2025 13:18:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=c/jmxjXdmq0SXF1W7GJIW60cMtCZ5BeVt+jY+t/MAbo=; b=GPsEwJ+MVbaU0dXXB1g2JRJvns
	bALcPSk1Nv7bRsH7pq//l5ZnxXL7lnUQi2HF1ilLhGilDrfh4u+DGc9mIPPWDcsGm8sR/WjA5dmlW
	NL5IrKzoOlzK8dvANMZJGaI3Xm7pXuc8fsXSELHVOkSQEQqGipo//uEZM/KQ0yx6CpmIZvbbPm1jG
	YyatauZH20GwRICuwgefjekjRtIiYJI4QnIzR/CT/lIA9uMx4vm5UV7ss5uzOZx+3o5rMXhGY0wcT
	Wn8AuRKAasMZn8ATzRHWPnXPlhHzb1yC7lTFEj4StS13CAKt+WAXVkAV67ohDFq9FVvOcKr1s5o7+
	iShX5ayg==;
Received: from cp2.siel.si ([46.19.12.180])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBuLP-00000001Kxs-03X8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 12:23:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=c/jmxjXdmq0SXF1W7GJIW60cMtCZ5BeVt+jY+t/MAbo=; b=FUHb1DW7/ZzXUhEY9ucRst9OyP
	onHMgaSnAbYskDmFbnRi8XDTGWqqxyvHPfr5FsoVGssCYpvxEXW8xScnsIUGOEbO1iwm1IDYC8a9g
	dePMD+2PDK3a4nugYHrSjbB4PwC+BR2mV9CRklkqoXE858v06GzwydwjNsClnWz92nhoJ6DvLgL4f
	/w5JGzdlobEC6HGtU0SS2BO1Z2lUFumV9So3RnYKWruXBC5UsuzJDs5s+Ni1/EUCejaGerx1Huu/+
	Ng0uRVK8/PCER1pAByIyQzoTn/LgevQ+7pW02VnK7J9aH6ZZUzr9o7mSnnsm6cRtiNs0L5Ep3H6Jm
	n4xW0ajQ==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:42024 helo=[192.168.69.116])
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.98.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1vBvCo-00000005yL2-3HDU;
	Thu, 23 Oct 2025 15:18:11 +0200
Message-ID: <12603435-02c5-4e85-8fd3-53cb65c9159a@norik.com>
Date: Thu, 23 Oct 2025 15:18:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: freescale: imx93-phy{core, board}: Add i2c
 bus recovery
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, upstream@lists.phytec.de,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev
References: <20251023103426.3606647-1-primoz.fiser@norik.com>
 <56075d3e-30ac-4501-bd77-2a84d0d124bd@pengutronix.de>
Content-Language: en-US
From: Primoz Fiser <primoz.fiser@norik.com>
Autocrypt: addr=primoz.fiser@norik.com; keydata=
 xjMEZrROOxYJKwYBBAHaRw8BAQdAADVOb5tiLVTUAC9nu/FUl4gj/+4fDLqbc3mk0Vz8riTN
 JVByaW1veiBGaXNlciA8cHJpbW96LmZpc2VyQG5vcmlrLmNvbT7CiQQTFggAMRYhBK2YFSAH
 ExsBZLCwJGoLbQEHbnBPBQJmtE47AhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQagttAQducE+T
 gAD+K4fKlIuvH75fAFwGYG/HT3F9mN64majvqJqvp3gTB9YBAL12gu+cm11m9JMyOyN0l6Os
 jStsQFghPkzBSDWSDN0NzjgEZrROPBIKKwYBBAGXVQEFAQEHQP2xtEOhbgA+rfzvvcFkV1zK
 6ym3/c/OUQObCp50BocdAwEIB8J4BBgWCAAgFiEErZgVIAcTGwFksLAkagttAQducE8FAma0
 TjwCGwwACgkQagttAQducE8ucAD9F1sXtQD4iA7Qu+SwNUAp/9x7Cqr37CSb2p6hbRmPJP8B
 AMYR91JYlFmOJ+ScPhQ8/MgFO+V6pa7K2ebk5xYqsCgA
Organization: Norik systems d.o.o.
In-Reply-To: <56075d3e-30ac-4501-bd77-2a84d0d124bd@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_132303_772457_BF9B4E72 
X-CRM114-Status: GOOD (  14.00  )
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

Hi Ahmad,

On 23. 10. 25 14:00, Ahmad Fatoum wrote:
> Hi,
> 
> On 10/23/25 12:34 PM, Primoz Fiser wrote:
>> Add bus recovery feature for I2C buses on the PHYTEC phyCORE-i.MX93 SoM
>> based boards (that is phyBOARD-Nash-i.MX93 and phyBOARD-Segin-i.MX93).
>> This enables the i2c-imx-lpi2c driver to recover the stuck I2C bus by
>> switching the SCL and SDA pinmuxing and do the I2C bus bit-banging.
>>
>> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
>> ---
>>  .../arm64/boot/dts/freescale/imx93-phyboard-nash.dts | 12 +++++++++++-
>>  .../boot/dts/freescale/imx93-phyboard-segin.dts      | 12 +++++++++++-
>>  arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi | 12 +++++++++++-
>>  3 files changed, 33 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts
>> index 5599e296919f..96c58cf13754 100644
>> --- a/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts
>> +++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts
>> @@ -128,8 +128,11 @@ &flexcan1 {
>>  /* I2C2 */
>>  &lpi2c2 {
>>  	clock-frequency = <400000>;
>> -	pinctrl-names = "default";
>> +	pinctrl-names = "default", "gpio";
>>  	pinctrl-0 = <&pinctrl_lpi2c2>;
>> +	pinctrl-1 = <&pinctrl_lpi2c2_gpio>;
>> +	scl-gpios = <&gpio1 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>> +	sda-gpios = <&gpio1 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>>  	status = "okay";
>>  
>>  	/* RTC */
>> @@ -253,6 +256,13 @@ MX93_PAD_I2C2_SDA__LPI2C2_SDA		0x40000b9e
>>  		>;
>>  	};
>>  
>> +	pinctrl_lpi2c2_gpio: lpi2c2gpiogrp {
>> +		fsl,pins = <
>> +			MX93_PAD_I2C2_SCL__GPIO1_IO02		0x31e
> 
> I haven't worked with imx93 myself yet, but does this not need the SION
> bit set?

That's a good question.

It seems other in-tree platforms using imx7ulp-lpi2c driver like imx7,
imx8q, imx8mp are setting the SION bit indeed.

However, since we are using the generic I2C GPIO recovery routine, SION
bit probably doesn't need to be set because recovery routine will apply
"gpio" pinctrl via the pinctrl_select_state(), toggle the SDA/SCL lines
now muxed as gpios and lastly apply back the original "i2c" pinctrl.

So I would assume SION bit would need to be set if driver would try to
recover the bus while keeping the original i2c pad muxing?

For which platform was SION bit necessary in your case?

BR,
Primoz


> 
> Cheers,
> Ahmad
> 
>> +			MX93_PAD_I2C2_SDA__GPIO1_IO03		0x31e
>> +		>;
>> +	};
>> +
>>  	pinctrl_lpspi6: lpspi6grp {
>>  		fsl,pins = <
>>  			MX93_PAD_GPIO_IO00__GPIO2_IO00		0x386
>> diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
>> index 802d96b19e4c..1850a93dbaa4 100644
>> --- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
>> +++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
>> @@ -132,8 +132,11 @@ &flexcan1 {
>>  /* I2C2 */
>>  &lpi2c2 {
>>  	clock-frequency = <400000>;
>> -	pinctrl-names = "default";
>> +	pinctrl-names = "default", "gpio";
>>  	pinctrl-0 = <&pinctrl_lpi2c2>;
>> +	pinctrl-1 = <&pinctrl_lpi2c2_gpio>;
>> +	scl-gpios = <&gpio1 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>> +	sda-gpios = <&gpio1 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>>  	status = "okay";
>>  
>>  	/* Codec */
>> @@ -238,6 +241,13 @@ MX93_PAD_I2C2_SDA__LPI2C2_SDA		0x40000b9e
>>  		>;
>>  	};
>>  
>> +	pinctrl_lpi2c2_gpio: lpi2c2gpiogrp {
>> +		fsl,pins = <
>> +			MX93_PAD_I2C2_SCL__GPIO1_IO02		0x31e
>> +			MX93_PAD_I2C2_SDA__GPIO1_IO03		0x31e
>> +		>;
>> +	};
>> +
>>  	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
>>  		fsl,pins = <
>>  			MX93_PAD_SD2_RESET_B__GPIO3_IO07	0x31e
>> diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
>> index 3f069905cf0b..ebc57841f27f 100644
>> --- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
>> @@ -93,8 +93,11 @@ ethphy1: ethernet-phy@1 {
>>  /* I2C3 */
>>  &lpi2c3 {
>>  	clock-frequency = <400000>;
>> -	pinctrl-names = "default";
>> +	pinctrl-names = "default", "gpio";
>>  	pinctrl-0 = <&pinctrl_lpi2c3>;
>> +	pinctrl-1 = <&pinctrl_lpi2c3_gpio>;
>> +	scl-gpios = <&gpio2 29 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>> +	sda-gpios = <&gpio2 28 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>>  	status = "okay";
>>  
>>  	pmic@25 {
>> @@ -234,6 +237,13 @@ MX93_PAD_GPIO_IO29__LPI2C3_SCL		0x40000b9e
>>  		>;
>>  	};
>>  
>> +	pinctrl_lpi2c3_gpio: lpi2c3gpiogrp {
>> +		fsl,pins = <
>> +			MX93_PAD_GPIO_IO28__GPIO2_IO28		0x31e
>> +			MX93_PAD_GPIO_IO29__GPIO2_IO29		0x31e
>> +		>;
>> +	};
>> +
>>  	pinctrl_pmic: pmicgrp {
>>  		fsl,pins = <
>>  			MX93_PAD_ENET2_RD3__GPIO4_IO27		0x31e
> 

-- 
Primoz Fiser
phone: +386-41-390-545
email: primoz.fiser@norik.com
--
Norik systems d.o.o.
Your embedded software partner
Slovenia, EU
phone: +386-41-540-545
email: info@norik.com


