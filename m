Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56BDEC5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 22:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:MIME-Version:References:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=keAmPabRaMdcX1QNc/BNoLOz/4Bjfzbm/F1rysZ+lHU=; b=c0i5U5k8pGcFkDaDoTb7TJ8zYK
	tJa4uj3hMsjNCYjWWOQjRpaTj2VsAH4vxhj7gyRFx37/zFf7Sst0Ha7/Y7qE4b4QjtdYUJja7+A6v
	n7CVxtyryB7ArG6kYZji1kmtQsDlyiNa4wXkPKU9xK3twr+tavISc+Ah+tEzoPw+gNiz99g0rbI+3
	WTfvveEznXm5CtsSZh8Ha3FNRwwXtfnkAsVGY6wVIgp3POjC8CsGgH1Z+h7pIDtu4/MuervqCcrR7
	xRTfdD6Zzzvsj3z0gbG5PV6tvJvRVbAUAXZSts/mbyA1WInSqv9M5wkKB5rz1o6gVhRy6mN83479x
	71L6r1Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxBMQ-0000000CITn-3gF7;
	Thu, 20 Aug 2026 22:35:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxBMP-0000000CITF-0FYQ
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 20 Aug 2026 22:35:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:MIME-Version:References:In-Reply-To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=keAmPabRaMdcX1QNc/BNoLOz/4Bjfzbm/F1rysZ+lHU=; b=pqOBenBvWuqJOlfyJqF1robneC
	WD+O3qJKJ3TjicwS8JwByyYU2F/6QswRznzDnMlE61QqelA9B3tWW7fW2F312iwbpp87dl5l10LqK
	LMYL6W7J2Wrs6F6zr976wSYfly/vSBPLqgJn/1Qzzz8/ijhDrfNG7R5j2uPKWc4Z4UlUrxZGGhnxf
	t+Mj4uG+P6nsJb+G1MLZTU1ev7cdLs9CiTpxofoNT0FKWBAlPM4pUffhyFm0GJnNgMPD+w1/WwQa0
	7WPXG045UUl3/N4y5BZccOjB9P6+8Ed4yjpB1DXil+UXb0a3wfMTHlAJ459zems/fJSoAiECH/b20
	pzvutD9A==;
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wxBMH-00000003OKm-46pR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 22:35:43 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-51c08df8513so2237511cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 15:35:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787265334; cv=none;
        d=google.com; s=arc-20260327;
        b=T41P3ep+7ykwt6KYO57HGdHtCwqbWUs/mkPDWESD+/R2cVBkD3aiQScMIs18Lfh0zr
         PxFxW/k8a3riIBSPezx1BtfElkndOSV37HNUVJiU+45BHV/w8N9BFBsj5v15pNMlXoZv
         goyKCNdoxSWs+aIzG9W9fZLAb+y+jwfTycrzfAVzBKVAKyvPt6P6bIcXHdHfUrgjFS75
         2DQRd6YyNdM7cNtwj+79GtAmerPphfu3WYqd/ps5xj3N4sZU8hnmtUY2+UweHyOcQMOi
         Rftpb4JoDGIAEmvaWZ0fv8O215M3MTfnlxn3qd+yeH2jBLLDxOPFIIexF0T+JSFOASw2
         hzsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=keAmPabRaMdcX1QNc/BNoLOz/4Bjfzbm/F1rysZ+lHU=;
        fh=Xk+ZccCC+bnS/4m0QEx8ZV6OncoUt82yk0ulqVOxepE=;
        b=FRLdOVxJmhEkNIuaPw/7ATQUYfzasrbTjgzkkn/Nn9TqKjDoPJCe4WZa99X9q1ffAm
         RfJnlgyX6tzxfXZhE6TtspJuOpq4Ow3LLj0Q23OfaK7kPR1PwUkOHyCREkcFZzEcRTT9
         djKOP6vxZsORZiuv6cnwUnzUWDYrXufLV0x9/oZqwUnCs6//RoVTUoF6+SB72VDtCZ1z
         ZJ0Ii9Rw2Gh58eWWuAxKIkTJMFV+/HUhkjp2+GsBxJAnUW16h4GfhIxdUs8OWK/SjxBr
         4l5tXea7H1nuQg4yDwPgl8r7tRw9wf4SeoV2am6aqB6DEb6diG8eUEEqJPLEkflUm7bC
         zjCw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787265334; x=1787870134; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=keAmPabRaMdcX1QNc/BNoLOz/4Bjfzbm/F1rysZ+lHU=;
        b=FkthyTn7a3mANvGmGwOrzHoMQswTMnLWRLiXTtrqGiZejxXEVE/qbXbjxWyXOZ10rO
         NyMfIC9HSXaLa5P5To/U9tVIL3OwhkVAv0ZQOcmJ67yWTEjNicX8TtLte0lj/0fNMg/i
         ZoNhUEXJuobKbS7FM+eUGlm/8Uis5Tip94eXAJxd/YB4gFrl015JUXH6dr90/t++Dujq
         mJUxIDdET7p1S60zvIPVVyWxYR9W6+TXPKid4nQ5A4euk9ishq3RoBxeo2kL5IPUwtf0
         XFx/WN2CJlnW+8RJ94xXpPauixFI+yz0G9b31NgCACe5Jod/Or2EfRYD5/bD4g+DIJJE
         2lwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787265334; x=1787870134;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=keAmPabRaMdcX1QNc/BNoLOz/4Bjfzbm/F1rysZ+lHU=;
        b=QtP//T576CvG9KB1hBOrwozoLCWWXoi/BHMnCtHwTIuoxw25GBxX1FdqHjpEBOlMSK
         mxVldE1cs3cbaMjNrL9r+PgnxMfOorK1+yw7fc7j9KTkDDTH4vGeqayx9xYgEmQyjw/l
         g6MRUQEFaRZka+ATkFsUxan3/9Jz19Jj6KTjScBNfdTDHswx/nZpe5EwCqYCsQ31Zl2v
         bUGG9VT/3qx2i9wZFNY/PdyLsRC2uUGoMv+MbdrBAgcK9IWyx0VnIAwnHgMQjfYU7dYa
         S3/icZSMqfEUa6gF4NzrLi3+1vLOJ4V2u4mzZZuTaNpCjSwRFrMJqOFTwfLrebhARTOo
         H16Q==
