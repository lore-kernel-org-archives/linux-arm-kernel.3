Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 027FF108E1D4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 10:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t+GRul6MvJVjinPHXHUdOrr8MbQxeQ0q4sEOEa7n9u0=; b=kypb2NkVLpLegsLVCSh0e/pbYz
	jzvd/Ar+szTiz+m5kHziX3OfMjVGJlnjx8qodahG9rl9d+0H1tlr7ZSUUhVlq9kbowVXmVBx0+pWq
	7qg17RdfAZ3HXtZdddWxxotjdVa2bchDy0Pzr1DtAnN6anPtLFy9DVdHDMRH129T9FPxSPYfFqzSL
	yEzpU8lzGbXdElnGItCywdAwJx1fxMZLwQQUiBLiZllUCQ2GGByWSrXE/QJA139hUbe+2r0j8eSnk
	PsxYf/T7TdlQcFW8HSjsjEllQ9kEEtmVooUsm0fOB7mRaO83Fsq08F1jnfQ65aGQ8Vq3x7I8Z9vEr
	IjxAdXfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3AYq-0000000APVe-3LxY;
	Thu, 19 Mar 2026 10:25:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3AYn-0000000APUv-0W8L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 10:25:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E789F1BD0;
	Thu, 19 Mar 2026 03:24:52 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 655DB3F7BD;
	Thu, 19 Mar 2026 03:24:56 -0700 (PDT)
Date: Thu, 19 Mar 2026 10:24:54 +0000
From: Joey Gouly <joey.gouly@arm.com>
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>
Subject: Re: [PATCH v13 36/48] arm64: RMI: Always use 4k pages for realms
Message-ID: <20260319102454.GB3942350@e124191.cambridge.arm.com>
References: <20260318155413.793430-1-steven.price@arm.com>
 <20260318155413.793430-37-steven.price@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318155413.793430-37-steven.price@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_032501_281441_897D471D 
X-CRM114-Status: GOOD (  24.77  )
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

Hi,

On Wed, Mar 18, 2026 at 03:54:00PM +0000, Steven Price wrote:
> Guest_memfd doesn't yet natively support huge pages, and there are
> currently difficulties for a VMM to manage huge pages efficiently so for
> now always split up mappings to PTE (4k).
> 
> The two issues that need progressing before supporting huge pages for
> realms are:
> 
>  1. guest_memfd needs to be able to allocate from an appropriate
>     allocator which can provide huge pages.
> 
>  2. The VMM needs to be able to repurpose private memory for a shared
>     mapping when the guest VM requests memory is transitioned. Because
>     this can happen at a 4k granularity it isn't possible to
>     free/reallocate while huge pages are in use. Allowing the VMM to
>     mmap() the shared portion of a huge page would allow the huge page
>     to be recreated when the memory is unshared and made protected again.
> 
> These two issues are not specific to realms and don't affect the realm
> API, so for now just break everything down to 4k pages in the RMM
> controlled stage 2. Future work can add huge page support without
> changing the uAPI.

The commit title/message mention 4K, but should probably say PAGE_SIZE or
something now that RMM isn't fixed to 4K.

Thanks,
Joey

> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v7:
>  * Rewritten commit message
> ---
>  arch/arm64/kvm/mmu.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 73c18c2861a2..ad1300f366df 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1761,11 +1761,14 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  	write_fault = kvm_is_write_fault(vcpu);
>  
>  	/*
> -	 * Realms cannot map protected pages read-only
> +	 * Realms cannot map protected pages read-only, also force PTE mappings
> +	 * for Realms.
>  	 * FIXME: It should be possible to map unprotected pages read-only
>  	 */
> -	if (vcpu_is_rec(vcpu))
> +	if (vcpu_is_rec(vcpu)) {
>  		write_fault = true;
> +		force_pte = true;
> +	}
>  
>  	exec_fault = kvm_vcpu_trap_is_exec_fault(vcpu);
>  	VM_WARN_ON_ONCE(write_fault && exec_fault);
> -- 
> 2.43.0
> 
> 

