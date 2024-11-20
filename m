Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE66AD6C29C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 14:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0yO2zuf4irurHhzwC48kbucZy/ech29ZSQ7nZFb4Ofc=; b=4t5RzKg5e/v0CDf91RDyow8RFm
	83xbdsO2DdIkiKRhkwGLUZ0cTK6wq0mM6HomXw5x4uBYd8axioZvS56uH2MMKbX/8v9ZAHcgjciSh
	dAud4gwcm540bUYX01VtiLMpzNdN5JD4Ukr4alhWsfy3PVbGTRjYck4KlJpQI1U9ydWfrkciibIgb
	iWioqJG6f9LRZGrjFEQamgZKRMQPY31ICQsGv8T6rF+IVj2l92qFcOUI94BmRQh0CVSpf9Tv0k6VB
	DdXsEhPxLmUliilrf2E2XDxJr+qtTj0HEmpP7ekXUfMwUzJILJEE9VrNnO9o3e0aGmwDO6akRWZKi
	2a2+Niqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDm1F-0000000FatA-0LRm;
	Wed, 20 Nov 2024 14:49:25 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDm0H-0000000FaeS-2WJI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 14:48:27 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4AKEmLXx061696;
	Wed, 20 Nov 2024 08:48:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1732114101;
	bh=0yO2zuf4irurHhzwC48kbucZy/ech29ZSQ7nZFb4Ofc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=wn3rdKqh6/qzH2Nr9CU0gRS5uKJUoXsUqn0pBZkwgwQRCPThKNQF25vbDt3M6FHGD
	 0oGvI0FgXGabqgFReQpIUyk7cjnz2r6tzyk9PHMW0X2S99ebpy+u3siwIsCuVeI2LX
	 iqP/WDwiNb9W/tcG+s66Z1M75CFA1OZySZMiSm/4=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4AKEmL9p090028;
	Wed, 20 Nov 2024 08:48:21 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 20
 Nov 2024 08:48:19 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 20 Nov 2024 08:48:19 -0600
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4AKEmJCU005699;
	Wed, 20 Nov 2024 08:48:19 -0600
Date: Wed, 20 Nov 2024 08:48:19 -0600
From: Bryan Brattlof <bb@ti.com>
To: Wadim Egorov <w.egorov@phytec.de>
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
Message-ID: <20241120144819.ugoczb3zd4r3reiq@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20241117-am62lx-v1-0-4e71e42d781d@ti.com>
 <20241117-am62lx-v1-2-4e71e42d781d@ti.com>
 <097c4aad-2c1b-4aae-a0c3-e7693210eddb@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <097c4aad-2c1b-4aae-a0c3-e7693210eddb@phytec.de>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_064825_748900_02E1ECE7 
X-CRM114-Status: GOOD (  17.48  )
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

On November 19, 2024 thus sayeth Wadim Egorov:
> 
> 
> Am 18.11.24 um 06:34 schrieb Bryan Brattlof:
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
> 
> Looking at other IOPAD definitions it seems that for any mux mode which is
> not 0, the comment typically includes the ball name.
> 

Good point. All add those for the next round.

~Bryan

