Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1A7CD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 11:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AfaRmOFwq9PG0Q9lB7Y5h4Js0tCrSyooaZYJ9TAjF4I=; b=hZzVJtYUtSkIci7U/xly5DM5o4
	1TN1JmnNIxqm0r48ea44o5bB1sGv/qPFx+DJ2JNnVPLcPQ4NHnZfG7hnAWlL9rNxjd2ytj6yy3zEm
	fI9tO8eDxRd5mN2vcsKU6nxrjVX1KJnIV+K/G5svsgCR0PvrlUeEgBl7z4HdWttoLM8xCKSdfq6AY
	5buA1loAsxHzqjkc5FMplLqYc215FHD1ZyH68lWoBd7JF73rNLp1UfDua3mo+6OaV8onfCHmuDhWi
	H+eJjU2pjXnwSO0PL4Ig14/54UBSx/rU6JATra0PWg5FA1ol8OMo8aCdSq1nzDkDmA2/xSUKYzSYp
	Ru4fk04A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ1yt-00000007ewi-3kvi;
	Thu, 21 May 2026 11:54:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ1yp-00000007ew2-26B6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 11:54:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5740A437CB;
	Thu, 21 May 2026 11:54:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D60901F000E9;
	Thu, 21 May 2026 11:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779364462;
	bh=AfaRmOFwq9PG0Q9lB7Y5h4Js0tCrSyooaZYJ9TAjF4I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=VRoV8Obk6Db2yTrA5yAdD7bmtQFvSWYfd/ZMw0E5GBL5jIdP8p2frzgVjebJ/AI8N
	 hR/ltXnLmqYytDDOSL4NfrAm8WWL6Eapslk7nKLHkiEPTsINTDc/s/wXE5nhOEOkw0
	 ocFPhIherbIJmWmA0TT9aOS8dxo5zor2QipnNUscdwsm508C2EjBqUXMBblgS8bTHy
	 VTwtO3pIzg195ryyporAX+AUffxjuJV03eR50aV96prxY5h11jwtvbWjHvTe3DepXz
	 Q2BR9ERr09ummMuYbcfqyARU4HAkb3n2S7jWp660Rin4hD/1ttPs8n0zhk15N2/FrI
	 IAG1as/hVnwgg==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev
Cc: Robin Murphy <robin.murphy@arm.com>,
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
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [PATCH v4 13/13] x86/amd-gart: preserve the direct DMA address
 until GART mapping succeeds
In-Reply-To: <20260512090408.794195-14-aneesh.kumar@kernel.org>
References: <20260512090408.794195-1-aneesh.kumar@kernel.org>
 <20260512090408.794195-14-aneesh.kumar@kernel.org>
Date: Thu, 21 May 2026 17:24:07 +0530
Message-ID: <yq5a4ik16krk.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_045423_576521_9026E107 
X-CRM114-Status: GOOD (  16.62  )
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

"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> writes:

> gart_alloc_coherent() first allocates memory through dma_direct_alloc(),
> which returns a direct-mapped DMA address in dma_addr. When force_iommu is
> enabled, the buffer is then remapped.
>
> Do not overwrite dma_addr before dma_map_area() has succeeded. Keep the
> dma_map_area result in a temporary variable so the direct DMA address
> remains available for dma_direct_free() on the error path.
>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  arch/x86/kernel/amd_gart_64.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/arch/x86/kernel/amd_gart_64.c b/arch/x86/kernel/amd_gart_64.c
> index b5f1f031d45b..a109649c5649 100644
> --- a/arch/x86/kernel/amd_gart_64.c
> +++ b/arch/x86/kernel/amd_gart_64.c
> @@ -467,18 +467,20 @@ gart_alloc_coherent(struct device *dev, size_t size, dma_addr_t *dma_addr,
>  		    gfp_t flag, unsigned long attrs)
>  {
>  	void *vaddr;
> +	dma_addr_t dma_map_addr;
>  
>  	vaddr = dma_direct_alloc(dev, size, dma_addr, flag, attrs);
>  	if (!vaddr ||
>  	    !force_iommu || dev->coherent_dma_mask <= DMA_BIT_MASK(24))
>  		return vaddr;
>  
> -	*dma_addr = dma_map_area(dev, virt_to_phys(vaddr), size,
> -				 DMA_BIDIRECTIONAL,
> -				 (1UL << get_order(size)) - 1, attrs);
> +	dma_map_addr = dma_map_area(dev, virt_to_phys(vaddr), size,
> +				     DMA_BIDIRECTIONAL,
> +				     (1UL << get_order(size)) - 1, attrs);
>  	flush_gart();
> -	if (unlikely(*dma_addr == DMA_MAPPING_ERROR))
> +	if (unlikely(dma_map_addr == DMA_MAPPING_ERROR))
>  		goto out_free;
> +	*dma_addr = dma_map_addr;
>  	return vaddr;
>  out_free:
>  	dma_direct_free(dev, size, vaddr, *dma_addr, attrs);
> -- 
> 2.43.0
>

This needs corresponding changes on the gart_free_coherent() side as well.

https://sashiko.dev/#/patchset/20260512090408.794195-1-aneesh.kumar%40kernel.org?part=13

I will avoid making that change as part of this series, since I assume
it would require specific testing.

-aneesh

