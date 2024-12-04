Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D2CE7716F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 23:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BmRuvCEl+afeDDoFH+S4Ae7biN9cmirFzO8povIhSlU=; b=v33yGiKhpcyNBps5jNrZLnn+32
	yU6yKH55CkHRmKWVEAYi1L591D8JYXc70uNskByH47a19CRhuW2/A6mqANkRSLbeDmduee1/TwKjE
	0VMy3i6jNbdMJhcw9pinI2Zln7rxDylFI6kxcvbFL2A1i5V1B1YyMMMRP61vvKLjXAzgRcJGnpVbB
	jgqgsSwMRITw3SUS3rpxKvWyanPzKSJUaRay5LuNFJKTxWHujBZ9rGCsf0XIcj1qGOTQ0o485m6ZX
	wJ6je7YRMVnwWuNg2UZXl3r3ZbdrsI08lDTJ9iyXFehyfc5WvvzsOXmw4JsnKPO4pukU7wqZj5vol
	uQnrFWjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIyUA-0000000E6Up-3o1L;
	Wed, 04 Dec 2024 23:08:46 +0000
Received: from out-173.mta1.migadu.com ([95.215.58.173])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIyT7-0000000E6Kk-26U3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 23:07:42 +0000
Date: Wed, 4 Dec 2024 15:07:27 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1733353658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BmRuvCEl+afeDDoFH+S4Ae7biN9cmirFzO8povIhSlU=;
	b=xk1r79Rje9lKH6Gxehv7Myok+SqBGaILt9N1vHxuCICfEcxyKTF+uj/5FJp++2mvkSZ0Oe
	dmE/wZBmxgrtmkSEAoa/27/kNUUZHboEzkpcwY+yvUQvkXDeySUVhY/vfWptdCso/3Zca7
	r2bcl0ynh2WdL4KV0CjZUT2HyksinF4=
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
	David Matlack <dmatlack@google.com>, Wang@google.com,
	Wei W <wei.w.wang@intel.com>, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH v1 06/13] KVM: arm64: Add support for KVM_MEM_USERFAULT
Message-ID: <Z1Dgr_TnaFQT04Pi@linux.dev>
References: <20241204191349.1730936-1-jthoughton@google.com>
 <20241204191349.1730936-7-jthoughton@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204191349.1730936-7-jthoughton@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_150741_825434_75AB4672 
X-CRM114-Status: GOOD (  20.31  )
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

Hi James,

On Wed, Dec 04, 2024 at 07:13:41PM +0000, James Houghton wrote:
> Adhering to the requirements of KVM Userfault:
> 
> 1. When it is toggled (either on or off), zap the second stage with
>    kvm_arch_flush_shadow_memslot(). This is to (1) respect
>    userfault-ness and (2) to reconstruct block mappings.
> 2. While KVM_MEM_USERFAULT is enabled, restrict new second-stage mappings
>    to be PAGE_SIZE, just like when dirty logging is enabled.
> 
> Signed-off-by: James Houghton <jthoughton@google.com>
> ---
>   I'm not 100% sure if kvm_arch_flush_shadow_memslot() is correct in
>   this case (like if the host does not have S2FWB).

Invalidating the stage-2 entries is of course necessary for correctness
on the !USERFAULT -> USERFAULT transition, and the MMU will do the right
thing regardless of whether hardware implements FEAT_S2FWB.

What I think you may be getting at is the *performance* implications are
quite worrying without FEAT_S2FWB due to the storm of CMOs, and I'd
definitely agree with that.

> @@ -2062,6 +2069,20 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
>  				   enum kvm_mr_change change)
>  {
>  	bool log_dirty_pages = new && new->flags & KVM_MEM_LOG_DIRTY_PAGES;
> +	u32 changed_flags = (new ? new->flags : 0) ^ (old ? old->flags : 0);
> +
> +	/*
> +	 * If KVM_MEM_USERFAULT changed, drop all the stage-2 mappings so that
> +	 * we can (1) respect userfault-ness or (2) create block mappings.
> +	 */
> +	if ((changed_flags & KVM_MEM_USERFAULT) && change == KVM_MR_FLAGS_ONLY)
> +		kvm_arch_flush_shadow_memslot(kvm, old);

I'd strongly prefer that we make (2) a userspace problem and don't
eagerly invalidate stage-2 mappings on the USERFAULT -> !USERFAULT
change.

Having implied user-visible behaviors on ioctls is never good, and for
systems without FEAT_S2FWB you might be better off avoiding the unmap in
the first place.

So, if userspace decides there's a benefit to invalidating the stage-2
MMU, it can just delete + recreate the memslot.

-- 
Thanks,
Oliver

