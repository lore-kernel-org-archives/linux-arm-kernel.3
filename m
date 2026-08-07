Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89BECC5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 11:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xd3UFDIz5wYvevp0q0lFRxsbOOvF3TFwe4o0b4um2rs=; b=E0UgrvpXjxlnS6ngC96KdRzN99
	3VqYu1ys3GI6P77RvcH3uozVBfkFtMfjHY460ChH/A1vhT6n9sa18owrp2xw/c22v/4mbxK+dmlpA
	HAufaMS8PJvPH9oEPkYu1H0wSuZEmT5FkqNmSt89YC7tuFESUwRxiFx3gXf69w4CfmL/sPm81WUjj
	WHLJ3lP+GsoLOLbFdydfwbVwA1rd6y/MNDkCDEiT+ljDEnVvsRlGdLWEEPaRWD0UhJCHGRLQ8TXKt
	3gJN7d+k/OjEFE5VNVzEin8/xu/ZlAJDb4u+89YnPePbXjmIjUA7zTzi91JyeEPC0nlhHCwTgh4Vj
	rvutnQuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsJDl-00000007z4d-1Z0m;
	Fri, 07 Aug 2026 11:58:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsJDk-00000007z4T-0XBb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 11:58:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9545243394;
	Fri,  7 Aug 2026 11:58:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2F7A1F00A3A;
	Fri,  7 Aug 2026 11:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786103918;
	bh=Xd3UFDIz5wYvevp0q0lFRxsbOOvF3TFwe4o0b4um2rs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Nb5CNrdE/4Z45mCov87EsHo7R+c/XppeMgdWkypZiJi0hG1F3qOgd2tMn8awJqvaS
	 lbdSFBuX+8DZW+BUgsVb72bpNXzoeTOxLUMO7EfDoa8A1uqNuAgZxEIKcOk6xWqCjz
	 inB/PGpqH/asRSsq2GTJ8yf/60nRgNhE7C1XyCY51qwFthllbwSfudh5hb9iKzACj7
	 QziTT7OLJ6iY0pmcLYRNlH75OV6VN8M2L9EGh7RPznyr9g/ejgHCUX6HO7rcff8qyK
	 jVXAQEnK36ohiepgjg3IyQBDlNwN1AqiRdGYIzb5ul1D0/BFPUE3uuAab7MCjuibx8
	 FtaKWGZWWR0DA==
Date: Fri, 7 Aug 2026 12:58:29 +0100
From: Will Deacon <will@kernel.org>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
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
Message-ID: <anXIZSh9lq99VG9X@willie-the-truck>
References: <20260717180442.110954-18-aneesh.kumar@kernel.org>
 <20260807092612.2202005-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807092612.2202005-1-aneesh.kumar@kernel.org>
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

On Fri, Aug 07, 2026 at 02:56:12PM +0530, Aneesh Kumar K.V (Arm) wrote:
> Realm guests and protected KVM guests may require swiotlb for device DMA
> even when all system RAM is addressable by the DMA zones.
> 
> Do not reduce the SWIOTLB buffer to the kmalloc-bouncing size for these
> guests, as the reduced number of slots can be exhausted during CCA guest
> operation.
> 
> Fixes: 30c5e45ee2c5 ("dma-direct: make dma_direct_map_phys() honor DMA_ATTR_CC_SHARED")
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  arch/arm64/mm/init.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index e308a7cabd12..24caaf10e755 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -339,7 +339,8 @@ void __init arch_mm_preinit(void)
>  {
>  	unsigned int flags = SWIOTLB_VERBOSE;
>  
> -	if (max_pfn <= PFN_DOWN(arm64_dma_phys_limit)) {
> +	if (!cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT) &&
> +	    max_pfn <= PFN_DOWN(arm64_dma_phys_limit)) {

Protected guests under pKVM rely on restricted DMA, so won't this just
waste memory for them?

Will