X-Forwarded-Encrypted: i=1; AHgh+RoquYVMtvfCk6uXgbxOozxS32rRu25E9QXi0/J4sSBBEJ9rw2vNr2o2KV/JCPErtoTF20vDo9wpZNq1tsQPJYbT@lists.infradead.org
X-Gm-Message-State: AOJu0YzGgiY37PfoktM+o3keAYmGhvNHSiY+pRgT1+FAVeFzzFt7vFC/
	VTm6aRyFI9GgPI9hzVY4iKUykQy/ziZm8WH53vtWEQs4CMEdpRgJi6kRELRbB8tpXMTSKodL7zz
	19Purtp3OCnAdJ2gnGXWYNXBilmfciZCk+e8nUch3
X-Gm-Gg: AR+sD11YCBGD+KZPQP3b70lOgV0byCxvOyOcg6YhdSKMsVltK78JOfGXQZ6GK7K+nre
	6LwpX0zuYg1NhV/MoBBZKSlINxRfOic9dA980Ql9OnUNAwprDbV/kRf9TLVWTdkjg8IKrbq3Ij8
	szGgwb3rD8VvTU7Cc2RQverSe0zKgtjDsNqNSz+aimwJebqUcLb7xUNfAZn0z4GZz3f1F7ibD+w
	BzNC3kjTzS2h7jpwvxwdH7PM21Hh4E5LGUt/wt4zjU6eECPLdLZy1gpum0IuRjXvh9kizsGdeSh
	r1EVFvUCN1ylOOY4n0S0+r1bPzIbQIEm+hB3Gycvyoo2TUxmsKZvQg5cQxiaBD3htUOoXNXZ8x/
	3EJU=
