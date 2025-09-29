Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC54CAC5BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 13:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ipfI8eVx3bzgfWjoq31uPWRXd4Smibc+RtoSzpX+z2A=; b=srA1BqmyDtrfJ6MA88ulAWlc98
	n2BTLoNK4d/7B3bOQu6/oMRu/FbtO8LsVeTywU6d+vdU3ngd7H+Lr9FnqRcxj4Sc8e302rbwKSB6S
	hO/Wg0MtC18HFMiJjSYzbGJtlbZvkm1kaPJ6sAxtj7+V2LoQn5YVPRUrDEWPsYoh7iaG5QFDA2PwZ
	0zGJX0Ta+yZgpbFIKE7PQur+yRX+4yFMMnRQrEl/O8giPleKjEGJQVQu692oi09AT3y/LuVasHUMc
	/sqU3CiRWMIKD+P14KyfXyEsPw/X778WPS/Zjq4B0aSFz7ofKi4+07euSS3Un3+n7cOjnLNgAVdox
	UMsUBY+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3EPl-00000002bVb-3PaC;
	Mon, 29 Sep 2025 13:59:41 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3EPj-00000002bUF-3Z4z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 13:59:41 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3ee155e0c08so2500579f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 06:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759154378; x=1759759178; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ipfI8eVx3bzgfWjoq31uPWRXd4Smibc+RtoSzpX+z2A=;
        b=c7WL1efCPWDCW6wvwUdDR9BgoxHBE2SufjGCWkO5cL9dAcwzK99HrZSbOCdo5XmD6j
         69Zsywz0NPECTPlHMO+pRWTDGjtUvtGJTKt1nMsuxYBMrmx2zaHzXwd8ymTqhCDJjwOe
         TT49oNGU4WdsrBW+wd3yyScCaOcGZevm8mpFhdJ9+hvvATLpN3Du9YQpCGN3Z4Dr98E7
         tAAhsfHyauSFz8rsMBglTdtfiAr3IcPBpOi3Iro+ecj8DePXuKrwXB9ijbMfGllwKncU
         S1VNomoDGZGmyolNmopoc9EVHDAEYZg/fbFBFuPkNUEf9X3ZO3tyI+rI8oREFBu1+sUm
         Hxxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759154378; x=1759759178;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ipfI8eVx3bzgfWjoq31uPWRXd4Smibc+RtoSzpX+z2A=;
        b=Ynl2sJelo6Z0i/a/TXM9Lll0E2uN5jDgVUB51xB7ux2tYQuiyRhqBLWnJ+PyoLQtKm
         GwexJkaihochEsEqO2zk4CXvH26GlvsbjsAyYIeti2PYfNjzOPFe9VU00eWl1XIiS3re
         AWxixw6BVwqFcTcjMmpPYT52gRca8QUoaUcqXM6bPYkksvvM+yRg5IyxMQ1/prRYB116
         3LNGy/GHUdE+TfIr7uOmPkss/w2s9mvP4t/by7RA6zXrFRGQbtWqbCBvRGgYRTB9GUK9
         cbJu488ThO37aG6lBWTlObRlAyYj/LujO0crAmIWf2sX5szLoyKJxWscTSoWEIhQbRmJ
         H2Vw==
X-Forwarded-Encrypted: i=1; AJvYcCWKyjRvlIMnyh51e4kih2SnD0MB8apFY692VoAGyDVni6i3ME9MTJuUpCjqKCqUCM5Xgs+2f4mB5nOdYDxrgfYp@lists.infradead.org
X-Gm-Message-State: AOJu0YzEGNnoCpAoH0Oejz/hPzdA12IMP+9z/QBNpdi4t9vvg5eTHnAY
	3Buo3pgaie9pvd+Z0tPJKVsva7wmN7VCqOlQAs4x2S1MIp32w3oBACzU
