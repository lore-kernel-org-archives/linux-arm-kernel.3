Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F88CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 12:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ItdHM5JRzxCl5+hQXpEUXe7rdUyHEdLjMyQbQhS+/iA=; b=0XzNzeean8xb6mVpmbHWRTNL38
	zFsOgA2CQmIox+dnVnF/rtnxN5ozsr60WAnBRs6uWOPHpBxCB09fWbS2+Hx5F+s7DpQvN9fBP4iPA
	KUrPiUrUHwMLUSAC8TMcYzr6nghBU5v+4kHtUVfl14eON+w+HOP2PDpap25DUVBuSUqLivLrqGoyo
	Y1LWPg9x4OMyhvkd6uALooxWQBXWEPdorkFnw3esG4/bvN9QYHSJt6e+U3+e2yKGxmeEqjm5JwKXL
	p8M7VTAimCttJiMkCRwtoey+ZYX+TGDZBXN58MRpU0CqaP3ofibB0zzvsGH5rYiQvHbnr+HU1nBwD
	LTyajzAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBXy4-00000002naZ-0To4;
	Wed, 22 Oct 2025 12:29:29 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBXxy-00000002nZu-3TmF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 12:29:24 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59MCTJ2D266088;
	Wed, 22 Oct 2025 07:29:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761136159;
	bh=ItdHM5JRzxCl5+hQXpEUXe7rdUyHEdLjMyQbQhS+/iA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=GNhgCWOcU6ITTv0j1TQjhhAM3eeKnLS5g5j/zPpgC8zCg9ecH6KUEmJcl5sBOM/9E
	 V8O/NbbfljkLwejO1PtdQJU7d3ONxM+a8IL7wClh/F9sWsyfzMdVdYBHdoiGDuEbQ3
	 pYOMPzvjaU1imta8FvjhLdARvNLY08e51oSCOBVM=
Received: from DLEE214.ent.ti.com (dlee214.ent.ti.com [157.170.170.117])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59MCTJbO1918962
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 22 Oct 2025 07:29:19 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 22 Oct
 2025 07:29:19 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 22 Oct 2025 07:29:19 -0500
Received: from [172.24.234.127] (psdkl-workstation0.dhcp.ti.com [172.24.234.127])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59MCTFq51177876;
	Wed, 22 Oct 2025 07:29:16 -0500
Message-ID: <2aeb5e65-b15e-4d34-a2f5-15393dd6972c@ti.com>
Date: Wed, 22 Oct 2025 17:59:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: ti: k3-j784s4: Fix I2C pinmux pull
 configuration
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>,
        <gehariprasath@ti.com>
References: <20251022121222.220113-1-a-limaye@ti.com>
Content-Language: en-US
From: Aniket Limaye <a-limaye@ti.com>
In-Reply-To: <20251022121222.220113-1-a-limaye@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_052922_989041_668C7B6E 
X-CRM114-Status: GOOD (  18.96  )
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



On 22/10/25 17:41, Aniket Limaye wrote:
> The I2C pins for some of the instances on J784S4/J742S2/AM69 are
> configured as PIN_INPUT_PULLUP while these pins are open-drain type and
> do not support internal pull-ups [0][1][2]. The pullup configuration
> bits in the corresponding padconfig registers are reserved and any
> writes to them have no effect and readback checks on those bits fail.
> 
> Update the pinmux settings to use PIN_INPUT instead of PIN_INPUT_PULLUP
> to reflect the correct hardware behaviour.
> 
> [0]: https://www.ti.com/lit/gpn/tda4ah-q1 (J784S4 Datasheet: Table 5-1. Pin Attributes)
> [1]: https://www.ti.com/lit/gpn/tda4ape-q1 (J742S2 Datasheet: Table 5-1. Pin Attributes)
> [2]: https://www.ti.com/lit/gpn/am69a (AM69 Datasheet: Table 5-1. Pin Attributes)
> 
> Fixes: e20a06aca5c9 ("arm64: dts: ti: Add support for J784S4 EVM board")
> Fixes: 635fb18ba008 ("arch: arm64: dts: Add support for AM69 Starter Kit")
> Fixes: 0ec1a48d99dd ("arm64: dts: ti: k3-am69-sk: Add pinmux for RPi Header")
> Signed-off-by: Aniket Limaye <a-limaye@ti.com>

