Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8DA1C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 06:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VVgL/uzz137uMRzSkpFduyYcDsPNmDrSlT5+2SBHXpU=; b=ByIfzmbpN2mxGqf7bwGDVIr7KR
	l51Akibrqt4lEKheb42Zs817y6TfZTuUuVIKb3BJNoTZDWe4J3Pq2mv2vjtZu8aySNNBFy68zUN4K
	N4lL30MNUpFmI2Q6N0Lh6iSTYLaehjYRzjKDqIsiWXBIgNNsRmjz0RXLw+/ma1pDj3KcPZDWxT3+b
	AEN4ZTHaCe/5Yc5a1vRGzfslj9ppjAFNNR3va/OyHG/SgBPP56XREa1m/nuphIiSeaDE4qW+iSFUb
	itcxvMZBzbD/dy0dtVdepT9qmhnSaibcxycjPS3vakyOMIRiH2pQEgMlUTgup+ezGMiyJzaTf6Pfu
	ja3z+7BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8uRL-00000004PqB-2ktU;
	Tue, 22 Sep 2026 06:57:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8uR8-00000004Plf-0EzS;
	Tue, 22 Sep 2026 06:57:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 275BE6053E;
	Tue, 22 Sep 2026 06:57:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 602FD1F000FF;
	Tue, 22 Sep 2026 06:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790060224;
	bh=VVgL/uzz137uMRzSkpFduyYcDsPNmDrSlT5+2SBHXpU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=BNB44/zwKoNMc0NnM2KjlJD0Vr/OZo7eRyriJNlJby7xV70V9sHGh4ZUo3N6FgJ5t
	 AjPqJib9IFHuoqfPh8SyGVJoAHqxb/F0KmSrGipZ3+Sm+r/lDNT/XUTs7nFCcT2DhH
	 g5WR1jq4muLh7CxgYUjUANWn3iQ3FgYkWa6NZWbaJ6BOFWumg9ZQKJ956iEpeA81PA
	 hzTJ4cfSvz4m1vsEf2dZ4qKH6nXJpbMvl69nqyp+3sqrQFniFXCfQhmD8wTBwEdZc/
	 /Yq6Bnpzrc3VVAujAQyozn9bvn0jHEZpnABRRKd4QSAfltWAjXL8kiHAK+SmBrRSWB
	 c5nlXGg/IquUw==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
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
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Russell King <linux@armlinux.org.uk>,
	Huacai Chen <chenhuacai@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v5 3/6] dma: swiotlb: Centralize minimal pool sizing
In-Reply-To: <21180ec6-b9ad-43fd-9e52-51df644e1b93@arm.com>
References: <20260921063628.362078-1-aneesh.kumar@kernel.org>
 <20260921063628.362078-4-aneesh.kumar@kernel.org>
 <21180ec6-b9ad-43fd-9e52-51df644e1b93@arm.com>
Date: Tue, 22 Sep 2026 12:26:47 +0530
Message-ID: <yq5apky53hao.fsf@kernel.org>
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

Robin Murphy <robin.murphy@arm.com> writes:

> On 21/09/2026 7:36 am, Aneesh Kumar K.V (Arm) wrote:
>> A default SWIOTLB pool used only for unaligned kmalloc bouncing can be

 [ ... 54 lines skipped ... ] 

>>   
>> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
>> index 8f86deb25be2..f368a73f4ed0 100644
>> --- a/kernel/dma/swiotlb.c
>> +++ b/kernel/dma/swiotlb.c
>> @@ -483,9 +483,18 @@ static bool __init swiotlb_kmalloc_needs_bounce(void)
>>   static void __init
>>   swiotlb_adjust_pool_size(enum swiotlb_pool_policy policy)
>>   {
>> +	if (swiotlb_default_size_changed())
>> +		return;
>> +
>
> This appears to be entirely redundant, as ultimately the point of this 
> function is to call swiotlb_adjust_size() (if it does anything at all), 
> and the first thing that does is this same exact check. We hardly need 
> to micro-optimise short-circuiting a handful of arithmetic in a one-off 
> setup path, and it's convoluted enough as it is, so please try to avoid 
> redundancy that makes it even more confusing to follow.
>

OK, I'll drop this.

>
>>   	switch (policy) {
>> -	case SWIOTLB_POOL_MINIMAL:
>> +	case SWIOTLB_POOL_MINIMAL: {
>> +		unsigned long size;
>> +
>> +		/* Use 1MB per 1GB of RAM for kmalloc() bouncing. */
>> +		size = DIV_ROUND_UP(memblock_phys_mem_size(), 1024);
>> +		swiotlb_adjust_size(min(swiotlb_size_or_default(), size));
>>   		break;
>
> Similarly I think it would be clearer if we had a common 
> swiotlb_adjust_size() call at the end of the function, and then either 
> calculate a size or return early in each switch case as appropriate.
>
> Furthermore, swiotlb_size_or_default() is awful IMO - and in fact after 
> this series we could perhaps clean it up entirely by making the size 
> implicit in swiotlb_init_late() - not to mention misleadingly redundant. 
> I'd say just open-code "default_nslabs << IO_TLB_SHIFT" like elsewhere 
> in the file, but in fact it may as well just be IO_TLB_DEFAULT_SIZE 
> (think about it...)
>

How about we rename swiotlb_size_or_default to

unsigned long swiotlb_default_pool_size(void)
{
	return default_nslabs << IO_TLB_SHIFT;
}

We still need a helper because arch/arm/xen/mm.c also uses it. I also
updated swiotlb_adjust_pool_size() as suggested.

static void __init
swiotlb_adjust_pool_size(enum swiotlb_pool_policy policy)
{
	unsigned long size;

	switch (policy) {
	case SWIOTLB_POOL_MINIMAL:
		/* Use 1MB per 1GB of RAM for kmalloc() bouncing. */
		size = DIV_ROUND_UP(memblock_phys_mem_size(), 1024);
		size = min(swiotlb_size_or_default(), size);
		break;
	case SWIOTLB_POOL_CC_GUEST:
		size = swiotlb_adjusted_size();
		break;
	case SWIOTLB_POOL_NONE:
		WARN(true, "Cannot adjust SWIOTLB size without a pool\n");
		return;
	case SWIOTLB_POOL_DEFAULT:
	default:
		return;
	}

	swiotlb_adjust_size(size);
}


-aneesh

