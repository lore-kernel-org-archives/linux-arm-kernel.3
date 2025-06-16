Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1525CC71155
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 11:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9VOtuEVr99iSPNIrZYS0BKmW4kxzR7xhPIBKM6JeYfo=; b=wlu0EOTouQaqZip0RI9+xNCot5
	f+IZyRhBeJ1KUF3HKzFq1tNxAva2uJAtYZVoUfJNwioJ2FMJC0bL23AcAINhbHuQdzOKsXjbLKyEx
	G2thqMLARjWBl4VytfiHr0uCv/yKNFxnzXX15sJQ4dvDKdVOx0YQLk/Ec6Mlc2ze52c6sPPTgv3iB
	z+wGJ+xZVOfrZBplwybY9dI3uDmjUP9HCzX9tJkPN6UCZFPPg6TmQ6NVObXLtOtzIZ7ehSfOf9q5U
	IDoq/WqivPmtbQKF2/r5uKID8YVXXQLiQwG2t8PBRf3fOw4qGebbZCOOJKsD1ONCuKJVK23M3Qpvj
	jnICblEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR8PH-00000004Fxq-1Lr8;
	Mon, 16 Jun 2025 11:53:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR7HU-0000000461m-2ST8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 10:41:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27592150C;
	Mon, 16 Jun 2025 03:41:12 -0700 (PDT)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 31E963F58B;
	Mon, 16 Jun 2025 03:41:31 -0700 (PDT)
Message-ID: <b39ce0e3-5d44-4334-b739-2af07a24a668@arm.com>
Date: Mon, 16 Jun 2025 11:41:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 10/43] arm64: RME: RTT tear down
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>
References: <20250611104844.245235-1-steven.price@arm.com>
 <20250611104844.245235-11-steven.price@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250611104844.245235-11-steven.price@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_034136_720829_724EEC1D 
X-CRM114-Status: GOOD (  18.84  )
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

Hi Steven

On 11/06/2025 11:48, Steven Price wrote:
> The RMM owns the stage 2 page tables for a realm, and KVM must request
> that the RMM creates/destroys entries as necessary. The physical pages
> to store the page tables are delegated to the realm as required, and can
> be undelegated when no longer used.
> 
> Creating new RTTs is the easy part, tearing down is a little more
> tricky. The result of realm_rtt_destroy() can be used to effectively
> walk the tree and destroy the entries (undelegating pages that were
> given to the realm).
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>

A couple of minor nits below. Should have spotted earlier, apologies.
...

> diff --git a/arch/arm64/kvm/rme.c b/arch/arm64/kvm/rme.c
> index 73261b39f556..0f89295fa59c 100644
> --- a/arch/arm64/kvm/rme.c
> +++ b/arch/arm64/kvm/rme.c
> @@ -17,6 +17,22 @@ static unsigned long rmm_feat_reg0;
>   #define RMM_PAGE_SHIFT		12
>   #define RMM_PAGE_SIZE		BIT(RMM_PAGE_SHIFT)
>   
> +#define RMM_RTT_BLOCK_LEVEL	2
> +#define RMM_RTT_MAX_LEVEL	3
> +
> +/* See ARM64_HW_PGTABLE_LEVEL_SHIFT() */
> +#define RMM_RTT_LEVEL_SHIFT(l)	\
> +	((RMM_PAGE_SHIFT - 3) * (4 - (l)) + 3)
> +#define RMM_L2_BLOCK_SIZE	BIT(RMM_RTT_LEVEL_SHIFT(2))
> +
> +static inline unsigned long rme_rtt_level_mapsize(int level)
> +{
> +	if (WARN_ON(level > RMM_RTT_MAX_LEVEL))
> +		return RMM_PAGE_SIZE;
> +
> +	return (1UL << RMM_RTT_LEVEL_SHIFT(level));
> +}
> +
>   static bool rme_has_feature(unsigned long feature)
>   {
>   	return !!u64_get_bits(rmm_feat_reg0, feature);
> @@ -82,6 +98,126 @@ static int free_delegated_granule(phys_addr_t phys)
>   	return 0;
>   }
>   
> +static void free_rtt(phys_addr_t phys)
> +{
> +	if (free_delegated_granule(phys))
> +		return;
> +
> +	kvm_account_pgtable_pages(phys_to_virt(phys), -1);
> +}
> +
> +static int realm_rtt_destroy(struct realm *realm, unsigned long addr,
> +			     int level, phys_addr_t *rtt_granule,
> +			     unsigned long *next_addr)
> +{
> +	unsigned long out_rtt;
> +	int ret;
> +
> +	ret = rmi_rtt_destroy(virt_to_phys(realm->rd), addr, level,
> +			      &out_rtt, next_addr);
> +
> +	*rtt_granule = out_rtt;
> +
> +	return ret;

ultra minor nit: this could simply be :

	return rmi_rtt_destroy(virt_to_phys(realm->rd), addr, level, 
rtt_granule, next_addr);


...

> +
> +static int realm_tear_down_rtt_range(struct realm *realm,
> +				     unsigned long start, unsigned long end)
> +{

minor nit: Is it worth adding a comment here, why we start from 
start_level + 1 and downwards ? Something like:

	/*
	 * Root level RTTs can only be destroyed after the RD is
	 * destroyed. So tear down everything below the root level.
	 */

Similarly, we may be able to clarify a comment in kvm_free_stage2_pgd()

Suzuki


