Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE60CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 05:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gyv2H663hl6K5ryLWf8MwT/+75QYd+zKNqRWgY9igaw=; b=dWHFuD/mLEzwPugONtcTjqezA3
	pk6AbcIsDTSwJ5IWI8GBceD11A1CHt7t2NF5EhX8aHhLyM0gQH7XtISyhipAT59cwZK2rEYmKO2wP
	0JXDq5yBmQMsuq2d0zdCf0MshNqKxuC2IRXAVemlG+6nK1fO52BUhoH98hVSlz7dlWI09X1dB0D4q
	cNbR75q6GFMgTbO5S3hkmKp0nLJLUoAVc1wKBKaaibA0Qz9XfjIFoROnnVG4VN4JXJaOOB/ijGkcq
	PnI6k28781IU6/d2qY88+aWTK+6j7mlULFJpokpO/J8FQVKSvm6xD56DJvioNTEOxCsRl4LDUOvH/
	9xaabeLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNOCi-00000004aLH-2p7v;
	Thu, 14 May 2026 05:01:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNOCg-00000004aKG-33Xo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 05:01:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1F5DD44504;
	Thu, 14 May 2026 05:01:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6A5FC2BCB7;
	Thu, 14 May 2026 05:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778734904;
	bh=1MkgikfobnnlXszu7oxK5om44m9zNem1u1FAvwxDkPc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=o/TU8m9rl7cjkl/2skOf7z8JNyS5pEEj1mPV4RtgOnPRWyJpSYblQYNiNFDTeFVk8
	 gU4giYSM4safXp6KaQXjocZhyTtJ4S0lFTopjislANRrONcrvJeo5n+BW0SlTMu/9y
	 BCHG7SXjUd4yMTWX4t8i+xiIiCrVanPCZHefstfatgj26vxkH3G8OnCJLztrLsLWdp
	 zvoCVCUtEa+qGVjmY8fB703D6M0ojTio/PP2PkUqJBAmF+sEtE+n+dNxKLidPSaEHE
	 jMfzrjVvUX0JNhAbNLWyCF4+/393zwZ2HvF1SPftZF04LcdJklp/gXVEnoRSBtSGkQ
	 NkNLmRpeIccsA==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Mostafa Saleh <smostafa@google.com>
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
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [PATCH v4 02/13] dma-direct: use DMA_ATTR_CC_SHARED in
 alloc/free paths
In-Reply-To: <agSDk0QsEM0ZBCTA@google.com>
References: <20260512090408.794195-1-aneesh.kumar@kernel.org>
 <20260512090408.794195-3-aneesh.kumar@kernel.org>
 <agSDk0QsEM0ZBCTA@google.com>
Date: Thu, 14 May 2026 10:31:30 +0530
Message-ID: <yq5ajyt6a8k5.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_220146_812186_097967D4 
X-CRM114-Status: GOOD (  21.13  )
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

Mostafa Saleh <smostafa@google.com> writes:

