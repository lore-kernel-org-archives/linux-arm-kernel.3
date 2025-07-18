Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3FAC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 15:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iEAp8dP6AjgyVn7db0JF0bqPEF/UG2/ADnUQkjMWjew=; b=bQn3u+1ziZ8cRZeqK2Uk288626
	hUgHG9/GR24cBb/TZzklPkYhNS8uXntzYFREvfvodGLhL6+I9Cr3GmUYd8qj6yQ5oiThg6ZpXQhMe
	ycQgtNZP+KacpegRgT7KIDi0Lknimo/76q8R0CsACOjoQRAZF7bSaytEWXCev+slpwNwDVhnIYVYu
	PSdbZXGMHKUvbFIz0TK8yETMjUXsLQLwuOD1dxxux5OP+Z11fpwIaXZPlNUGcIS9GVe1djylkNiFo
	A+b+o3YIojPO2jVcHZmCEPM6WUTGNwR8rN8a2D9nlAG68pp61RF7l51up1sOGpUrCCnFO/IEsZRn1
	6hCOG5vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucmaR-0000000CsjL-0QPb;
	Fri, 18 Jul 2025 15:01:23 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucmVj-0000000CrwM-1cJF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 14:56:32 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4563bc166a5so5115525e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 07:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752850590; x=1753455390; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iEAp8dP6AjgyVn7db0JF0bqPEF/UG2/ADnUQkjMWjew=;
        b=gzMqItI2A84bbvxm0zHtkLPjRDAxd1Z3tMOajGOOa9BTfME7gK51Hz35Y/x7+xEUNi
         ZxrrvteKits4PRx9Z42mYP9fWb9cJfiZtv76hvOUveU+kbv+nbGa9bna5KpPxedvfZ60
         0MlIhiGNcSG1jNtyfXVmYDxTYQ/4f1fbF+EBPOClFugc8TfUeLRkp3llKT7U9Fw1CpaD
         mQHsOLciAeJlhr0c/TdvQCbAFMs3uTvmPPlIL17b1dajjJSf5bEMpZqUST/gNQ2yNqlj
         F1loaOLZa8HPlt7JulQ2haV/pnsWjzziFSU1ck0vlA985f1xW3zFn1IMUR8B+tp1BePb
         FY2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752850590; x=1753455390;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iEAp8dP6AjgyVn7db0JF0bqPEF/UG2/ADnUQkjMWjew=;
        b=ZylHb2aWD3oyiZz2toR2KWhrN+ucAvQ6U4jHWuqzgiopzTxw7duN43XgtY5o+7NBkt
         q99XuQdwko/IkbOUZl88TRlLclMjPnJzUdxqEhKDK9CyHKbYKGOD5EO5uGmGe7kIMHET
         CpMKl77Ryv1J9UlCXUWZZIXFfAtxBjtva1qI+KlTNEHJcLjSuvyRrjWI/Us99lcNVGDs
         Oo/P3ezKzGgddZhDesXJ3S6BbEIVNBtXgB9rAp6NwnudmV/9lsiHjKNl6Rdu0XK78PPv
         o/4LuQQXNqDn7EsqOY/kdL5LzWgQEjBMAdpZh47FozF1EhwvjmE3Zdt96Gk+SZ3g62u3
         gQow==
X-Gm-Message-State: AOJu0YzfddXcjJ55MEL1FRKBR73S4aJ3IvXY0gSgXGngg0LC4FBacdew
	oAoctHwpZegXC67KsViJo/+0rb6SKdnJFZYPj/sFJmfi0xXA1rfLFaxRo/UbgvERTQ==
X-Gm-Gg: ASbGncuSJPLogpvtG5WLKNSrQHgkyp1kWRwJRMRO1oyxQX7uD1oDtEiSJNLjwyffXy4
	KKMLWFbZQjSYgTY1LLRudXGT209/CPVidmqMQ/qvDvF1QKBaMq7nE77MpHCyQJ4BFtr0iwK36pA
	CzaQeC18rM2UmmyaiBkKMeFWsqwUhvzQRKOz6dN0IMa/m7rTwbEsGIDRY1NadqQ6nnpaVL6rLmt
	m2diWLeGy6pRnKI3KXdvb/hqJq3Xvpq11LxUFB8Eea1jKt+0l6x+SxX1myuRr4vX9RQXdaEjfyl
	MO4T0aCYIoppm+oy6PxOHvk9tbyLEA4xbok9Re/0rla97Nk8f72qdD60VKataAFbd1kFb4UGZUi
	XOIrz6kRav1vMtiY4T1FqNbjpqjdMS65+uMv2BTcY0EaMwwhEJyZSCuGMiwmlKzYk8oXQJg==
