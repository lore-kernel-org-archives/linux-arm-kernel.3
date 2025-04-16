Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15961C369B1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 06:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dI3QsCpStO6SjD3RhAtaXcoaJDV5dLorEuip9Lnv4PI=; b=CdaEHxMcvephW8znxSs3yY629E
	UQj/WftCvk0hg/W0MuGfKx+YpwmT/bDJvi1pFZg7nXZtpB0pvRmDN9HwNsvdXefoIsZ2h8xx6hVVn
	VfPVrADrYrkUD7pqWaq58lrj/UPFm8sf0c6gRga7Td3RfTBIn6FpZuJajaELfL3xfd9E5rcfn928S
	ZV3w4oFxCj4uT/b3AGefFQBWWdWp5VfNmfh2w9IIvjb5wdDrA8RNnwXuhgy9wmWBCcfBivTQ4LmVc
	K6YfrxHoirDnAhIyAvZrWhR2CmXrZcVLF2qGl5y5yzx0c2ZM5JzeRS2uOVehiHkpdxGW2ewG01QK1
	ogCcI1kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4wIa-00000008PuE-3MFt;
	Wed, 16 Apr 2025 06:31:04 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4wFL-00000008PLT-1zU2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 06:27:45 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53G6RXpK242939
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 01:27:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744784853;
	bh=dI3QsCpStO6SjD3RhAtaXcoaJDV5dLorEuip9Lnv4PI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=vpEwgBMmkvzZpGXsRKj7VxMbZpku6q8A/x/OcTO2vQAd+qE+W3nvNnQ9VQi9E/HOt
	 l61aA9jVEbtmK22cN9WqgTBrtJIKNDpstxleynucIYeXuUukTQhGPVok3FrN/VRUSD
	 dP+2bDlKk3y7LCdoEg0Pcd/ET4gxoWIGrAHlTDo4=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53G6RXmW080365
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 16 Apr 2025 01:27:33 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 16
 Apr 2025 01:27:32 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 16 Apr 2025 01:27:32 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53G6ROxk104616;
	Wed, 16 Apr 2025 01:27:25 -0500
Message-ID: <9464ac11-ba45-4238-9628-51864067d3e9@ti.com>
Date: Wed, 16 Apr 2025 11:57:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] arm64: dts: ti: j721e-sk: Add DT nodes for power
 regulators
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>, <jai.luthra@linux.dev>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <imx@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>, <u-kumar1@ti.com>
References: <20250415111328.3847502-1-y-abhilashchandra@ti.com>
 <20250415111328.3847502-2-y-abhilashchandra@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250415111328.3847502-2-y-abhilashchandra@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_232743_658757_986A0D18 
X-CRM114-Status: GOOD (  15.25  )
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

Abhilash Thanks ,

On 4/15/2025 4:43 PM, Yemike Abhilash Chandra wrote:
> Add device tree nodes for two power regulators on the J721E SK board.
> vsys_5v0: A fixed regulator representing the 5V supply output from the
> LM61460 and vdd_sd_dv: A GPIO-controlled TLV71033 regulator.
>
> J721E-SK schematics: https://www.ti.com/lit/zip/sprr438
> Fixes: 1bfda92a3a36 ("arm64: dts: ti: Add support for J721E SK")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> ---
>
> Changelog:
> Changes in v3:
> - Change the PIN_INPUT to PIN_OUTPUT to control the regulator.
>
>   arch/arm64/boot/dts/ti/k3-j721e-sk.dts | 31 ++++++++++++++++++++++++++
>   1 file changed, 31 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-sk.dts b/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
> index 440ef57be294..ffef3d1cfd55 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
> @@ -184,6 +184,17 @@ vsys_3v3: fixedregulator-vsys3v3 {
>   		regulator-boot-on;
>   	};
>   
> [..]
>   	transceiver1: can-phy1 {
>   		compatible = "ti,tcan1042";
>   		#phy-cells = <0>;
> @@ -613,6 +638,12 @@ J721E_WKUP_IOPAD(0xd4, PIN_OUTPUT, 7) /* (G26) WKUP_GPIO0_9 */
>   		>;
>   	};
>   
> +	vdd_sd_dv_pins_default: vdd-sd-dv-default-pins {
> +		pinctrl-single,pins = <
> +			J721E_IOPAD(0x1dc, PIN_OUTPUT, 7) /* (Y1) SPI1_CLK.GPIO0_118 */
> +		>;
> +	};
> +

Reviewed-by: Udit Kumar <u-kumar1@ti.com>


>   	wkup_uart0_pins_default: wkup-uart0-default-pins {
>   		pinctrl-single,pins = <
>   			J721E_WKUP_IOPAD(0xa0, PIN_INPUT, 0) /* (J29) WKUP_UART0_RXD */

