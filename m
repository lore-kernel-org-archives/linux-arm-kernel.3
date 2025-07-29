Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E51D5C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 16:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3B/rfeapbthmIcnLwo9IRZoO1aenCmPbL9oFe6IN3jo=; b=RBRC3z2BAsqkD1Zbfr0kW9P0cv
	QLz09YEjj30XZhq246Vl7f2svrff0Hk+eu8yWq+IsgLlxguBsSujODhG9A1RdHYrwIf0zipVmMMzf
	rBwnZzfyByzHfAxrmyZ/aO+PfY4cgrS7mH97za+d9jJdsn8+Jv1Yy7yThXnd82Ky3opugzP7VjaA7
	FOsxF8Wg6D3SuX5B9NJ9Aq93SpGDequVYQgMwBMgp9OEQ5mu8g2zpDtpaSty3M8xpbpzdxLCjSTuh
	BZQKV/P66dIaYZ+e7FLLghFDa1AzSoZRRaN8+NZm2Fi5lt6PjDWLSEyHZ0LYKqeVyUvMtVIGr1J42
	am7AIpkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugn4e-0000000HG7l-3w0x;
	Tue, 29 Jul 2025 16:21:08 +0000
Received: from out-180.mta1.migadu.com ([95.215.58.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugmm3-0000000HDEl-3gwz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 16:01:57 +0000
Date: Tue, 29 Jul 2025 09:01:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753804913;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3B/rfeapbthmIcnLwo9IRZoO1aenCmPbL9oFe6IN3jo=;
	b=ImColJVbfscPb/0mBsz4xbAjxEgoz7J03iLZm5emzMbFd7tEW4nwJWFwO+yaDkSDCKRNW+
	QRNWbLrjWBmhAIk7yxxyhPKzsHURc/4lsFSpfju8uZoL4SK7pXCYLHCFqTkkD4KYg8pHL7
	7MjEmfjLmMnBcVFwhCSsgmv7zLAVNGg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Raghavendra Rao Ananta <rananta@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Mingwei Zhang <mizhang@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Subject: Re: [PATCH 2/2] KVM: arm64: Destroy the stage-2 page-table
 periodically
Message-ID: <aIjwalITY6CAj7TO@linux.dev>
References: <20250724235144.2428795-1-rananta@google.com>
 <20250724235144.2428795-3-rananta@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724235144.2428795-3-rananta@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_090156_062491_A150FBC6 
X-CRM114-Status: GOOD (  15.66  )
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

On Thu, Jul 24, 2025 at 11:51:44PM +0000, Raghavendra Rao Ananta wrote:
> +/*
> + * Assume that @pgt is valid and unlinked from the KVM MMU to free the
> + * page-table without taking the kvm_mmu_lock and without performing any
> + * TLB invalidations.
> + *
> + * Also, the range of addresses can be large enough to cause need_resched
> + * warnings, for instance on CONFIG_PREEMPT_NONE kernels. Hence, invoke
> + * cond_resched() periodically to prevent hogging the CPU for a long time
> + * and schedule something else, if required.
> + */
> +static void stage2_destroy_range(struct kvm_pgtable *pgt, phys_addr_t addr,
> +			      phys_addr_t end)
> +{
> +	u64 next;
> +
> +	do {
> +		next = stage2_range_addr_end(addr, end);
> +		kvm_pgtable_stage2_destroy_range(pgt, addr, next - addr);
> +
> +		if (next != end)
> +			cond_resched();
> +	} while (addr = next, addr != end);
> +}
> +
> +static void kvm_destroy_stage2_pgt(struct kvm_pgtable *pgt)
> +{
> +	if (!is_protected_kvm_enabled()) {
> +		stage2_destroy_range(pgt, 0, BIT(pgt->ia_bits));
> +		kvm_pgtable_stage2_destroy_pgd(pgt);
> +	} else {
> +		pkvm_pgtable_stage2_destroy(pgt);
> +	}
> +}
> +

Protected mode is affected by the same problem, potentially even worse
due to the overheads of calling into EL2. Both protected and
non-protected flows should use stage2_destroy_range().

Thanks,
Oliver