X-Google-Smtp-Source: AGHT+IE6K9PCe1/f03eN10YVcPKdqSo5WW/5ySwf626QG9XmgSbJ3XvOtBetG5zBVNJiHNtKxkiH5A==
X-Received: by 2002:a05:600c:c0ce:b0:450:c9e3:91fe with SMTP id 5b1f17b1804b1-456346e2767mr59646595e9.0.1752850589578;
        Fri, 18 Jul 2025 07:56:29 -0700 (PDT)
Received: from google.com (120.142.205.35.bc.googleusercontent.com. [35.205.142.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4563b75ca42sm21610715e9.31.2025.07.18.07.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 07:56:28 -0700 (PDT)
Date: Fri, 18 Jul 2025 14:56:25 +0000
From: Keir Fraser <keirf@google.com>
To: Yao Yuan <yaoyuan@linux.alibaba.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, Sean Christopherson <seanjc@google.com>,
	Eric Auger <eric.auger@redhat.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 3/4] KVM: Implement barriers before accessing
 kvm->buses[] on SRCU read paths
Message-ID: <aHpgmTD0J9UpTzQb@google.com>
References: <20250716110737.2513665-1-keirf@google.com>
 <20250716110737.2513665-4-keirf@google.com>
 <ndwhwg4lmy22vnqy3yqnpdqj7o366crbrhgj5py5fm3g3l2ow3@5s24dzpkswa2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ndwhwg4lmy22vnqy3yqnpdqj7o366crbrhgj5py5fm3g3l2ow3@5s24dzpkswa2>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_075631_446593_345EB95E 
X-CRM114-Status: GOOD (  32.21  )
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

On Thu, Jul 17, 2025 at 02:01:32PM +0800, Yao Yuan wrote:
> On Wed, Jul 16, 2025 at 11:07:36AM +0800, Keir Fraser wrote:
> > This ensures that, if a VCPU has "observed" that an IO registration has
> > occurred, the instruction currently being trapped or emulated will also
> > observe the IO registration.
> >
> > At the same time, enforce that kvm_get_bus() is used only on the
> > update side, ensuring that a long-term reference cannot be obtained by
> > an SRCU reader.
> >
> > Signed-off-by: Keir Fraser <keirf@google.com>
> > ---
> >  arch/x86/kvm/vmx/vmx.c   |  7 +++++++
> >  include/linux/kvm_host.h | 10 +++++++---
> >  virt/kvm/kvm_main.c      | 33 +++++++++++++++++++++++++++------
> >  3 files changed, 41 insertions(+), 9 deletions(-)
> >
> > diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> > index 191a9ed0da22..425e3d8074ab 100644
> > --- a/arch/x86/kvm/vmx/vmx.c
> > +++ b/arch/x86/kvm/vmx/vmx.c
> > @@ -5861,6 +5861,13 @@ static int handle_invalid_guest_state(struct kvm_vcpu *vcpu)
> >  		if (kvm_test_request(KVM_REQ_EVENT, vcpu))
> >  			return 1;
> >
> > +		/*
> > +		 * Ensure that any updates to kvm->buses[] observed by the
> > +		 * previous instruction (emulated or otherwise) are also
> > +		 * visible to the instruction we are about to emulate.
> > +		 */
> > +		smp_rmb();
> > +
> >  		if (!kvm_emulate_instruction(vcpu, 0))
> >  			return 0;
> >
> > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > index 3bde4fb5c6aa..9132148fb467 100644
> > --- a/include/linux/kvm_host.h
> > +++ b/include/linux/kvm_host.h
> > @@ -965,11 +965,15 @@ static inline bool kvm_dirty_log_manual_protect_and_init_set(struct kvm *kvm)
> >  	return !!(kvm->manual_dirty_log_protect & KVM_DIRTY_LOG_INITIALLY_SET);
> >  }
> >
> > +/*
> > + * Get a bus reference under the update-side lock. No long-term SRCU reader
> > + * references are permitted, to avoid stale reads vs concurrent IO
> > + * registrations.
> > + */
> >  static inline struct kvm_io_bus *kvm_get_bus(struct kvm *kvm, enum kvm_bus idx)
> >  {
> > -	return srcu_dereference_check(kvm->buses[idx], &kvm->srcu,
> > -				      lockdep_is_held(&kvm->slots_lock) ||
> > -				      !refcount_read(&kvm->users_count));
> > +	return rcu_dereference_protected(kvm->buses[idx],
> > +					 lockdep_is_held(&kvm->slots_lock));
> 
> I want to consult the true reason for using protected version here,
> save unnecessary READ_ONCE() ?

We don't want this function to be callable from SRCU read section, but
*only* during teardown. Hence protected version provides a better,
stricter safety check (that there are no users).

 -- Keir

> >  }
> >
> >  static inline struct kvm_vcpu *kvm_get_vcpu(struct kvm *kvm, int i)
> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > index 222f0e894a0c..9ec3b96b9666 100644
> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> > @@ -1103,6 +1103,15 @@ void __weak kvm_arch_create_vm_debugfs(struct kvm *kvm)
> >  {
> >  }
> >
> > +/* Called only on cleanup and destruction paths when there are no users. */
> > +static inline struct kvm_io_bus *kvm_get_bus_for_destruction(struct kvm *kvm,
> > +							     enum kvm_bus idx)
> > +{
> > +	return rcu_dereference_protected(kvm->buses[idx],
> > +					 !refcount_read(&kvm->users_count));
> > +}
> > +
> > +
> >  static struct kvm *kvm_create_vm(unsigned long type, const char *fdname)
> >  {
> >  	struct kvm *kvm = kvm_arch_alloc_vm();
> > @@ -1228,7 +1237,7 @@ static struct kvm *kvm_create_vm(unsigned long type, const char *fdname)
> >  out_err_no_arch_destroy_vm:
> >  	WARN_ON_ONCE(!refcount_dec_and_test(&kvm->users_count));
> >  	for (i = 0; i < KVM_NR_BUSES; i++)
> > -		kfree(kvm_get_bus(kvm, i));
> > +		kfree(kvm_get_bus_for_destruction(kvm, i));
> >  	kvm_free_irq_routing(kvm);
> >  out_err_no_irq_routing:
> >  	cleanup_srcu_struct(&kvm->irq_srcu);
> > @@ -1276,7 +1285,7 @@ static void kvm_destroy_vm(struct kvm *kvm)
> >
> >  	kvm_free_irq_routing(kvm);
> >  	for (i = 0; i < KVM_NR_BUSES; i++) {
> > -		struct kvm_io_bus *bus = kvm_get_bus(kvm, i);
> > +		struct kvm_io_bus *bus = kvm_get_bus_for_destruction(kvm, i);
> >
> >  		if (bus)
> >  			kvm_io_bus_destroy(bus);
> > @@ -5838,6 +5847,18 @@ static int __kvm_io_bus_write(struct kvm_vcpu *vcpu, struct kvm_io_bus *bus,
> >  	return -EOPNOTSUPP;
> >  }
> >
> > +static struct kvm_io_bus *kvm_get_bus_srcu(struct kvm *kvm, enum kvm_bus idx)
> > +{
> > +	/*
> > +	 * Ensure that any updates to kvm_buses[] observed by the previous VCPU
> > +	 * machine instruction are also visible to the VCPU machine instruction
> > +	 * that triggered this call.
> > +	 */
> > +	smp_mb__after_srcu_read_lock();
> > +
> > +	return srcu_dereference(kvm->buses[idx], &kvm->srcu);
> > +}
> > +
> >  int kvm_io_bus_write(struct kvm_vcpu *vcpu, enum kvm_bus bus_idx, gpa_t addr,
> >  		     int len, const void *val)
> >  {
> > @@ -5850,7 +5871,7 @@ int kvm_io_bus_write(struct kvm_vcpu *vcpu, enum kvm_bus bus_idx, gpa_t addr,
> >  		.len = len,
> >  	};
> >
> > -	bus = srcu_dereference(vcpu->kvm->buses[bus_idx], &vcpu->kvm->srcu);
> > +	bus = kvm_get_bus_srcu(vcpu->kvm, bus_idx);
> >  	if (!bus)
> >  		return -ENOMEM;
> >  	r = __kvm_io_bus_write(vcpu, bus, &range, val);
> > @@ -5869,7 +5890,7 @@ int kvm_io_bus_write_cookie(struct kvm_vcpu *vcpu, enum kvm_bus bus_idx,
> >  		.len = len,
> >  	};
> >
> > -	bus = srcu_dereference(vcpu->kvm->buses[bus_idx], &vcpu->kvm->srcu);
> > +	bus = kvm_get_bus_srcu(vcpu->kvm, bus_idx);
> >  	if (!bus)
> >  		return -ENOMEM;
> >
> > @@ -5919,7 +5940,7 @@ int kvm_io_bus_read(struct kvm_vcpu *vcpu, enum kvm_bus bus_idx, gpa_t addr,
> >  		.len = len,
> >  	};
> >
> > -	bus = srcu_dereference(vcpu->kvm->buses[bus_idx], &vcpu->kvm->srcu);
> > +	bus = kvm_get_bus_srcu(vcpu->kvm, bus_idx);
> >  	if (!bus)
> >  		return -ENOMEM;
> >  	r = __kvm_io_bus_read(vcpu, bus, &range, val);
> > @@ -6028,7 +6049,7 @@ struct kvm_io_device *kvm_io_bus_get_dev(struct kvm *kvm, enum kvm_bus bus_idx,
> >
> >  	srcu_idx = srcu_read_lock(&kvm->srcu);
> >
> > -	bus = srcu_dereference(kvm->buses[bus_idx], &kvm->srcu);
> > +	bus = kvm_get_bus_srcu(kvm, bus_idx);
> >  	if (!bus)
> >  		goto out_unlock;
> >
> > --
> > 2.50.0.727.gbf7dc18ff4-goog
> >

