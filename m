Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F7EAC5DF89
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 13:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RKNX+Kx6HqLYYsW8IMt0XRzUyioNItYEZfBrRy9B9xA=; b=LIq3GhWiNi1yz7BMKlc2rDliea
	Xw551COcnDF0N+qPnhAyvxQKIFou5U5xqHGycmP15EUA5JQm6PkpF9cq9FBm4+/dPYkdjv3/sOnuG
	cQaX+70XbHQFRP/p1Wn9l/LICdaS5in6JmgivKlmlJV8hC3P236xE7Ko4JuPecVEIx75rbjrbdf6P
	AfAhIWv+DNpgWjx2HGIRsEfQzpdltUTlE3W+tWKy6YNp6R1LUJMItV6ML1dLGpwBM4akcjMvxxtJ0
	/TiS9qYJMNsOpGDAtRAGi8bZKKucZZzAeog1DImMN+ZHZhh90f9lNhsE36wwRHg13j2EVHrhtlpxt
	f5fn4fcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPfV-0000000DTQB-0K7Z;
	Fri, 21 Aug 2026 13:52:25 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPfR-0000000DTPT-3R0W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 13:52:23 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-47f92e3c14bso889770f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 06:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787320340; x=1787925140; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RKNX+Kx6HqLYYsW8IMt0XRzUyioNItYEZfBrRy9B9xA=;
        b=iEdzXmNu5Sky3B7oJz+NlJdn5pyBWThpEsiYp1mUsytiJ4PAC/MgI5ty3uvmzOqBg/
         9HkS3YgUMcE4c6THCZrIugICHptLOFhcqekS+0VIconKAtSd8fqpiVMeb/KnBCW5dzBg
         ZPLNCGq2QS+AX2q/pDRsvU/IZ9Ni6Ftm7YU6vrEnBvwj2gw+wtf3C/h6Rl+c6RFH9ei+
         vyqNqeiIK4CyOTpDYZgzMeTtzqrZzdM2a907CosIY2IF/JjrS+ijzUQ+8jySP+OFlQzI
         EvIYwIH/seayt43d2FOAkdH93AWYsA5vIh0U2x/D18Hn6HKmL3VwzxRS5+nKqZolrUsN
         rVVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787320340; x=1787925140;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RKNX+Kx6HqLYYsW8IMt0XRzUyioNItYEZfBrRy9B9xA=;
        b=s5aHYw0QqEaDA4Z2Ja0ZKbRhJ/AKYHFy1LUtE34Eh2xpSUnplSWBjS9EuXFxXBL8m1
         w+cVrNDfpX47C8LZVt7jzTMY2HuSh7s6BURJyN1SRwu3VJBeuDowZWKj0u9TaAzvwVLG
         ThcGdF/eY65Ud+50+TXyxN/ZpYuE2wUY+xEasF0S4ZFaW7AHJKu8Sncm5GvLFAB1v886
         bZ2hdnxJ8fkzRO0shOapZW0lrZysp4pXLkSMaQJKDGsjozb90OqJkm5wujep3wIcSZ/3
         2UxtbrQoyb6QmQwnlB4lC+qrep15ozsaGEXw9R+04pTVhWmF5WXPwpyoxEzXoBo+wrzV
         xFvg==
X-Forwarded-Encrypted: i=1; AHgh+RpeGeuSuRatU2LqxpbeBdyeMYGBRiSvkhS1aVfwK3g2c7BpF1gbfR5CCQEfezkS+SPalKt1iHznfjTN9exmVqaQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzY5bEsBm9A1u9t/Mi/eW82CBPJKLbgeZrwTJYDq+XpUu/H+SRP
	EnSVp8QZS01UrVPoP+SbLVA5YYCRUtDyTcDB3j40hUG8SnOW3iDjitmt
X-Gm-Gg: AR+sD11n8S7MLEzjeKS9eFuTmtmR9jzhhhFiPRFUl6FIBwFTWhLnURgnloZoJyg9vmQ
	2LOTo1JUvqXnbfYNVyGk/ALMP9qDYCd1PyVJ6+GpsdHJCSPXN+sVrTWcwEeLKJHDjwxPuPl2EpZ
	481QL06ppXMprdx4s1qxBUXuW1VK8STBlUbvnLQDmVcto+jXe9Qu75+AJUT3XWZgQ63sWLbP3Dn
	axPaA/OnPrQh2nxJb2Gzi+qJtifxSJNopWXyOeVlTeM9YgMLxgGThcV4QLs/d2GDqJH9n706wOn
	K6cNh+tI8uJNr8Gf7Ix/QLXP6q6NZdW0uj3KmfD2/V5HK4CpbpuOrIJxKVrv5pMMjjWAUZ99pVl
	4WAr6dYj9trVj4cpdkTr13qV/U0Z5wlkd6L6C02XXM+X79E/FWivFH3hb5cDfVgsoeiF0r1xIfM
	wPpDUZz08of54UmSRcaFuYtD+XGaCoTTllVxdvZOIX8UYrLWGN2BRyBWt+JfXiy7mFfL5zub9uY
	FbO
