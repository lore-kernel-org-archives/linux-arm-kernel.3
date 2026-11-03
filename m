Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147F6606A834
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 10:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JJ+SyQjM;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=NWgIs3/1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Wwd+1akc+9m6GAzeQKhhdYGuxL3Km6Pnar76WQom0mI=; b=JJ+SyQjMSkUeG+
	TcUcdkGm/B6Z7oY+ukBEcTBi0VSlzZXgnieeSL186/QKNvJKqE3FRNLEsKhgZZ2XqEjPBtGqb7+jg
	cZhxFSYpx10SCv4zxeBPzk9/v9RyrYx4toSMU0HaTkky+fwZPfsSQfgkg3hBABA6h0hpHBO1IJTTE
	3fkaKdpK4/0OJFTEzKNdJrgswnIbHWMm7tzGQsbfZiqU73KCjACGrtheKFHPrIRFzq/qBL9xQj8y5
	UG6mip/8Gro9z8DjdPcsit1fCBnBF+015wZ03wCl8J2pUKe3dKGgYtNVlQSwKqBepTLP2cY5FEYd5
	tCBrxoRH0WdhkOJq3zjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBkI-00000001zfI-0JwC;
	Tue, 03 Nov 2026 10:28:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBkF-00000001zcd-1QMv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 10:28:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ECFEF153B;
	Tue,  3 Nov 2026 02:27:54 -0800 (PST)
Received: from [10.57.66.79] (unknown [10.57.66.79])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA42E3F628;
	Tue,  3 Nov 2026 02:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793701678; bh=JGv4HbtoYJWryfsMptq2ido6QHmvaaQformtaau3Dsw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NWgIs3/1gxhtNnu3cixv1DpBk2C2ExTrY5PlfCOOBgx5xRVRpiHw1OyFvTrFQLOXF
	 hevzrOATtIPVEG584h3xOuNGBEnT8qVqSm10dkCZ52Xm2Y3Y4iZuV/uYJ/5BVz06XE
	 PmSpow+3T2VIV0qP3aeQKxKbFYWp7mrNGtVbw4E4=
Message-ID: <9841ba98-7f07-4d5d-8397-a07e22ba7f51@arm.com>
Date: Tue, 3 Nov 2026 10:27:54 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] KVM: arm64: Skip empty IPA ranges when destroying
 stage-2 page-tables
Content-Language: en-GB
To: Fuad Tabba <fuad.tabba@linux.dev>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oupton@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Steffen Eiden <seiden@linux.ibm.com>, Zenghui Yu <yuzenghui@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Raghavendra Rao Ananta <rananta@google.com>, Fuad Tabba <tabba@google.com>
References: <20261103084742.1302597-1-fuad.tabba@linux.dev>
 <20261103084742.1302597-3-fuad.tabba@linux.dev>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261103084742.1302597-3-fuad.tabba@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_022759_482812_B852D75E 
X-CRM114-Status: GOOD (  25.65  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Fuad

On 03/11/2026 08:47, Fuad Tabba wrote:
> The page-table walker steps over an empty entry in one go, but
> kvm_stage2_destroy() starts a new walk for every block-sized chunk of
> the IPA space. Tearing down a VM that requests a 52-bit IPA then takes
> 2^27 walks with 16K pages (2^22 with 4K), however little it maps.
> crosvm requests the host's limit.
> 

The patch looks good to me, in fact I was thinking about the same thing
yesterday while looking at the same code from a different angle, to move
to the vm_s2_ops abstraction.

> After destroying each chunk, look up the entry at its start and, if it
> is empty and larger than a chunk, skip its whole range. The lookup reads

Could we not lookup first before we destroy, that way we can avoid 
destroy walks ?

> fields that hold the mapping tree on a pKVM stage-2, so this depends on
> the previous patch keeping pKVM out of stage2_destroy_range(). For the
> same reason, call kvm_pgtable_stage2_destroy_range() directly rather
> than through KVM_PGT_FN().



> 
> Fixes: 4ddfab5436b69 ("KVM: arm64: Reschedule as needed when destroying the stage-2 page-tables")
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>   arch/arm64/kvm/mmu.c | 15 +++++++++++++--
>   1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 42977cf8a7f5d..10b425a0141be 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1010,9 +1010,20 @@ static void stage2_destroy_range(struct kvm_pgtable *pgt, phys_addr_t addr,
>   	u64 next;
>   
>   	do {
> +		kvm_pte_t pte;
> +		s8 level;
> +
>   		next = stage2_range_addr_end(addr, end);
> -		KVM_PGT_FN(kvm_pgtable_stage2_destroy_range)(pgt, addr,
> -							     next - addr);
> +		kvm_pgtable_stage2_destroy_range(pgt, addr, next - addr);

minor nit: Given the kvm_pgtable_stage2_destroy_range() is the only 
called from here, and this caller would benefit from the walk
information, would it make sense to return a hint back ? Not sure how
much of that is possible. We do this in the RMM, always return a hint
of the next possible address. Of course this is not that expensive
as the CCA case and could be dealt in a separate series.

> +
> +		/*
> +		 * The walk freed every table it emptied, so skipping an empty
> +		 * entry here doesn't leave anything behind.
> +		 */
> +		if (!kvm_pgtable_get_leaf(pgt, addr, &pte, &level, 0) && !pte &&
> +		    level < KVM_PGTABLE_MIN_BLOCK_LEVEL)
> +			next = __stage2_range_addr_end(addr, end, kvm_granule_size(level));

Suzuki


> +
>   		if (next != end)
>   			cond_resched();
>   	} while (addr = next, addr != end);


