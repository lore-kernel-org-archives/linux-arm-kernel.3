Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DFAFCCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 11:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PWcMpUbr5EvoYwg6OCCvCq3zKJMQIWwwgnasyRi2T/U=; b=TV83Hx22DN+WE5dIRbsygrFYDn
	lSnzUqNQ0qYGjkGNoixaFwqDYPkp/0riBFL2fxjCKbol0WmOVDTeDo1jO+AJQ81Eq7ovtOCT5omGR
	BSeBXA9zKBzGg1LPbppclK1PfZLerQpaRoLUloraHBmj4utjaSftaNEyXwPC7Qqe67UYFd7j14uv6
	4iBueuC+bMsZsAJeR8+80L3VIYwUICscWr8iM0TstoUvx388TqWWIEx4sl7F88g/+NzHEzEJgIxKS
	1ToUDLoCfEfK7iZL9L75tC3HuqK4PqbVxFTb5qpxTZ2EiX/uJ/NZ+FVWNG4p9eRgDb427A+VWKcUp
	fmSdvaiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDi7X-0000000FrRj-3YLJ;
	Tue, 28 Oct 2025 11:44:11 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDi7W-0000000FrQt-1iwV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 11:44:11 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3ee130237a8so3826141f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 04:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761651848; x=1762256648; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PWcMpUbr5EvoYwg6OCCvCq3zKJMQIWwwgnasyRi2T/U=;
        b=EgL4V+W2FnNSg0ggaNIE3bZRQyEtGa8qQrGsUhxl8Aq8joYZ/XE8GukXUYNAGjOLYh
         khfEPInBMLtFmhTwRXHdFF+zgjbN1yT3do21hsjvmn+n/UBkF4uNrJwhZK6HcmxrIdZz
         ANRzHSBDZGiYXLwDrpDXsaYJ3Y5qStX8lVwRhUkWr5f6ClnkBqXDRx6xiC+lvTGsHvAQ
         k7m5nCtcrXMPrjg8gTsmCsPXZ3lxl/TfIttwG679AgJUPP0vd1XND/O8754qZim10Ooj
         VlevORh7zoWBC/S6ZNDNSayFFyjt3IoJsRQXY58GcmvXB+T55LxTuyeflbP2EhkGXksV
         R3tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761651848; x=1762256648;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PWcMpUbr5EvoYwg6OCCvCq3zKJMQIWwwgnasyRi2T/U=;
        b=ICDK8cDU3GOQvhmdodpCFjzro4tv4mIwFliZjoMGjS7+KfJAKmQvkeUb77E9LYEZ1l
         JQktZCF9CM0o8tRySIW5GlBqN4BZ7MRl2JQ2qliSDYNgNOMHN9dKsXBt5qOLAXNdr+bC
         eQYO94F1voXdmIqU+dt4D1VxhloCZK/mHAxh7NiPF9VotG2y67qc5PLdPPIItWdhVSZ0
         Pm6gg+cS4oRf+uLYUk0dDe0zxvvxLirmeCmPbt1LiiIZZu3CDgxXgpHgR2IprD2jnaEG
         a75HWD8qcwal4sW3+JFUSvQFt9788CstARFAzt1Hx9e8sx2HW369DhxCaVwZzhzk05Dt
         HvFg==
X-Forwarded-Encrypted: i=1; AJvYcCX7e26SyDNspmalZASRzsOYNCS6d0v9VjEYcKWp3iivjkNO0flF+bxBl72nfDvepa1J++5uMSBVxxwQ55LeKNH4@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1Zfhhcv2KqINvUcQ2Rp+8/5MwGrbXyOsPWuDk7Fd49rMorKiv
	CBZw3XNr1Xt8fojTS2X7dxoOy6IwwZJGbVzkwcsz25B6NOGP4CANkVXj
X-Gm-Gg: ASbGncsomlin7eFjz9lFTCkptQLLG/xMcUb+rziLDj2X2a2eDF4hvgQaScMtlweUh+t
	oELYqQwhvSyHEDpmqS0q58HnEvDrseLP+D6rhYHNKFk1lyXFzqU0iqlck7+8UswCDjRGhPXZclj
	pXTOBlLdGs3ZN7i85IGIUUrm1rjg2kCM8vTD4xe4L1mS5bThn8AB78t536j3AJpW+iy5ucOxPH9
	6/yY4dW17GR3KUzsN3qF/M+USgK72LTZtreeTpj15RuQLuDle3FVy/AOpEB5kb3HVdzhnWJQla4
	PxHi0UYPNEU3VWj9l74TyAJGLb0pp9WFiU/FY4LojJW/CFbUwIlJG2e3DPTBehaygVfRjwZC110
	8JG0xivOEHpA8csV6OfLpdzn+LX1MQtPCq9vrYu8pYgjOAgemHgUdRFD9HjVyQcan2SQwapak3h
	1qNOFbQGXRHfou4tfxonod
