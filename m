Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80771C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 13:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NDMxDpRQHUH5DI5CJdXcKRFYNqO7HewMbVkgqrZvlZ0=; b=S7IUhPdQsPVYrilMIj+iBpPbXf
	esU5BarMLRK5rq8qSmxTtkR4GKkHQzxam3cg+VVSpQijd0osX46cHb940LcIrJIBzCQks09m9UqaB
	Kkxspf4TSLcKcHX3EVFjqCx/J/30v25pqxHQRz1ouvQbi9C6t+I/2ucuPPKEyadFZ1dbMkuWwUW3y
	d+XuFoVubLv1DEx6BnixAUKUtkCl7VQfXUkJ/QwFjXmaFKoPfwRPZ/6bX+VZDy/lsaD3ecLBQeVn9
	Ce4u6WfvFo8JsqMk7Br0p/5fB6qgREabvuY9pcwcrewRiDCT74/UKjHDmBI3Btf2w1jSfYthyzY/g
	BW3FeUpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u67vJ-00000001KLY-0DA3;
	Sat, 19 Apr 2025 13:07:57 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u67tQ-00000001KGt-43IA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 13:06:02 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53JD5qGT1203396
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 19 Apr 2025 08:05:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745067952;
	bh=NDMxDpRQHUH5DI5CJdXcKRFYNqO7HewMbVkgqrZvlZ0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=PooUg6JDPmaoIajrPX1J0OWWh7IuZ6WfK3uYde+1Tc498kL8NWoHLknvaEYoJY4+F
	 SnEG6ltf0qrfxbUWGlb0RpNPVWgrn8hIA5C2l1RN/agfaR6HLjT5/yg7XbZCA0cSxO
	 ioDTYG+kY5QHWe+fqf8AZjVy2UmWrnSRV1tNgt5o=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53JD5qQ3079017
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 19 Apr 2025 08:05:52 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 19
 Apr 2025 08:05:51 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 19 Apr 2025 08:05:51 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53JD5jhA027840;
	Sat, 19 Apr 2025 08:05:46 -0500
Message-ID: <98b6208c-4cfd-4746-9e49-4f5596f8cf3e@ti.com>
Date: Sat, 19 Apr 2025 18:35:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-am62a7-sk: Describe the SPI NAND
To: Miquel Raynal <miquel.raynal@bootlin.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,
        Steam Lin <stlin2@winbond.com>, <u-kumar1@ti.com>
References: <20250401135822.244402-1-miquel.raynal@bootlin.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250401135822.244402-1-miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_060601_173469_BB75D118 
X-CRM114-Status: GOOD (  16.49  )
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

Thanks for patch Miquel

On 4/1/2025 7:28 PM, Miquel Raynal wrote:
> Describe the octal SPI NAND available on the low-power starter kit.
>
> The pinctrl configuration comes from TI fork.
>
> With the current mainline tree, we currently get the following
> performances:
>
> eraseblock write speed is 7507 KiB/s
> eraseblock read speed is 15802 KiB/s
> page write speed is 7551 KiB/s
> page read speed is 15609 KiB/s
> 2 page write speed is 7551 KiB/s
> 2 page read speed is 15609 KiB/s
> erase speed is 284444 KiB/s
> 2x multi-block erase speed is 512000 KiB/s
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>   arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 40 +++++++++++++++++++++++++
>   1 file changed, 40 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> index a6f0d87a50d8..6cc950f6dbe3 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> @@ -737,3 +737,43 @@ dpi1_out: endpoint {
>   		};
>   	};
>   };
> +
> +&fss {
> +	status = "okay";
> +};
> +
> +&ospi0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&ospi0_pins_default>;
> +
> +	flash@0 {
> +		compatible = "spi-nand";

Since this is boot flash, so please add booth-all property as well


> +		reg = <0>;
> +		spi-tx-bus-width = <8>;
> +		spi-rx-bus-width = <8>;
> +		spi-max-frequency = <25000000>;
> +		cdns,tshsl-ns = <60>;
> +		cdns,tsd2d-ns = <60>;
> +		cdns,tchsh-ns = <60>;
> +		cdns,tslch-ns = <60>;
> +		cdns,read-delay = <2>;

Since this flash is used as boot device, I suggest if you can add 
partitions of flash as well .

you can take reference from downstream version [0]

> +	};
> +};
> +
> +&main_pmx0 {
> +	ospi0_pins_default: ospi0-default-pins {

please add booth-all property as well


> +		pinctrl-single,pins = <
> +			AM62AX_IOPAD(0x000, PIN_OUTPUT, 0) /* (H24) OSPI0_CLK */
> +			AM62AX_IOPAD(0x02c, PIN_OUTPUT, 0) /* (F23) OSPI0_CSn0 */
> +			AM62AX_IOPAD(0x00c, PIN_INPUT, 0) /* (E25) OSPI0_D0 */
> +			AM62AX_IOPAD(0x010, PIN_INPUT, 0) /* (G24) OSPI0_D1 */
> +			AM62AX_IOPAD(0x014, PIN_INPUT, 0) /* (F25) OSPI0_D2 */
> +			AM62AX_IOPAD(0x018, PIN_INPUT, 0) /* (F24) OSPI0_D3 */
> +			AM62AX_IOPAD(0x01c, PIN_INPUT, 0) /* (J23) OSPI0_D4 */
> +			AM62AX_IOPAD(0x020, PIN_INPUT, 0) /* (J25) OSPI0_D5 */
> +			AM62AX_IOPAD(0x024, PIN_INPUT, 0) /* (H25) OSPI0_D6 */
> +			AM62AX_IOPAD(0x028, PIN_INPUT, 0) /* (J22) OSPI0_D7 */
> +			AM62AX_IOPAD(0x008, PIN_INPUT, 0) /* (J24) OSPI0_DQS */
> +		>;
> +	};
> +};

[0] 
https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/tree/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts?h=ti-linux-6.12.y-cicd#n798 




