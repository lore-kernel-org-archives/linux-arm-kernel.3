Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B9AC5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 23:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:MIME-Version:References:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dqgdGAes/vZjiy7MuCsDmVoVgUg9hSFwRvHXcvcjdsw=; b=GBCR2R6zs+7wulFlicOSPxzh+M
	UZ/QXonUyLo7zvztQXu/ac36Jd5hZ2hw6gtSCugwyTAHYoO1Ckn23L2h0Ura1Q3xeGOqmLfnvkoxW
	1eUSCudkPtIrt8O+NoEeqThZGepsSqIpYQax8d0MQ+iU88/jA8lpZCzDomqNJj02Mhu8No0lxlowW
	ZX7kFdrKrNTMPOq8Q9lkJiAONAahRlEVqx1B7Rc4+QGBPA5lExMQTV8J7sFiMEfv3Yd3Ku44a2UAA
	DlOjYlZRQ+lgAeNRa4SKc0EAnlk2Jq+v+LYg6+EFBTJfMIxOo49nOTVn02xkI6vGcy0eECfHNz1oV
	rTTSTLpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxCH3-0000000CM0e-3uON;
	Thu, 20 Aug 2026 23:34:17 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxCH1-0000000CM0I-3qj7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 23:34:17 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-8efb708b1a0so3430656d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 16:34:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787268855; cv=none;
        d=google.com; s=arc-20260327;
        b=K2jirt1sqVWOM1jC2tmSFyASYG2F2WWEPFAW04M4HYieA7K4gFvjvsEHf3yF8w2NNx
         upXuB8z2R0ZbenXlgyqYz7sg9arrkfHrdkO+TX/MUlfDQX4kAshO9xJDE5X7PSXUPYyC
         AKSWogGfgGPdoTNZNU8yLocdKqSNM78rSgRutIsPPiMIDXY52yV6+HznPCb9tzUnKJxg
         NECn93mezMoRW+Mn05MmEKBFeThe+e2kNga6Q1nEUdvS+WTtNBfC1XxukSk0guq2PZld
         XFqyDRac0pwukgAgmAW35IJw3MVAPFikZczVxi7keAMSUyt/DziW4MY2MSCLpLm4P1Vp
         xNkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=dqgdGAes/vZjiy7MuCsDmVoVgUg9hSFwRvHXcvcjdsw=;
        fh=WLoTtY0eGLkIVg+wRtKdS3Qo/TIPLmXdfQxH2kFJDqk=;
        b=stZpiKIVJSa2sjwjtPp4Bb8bJE0LGLLU1EOZCa7Y1NbkWPPPv2J3mtLq3jfuvB2oPO
         2aJzPHAmwqIZAmvXmtuNOJPu0xHoFbqiv/rbjOOpBGJzXUCXl7xEL/dn8LDWSgkqB0FA
         wCBhl/pV0jVUP2nlIwMA07FOtLp1bzypSnKztSN+Ie6klzxHJ3cyhv1sU13keXysicTU
         mIR0F6Z8riLiZOTsCJ2lMMJ6emQ+SeSECOK7eTjNLOWs8y8d5+japOVa7+jik7FRt9V4
         +a3O1k6utjEn9RFTVoAiU4RHWCeGff24PJsucCMqmQzjrxU/pvTtKCh60CdrSUGvcW6S
         ZB2w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787268855; x=1787873655; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dqgdGAes/vZjiy7MuCsDmVoVgUg9hSFwRvHXcvcjdsw=;
        b=imZSB55pmgW7cUq5WoMsyso7gwC1blo2kjuHiJyRSVgYVNpYB3rcW2fiMzPBhwuZt0
         5eaCwBjrHpOayRiQOQuMqrR/o1Mkn16MiTyQQUQLuCw/LvXA9qEPh9DAHyZ2TpoRFMGT
         CT1GbIapbSwMSIf9zeArySlSOpIQNLVr+zgEwqBZ7vMDRSxDlwl+2lCxhtKlbb8hCwCS
         6s9F6hHKzr5F9npIYhb+21CmL2Jxj2A9uRKYfEi4tATZEdjbJ9nIv0qPkvto3FROB5rx
         HgMzDmLfzKvTkx0zCFiqA6BDrA7vzmHjPkbsosbT2fj24q033MAaJ9JTe25HiCjMP0Rb
         9PdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787268855; x=1787873655;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dqgdGAes/vZjiy7MuCsDmVoVgUg9hSFwRvHXcvcjdsw=;
        b=quD9h2me/IATspnkjAOjZ1oDy8METJz99HFbqIlGyuU4LFa/K8sr49q9fvXMYhDwc4
         Z4vs/fUWj6dsnnXQLCv91nbUA2yxd3iy4kFUsdyM0ZsQK297orcRONl5UId6zCFbYEKG
         Fhn8yRc5g5PXQxv9k0sWYBwoniUAAtEbpltThnA8OaWUsQC4rWA3jtPoaZ8XeeXuEU7W
         EL4NOdSan4H9wzIK+FfdW13aPGtUHUkT+zKf6nq2L4N2M2hSp5QIqqIaQMg6E+DkHyc9
         H/snxPfTALG4ffAnb6Ki71vdoxn6gI86KTYvLkHA2vo8SGyLopf1Un/CTwKW9+Qrvqsf
         +rxA==
