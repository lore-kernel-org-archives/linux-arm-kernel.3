Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B7F0C5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 14:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:MIME-Version:References:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DUkDVcYI4HfaofmyfTGhbY62rHBJbTNNeZrIZ8FEwOY=; b=G6mWPtJ6BSddnqFOZLENviUSzc
	IKmsBWUyVk+SetI9b4N6b5UEHDS+bbbgiUnjLYl4hQmgqGBh+BF0khOwQBVUkZrenVNffVK/8LZ4A
	RPRF60DQTXXDIr6B/rmI4F+XEZ8JRUsUhWYUcyxBTqu7B7QNZmhG0P637VowWiMdEkmvoJhamoxCj
	qZXDzd6ot4H0hR50kygTiB3dZuObyFPB1tY39S6Obbi/mclTLTDvUpA8QEEDXIi5+4rNjVSwMwhKs
	XcKh8VPHvVpGS2P4Tc6K3mkoOQqjZFl8Z3bVchbSE49kDvMNUlolohSm7ufJjPxT1PaRV9fuuP8Tz
	xeFDpBhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx4Do-0000000Bkph-30X2;
	Thu, 20 Aug 2026 14:58:24 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx4Dm-0000000Bkoq-1azL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 14:58:23 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-8efbafa1bacso15692506d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 07:58:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787237901; cv=none;
        d=google.com; s=arc-20260327;
        b=ikJHN61RFc39qVfCQzF5CW8hPzyT5NXsNAPjyQ+74WFA68EeINBY/N70riUiDwA1sZ
         dBZdUyO78/D0wDZIt3bYA9UC8eIZHadsujYemb7Lh0kq0yKp0hsU6yLJc2vXCtYrcWNf
         SdcNlF+UzD+dkIHFKnTit2+YZTegaKu7/BxB7qDBoYinf+BchBKcKt+4n0Mzok8WJL09
         jcpf0VCQqq+WyfdNM5tnqgBICnFmzecd35HtFZ4joKPmrzGLfy0K1Zy27Z20q0/eowNO
         Hki4BzNUYYGhUdh3DpY7wRXjgmjACETs1LYNhx3Y/m+8k49gyXVBZKx6AhCvEE5YDCMi
         yvgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=DUkDVcYI4HfaofmyfTGhbY62rHBJbTNNeZrIZ8FEwOY=;
        fh=5Co0yuK+OLRMlXkoKJ/Z2EcewTY2kDGjn8XO/IvNOZ4=;
        b=cXMn0xZt0JTaQ/uYu7fTU8RTCNhezCQX+xRBfktrMaREEVBG4fenAbkUrGtCPjy5aq
         zcsQbk2ElylURosPFgyqhY8tDHDSPWyTFBLPvByAwZK+7zxgR6EgHVhG/T0gz5OjTjiv
         We/qU1sZxSIS11UpsIWmJuHv9jtGRfqZkIwbF9Z1TZsMYjzJzesj4Z1z/RJsrw6u3YsJ
         3A90bAaZXapX/zFq/gWXRQ1H8cFs+x+J5S5jSE7dQG+2onBKpLq8DvzRwXY/zZNqsVhp
         7bYVUzDjh46wHjRSJ3eTk2epCUiydiFKXX2tXDfHa55VTppXkU/24ZQPo9yWXEH6OG1b
         ATiA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787237901; x=1787842701; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DUkDVcYI4HfaofmyfTGhbY62rHBJbTNNeZrIZ8FEwOY=;
        b=vXsy2XXtvMIvJbpMgACgOM+PrepbPz8iLzY9VfXfG8NSKbdAjRmH0jMTLu6YR2adKj
         82hGdD8kfrlzs/EGRNpskkPHeKVbq3DxuLdKxAr5KDjRw6BVBCL/mPEeGdfidJDRxoiT
         txZ/p3gr/MOs7rVUMFj09WiplUBCj8Ha7j8Giz/dP7Qca9DwEdBO3EqVUtW+2AJnbQBy
         DeRXY5UCZjtJrtg4rGeWe8M4gatDo7dOTbwCScWwMbU6MluQHfIGkfEkdvYuxvodVH+e
         EdSCfmnV3/+pxnq4PD/NC7XFiJJ3OmXA5ErIm6WHsx0b7ftCGM6h0oziT9ZkwCK77vJ9
         nZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787237901; x=1787842701;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DUkDVcYI4HfaofmyfTGhbY62rHBJbTNNeZrIZ8FEwOY=;
        b=QnF31EyqfmzPKWMyrRfVQohfeu5wMBOK4+neKOXPdTC7WEfe1wr2Xz2F4OplJ48tUn
         S/dipQRfSbvviajw5kEebCJ36rktPv22oGVEn6343skWZzCH/w4XqiK3SIiswQXaCuWk
         Vic7U5CjwCNxYdETDDPlO2SXOdsZP4xcevVAZjRatKOBUN7/JsD8240G9fncLRp1db6/
         1+9XwKd7ypeY6p4NLpeWfM/S+xm9TCvCWyKzEPY6yr8HJl3wBa6YlLcYQYRPsMuRLiBo
         F+QG0nNZN5iejxNHvpp72hWN6ypJdKJqoPNCgrRca2gUoJr7s+i/p48RW6lUOT6wAoNU
         nx+g==
