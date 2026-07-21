Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1633C44533
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 15:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bvwAwSrLeSxpgcF25JgoIOFsh0jmxPsKQj8167368cc=; b=BoDDzd3Y8a93LSDnaFYoAlz7Hf
	z9g+Io4qrDCvQGbjQkcbQs51LIlXccRXjl4uMdsxk1sargGojGHB19NJBdZgUcCISwIqZEShxgXQ0
	o6MnMlqwjjB+3vgRlqvZGx2cnn0/xUB8UwQhHJfvm4YPSueOQrsKoPXmMQNi/dxj4T9zU0tGBGbT/
	3xlc7KogYdjUmPVWi8XQCON38XGXZW3prGSWTkXRjnnShrN2xniJ0qDFey2tqzihzM4flTVl8tQZc
	eTystKxENx8QmFx994la39FbB0M7d+kOGHsgL1CIFnBYVhAwymJQwVN7j2TRMIq/Zole0MZDI4DdT
	Z1WtNuiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmC70-00000009kjn-1qKR;
	Tue, 21 Jul 2026 15:10:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmC6z-00000009kjZ-02i4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 15:10:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 742AA60054;
	Tue, 21 Jul 2026 15:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAFD01F000E9;
	Tue, 21 Jul 2026 15:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784646624;
	bh=bvwAwSrLeSxpgcF25JgoIOFsh0jmxPsKQj8167368cc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=IclAOpNzF8vtkrxgfEod7QcY++7SL6g2X5yy3VGZRcTePf/oHQAgK9RU9Ox50wcfa
	 pPLYbaHBIt2vjrDtcc6F5wvhpNNXtPpSimZ2mVkiyiOxw4kutVj8SD2mR3EcAYHmPn
	 eVsQYvJl9dIUQ6ld2dvQN1ApGA6l1K7FH/KH9uLMJ5IwvN0KsMxr6zqfK2FXJmfzdD
	 pw8CTfRYP+RifEZS9qJgiTR0ptjoWabDB8Dnsy04uKD+z5Q/R1XqUquTVsGYKbV/fo
	 brOApORB0m69sbMZblmz3MJWWgPgCexjbl3S7+EttrVY84wY2vannekxqBLe6gYJNy
	 Vj7EdjPaINAMA==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org,
	stable@vger.kernel.org, Michael Kelley <mhklinux@outlook.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v8 01/23] dma-direct: return struct page from
 dma_direct_alloc_from_pool()
In-Reply-To: <20260721142921.GN110966@unreal>
References: <20260717180442.110954-1-aneesh.kumar@kernel.org>
 <20260717180442.110954-2-aneesh.kumar@kernel.org>
 <20260721115456.GI110966@unreal> <yq5atsps77c5.fsf@kernel.org>
 <20260721142921.GN110966@unreal>
Date: Tue, 21 Jul 2026 20:40:08 +0530
Message-ID: <yq5ao6g0750v.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

Leon Romanovsky <leon@kernel.org> writes:

> On Tue, Jul 21, 2026 at 07:50:10PM +0530, Aneesh Kumar K.V wrote:
>> Leon Romanovsky <leon@kernel.org> writes:
>> 
>> > On Fri, Jul 17, 2026 at 11:34:19PM +0530, Aneesh Kumar K.V (Arm) wrote:
....
>> >>  static void *dma_direct_alloc_no_mapping(struct device *dev, size_t size,
>> >> @@ -247,8 +246,11 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>> >>  	 * the atomic pools instead if we aren't allowed block.
>> >>  	 */
>> >>  	if ((remap || force_dma_unencrypted(dev)) &&
>> >> -	    dma_direct_use_pool(dev, gfp))
>> >> -		return dma_direct_alloc_from_pool(dev, size, dma_handle, gfp);
>> >> +	    dma_direct_use_pool(dev, gfp)) {
>> >> +		page = dma_direct_alloc_from_pool(dev, size, dma_handle,
>> >> +						  &ret, gfp);
>> >> +		return page ? ret : NULL;
>> >
>> > Sorry for joining the discussion late, but the line above caught my
>> > attention.
>> >
>> > Why do we need both ret and page? We can derive cpu_addr from page and
>> > vice versa. Do we really need the &ret parameter? Or, more generally, do
>> > we really need "struct page *"?
>> >
>> > static struct page *__dma_alloc_from_pool(struct device *dev, size_t size,
>> > 		struct gen_pool *pool, void **cpu_addr,
>> > 		bool (*phys_addr_ok)(struct device *, phys_addr_t, size_t))
>> > {
>> > ...
>> > 	*cpu_addr = (void *)addr;
>> > 	memset(*cpu_addr, 0, size);
>> > 	return pfn_to_page(__phys_to_pfn(phys));
>> > }
>> >
>> > Why
>> >
>> 
>> With CONFIG_DMA_DIRECT_REMAP the cpu_addr can be different from
>> page_address.
>
> Can you please point to the code there it can happen?
> __dma_alloc_from_pool() has direct connection between physical address
> and struct page.
>

dma_direct_alloc -> 	remap = IS_ENABLED(CONFIG_DMA_DIRECT_REMAP);
	if ((remap && dma_direct_use_pool(dev, gfp)) {
		page = dma_direct_alloc_from_pool(dev, size,

..
__dma_alloc_from_pool -> 
	addr = gen_pool_alloc(pool, size);
	if (!addr)


We expand the pool as below..

atomic_pool_expand ->

#ifdef CONFIG_DMA_DIRECT_REMAP
	addr = dma_common_contiguous_remap(page, pool_size,
			pgprot_decrypted(pgprot_dmacoherent(PAGE_KERNEL)),
			__builtin_return_address(0));
	if (!addr)
		goto free_page;
#else
	addr = page_to_virt(page);
#endif


-aneesh

