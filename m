Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA500C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 20:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A+Dm5oYqWDH4EBRKuoUENfY0iH02fdrPbML4KrtAoQ0=; b=ZFhJvuTZFz3uBLHLAdtCFqBjn7
	23/FjEjkpjf3kVsx9JdAMOOIZTWCyJxhybihAkbKz4AIkjamcYFYemO/NoKbyOmbLWJ1WYa2yRuds
	gcSMSUiKbX2CFfQ973LZaBjUK8xA4pdSpYPwndfcjLKNZow/nmKydPVs8sm0DiOcDz0bPxqp3ydZw
	En/lxnCOBmB0VbAFRZZK7UeRKIGO5MMdp2RtcMUK7n932TdfCG0yxailloqUgSdUd9p24U8/wa1Fv
	uaox1ajAiujxfLRzKfZQFLYFToM19ewLnKgRcWMaLyqLGYj9r2fBSEeaCWXjxP1tanQq+G+q3LN9Y
	oNh9QhWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRz1U-0000000BIGi-3zK6;
	Wed, 18 Jun 2025 20:04:40 +0000
Received: from out-186.mta1.migadu.com ([2001:41d0:203:375::ba])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRyxG-0000000BHq1-0Cb0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 20:00:20 +0000
Date: Wed, 18 Jun 2025 13:00:06 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750276815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A+Dm5oYqWDH4EBRKuoUENfY0iH02fdrPbML4KrtAoQ0=;
	b=JiYBbEb2aglrXadwd8672PZMcInYhyXyrnzula6TGfNJSEFIyKtU038Tqyb8BobbBBu9qh
	B5ndenDDZwJjqoM1lUiF8Mw3SOuJf5QdA7kZDOgvvmF34OQGBa5ZKIUxhB0Vj7eMRJ+8Zf
	tXAdy9DLItnEhRcHHn0AGW2v8RxKayI=
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
Subject: Re: [PATCH v3 03/15] KVM: arm64: x86: Require "struct
 kvm_page_fault" for memory fault exits
Message-ID: <aFMaxi5LDr4HHbMR@linux.dev>
References: <20250618042424.330664-1-jthoughton@google.com>
 <20250618042424.330664-4-jthoughton@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618042424.330664-4-jthoughton@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_130019_096215_CC2739F4 
X-CRM114-Status: GOOD (  14.14  )
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

On Wed, Jun 18, 2025 at 04:24:12AM +0000, James Houghton wrote:
> +#ifdef CONFIG_KVM_GENERIC_PAGE_FAULT
> +
> +#define KVM_ASSERT_TYPE_IS(type_t, x)					\
> +do {									\
> +	type_t __maybe_unused tmp;					\
> +									\
> +	BUILD_BUG_ON(!__types_ok(tmp, x) || !__typecheck(tmp, x));	\
> +} while (0)
> +
>  static inline void kvm_prepare_memory_fault_exit(struct kvm_vcpu *vcpu,
> -						 gpa_t gpa, gpa_t size,
> -						 bool is_write, bool is_exec,
> -						 bool is_private)
> +						 struct kvm_page_fault *fault)
>  {
> +	KVM_ASSERT_TYPE_IS(gfn_t, fault->gfn);
> +	KVM_ASSERT_TYPE_IS(bool, fault->exec);
> +	KVM_ASSERT_TYPE_IS(bool, fault->write);
> +	KVM_ASSERT_TYPE_IS(bool, fault->is_private);
> +	KVM_ASSERT_TYPE_IS(struct kvm_memory_slot *, fault->slot);
> +
>  	vcpu->run->exit_reason = KVM_EXIT_MEMORY_FAULT;
> -	vcpu->run->memory_fault.gpa = gpa;
> -	vcpu->run->memory_fault.size = size;
> +	vcpu->run->memory_fault.gpa = fault->gfn << PAGE_SHIFT;
> +	vcpu->run->memory_fault.size = PAGE_SIZE;
>  
>  	/* RWX flags are not (yet) defined or communicated to userspace. */
>  	vcpu->run->memory_fault.flags = 0;
> -	if (is_private)
> +	if (fault->is_private)
>  		vcpu->run->memory_fault.flags |= KVM_MEMORY_EXIT_FLAG_PRIVATE;
>  }
> +#endif

This *is not* the right direction of travel for arm64. Stage-2 aborts /
EPT violations / etc. are extremely architecture-specific events.

What I would like to see on arm64 is that for every "KVM_EXIT_MEMORY_FAULT"
we provide as much syndrome information as possible. That could imply
some combination of a sanitised view of ESR_EL2 and, where it is
unambiguous, common fault flags that have shared definitions with x86.
This could incur some minor code duplication, but even then we can share
helpers for the software bits (like userfault).

FEAT_MTE_PERM is a very good example for this. There exists a "Tag"
permission at stage-2 which is unrelated to any of the 'normal'
read/write permissions. There's also the MostlyReadOnly permission from
FEAT_THE which grants write permission to a specific set of instructions.

I don't want to paper over these nuances and will happily maintain an
arm64-specific flavor of "kvm_prepare_memory_fault_exit()"/

Thanks,
Oliver

