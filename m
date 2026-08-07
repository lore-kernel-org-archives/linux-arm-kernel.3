Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C98C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 13:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wsfDDPcsG5MUSLOHvWCFv40tfsXBmUj7P+V3Bqk82YU=; b=p4N478Ybwnd7x5fchTxAB87ZNv
	HHOBuXPTUqkgqZo+L6oZBVdGbU1vR2nqQ3MjF/G8Gdml20VKWGf11Qr7h4lteLwmDDnuKMTDm0r2n
	yvbyJou7w4G+5GrkN1foQ31RvTjC4uMJ76wvTbuUO2A4Q9G6kbuw+CXcz1NYeAiYmvrkm6MKSO4Nl
	L7EeqNKHz0vUwQsDzUWZmBrGPwSQAL4ozpcTBfQVj/dzvHX51oLG8TPEQlTXRPjoiFo3tRNW2FVfE
	f3rvf2cFLAQOpSthLjWiFJWX1/JwJ8xSZhCiuqda3y8/DpgiUxzfVtxW7WuZo6OqoVQOvTu8RyTPf
	4A+iXneg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsKTE-000000086zk-13uw;
	Fri, 07 Aug 2026 13:18:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsKTC-000000086zQ-0ImD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 13:18:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2F2336013A;
	Fri,  7 Aug 2026 13:18:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 338611F000E9;
	Fri,  7 Aug 2026 13:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786108720;
	bh=wsfDDPcsG5MUSLOHvWCFv40tfsXBmUj7P+V3Bqk82YU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cCNbiOkjKWAUqmhRd4f35UKCjy7UEhkqpWWFeU9w7Kfiy5DgWT3dZw1OQFG8VAzwR
	 XZNBYUU8FhCvDz09mx7t85bJh2lGZS5wWKXfdEHcjdTmqrCKuvbXD4PHj259GvbZZY
	 At6gmah61p+afUyBaMnPfpe+im9eRwJlcM1uOVFcvRENntNyyd8OspaulZRPI21O0+
	 RQ+DtFZQKiusnOPhpgTJWrPlMW7ENlDI/iDnaojBH384ZJnryZxsxnSTIXfU3vj3ks
	 R4W0nC24in4QB64L5eYdsvT8dTMBFtjRhb+mL0yI6d/AOEHHOKCqEgpBrbJoOp2NCH
	 LWSkcbZumcQJg==
Date: Fri, 7 Aug 2026 14:18:31 +0100
From: Will Deacon <will@kernel.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Marc Zyngier <maz@kernel.org>, Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Jason Gunthorpe <jgg@ziepe.ca>,
	Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [PATCH] arm64: swiotlb: Keep the default size for protected
 guests
Message-ID: <anXbJ2O4DWgPxCeg@willie-the-truck>
References: <20260717180442.110954-18-aneesh.kumar@kernel.org>
 <20260807092612.2202005-1-aneesh.kumar@kernel.org>
 <anXIZSh9lq99VG9X@willie-the-truck>
 <yq5acxvu2ict.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5acxvu2ict.fsf@kernel.org>
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

On Fri, Aug 07, 2026 at 06:33:14PM +0530, Aneesh Kumar K.V wrote:
> Will Deacon <will@kernel.org> writes:
> 
> > On Fri, Aug 07, 2026 at 02:56:12PM +0530, Aneesh Kumar K.V (Arm) wrote:
> >> Realm guests and protected KVM guests may require swiotlb for device DMA
> >> even when all system RAM is addressable by the DMA zones.
> >> 
> >> Do not reduce the SWIOTLB buffer to the kmalloc-bouncing size for these
> >> guests, as the reduced number of slots can be exhausted during CCA guest
> >> operation.
> >> 
> >> Fixes: 30c5e45ee2c5 ("dma-direct: make dma_direct_map_phys() honor DMA_ATTR_CC_SHARED")
> >> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> >> ---
> >>  arch/arm64/mm/init.c | 3 ++-
> >>  1 file changed, 2 insertions(+), 1 deletion(-)
> >> 
> >> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> >> index e308a7cabd12..24caaf10e755 100644
> >> --- a/arch/arm64/mm/init.c
> >> +++ b/arch/arm64/mm/init.c
> >> @@ -339,7 +339,8 @@ void __init arch_mm_preinit(void)
> >>  {
> >>  	unsigned int flags = SWIOTLB_VERBOSE;
> >>  
> >> -	if (max_pfn <= PFN_DOWN(arm64_dma_phys_limit)) {
> >> +	if (!cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT) &&
> >> +	    max_pfn <= PFN_DOWN(arm64_dma_phys_limit)) {
> >
> > Protected guests under pKVM rely on restricted DMA, so won't this just
> > waste memory for them?
> >
> 
> commit 30c5e45ee2c5 ("dma-direct: make dma_direct_map_phys() honor DMA_ATTR_CC_SHARED"),
> which this patch fixes, has
> 
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -339,9 +339,7 @@ void __init arch_mm_preinit(void)
>  {
>         unsigned int flags = SWIOTLB_VERBOSE;
>  
> -       if (is_realm_world() || is_protected_kvm_guest()) {
> -               flags |= SWIOTLB_FORCE;
> -       } else if (max_pfn <= PFN_DOWN(arm64_dma_phys_limit)) {
> +       if (max_pfn <= PFN_DOWN(arm64_dma_phys_limit)) {
>                 /*
>                  * If no bouncing needed for ZONE_DMA, reduce the swiotlb
>                  * buffer for kmalloc() bouncing to 1MB per 1GB of RAM.
> 
> The is_protected_kvm_guest() part was added by the 
> commit e62decaf98e7 ("arm64/coco: Add pKVM as a CC platform")
> 
> @@ -337,7 +339,7 @@ void __init arch_mm_preinit(void)
>  {
>         unsigned int flags = SWIOTLB_VERBOSE;
>  
> -       if (is_realm_world()) {
> +       if (is_realm_world() || is_protected_kvm_guest()) {
>                 flags |= SWIOTLB_FORCE;
>         } else if (max_pfn <= PFN_DOWN(arm64_dma_phys_limit)) {
>                 /*
> @@ -412,6 +414,17 @@ void dump_mem_limit(void)
>         }
>  }
> 
> I was under the impression that there is a possibility of using swiotlb
> instead of restricted-dma-pool with pKVM.

Yes, that patch enables swiotlb as a possibility for protected guests
but with your patch we avoid shrinking the swiotlb buffer even when
restricted dma pools are being used and that's a waste of memory.

> If that is not the case, then we could change:
> 
> !cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT) &&
> 
> to
> 
> !is_realm_world() &&

Perhaps, or you could just pass the swiotlb= option if the defaults don't
work for you. Can you give more details about the slots exhaustion you're
seeing under CCA?

Will

