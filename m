Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28119C021A6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 13:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gp1YmZDLlctdJ2qAsgxJlardnafNa0a8HtmhPHKallg=; b=OeWgEmT/WQ5l9GhSmbobJ76AB8
	KGqEtBgmhvzjaFjAQWNvQbQSoU3K/IeSXojt6dBlf1BMBf3SIGYLvPinQNBMiB9sHzDLB9ZZdeBmj
	VO0qrqsW7TAqdtL6kLygg7fS0YxmJbVhD3j5LG2MBiSrTBXBVxN2PihNkGkMw9i0a/7mShdH9itt1
	W3MTiTYCrgrkfmdKdIydpHvbENOKXKN6fn3AvBVUgPAZn2gtDm9Zx8GRlQQ4YWRNjikKCTekMNrLO
	1vAoLj/+NK3FVcO7bnm6+dmRGO+bExp69ipiQnqBOaP+4Neb1tHZalg4ILMMZ5alXeLCtBQ5swI7G
	HYbOCl1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYHL-0000000Dn2r-23tZ;
	Mon, 24 Feb 2025 13:13:47 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmXIr-0000000DdIQ-1vkO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 12:11:18 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51OCBCod910846
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Feb 2025 06:11:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740399072;
	bh=gp1YmZDLlctdJ2qAsgxJlardnafNa0a8HtmhPHKallg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=f4kNN1gGAr0m0N8FzVKQbvTwswQoGRbZW4+Mc9RPbqyTyPphJXJUMhnOwKkltfOdt
	 0+bY9mM2ut/had/lHM2mV1dzTfqWjE/ue8ggfpPuPQ+Bs+4k1WIQ5siTMqNNTcbejo
	 0Zp/OArPggxqwaPsgagYxVtGyA4r0agFa4S6imV8=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51OCBCD2014532
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 24 Feb 2025 06:11:12 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 24
 Feb 2025 06:11:11 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 24 Feb 2025 06:11:11 -0600
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51OCBAPi119936;
	Mon, 24 Feb 2025 06:11:11 -0600
Date: Mon, 24 Feb 2025 17:41:10 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>, <nm@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>
Subject: Re: [PATCH 2/3] arm64: dts: ti: k3-j784s4-j742s2-evm: Add overlay
 for PCIe NTB
Message-ID: <20250224121110.w3mu55otlgplcw6j@uda0492258>
References: <20250202093636.2699064-1-s-vadapalli@ti.com>
 <20250202093636.2699064-3-s-vadapalli@ti.com>
 <d6440feb-ea23-49f8-9886-82d0e2145f12@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d6440feb-ea23-49f8-9886-82d0e2145f12@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_041117_590577_2C7B8408 
X-CRM114-Status: GOOD (  16.65  )
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

On Mon, Feb 24, 2025 at 05:35:47PM +0530, Vignesh Raghavendra wrote:

Hello Vignesh,

> 
> 
> On 02/02/25 15:06, Siddharth Vadapalli wrote:
> > diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-pcie-ntb.dtso b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-pcie-ntb.dtso
> > new file mode 100644
> > index 000000000000..e44173f670fa
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-pcie-ntb.dtso
> > @@ -0,0 +1,92 @@
> > +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> > +/**
> > + * DT Overlay for enabling NTB functionality using PCIE0 and PCIE1 instances of
> > + * PCIe on the J784S4 EVM and the J742S2 EVM.
> > + *
> > + * J784S4 EVM Product Link: https://www.ti.com/tool/J784S4XEVM
> > + * J742S2 EVM Product Link: https://www.ti.com/tool/J742S2XH01EVM
> > + *
> > + * Copyright (C) 2025 Texas Instruments Incorporated - https://www.ti.com/
> > + */
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +#include <dt-bindings/soc/ti,sci_pm_domain.h>
> > +
> > +#include "k3-pinctrl.h"
> > +
> > +&{/} {
> > +	epf_bus {
> 
> 
> no underscore in node name please

Thank you for pointing this out. I will fix it in this as well as the
previous patch in this series and post the v2 series.

Regards,
Siddharth.

