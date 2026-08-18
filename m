Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E63C5DF80
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 09:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:MIME-Version:References:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RmZFJZDIQbP9rBN00CF0YOoIPLZVCPcoza0mwPaURTk=; b=dRDgz3C2FOcLv9p6f3tKJBZtiw
	tDm8DSJ93z9eA/Cy2IEVAu/Ng7g6yRJVtHx7saqRY3ETKfld42LOmGK3BDmPYJmCBYP7PTptWW89V
	Z/08GhdPWjiRzxyzgQa4skEINdvH6Mkzbad5yxYRhKZyuueVgpfdnsbJXSBgWFHSCFz50H7ITyf2P
	abhCUCWonc5qb6fUjewCLuroUQBhss1TR+FEM+eMi7yjOfeRGCnpTo3xqt3n/dzIZ0DuOBjUkZTjp
	w9hLn+V3cQKlg/bKQgqmfC5ZbKDGMGgNZPaL8+7/TDlwxkZKvBI92oRtprNU/Zz34NIbOXsjJbFm3
	KbRCrmGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwFkg-00000007ZEG-3sSa;
	Tue, 18 Aug 2026 09:04:58 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwFkf-00000007ZDT-0ZEQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 09:04:58 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so4930628a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 02:04:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787043895; cv=none;
        d=google.com; s=arc-20260327;
        b=Av/lfipu/gTY/xK/5zwSlnRM1KA+U+dxdLFH1J1FeusGjs39uhjwyCeE7CLuE8u3hM
         6J6974gQUO+bdLjqp3ZesOcK4x6neFi2yGkFmkglORVXqNWVc/Xh2nm1EEG6QMK40+YW
         70BEj0KKrQrkwi2JH18r0thlZKMC3iHkrddlx2PMMwBAVGcqpl3uMXkxYBKtWaRgBodj
         jTGWPpWHY72yzYClX8Mxe7buz0z/SiUrYNirFbAuf3+Ss3c1KNK6G5Rk1V7ZeVNBr9aT
         czw9vyE4dLdQInjW7kiyoAtrqdn08LQOtBSdST0IXKtHzZX2TkKMe64LrKAj8LjMecnO
         0Flg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=RmZFJZDIQbP9rBN00CF0YOoIPLZVCPcoza0mwPaURTk=;
        fh=wRglxDfn+Nl//C6Qy85RzhyRa8HKgjNwXbawC3tjOWQ=;
        b=OolkmDQoLHwL6XDOaL8wFCg9UAY6MiBzX/RCz2oQxNhcCPyrBZFekhIzIXe8Kk+jyO
         rBtzD9jcfioQC7xPpMPshfIv+KJTNnlBtkaoef6Yeo6CFVAUy9WylgQYUqmDJ9kbYM8t
         c72zVzVqDFCu+D0npVA/1Z1J293iyaqO9C26JcCu5dlQkSV9KciZ3nZvqcKk9R5LQHeO
         oaGpE7D/zZySPyppsUmYmTi7iJRjBHgBWo7ipX+A4tiXwt+usxxOdBlWIknSzCH33pfQ
         gtOxAtByA7+fnHII+Rs0UsqNGT9eIa6EvEOkD5/qDtSPMsiY5bdhv8D9qVrDBkhIRGu/
         bjGA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787043895; x=1787648695; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RmZFJZDIQbP9rBN00CF0YOoIPLZVCPcoza0mwPaURTk=;
        b=lCkLkxntx51IRqzvT4bErUcSTiOWXHfdWy2wu2IwecK2BmmhaYC7PAwXQHa/MBSr/t
         aqYRjGA9tddZUOzt2b95Da7GC8+FuLKoLRMprD+NKb2n7MuaqwKD4lbn2DnWaqHXU5fN
         6qJxyQBoYv6QYvS/Lg7mzAN9Hg9338Nhby8CCH2xbdu0/VeyuKAwmrudu5rEfHS3htJr
         ROpN8mH1fof2Y0Trm/7lpGMA51fMS+O+vveiij8A07HolJV1197JXKsCDLUYGuGo02Xe
         BzNri4Cz4+Z2HM1Q5JzsVrjWCcFXpogG2wkQBH+ZjZsu9d8jw/5Onnozo4IjZ9RUlQoA
         fwyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787043895; x=1787648695;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RmZFJZDIQbP9rBN00CF0YOoIPLZVCPcoza0mwPaURTk=;
        b=f0WroEqqdCY+VuxWOCZgRqGTy9OXJKqLY7wVhYZFttyqeb3DDEH0Vevn4ClzKIMYQd
         V1HZ46v4cV1eg+dTDhZtDUh525czYUsuCOjZEtQ8qcFtMj1wxwzrDS/SO2jcrIIg0P2r
         HtFwh7JglquZXoz4EXdy8N3uLE+fY47oJrm5pk5O5My2laA+eeUQAO43fYTe3Tivt34m
         EZjfvO0Fw9A+m1ILJNTI4pjGvv/i5Wg8hizMkKSiXE5IR86Bw/EHpoGagTgdIjvrYK/V
         caRzk5gNSlwAFR9naoeRgGxUoV6arpQ8QGnmEEYC2NcTAnWK4GtsKy5mLZ1S/eWqzXCM
         q/aA==
