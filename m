Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D56A5C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 10:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HAisO6OEJOG++OlGeDq7L3T84lbig4NarZZMlO0RsUg=; b=d/jW0yFl2aGbBiv0B4bn8COgT8
	x25lVZX3PVjPsKAkClFLxG5CXRYfEDOG8QBaeYlXRVWZN+rePtOzoFlVk3/rsaQVP2rxWgHICHlFG
	8TPeqa9JSSLj2PRG1wKMpo7y51Em6rDNxlhBgrvsXUG0NokjdIlgNe9xIUIgwQkc+lvy6Qw0Um51R
	ZJZb/N5hmhPooZ3bNBQ38p6YlsvMZxhSTKj6Anyck8RLHLtz3Q7+gfuzD7D2uJ6rVl4E3fKfdgNHp
	F7B2naM7QfFXEgfv9WDDOnfevuHdxYdTACkdlNMVK9KL91FhHBFclUPnyjxLuURUxVOIKsysA3SSk
	gJcga0iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3syf-00000008l8t-1Emn;
	Tue, 08 Sep 2026 10:22:57 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3syd-00000008l7v-1SyB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 10:22:56 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-48584dc164fso4165688f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 03:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788862973; x=1789467773; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HAisO6OEJOG++OlGeDq7L3T84lbig4NarZZMlO0RsUg=;
        b=Acy9XMnvGuwESFcTyFzwanS5uSGb46lpyTaKThv8mAqR8cVV1zi47j9U6qOT/WMrqV
         ieeiXJAu5Ve/38FYMFPLD1iDiKH36VqMXiwcavxKPdEV+PJyHMRhUiAtACeem8JDfIX0
         RpnhM94PjCYAc/s6hEpYmKZ77SjO3UtMH5Sh/IAMYtjzggaqPeN/vnlvp70qkQp4yWAw
         C1gpUnLsbsfC6rzlWleBAcs6gBfzyZWcpz8L060b7Sya5YQ+QGIj5Bfo8vDNk4RsNVDW
         QwvqGTrZC4E+HuSi5mG+r6YysBVt5+fXyGGw7bYW7h9hOYYU26cGtzb+1UY1jxDIH8dx
         lE9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788862973; x=1789467773;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HAisO6OEJOG++OlGeDq7L3T84lbig4NarZZMlO0RsUg=;
        b=OA7PpFi03zcd1+OKPTbn4KCJ5evN8muzKI9snDXdVok2g981tq2EFwEJCS0xQMKeC8
         KaC2UMdwxLm4rBjpHUJd2604sBhNikFNqSmtJkJyd99jolV8Zj/qjyG9WXSalkYWndhm
         VswC3umB0s+e+V18v+5bL3MLQChE/v9yvJu/qmFclsSq15EenB+PIZGMnpCKmr2DoASc
         B6K0u9KULOQZ9ELm60ek4ufycFqCz3BTZhRHgFrWR6nDkJzZ88RIQ6n9ltM7eki9UtdU
         LlTWMxUEJxYe2zTZgAqS0RZR1l1MwUrKAoC3UzQhQ/EKoEKOMjutdN72tHf1K2Po9+UB
         htMA==
X-Forwarded-Encrypted: i=1; AKwUvBy5uMPKeMHr9Tlyq+UXT5Y6eWVPXr84ihJcaBoudg5CUrzy/zbuXhmLsYZC5aJ+hynHTmqeU7uSrV4P1/yzypIM@lists.infradead.org
X-Gm-Message-State: AFuF++kwqUm7lM9au//DHwSwvgVfsf/GjCGTRz/S2V60hlOHGJKWnTh6
	o9oJbW1eW6gaRPAGmvPOQshUEoYtZ4k5mVet8H459lZDLdNuY+mUccbFgGUCE6jofORZOvZUmva
	KIvDNW5io
X-Gm-Gg: AYBFou3bstzVpCYRiQT2+fcpKcgEWt2CTVm8uDsBqQte4hhFWVAnru98Eom3fnmZbFz
	Unr9782KxEV559u8vwd3/VbXWgwGLp5jHURhd81CyX3/U5FstGIOK3F2MdpT7mXnjPVHLgvym51
	QKA9B70MG+wj0k8YhbgbMp69d5iApWr2mEUVlfuUr5wmKHh6/j6MEurUzkzk+QsWVmOBQfMX82L
	D5WyNXH94tBeiJiNc41yH7gRLRHNKLt7Hh3wkcr0r/I10HwITumKnXdl3yMB5UvveVvbYmPCcjm
	2fDJq0vFGKEe0eBI6yr0FCg62ejjtuHvUeVE7JiVn1Z2IHqCARwute65uPTGifjtXbAzUG0o61K
	1vPsgFLjZbgN4eSFcXBkUeaZOjyYmmWcrtZvwIEPa4NKtKtsrU8y/2QeSlc6gan9RGaS7aHcuwy
	P51kjZ62IhI6NuWNwtFfJ044cC0+MGQm8K5JH+Ox5iemji0rVd3u1qKEM1w6nDjd9R7JTQIP164
	iY+JQOJuU2B36/HOgJ/FMlHU5ybrDXf
X-Received: by 2002:a05:6000:260f:b0:485:8be8:b2ba with SMTP id ffacd0b85a97d-4858be8b4bcmr28419306f8f.49.1788862972857;
        Tue, 08 Sep 2026 03:22:52 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bf3f0sm38852156f8f.33.2026.09.08.03.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 03:22:52 -0700 (PDT)
Date: Tue, 8 Sep 2026 11:22:49 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com,
	fuad.tabba@linux.dev, qperret@google.com, keirf@google.com
