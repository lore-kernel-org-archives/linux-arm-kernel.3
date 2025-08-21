Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB20CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 03:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oFEGbbG9vuv1+XubWypEttTMi6N6Jq7oeRJFb4KHVfY=; b=arIcUkkJrKyUGkSEQlxtx9DWPh
	3ZUl+mgRP++xhaQtB7uHYe/VFEmFxptuRvx26whX6z2KqRay5YhQvYs1ac5paY12gtzJKeyCIqlmy
	wpHJ8RYxcLYQEgN5BfLWqY+UlanNiir9RxuUYUy4frMBR0PTFsW1agVCg03F0XKEs+TQXuGtATQmO
	p113h5isZD8OLhzluog9n/2yGceRfDs6fJTVAT4jPraTt+eRZUbMb9Wd6ZXsVJamazd/H4fY8eu85
	5odjfah8Zlvks8wKGc/NIzHNX6SUWeXtZp6DubVTKJk0eUsTIs7yc7TTbdQfMF0eWPD+gCu27Vwxo
	69iTS8bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upIZu-00000001PPg-2hfV;
	Fri, 22 Aug 2025 03:36:34 +0000
Received: from out-178.mta0.migadu.com ([91.218.175.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upDpE-00000000kMR-12w9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 22:32:06 +0000
Date: Thu, 21 Aug 2025 15:31:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1755815520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oFEGbbG9vuv1+XubWypEttTMi6N6Jq7oeRJFb4KHVfY=;
	b=hjrNecBBoBWsKWTqEpFNnL+iVXrbWpNYn9MFE86Hjj9HjdbamZiTL06lrzvtFamG9v4Wv4
	rrSvmoyOB+TWNaAkyALNXOJrbgAhJE2dmzauDVGvPIYJRfdYheZw6vDXdaaOZycSw47tIB
	7Yv9fNk7SuYSS+W/V0ht2XEqKPoiXHA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
	James Houghton <jthoughton@google.com>
Subject: Re: [RFC PATCH 05/16] KVM: arm64: Introduce "struct kvm_page_fault"
 for tracking abort state
Message-ID: <aKeeRynpwFTSONfm@linux.dev>
References: <20250821210042.3451147-1-seanjc@google.com>
 <20250821210042.3451147-6-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821210042.3451147-6-seanjc@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_153204_558000_37C2164E 
X-CRM114-Status: GOOD (  18.47  )
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

Hey Sean,

On Thu, Aug 21, 2025 at 02:00:31PM -0700, Sean Christopherson wrote:
> Add and use a kvm_page_fault structure to track state when handling a
> guest abort.  Collecting everything in a single structure will enable a
> variety of cleanups (reduce the number of params passed to helpers), and
> will pave the way toward using "struct kvm_page_fault" in arch-neutral KVM
> code, e.g. to consolidate logic for KVM_EXIT_MEMORY_FAULT.
> 
> No functional change intended.
> 
> Cc: James Houghton <jthoughton@google.com>
> Link: https://lore.kernel.org/all/20250618042424.330664-1-jthoughton@google.com
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/arm64/include/asm/kvm_host.h |  18 ++++
>  arch/arm64/kvm/mmu.c              | 143 ++++++++++++++----------------
>  2 files changed, 87 insertions(+), 74 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 2f2394cce24e..4623cbc1edf4 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -413,6 +413,24 @@ struct kvm_vcpu_fault_info {
>  	u64 disr_el1;		/* Deferred [SError] Status Register */
>  };
>  
> +struct kvm_page_fault {
> +	const u64 esr;
> +	const bool exec;
> +	const bool write;
> +	const bool is_perm;

Hmm... these might be better represented as predicates that take a
pointer to this struct and we just compute it based on ESR. That'd have
the benefit in the arch-neutral code where 'struct kvm_page_fault' is an
opaque type and we don't need to align field names/types.

> +	phys_addr_t fault_ipa; /* The address we faulted on */
> +	phys_addr_t ipa; /* Always the IPA in the L1 guest phys space */

NYC, but this also seems like a good opportunity to rename + retype
these guys. Specifically:

	fault_ipa => ipa
	ipa => canonical_ipa

would clarify these and align with the verbiage we currently use to talk
about nested.

Thanks,
Oliver

