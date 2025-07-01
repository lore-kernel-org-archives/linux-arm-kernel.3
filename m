Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66154C83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 19:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F0aaeqii1FsfQz1PyoUyvITJVetiar7DEiLzMVrI2l8=; b=ElfcYPyhkYyMx/wob20rmqV15F
	fw8Mjl6MCfm4aCoouFZRRtvVf7q0nFoeZY3jKH1GPbKi2HvG0cNyVNkQKrK5bFiqnsKGaAMfu60cO
	yH/MZRwbUthnTe5VqNvPVV5jXnfkhyNrTQnWXN7rqUgCfLlWPnEqPw7utW0iiPma1SB1IHVC63yPP
	Vhp965XcccR6kspeTTeEHxaTVdkIbhc9X0K/oieQjDCZMF7gOGhVdXoN3SjvZ6m1O6OjLAhJ8M1p9
	LmmdXPx/dE+twgTz5GlV9wovSKm73uhtUbDEPthWM4gK08Sa7WFNzonGQ27YMT8A+f8pF6ZdN6ZBe
	zAwYymyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWgDP-00000006PBV-3Fdk;
	Tue, 01 Jul 2025 19:00:23 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWdnA-0000000622r-381l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 16:25:10 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 561GP4qi3678843;
	Tue, 1 Jul 2025 11:25:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751387104;
	bh=F0aaeqii1FsfQz1PyoUyvITJVetiar7DEiLzMVrI2l8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ltPjtZ98RAhON84b4aXNpNH51/kttGd5AsEdJ0PEqFE8DzOe1sgs9ruAzwtSUZfB+
	 OA9lXihCXvhCvJmfNlBzp8o1DmtOO82ULt24DbfT+V6Y9AWPqvpkBYVy5fuIJQOR7K
	 KKcjtVquzA1fZx5Dg7Mm3c5NOYlP9HuKI6qIWXEY=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 561GP4VY2716776
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 1 Jul 2025 11:25:04 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 1
 Jul 2025 11:25:04 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 1 Jul 2025 11:25:03 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 561GP43p1598131;
	Tue, 1 Jul 2025 11:25:04 -0500
Date: Tue, 1 Jul 2025 11:25:04 -0500
From: Bryan Brattlof <bb@ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <khasim@ti.com>, <v-singh1@ti.com>,
        <afd@ti.com>, <devarsht@ti.com>, <s-vadapalli@ti.com>,
        <andrew@lunn.ch>
Subject: Re: [PATCH v5 4/4] arm64: dts: ti: Add support for AM62D2-EVM
Message-ID: <20250701162504.dck3763ik6kpo7ec@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250627115753.2246881-1-p-bhagat@ti.com>
 <20250627115753.2246881-5-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250627115753.2246881-5-p-bhagat@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_092508_874748_C3F66329 
X-CRM114-Status: GOOD (  22.66  )
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

On June 27, 2025 thus sayeth Paresh Bhagat:
> AM62D-EVM evaluation module (EVM) is a low-cost expandable platform board
> designed for AM62D2 SoC from TI. It supports the following interfaces:
> 
> * 4 GB LPDDR4 RAM
> * x2 Gigabit Ethernet expansion connectors
> * x4 3.5mm TRS Audio Jack Line In
> * x4 3.5mm TRS Audio Jack Line Out
> * x2 Audio expansion connectors
> * x1 Type-A USB 2.0, x1 Type-C dual-role device (DRD) USB 2.0
> * x1 UHS-1 capable micro SD card slot
> * 32 GB eMMC Flash
> * 512 Mb OSPI NOR flash
> * x4 UARTs via USB 2.0-B
> * XDS110 for onboard JTAG debug using USB
> * Temperature sensors, user push buttons and LEDs
> 
> Although AM62D2 and AM62A7 differ in peripheral capabilities example
> multimedia, VPAC, and display subsystems, the core architecture remains
> same. To reduce duplication, AM62D support reuses the AM62A dtsi and the
> necessary overrides will be handled in SOC specific dtsi file and a
> board specific dts.
> 
> Add basic support for AM62D2-EVM.
> 
> Schematics Link - https://www.ti.com/lit/zip/sprcal5
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
>  arch/arm64/boot/dts/ti/Makefile          |   3 +
>  arch/arm64/boot/dts/ti/k3-am62d2-evm.dts | 599 +++++++++++++++++++++++
>  arch/arm64/boot/dts/ti/k3-am62d2.dtsi    |  25 +
>  3 files changed, 627 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am62d2.dtsi
> 

...

> diff --git a/arch/arm64/boot/dts/ti/k3-am62d2.dtsi 
> b/arch/arm64/boot/dts/ti/k3-am62d2.dtsi
> new file mode 100644
> index 000000000000..70aeb40872a9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am62d2.dtsi
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Device Tree Source for AM62D2 SoC family in Quad core configuration
> + *
> + * TRM: https://www.ti.com/lit/pdf/sprujd4
> + *
> + * Copyright (C) 2025 Texas Instruments Incorporated - https://www.ti.com/
> + */
> +
> +/dts-v1/;
> +
> +#include "k3-am62a7.dtsi"

If we want to reuse the AM62A chassis I think we should probably reused 
the AM62AX_IOPAD() macro instead of creating a new one.

> +
> +/ {
> +	model = "Texas Instruments K3 AM62D SoC";
> +	compatible = "ti,am62d2";
> +};
> +
> +&vpu {
> +	status = "disabled";
> +};
> +
> +&e5010 {
> +	status = "disabled";
> +};

So I could be a little out of date on the style guidelines here, but my 
intuition is device trees, much like real trees, can only grow, so we 
can't inherit the am62a.dtsi and remove things.

My understanding is we have to create a full am62d.dtsi with its 
features that the am62a.dtsi can extend with the vpu{} and e5010{} nodes

~Bryan