X-Google-Smtp-Source: AGHT+IGWKlgpP2z1QhsSUQHXl7C4b+OW6D0eUSaDQiNKqIYxyLK5t9gJfLBx15l4AM6BkXPesoBDGw==
X-Received: by 2002:a05:6000:3103:b0:429:8cda:dd4e with SMTP id ffacd0b85a97d-429a7e732bdmr2556153f8f.32.1761651847905;
        Tue, 28 Oct 2025 04:44:07 -0700 (PDT)
Received: from [10.24.67.204] ([15.248.3.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b7b43sm20301815f8f.6.2025.10.28.04.44.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 04:44:07 -0700 (PDT)
Message-ID: <c52db7bf-494f-49a8-9829-3805db6dda7c@gmail.com>
Date: Tue, 28 Oct 2025 11:44:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] KVM: selftests: Fix unaligned mmap allocations
Content-Language: en-GB
To: Sean Christopherson <seanjc@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 catalin.marinas@arm.com, will@kernel.org, shuah@kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 isaku.yamahata@intel.com, roypat@amazon.co.uk, kalyazin@amazon.co.uk,
 jackabt@amazon.com
References: <20251013151502.6679-1-jackabt.amazon@gmail.com>
 <20251013151502.6679-3-jackabt.amazon@gmail.com>
 <aPpi1c-8EpWuo87B@google.com>
From: "Thomson, Jack" <jackabt.amazon@gmail.com>
In-Reply-To: <aPpi1c-8EpWuo87B@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_044410_477959_1FE6F613 
X-CRM114-Status: GOOD (  21.25  )
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



On 23/10/2025 6:16 pm, Sean Christopherson wrote:
> On Mon, Oct 13, 2025, Jack Thomson wrote:
>> From: Jack Thomson <jackabt@amazon.com>
>>
>> When creating a VM using mmap with huge pages, and the memory amount does
>> not align with the underlying page size. The stored mmap_size value does
>> not account for the fact that mmap will automatically align the length
>> to a multiple of the underlying page size. During the teardown of the
>> test, munmap is used. However, munmap requires the length to be a
>> multiple of the underlying page size.
> 
> What happens when selftests use the wrong map_size?  E.g. is munmap() silently
> failing?  If so, then I should probably take this particular patch through
> kvm-x86/gmem, otherwise it means we'll start getting asserts due to:
> 
>    3223560c93eb ("KVM: selftests: Define wrappers for common syscalls to assert success")
> 
> If munmap() isn't failing, then that begs the question of what this patch is
> actually doing :-)
> 

Hi Sean, sorry I completely missed your reply.

Yeah currently with a misaligned map_size it causes munmap() to fail, I
noticed when tested with different backings.

>> Update the vm_mem_add method to ensure the mmap_size is aligned to the
>> underlying page size.
>>
>> Signed-off-by: Jack Thomson <jackabt@amazon.com>
>> ---
>>   tools/testing/selftests/kvm/lib/kvm_util.c | 12 +++++-------
>>   1 file changed, 5 insertions(+), 7 deletions(-)
>>
>> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
>> index c3f5142b0a54..b106fbed999c 100644
>> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
>> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
>> @@ -1051,7 +1051,6 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
>>   	/* Allocate and initialize new mem region structure. */
>>   	region = calloc(1, sizeof(*region));
>>   	TEST_ASSERT(region != NULL, "Insufficient Memory");
>> -	region->mmap_size = mem_size;
>>   
>>   #ifdef __s390x__
>>   	/* On s390x, the host address must be aligned to 1M (due to PGSTEs) */
>> @@ -1060,6 +1059,11 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
>>   	alignment = 1;
>>   #endif
>>   
>> +	alignment = max(backing_src_pagesz, alignment);
>> +	region->mmap_size = align_up(mem_size, alignment);
>> +
>> +	TEST_ASSERT_EQ(guest_paddr, align_up(guest_paddr, backing_src_pagesz));
>> +
>>   	/*
>>   	 * When using THP mmap is not guaranteed to returned a hugepage aligned
>>   	 * address so we have to pad the mmap. Padding is not needed for HugeTLB
>> @@ -1067,12 +1071,6 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
>>   	 * page size.
>>   	 */
>>   	if (src_type == VM_MEM_SRC_ANONYMOUS_THP)
>> -		alignment = max(backing_src_pagesz, alignment);
>> -
>> -	TEST_ASSERT_EQ(guest_paddr, align_up(guest_paddr, backing_src_pagesz));
>> -
>> -	/* Add enough memory to align up if necessary */
>> -	if (alignment > 1)
>>   		region->mmap_size += alignment;
>>   
>>   	region->fd = -1;
>> -- 
>> 2.43.0
>>

-- 
Thanks,
Jack

