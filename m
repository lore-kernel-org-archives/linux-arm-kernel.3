Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB14D44152
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 14:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cynzEoYvDf0pcd1GzvErfNECaSezgc6N8fmmyfqTK1s=; b=TI6ghaEczATB74+tIzyFLYdxCG
	QU7LWjhxDNe5CroN5LX+UbVtolgyzTCvlVjEy+yRTSiRSn5FeRg1WMr+DUYEdsWmnpkh5L4oHEMg+
	B5txajUarvn0OeskEwfHDNBDClSu5DRFP8V0YVpB8PncFxz3nfuF96u7nmmzGgl9tbYakY5HMuZ3o
	hii5p7+KLpnipcAvj/va+sAIo8ojjEYIumBpMo/eRN2f/W/j2hYjGWKHArZ1FiCqRK5s9qnQhRFbk
	zL7pCbQFPPsribXYV/sAZ2GW3s2WSEP2QX1JZNFC1g1tpbGsj5o4amn0aRcKED6E0x8piIyyromLr
	u5pKi2zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDm0G-0000000Fae0-1zju;
	Wed, 20 Nov 2024 14:48:24 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDlzI-0000000FaSa-2d5x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 14:47:26 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4AKElCpV069884;
	Wed, 20 Nov 2024 08:47:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1732114032;
	bh=cynzEoYvDf0pcd1GzvErfNECaSezgc6N8fmmyfqTK1s=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=FSaSWUlqFgfSmcTU+UBy1yOBuvsIh4VFGFZ9INaWSePiOJDaEKGhPoJa9X7AnSz2o
	 Pyfa9f9owuIsIHZkFKqhdknafVhkx/XW70itrOThTElRv5x+3obxkJIlGsXrqcNlAk
	 qjsO3UU97ea/HhygFhmAA9zyjELBEVh0aJZZdrvc=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4AKElCPq020368
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 20 Nov 2024 08:47:12 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 20
 Nov 2024 08:47:12 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 20 Nov 2024 08:47:12 -0600
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4AKElCLp004675;
	Wed, 20 Nov 2024 08:47:12 -0600
Date: Wed, 20 Nov 2024 08:47:12 -0600
From: Bryan Brattlof <bb@ti.com>
To: Andrew Davis <afd@ti.com>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: ti: k3-am62l: add initial reference
 board file
Message-ID: <20241120144712.dxiu34ocv7xdv5rm@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20241117-am62lx-v1-0-4e71e42d781d@ti.com>
 <20241117-am62lx-v1-2-4e71e42d781d@ti.com>
 <c8834352-75a7-446e-95eb-809aaa5cb18b@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <c8834352-75a7-446e-95eb-809aaa5cb18b@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_064724_751547_19D775CA 
X-CRM114-Status: GOOD (  22.19  )
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

On November 18, 2024 thus sayeth Andrew Davis:
> On 11/17/24 11:34 PM, Bryan Brattlof wrote:
> > From: Vignesh Raghavendra <vigneshr@ti.com>
> > 
> > Add the initial board file for the AM62L3's Evaluation Module.
> > 
> > Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> > Signed-off-by: Bryan Brattlof <bb@ti.com>
> > ---
> >   arch/arm64/boot/dts/ti/k3-am62l3-evm.dts | 54 ++++++++++++++++++++++++++++++++
> >   1 file changed, 54 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
> > new file mode 100644
> > index 0000000000000..2d59389765cab
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
> > @@ -0,0 +1,54 @@
> > +// SPDX-License-Identifier: GPL-2.0-only or MIT
> > +/*
> > + * Device Tree file for the AM62L3 Evaluation Module
> > + * Copyright (C) 2024 Texas Instruments Incorporated - https://www.ti.com/
> > + *
> > + * Technical Reference Manual: https://www.ti.com/lit/ug/sprujb4/sprujb4.pdf
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "k3-am62l3.dtsi"
> > +
> > +/ {
> > +	compatible = "ti,am62l3-evm", "ti,am62l3";
> > +	model = "Texas Instruments AM62L3 Evaluation Module";
> > +
> > +	aliases {
> > +		serial2 = &main_uart0;
> 
> We usually have WKUP and MCU UARTs as serial0 and serial1, we don't
> have that many, so we would never have serial1, only 0 and 2. Might
> be time we drop this odd numbering convention, at least for AM62L
> class parts..
> 

Good point. I'll see what I can come up with

> > +	};
> > +
> > +	chosen {
> > +		stdout-path = &main_uart0;
> > +	};
> > +
> > +	memory@80000000 {
> > +		reg = <0x00000000 0x80000000 0x00000000 0x80000000>;
> > +		device_type = "memory";
> > +		bootph-all;
> > +	};
> > +
> > +	reserved-memory {
> 
> Not needed until you have something to reserve.
> 

Ah I agree. I'll drop this next time.

> > +		ranges;
> > +		#address-cells = <2>;
> > +		#size-cells = <2>;
> > +	};
> > +};
> > +
> > +&pmx0 {
> > +	main_uart0_pins_default: main_uart0-default-pins {
> > +		pinctrl-single,pins = <
> > +			AM62LX_IOPAD(0x01d4, PIN_INPUT, 1)	  /* (D7)  UART0_RXD */
> > +			AM62LX_IOPAD(0x01d8, PIN_OUTPUT, 1)	  /* (A6)  UART0_TXD */
> > +		>;
> > +		bootph-all;
> > +	};
> > +};
> > +
> > +&main_uart0 {
> > +	current-speed = <115200>;
> 
> current-speed is only for UARTs that can't detect their current speed,
> our UART and driver can, so this line isn't needed.
> 

Nice! I'll drop this property as well

~Bryan

