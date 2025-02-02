Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8DD7C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Feb 2025 09:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L/i4eRZNbI/2LmwrJhJ+kldcgaXTdKy2bIex3xqeu3Y=; b=vIXBkI0bGTCf7SeFld32KoOZKZ
	XWtuCuNTcnTbvWbN9nbQoo67wXMjfJcvSCoLjDvXAdMUZLQlod5UG8wPjj7EOOPxfxdbobizmiReG
	DOcIq0RuAn3A1q+qHvUdYblS1f9W9Ch7YAPSblV41kJDHS40QO946mQgO1Qe7rzelg++j+MunXkxX
	sP2BstSv0QLyuaIIDyyR2e6OKhATu+sfwB41HQoIjd65DFs/NjwmbcDuXrKvNylh9OIGSnKvJztez
	aWwwqf3xKqoYkHgX0G8OhpxSi4woCDZ6SHVbzXpRflQL0JQPOPclBeNmhwesibh8uOMhaSPDpHbhX
	Vhe4+VKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teWWo-0000000DaOZ-2333;
	Sun, 02 Feb 2025 09:44:34 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teWUs-0000000DaCg-2isV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Feb 2025 09:42:35 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5129gVwS2003669
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 2 Feb 2025 03:42:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738489351;
	bh=L/i4eRZNbI/2LmwrJhJ+kldcgaXTdKy2bIex3xqeu3Y=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=MNU7IPTVB3lbOGGEs3E+uSvqf/2w70m1y7OUnHVIWJblL1LOQBpzXkcAxRQkmZt1v
	 QUdNxe5SsIvGW7Hctjt/PqgnxGli5/z0QMMhO6zV14J8P8HI2coB1WhZ0DR5iFtkut
	 LMhrPhBMEBTUaKAQ8z4gbErN+KZ7FMqjJXe9YYhI=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5129gVDu023079
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 2 Feb 2025 03:42:31 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 2
 Feb 2025 03:42:31 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 2 Feb 2025 03:42:30 -0600
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.104])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5129gTt3124995;
	Sun, 2 Feb 2025 03:42:30 -0600
Date: Sun, 2 Feb 2025 15:12:29 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-j784s4-j742s2-evm: Add overlay to
 enable USB0 Type-A
Message-ID: <yui6gakfnu43wrpupqjzodd2hcwk4tbqrjunauottazjvxbx3l@in54codtcgg3>
References: <20250124124150.2024963-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250124124150.2024963-1-s-vadapalli@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_014234_776879_395B6B08 
X-CRM114-Status: GOOD (  26.58  )
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

On Fri, Jan 24, 2025 at 06:11:49PM +0530, Siddharth Vadapalli wrote:

This patch has been merged with the following series due to Makefile
dependencies:
https://lore.kernel.org/r/20250202093636.2699064-1-s-vadapalli@ti.com/
and therefore has been superseded by its equivalent in the above series.

Regards,
Siddharth.