X-Forwarded-Encrypted: i=1; AHgh+RrWtxoxyElx8VnB9JBvECgG2crDPjKGLi7jn410Ru3K92w5EE1BsADP+QNd+3hzRvoCx2WQUqSNHgTFNPYttYiZ@lists.infradead.org
X-Gm-Message-State: AFuF++mNwC1vvUXEs2UdxcTaPYoCIDBoawCXxuVQsB+vroVMwUpEWTf9
	O+YH2MoNyMT2sgV5T8i7SK0gp2c/QjZCkJ21yg40/wvi86bKq6GE4GzphfOsmpplDZZ18BFXmBC
	V2HuqgVCytyZjnLDD2/bMbJNzv/J3ivuj3tDnr2Rd
X-Gm-Gg: AR+sD13PhseADtO9OOShioB/FVkwnQjsXfVN5zUDnlpPC2OnLY3MAudG0vL+ZkHNbuf
	fnSTIhCsmQHdDJxSXmwrtXZnLInatXotUHXqgNPI3DEOTwFmNObQ43zDZWtnBnP7ArI+zJUq5PX
	1YGAAk1TEBUWPHQIemCgZdfUfDJUH/N16iI/QO4noDgaN3WYpYHkuoQaWJkAeX/X9+RU/l5S+0v
	dkv56t3ChBPvfvnKfP077jjIiVQQTm8KWzaOJdosFSUIVuHxYXjf6/FHwWmrtU1VBSo/RNx5X4d
	aEDvGUdAMuPyBFGOtS54NLnLfjMk6ucMzZ/m55eeTdyWtpim89cwfYbBVTH6PA1ho9NESDMee4/
	fzT8=
X-Received: by 2002:a05:6214:124a:b0:908:23fd:813f with SMTP id
 6a1803df08f44-90c80c5c0d2mr19422596d6.15.1787268853735; Thu, 20 Aug 2026
 16:34:13 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 20 Aug 2026 16:34:12 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 20 Aug 2026 16:34:12 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <7kapvdum7qk7l4epbeqvrybqxapuhvwltz7axfprxldw2utozh@t4url3mqbpom>
References: <20260818-gmem-no-return-page-v2-0-5298f42d49bb@google.com>
 <20260818-gmem-no-return-page-v2-2-5298f42d49bb@google.com>
 <j6bfvbzjivlcsu3slbnaoomxxqyypmfl2bupo3k5ipnt6fc5lo@e5ntbx7yd4qw>
 <CAEvNRgEruoa4d_8Y1MpkdzbHg3j1Yv=-Y6w6Yy=v6mJgPajjWw@mail.gmail.com>
 <zb5krzhrg3soslplynegqo52brd53wk3meas45udqpjms6oluk@zecqwzn7zziy>
 <CAEvNRgEHEE67+vjQqJjYD3M4yuwuR+4-36Hw4-sp5caYzmxbkQ@mail.gmail.com> <7kapvdum7qk7l4epbeqvrybqxapuhvwltz7axfprxldw2utozh@t4url3mqbpom>