Forgot to collect Udit's Reviewed-by
Resent a v3 at: 
https://lore.kernel.org/lkml/20251022122638.234367-1-a-limaye@ti.com/

> ---
> v2:
> - Added Fixes tags
> ---
>   arch/arm64/boot/dts/ti/k3-am69-sk.dts                   | 8 ++++----
>   arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi | 4 ++--
>   2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am69-sk.dts b/arch/arm64/boot/dts/ti/k3-am69-sk.dts
> index 5896e57b5b9e..0e2d12cb051d 100644
> --- a/arch/arm64/boot/dts/ti/k3-am69-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am69-sk.dts
> @@ -236,8 +236,8 @@ J784S4_IOPAD(0x0d4, PIN_OUTPUT, 11) /* (AN38) SPI0_CLK.UART8_TXD */
>   
>   	main_i2c0_pins_default: main-i2c0-default-pins {
>   		pinctrl-single,pins = <
> -			J784S4_IOPAD(0x0e0, PIN_INPUT_PULLUP, 0) /* (AN36) I2C0_SCL */
> -			J784S4_IOPAD(0x0e4, PIN_INPUT_PULLUP, 0) /* (AP37) I2C0_SDA */
> +			J784S4_IOPAD(0x0e0, PIN_INPUT, 0) /* (AN36) I2C0_SCL */
> +			J784S4_IOPAD(0x0e4, PIN_INPUT, 0) /* (AP37) I2C0_SDA */
>   		>;
>   	};
>   
> @@ -416,8 +416,8 @@ J784S4_WKUP_IOPAD(0x088, PIN_OUTPUT, 0) /* (J37) WKUP_GPIO0_12.MCU_UART0_TXD */
>   
>   	mcu_i2c0_pins_default: mcu-i2c0-default-pins {
>   		pinctrl-single,pins = <
> -			J784S4_WKUP_IOPAD(0x0a0, PIN_INPUT_PULLUP, 0) /* (M35) MCU_I2C0_SCL */
> -			J784S4_WKUP_IOPAD(0x0a4, PIN_INPUT_PULLUP, 0) /* (G34) MCU_I2C0_SDA */
> +			J784S4_WKUP_IOPAD(0x0a0, PIN_INPUT, 0) /* (M35) MCU_I2C0_SCL */
> +			J784S4_WKUP_IOPAD(0x0a4, PIN_INPUT, 0) /* (G34) MCU_I2C0_SDA */
>   		>;
>   	};
>   
> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
> index 419c1a70e028..2834f0a8bbee 100644
> --- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
> @@ -270,8 +270,8 @@ J784S4_IOPAD(0x0d4, PIN_OUTPUT, 11) /* (AN38) SPI0_CLK.UART8_TXD */
>   
>   	main_i2c0_pins_default: main-i2c0-default-pins {
>   		pinctrl-single,pins = <
> -			J784S4_IOPAD(0x0e0, PIN_INPUT_PULLUP, 0) /* (AN36) I2C0_SCL */
> -			J784S4_IOPAD(0x0e4, PIN_INPUT_PULLUP, 0) /* (AP37) I2C0_SDA */
> +			J784S4_IOPAD(0x0e0, PIN_INPUT, 0) /* (AN36) I2C0_SCL */
> +			J784S4_IOPAD(0x0e4, PIN_INPUT, 0) /* (AP37) I2C0_SDA */
>   		>;
>   	};
>   