> The USB0 instance of the USB controller on both the J742S2 EVM and the
> J784S4 EVM supports a single USB interface at a time among the following:
> 1. USB3.1 Gen1 Type C interface
> 2. Two USB2.0 Type A interfaces via an on-board USB Hub.
> 
> By default, the USB3.1 Gen1 Type C interface is supported on both of the
> EVMs. Enable the USB2.0 Type A interface by configuring the USB2.0_MUX_SEL
> mux. Additionally, set the Dual-Role Mode to Host since a Type-A interface
> is only associated with the Host Mode of operation.
> 
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
> 
> Hello,
> 
> This patch is based on linux-next tagged next-20250124.
> Since Linux boot is broken on all TI K3 SoCs including
> J742S2 and J784S4 due to:
> https://github.com/torvalds/linux/commit/ba5095ebbc7a
> as indicated at:
> https://lore.kernel.org/r/b2413460-ec8b-4c77-99b8-4c32b262439a@ti.com/
> this patch was tested on J784S4-EVM by reverting the aforementioned commit.
> Logs validating the USB2.0 Type-A Connector on J784S4-EVM using a USB Pen
> Drive:
> https://gist.github.com/Siddharth-Vadapalli-at-TI/663d703912ae574e39d7a78421e404c8
> 
> Regards,
> Siddharth.
> 
>  arch/arm64/boot/dts/ti/Makefile               |  7 +++++
>  .../ti/k3-j784s4-j742s2-evm-usb0-type-a.dtso  | 29 +++++++++++++++++++
>  2 files changed, 36 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-usb0-type-a.dtso
> 
> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
> index 8a4bdf87e2d4..95b8fd0981d7 100644
> --- a/arch/arm64/boot/dts/ti/Makefile
> +++ b/arch/arm64/boot/dts/ti/Makefile
> @@ -127,6 +127,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm.dtb
>  dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm-pcie0-pcie1-ep.dtbo
>  dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm-quad-port-eth-exp1.dtbo
>  dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm-usxgmii-exp1-exp2.dtbo
> +dtb-$(CONFIG_ARCH_K3) += k3-j784s4-j742s2-evm-usb0-type-a.dtbo
>  
>  # Boards with J742S2 SoC
>  dtb-$(CONFIG_ARCH_K3) += k3-j742s2-evm.dtb
> @@ -209,10 +210,14 @@ k3-j721e-sk-csi2-dual-imx219-dtbs := k3-j721e-sk.dtb \
>  	k3-j721e-sk-csi2-dual-imx219.dtbo
>  k3-j721s2-evm-pcie1-ep-dtbs := k3-j721s2-common-proc-board.dtb \
>  	k3-j721s2-evm-pcie1-ep.dtbo
> +k3-j742s2-evm-usb0-type-a-dtbs := k3-j742s2-evm.dtb \
> +	k3-j784s4-j742s2-evm-usb0-type-a.dtbo
>  k3-j784s4-evm-pcie0-pcie1-ep-dtbs := k3-j784s4-evm.dtb \
>  	k3-j784s4-evm-pcie0-pcie1-ep.dtbo
>  k3-j784s4-evm-quad-port-eth-exp1-dtbs := k3-j784s4-evm.dtb \
>  	k3-j784s4-evm-quad-port-eth-exp1.dtbo
> +k3-j784s4-evm-usb0-type-a-dtbs := k3-j784s4-evm.dtb \
> +	k3-j784s4-j742s2-evm-usb0-type-a.dtbo
>  k3-j784s4-evm-usxgmii-exp1-exp2-dtbs := k3-j784s4-evm.dtb \
>  	k3-j784s4-evm-usxgmii-exp1-exp2.dtbo
>  dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
> @@ -243,8 +248,10 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
>  	k3-j721e-evm-pcie1-ep.dtb \
>  	k3-j721e-sk-csi2-dual-imx219.dtb \
>  	k3-j721s2-evm-pcie1-ep.dtb \
> +	k3-j742s2-evm-usb0-type-a.dtb \
>  	k3-j784s4-evm-pcie0-pcie1-ep.dtb \
>  	k3-j784s4-evm-quad-port-eth-exp1.dtb \
> +	k3-j784s4-evm-usb0-type-a.dtb \
>  	k3-j784s4-evm-usxgmii-exp1-exp2.dtb
>  
>  # Enable support for device-tree overlays
> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-usb0-type-a.dtso b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-usb0-type-a.dtso
> new file mode 100644
> index 000000000000..ba15d72d86d6
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-usb0-type-a.dtso
> @@ -0,0 +1,29 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/**
> + * DT Overlay for enabling USB0 instance of USB on J784S4 and J742S2 EVMs for
> + * Host Mode of operation with the Type-A Connector.
> + *
> + * J784S4 EVM Product Link: https://www.ti.com/tool/J784S4XEVM
> + * J742S2 EVM Product Link: https://www.ti.com/tool/J742S2XH01EVM
> + *
> + * Copyright (C) 2025 Texas Instruments Incorporated - https://www.ti.com/
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&exp2 {
> +	p12-hog {
> +		/* P12 - USB2.0_MUX_SEL */
> +		gpio-hog;
> +		gpios = <12 GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "USB2.0_MUX_SEL";
> +	};
> +};
> +
> +&usb0 {
> +	dr_mode = "host";
> +};
> -- 
> 2.43.0
> 