MIME-Version: 1.0
Date: Thu, 20 Aug 2026 16:34:12 -0700
X-Gm-Features: AcwNN1UxC1y3hgXaqd_BMNMsuIls7jzT9HkqjaxXUN2vJgZZQJ3KLiKDnMBj6Ms
Message-ID: <CAEvNRgHCJ9KFW1LFG3HBWBM-5DP+qUZb653802NY3x1fAYwNaQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260820_163416_014031_2BC4A427 
X-CRM114-Status: GOOD (  42.36  )
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

> On Thu, Aug 20, 2026 at 03:35:31PM -0700, Ackerley Tng wrote:
>> Michael Roth <michael.roth@amd.com> writes:
>>
>> > On Thu, Aug 20, 2026 at 07:58:19AM -0700, Ackerley Tng wrote:
>> >> Michael Roth <michael.roth@amd.com> writes:
>> >>
>> >> > On Tue, Aug 18, 2026 at 09:15:53AM +0000, Ackerley Tng wrote:
>> >> >> From: Sean Christopherson <seanjc@google.com>
>> >> >>
>> >> >> When handling an RMP fault, KVM retrieves the PFN for a private GPA from
>> >> >> guest_memfd.
>> >> >>
>> >> >> Drop the page reference immediately after retrieving the PFN instead of
>> >> >> holding it across the entire handler so that the later patch can follow up
>> >> >> with completely not returning refcounted pages from kvm_gmem_get_pfn().
>> >> >
>> >> > Regarding this point:
>> >> >
>> >> >>
>> >> >> On a first look, existing RMP table handling (psmash and checking for
>> >> >> errors) might seem like it works fine, since truncation of the page from
>> >> >> guest_memfd would have called rmp_make_shared() and removed the PFN from
>> >> >> the RMP table. However, that is insufficient since a freed page may already
>> >> >> be used in a different SNP VM.
>> >> >
>> >> > In the code this patch is applied on top of, I think the kvm_gmem_get_pfn()
>> >> > ref is enough to avoid the reused-by-another-SNP-VM scenario until after
>> >> > caller releases the ref, so I think the above explanation should be adjusted
>> >> > to also be preparatory for "the later patch".
>> >> >
>> >>
>> >> I think this sequence of events is possible:
>> >>
>> >> CPU 0: sev_handle_rmp_fault()
>> >> CPU 0:   kvm_gmem_get_pfn()
>> >> CPU 0:     filemap_invalidate_lock()
>> >> CPU 0:     refcount++
>> >> CPU 0:     filemap_invalidate_unlock()
>> >> CPU 0:     refcount-- <<== because kvm_release_page_unused(page);
>> >
>> > Prior to this patch, the kvm_release_page_unused() isn't done until
>> > after the snp_lookup_rmpentry()/snp_rmptable_psmash().
>> >
>> > It's possible CPU 1 truncate sequence below can run concurrently
>> > after filemap_invalidate_unlock() above, but even though it calls
>> > free_folio(), which might zap the RMP entry, the filemap code will
>> > only put the refs that it has on the folio so it wouldn't actually
>> > get freed back to the buggy allocator, so it doesn't seem like the
>> > psmash-another-guest scenario is reachable. I could certainly be
>> > misreading things though.
>> >
>>
>> Ah I see what you mean. I think we mean the same thing, let me add to
>> the commit message that I meant after dropping the refcount early. Does
>> this help?
>>
>>   The filemap_invalidate_lock() is already dropped in kvm_gmem_get_pfn()
>>   before returning to sev_handle_rmp_fault(). After dropping the
>>   refcount earlier with kvm_release_page_unused(), these scenarios are
>>   possible:
>>
>>   1. Since the filemap_invalidate_lock() is dropped, the page can be
>>      truncated (or in future, converted), and the RMP entry is now
>>      shared.
>>
>>      In this case, existing RMP table handling (psmash and checking for
>>      errors) would be sufficient. On finding a shared entry, psmashing
>>      would fail gracefully and no warning would be emitted.
>>
>>   2. The page is truncated and freed, and then re-allocated to another
>>      SNP VM. The RMP entry is now assigned, but to another SNP VM.
>>
>>      To address this, adopt the MMU invalidation protocol to guard
>>      psmashing.
>
> This reads kinda weird to me, as if with #2 we're documenting a "bug" that
> this patch fixes, but the bug would only exist if we partially applied the
> bits of this patch the drops the ref counts earlier and left out the
> bits of the patch that introduce the mmu notifier logic that replaces it.
>