X-Received: by 2002:a05:622a:1ccc:b0:51c:44c:6ad with SMTP id
 d75a77b69052e-52df5a07b4cmr19910241cf.21.1787265332903; Thu, 20 Aug 2026
 15:35:32 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 20 Aug 2026 15:35:31 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 20 Aug 2026 15:35:31 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <zb5krzhrg3soslplynegqo52brd53wk3meas45udqpjms6oluk@zecqwzn7zziy>
References: <20260818-gmem-no-return-page-v2-0-5298f42d49bb@google.com>
 <20260818-gmem-no-return-page-v2-2-5298f42d49bb@google.com>
 <j6bfvbzjivlcsu3slbnaoomxxqyypmfl2bupo3k5ipnt6fc5lo@e5ntbx7yd4qw>
 <CAEvNRgEruoa4d_8Y1MpkdzbHg3j1Yv=-Y6w6Yy=v6mJgPajjWw@mail.gmail.com> <zb5krzhrg3soslplynegqo52brd53wk3meas45udqpjms6oluk@zecqwzn7zziy>
MIME-Version: 1.0
Date: Thu, 20 Aug 2026 15:35:31 -0700
X-Gm-Features: AcwNN1VgRdjzQciaY8CryBJfmg5HGuqOzIWFzcFZzObegOXkA-aa77jVpFBsdqg
Message-ID: <CAEvNRgEHEE67+vjQqJjYD3M4yuwuR+4-36Hw4-sp5caYzmxbkQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] KVM: SEV: Drop page refcount early during RMP
 fault handling
To: Michael Roth <michael.roth@amd.com>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Ashish Kalra <ashish.kalra@amd.com>, 
	Brijesh Singh <brijesh.singh@amd.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Fuad Tabba <tabba@google.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	"Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, Vishal Annapurve <vannapurve@google.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_233541_903721_27D521E7 
X-CRM114-Status: GOOD (  35.94  )
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

Michael Roth <michael.roth@amd.com> writes:

> On Thu, Aug 20, 2026 at 07:58:19AM -0700, Ackerley Tng wrote:
>> Michael Roth <michael.roth@amd.com> writes:
>>
>> > On Tue, Aug 18, 2026 at 09:15:53AM +0000, Ackerley Tng wrote:
>> >> From: Sean Christopherson <seanjc@google.com>
>> >>
>> >> When handling an RMP fault, KVM retrieves the PFN for a private GPA from
>> >> guest_memfd.
>> >>
>> >> Drop the page reference immediately after retrieving the PFN instead of
>> >> holding it across the entire handler so that the later patch can follow up
>> >> with completely not returning refcounted pages from kvm_gmem_get_pfn().
>> >
>> > Regarding this point:
>> >
>> >>
>> >> On a first look, existing RMP table handling (psmash and checking for
>> >> errors) might seem like it works fine, since truncation of the page from
>> >> guest_memfd would have called rmp_make_shared() and removed the PFN from
>> >> the RMP table. However, that is insufficient since a freed page may already
>> >> be used in a different SNP VM.
>> >
>> > In the code this patch is applied on top of, I think the kvm_gmem_get_pfn()
>> > ref is enough to avoid the reused-by-another-SNP-VM scenario until after
>> > caller releases the ref, so I think the above explanation should be adjusted
>> > to also be preparatory for "the later patch".
>> >
>>
>> I think this sequence of events is possible:
>>
>> CPU 0: sev_handle_rmp_fault()
>> CPU 0:   kvm_gmem_get_pfn()
>> CPU 0:     filemap_invalidate_lock()
>> CPU 0:     refcount++
>> CPU 0:     filemap_invalidate_unlock()
>> CPU 0:     refcount-- <<== because kvm_release_page_unused(page);
>
> Prior to this patch, the kvm_release_page_unused() isn't done until
> after the snp_lookup_rmpentry()/snp_rmptable_psmash().
>
> It's possible CPU 1 truncate sequence below can run concurrently
> after filemap_invalidate_unlock() above, but even though it calls
> free_folio(), which might zap the RMP entry, the filemap code will
> only put the refs that it has on the folio so it wouldn't actually
> get freed back to the buggy allocator, so it doesn't seem like the
> psmash-another-guest scenario is reachable. I could certainly be
> misreading things though.
>

