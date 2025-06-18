Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5AD1C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 19:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kJ28BX1PGmEsOK66iRJR9ufuVy9us1fhYiSSQpunOdI=; b=AUA7PZ7heBNj62Y5CrREm51+VY
	POHX2FtVSI0H6RGuqS56qhfhGRYAlOvCEpLasISq8NZZFM67qTum+7BnyR9HPHlNRUEDw99uUpDPN
	WSEDrr3kpzHgDKJl5JvDgmMBg1FYOopdSNmYkLNzcwzl9sDvPVj4TTl1+9SyEA2UTue96ZKiGBKe+
	JW8gVl1MXd4rYtrbqwLns9qclUUu+gXc7/DYEM7y9ma8exyjustbJjERr0DSbtdvoYp5r72GaaF7w
	FA+289QI1T/04uswQQdMsCLjVFkTWl+UkvJ9icvP0OZiYGt39FWY2lSl5KyM5zntvJPY5XEgl+/85
	LjIE9F5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRyjr-0000000BFv2-0WNX;
	Wed, 18 Jun 2025 19:46:27 +0000
Received: from out-189.mta0.migadu.com ([2001:41d0:1004:224b::bd])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRyeb-0000000BEUK-2rTB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 19:41:03 +0000
Date: Wed, 18 Jun 2025 12:40:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750275658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kJ28BX1PGmEsOK66iRJR9ufuVy9us1fhYiSSQpunOdI=;
	b=rkr7lOkw8dMr4j4t/vQfAQjKcKL1YrnIOUw/TNGMed4UVCLGOe2tByQPKXjqmKmSRGBCKX
	Uo3l7kVm8ztcoaZdGh2Zr542A6B8QeL3//5VJoC6eb4GDCMyaXyop7Bo5wD9xH8emEMYnu
	P2MDpIUYfbIHfUp9bpGvn+TU2rq9YbE=
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
Subject: Re: [PATCH v3 04/15] KVM: Add common infrastructure for KVM
 Userfaults
Message-ID: <aFMWQ5_zMXGTCE98@linux.dev>
References: <20250618042424.330664-1-jthoughton@google.com>
 <20250618042424.330664-5-jthoughton@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618042424.330664-5-jthoughton@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_124101_940581_EE083B2B 
X-CRM114-Status: GOOD (  20.74  )
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

On Wed, Jun 18, 2025 at 04:24:13AM +0000, James Houghton wrote:
> KVM Userfault consists of a bitmap in userspace that describes which
> pages the user wants exits on (when KVM_MEM_USERFAULT is enabled). To
> get those exits, the memslot where KVM_MEM_USERFAULT is being enabled
> must drop (at least) all of the translations that the bitmap says should
> generate faults. Today, simply drop all translations for the memslot. Do
> so with a new arch interface, kvm_arch_userfault_enabled(), which can be
> specialized in the future by any architecture for which optimizations
> make sense.
> 
> Make some changes to kvm_set_memory_region() to support setting
> KVM_MEM_USERFAULT on KVM_MEM_GUEST_MEMFD memslots, including relaxing
> the retrictions on guest_memfd memslots from only deletion to no moving.
> 
> Signed-off-by: James Houghton <jthoughton@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---

> +#ifdef CONFIG_KVM_GENERIC_PAGE_FAULT
> +bool kvm_do_userfault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)

The polarity of the return here feels weird. If we want a value of 0 to
indicate success then int is a better return type.

> +{
> +	struct kvm_memory_slot *slot = fault->slot;
> +	unsigned long __user *user_chunk;
> +	unsigned long chunk;
> +	gfn_t offset;
> +
> +	if (!kvm_is_userfault_memslot(slot))
> +		return false;
> +
> +	offset = fault->gfn - slot->base_gfn;
> +	user_chunk = slot->userfault_bitmap + (offset / BITS_PER_LONG);
> +
> +	if (__get_user(chunk, user_chunk))
> +		return true;
> +

I see that the documentation suggests userspace perform a store-release
to update the bitmap. That's the right idea but we need a load-acquire
on the consumer side for that to do something meaningful.

> +	if (!test_bit(offset % BITS_PER_LONG, &chunk))
> +		return false;
> +
> +	kvm_prepare_memory_fault_exit(vcpu, fault);
> +	vcpu->run->memory_fault.flags |= KVM_MEMORY_EXIT_FLAG_USERFAULT;
> +	return true;
> +}
> +#endif
> +
>  int __attribute__((weak)) kvm_vm_ioctl_enable_cap(struct kvm *kvm,
>  						  struct kvm_enable_cap *cap)
>  {
> -- 
> 2.50.0.rc2.692.g299adb8693-goog
>

Thanks,
Oliver

