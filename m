Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE74C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 19:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gOwQ+Auu3tsNtr8PtwyJWf1qBPBbP0g86Uhe8F7OmW4=; b=LM3Xtkcq1mFjiiQAGoX4XCflM1
	9/CxxzXyyYEBBvYml05xr2kHN2Nb341TD5e9oI9t4RP3B6CaBgECdCWA417+wJ1aQ0aZsCC2WYyiC
	jfV5YHxW3E1UeoIb71NUNJtZgd22hvpT441O4zFZnowyXhjWBn4gV+7gH31pSEKzKoeAYaa6YkHZJ
	vJmNEV7hHaq6+CXdGuSOKZBFZ60lP/JwqkoPn+OFcfMWXJIx+Gvp58pzeRvW/PASYuWwXTLMrAfGQ
	n69o3w65c5CJeCdn0khuePg2VqRHy5uKzcojbSucYJyWNbnuZigJxtrtFfP4rx8TJDwmwSLZxqCVg
	ZEqGj17Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRyfO-0000000BEh9-48z5;
	Wed, 18 Jun 2025 19:41:50 +0000
Received: from out-172.mta1.migadu.com ([2001:41d0:203:375::ac])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRyQt-0000000BDRY-20DE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 19:26:53 +0000
Date: Wed, 18 Jun 2025 12:26:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750274806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gOwQ+Auu3tsNtr8PtwyJWf1qBPBbP0g86Uhe8F7OmW4=;
	b=vwAk49NjoH5esinO7DkuB3fKptPSt0JKN4BgTnq97A9HXw7rW6Z24EpSOdFjjojn0CaJup
	xH1HWIJdPjgd0DlKBGszFyJkTlLCN3pEhcUgJcztyVAXW1pdpnub4z+j8D73WRlw3BCZHE
	ZuhB2mVxiTyH1dlKeU0g8gXQes0WsrM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: James Houghton <jthoughton@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Yan Zhao <yan.y.zhao@intel.com>,
	Nikita Kalyazin <kalyazin@amazon.com>,
	Anish Moorthy <amoorthy@google.com>,
	Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>,
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com,
	kvm@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v3 02/15] KVM: arm64: Add "struct kvm_page_fault" to
 gather common fault variables
Message-ID: <aFMS4O2TkWN8nexY@linux.dev>
References: <20250618042424.330664-1-jthoughton@google.com>
 <20250618042424.330664-3-jthoughton@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618042424.330664-3-jthoughton@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_122651_939924_DF0628EB 
X-CRM114-Status: GOOD (  17.41  )
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

On Wed, Jun 18, 2025 at 04:24:11AM +0000, James Houghton wrote:
> From: Sean Christopherson <seanjc@google.com>
> 
> Introduce "struct kvm_page_fault" and use it in user_mem_abort() in lieu
> of a collection of local variables.  Providing "struct kvm_page_fault"
> will allow common KVM to provide APIs to take in said structure, e.g. when
> preparing memory fault exits.
> 
> No functional change intended.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: James Houghton <jthoughton@google.com>
> ---
>  arch/arm64/include/asm/kvm_host.h |  9 +++++++++
>  arch/arm64/kvm/mmu.c              | 32 +++++++++++++++++--------------
>  2 files changed, 27 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 6ce2c51734820..ae83d95d11b74 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -413,6 +413,15 @@ struct kvm_vcpu_fault_info {
>  	u64 disr_el1;		/* Deferred [SError] Status Register */
>  };
>  
> +struct kvm_page_fault {
> +	const bool exec;
> +	const bool write;
> +	const bool is_private;
> +
> +	gfn_t gfn;
> +	struct kvm_memory_slot *slot;
> +};
> +

So this seems to cherry-pick "interesting" values into the structure but
leaves the rest of the abort context scattered about in locals. If we're
going to do something like this I'd rather have a wholesale refactoring
than just the bits to intersect with x86 (more on that later...)

Thanks,
Oliver