Ah I see what you mean. I think we mean the same thing, let me add to
the commit message that I meant after dropping the refcount early. Does
this help?

  The filemap_invalidate_lock() is already dropped in kvm_gmem_get_pfn()
  before returning to sev_handle_rmp_fault(). After dropping the
  refcount earlier with kvm_release_page_unused(), these scenarios are
  possible:

  1. Since the filemap_invalidate_lock() is dropped, the page can be
     truncated (or in future, converted), and the RMP entry is now
     shared.

     In this case, existing RMP table handling (psmash and checking for
     errors) would be sufficient. On finding a shared entry, psmashing
     would fail gracefully and no warning would be emitted.

  2. The page is truncated and freed, and then re-allocated to another
     SNP VM. The RMP entry is now assigned, but to another SNP VM.

     To address this, adopt the MMU invalidation protocol to guard
     psmashing.

> The psmash-a-now-shared-entry scenario because of a race with the
> VMM/truncate path seems possible prior to this patch, but that's
> pretty similar to the psmash-a-now-shared-entry because of a race
> with the guest scenario and which would generate spurious warning
> messages to console, and that would be similarly addressed via
> patch 1 I think. I'm not sure
>

Yup. I like your psmash-another-guest vs psmash-a-now-shared-entry
classification.

> -Mike
>
>>
>> CPU 1: truncate()
>> CPU 1:   filemap_invalidate_lock()
>> CPU 1:   refcount--
>> CPU 1:     kvm_gmem_free_folio()
>> CPU 1:       sev_gmem_make_shared()
>> CPU 1:     folio is freed
>> CPU 1:   filemap_invalidate_unlock()
>>
>> CPU 2: in some other SNP VM,
>> CPU 2: kvm_gmem_get_pfn() gets the freed folio
>> CPU 2:   sev_gmem_make_private()
>>
>> CPU 0:   snp_lookup_rmpentry(pfn, &assigned, &rmp_level);
>>            <<== it's assigned but to some other SNP VM
>> CPU 0:   snp_rmptable_psmash(pfn);
>>            <<== this psmash would be smashing in some other SNP VM
>>
>> And hence I think we do need to check for invalidations using the MMU
>> invalidation protocol.
>>
>> > Other than that:
>> >
>> > Reviewed-by: Michael Roth <michael.roth@amd.com>
>> >
>> >>
>> >> Hence, adopt the MMU invalidation protocol to guard committing anything
>> >> based on the PFN.
>> >>
>> >> Signed-off-by: Sean Christopherson <seanjc@google.com>
>> >> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
>> >> ---
>> >>  arch/x86/kvm/svm/sev.c | 39 ++++++++++++++++++++++++---------------
>> >>  1 file changed, 24 insertions(+), 15 deletions(-)
>> >>
>> >> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
>> >> index b2738362a928b..b34b11d7f8fad 100644
>> >> --- a/arch/x86/kvm/svm/sev.c
>> >> +++ b/arch/x86/kvm/svm/sev.c
>> >> @@ -5003,6 +5003,7 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code)
>> >>  	struct kvm_memory_slot *slot;
>> >>  	struct kvm *kvm = vcpu->kvm;
>> >>  	int order, rmp_level, ret;
>> >> +	unsigned long mmu_seq;
>> >>  	struct page *page;
>> >>  	bool assigned;
>> >>  	kvm_pfn_t pfn;
>> >> @@ -5030,18 +5031,22 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code)
>> >>  		return;
>> >>  	}
>> >>
>> >> +	mmu_seq = kvm->mmu_invalidate_seq;
>> >> +	smp_rmb();
>> >> +
>> >>  	ret = kvm_gmem_get_pfn(kvm, slot, gfn, &pfn, &page, &order);
>> >>  	if (ret) {
>> >>  		pr_warn_ratelimited("SEV: Unexpected RMP fault, no backing page for private GPA 0x%llx\n",
>> >>  				    gpa);
>> >>  		return;
>> >>  	}
>> >> +	kvm_release_page_unused(page);
>> >>
>> >>  	ret = snp_lookup_rmpentry(pfn, &assigned, &rmp_level);
>> >>  	if (ret || !assigned) {
>> >>  		pr_warn_ratelimited("SEV: Unexpected RMP fault, no assigned RMP entry found for GPA 0x%llx PFN 0x%llx error %d\n",
>> >>  				    gpa, pfn, ret);
>> >> -		goto out_no_trace;
>> >> +		return;
>> >>  	}
>> >>
>> >>  	/*
>> >> @@ -5069,27 +5074,31 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code)
>> >>  	if (rmp_level == PG_LEVEL_4K)
>> >>  		goto out;
>> >>
>> >> -	ret = snp_rmptable_psmash(pfn);
>> >> -	if (ret) {
>> >> -		/*
>> >> -		 * Look it up again. If it's 4K now then the PSMASH may have
>> >> -		 * raced with another process and the issue has already resolved
>> >> -		 * itself. If it's not assigned, then this must have raced with
>> >> -		 * another process that made this page shared.
>> >> -		 */
>> >> -		if (!snp_lookup_rmpentry(pfn, &assigned, &rmp_level) &&
>> >> -		    ((assigned && rmp_level == PG_LEVEL_4K) || !assigned))
>> >> +	scoped_guard(read_lock, &kvm->mmu_lock) {
>> >> +		if (mmu_invalidate_retry_gfn(kvm, mmu_seq, gfn))
>> >>  			goto out;
>> >>
>> >> -		pr_warn_ratelimited("SEV: Unable to split RMP entry for GPA 0x%llx PFN 0x%llx ret %d\n",
>> >> -				    gpa, pfn, ret);
>> >> +		ret = snp_rmptable_psmash(pfn);
>> >> +		if (ret) {
>> >> +			/*
>> >> +			 * Look it up again. If it's 4K now then the PSMASH may
>> >> +			 * have raced with another process and the issue has
>> >> +			 * already resolved itself. If it's not assigned, then
>> >> +			 * this must have raced with another process that made
>> >> +			 * this page shared.
>> >> +			 */
>> >> +			if (!snp_lookup_rmpentry(pfn, &assigned, &rmp_level) &&
>> >> +			    ((assigned && rmp_level == PG_LEVEL_4K) || !assigned))
>> >> +				goto out;
>> >> +
>> >> +			pr_warn_ratelimited("SEV: Unable to split RMP entry for GPA 0x%llx PFN 0x%llx ret %d\n",
>> >> +					    gpa, pfn, ret);
>> >> +		}
>> >>  	}
>> >>
>> >>  	kvm_zap_gfn_range(kvm, gfn, gfn + PTRS_PER_PMD);
>> >>  out:
>> >>  	trace_kvm_rmp_fault(vcpu, gpa, pfn, error_code, rmp_level, ret);
>> >> -out_no_trace:
>> >> -	kvm_release_page_unused(page);
>> >>  }
>> >>
>> >>  static bool is_pfn_range_shared(kvm_pfn_t start, kvm_pfn_t end)
>> >>
>> >> --
>> >> 2.55.0.699.gb54405d56f-goog
>> >>

