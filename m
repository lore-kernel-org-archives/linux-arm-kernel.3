Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08780C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 16:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wlri4TImGK2Nq390bQXaKqOdz2FIIALuCIDn8HJtVIo=; b=wLWvRYEBfQOXltG6tPkxDc1zfj
	+4/6Q0cC16IxYHrWcIiDi0pt3vNsX0jL5cZrYsTuUMcQcxV6H1oCYI7p0ja3OVVBMAmn5o3aQ2k86
	760hOnqUmKX5KGO3nrsDlB6TTTpCQaDfBqZIjFYXuPmc2adT8RyXs4Bifr5T1+tRvKtDr37S4UlnI
	gzZ61Twl2a/GJJB7SD0pTlV3XeHoyx4bVafHxJplVHl6o0jDc2kRE/zFw6VvNPxLQ1sSnV6bV+wpN
	zLAXz82Ej+ZKvmpu0EmOw7wTXJEaHbbCQ8PfZEveQwq73+NHmB1qPDAcCWVLiY4hgt11Wn3cupcYj
	rTXKgTNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugn2F-0000000HFgH-0caW;
	Tue, 29 Jul 2025 16:18:39 +0000
Received: from out-172.mta1.migadu.com ([95.215.58.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugmhq-0000000HCNR-0nr9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 15:57:36 +0000
Date: Tue, 29 Jul 2025 08:57:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753804650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Wlri4TImGK2Nq390bQXaKqOdz2FIIALuCIDn8HJtVIo=;
	b=qDhRQfbvrQnB679V2u+y99NiCS4UGBDkb4hEi9ISnukmWBAlHwk4ngyyadfiZN6JcuEl2g
	4TyqTbHXhqxPDRTeuhIgq71qJUptKzeOs9D52DBosEAlZs1O8d6w454t2nd7vEqRhBZ4mD
	E5xPMb3TNhQ32Wwtr0RlB8jimsDkfhc=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Raghavendra Rao Ananta <rananta@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Mingwei Zhang <mizhang@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Subject: Re: [PATCH 1/2] KVM: arm64: Split kvm_pgtable_stage2_destroy()
Message-ID: <aIjvYl474_6F9d9P@linux.dev>
References: <20250724235144.2428795-1-rananta@google.com>
 <20250724235144.2428795-2-rananta@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724235144.2428795-2-rananta@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_085734_950275_E17A786A 
X-CRM114-Status: GOOD (  16.61  )
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

On Thu, Jul 24, 2025 at 11:51:43PM +0000, Raghavendra Rao Ananta wrote:
> Split kvm_pgtable_stage2_destroy() into two:
>   - kvm_pgtable_stage2_destroy_range(), that performs the
>     page-table walk and free the entries over a range of addresses.
>   - kvm_pgtable_stage2_destroy_pgd(), that frees the PGD.
> 
> This refactoring enables subsequent patches to free large page-tables
> in chunks, calling cond_resched() between each chunk, to yield the CPU
> as necessary.
> 
> Direct callers of kvm_pgtable_stage2_destroy() will continue to walk
> the entire range of the VM as before, ensuring no functional changes.
> 
> Also, add equivalent pkvm_pgtable_stage2_*() stubs to maintain 1:1
> mapping of the page-table functions.

Uhh... We can't stub these functions out for protected mode, we already
have a load-bearing implementation of pkvm_pgtable_stage2_destroy().
Just reuse what's already there and provide a NOP for
pkvm_pgtable_stage2_destroy_pgd().

> +void kvm_pgtable_stage2_destroy_pgd(struct kvm_pgtable *pgt)
> +{
> +	/*
> +	 * We aren't doing a pgtable walk here, but the walker struct is needed
> +	 * for kvm_dereference_pteref(), which only looks at the ->flags.
> +	 */
> +	struct kvm_pgtable_walker walker = {0};

This feels subtle and prone for error. I'd rather we have something that
boils down to rcu_dereference_raw() (with the appropriate n/hVHE awareness)
and add a comment why it is safe.

> +void kvm_pgtable_stage2_destroy(struct kvm_pgtable *pgt)
> +{
> +	kvm_pgtable_stage2_destroy_range(pgt, 0, BIT(pgt->ia_bits));
> +	kvm_pgtable_stage2_destroy_pgd(pgt);
> +}
> +

Move this to mmu.c as a static function and use KVM_PGT_FN()

Thanks,
Oliver

