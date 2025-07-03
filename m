Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92AA4C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 20:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7rJxZO8XzJsvofbpsOI1fnv7o4sD4M7KjOhxDEXmNf0=; b=pcsZ+A75QkoKp/wVJxa0XdKutv
	yti78i0p1K6Q7pFOBCs6h92f0yRf/yIy/ajbCi1sZqFzDZXWU8ig5CuU7Y1JgZAU6YEte7ydE8h3r
	OHGuVDjjkng3+EjS+Pt+MgjqbceMnCrYLaRU4SJFG56BX+3DI93g1PXxQ4GpUgKFQtvthuL6tTUjo
	kuFS+07PmsRUnGOL4ckO504BCDjTUGD3SPntGVQj5ksOfUUKkqpTPcykpPtP8v5iO8cZrPd+rucoR
	+kcohFRr/Y6yvqAt0deadKydKApQ/2E4IwmfPHgx+nx4SGt5VSTtidLIsXOyRjs6zpek1S1VWoqJs
	dT5rYzCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXR1t-0000000CWpf-3Nfj;
	Thu, 03 Jul 2025 20:59:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXMTR-0000000BwTx-3ReE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 16:07:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7092A460FB;
	Thu,  3 Jul 2025 16:07:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECBACC4CEE3;
	Thu,  3 Jul 2025 16:07:41 +0000 (UTC)
Date: Thu, 3 Jul 2025 17:07:39 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v7 22/31] irqchip/gic-v5: Add GICv5 LPI/IPI support
Message-ID: <aGaqyx6BIk2-oSdm@arm.com>
References: <20250703-gicv5-host-v7-0-12e71f1b3528@kernel.org>
 <20250703-gicv5-host-v7-22-12e71f1b3528@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703-gicv5-host-v7-22-12e71f1b3528@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_090745_923204_BE5E236D 
X-CRM114-Status: GOOD (  22.77  )
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

On Thu, Jul 03, 2025 at 12:25:12PM +0200, Lorenzo Pieralisi wrote:
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
> Reviewed-by: Marc Zyngier <maz@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

