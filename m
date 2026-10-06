Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E0DCA5FFD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 03:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fNeoxAcpqLuP6xVkV/ooADVzEQHG7XjJg+hDhApi/Aw=; b=NmAlBI6bzXTDKiPR+c6rgyAbM6
	rCFV5HJkxUOxpjKnB8zPfBQ+LBAPWJdTRnwn8vvEVCnzWcg7cW90B2HkuD7j4IVRfWdkuKHL+Txsl
	CkGa6nc5O7bWBbyD7XfwzsOjUqj5agMs8qgY1p8a3wnlYVTf3IiOqedIYNjDo4PaNwXjjbXV/WMuS
	1mfrK46EVbjhc+55sxGrfZhS00IBnqIjpmfNsaJ5q2rFs7UtZ4mHSlfTc9f3ghCM0JNlXYVecF0SJ
	r6iTSrwMub8mL/wef+kSFzQKMuhG9m2QGQjO8ZOeMvvA+wuLWzDtvMTnaG0wiATmF0OZx5yK+fO57
	mjmbGk/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDvX1-0000000HXh3-3Ba1;
	Tue, 06 Oct 2026 03:07:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDvWy-0000000HXgQ-2XPM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 03:07:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791256071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fNeoxAcpqLuP6xVkV/ooADVzEQHG7XjJg+hDhApi/Aw=;
	b=eo0Br1OrXAZZ0HcBx5Lnqd8nVbRSv08SNjIHebzgAEP3ms+DzVctNCTp0sdWr9AVpPaCn+
	jQnXLPll0qt6nqKHAOcBq8oyE6jcSY0XRd1W3+dArrYagjOQYkNjZXqEwRBIvi8+p/GugE
	ERw87b9naA5bULWe3D0Ryn8T7qmZT4o=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-373-_bdt5mXTMV6a9WDti_oNwA-1; Mon, 05 Oct 2026 23:07:49 -0400
X-MC-Unique: _bdt5mXTMV6a9WDti_oNwA-1
X-Mimecast-MFC-AGG-ID: _bdt5mXTMV6a9WDti_oNwA_1791256069
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc72777faa2so1709385a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 20:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791256069; x=1791860869;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fNeoxAcpqLuP6xVkV/ooADVzEQHG7XjJg+hDhApi/Aw=;
        b=axpuFd+VrsNwqSWK3zP2b/hGGpbIUOxh3ncJnazULRNNmhzXUhwFl7LFzquXovSKge
         Clep6DcRvZQ8IB7G1TTk+NpJkW9mKdG3ZyMcVF6ibjeIPU5ZeerTCQDJAOQjUcBCwJPH
         obhPS4VJ0G/diq864vrRi4524NWMIsYwjBzpBTiYn3TRSiqB/d7Z8xDVJYorNfZuF83h
         PQUrbesLzW8cRdaGGU3Up45/Rp5rhVk0VKtJsYFESsISP204fgL3QQxFhZgR+fhjE9ny
         mlENV08e/vzA2oO9OxJIc0Htb78+dCMNZBexmAlgcTSBMr7NEzMoISj9XP75YaZsogHR
         a3JA==
X-Forwarded-Encrypted: i=1; AKwUvBxaQf3nGS3d1qOtUTb6V2FpojoBOkAE4sU5gmZpF1OWDPRbU2l7M0sdO77uX8d4A3jQfjh0hXWTOiDbs+69al1U@lists.infradead.org
X-Gm-Message-State: AFuF++n5cgao7ujHm019V5s9c5U2bOOaaxW1L78Q8zeJJgO+31fXt7d8
	bUwLvlJ4bfZZhggI32L+BNRsrBWhXn6PlQ/Y6DkRHW6+Y6zZsT6u7TvUpJ5tUknDFSxtOCXnrpo
	OTcj+MAlSaQUF0Q/OPOF2KgSeCLWQygftcFceIuOPl1LTqGCsrgL0v87CU+zXvUODYJ0cIjYW0l
	g6
X-Gm-Gg: AYBFou3a8UYO/psv1W5R6VjW5tupRuSw2d/P5u5CwwrCsqKOY+p9qe1d+yMfamKYJQv
	hDWEcxYzJiUhEjIMf6YF1jqR82Y1QiQI1q0/I0U2xma8Fl98zKXq1jsfQ9cQ7Qe346jBWnBkV+H
	ISBIPp6qKdLe7R7lKZYpP+jXUKZTNPQPz43k2o/j8xGdetQGcguUz0+CwU8Ad+X1QCPW5RYQQ1t
	X4WlnreSVgyfiA1uiSs/ZPs1YZyhqPwSPiZZNvf9h4othXagL1Cux8kp4NgQzHHEcjC9NGySDY6
	ozdZfZBX0kHWr4Md10AzXN+4VCxOPlSWCEYFnL8TOspl0v7qvxuQ1Lw+huBp9PkKW0FpCj5E1CH
	cWm3Njv4od7rvztJE2PGCKwaUtK2+qiTD5psrPgX3wA==
X-Received: by 2002:a05:6a21:1392:b0:3e0:c57c:200b with SMTP id adf61e73a8af0-3e0d6cda067mr8229887637.40.1791256068596;
        Mon, 05 Oct 2026 20:07:48 -0700 (PDT)
X-Received: by 2002:a05:6a21:1392:b0:3e0:c57c:200b with SMTP id adf61e73a8af0-3e0d6cda067mr8229853637.40.1791256068087;
        Mon, 05 Oct 2026 20:07:48 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6b542fc9sm1722095a12.1.2026.10.05.20.07.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 20:07:46 -0700 (PDT)