X-Gm-Gg: ASbGncvH0/2Nry8mUW7GfaeZ5kC5r01Tz5iYDem3OCMp+uBdX6VC5tlA+AtRphZvTLe
	JrSXSGzFQSIIrakiwWAdevAJJGWQMluD9eUXLTDz+9SOs9DO3zzZQAZQI/Oiq5OJUkB2fv3+liZ
	ksSftCa9SY/Uo17phbFmpfx3rgoTSUdE02gMDkqOd7+wV8FyccvNldsgldSCtkF44dBNSrHvIMv
	ZunV+UGRIjBNSmmTiIJgNSg131leKeXkRk3xMbql8y1q0MhHYXDq0TlQGfY1bBCzsgAO+7srebu
	ktkG92GFPqMatLHWt9ORloSpSBcUMJ1DkhSYLM+K4nBMyUUu6b9ZmfUJzLBKZeAMrigYJBbkHDI
	E9t25eGq8YKy44Vj++CvASSh75xgd8JV84FvEVnA=
X-Google-Smtp-Source: AGHT+IGmk8eIupNHH6e8ZECR90n/BecDA3d0fPOnthyKhQCMVja8jB69/O5wl6BImeD5SJG0fNGoiA==
X-Received: by 2002:a05:6000:2203:b0:3ea:63d:44ca with SMTP id ffacd0b85a97d-40e4adceb15mr13337551f8f.32.1759154377256;
        Mon, 29 Sep 2025 06:59:37 -0700 (PDT)
Received: from [10.24.66.14] ([15.248.2.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fc88b0779sm18227650f8f.58.2025.09.29.06.59.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 06:59:37 -0700 (PDT)
Message-ID: <7d109638-3d26-443a-b24d-eb7a0059b80f@gmail.com>
Date: Mon, 29 Sep 2025 14:59:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] KVM: arm64: Add pre_fault_memory implementation
Content-Language: en-GB
To: Oliver Upton <oliver.upton@linux.dev>
Cc: maz@kernel.org, pbonzini@redhat.com, joey.gouly@arm.com,
 suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com,
 will@kernel.org, shuah@kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, isaku.yamahata@intel.com,
 roypat@amazon.co.uk, kalyazin@amazon.co.uk, jackabt@amazon.com
References: <20250911134648.58945-1-jackabt.amazon@gmail.com>
 <20250911134648.58945-4-jackabt.amazon@gmail.com>
 <aMMYKqWsAZ4y0WI7@linux.dev>
From: "Thomson, Jack" <jackabt.amazon@gmail.com>
In-Reply-To: <aMMYKqWsAZ4y0WI7@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_065939_929450_E37A4694 
X-CRM114-Status: GOOD (  23.17  )
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

Hi Oliver,

Thanks for reviewing!

On 11/09/2025 7:42 pm, Oliver Upton wrote:
> On Thu, Sep 11, 2025 at 02:46:45PM +0100, Jack Thomson wrote:
>> @@ -1607,7 +1611,7 @@ static int __user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>>   			    struct kvm_s2_trans *nested,
>>   			    struct kvm_memory_slot *memslot,
>>   			    long *page_size, unsigned long hva,
>> -			    bool fault_is_perm)
>> +			    bool fault_is_perm, bool pre_fault)
>>   {
>>   	int ret = 0;
>>   	bool topup_memcache;
>> @@ -1631,10 +1635,13 @@ static int __user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>>   	vm_flags_t vm_flags;
>>   	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_MEMABORT_FLAGS;
>>   
>> +	if (pre_fault)
>> +		flags |= KVM_PGTABLE_WALK_PRE_FAULT;
>> +
>>   	if (fault_is_perm)
>>   		fault_granule = kvm_vcpu_trap_get_perm_fault_granule(vcpu);
>> -	write_fault = kvm_is_write_fault(vcpu);
>> -	exec_fault = kvm_vcpu_trap_is_exec_fault(vcpu);
>> +	write_fault = !pre_fault && kvm_is_write_fault(vcpu);
>> +	exec_fault = !pre_fault && kvm_vcpu_trap_is_exec_fault(vcpu);
> 
> I'm not a fan of this. While user_mem_abort() is already a sloppy mess,
> one thing we could reliably assume is the presence of a valid fault
> context. Now we need to remember to special-case our interpretation of a
> fault on whether or not we're getting invoked for a pre-fault.
> 
> I'd rather see the pre-fault infrastructure compose a synthetic fault
> context (HPFAR_EL2, ESR_EL2, etc.). It places the complexity where it
> belongs and the rest of the abort handling code should 'just work'.
> 

Agreed, it looks much better with the synthetic abort. Is this the
approach you had in mind?

+long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
+				    struct kvm_pre_fault_memory *range)
+{
+	int ret, idx;
+	hva_t hva;
+	phys_addr_t end;
+	u64 esr, hpfar;
+	struct kvm_memory_slot *memslot;
+	struct kvm_vcpu_fault_info *fault_info;
+
+	long page_size = PAGE_SIZE;
+	phys_addr_t ipa = range->gpa;
+	gfn_t gfn = gpa_to_gfn(range->gpa);
+
+	idx = srcu_read_lock(&vcpu->kvm->srcu);
+
+	if (ipa >= kvm_phys_size(vcpu->arch.hw_mmu)) {
+		ret = -ENOENT;
+		goto out_unlock;
+	}
+
+	memslot = gfn_to_memslot(vcpu->kvm, gfn);
+	if (!memslot) {
+		ret = -ENOENT;
+		goto out_unlock;
+	}
+
+	fault_info = &vcpu->arch.fault;
+
+	esr = fault_info->esr_el2;
+	hpfar = fault_info->hpfar_el2;
+
+	fault_info->esr_el2 = ESR_ELx_FSC_ACCESS_L(KVM_PGTABLE_LAST_LEVEL);
+	fault_info->hpfar_el2 = HPFAR_EL2_NS |
+		((ipa >> (12 - HPFAR_EL2_FIPA_SHIFT)) & HPFAR_EL2_FIPA_MASK);
+
+	if (kvm_slot_has_gmem(memslot)) {
+		ret = gmem_abort(vcpu, ipa, NULL, memslot, false);
+	} else {
+		hva = gfn_to_hva_memslot_prot(memslot, gfn, NULL);
+		if (kvm_is_error_hva(hva)) {
+			ret = -EFAULT;
+			goto out;
+		}
+		ret = user_mem_abort(vcpu, ipa, NULL, memslot, &page_size, hva,
+				     false);
+	}
+
+	if (ret < 0)
+		goto out;
+
+	end = (range->gpa & ~(page_size - 1)) + page_size;
+	ret = min(range->size, end - range->gpa);
+
+out:
+	fault_info->esr_el2 = esr;
+	fault_info->hpfar_el2 = hpfar;
+out_unlock:
+	srcu_read_unlock(&vcpu->kvm->srcu, idx);
+	return ret;
+}

