Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A5BFC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 16:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YjzowwCzDt7F+kKBoh3+rUz7yp+YdCsAa/lYm8cjXDA=; b=rrwrYKy0dD5baBWETzt/zs6ur4
	MhjtZf/ky5qUyeZdOLgiaE/cbrmdYYChASiCHkOj9JfYZTEKC2YFJPoRJyJawXw1SjXXZxxR3o4yj
	Kw9BUAYQxtX7uTliKdpyhBXgtJ7JKTgeeCZcawQ6IAm26PI9F7OI40yY+qNYcNUbyzCUYlR1z0ds2
	HGZF3BZdMUgpGYyEm8bqlZXHseUE+RyjA2/2lbiCUla7PAzl/0n+jBB6F9N+QxlQzQL+1Fb0GrZaS
	BIvy4ryxwHMCxUi+Dp88yi8UiUiE7G7QzZXWroNwne4jYi79QYEcCosnawPIpcMGBfO/WnD3G+U1S
	NNXIDkHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0kGA-0000000CKhD-11tq;
	Fri, 04 Apr 2025 16:51:14 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0kCh-0000000CKFP-3Ze6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 16:47:41 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-391342fc0b5so1784567f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Apr 2025 09:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743785257; x=1744390057; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YjzowwCzDt7F+kKBoh3+rUz7yp+YdCsAa/lYm8cjXDA=;
        b=nsDZcPSuiLNq3a07RfnsToeQDDhx+YI2rqr/5tKNWnnG3u6voUYfZeeMm93HqU1uTl
         /dQgEDh5vc024mG+1yqrR1tojvmrbpvwoSXTI+CK9RUJzRdS5ynvdJjfnCmO3jmeATze
         nebDcMYzw0E5GzQ4kOi3YMcgmd8GOwwJyaCUfTBcJUvAHn8MRFyBa2hwZNhnY3i7ZByc
         4jv2l6RjzhaN0oYQgEPp9lW05/L1E+lU9usTLT+jeLp6VyFptTA3jdb2DhIqysuUS6st
         C/PgHrfu/24VOlNi6FVnv+LpT+m4MRts3pkIj6wqg4wNUlm9oti/2wWH7SypGcJZSc4d
         GxlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743785257; x=1744390057;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YjzowwCzDt7F+kKBoh3+rUz7yp+YdCsAa/lYm8cjXDA=;
        b=pXyio5G1BN/TWeQ+cEeWRHRlCnauDr27qKD9ONB6KcncKUMbNib2CM/JH11lhlvjy9
         9XPQboKKZdl0lQVYhDY6zfQBIBXB/XuB0AVM3SHBFIQJb99bDGixVB750oT7S7KTfmEE
         XE1U8paoR4gCb+BO73FpI5+tXAa7UVZ0dPfFY9r0ILEh19zetIOSYfDGTLHioyysK7We
         HyljvZyW8v6RC4sgjUZFJaQZ9gZ9SVNcsYF1M39jSOqfp/qrX+lLXIIOVMOAWrJNopjP
         qnAMmWa9qH9bSFswpnZ4JsxK0xxeUU/UH/hIAXPekmQ/NV+cick/XmCfCl0nH7pbOSrC
         eysg==
X-Forwarded-Encrypted: i=1; AJvYcCXswhoXRufhMpfD6i1q8p4avP5K6u45PtbJp7DGuzn3/KJPGxE8oQRdkYdtJuTm5NCLpiCxjdAA0GMtz4xbaIVL@lists.infradead.org
X-Gm-Message-State: AOJu0Yxklo80dM7kZG7HtiaFEeFcoQ4KYNDY7t9Icd0fOzZERiYb6Paj
	FCwkO0soemDblRpKR3TVkwTfEuxHHmnPnUEX7b2On8FX0V8vbftj1VmjpawdvA==
X-Gm-Gg: ASbGnctadIwACHCpXLwCAvS46ma7mzVg3ctRx6J+X/UKxWhtiXrNX+hu7Ge4VBBV+Sc
	1C/RPk10O4xw9UIXzVoZl3r2iRh+9UHhuElos5iUluTmFdSNcFkJnsBU36oRJuH8dqe5s68llEv
	jSbzKFhn11V8vpxzRyRddzL1GiycPERUGF0I2NH/Q63mcyEY7VFS8XQPmNieQ9Fs17cDs00m/te
	orD7gUeW6mHDD+mCyzVmyF6hUBUBXyWCX0J+wuBZZli9P6PhGIh1vdJyeVvKALBWKR+vVpyc3Ua
	O5vZx73HWFWj1MDKrzmPmgL2nZgPGwEGKKMX2u7xnRQHIb1f9gALj1n22oGBd4VswKcWtDdlmMG
	PMHyi2GA=
X-Google-Smtp-Source: AGHT+IFzHQAEkpFtCO+t1gRCJIagbYhnnjuyRaUGQM6bW98s2AD1DwEmZUlzJZcYV+93fHKKsfUsjA==
X-Received: by 2002:a5d:584a:0:b0:399:6dc0:f134 with SMTP id ffacd0b85a97d-39cba98b9c4mr4046259f8f.51.1743785257188;
        Fri, 04 Apr 2025 09:47:37 -0700 (PDT)
Received: from google.com (35.157.34.34.bc.googleusercontent.com. [34.34.157.35])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d975sm4848736f8f.75.2025.04.04.09.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 09:47:36 -0700 (PDT)
Date: Fri, 4 Apr 2025 17:47:33 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Quentin Perret <qperret@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v2 2/9] KVM: arm64: Add a range to
 __pkvm_host_share_guest()
