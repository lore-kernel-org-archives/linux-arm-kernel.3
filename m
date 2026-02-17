Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7353E6817E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 12:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kPHvBI1Pan3M4iaidTIFZnbtqSz3AZ7jPYAHqyBo5u8=; b=2Gp392sW7lR3wUvTHsA6HbuJ5R
	fOau6ZU8HY57cFz6HFi6tyyPTm50RInnYT/wSXHBBpXY4dZkcSS7Y7XiUBNhYzT1tDCWZ54mQq4fe
	uTF9CM9rbnnHejzMrFlJNzXL3B0M52ENizLJfFA5F1WFlDsBIhDoAe5OC1S5qZ7SRlRROJTa/s/Ua
	qbhOLgE6R4Zo3JurkOdtgtTolVwsyBUef7dpa4PZU8hGqVwiHBb7AY26xF0zawbaqAqTomtNZslMG
	pK20VtMYGEHdWzzmsmruU6pvWgaRXKA4yCs6lUA6zwP5ERoW1a3fM6+MF9q228huf5/9iOQMtBn1z
	PTO4IHzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsKcf-00000008FgT-41hF;
	Tue, 17 Feb 2026 12:56:13 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsKcb-00000008Ffi-0bds
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 12:56:12 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260217125600euoutp01e702ba17a82df7a26cb54abe09518e80~VCfFtKJNi2750327503euoutp01K;
	Tue, 17 Feb 2026 12:56:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260217125600euoutp01e702ba17a82df7a26cb54abe09518e80~VCfFtKJNi2750327503euoutp01K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1771332961;
	bh=kPHvBI1Pan3M4iaidTIFZnbtqSz3AZ7jPYAHqyBo5u8=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=qE2Na2wFoGobnNwByWm49yVZUxp6ZyqvGOKUcTxQmO/J9J6nwYoOSde40k3tzupbf
	 5drCH58ib86rmTAuEFK3Dh2gBz0w2T0sLKmgAdsu5bu3cX1d1C762Ho+VBd2ZtAcrr
	 Rpa2eUVwXatWI/hNEoqzx/baF+s1uCvrB4JykOMY=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260217125600eucas1p2f5a7aaf272ec1e8419eb4f30114ae4c0~VCfFifkBN0465704657eucas1p2k;
	Tue, 17 Feb 2026 12:56:00 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260217125557eusmtip157747204999f9293afbbfbea0aadd349~VCfCuB9mO1169311693eusmtip1R;
	Tue, 17 Feb 2026 12:55:57 +0000 (GMT)
Message-ID: <7131d609-b083-4264-818a-21de38c1c3ed@samsung.com>
Date: Tue, 17 Feb 2026 13:55:56 +0100
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v5 11/14] sparc: Use physical address DMA mapping
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Leon
	Romanovsky <leon@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Russell
	King <linux@armlinux.org.uk>, Juergen Gross <jgross@suse.com>, Stefano
	Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Richard Henderson
	<richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, Thomas
	Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, Geoff Levand <geoff@infradead.org>, "David S.
 Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Thomas
	Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
	Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, xen-devel@lists.xenproject.org,
	linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, sparclinux
	<sparclinux@vger.kernel.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <e294484787a5032c531dcd40071b22362bddcad4.camel@physik.fu-berlin.de>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260217125600eucas1p2f5a7aaf272ec1e8419eb4f30114ae4c0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260217123216eucas1p2d74189a3cdf08e9301bebf1840491364
X-EPHeader: CA
X-CMS-RootMailID: 20260217123216eucas1p2d74189a3cdf08e9301bebf1840491364
References: <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
	<20251015-remove-map-page-v5-11-3bbfe3a25cdf@kernel.org>
	<CGME20260217123216eucas1p2d74189a3cdf08e9301bebf1840491364@eucas1p2.samsung.com>
	<e294484787a5032c531dcd40071b22362bddcad4.camel@physik.fu-berlin.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_045609_764545_CCDA37F3 
X-CRM114-Status: GOOD (  21.22  )
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

