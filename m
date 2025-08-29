Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC21ACA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 06:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3IPwZazoSn4ZeSr5DFrwiRXhN0snIHoAAJIH9eLfr9U=; b=IrpqmhJ9N6YIabh6ex1l1DRJoZ
	Dnmg/Z4+Ss7ENLStSOCPT8IHMtmD7fwTjRRgFm6BQMDslexBR4yprgJTPCr+bF3XoDJ0dDX7bnFth
	k2vMZI8NUmChZGPvgCKZyO+iUo0BdxS9cpmsCMvK8ThOkJKUtUuvaDti/fV6sotOcVLKKknds2yQH
	u3oV3geeS5Mg3KnnKPYBTDXLA2gsSR6MMSSgg5VEwJmPBJm2FpYezeYHtBK/RIUpcxdpFlhXu1hoX
	SWKJAYwiIi6ACnn2iPUip3y03IzKvmrWwWBQBjD6EZ8S/uSkJfk6o0nmMBSVClLUKGZjnH/V8APA5
	sg1kgSoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ursUl-00000004d4c-2C2J;
	Fri, 29 Aug 2025 06:21:55 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ursRt-00000004caz-43RL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 06:18:59 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57T6IrnH2151732;
	Fri, 29 Aug 2025 01:18:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756448333;
	bh=3IPwZazoSn4ZeSr5DFrwiRXhN0snIHoAAJIH9eLfr9U=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=VlAr7cp1b4CRn3SlUE3hf7hIh7IZy/hHvtEir/A8wQug1degH7AhhyKmubIkPa5vl
	 9lfYiNyPXKy4wnhWicf7HGtm5Nhzt5rkxHrpwHVirZBN72EcpOaIC1QZfRBNW0/Szi
	 pYdaqIVn8+Ff7bc2ksiE7BHEllszOJ4pIEEFRTKc=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57T6IqF43805307
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 29 Aug 2025 01:18:53 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 29
 Aug 2025 01:18:52 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 29 Aug 2025 01:18:52 -0500
Received: from [172.24.20.139] (lt5cd2489kgj.dhcp.ti.com [172.24.20.139])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57T6ImNR1891002;
	Fri, 29 Aug 2025 01:18:48 -0500
Message-ID: <c542ad3f-8e6d-405a-92d3-4e45cbcfc2a3@ti.com>
Date: Fri, 29 Aug 2025 11:48:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: ti: k3-j742s2-mcu-wakeup: Override
 firmware-name for MCU R5F cores
To: Beleswar Padhi <b-padhi@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <jm@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <u-kumar1@ti.com>
References: <20250823163111.2237199-1-b-padhi@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250823163111.2237199-1-b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_231858_107506_EA8F9BF5 
X-CRM114-Status: GOOD (  18.40  )
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


On 8/23/2025 10:01 PM, Beleswar Padhi wrote:
> The J742S2 SoC reuses the common k3-j784s4-j742s2-mcu-wakeup-common.dtsi
> for its MCU domain, but it does not override the firmware-name property
> for its R5F cores. This causes the wrong firmware binaries to be
> referenced.
>
> Introduce a new k3-j742s2-mcu-wakeup.dtsi file to override the
> firmware-name property with correct names for J742s2.
>
> Fixes: 38fd90a3e1ac ("arm64: dts: ti: Introduce J742S2 SoC family")
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
> v2: Changelog:
> 1. Posted this patch as a fix as decided in v1, so added Fixes tag.
>
> Link to v1:
> https://lore.kernel.org/all/20250522073426.329344-2-b-padhi@ti.com/
>
>   .../arm64/boot/dts/ti/k3-j742s2-mcu-wakeup.dtsi | 17 +++++++++++++++++
>   arch/arm64/boot/dts/ti/k3-j742s2.dtsi           |  1 +
>   2 files changed, 18 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/ti/k3-j742s2-mcu-wakeup.dtsi
>
> diff --git a/arch/arm64/boot/dts/ti/k3-j742s2-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j742s2-mcu-wakeup.dtsi
> new file mode 100644
> index 000000000000..61db2348d6a4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-j742s2-mcu-wakeup.dtsi
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Device Tree Source for J742S2 SoC Family
> + *
> + * TRM: https://www.ti.com/lit/pdf/spruje3
> + *
> + * Copyright (C) 2025 Texas Instruments Incorporated - https://www.ti.com/
> + *
> + */
> +
> +&mcu_r5fss0_core0 {
> +	firmware-name = "j742s2-mcu-r5f0_0-fw";
> +};
> +
> +&mcu_r5fss0_core1 {
> +	firmware-name = "j742s2-mcu-r5f0_1-fw";
> +};


Reviewed-by: Udit Kumar <u-kumar1@ti.com>


> diff --git a/arch/arm64/boot/dts/ti/k3-j742s2.dtsi b/arch/arm64/boot/dts/ti/k3-j742s2.dtsi
> index 7a72f82f56d6..d265df1abade 100644
> --- a/arch/arm64/boot/dts/ti/k3-j742s2.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j742s2.dtsi
> @@ -96,3 +96,4 @@ cpu3: cpu@3 {
>   };
>   
>   #include "k3-j742s2-main.dtsi"
> +#include "k3-j742s2-mcu-wakeup.dtsi"