X-Received: by 2002:a05:600c:a087:b0:499:86ce:465e with SMTP id 5b1f17b1804b1-499b8324b09mr117557705e9.4.1787320339715;
        Fri, 21 Aug 2026 06:52:19 -0700 (PDT)
Received: from [10.45.28.226] ([15.248.3.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14b80a5sm17753598f8f.24.2026.08.21.06.52.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 06:52:19 -0700 (PDT)
Message-ID: <0365d77d-616b-47f7-a5f2-3388bad692a1@gmail.com>
Date: Fri, 21 Aug 2026 14:52:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] KVM: arm64: Add pre_fault_memory implementation
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, pbonzini@redhat.com,
 joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
 shuah@kernel.org, corbet@lwn.net, vladimir.murzin@arm.com,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 isaku.yamahata@intel.com, Jack Thomson <jackabt@amazon.com>
References: <20260612162354.73378-1-jackabt.amazon@gmail.com>
 <20260612162354.73378-3-jackabt.amazon@gmail.com> <alEXtW7w-rqlNG09@raptor>
Content-Language: en-US
From: "Thomson, Jack" <jackabt.amazon@gmail.com>
In-Reply-To: <alEXtW7w-rqlNG09@raptor>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_065222_100395_C3C7A440 
X-CRM114-Status: GOOD (  33.44  )
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

Hi Alex,

On 10/07/2026 5:03 pm, Alexandru Elisei wrote:
>> +	unsigned long		*page_size;
> 
> As far as I know, fault handling was reworked to use struct
> kvm_s2_fault_desc to store the fault information that user_mem_abort()
> needs to handle the fault.  Adding a 'page_size' field, that represents the
> result of the gpa mapping process, might not be desirable.
> 

Yeah agreed, Vincent suggested a separate output struct that
kvm_s2_fault_map() fills with what was actually mapped. I'll do that in
v6 thanks!

>> +	struct kvm_vcpu_fault_info *fault_info = &vcpu->arch.fault;
>> +	struct kvm_vcpu_fault_info fault_backup = *fault_info;
> 
> I'm not sure you need to make a backup here. vcpu->arch.fault is populated
> each time the CPU takes a fault.
> 

So this was actually flagged up by sashiko when I ran it before
submission, it suggested handling this for the case in which the vCPU
exited for MMIO, the next KVM_RUN calls kvm_handle_mmio_return which
uses the vcu->arch.fault.esr_el2. I'll add some comments to this maybe
to explain why this would be needed.

>> +	if (memslot->flags & KVM_MEMSLOT_INVALID) {
> 
> I don't think that's something we should care about, the flag can be set
> immediately after the check as the function doesn't take kvm->slots_lock.
> kvm_vcpu_prefault_memory() takes the srcu lock in read mode, so the
> function is safe to run even if userspace does something silly like
> deleting a memslot at the same time that it's prefaulting the guest memory
> it represents.

I was there not as much for safety, but rather to pick up that error.
This way rather than userspace getting an -EFAULT it can just retry.
This is the same way it is handled in x86 as well.

> 
> It might not be obvious, but taking kvm->mmu_lock in read mode does not
> guarantee that gpa will be mapped when kvm_pgtable_get_leaf() returns.
> That's because a concurrent kvm_pgtable_stage2_map() for a different gpa
> can destroy the mapping of the current gpa.
[ ... ]
> The kvm->mmu_lock is dropped here, which means that it is possible for a
> MMU notifier callback to have just unmapped the entire stage 2 for the VM.
> 

Yeah as we mentioned in the other thread, this is best effort and we
can't guarantee that is survives the return. We do this for forward
progression, reporting the correct advance size for ranges which are
already mapped, instead of repeating the full dance for every page of them.

> 
> handle_access_fault() will fail if the mapping is gone. But I guess that's
> fine if the ioctl does not guarantee that memory is still mapped after it
> completes.


Yeah I think it's fine and will degrade to a no-op in this case.

> 
> Also, the documentation that this patch adds says: 'On arm64, newly created
> stage-2 PTEs are marked Accessed'. Does not say anything about marking
> **existing** ptes as accessed. Would be useful to explain the code does it.
> 

Ack, will do thanks!

>> +		hva = gfn_to_hva_memslot_prot(memslot, gfn, NULL);
> 
> There's gfn_to_hva_memslot(memslot, gfn), is that what you are looking for?
> 

I think gfn_to_hva_memslot() resolves the hva for write, so would fail
on KVM_MEM_READONLY slots, and prefualting is a read. Also this mirrors
the guest abort path so matches the way the run path resolves the HVA.

-- 
Thanks,
Jack