Message-ID: <Z_ANJQXw7maV8TlT@google.com>
References: <20250306110038.3733649-1-vdonnefort@google.com>
 <20250306110038.3733649-3-vdonnefort@google.com>
 <Z-6o0zcLa4Aw0N6R@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-6o0zcLa4Aw0N6R@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_094739_890647_2CE9409C 
X-CRM114-Status: GOOD (  25.94  )
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

On Thu, Apr 03, 2025 at 03:27:15PM +0000, Quentin Perret wrote:
> On Thursday 06 Mar 2025 at 11:00:31 (+0000), Vincent Donnefort wrote:
> > +int __pkvm_host_share_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu *vcpu,
> >  			    enum kvm_pgtable_prot prot)
> >  {
> >  	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
> >  	u64 phys = hyp_pfn_to_phys(pfn);
> >  	u64 ipa = hyp_pfn_to_phys(gfn);
> > +	enum pkvm_page_state state;
> >  	struct hyp_page *page;
> > +	u64 size;
> >  	int ret;
> >  
> >  	if (prot & ~KVM_PGTABLE_PROT_RWX)
> >  		return -EINVAL;
> >  
> > -	ret = check_range_allowed_memory(phys, phys + PAGE_SIZE);
> > +	ret = __guest_check_transition_size(phys, ipa, nr_pages, &size);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = check_range_allowed_memory(phys, phys + size);
> >  	if (ret)
> >  		return ret;
> >  
> >  	host_lock_component();
> >  	guest_lock_component(vm);
> >  
> > -	ret = __guest_check_page_state_range(vcpu, ipa, PAGE_SIZE, PKVM_NOPAGE);
> > +	ret = __guest_check_page_state_range(vm, ipa, size, PKVM_NOPAGE);
> >  	if (ret)
> >  		goto unlock;
> >  
> > -	page = hyp_phys_to_page(phys);
> > -	switch (page->host_state) {
> > +	state = hyp_phys_to_page(phys)->host_state;
> > +	for_each_hyp_page(phys, size, page) {
> > +		if (page->host_state != state) {
> > +			ret = -EPERM;
> > +			goto unlock;
> > +		}
> > +	}
> > +
> > +	switch (state) {
> >  	case PKVM_PAGE_OWNED:
> > -		WARN_ON(__host_set_page_state_range(phys, PAGE_SIZE, PKVM_PAGE_SHARED_OWNED));
> > +		WARN_ON(__host_set_page_state_range(phys, size, PKVM_PAGE_SHARED_OWNED));
> >  		break;
> >  	case PKVM_PAGE_SHARED_OWNED:
> > -		if (page->host_share_guest_count)
> > -			break;
> > -		/* Only host to np-guest multi-sharing is tolerated */
> > -		WARN_ON(1);
> > -		fallthrough;
> > +		for_each_hyp_page(phys, size, page) {
> > +			/* Only host to np-guest multi-sharing is tolerated */
> > +			if (WARN_ON(!page->host_share_guest_count)) {
> > +				ret = -EPERM;
> > +				goto unlock;
> > +			}
> > +		}
> > +		break;
> >  	default:
> >  		ret = -EPERM;
> >  		goto unlock;
> >  	}
> >  
> > -	WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, PAGE_SIZE, phys,
> > +	WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, size, phys,
> >  				       pkvm_mkstate(prot, PKVM_PAGE_SHARED_BORROWED),
> >  				       &vcpu->vcpu.arch.pkvm_memcache, 0));
> > -	page->host_share_guest_count++;
> > +	__host_update_share_guest_count(phys, size, true);
> 
> So we're walking the entire phys range 3 times;
> 
> 	1. to check the host_state is consistent with that of the first
> 	page;
> 
> 	2. to set the state to SHARED_OWNED or to check the
> 	host_share_guest_count;
> 
> 	3. and then again here to update the host share guest count
> 
> I feel like we could probably remove at least one loop with a pattern
> like so:
> 
> 	for_each_hyp_page(phys, size, page) {
> 		switch (page->state) {
> 		case PKVM_PAGE_OWNED:
> 			continue;
> 		case PKVM_PAGE_SHARED_BORROWED:
> 			if (page->host_shared_guest_count)
> 				continue;
> 			fallthrough;
> 		default;
> 			ret = -EPERM;
> 			goto unlock;
> 		}
> 	}
> 
> 	for_each_hyp_page(phys, size, page) {
> 		page->host_state = PKVM_PAGE_SHARED_OWNED;
> 		page->host_share_guest_count++;
> 	}
> 
> That would also tolerate a mix of OWNED and SHARED_OWNED page in the
> range, which I'm not sure is needed but it doesn't cost us anything to
> support so ... :-)
> 
> Wdyt?

That sounds good, I'll drop __host_update_share_guest_count at the same
time to fold it directly into the share/unshare functions.

> 
> >  unlock:
> >  	guest_unlock_component(vm);
> > diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> > index 930b677eb9b0..00fd9a524bf7 100644
> > --- a/arch/arm64/kvm/pkvm.c
> > +++ b/arch/arm64/kvm/pkvm.c
> > @@ -361,7 +361,7 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
> >  		return -EINVAL;
> >  
> >  	lockdep_assert_held_write(&kvm->mmu_lock);
> > -	ret = kvm_call_hyp_nvhe(__pkvm_host_share_guest, pfn, gfn, prot);
> > +	ret = kvm_call_hyp_nvhe(__pkvm_host_share_guest, pfn, gfn, 1, prot);
> >  	if (ret) {
> >  		/* Is the gfn already mapped due to a racing vCPU? */
> >  		if (ret == -EPERM)
> > -- 
> > 2.48.1.711.g2feabab25a-goog
> > 

