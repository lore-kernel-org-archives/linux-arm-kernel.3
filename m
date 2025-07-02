Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A5FAC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 14:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nhks9HSD90EH1xPE5unZ5FUzODIrbEcLl/DUU0q0sz4=; b=sCFtXII/E1xLT8ZyngxA/pIpif
	7FVG4asSHvPKGRAfCnYUUA6MO8vAHKESTq7n0MDUrHmfm6Je4JGFGH2jhPMOriiycxSLGuEgu3fdR
	HccwWOE9v29cauvPi3sS0ck/QNFbUCFzQeIZsc4JM1GOBNQoLAdibq9HKPC9qaFMxmeb3bNd8Yw07
	xbuBrPi5PXkPUWkyj+fJtC4XH5C5l3XoVaV7m3HSFEPHPe2Z1Y527uluRW7oHwnf5uAxNWXfh5eWp
	LAoOshgi9wzvHPnSXn+GbNphr6ESC4m6hNXV4WnPnBc7PMHNVeu7TrP/zqm3oA8JAvHD5Pw678vEB
	aZpkKTwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWyd2-00000008eSk-0muw;
	Wed, 02 Jul 2025 14:40:04 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxTw-00000008S0N-1jQm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 13:26:38 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bXLHf04Klz6M5HF;
	Wed,  2 Jul 2025 21:25:34 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id A0CB114022E;
	Wed,  2 Jul 2025 21:26:29 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 2 Jul
 2025 15:26:28 +0200
Date: Wed, 2 Jul 2025 14:26:27 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
CC: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, "Sascha
 Bischoff" <sascha.bischoff@arm.com>, Timothy Hayes <timothy.hayes@arm.com>,
	Bjorn Helgaas <bhelgaas@google.com>, "Liam R. Howlett"
	<Liam.Howlett@oracle.com>, Peter Maydell <peter.maydell@linaro.org>, "Mark
 Rutland" <mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-pci@vger.kernel.org>
Subject: Re: [PATCH v6 22/31] irqchip/gic-v5: Add GICv5 LPI/IPI support
Message-ID: <20250702142627.00001979@huawei.com>
In-Reply-To: <20250626-gicv5-host-v6-22-48e046af4642@kernel.org>
References: <20250626-gicv5-host-v6-0-48e046af4642@kernel.org>
	<20250626-gicv5-host-v6-22-48e046af4642@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_062636_743191_76F74816 
X-CRM114-Status: GOOD (  33.72  )
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

On Thu, 26 Jun 2025 12:26:13 +0200
Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:

> An IRS supports Logical Peripheral Interrupts (LPIs) and implement
> Linux IPIs on top of it.
> 
> LPIs are used for interrupt signals that are translated by a
> GICv5 ITS (Interrupt Translation Service) but also for software
> generated IRQs - namely interrupts that are not driven by a HW
> signal, ie IPIs.
> 
> LPIs rely on memory storage for interrupt routing and state.
> 
> LPIs state and routing information is kept in the Interrupt
> State Table (IST).
> 
> IRSes provide support for 1- or 2-level IST tables configured
> to support a maximum number of interrupts that depend on the
> OS configuration and the HW capabilities.
> 
> On systems that provide 2-level IST support, always allow
> the maximum number of LPIs; On systems with only 1-level
> support, limit the number of LPIs to 2^12 to prevent
> wasting memory (presumably a system that supports a 1-level
> only IST is not expecting a large number of interrupts).
> 
> On a 2-level IST system, L2 entries are allocated on
> demand.
> 
> The IST table memory is allocated using the kmalloc() interface;
> the allocation required may be smaller than a page and must be
> made up of contiguous physical pages if larger than a page.
> 
> On systems where the IRS is not cache-coherent with the CPUs,
> cache mainteinance operations are executed to clean and
> invalidate the allocated memory to the point of coherency
> making it visible to the IRS components.
> 
> On GICv5 systems, IPIs are implemented using LPIs.
> 
> Add an LPI IRQ domain and implement an IPI-specific IRQ domain created
> as a child/subdomain of the LPI domain to allocate the required number
> of LPIs needed to implement the IPIs.
> 
> IPIs are backed by LPIs, add LPIs allocation/de-allocation
> functions.
> 
> The LPI INTID namespace is managed using an IDA to alloc/free LPI INTIDs.
> 
> Associate an IPI irqchip with IPI IRQ descriptors to provide
> core code with the irqchip.ipi_send_single() method required
> to raise an IPI.
> 
> Co-developed-by: Sascha Bischoff <sascha.bischoff@arm.com>
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> Co-developed-by: Timothy Hayes <timothy.hayes@arm.com>
> Signed-off-by: Timothy Hayes <timothy.hayes@arm.com>
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>

Hi Lorenzo,

The code in here looks fine to me, but one of the comments
doesn't seem to match with what the code is doing. Perhaps it's stale and needs
an update?

Jonathan

> diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
> index fba8efceb26e..e161acd05bf5 100644
> --- a/drivers/irqchip/irq-gic-v5-irs.c
> +++ b/drivers/irqchip/irq-gic-v5-irs.c



> +/*
> + * Try to match the L2 IST size to the pagesize, and if this is not possible
> + * pick the smallest supported L2 size in order to minimise the requirement for
> + * physically contiguous blocks of memory as page-sized allocations are
> + * guaranteed to be physically contiguous, and are by definition the easiest to
> + * find.

This comment is not matching up with the code.  Seems that if a page size match
is not possible it first tries to pick the largest L2 size below the page size.
If there are none of those it then falls back to trying steadily larger sizes.

> + *
> + * Fall back to the smallest supported size (in the event that the pagesize
> + * itself is not supported) again serves to make it easier to find physically
> + * contiguous blocks of memory.
> + */
> +static unsigned int gicv5_irs_l2_sz(u32 idr2)
> +{
> +	switch (PAGE_SIZE) {
> +	case SZ_64K:
> +		if (GICV5_IRS_IST_L2SZ_SUPPORT_64KB(idr2))
> +			return GICV5_IRS_IST_CFGR_L2SZ_64K;
> +		fallthrough;
> +	case SZ_16K:
> +		if (GICV5_IRS_IST_L2SZ_SUPPORT_16KB(idr2))
> +			return GICV5_IRS_IST_CFGR_L2SZ_16K;
> +		fallthrough;
> +	case SZ_4K:
> +		if (GICV5_IRS_IST_L2SZ_SUPPORT_4KB(idr2))
> +			return GICV5_IRS_IST_CFGR_L2SZ_4K;
> +		break;
> +	}
> +
> +	if (GICV5_IRS_IST_L2SZ_SUPPORT_16KB(idr2))
> +		return GICV5_IRS_IST_CFGR_L2SZ_16K;
> +
> +	return GICV5_IRS_IST_CFGR_L2SZ_64K;
> +}



