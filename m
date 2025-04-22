Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78999C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 05:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7k9B+9VG6goHgGuB8w9jIN886n77aHGdXpjo78qH00A=; b=cxEakygF2XzS6OndgHlz8ZbbfH
	pjjKIuyayiVvry6pO0N3xlHe7bf4y7AMrB1bLeOLQS3Vc7L0mH8jvHbehiu+bh4O1mpW3C/MTOkWn
	Fbk3tif4LtNOVTT6AaqV1dpmnQ65/e7tz2E5ZRtP4Pzx7SokDeJXXCYa3xddUYk49727BAPj0qn4s
	AnSvkbaNkVF+4urgCKfJYRaQSnDcjoJ+NWB6X4of2vrB38F3J/zkjuyAL4OvRoCXyrqeEiVg2PWDJ
	NshHx2v1U7T8121szPdG6qa9jtjueN7p5YbGykd+WRyFVTwrbnMssTjYn/H14GgqtNw6bmLnZebLy
	laIpvqfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u76To-00000005tDN-3MJS;
	Tue, 22 Apr 2025 05:47:36 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u76Rw-00000005t65-3k6C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 05:45:42 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53M5jZE01123398
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 00:45:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745300736;
	bh=7k9B+9VG6goHgGuB8w9jIN886n77aHGdXpjo78qH00A=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=njpcIzaNgcqWHUrYQ4d5s3qjKRklC0Z2oj/Pn5bgUzOfhetqTbsl7bwmMwz4apiWk
	 8+iPbYdbBJIwfub0Zx1Q5RxF6O890ZdYCadeqiN/u/lgQ6ZV/QLvGxLhxOfa1enO/A
	 sKFZFV6esiqjtTjOVBx3oZVLRt9Z8NSzPFPw3JOo=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53M5jZia051289
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Apr 2025 00:45:35 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Apr 2025 00:45:35 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Apr 2025 00:45:35 -0500
Received: from [172.24.227.136] (moteen-ubuntu-desk.dhcp.ti.com [172.24.227.136])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53M5jVcL048512;
	Tue, 22 Apr 2025 00:45:32 -0500
Message-ID: <c660f217-9bb1-4ba2-8d59-851f69b41042@ti.com>
Date: Tue, 22 Apr 2025 11:15:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] arm64: dts: ti: k3-am6*: Add boot phase flag to
 support MMC boot
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250417233040.3658761-1-jm@ti.com>
 <20250417233040.3658761-3-jm@ti.com>
Content-Language: en-US
From: Moteen Shah <m-shah@ti.com>
In-Reply-To: <20250417233040.3658761-3-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_224541_140937_02654E92 
X-CRM114-Status: GOOD (  16.09  )
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

Hey Judith,

On 18/04/25 05:00, Judith Mendez wrote:
> The bootph-all flag was introduced in dt-schema
> (dtschema/schemas/bootph.yaml) to define node usage across
> different boot phases.
>
> For eMMC and SD boot modes, voltage regulator nodes, io-expander
> nodes, gpio nodes, and MMC nodes need to be present in all boot
> stages, so add missing bootph-all phase flag to these nodes to
> support SD boot and eMMC boot.
>
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
>   arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts | 12 ++++++++++++
>   arch/arm64/boot/dts/ti/k3-am62a7-sk.dts  |  2 ++
>   2 files changed, 14 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
> index 8e9fc00a6b3c7..aafdb90c0eb70 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
> @@ -69,6 +69,7 @@ vddshv_sdio: regulator-4 {
>   		gpios = <&main_gpio0 31 GPIO_ACTIVE_HIGH>;
>   		states = <1800000 0x0>,
>   			 <3300000 0x1>;
> +		bootph-all;
>   	};
>   };
>   
> @@ -77,12 +78,14 @@ vddshv_sdio_pins_default: vddshv-sdio-default-pins {
>   		pinctrl-single,pins = <
>   			AM62X_IOPAD(0x07c, PIN_OUTPUT, 7) /* (M19) GPMC0_CLK.GPIO0_31 */
>   		>;
> +		bootph-all;
>   	};
>   
>   	main_gpio1_ioexp_intr_pins_default: main-gpio1-ioexp-intr-default-pins {
>   		pinctrl-single,pins = <
>   			AM62X_IOPAD(0x01d4, PIN_INPUT, 7) /* (C13) UART0_RTSn.GPIO1_23 */
>   		>;
> +		bootph-all;
>   	};
>   
>   	pmic_irq_pins_default: pmic-irq-default-pins {
> @@ -118,6 +121,7 @@ exp1: gpio@22 {
>   
>   		pinctrl-names = "default";
>   		pinctrl-0 = <&main_gpio1_ioexp_intr_pins_default>;
> +		bootph-all;
>   	};
>   
>   	exp2: gpio@23 {
> @@ -229,6 +233,14 @@ &tlv320aic3106 {
>   	DVDD-supply = <&buck2_reg>;
>   };
>   
> +&main_gpio0 {
> +	bootph-all;
> +};
> +
> +&main_gpio1 {
> +	bootph-all;
> +};
> +
>   &gpmc0 {
>   	ranges = <0 0 0x00 0x51000000 0x01000000>; /* CS0 space. Min partition = 16MB */
>   };
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> index 1c9d95696c839..7de4a9f139ad4 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> @@ -313,6 +313,7 @@ AM62AX_IOPAD(0x200, PIN_INPUT_PULLUP, 0) /* (AC1) MMC0_DAT5 */
>   			AM62AX_IOPAD(0x1fc, PIN_INPUT_PULLUP, 0) /* (AD2) MMC0_DAT6 */
>   			AM62AX_IOPAD(0x1f8, PIN_INPUT_PULLUP, 0) /* (AC2) MMC0_DAT7 */
>   		>;
> +		bootph-all;
>   	};
>   
>   	main_mmc1_pins_default: main-mmc1-default-pins {
> @@ -615,6 +616,7 @@ &sdhci0 {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&main_mmc0_pins_default>;
>   	disable-wp;
> +	bootph-all;
>   };
>   

Do we have the bootph-all flags in *-uboot.dtsi for the board to boot up?
If yes we will have to clean that up after this series gets merged.

Reviewed-by: Moteen Shah <m-shah@ti.com>

Regards,
Moteen Shah

>   &sdhci1 {