Message-ID: <d8bdfcaf-3b4f-4ab1-9b73-597c60bbb60b@redhat.com>
Date: Tue, 6 Oct 2026 13:07:37 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 13/23] KVM: arm64: Abstract out memory abort handling
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
References: <20261005090754.2140522-1-suzuki.poulose@arm.com>
 <20261005090754.2140522-14-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261005090754.2140522-14-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0XcQNgQZu3__a5hzr3A3uu918vuPs2b6wZfmGcCPBM0_1791256069
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_200752_728240_68030ED3 
X-CRM114-Status: GOOD (  21.15  )
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

On 10/5/26 7:07 PM, Suzuki K Poulose wrote:
> Move the memory abort handling under VM specific s2 operation.
> 
> Tested-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v21:
>   - Rename protected_vm_mem_abort => protected_pkvm_mem_abort for consistency
>     with the other callbacks.
> ---
>   arch/arm64/include/asm/kvm_host.h |  2 ++
>   arch/arm64/kvm/mmu.c              | 33 ++++++++++++++++++-------------
>   2 files changed, 21 insertions(+), 14 deletions(-)
> 

One nitpick below. In either way:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 0778c308ce597..7cb343583953d 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -156,6 +156,7 @@ struct kvm_vcpu_ops {
>   };
>   
>   struct kvm_gfn_range;
> +struct kvm_s2_fault_desc;
>   
>   struct kvm_vm_s2_ops {
>   	bool (*vm_age_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
> @@ -166,6 +167,7 @@ struct kvm_vm_s2_ops {
>   	void (*vm_stage2_unmap_range)(struct kvm_s2_mmu *mmu,
>   				      phys_addr_t start, u64 size,
>   				      bool may_block);
> +	int (*vm_mem_abort)(const struct kvm_s2_fault_desc *s2fd);
>   };
>   
>   struct kvm_s2_mmu {
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 9cc7fcde4dd0a..ccbe2ffeda40b 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1740,7 +1740,7 @@ struct kvm_s2_fault_vma_info {
>   	bool		map_non_cacheable;
>   };
>   
> -static int pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
> +static int protected_pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
>   {
>   	unsigned int flags = FOLL_HWPOISON | FOLL_LONGTERM | FOLL_WRITE;
>   	struct kvm_vcpu *vcpu = s2fd->vcpu;
> @@ -2178,6 +2178,20 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
>   	return kvm_s2_fault_map(s2fd, &s2vi, prot, memcache);
>   }
>   
> +static int kvm_vm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
> +{
> +	struct kvm_vcpu *vcpu = s2fd->vcpu;
> +
> +	VM_WARN_ON_ONCE(kvm_vcpu_trap_is_permission_fault(vcpu) &&
> +			!kvm_is_write_fault(vcpu) &&
> +			!kvm_vcpu_trap_is_exec_fault(vcpu));
> +
> +	if (kvm_slot_has_gmem(s2fd->memslot))
> +		return gmem_abort(s2fd);
> +	else
> +		return user_mem_abort(s2fd);
> +}

The "if...else" block is moved from kvm_handle_guest_abort(), but it might be
clearer if we have:

	if (kvm_slot_has_gmem(s2fd->memslot))
		return gmem_abort(s2fd);

	return user_mem_abort(s2fd);

> +
>   /* Resolve the access fault by making the page young again. */
>   static void handle_access_fault(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa)
>   {
> @@ -2447,19 +2461,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>   		.hva		= hva,
>   	};
>   
> -	if (kvm_vm_is_protected(kvm)) {
> -		ret = pkvm_mem_abort(&s2fd);
> -	} else {
> -		VM_WARN_ON_ONCE(kvm_vcpu_trap_is_permission_fault(vcpu) &&
> -				!write_fault &&
> -				!kvm_vcpu_trap_is_exec_fault(vcpu));
> -
> -		if (kvm_slot_has_gmem(memslot))
> -			ret = gmem_abort(&s2fd);
> -		else
> -			ret = user_mem_abort(&s2fd);
> -	}
> -
> +	ret = kvm->arch.vm_s2_ops->vm_mem_abort(&s2fd);
>   	if (ret == 0)
>   		ret = 1;
>   out:
> @@ -2873,6 +2875,7 @@ static const struct kvm_vm_s2_ops protected_pkvm_vm_s2_ops = {
>   	.vm_age_gfn			= no_age_gfn,
>   	.vm_test_age_gfn		= no_age_gfn,
>   	.vm_stage2_unmap_range		= no_stage2_unmap_range,
> +	.vm_mem_abort			= protected_pkvm_mem_abort,
>   };
>   
>   static const struct kvm_vm_s2_ops pkvm_vm_s2_ops = {
> @@ -2881,6 +2884,7 @@ static const struct kvm_vm_s2_ops pkvm_vm_s2_ops = {
>   	.vm_age_gfn			= pkvm_age_gfn,
>   	.vm_test_age_gfn		= pkvm_test_age_gfn,
>   	.vm_stage2_unmap_range		= pkvm_stage2_unmap_range,
> +	.vm_mem_abort			= kvm_vm_mem_abort,
>   };
>   
>   static const struct kvm_vm_s2_ops kvm_default_vm_s2_ops = {
> @@ -2889,6 +2893,7 @@ static const struct kvm_vm_s2_ops kvm_default_vm_s2_ops = {
>   	.vm_age_gfn			= kvm_vm_age_gfn,
>   	.vm_test_age_gfn		= kvm_vm_test_age_gfn,
>   	.vm_stage2_unmap_range		= kvm_vm_stage2_unmap_range,
> +	.vm_mem_abort			= kvm_vm_mem_abort,
>   };
>   
>   #define KVM_VM_S2_OPS(flavor, ops)		\

Thanks,
Gavin


