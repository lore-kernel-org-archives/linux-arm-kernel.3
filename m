Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D7A3C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 06:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0v20FJ701EIe028OJtt1tD17tf+Uzfk0Oz819ryH+Ys=; b=UzvG5GjsJiHwEcx8KjEbpmmNbb
	hk7vtOsPF8NjynpIsWqlarCkliZ1nazYhwG18vJAIhi7qSejFewFDb/MX1tjgRvDplPSGaIgHfVdf
	FjPaeid6u4xukQGSktkp4MF9K2WTJ+mLyyRCkX/8ZrN3G1ZTu03d+9X/VIRw8pvCS0vfiQhq9vHab
	kMHFat9tqIA4ogaGYhf5XKjEVVoXgxp7xr8Jo49n4uEVLVLBOFtcWBD8608JPpuPE9n30eiYfQnpD
	SLssZiA1ymM/lgYhzFfj4xQCF8YJQ+1+j3/nySaUjSa0aNzCmRbyqAPcadFR7LL1abvPUQ74SWLay
	rXudbI7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u22cW-00000002w4x-0a39;
	Tue, 08 Apr 2025 06:39:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u22aj-00000002vly-3EB5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 06:37:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744094268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0v20FJ701EIe028OJtt1tD17tf+Uzfk0Oz819ryH+Ys=;
	b=TgxQmS2ra57x1fXgH/vCC75U4u169CtHn4kNWnTTxFj3KVnmFcpaIOI/VInD0hheBmk6aq
	HgyJwPI8XDEFqs0Tl6JNt2cJOsj7nmlOBeR0J82HBlm3CD0TUIe1drEx7qkhauw9nA4z+w
	maR9gx1cR7Jybeu7NLuNrSfe3qMEXO0=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374-5ZKXGRYYM9qPnZd6BnYIJQ-1; Tue, 08 Apr 2025 02:37:47 -0400
X-MC-Unique: 5ZKXGRYYM9qPnZd6BnYIJQ-1
X-Mimecast-MFC-AGG-ID: 5ZKXGRYYM9qPnZd6BnYIJQ_1744094266
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3032f4eca83so4870121a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 23:37:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744094266; x=1744699066;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0v20FJ701EIe028OJtt1tD17tf+Uzfk0Oz819ryH+Ys=;
        b=UF125mPAFgfPHjXNpxlxJgidS0mYOYnkCPKehEjn2JfurBbWr2H3mdAqDxV+YFIDHw
         JPDmImfxPZV40kkjSHQik8hiZKhCHQxB7r1S44V3k1MpAytWP0cN6FdTTlqzVDY/hleu
         zOgIFME7MLRZD7YQGcG/Jx9tZOnXgrgxWYw8lvFl8OztDA4H+RD3au+l2MphfZZN+FtA
         p1CYLlDqpFC52H2J4j//6KrWHygoSVLNJp8a1j72yZ9vgYiSeRuO1/lb1WuBPH0Ubh7A
         Vb+PCbVi4utqBJP2J8q61EJWSWvLs44p4th/KrDTaEkt7hQZ2OE7RLHRNbmhD/swQIv8
         dF4g==
X-Forwarded-Encrypted: i=1; AJvYcCUKmyZZh0xFDE2XM0vnYy74CMqP0MHHD2Ohlj/3I0WdCxk9R1uvozyoasYFDjBVodZhn5DfWQGmtmoT7WasXRnI@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3AD3kw83MgX2na03fuy/dt0lDT3xfEyD42cEUyy1M4hMq7q0I
	yLpwWqLGH29hNq0yo7NVgi0O4fuKzvDvzhS18zqaIHSSbhlHbbpNqVB5MlwkaoWdXodnM8EUrGb
	+T7FttuFU7T3Y/bXflBJ9qgj3kL7okt4qaCshIIJWAC9ZbN9vFFw/fYgb4o+W0K35MOSIz6k8
X-Gm-Gg: ASbGncsQP1gIUk33/HBLDtiD5/DMUgBS9nWmfgwPhNa2L073piWwiv4rUcP10fw5ULI
	cho33qeZfSZuDOwB3zwd6D9UUaBV0DWJOfVabPlmcQIaPaKqZP+dPDeNfRPVPYA4yj49Cf9QYb7
	EtLferw4GejtXoObl5anp1dbhH6/8W3UjzQPTAhkcdIs2Mo5JQIAo2vztBb3HQ5zXcPDIQDGLHM
	vBg57WLN97hIK8cEYmooRtp0L6T4zxVhDwx8m3xo4DYx0E0K6p7wdAaKRzmu8A3+0OXPjCEK+/n
	si95ZPCo3hIqxYr8
X-Received: by 2002:a17:90b:514e:b0:304:ec28:4437 with SMTP id 98e67ed59e1d1-306a4b70e72mr18510595a91.22.1744094266483;
        Mon, 07 Apr 2025 23:37:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnqBBqwWUYhtFhCnTMpC42RqocSQyCJuLXXFnIrjI7SQP3rPRugb4tcWmMuJB3JDe5p/oXtw==
X-Received: by 2002:a17:90b:514e:b0:304:ec28:4437 with SMTP id 98e67ed59e1d1-306a4b70e72mr18510574a91.22.1744094266139;
        Mon, 07 Apr 2025 23:37:46 -0700 (PDT)
