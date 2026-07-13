Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C246BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 18:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+4oaM697jjJh0i29DhT77Bw1lzVGGZ7UjxKZh4sSss8=; b=uH5I0y5yE23sDJXrDt9dkwBqo9
	/qnitoqBkASU7fnybn11tmgEUMS278axM5TiNTKJZjpSB+uOhOHEq4Sqps45sb6eo2aVurpibYx4S
	DXfIeEeYxe/sfQOBlxXAaIDRchAyawJ2rq6VzGHgAz2vJM+qoK03rGRJXWjZgpcWCd+jvqUCzDqHm
	7V7tMHUzHLb58TGDhdOl6B0M9RVazfewPujfnRDcpCZVc5vty3K4wx8gVbr/A3TwP1Di/n9EIxO/+
	rn2cG3XaCUSfKdfam9zAIM1VWUfbDbqlamdfaszsZ+hf67h0AypGFtgTWDlexDgf7q5rGyEy8xF6O
	vFAmAyTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjLhP-0000000AEh5-2AJk;
	Mon, 13 Jul 2026 18:48:15 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjLhN-0000000AEgc-03cD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 18:48:14 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-8fcc43c48f7so30595636d6.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 11:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783968491; x=1784573291; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+4oaM697jjJh0i29DhT77Bw1lzVGGZ7UjxKZh4sSss8=;
        b=bkkrhRFjCHXqB39hqpdajmgjzfRql0ff8mPNjzYVvDg9zuBM02qycXaMin3MSFp+34
         SxSRXzR01v5BjRV3f9XyjCjnRz4YoRDkVZO+wbR6g85QtIuFR/BCytPXdd8CPK7DvMjm
         X0BPaEp3Qw0hcRIj7+nF5JRYau8EAt6KGdzp8UzIz7XYTPVnqaYZpvegKXM8sQkiiMt2
         YCvXwK90+1fbfiLgCfl4DD2hxKmfLAJvVJqUwYs1Z1dwx79qWRmLZAH6WKV8cXwF7Yg+
         bOBqpwDzdEb0KHreYCr9WsyM5V1u93TsQJfwyB30CgrwqDauK04/j0lj/XXJ7yTjrqWE
         Gh1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783968491; x=1784573291;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+4oaM697jjJh0i29DhT77Bw1lzVGGZ7UjxKZh4sSss8=;
        b=cvm2OVYqEqVU4ClP3PCoUdWANGAN7j1CcET84vadHuetapgeQvqShSd/mhMIGQMLRI
         AxFTuQJLsw+0rdJREkVnv8lul+rRSejd7DUM8LSmcdCfDWmPlSyPZEi3fx4KxeHctNZU
         AXWiAwT66JKTnbdisEomsGhKdUUEaA2R34jhnC3iW5PLY/nsR1pi35DL3Bfb/jaTjsuH
         flWS60zjpNrcGPQyx4CnMdzvY91DhTTqR30a6RyYMnGi7M3gWd3DlIAGqu8wt00SX2BW
         Q4YLXgbkwF5matKxesPcREXBAQKRwKz3vXziMhh/Fh4QuFWlPd210CB+0wQT6cc7oeij
         Neiw==
X-Forwarded-Encrypted: i=1; AHgh+Rr26JFLCjFEnDZfDiBJxhiqYzUsyA9VkkZUXEIFcF/CZNkQRrApE03gn+OlOIUXKehKSve2AN0EelpJDuD5H6iY@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1HvrBOzF07IdMI0keXpamN6s6BDF4yDIr9hzwxXCovUzcF+Mc
	AjDamfQ8IHzR7aVGqcsyeO3+/sPPpBX3xlgYVbUk5QSo54vc6YWMuPKUzObog0XQfoE=