Subject: Re: [PATCH 08/20] KVM: arm64: Add a range to
 __pkvm_host_reclaim_page_guest()
Message-ID: <ap_h-WrHqbxiiAH7@google.com>
References: <20260803100904.3563942-1-vdonnefort@google.com>
 <20260803100904.3563942-9-vdonnefort@google.com>
 <ggblnclfadr4oy7i3d43okgedqqx3ak5edhxfrjhceh4763xyw@iyxtswi72edn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ggblnclfadr4oy7i3d43okgedqqx3ak5edhxfrjhceh4763xyw@iyxtswi72edn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_032255_421343_14C9946E 
X-CRM114-Status: GOOD (  24.49  )
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

On Mon, Sep 07, 2026 at 03:52:34PM +0100, Wei-Lin Chang wrote:
> On Mon, Aug 03, 2026 at 11:08:52AM +0100, Vincent Donnefort wrote:
> 
> [...]
> 
> > +int __pkvm_host_reclaim_page_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vm *vm);
> >  int __pkvm_host_share_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu *vcpu,
> >  			    enum kvm_pgtable_prot prot);
> >  int __pkvm_host_unshare_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vm *hyp_vm);
> > diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> > index f04cea5ff389..0d17e59d5335 100644
> > --- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> > +++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> > @@ -74,7 +74,7 @@ int __pkvm_init_vm(struct kvm *host_kvm, unsigned long vm_hva,
> >  int __pkvm_init_vcpu(pkvm_handle_t handle, struct kvm_vcpu *host_vcpu,
> >  		     unsigned long vcpu_hva);
> >  
> > -int __pkvm_reclaim_dying_guest_page(pkvm_handle_t handle, u64 gfn);
> > +int __pkvm_reclaim_dying_guest_page(pkvm_handle_t handle, u64 gfn, u64 nr_pages);
> 
> I feel like __pkvm_host_reclaim_"page"_guest(),
> __pkvm_reclaim_dying_guest_"page"() aren't good names since they deal
> with multiple pages now.

We could argue that it is "huge" page, but then none of the other mem_protect
functions are using _page_ in their name.

> 
> [...]
> 
> >  
> > -static int get_valid_guest_pte(struct pkvm_hyp_vm *vm, u64 ipa, kvm_pte_t *ptep, u64 *physp)
> > +static int __get_valid_guest_pte(struct pkvm_hyp_vm *vm, u64 ipa,
> > +				 kvm_pte_t *ptep, u64 *physp, s8 *levelp)
> >  {
> >  	kvm_pte_t pte;
> >  	u64 phys;
> > @@ -905,20 +906,32 @@ static int get_valid_guest_pte(struct pkvm_hyp_vm *vm, u64 ipa, kvm_pte_t *ptep,
> >  		return -EHWPOISON;
> >  	if (!kvm_pte_valid(pte))
> >  		return -ENOENT;
> > -	if (level != KVM_PGTABLE_LAST_LEVEL)
> > -		return -E2BIG;
> >  
> >  	phys = kvm_pte_to_phys(pte);
> > -	ret = check_range_allowed_memory(phys, phys + PAGE_SIZE);
> > +	ret = check_range_allowed_memory(phys, phys + kvm_granule_size(level));
> >  	if (WARN_ON(ret))
> >  		return ret;
> >  
> >  	*ptep = pte;
> >  	*physp = phys;
> > +	*levelp = level;
> >  
> >  	return 0;
> >  }
> >  
> > +static int get_valid_guest_pte(struct pkvm_hyp_vm *vm, u64 ipa, u64 size,
> > +			       kvm_pte_t *ptep, u64 *physp)
> > +{
> > +	s8 level;
> > +	int ret;
> > +
> > +	ret = __get_valid_guest_pte(vm, ipa, ptep, physp, &level);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return kvm_granule_size(level) == size ? 0 : -E2BIG;
> > +}
> > +
> >  int __pkvm_vcpu_in_poison_fault(struct pkvm_hyp_vcpu *hyp_vcpu)
> >  {
> >  	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(hyp_vcpu);
> > @@ -1001,7 +1014,7 @@ int __pkvm_guest_share_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn)
> >  	host_lock_component();
> >  	guest_lock_component(vm);
> >  
> > -	ret = get_valid_guest_pte(vm, ipa, &pte, &phys);
> > +	ret = get_valid_guest_pte(vm, ipa, PAGE_SIZE, &pte, &phys);
> >  	if (ret)
> >  		goto unlock;
> >  
> > @@ -1033,7 +1046,7 @@ int __pkvm_guest_unshare_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn)
> >  	host_lock_component();
> >  	guest_lock_component(vm);
> >  
> > -	ret = get_valid_guest_pte(vm, ipa, &pte, &phys);
> > +	ret = get_valid_guest_pte(vm, ipa, PAGE_SIZE, &pte, &phys);
> >  	if (ret)
> >  		goto unlock;
> >  
> > @@ -1285,6 +1298,14 @@ static void hyp_poison_page(phys_addr_t phys)
> >  	hyp_fixmap_unmap();
> >  }
> >  
> > +static void hyp_poison_range(phys_addr_t phys, u64 size)
> > +{
> > +	u64 offset;
> > +
> > +	for (offset = 0; offset < size; offset += PAGE_SIZE)
> > +		hyp_poison_page(phys + offset);
> > +}
> > +
> 
> I believe get_valid_guest_pte and hyp_poison_range changes/addition can
> be made into its own patch, focusing on small helpers?
> If so I believe it can make reviewing easier.
> 
> Thanks,
> Wei-Lin Chang
> 
> [...]

I am not a big fan of the "No functional change intended" changes, but it is
true that this commit is quite big. So if you believe this makes it easier to
review, then let's split it.

-- 
Vincent