Received: from [192.168.68.55] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-305983bce79sm10080504a91.37.2025.04.07.23.37.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 23:37:45 -0700 (PDT)
Message-ID: <7fa4269b-a20c-4cfc-b6e7-e70214ec6366@redhat.com>
Date: Tue, 8 Apr 2025 16:37:36 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 34/45] kvm: rme: Hide KVM_CAP_READONLY_MEM for realm
 guests
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20250213161426.102987-1-steven.price@arm.com>
 <20250213161426.102987-35-steven.price@arm.com>
 <32a09a27-f131-44dd-8959-abb63b2089a8@redhat.com>
 <d254a8ea-0f02-4826-9af3-4a288efcc90c@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <d254a8ea-0f02-4826-9af3-4a288efcc90c@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Il6Zc66GCVpmmVAK8Z2Qk9hBMFnemDdQkBOEBC6J2Lo_1744094266
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_233749_880216_1B2D85E9 
X-CRM114-Status: GOOD (  22.50  )
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

On 4/8/25 2:34 AM, Steven Price wrote:
> On 04/03/2025 11:51, Gavin Shan wrote:
>> On 2/14/25 2:14 AM, Steven Price wrote:
>>> For protected memory read only isn't supported. While it may be possible
>>> to support read only for unprotected memory, this isn't supported at the
>>> present time.
>>>
>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>> ---
>>>    arch/arm64/kvm/arm.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>
>> It's worthy to explain why KVM_CAP_READONLY_MEM isn't supported and its
>> negative impact. It's something to be done in the future if I'm correct.
> 
> I'll add to the commit message:
> 
>      Note that this does mean that e.g. ROM (or flash) data cannot be
>      emulated correctly by the VMM.
> 

Please also to mention this if you agree: At present, there is no exposed
APIs from RMM allowing to specifying stage-2 page-table entry's permission.
read-only regions for ROM and flash have to be backed up by read-write stage-2
page-table entries. It's going to rely on the stage-1 page-table to have the
proper permissions for those read-only regions.

>>  From QEMU's perspective, all ROM data, which is populated by it, can
>> be written. It conflicts to the natural limit: all ROM data should be
>> read-only.
> 
> Yes this is my understanding of the main impact. I'm not sure how useful
> (shared) ROM/flash emulation is. It can certainly be added in the future
> if needed. Protected read-only memory I don't believe is useful - the
> only sane response I can see from a write fault in that case is killing
> the guest.
> 

Yes, VMM is still able to write to those regions even they're read-only
since they're emulated. For misbehaving guest where those regions are also
mapped as read-write, the data resident in those regions can be corrupted
by guest. It's not the expected output.

Since RMM doesn't have exposed APIs allowing to specify page-table entry's
permissions, meaning all entries have read-write permissions, we have to
give read-write permission to those read-only regions for now. In long run,
it's something to be fixed, starting from RMM.

Thanks,
Gavin

> Thanks,
> Steve
> 
>> QEMU
>> ====
>> rom_add_blob
>>    rom_set_mr
>>      memory_region_set_readonly
>>        memory_region_transaction_commit
>>          kvm_region_commit
>>            kvm_set_phys_mem
>>              kvm_mem_flags                                    // flag
>> KVM_MEM_READONLY is missed
>>              kvm_set_user_memory_region
>>                kvm_vm_ioctl(KVM_SET_USER_MEMORY_REGION2)
>>
>> non-secure host
>> ===============
>> rec_exit_sync_dabt
>>    kvm_handle_guest_abort
>>      user_mem_abort
>>        __kvm_faultin_pfn                       // writable == true
>>          realm_map_ipa
>>            WARN_ON(!(prot & KVM_PGTABLE_PROT_W)
>>
>> non-secure host
>> ===============
>> kvm_realm_enable_cap(KVM_CAP_ARM_RME_POPULATE_REALM)
>>    kvm_populate_realm
>>      __kvm_faultin_pfn                      // writable == true
>>        realm_create_protected_data_page
>>
>>> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
>>> index 1f3674e95f03..0f1d65f87e2b 100644
>>> --- a/arch/arm64/kvm/arm.c
>>> +++ b/arch/arm64/kvm/arm.c
>>> @@ -348,7 +348,6 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm,
>>> long ext)
>>>        case KVM_CAP_ONE_REG:
>>>        case KVM_CAP_ARM_PSCI:
>>>        case KVM_CAP_ARM_PSCI_0_2:
>>> -    case KVM_CAP_READONLY_MEM:
>>>        case KVM_CAP_MP_STATE:
>>>        case KVM_CAP_IMMEDIATE_EXIT:
>>>        case KVM_CAP_VCPU_EVENTS:
>>> @@ -362,6 +361,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm,
>>> long ext)
>>>        case KVM_CAP_COUNTER_OFFSET:
>>>            r = 1;
>>>            break;
>>> +    case KVM_CAP_READONLY_MEM:
>>>        case KVM_CAP_SET_GUEST_DEBUG:
>>>            r = !kvm_is_realm(kvm);
>>>            break;
>>
>> Thanks,
>> Gavin
>>
> 