X-Gm-Gg: AfdE7cmKAEJ8xKQZXbsE7LhdpqxDV2aNRDiBpzVWJnGM1IpKKzKhFynF+HXnveEuLMJ
	zOldRth+1eWd3daMShhXE2FYMeLvkjRR7SS5lZEkG7z7I5uzxEeHD91wu13bOTuKVfIaWa4Yi8E
	hHOflyZlM5yfPWrYhnIszWLSbtrxTYVkWRXbidDpTHJeaOCrz/TAlI5g/VhgaA6Sj2jSttO+WGF
	/4NcQXivgxUVjmIyv4KToY/4Ee+FY4r07VmgoIAd+KcEu043LuLp9LlreTZFZAtaus+cCGow0uA
	05PFsYkjw+374HbPTtC/sRO4u4p38UGYuCHOnsbMPS4kpDyYazWZMl0A8DBk3kbsz50WOH6Ft1I
	3y/yNUqlLNUARPo9ZXJVbYH8a59EBuDE/pxNwJ6jRuOsE3kqlnmBlKp37j1+PVoQknWm9zfg=
X-Received: by 2002:a05:6214:e8c:b0:904:49fa:3085 with SMTP id 6a1803df08f44-90449fa364dmr123814316d6.18.1783968491378;
        Mon, 13 Jul 2026 11:48:11 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd82e8ffdsm139962266d6.37.2026.07.13.11.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 11:48:10 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjLhK-0000000E1oE-0kyB;
	Mon, 13 Jul 2026 15:48:10 -0300
Date: Mon, 13 Jul 2026 15:48:10 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
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
	Jiri Pirko <jiri@nvidia.com>, Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v7 11/22] dma-pool: track decrypted atomic pools and
 select them via attrs
Message-ID: <20260713184810.GM3133966@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-12-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701054926.825925-12-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_114813_067385_CD278B0F 
X-CRM114-Status: GOOD (  18.27  )
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

On Wed, Jul 01, 2026 at 11:19:15AM +0530, Aneesh Kumar K.V (Arm) wrote:
> @@ -114,14 +120,17 @@ static int atomic_pool_expand(struct gen_pool *pool, size_t pool_size,
>  	 * Memory in the atomic DMA pools must be unencrypted, the pools do not
>  	 * shrink so no re-encryption occurs in dma_direct_free().
>  	 */
> -	ret = set_memory_decrypted((unsigned long)page_to_virt(page),
> -				   1 << order);
> -	if (ret) {
> -		leak_pages = true;
> -		goto remove_mapping;
> +	if (dma_pool->cc_shared) {
> +		ret = set_memory_decrypted((unsigned long)page_to_virt(page),
> +					   1 << order);
> +		if (ret) {
> +			leak_pages = true;
> +			goto remove_mapping;
> +		}
>  	}

This makes the memory_decrypted conditional, but it doesn't change
the lines a few above:

	addr = dma_common_contiguous_remap(page, pool_size,
			pgprot_decrypted(pgprot_dmacoherent(PAGE_KERNEL)),
                            ^^^^^^^^^^^^
			__builtin_return_address(0));
	if (!addr)
		goto free_page;

It is wrong to pass pgprot_decrypted() to the arch code if
set_memory_decrypted() was not called.

Also it looks at some point the nature of the atomic pool has become
confused. Originally it was just to allocate atomic memory that had
been vmap'd outside the atomic context (to set the non-coherent
pgprot), so every caller was expecting non-cached memory.

Then it was reused to also allocate CC shared memory outside the
atomic context. That was fine for x86 that doesn't use DMA_REMAP but
on ARM64 it now means all atomic pool CC memory is uncached? That
doesn't seem to make any sense...

I suppose along the lines of this patch the solution is to add a
noncoherent property to the pool so we can select the correct
combination:

 noncoherent !SHARED = vmap pgprot_noncached
!noncoherent  SHARED= vmap pgprot_decrypted + set_memory_decrypted
 noncoherent  SHARED = (probably unrealistic in real systems)
!noncoherent !SHARED = normal __dma_direct_alloc_pages()

But I don't view this as that important, the CC hypervisor is probably
going to use the S2 page table to force cachable on all system memory
so the non-cached pgprot is a NOP, but the extra vmap is wasteful and
it is confusing.. So maybe a little fixme is all that is needed here.

Jason