X-Forwarded-Encrypted: i=1; AHgh+RpkW7WU5AZjKqeEQWXOqITKYs0mBcMjMrJ8hglUdEvk4KvcI7rVBU/uRijqJWW821M+RJ6Olsr6RAa5piOdR0xg@lists.infradead.org
X-Gm-Message-State: AFuF++n1ovK+dnFPkyUsg3AWBohx9PP9DMeKHWKPNMPMqxaccabC5Val
	6vjVZpYwU8h+TMUdaE0E1J9bMab0Yd9BHeoorgH+iGZqw9tbpB+2aUVdTj+K3RmSHmLd8s3IoHG
	kUHFD5DIcBizRC/WEljoatYzhh5HwNzUy7Acpw7aj
X-Gm-Gg: AR+sD113Ov7X90Am0yO9Pzqj5n/T9EsowZEoyfRAuT1lbVOF/lU0kWOCbpRblJsfmnG
	DguK27Q2XIJb4kport8FJZCgP7lQlbGImAHAa933E5YLW59ELC2hFnktUufpvTA1kBgrHlpJBDe
	nW+jxPT9o44SIhBNrSlIXN6CvUiah9x5adoHXzGEKyFqD//7HGa89n2XZqzwmxxrmw+LP+SjYHs
	PyMobp7Iv4DTPoj1b9SlpZaq0Aga+dYXtljyPY7qEsMCKidQUodUbyPLm3Ub7y+L+zkwHAvSFHD
	ffjCZY6AXpCi0B0ncEVldj2jd8BTX3T4CYKXpnv9Eb+aYP00cEbnLCKRYVhLUSguCc4/PY1QPxu
	Dt7Q=
X-Received: by 2002:a05:6214:2581:b0:90c:5613:6207 with SMTP id
 6a1803df08f44-90c5e98f815mr117797396d6.24.1787237900361; Thu, 20 Aug 2026
 07:58:20 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 20 Aug 2026 07:58:19 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 20 Aug 2026 07:58:19 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <j6bfvbzjivlcsu3slbnaoomxxqyypmfl2bupo3k5ipnt6fc5lo@e5ntbx7yd4qw>
References: <20260818-gmem-no-return-page-v2-0-5298f42d49bb@google.com>
 <20260818-gmem-no-return-page-v2-2-5298f42d49bb@google.com> <j6bfvbzjivlcsu3slbnaoomxxqyypmfl2bupo3k5ipnt6fc5lo@e5ntbx7yd4qw>
MIME-Version: 1.0
Date: Thu, 20 Aug 2026 07:58:19 -0700
X-Gm-Features: AcwNN1XCQ9iGI8G_VElrXcpcztiRZm0WAx2RfffvtaTy6EWJh0KRIqLKvmaMqec
Message-ID: <CAEvNRgEruoa4d_8Y1MpkdzbHg3j1Yv=-Y6w6Yy=v6mJgPajjWw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260820_075822_442680_A842812F 
X-CRM114-Status: GOOD (  26.09  )
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

> On Tue, Aug 18, 2026 at 09:15:53AM +0000, Ackerley Tng wrote:
>> From: Sean Christopherson <seanjc@google.com>
>>
>> When handling an RMP fault, KVM retrieves the PFN for a private GPA from
>> guest_memfd.
>>
>> Drop the page reference immediately after retrieving the PFN instead of
>> holding it across the entire handler so that the later patch can follow up
>> with completely not returning refcounted pages from kvm_gmem_get_pfn().
>
> Regarding this point:
>
>>
>> On a first look, existing RMP table handling (psmash and checking for
>> errors) might seem like it works fine, since truncation of the page from
>> guest_memfd would have called rmp_make_shared() and removed the PFN from
>> the RMP table. However, that is insufficient since a freed page may already
>> be used in a different SNP VM.
>
> In the code this patch is applied on top of, I think the kvm_gmem_get_pfn()
> ref is enough to avoid the reused-by-another-SNP-VM scenario until after
> caller releases the ref, so I think the above explanation should be adjusted
> to also be preparatory for "the later patch".
>

I think this sequence of events is possible:

CPU 0: sev_handle_rmp_fault()
CPU 0:   kvm_gmem_get_pfn()
CPU 0:     filemap_invalidate_lock()
CPU 0:     refcount++
CPU 0:     filemap_invalidate_unlock()
CPU 0:     refcount-- <<== because kvm_release_page_unused(page);

CPU 1: truncate()
CPU 1:   filemap_invalidate_lock()
CPU 1:   refcount--
CPU 1:     kvm_gmem_free_folio()
CPU 1:       sev_gmem_make_shared()
CPU 1:     folio is freed
CPU 1:   filemap_invalidate_unlock()