On 17.02.2026 13:27, John Paul Adrian Glaubitz wrote:
> On Wed, 2025-10-15 at 12:12 +0300, Leon Romanovsky wrote:
>> From: Leon Romanovsky <leonro@nvidia.com>
>>
>> Convert sparc architecture DMA code to use .map_phys callback.
>>
>> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
>> ---
>>   arch/sparc/kernel/iommu.c     | 30 +++++++++++++++++-----------
>>   arch/sparc/kernel/pci_sun4v.c | 31 ++++++++++++++++++-----------
>>   arch/sparc/mm/io-unit.c       | 38 ++++++++++++++++++-----------------
>>   arch/sparc/mm/iommu.c         | 46 ++++++++++++++++++++++---------------------
>>   4 files changed, 82 insertions(+), 63 deletions(-)
>>
>> diff --git a/arch/sparc/kernel/iommu.c b/arch/sparc/kernel/iommu.c
>> index da0363692528..46ef88bc9c26 100644
>> --- a/arch/sparc/kernel/iommu.c
>> +++ b/arch/sparc/kernel/iommu.c
>> @@ -260,26 +260,35 @@ static void dma_4u_free_coherent(struct device *dev, size_t size,
>>   		free_pages((unsigned long)cpu, order);
>>   }
>>   
>> -static dma_addr_t dma_4u_map_page(struct device *dev, struct page *page,
>> -				  unsigned long offset, size_t sz,
>> -				  enum dma_data_direction direction,
>> +static dma_addr_t dma_4u_map_phys(struct device *dev, phys_addr_t phys,
>> +				  size_t sz, enum dma_data_direction direction,
>>   				  unsigned long attrs)
>>   {
>>   	struct iommu *iommu;
>>   	struct strbuf *strbuf;
>>   	iopte_t *base;
>>   	unsigned long flags, npages, oaddr;
>> -	unsigned long i, base_paddr, ctx;
>> +	unsigned long i, ctx;
>>   	u32 bus_addr, ret;
>>   	unsigned long iopte_protection;
>>   
>> +	if (unlikely(attrs & DMA_ATTR_MMIO))
>> +		/*
>> +		 * This check is included because older versions of the code
>> +		 * lacked MMIO path support, and my ability to test this path
>> +		 * is limited. However, from a software technical standpoint,
>> +		 * there is no restriction, as the following code operates
>> +		 * solely on physical addresses.
>> +		 */
>> +		goto bad_no_ctx;
>> +
>>   	iommu = dev->archdata.iommu;
>>   	strbuf = dev->archdata.stc;
>>   
>>   	if (unlikely(direction == DMA_NONE))
>>   		goto bad_no_ctx;
>>   
>> -	oaddr = (unsigned long)(page_address(page) + offset);
>> +	oaddr = (unsigned long)(phys_to_virt(phys));
>>   	npages = IO_PAGE_ALIGN(oaddr + sz) - (oaddr & IO_PAGE_MASK);
>>   	npages >>= IO_PAGE_SHIFT;
>>   
>> @@ -296,7 +305,6 @@ static dma_addr_t dma_4u_map_page(struct device *dev, struct page *page,
>>   	bus_addr = (iommu->tbl.table_map_base +
>>   		    ((base - iommu->page_table) << IO_PAGE_SHIFT));
>>   	ret = bus_addr | (oaddr & ~IO_PAGE_MASK);
>> -	base_paddr = __pa(oaddr & IO_PAGE_MASK);
>>   	if (strbuf->strbuf_enabled)
>>   		iopte_protection = IOPTE_STREAMING(ctx);
>>   	else
>> @@ -304,8 +312,8 @@ static dma_addr_t dma_4u_map_page(struct device *dev, struct page *page,
>>   	if (direction != DMA_TO_DEVICE)
>>   		iopte_protection |= IOPTE_WRITE;
>>   
>> -	for (i = 0; i < npages; i++, base++, base_paddr += IO_PAGE_SIZE)
>> -		iopte_val(*base) = iopte_protection | base_paddr;
>> +	for (i = 0; i < npages; i++, base++, phys += IO_PAGE_SIZE)
>> +		iopte_val(*base) = iopte_protection | phys;

'base_paddr' was aligned to start of a page before this patch, while 
'phys' includes the offset within a page.


Could You check if the following change fixes the issue?

diff --git a/arch/sparc/kernel/iommu.c b/arch/sparc/kernel/iommu.c
index 46ef88bc9c26..edb0ffb21e2f 100644
--- a/arch/sparc/kernel/iommu.c
+++ b/arch/sparc/kernel/iommu.c
@@ -312,6 +312,7 @@ static dma_addr_t dma_4u_map_phys(struct device 
*dev, phys_addr_t phys,
         if (direction != DMA_TO_DEVICE)
                 iopte_protection |= IOPTE_WRITE;

+       phys -= offset_in_page(phys);
         for (i = 0; i < npages; i++, base++, phys += IO_PAGE_SIZE)
                 iopte_val(*base) = iopte_protection | phys;

 >> ...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


