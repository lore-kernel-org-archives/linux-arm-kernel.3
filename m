Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BEF4C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 14:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dHKwU4dD4caBYMxPbtfYgf/Hwmnr7yW84qJlA1H5dsk=; b=JRwsUMlMgDyZd4ad5HcJ8MJn7D
	Zsqx+m3CBDZQx10Hac4KInJWAYkYdpsKdp/EsZZe10XGhCRwtWIglPA2tQqGg/Izq/gEwjkrIBbGE
	+H9cM2FK5PHFrcWkKTgqDB4MBloTULcIsoNO7EXXzV2kEnfAVWclj85O15sYWWOi5XTgs2b2P5lH/
	F3TkWobg+DTfuhtuM9qBuTTyzNel80SFCbzIwUvkTBUtx3xoeBkKafU4FvjntZ7WEVmlp3pgnGB64
	PmpqWwE2nekukD+DAa1WqYy6ZMZesxJXHrRtRhVKZQoCrukFucC6uZvechC1RScSGV2b0OQquBxZl
	4TJQvr2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trebZ-000000034Np-10z1;
	Mon, 10 Mar 2025 14:59:45 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trdCl-00000002nhh-1Gna
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 13:30:04 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52ABZfuq030529;
	Mon, 10 Mar 2025 14:29:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	dHKwU4dD4caBYMxPbtfYgf/Hwmnr7yW84qJlA1H5dsk=; b=jvrqgR5dPNW8tn0m
	UG7F2Fuqyne//saP+/Y4LS7wG0nI4r6Bo+ODHz/g/2/6f8N31UrckzLDqCAl+Dyy
	yQXUax7kosbkf6TrYlCtDU/1oHSbh2sVdE04iHSg5mWKwdviKQ/YyDmlEmEUzbQ2
	WiulXmUrQ4cLfUFx+/2EbMPhlPlUkNGY0tW2/c3FQTY2/5ncT3IjOfvEHzdkLIQS
	X54CFKJ004cUXOURM6f9r9OTc5g7m1fkLC52wqJAXQytz7QXTiAeFYYeZ+wqySMK
	oq/IoZznFDMx3Yevo7oCCfMZ/g77K5NqjTe8HLaA6Quu1kHqXolInzDHgmEwkwZe
	7uczfQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 458ev63x6k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 14:29:45 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5DE964005F;
	Mon, 10 Mar 2025 14:28:25 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E2BA54DF6BC;
	Mon, 10 Mar 2025 14:27:43 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 14:27:43 +0100
Message-ID: <6d42bdc8-825a-4fd9-80ab-cfe02fff6c86@foss.st.com>
Date: Mon, 10 Mar 2025 14:27:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: stm32: Add support for STM32MP13xx DHCOR SoM
 and DHSBC rev.200 board
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
CC: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Rob Herring <robh@kernel.org>, <devicetree@vger.kernel.org>,
        <kernel@dh-electronics.com>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20250302152605.54792-1-marex@denx.de>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250302152605.54792-1-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_05,2025-03-07_03,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_063003_648862_AA24E20A 
X-CRM114-Status: GOOD (  16.74  )
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

Hi Marek

On 3/2/25 16:25, Marek Vasut wrote:
> LDO2 is expansion connector supply on STM32MP13xx DHCOR DHSBC rev.200.
> LDO5 is carrier board supply on STM32MP13xx DHCOR DHSBC rev.200. Keep
> both regulators always enabled to make sure both the carrier board and
> the expansion connector is always powered on and supplied with correct
> voltage.
> 
> Describe ST33TPHF2XSPI TPM 2.0 chip interrupt and reset lines.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
>   .../boot/dts/st/stm32mp135f-dhcor-dhsbc.dts   | 30 +++++++++++++++++--
>   1 file changed, 28 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts b/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts
> index 853dc21449d99..9902849ed0406 100644
> --- a/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts
> +++ b/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts


Applied on stm32-next.

Thanks
Alex

> @@ -176,7 +176,7 @@ &gpioa {
>   	gpio-line-names = "", "", "", "",
>   			  "", "DHSBC_USB_PWR_CC1", "", "",
>   			  "", "", "", "DHSBC_nETH1_RST",
> -			  "", "DHCOR_HW-CODING_0", "", "";
> +			  "", "DHCOR_HW-CODING_0", "", "DHSBC_HW-CODE_2";
>   };
>   
>   &gpiob {
> @@ -197,7 +197,7 @@ &gpiod {
>   	gpio-line-names = "", "", "", "",
>   			  "", "DHCOR_RAM-CODING_0", "", "",
>   			  "", "DHCOR_RAM-CODING_1", "", "",
> -			  "", "", "", "";
> +			  "", "DHSBC_HW-CODE_1", "", "";
>   };
>   
>   &gpioe {
> @@ -221,6 +221,13 @@ &gpiog {
>   			  "DHSBC_ETH1_INTB", "", "", "DHSBC_ETH2_INTB";
>   };
>   
> +&gpioh {
> +	gpio-line-names = "", "", "", "DHSBC_HW-CODE_0",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "";
> +};
> +
>   &gpioi {
>   	gpio-line-names = "DHCOR_RTC_nINT", "DHCOR_HW-CODING_1",
>   			  "DHCOR_BT_REG_ON", "DHCOR_PMIC_nINT",
> @@ -296,6 +303,9 @@ &spi2 {
>   	st33htph: tpm@0 {
>   		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
>   		reg = <0>;
> +		interrupt-parent = <&gpioe>;
> +		interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
> +		reset-gpios = <&gpioe 12 GPIO_ACTIVE_LOW>;
>   		spi-max-frequency = <24000000>;
>   	};
>   };
> @@ -419,3 +429,19 @@ connector {
>   		type = "micro";
>   	};
>   };
> +
> +/* LDO2 is expansion connector 3V3 supply on STM32MP13xx DHCOR DHSBC rev.200 */
> +&vdd_ldo2 {
> +	regulator-always-on;
> +	regulator-boot-on;
> +	regulator-min-microvolt = <3300000>;
> +	regulator-max-microvolt = <3300000>;
> +};
> +
> +/* LDO5 is carrier board 3V3 supply on STM32MP13xx DHCOR DHSBC rev.200 */
> +&vdd_sd {
> +	regulator-always-on;
> +	regulator-boot-on;
> +	regulator-min-microvolt = <3300000>;
> +	regulator-max-microvolt = <3300000>;
> +};

