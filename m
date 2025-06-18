Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B8B7C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 22:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iabUtXH2S5hgnNxipXhGWLLQltCqncktdrGikSQJGv8=; b=eATOYkpCewZsvrhJeDwbI4PrjQ
	KJfrdRtXFrTa9arokcIRxXWLujSW8lw5C2M1kBhzoXsPQsjHWqBBUquxuzhpjYyA8B5DHH4rlKY3R
	f2DN7NzgSd4HnKzN3jLS2BkhKzeGx4CTK237cycexHqRfft9LcjMiyWos9oNKBe4I6JyeClJMCo6k
	mayYb9+1f4SkAYbPC9MHxVgrec3tWGFbPOTkVgtmLkpTV1byoUaH6jeZpPNYOBprfZ5WazNI27D8d
	UKtx0PX2HUE3pmbReYRU/xZIJnzuPBrs5zt3Mj0XBysn33uyuoytGanSA1bSUU+VcKh+2Pinj9ek5
	V8sVrG0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS1XU-0000000BX0h-1Y1j;
	Wed, 18 Jun 2025 22:45:52 +0000
Received: from out-183.mta0.migadu.com ([91.218.175.183])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS1VG-0000000BWU2-0NLS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 22:43:35 +0000
Date: Wed, 18 Jun 2025 15:43:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750286611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iabUtXH2S5hgnNxipXhGWLLQltCqncktdrGikSQJGv8=;
	b=EpbLDF+7NjqZog0McGJwo+5HvohOHNAQ8BaL7lZ03J7iJoDBrg8lFG2S6I9VFIMY3Gd8yJ
	kTLle8vGIij2bB5f/LXeRE9tYV0K5nhLvNCmRGtvD2HcKQJ6cqzHDwB2+zkiC1Sgge9yZn
	6Pp85WKy351lqpG6lvz+IzpntWkiNOc=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Sean Christopherson <seanjc@google.com>
Cc: James Houghton <jthoughton@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Yan Zhao <yan.y.zhao@intel.com>,
	Nikita Kalyazin <kalyazin@amazon.com>,
	Anish Moorthy <amoorthy@google.com>,
	Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>,
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com,
	kvm@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v3 04/15] KVM: Add common infrastructure for KVM
 Userfaults
Message-ID: <aFNBCaLEdABfybmd@linux.dev>
References: <20250618042424.330664-1-jthoughton@google.com>
 <20250618042424.330664-5-jthoughton@google.com>
 <aFMWQ5_zMXGTCE98@linux.dev>
 <aFMh51vXbTNCf9mv@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFMh51vXbTNCf9mv@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_154334_286530_1386E0FD 
X-CRM114-Status: GOOD (  19.70  )
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

On Wed, Jun 18, 2025 at 01:33:17PM -0700, Sean Christopherson wrote:
> On Wed, Jun 18, 2025, Oliver Upton wrote:
> > > Signed-off-by: Sean Christopherson <seanjc@google.com>
> 
> No need for my SoB.
> 
> > > +#ifdef CONFIG_KVM_GENERIC_PAGE_FAULT
> > > +bool kvm_do_userfault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
> > 
> > The polarity of the return here feels weird. If we want a value of 0 to
> > indicate success then int is a better return type.
> 
> The boolean is my fault/suggestion.  My thinking is that it would make the callers
> more intuitive, e.g. so that this reads "if do userfault, then exit to userspace
> with -EFAULT".
> 
> 	if (kvm_do_userfault(vcpu, fault))
> 		return -EFAULT;

Agreed, this reads correctly. My only issue is that when I read the
function signature, "bool" is usually wired the other way around.

> > > +{
> > > +	struct kvm_memory_slot *slot = fault->slot;
> > > +	unsigned long __user *user_chunk;
> > > +	unsigned long chunk;
> > > +	gfn_t offset;
> > > +
> > > +	if (!kvm_is_userfault_memslot(slot))
> > > +		return false;
> > > +
> > > +	offset = fault->gfn - slot->base_gfn;
> > > +	user_chunk = slot->userfault_bitmap + (offset / BITS_PER_LONG);
> > > +
> > > +	if (__get_user(chunk, user_chunk))
> > > +		return true;
> 
> And this path is other motiviation for returning a boolean.  To me, return "success"
> when a uaccess fails looks all kinds of wrong:
> 
> 	if (__get_user(chunk, user_chunk))
> 		return 0;

Yeah, that's gross. Although I would imagine we want to express
"failure" here, game over, out to userspace for resolution. So maybe:

	if (__get_user(chunk, user_chunk))
		return -EFAULT;

> That said, I don't have a super strong preference; normally I'm fanatical about
> not returning booleans.  :-D

+1, it isn't _that_ big of a deal, just noticed it as part of review.

Thanks,
Oliver