X-Forwarded-Encrypted: i=1; AHgh+RoMw55toach5jxaVDnN8iFinOEAZ4ISsvFyWlTUgyUYp8KBbDnWRCN7CbxTBKDPVuwUS8v1CikPsnxMls0ugWg+@lists.infradead.org
X-Gm-Message-State: AOJu0YyWMCc2QkLzZ7GP68F2adBGq18xf2Bfb/XojPUmALYYH0BqTESU
	hkiB7pC/mxf8A90eMZxAU46nVdvgGfMvssZynO7szyW8lLZK212nsVgMYMcBcFlnoRWjM1Z4F4Z
	c7bwZonRl6KZxJzxPL6PPMAK6fG/EvF0I4zLL/7Wu
X-Gm-Gg: AR+sD13X0oGNii3JF3bMxKuorml2+jhXLkrPFy+NrfTINqGtPnpsNrjn1GYUM5PHrg9
	AKpxyRcSYhGBdrzvEKTyUJndy5xwuRqRzG0ecTpVlBur+aVzrngfe3luitRvMon2kobyb92Rmqe
	8/2uuqY0inRBaLxFCITCUTWc2TbT0D6kGD2AaFXUG9RMt0jZLgto181gfUAqKLNi3/bmCPai3e1
	yVda3W+6H8nBfkw65y8uh1GR5jQjEiisUJLDJ5kuXTeAEv2uHuI5VNYAPLLNsk0nqmmrh7s7ul/
	42WyX+34V8BRlhi77yFGNBYzbiP0ZzPZcuExOo6vS8mwCK/0MW6+0kvqB+xOg+4j67ZpwEwIGk0
	=
X-Received: by 2002:a17:90b:4f84:b0:38e:fea2:df53 with SMTP id
 98e67ed59e1d1-3933bd186f4mr33702008a91.4.1787043894543; Tue, 18 Aug 2026
 02:04:54 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 18 Aug 2026 02:04:52 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 18 Aug 2026 02:04:52 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <aoQT00rN8a5TQ88+@yzhao56-desk.sh.intel.com>
References: <20260818-gmem-no-return-page-v1-0-4f8d939efdbc@google.com>
 <20260818-gmem-no-return-page-v1-2-4f8d939efdbc@google.com> <aoQT00rN8a5TQ88+@yzhao56-desk.sh.intel.com>
MIME-Version: 1.0
Date: Tue, 18 Aug 2026 02:04:52 -0700
X-Gm-Features: AcwNN1UM5CcnTZUcMQPeXSglijNaI2oVBWDnjgv4CaplShdt0x4B0EyQ_Yo4Fyc
Message-ID: <CAEvNRgGiYFaKAH-qAWy4W5nrmP5fYR0AkhU_t0X_NdTTcxgv7g@mail.gmail.com>
Subject: Re: [PATCH 2/4] KVM: SEV: Drop page refcount early during RMP fault handling
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Ashish Kalra <ashish.kalra@amd.com>, 
	Michael Roth <michael.roth@amd.com>, Brijesh Singh <brijesh.singh@amd.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, David Hildenbrand <david@kernel.org>, Fuad Tabba <tabba@google.com>, 
	"Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, Vishal Annapurve <vannapurve@google.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_020457_183837_A6B488ED 
X-CRM114-Status: GOOD (  17.51  )
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

Yan Zhao <yan.y.zhao@intel.com> writes:

> On Tue, Aug 18, 2026 at 08:12:36AM +0000, Ackerley Tng wrote:
>> When handling an RMP fault, KVM retrieves the PFN for a private GPA from
>> guest_memfd. The page reference taken during PFN lookup is not needed for
>> the remainder of the handler, as checking the RMP entry, splitting the
>> 2MB page via PSMASH, and zapping shadow page tables only operate on PFNs.
>>
>> Drop the page reference immediately after retrieving the PFN instead of
>> holding it across the entire handler.
>>
>> A later patch will follow up with completely not returning refcounted pages
>> from kvm_gmem_get_pfn().
>>
>> No functional change intended.
>>
>> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
>> ---
>>  arch/x86/kvm/svm/sev.c | 5 ++---
>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
>> index b2738362a928b..19c31fa944e34 100644
>> --- a/arch/x86/kvm/svm/sev.c
>> +++ b/arch/x86/kvm/svm/sev.c
>> @@ -5036,12 +5036,13 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code)
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
> Hi Ackerley,
>
> You missed the parts in [1] which save mmu_seq before invoking kvm_gmem_get_pfn(),
> +       mmu_seq = kvm->mmu_invalidate_seq;
> +       smp_rmb();
>
> and check mmu_invalidate_retry_gfn() before snp_rmptable_psmash(pfn):
>
> +       scoped_guard(read_lock)(&kvm->mmu_lock) {
> +               if (mmu_invalidate_retry_gfn(kvm, mmu_seq, gfn))
>                         goto out;
>
> [1] https://lore.kernel.org/all/an5RJYTwlYeym--O@google.com/

I thought it wasn't necessary after the fix in patch 1 but the
maintainer is always right, lol and Sashiko is right too. I'm preparing
a v2.

>>  	/*
>> @@ -5088,8 +5089,6 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code)
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

