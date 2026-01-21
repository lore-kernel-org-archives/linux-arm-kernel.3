Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50ED0D262AD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 01:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h1u27U5gS1The7w0JK5akAoj89QIuvkN4z0DjyBy/sQ=; b=gACyU5IpggxTdAJVBv/p1+BUdP
	9iOvUQqMrWcAQmdZAv7a+LcIOTeKC33AC0QfUF/v5KfHhy49ru3SQBfMx8Ei5vH0vxJ8ZQ3hXwiOY
	6CIvjY1AXIaVIaTlOBx0dNS5u9MDgHJ1UXpSsBSFNzLGn/T4hN8VPB2+5jiKIf4ZKVkTqynl/PExD
	U++jiJ40vPe9gy3QOj8yquE830OBp9HsKoCVYYvxA3cjRjudUU/iMY1xp/LBbvlM05ujmOnc1FBgT
	TbkfB8TVgVZ2SYnRKPA1WoJ57YE2ZXluNEf3pJe8WhGNGAWPgQOz07/nq6FTlPmptrAcHAtx57R2O
	16ORUNEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viNEA-00000004ipL-2bxJ;
	Wed, 21 Jan 2026 01:41:46 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viNE7-00000004iov-2Gii
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 01:41:44 +0000
Received: from skinsburskii.localdomain (unknown [20.236.10.163])
	by linux.microsoft.com (Postfix) with ESMTPSA id B79F720B7167;
	Tue, 20 Jan 2026 17:41:40 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B79F720B7167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1768959701;
	bh=h1u27U5gS1The7w0JK5akAoj89QIuvkN4z0DjyBy/sQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qmKw9cInop9AHynO7hKDyhQLPFrZG1RLwzltG8pbrdak41axSEVaOiokn7fk5SsOu
	 3RZvI2gw1GArtNU2eD6flAKsm1NhYK5XDP2DHHgVW9Cx4hE3ulFRPSXxZZtRNpAobi
	 VyAzaz36TcJLoV8iRJQXalUBnjTSC+vZUxeDjGHY=
Date: Tue, 20 Jan 2026 17:41:39 -0800
From: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
To: Mukesh R <mrathor@linux.microsoft.com>
Cc: linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-pci@vger.kernel.org, linux-arch@vger.kernel.org,
	kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
	decui@microsoft.com, longli@microsoft.com, catalin.marinas@arm.com,
	will@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com, joro@8bytes.org,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, bhelgaas@google.com, arnd@arndb.de,
	nunodasneves@linux.microsoft.com, mhklinux@outlook.com,
	romank@linux.microsoft.com
Subject: Re: [PATCH v0 14/15] mshv: Remove mapping of mmio space during map
 user ioctl
Message-ID: <aXAu02NbucdEn-Ky@skinsburskii.localdomain>
References: <20260120064230.3602565-1-mrathor@linux.microsoft.com>
 <20260120064230.3602565-15-mrathor@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120064230.3602565-15-mrathor@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_174143_609145_6137D32F 
X-CRM114-Status: GOOD (  20.75  )
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

On Mon, Jan 19, 2026 at 10:42:29PM -0800, Mukesh R wrote:
> From: Mukesh Rathor <mrathor@linux.microsoft.com>
> 
> VFIO no longer puts the mmio pfn in vma->vm_pgoff. So, remove code
> that is using it to map mmio space. It is broken and will cause
> panic.
> 
> Signed-off-by: Mukesh Rathor <mrathor@linux.microsoft.com>
> ---
>  drivers/hv/mshv_root_main.c | 20 ++++----------------
>  1 file changed, 4 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/hv/mshv_root_main.c b/drivers/hv/mshv_root_main.c
> index 27313419828d..03f3aa9f5541 100644
> --- a/drivers/hv/mshv_root_main.c
> +++ b/drivers/hv/mshv_root_main.c
> @@ -1258,16 +1258,8 @@ static int mshv_prepare_pinned_region(struct mshv_mem_region *region)
>  }
>  
>  /*
> - * This maps two things: guest RAM and for pci passthru mmio space.
> - *
> - * mmio:
> - *  - vfio overloads vm_pgoff to store the mmio start pfn/spa.
> - *  - Two things need to happen for mapping mmio range:
> - *	1. mapped in the uaddr so VMM can access it.
> - *	2. mapped in the hwpt (gfn <-> mmio phys addr) so guest can access it.
> - *
> - *   This function takes care of the second. The first one is managed by vfio,
> - *   and hence is taken care of via vfio_pci_mmap_fault().
> + * This is called for both user ram and mmio space. The mmio space is not
> + * mapped here, but later during intercept.
>   */
>  static long
>  mshv_map_user_memory(struct mshv_partition *partition,
> @@ -1276,7 +1268,6 @@ mshv_map_user_memory(struct mshv_partition *partition,
>  	struct mshv_mem_region *region;
>  	struct vm_area_struct *vma;
>  	bool is_mmio;
> -	ulong mmio_pfn;
>  	long ret;
>  
>  	if (mem.flags & BIT(MSHV_SET_MEM_BIT_UNMAP) ||
> @@ -1286,7 +1277,6 @@ mshv_map_user_memory(struct mshv_partition *partition,
>  	mmap_read_lock(current->mm);
>  	vma = vma_lookup(current->mm, mem.userspace_addr);
>  	is_mmio = vma ? !!(vma->vm_flags & (VM_IO | VM_PFNMAP)) : 0;
> -	mmio_pfn = is_mmio ? vma->vm_pgoff : 0;
>  	mmap_read_unlock(current->mm);
>  
>  	if (!vma)
> @@ -1313,10 +1303,8 @@ mshv_map_user_memory(struct mshv_partition *partition,
>  					    HV_MAP_GPA_NO_ACCESS, NULL);
>  		break;
>  	case MSHV_REGION_TYPE_MMIO:
> -		ret = hv_call_map_mmio_pages(partition->pt_id,
> -					     region->start_gfn,
> -					     mmio_pfn,
> -					     region->nr_pages);
> +		/* mmio mappings are handled later during intercepts */
> +		ret = 0;

No need updating ret here: it's 0 after the previous call.

Thanks,
Stanislav

>  		break;
>  	}
>  
> -- 
> 2.51.2.vfs.0.1
> 