CPU 2: in some other SNP VM,
CPU 2: kvm_gmem_get_pfn() gets the freed folio
CPU 2:   sev_gmem_make_private()

CPU 0:   snp_lookup_rmpentry(pfn, &assigned, &rmp_level);
           <<== it's assigned but to some other SNP VM
CPU 0:   snp_rmptable_psmash(pfn);
           <<== this psmash would be smashing in some other SNP VM

And hence I think we do need to check for invalidations using the MMU
invalidation protocol.

> Other than that:
>
> Reviewed-by: Michael Roth <michael.roth@amd.com>
>
>>
>> Hence, adopt the MMU invalidation protocol to guard committing anything
>> based on the PFN.
>>
>> Signed-off-by: Sean Christopherson <seanjc@google.com>
>> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
>> ---
>>  arch/x86/kvm/svm/sev.c | 39 ++++++++++++++++++++++++---------------
>>  1 file changed, 24 insertions(+), 15 deletions(-)
>>
>> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
>> index b2738362a928b..b34b11d7f8fad 100644
>> --- a/arch/x86/kvm/svm/sev.c
>> +++ b/arch/x86/kvm/svm/sev.c
>> @@ -5003,6 +5003,7 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code)
>>  	struct kvm_memory_slot *slot;
>>  	struct kvm *kvm = vcpu->kvm;
>>  	int order, rmp_level, ret;
>> +	unsigned long mmu_seq;
>>  	struct page *page;
>>  	bool assigned;
>>  	kvm_pfn_t pfn;
>> @@ -5030,18 +5031,22 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code)
>>  		return;
>>  	}
>>
>> +	mmu_seq = kvm->mmu_invalidate_seq;
>> +	smp_rmb();
>> +
>>  	ret = kvm_gmem_get_pfn(kvm, slot, gfn, &pfn, &page, &order);
>>  	if (ret) {
>>  		pr_warn_ratelimited("SEV: Unexpected RMP fault, no backing page for private GPA 0x%llx\n",
>>  				    gpa);
>>  		return;
>>  	}
>> +	kvm_release_page_unused(page);
>>
>>  	ret = snp_lookup_rmpentry(pfn, &assigned, &rmp_level);
>>  	if (ret || !assigned) {
>>  		pr_warn_ratelimited("SEV: Unexpected RMP fault, no assigned RMP entry found for GPA 0x%llx PFN 0x%llx error %d\n",
>>  				    gpa, pfn, ret);
>> -		goto out_no_trace;
>> +		return;
>>  	}
>>
>>  	/*
>> @@ -5069,27 +5074,31 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code)
>>  	if (rmp_level == PG_LEVEL_4K)
>>  		goto out;
>>
>> -	ret = snp_rmptable_psmash(pfn);
>> -	if (ret) {
>> -		/*
>> -		 * Look it up again. If it's 4K now then the PSMASH may have
>> -		 * raced with another process and the issue has already resolved
>> -		 * itself. If it's not assigned, then this must have raced with
>> -		 * another process that made this page shared.
>> -		 */
>> -		if (!snp_lookup_rmpentry(pfn, &assigned, &rmp_level) &&
>> -		    ((assigned && rmp_level == PG_LEVEL_4K) || !assigned))
>> +	scoped_guard(read_lock, &kvm->mmu_lock) {
>> +		if (mmu_invalidate_retry_gfn(kvm, mmu_seq, gfn))
>>  			goto out;
>>
>> -		pr_warn_ratelimited("SEV: Unable to split RMP entry for GPA 0x%llx PFN 0x%llx ret %d\n",
>> -				    gpa, pfn, ret);
>> +		ret = snp_rmptable_psmash(pfn);
>> +		if (ret) {
>> +			/*
>> +			 * Look it up again. If it's 4K now then the PSMASH may
>> +			 * have raced with another process and the issue has
>> +			 * already resolved itself. If it's not assigned, then
>> +			 * this must have raced with another process that made
>> +			 * this page shared.
>> +			 */
>> +			if (!snp_lookup_rmpentry(pfn, &assigned, &rmp_level) &&
>> +			    ((assigned && rmp_level == PG_LEVEL_4K) || !assigned))
>> +				goto out;
>> +
>> +			pr_warn_ratelimited("SEV: Unable to split RMP entry for GPA 0x%llx PFN 0x%llx ret %d\n",
>> +					    gpa, pfn, ret);
>> +		}
>>  	}
>>
>>  	kvm_zap_gfn_range(kvm, gfn, gfn + PTRS_PER_PMD);
>>  out:
>>  	trace_kvm_rmp_fault(vcpu, gpa, pfn, error_code, rmp_level, ret);
>> -out_no_trace:
>> -	kvm_release_page_unused(page);
>>  }
>>
>>  static bool is_pfn_range_shared(kvm_pfn_t start, kvm_pfn_t end)
>>
>> --
>> 2.55.0.699.gb54405d56f-goog
>>

