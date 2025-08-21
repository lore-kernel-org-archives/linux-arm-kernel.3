Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8BBBCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 05:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hFB3oC/joJWZDcoQlOQoYsmel5gZzcnRSFC0rE3cftg=; b=vVkTTYcCeZznavWzu8BLusq4RO
	gzw/PQ0lP4SvN6NQoiBMEQoaAs9Q/7MMcERh1VFYUzDRDO6VWcdvBIYhMTsHyFHjOIY++x3xNwKx0
	hLNhiUO23iLYaJdbQQln4Nd5t6t52EGOqFV7eY84YsAz8+orpcOZC8QJGkDOV8Yt/lfRq0fFhVgxl
	VZnJq3aft9ddpPTBZppo0H4BUlmfYXt4zylXRU3bp+W9kIqEvTlZmYFjcfugabfg+rRmepdUQA+I8
	5tNNTr2mYjepD8wIDK/3x/pk+fh6LbEHv8r7t0ZN/YSdOuhT7lvqU0kT0InYH0XjlAH8RZqPJyaRe
	CSUlST+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoxgF-0000000FrdA-26lv;
	Thu, 21 Aug 2025 05:17:43 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoxY9-0000000Fr9x-2cqZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 05:09:23 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57L59Hcf411850;
	Thu, 21 Aug 2025 00:09:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755752957;
	bh=hFB3oC/joJWZDcoQlOQoYsmel5gZzcnRSFC0rE3cftg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ADTSZn+8UYtlDiHeijjFNw4nqgkzvEBRHAmOdfnJDVjd91hUvHWgea8fWeW220BUr
	 3qe9QDWQYoQKoVhArf5XvRmhccoNIXoh/1F2cI+RLO7d2piuitCtjwmaE5Jg/TrN90
	 z5sSiKgk4hzEuYZnD/3Zo5wxVCHQlfiW2p4z/KUw=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57L59Huj1883868
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 21 Aug 2025 00:09:17 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 21
 Aug 2025 00:09:17 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 21 Aug 2025 00:09:17 -0500
Received: from localhost (uda0492258.dhcp.ti.com [172.24.231.84])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57L59Gf41621045;
	Thu, 21 Aug 2025 00:09:16 -0500
Date: Thu, 21 Aug 2025 10:39:15 +0530
From: s-vadapalli <s-vadapalli@ti.com>
To: Michael Walle <mwalle@kernel.org>
CC: s-vadapalli <s-vadapalli@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-j722s-main: add legacy PCIe interrupts
Message-ID: <663079dc-54cf-4f29-a68b-fc9678c44af0@ti.com>
References: <20250819111317.1082515-1-mwalle@kernel.org>
 <ae898bf0-705f-4e36-9664-37c401f5fee7@ti.com>
 <DC7B5N92V9KZ.34OXBFYOIEWBO@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DC7B5N92V9KZ.34OXBFYOIEWBO@kernel.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_220921_762612_C89CFA9E 
X-CRM114-Status: GOOD (  30.21  )
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

On Wed, Aug 20, 2025 at 04:00:45PM +0200, Michael Walle wrote:
> Hi Siddharth,
> 
> On Wed Aug 20, 2025 at 3:52 PM CEST, s-vadapalli wrote:
> > On Tue, Aug 19, 2025 at 01:13:17PM +0200, Michael Walle wrote:
> >
> > Hello Michael,
> >
> >> The kernel will try to map the legacy interrupt pins, but the
> >> interrupt mapping is missing from the device tree and thus that
> >> fails with:
> >> 
> >>    pcieport 0000:00:00.0: of_irq_parse_pci: failed with rc=-22
> >> 
> >> Add the node for the legacy PCIe interrupts to fix that. This is just
> >> compile-time tested.
> >
> > INTx is not supported by the driver as explained at:
> > https://lore.kernel.org/r/be3e3c5f-0d48-41b0-87f4-2210f13b9460@ti.com/
> >
> > The patch to fix the error displayed in the logs was posted at:
> > https://lore.kernel.org/r/20240726135903.1255825-1-s-vadapalli@ti.com/
> > but wasn't accepted as-is. A different approach will be required to fix
> > of_irq_parse_pci() instead as pointed out at:
> > https://lore.kernel.org/r/20240729080006.GA8698@thinkpad/
> 
> Thanks for the pointers.
> 
> I've just checked the J722S errata sheet and there is no such
> erratum. So, is that sheet outdated or was it fixed?

According to the Errata documents, the errata only affects J721E SoC.
The procedure to enable the INTx support is the following:
1. Update DT bindings to indicate that INTx is valid only for SoCs other
   than J721E SoCs on the basis of the compatible.
2. Add support in the pci-j721e.c driver for INTx.
3. Finally, the current patch or patches for other SoCs to add INTx can
   be posted and merged.

The following series which was posted in 2021 corresponds to 1 and 2
above:
https://lore.kernel.org/r/20210811123846.31921-1-kishon@ti.com/

Please note that the above series was included in the downstream (TI)
Linux in the past. It was observed that despite the Errata not affecting
the AM64 SoC (contains a Cadence PCIe Controller and is programmed by the
same pci-j721e.c driver), legacy interrupts were missed and resulted in the
PCIe Endpoint device becoming non-functional. Resolving this issue
required retriggering the interrupt following which the device became
functional.

Therefore, it is encouraged that MSI/MSI-X are used instead. If INTx is a
necessity (unlike the current patch which only aims to prevent error logs
from showing up), then the aforementioned series can be used with the
disclaimer that it may still lead to interrupts being missed.

Regards,
Siddharth.

