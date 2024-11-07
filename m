Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AFF1D3E787
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 10:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aAHPUbNs7M6QgxqG12AlzIrLLtSFknGoPRYn8hsW/Zw=; b=D2QU/2LsMikyUVadbTsRsu31N4
	DE9qijFuk5z0E2Ug2dSNGy4lQrVvGqMv8Qhm+YK7YwrHCQe/CnO+6WQe6Uht3AP3C8ycwQRLn5Dlt
	qwocgvySPNsmP2gt3ZgzV99Sb3Wpib56Pw7G5kDovWmxYvJ5fCZ8hKSeI4gt7YX6IfN/QfSzDJDuD
	PJgDmGneFMZmgFgaxuC/+8w5J9fBF3M88Avk3Mw/OGLD7eL50Hjzz7qlCRWLosbCkN0/JMK+xRJNF
	ErAV3oymKJzAeGlx1P8KYzTpAPCdpPbXTk1w4fiGEFS2qIT+rQ9ZNNliBfAZAPnRJkKRcsF5Tp+Z5
	WTYKXzZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8zfH-00000006SBH-1rgm;
	Thu, 07 Nov 2024 10:22:59 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8zWt-00000006Qay-477m
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 10:14:21 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A7AE9W4007164;
	Thu, 7 Nov 2024 04:14:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730974449;
	bh=aAHPUbNs7M6QgxqG12AlzIrLLtSFknGoPRYn8hsW/Zw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=OaQU6j6SxZvQsqeOTwkdonkxFSNlzp2aNOpoUBETx19mczhRBENskfTOQwQwzkJf3
	 eJ5s1A3cAQl4HnuXJO43ks7DkRxRouVydG5hpdoS5b0J9mU3TSKJFx5lkCPDZ6DVnY
	 X2RiH1Y5B4PQzpdASA03OC8fF9I3Rnkv7z0MXHa8=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4A7AE9p3104642
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 7 Nov 2024 04:14:09 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 7
 Nov 2024 04:14:08 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 7 Nov 2024 04:14:08 -0600
Received: from localhost (prasanth-server.dhcp.ti.com [172.24.227.197])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A7AE7rb006059;
	Thu, 7 Nov 2024 04:14:07 -0600
Date: Thu, 7 Nov 2024 15:44:06 +0530
From: Prasanth Mantena <p-mantena@ti.com>
To: Bhavya Kapoor <b-kapoor@ti.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, <nm@ti.com>,
        <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <u-kumar1@ti.com>,
        <s-sinha@ti.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-j722s-evm: Enable support for mcu_i2c0
Message-ID: <20241107101406.6bj4xbiguzuwt5db@prasanth-server>
References: <20241105091224.23453-1-b-kapoor@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241105091224.23453-1-b-kapoor@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_021420_172655_528DA4D9 
X-CRM114-Status: GOOD (  14.16  )
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

On 14:42, Bhavya Kapoor wrote:
> Enable support for mcu_i2c0 and add pinmux required to bring out the
> mcu_i2c0 signals on 40-pin RPi expansion header on the J722S EVM.
> 
> Signed-off-by: Bhavya Kapoor <b-kapoor@ti.com>
> Signed-off-by: Shreyash Sinha <s-sinha@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-j722s-evm.dts | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
> index a00f4a7d20d9..796287c76b69 100644
> --- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
> @@ -406,6 +406,13 @@ &main_uart5 {
>  
>  &mcu_pmx0 {
>  
> +	mcu_i2c0_pins_default: mcu-i2c0-default-pins {
> +		pinctrl-single,pins = <
> +			J722S_MCU_IOPAD(0x048, PIN_INPUT, 0) /* (E11) MCU_I2C0_SDA */
> +			J722S_MCU_IOPAD(0x044, PIN_INPUT, 0) /* (B13) MCU_I2C0_SCL */
> +		>;
> +	};
> +
>  	mcu_mcan0_pins_default: mcu-mcan0-default-pins {
>  		pinctrl-single,pins = <
>  			J722S_MCU_IOPAD(0x038, PIN_INPUT, 0) /* (D8) MCU_MCAN0_RX */
> @@ -812,3 +819,10 @@ &main_mcan0 {
>  &mcu_gpio0 {
>  	status = "okay";
>  };
> +
> +&mcu_i2c0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mcu_i2c0_pins_default>;
> +	clock-frequency = <400000>;
> +	status = "okay";
> +};

Reviewed-by: Prasanth Babu Mantena <p-mantena@ti.com>

> -- 
> 2.34.1
> 
> 