Thanks, I adjusted the commit message to focus on drop refcount + adopt
KVM MMU invalidation protocol in v3, please see v3! Thanks!

> I think with patch 1 applied (which covers the
> psmash-a-now-shared-entry case while retaining the original refcount
> logic), the only thing this patch is doing is replacing the elevated
> refcount logic with the MMU invalidation logic as prep for dropping
> reliance of refcounts entirely.
>
> I think if the wording was simplified to just say something to that effect
> it would make it clearer that this and patch #3 are prep for #4, and that
> patch #1 is the only patch here that would make potentially make sense for
> a downstream to backport without the other bits.
>
> -Mike
>
>>
>> > The psmash-a-now-shared-entry scenario because of a race with the
>> > VMM/truncate path seems possible prior to this patch, but that's
>> > pretty similar to the psmash-a-now-shared-entry because of a race
>> > with the guest scenario and which would generate spurious warning
>> > messages to console, and that would be similarly addressed via
>> > patch 1 I think. I'm not sure
>> >
>>
>> Yup. I like your psmash-another-guest vs psmash-a-now-shared-entry
>> classification.
>>
>> > -Mike
>> >
>> >>
>> >> CPU 1: truncate()
>> >> CPU 1:   filemap_invalidate_lock()
>> >> CPU 1:   refcount--
>> >> CPU 1:     kvm_gmem_free_folio()
>> >> CPU 1:       sev_gmem_make_shared()
>> >> CPU 1:     folio is freed
>> >> CPU 1:   filemap_invalidate_unlock()
>> >>
>> >> CPU 2: in some other SNP VM,
>> >> CPU 2: kvm_gmem_get_pfn() gets the freed folio
>> >> CPU 2:   sev_gmem_make_private()
>> >>
>> >> CPU 0:   snp_lookup_rmpentry(pfn, &assigned, &rmp_level);
>> >>            <<== it's assigned but to some other SNP VM
>> >> CPU 0:   snp_rmptable_psmash(pfn);
>> >>            <<== this psmash would be smashing in some other SNP VM
>> >>
>> >> And hence I think we do need to check for invalidations using the MMU
>> >> invalidation protocol.
>> >>
>> >> > Other than that:
>> >> >
>> >> > Reviewed-by: Michael Roth <michael.roth@amd.com>
>> >> >
>> >> >>
>> >> >> Hence, adopt the MMU invalidation protocol to guard committing anything
>> >> >> based on the PFN.
>> >> >>
>> >> >> Signed-off-by: Sean Christopherson <seanjc@google.com>
>> >> >> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
>> >> >> ---
>> >> >>  arch/x86/kvm/svm/sev.c | 39 ++++++++++++++++++++++++---------------
>> >> >>  1 file changed, 24 insertions(+), 15 deletions(-)
>> >> >>
>> >> >> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
>> >> >> index b2738362a928b..b34b11d7f8fad 100644
>> >> >> --- a/arch/x86/kvm/svm/sev.c
>> >> >> +++ b/arch/x86/kvm/svm/sev.c
>> >> >> @@ -5003,6 +5003,7 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code)
>> >> >>  	struct kvm_memory_slot *slot;
>> >> >>  	struct kvm *kvm = vcpu->kvm;
>> >> >>  	int order, rmp_level, ret;
>> >> >> +	unsigned long mmu_seq;
>> >> >>  	struct page *page;
>> >> >>  	bool assigned;
>> >> >>  	kvm_pfn_t pfn;
>> >> >> @@ -5030,18 +5031,22 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code)
>> >> >>  		return;
>> >> >>  	}
>> >> >>
>> >> >> +	mmu_seq = kvm->mmu_invalidate_seq;
>> >> >> +	smp_rmb();
>> >> >> +
>> >> >>  	ret = kvm_gmem_get_pfn(kvm, slot, gfn, &pfn, &page, &order);
>> >> >>  	if (ret) {
>> >> >>  		pr_warn_ratelimited("SEV: Unexpected RMP fault, no backing page for private GPA 0x%llx\n",
>> >> >>  				    gpa);
>> >> >>  		return;
>> >> >>  	}
>> >> >> +	kvm_release_page_unused(page);
>> >> >>
>> >> >>  	ret = snp_lookup_rmpentry(pfn, &assigned, &rmp_level);
>> >> >>  	if (ret || !assigned) {
>> >> >>  		pr_warn_ratelimited("SEV: Unexpected RMP fault, no assigned RMP entry found for GPA 0x%llx PFN 0x%llx error %d\n",
>> >> >>  				    gpa, pfn, ret);
>> >> >> -		goto out_no_trace;
>> >> >> +		return;
>> >> >>  	}
>> >> >>
>> >> >>  	/*
>> >> >> @@ -5069,27 +5074,31 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code)
>> >> >>  	if (rmp_level == PG_LEVEL_4K)
>> >> >>  		goto out;
>> >> >>
>> >> >> -	ret = snp_rmptable_psmash(pfn);
>> >> >> -	if (ret) {
>> >> >> -		/*
>> >> >> -		 * Look it up again. If it's 4K now then the PSMASH may have
>> >> >> -		 * raced with another process and the issue has already resolved
>> >> >> -		 * itself. If it's not assigned, then this must have raced with
>> >> >> -		 * another process that made this page shared.
>> >> >> -		 */
>> >> >> -		if (!snp_lookup_rmpentry(pfn, &assigned, &rmp_level) &&
>> >> >> -		    ((assigned && rmp_level == PG_LEVEL_4K) || !assigned))
>> >> >> +	scoped_guard(read_lock, &kvm->mmu_lock) {
>> >> >> +		if (mmu_invalidate_retry_gfn(kvm, mmu_seq, gfn))
>> >> >>  			goto out;
>> >> >>
>> >> >> -		pr_warn_ratelimited("SEV: Unable to split RMP entry for GPA 0x%llx PFN 0x%llx ret %d\n",
>> >> >> -				    gpa, pfn, ret);
>> >> >> +		ret = snp_rmptable_psmash(pfn);
>> >> >> +		if (ret) {
>> >> >> +			/*
>> >> >> +			 * Look it up again. If it's 4K now then the PSMASH may
>> >> >> +			 * have raced with another process and the issue has
>> >> >> +			 * already resolved itself. If it's not assigned, then
>> >> >> +			 * this must have raced with another process that made
>> >> >> +			 * this page shared.
>> >> >> +			 */
>> >> >> +			if (!snp_lookup_rmpentry(pfn, &assigned, &rmp_level) &&
>> >> >> +			    ((assigned && rmp_level == PG_LEVEL_4K) || !assigned))
>> >> >> +				goto out;
>> >> >> +
>> >> >> +			pr_warn_ratelimited("SEV: Unable to split RMP entry for GPA 0x%llx PFN 0x%llx ret %d\n",
>> >> >> +					    gpa, pfn, ret);
>> >> >> +		}
>> >> >>  	}
>> >> >>
>> >> >>  	kvm_zap_gfn_range(kvm, gfn, gfn + PTRS_PER_PMD);
>> >> >>  out:
>> >> >>  	trace_kvm_rmp_fault(vcpu, gpa, pfn, error_code, rmp_level, ret);
>> >> >> -out_no_trace:
>> >> >> -	kvm_release_page_unused(page);
>> >> >>  }
>> >> >>
>> >> >>  static bool is_pfn_range_shared(kvm_pfn_t start, kvm_pfn_t end)
>> >> >>
>> >> >> --
>> >> >> 2.55.0.699.gb54405d56f-goog
>> >> >>

