Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B992E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 17:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WossqK9t7qt/somrlykgNmv9HqmdtOqk2g4fIHGXdAg=; b=kOmSBq+gt5x3vJFt+a9lGqq1iZ
	ZxVAeSmqfxuQ13qgQ7Zt0MLlHuxGSsCrOEE1kb2ukeMeFmfUvH/ANaYrDWMHEveTqPvJsd53skWZa
	nM++4o+ieNiOm0tk7dDe/BW5/gywbU9REdvDVsfOlEwQ3FgIVPX7wZsVE0LiywfPVQeAlFJabUaXy
	ANckvVXxzvJRSdYKDhcfIdNY8wdO6rCiF6JRiPHvgHAj/vAEad5CKfddFWBdCm6DyGuzDCnTU1W7H
	O4RRoRnjkqSowOJ/pJSM9Xvt5a3pEme/tzqDuzmQwbyhWs0dTP2qnnEaIQ2TSJblOr3orXZbBBKQB
	ddEDmBDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVwci-0000000CtUL-2oxV;
	Thu, 09 Jan 2025 17:47:12 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVwb4-0000000Ct5y-1eyM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 17:45:31 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 509HjOVE038425;
	Thu, 9 Jan 2025 11:45:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736444724;
	bh=WossqK9t7qt/somrlykgNmv9HqmdtOqk2g4fIHGXdAg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=KHFQlwRWF4fHUiW+S5dknoqi4XpRqGZ3lGPwaVmyeXT6aX9nn3CIpMwnHIn9PofO4
	 c2AJA6xWqE71f9CrP9sJZSa/vDv5bO5YRbBxHmwPfzUiFI7XQidW7jkO7vw1labZDg
	 BmittDWQE8sqZnbFXHrVbXNiEzkT0sDEbuuI6spw=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 509HjOPB061224
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Jan 2025 11:45:24 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 9
 Jan 2025 11:45:24 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 9 Jan 2025 11:45:24 -0600
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 509HjOsF108072;
	Thu, 9 Jan 2025 11:45:24 -0600
Date: Thu, 9 Jan 2025 11:45:24 -0600
From: Bryan Brattlof <bb@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
CC: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: ti: k3-am62l: add initial reference
 board file
Message-ID: <20250109174524.mfk5o4myhvy4577n@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250108-am62lx-v2-0-581285a37d8f@ti.com>
 <20250108-am62lx-v2-3-581285a37d8f@ti.com>
 <2f9b9ea6-f99d-4883-bd3d-f7ee8f0f5bd5@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <2f9b9ea6-f99d-4883-bd3d-f7ee8f0f5bd5@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_094530_523754_08A56C2A 
X-CRM114-Status: GOOD (  17.51  )
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

On January  9, 2025 thus sayeth Vignesh Raghavendra:
> On 09/01/25 04:21, Bryan Brattlof wrote:
> > From: Vignesh Raghavendra <vigneshr@ti.com>
> > 
> > Add the initial board file for the AM62L3's Evaluation Module.
> > 
> > Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> > Signed-off-by: Bryan Brattlof <bb@ti.com>
> > ---
> > Changes in v1:
> >  - switched to non-direct links so TRM updates are automatic
> >  - removed current-speed property from main_uart0
> >  - removed empty reserved-memory{} node
> >  - removed serial2 from aliases{} node
> >  - corrected main_uart0 pinmux
> > ---
> >  arch/arm64/boot/dts/ti/k3-am62l3-evm.dts | 43 ++++++++++++++++++++++++++++++++
> >  1 file changed, 43 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
> > new file mode 100644
> > index 0000000000000..ed0148ce1bea6
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
> > @@ -0,0 +1,43 @@
> > +// SPDX-License-Identifier: GPL-2.0-only or MIT
> > +/*
> > + * Device Tree file for the AM62L3 Evaluation Module
> > + * Copyright (C) 2024 Texas Instruments Incorporated - https://www.ti.com/
> > + *
> > + * Technical Reference Manual: https://www.ti.com/lit/pdf/sprujb4
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
> > +	chosen {
> > +		stdout-path = &main_uart0;
> > +	};
> > +
> > +	memory@80000000 {
> > +		reg = <0x00000000 0x80000000 0x00000000 0x80000000>;
> > +		device_type = "memory";
> > +		bootph-all;
> > +	};
> > +};
> > +
> > +&pmx0 {
> > +	main_uart0_pins_default: main_uart0-default-pins {
> > +		pinctrl-single,pins = <
> 
> 
> > +			AM62PX_IOPAD(0x01b4, PIN_INPUT, 0)	/* (D13) UART0_RXD */
> > +			AM62PX_IOPAD(0x01b8, PIN_OUTPUT, 0)	/* (C13) UART0_TXD */
> 
> 			^^^^ AM62LX_IOPAD()

Oops! thanks Vignesh

~Bryan

