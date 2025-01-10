Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10AEBE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 14:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fgzunbxt/Dl7UfZi7T/9jMfP9S8v7tBKK3N7+TksBTg=; b=oE3nTZzXmVIYWR9jP2SGWMGU4v
	00L1pQpYH7oY29DbJBixZWbZIIZ7+f8kTqdiJuPioC860WzcrCJzNyrWy7IK62C/a4d5F0pLYi+cH
	L4Ard9ZE0tODojujqk9c7gsnzFq9iDwyIz2uq87Y5aMH+5Fq8M30/Gmc6A8p0/7RBaxFIQLtlly2c
	2RbXNSKfLiM/YNFOxEwBB39/UAgjrF+dTzoJlOqKHOGVFnlbBkREUxANWt9dPfT1jOr3TmPjUbAS+
	mNVRmmP2eEuWn6gTo2u4Z1Fw5lUihn/WpurLaEJ6Jgb6xxBhNDnkKEz9kDF89/ZGKJZzKCC0zGK+H
	W37szfBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWFuC-0000000FcoV-0H00;
	Fri, 10 Jan 2025 14:22:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWEnD-0000000FQ76-2V0k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 13:11:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 206755C106F;
	Fri, 10 Jan 2025 13:10:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C68A3C4CEE0;
	Fri, 10 Jan 2025 13:11:12 +0000 (UTC)
Date: Fri, 10 Jan 2025 13:11:10 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Steven Price <steven.price@arm.com>, Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>, Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v2 2/7] KVM: arm64: MTE: Update code comments
Message-ID: <Z4Ecbi9QUScEstCQ@arm.com>
References: <20250110110023.2963795-1-aneesh.kumar@kernel.org>
 <20250110110023.2963795-3-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110110023.2963795-3-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_051115_687611_B15C635F 
X-CRM114-Status: GOOD (  23.11  )
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

On Fri, Jan 10, 2025 at 04:30:18PM +0530, Aneesh Kumar K.V (Arm) wrote:
> commit d77e59a8fccd ("arm64: mte: Lock a page for MTE tag
> initialisation") updated the locking such the kernel now allows
> VM_SHARED mapping with MTE. Update the code comment to reflect this.
> 
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  arch/arm64/kvm/mmu.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index c9d46ad57e52..eb8220a409e1 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1391,11 +1391,11 @@ static int get_vma_page_shift(struct vm_area_struct *vma, unsigned long hva)
>   * able to see the page's tags and therefore they must be initialised first. If
>   * PG_mte_tagged is set, tags have already been initialised.
>   *
> - * The race in the test/set of the PG_mte_tagged flag is handled by:
> - * - preventing VM_SHARED mappings in a memslot with MTE preventing two VMs
> - *   racing to santise the same page
> - * - mmap_lock protects between a VM faulting a page in and the VMM performing
> - *   an mprotect() to add VM_MTE
> + * The race in the test/set of the PG_mte_tagged flag is handled by using
> + * PG_mte_lock and PG_mte_tagged together. if PG_mte_lock is found unset, we can
> + * go ahead and clear the page tags. if PG_mte_lock is found set, then the page
> + * tags are already cleared or there is a parallel tag clearing is going on. We
				  ^^^^^^^^
				  remove this (or the other 'is')


> + * wait for the parallel tag clear to finish by waiting on PG_mte_tagged bit.
>   */

I don't think we need to describe the behaviour of set_page_mte_tagged()
and try_page_mte_tagging() in here. How the locking works for tagged
pages was hidden in those functions with their own documentation. I
would just remove this whole paragraph here, just leave the first one
stating that the tags must be initialised if not already done so.

-- 
Catalin