>> +long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
>> +				    struct kvm_pre_fault_memory *range)
>> +{
>> +	int r;
>> +	hva_t hva;
>> +	phys_addr_t end;
>> +	long page_size;
>> +	struct kvm_memory_slot *memslot;
>> +	phys_addr_t ipa = range->gpa;
>> +	gfn_t gfn = gpa_to_gfn(range->gpa);
>> +
>> +	while (true) {
>> +		page_size = PAGE_SIZE;
>> +		memslot = gfn_to_memslot(vcpu->kvm, gfn);
>> +		if (!memslot)
>> +			return -ENOENT;
>> +
>> +		if (kvm_slot_has_gmem(memslot)) {
>> +			r = __gmem_abort(vcpu, ipa, NULL, memslot, false, true);
>> +		} else {
>> +			hva = gfn_to_hva_memslot_prot(memslot, gfn, NULL);
>> +			if (kvm_is_error_hva(hva))
>> +				return -EFAULT;
>> +			r = __user_mem_abort(vcpu, ipa, NULL, memslot, &page_size, hva, false,
>> +					     true);
>> +		}
>> +
>> +		if (r != -EAGAIN)
>> +			break;
>> +
>> +		if (signal_pending(current))
>> +			return -EINTR;
>> +
>> +		if (kvm_check_request(KVM_REQ_VM_DEAD, vcpu))
>> +			return -EIO;
>> +
>> +		cond_resched();
>> +	};
> 
> Why do we need another retry loop? Looks like we've already got one in
> the arch-generic code.
>

Good point thanks, I've removed that now.

> 
> Thanks,
> Oliver

Thanks,
Jack