> On Tue, May 12, 2026 at 02:33:57PM +0530, Aneesh Kumar K.V (Arm) wrote:
>> Propagate force_dma_unencrypted() into DMA_ATTR_CC_SHARED in the
>> dma-direct allocation path and use the attribute to drive the related
>> decisions.
>>=20
>> This updates dma_direct_alloc(), dma_direct_free(), and
>> dma_direct_alloc_pages() to fold the forced unencrypted case into attrs.
>>=20
>> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
>> ---
>>  kernel/dma/direct.c | 44 ++++++++++++++++++++++++++++++++++++--------
>>  1 file changed, 36 insertions(+), 8 deletions(-)
>>=20
>> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
>> index b958f150718a..0c2e1f8436ce 100644
>> --- a/kernel/dma/direct.c
>> +++ b/kernel/dma/direct.c
>> @@ -201,16 +201,31 @@ void *dma_direct_alloc(struct device *dev, size_t =
size,
>>  		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
>>  {
>>  	bool remap =3D false, set_uncached =3D false;
>> -	bool mark_mem_decrypt =3D true;
>> +	bool mark_mem_decrypt =3D false;
>>  	struct page *page;
>>  	void *ret;
>>=20=20
>> +	/*
>> +	 * DMA_ATTR_CC_SHARED is not a caller-visible dma_alloc_*()
>> +	 * attribute. The direct allocator uses it internally after it has
>> +	 * decided that the backing pages must be shared/decrypted, so the
>> +	 * rest of the allocation path can consistently select DMA addresses,
>> +	 * choose compatible pools and restore encryption on free.
>> +	 */
>> +	if (attrs & DMA_ATTR_CC_SHARED)
>> +		return NULL;
>> +
>> +	if (force_dma_unencrypted(dev)) {
>> +		attrs |=3D DMA_ATTR_CC_SHARED;
>> +		mark_mem_decrypt =3D true;
>> +	}
>> +
>>  	size =3D PAGE_ALIGN(size);
>>  	if (attrs & DMA_ATTR_NO_WARN)
>>  		gfp |=3D __GFP_NOWARN;
>>=20=20
>> -	if ((attrs & DMA_ATTR_NO_KERNEL_MAPPING) &&
>> -	    !force_dma_unencrypted(dev) && !is_swiotlb_for_alloc(dev))
>> +	if (((attrs & (DMA_ATTR_NO_KERNEL_MAPPING | DMA_ATTR_CC_SHARED)) =3D=3D
>> +	     DMA_ATTR_NO_KERNEL_MAPPING) && !is_swiotlb_for_alloc(dev))
>>  		return dma_direct_alloc_no_mapping(dev, size, dma_handle, gfp);
>>=20=20
>>  	if (!dev_is_dma_coherent(dev)) {
>> @@ -244,7 +259,7 @@ void *dma_direct_alloc(struct device *dev, size_t si=
ze,
>>  	 * Remapping or decrypting memory may block, allocate the memory from
>>  	 * the atomic pools instead if we aren't allowed block.
>>  	 */
>> -	if ((remap || force_dma_unencrypted(dev)) &&
>> +	if ((remap || (attrs & DMA_ATTR_CC_SHARED)) &&
>>  	    dma_direct_use_pool(dev, gfp))
>>  		return dma_direct_alloc_from_pool(dev, size, dma_handle, gfp);
>>=20=20
>> @@ -318,11 +333,20 @@ void *dma_direct_alloc(struct device *dev, size_t =
size,
>>  void dma_direct_free(struct device *dev, size_t size,
>>  		void *cpu_addr, dma_addr_t dma_addr, unsigned long attrs)
>>  {
>> -	bool mark_mem_encrypted =3D true;
>> +	bool mark_mem_encrypted =3D false;
>>  	unsigned int page_order =3D get_order(size);
>>=20=20
>> -	if ((attrs & DMA_ATTR_NO_KERNEL_MAPPING) &&
>> -	    !force_dma_unencrypted(dev) && !is_swiotlb_for_alloc(dev)) {
>> +	/*
>> +	 * if the device had requested for an unencrypted buffer,
>> +	 * convert it to encrypted on free
>> +	 */
>> +	if (force_dma_unencrypted(dev)) {
>> +		attrs |=3D DMA_ATTR_CC_SHARED;
>> +		mark_mem_encrypted =3D true;
>> +	}
>> +
>> +	if (((attrs & (DMA_ATTR_NO_KERNEL_MAPPING | DMA_ATTR_CC_SHARED)) =3D=3D
>> +	     DMA_ATTR_NO_KERNEL_MAPPING) && !is_swiotlb_for_alloc(dev)) {
>>  		/* cpu_addr is a struct page cookie, not a kernel address */
>>  		dma_free_contiguous(dev, cpu_addr, size);
>>  		return;
>> @@ -365,10 +389,14 @@ void dma_direct_free(struct device *dev, size_t si=
ze,
>>  struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
>>  		dma_addr_t *dma_handle, enum dma_data_direction dir, gfp_t gfp)
>>  {
>> +	unsigned long attrs =3D 0;
>>  	struct page *page;
>>  	void *ret;
>>=20=20
>> -	if (force_dma_unencrypted(dev) && dma_direct_use_pool(dev, gfp))
>> +	if (force_dma_unencrypted(dev))
>> +		attrs |=3D DMA_ATTR_CC_SHARED;
>> +
>> +	if ((attrs & DMA_ATTR_CC_SHARED) && dma_direct_use_pool(dev, gfp))
>>  		return dma_direct_alloc_from_pool(dev, size, dma_handle, gfp);
>
> What about dma_direct_free_pages()? Nothing inside uses attrs, but
> that=E2=80=99s quite similar to dma_direct_alloc_pages()
>
> Also, at this point, shouldn=E2=80=99t this patch also remove
> force_dma_unencrypted() calls from dma_set_decrypted() and
> dma_set_encrypted()?
>

The final change have=20

void dma_direct_free_pages(struct device *dev, size_t size,
...
{
	/*
	 * if the device had requested for an unencrypted buffer,
	 * convert it to encrypted on free
	 */
	bool mark_mem_encrypted =3D  force_dma_unencrypted(dev);

That got added by "dma-direct: select DMA address encoding from DMA_ATTR_CC=
_SHARED "

I'll move that hunk into this patch. The overall goal is=20

dma_direct_alloc(.. attrs)
{

	if (force_dma_unencrypted(dev))
		attrs |=3D DMA_ATTR_CC_SHARED;
}

dma_direct_free(.. attrs)
{
	if (force_dma_unencrypted(dev)) {
		attrs |=3D DMA_ATTR_CC_SHARED;
		mark_mem_encrypted =3D true;
	}

	if (swiotlb_find_pool(dev, dma_to_phys(dev, dma_addr)))
		mark_mem_encrypted =3D false;

}

dma_direct_alloc_pages()
{
	if (force_dma_unencrypted(dev))
		attrs |=3D DMA_ATTR_CC_SHARED;

}

dma_direct_free_pages()
{
	bool mark_mem_encrypted =3D  force_dma_unencrypted(dev);

	if (swiotlb_find_pool(dev, page_to_phys(page)))
		mark_mem_encrypted =3D false;

}

-aneesh

