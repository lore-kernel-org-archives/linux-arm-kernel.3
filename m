Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF2FC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 04:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LIjjOoByUI2pIOPhMAIlcgJI8+NphePBM49vRMjEqNQ=; b=FKtA/TCKQQ+oXP28nqRmHTjPZO
	d0Qch+s6fXhzjL7RXhaWWXDVR/2x9S05MTqsTEKUstUPExURwsrY5ubAsqruywCHKEw8RHMFK6lAE
	hBaEl3Cr++8ajDO4CyLzfQqNrcjFp1tHOmdNyA3wJCTPkB2xdP2heaOcZmIO5NnZH2ZfnPr5iRCYV
	mFKVkm6vCFsFOI9Xgpe3XfwCGkMtOca2uFPzE7bPERKT/qr8veAaX8LaMmb2nD+Sfq7pLVlnrSUNj
	l86l2gCR7Yh1a2Rra6YrbXQZDpfBRARkcjZIrDGVZf7PTHNGV+8yA2OPPRQ1ZWfKb45YINrGpi5As
	GbvG0XhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2124-00000002jXs-1cre;
	Tue, 08 Apr 2025 04:57:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u210I-00000002jQD-0FKd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 04:56:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744088163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LIjjOoByUI2pIOPhMAIlcgJI8+NphePBM49vRMjEqNQ=;
	b=XYqiXsL+TS9O3HZHZroyEjn+8fbHNVGjZ5RMNeo6LC9Lo+8i+/AvTVd/V6j78du8QX5sGu
	vVZK6o3mmdRTVh1RRxRXjF4bTHo8/60mEhtff/HWkI/1yNsJINVGJNib1P+d3bP6cESSH1
	c053RE4gNvphqHiWl0p+2fy6+CNy7aU=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-278-wtbwQH_MM06Tyee0aYSm7A-1; Tue, 08 Apr 2025 00:56:02 -0400
X-MC-Unique: wtbwQH_MM06Tyee0aYSm7A-1
X-Mimecast-MFC-AGG-ID: wtbwQH_MM06Tyee0aYSm7A_1744088161
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7395095a505so3968174b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 21:56:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744088161; x=1744692961;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LIjjOoByUI2pIOPhMAIlcgJI8+NphePBM49vRMjEqNQ=;
        b=lcBi96uYcX4rnOZLHB/oT9SYKwOtuugfwUruDCEkowznbzQyP8dsdRQ6D24qYYSl7H
         H8DT66p407spHYu4gMxIj7wy/OGAhvsahAMhHNa+WPictJOyl/WNZt+fymYfNId2Bsbb
         h0sXwX3C2lOv9R3xbcxiJedXg8L1VCdujn+TTtJljKi3nuTIW0CqYtyj1wT4eHCxISzi
         BfO3i6Z3Xm9BmvzVPwFvbvRbWUUAvUnXJKF7B1uOkEMCYtcMJw+/lLwzNO3nfyboU4pd
         m6/MmfdDGEt+oYlnqA73uCHqenweJ9FvAn0a7IseHkYJbz1M29pH7HviHhzyk+oL+ng3
         Baxw==
X-Forwarded-Encrypted: i=1; AJvYcCUkXqOa6UY1yq52HHN/wUmd+MCLleTzxpO49vP7JAHyQXXyJBm7nhq8zsQn+ukL7/uqO3vZ5POcNtM3lyZsw/D6@lists.infradead.org
X-Gm-Message-State: AOJu0Yz07nhnzigcMQ0aAibb+BUqcIr4PMUu/uNjuAeNOyWmM+5ROx6b
	j8WNt6T4IwxAjx/YErlUpl9nOY8LnlXCA9WrO8YYIizzh0tidBucQbKYnIK4oYeyoUHFZRa2M+D
	TDJMq0MmZpNtRuyct0ZxY47NwkxYkWkH6uqylrhcM6E11Q0LAn4MO4mIMOE/VttagUArUkzXZ
X-Gm-Gg: ASbGncsEdzczE2lLmHYkZLRAYStVzi3lI5YQtS3xnzPHBUt7MS1F0qNvBmsIlOCddqP
	ftUPWlIA9WEhnMreyBL9E03nQcjn9EDvh1SnzRC2sqjrO1U9aEsf0WR0epr0KU3y/gMpkteGF0U
	d1K5AzgyVyVXX28FcHvB1CaOtTEalVI60IWDuXzjOL8ObExY+hBLWQ7ciwG/y7aYMV6K+0haD9h
	jr2a6LR72PodBO4Ziop+KH/7lTOdZeuCuNOOOmSZMHtiZ9FgDnes3YspcWZtcwWsqiqxRY67o1N
	59SaaJ2yF60kYJ9i
X-Received: by 2002:a05:6a20:c89b:b0:1f5:7d57:8309 with SMTP id adf61e73a8af0-2010468efe3mr21310698637.21.1744088161224;
        Mon, 07 Apr 2025 21:56:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERbmBP4PLZ4lD5fRaruKvT92VMq6IeMtLHrpj4YwtyvzhMXIT9jbuvqEjkQzxoAS5XwcPooA==
X-Received: by 2002:a05:6a20:c89b:b0:1f5:7d57:8309 with SMTP id adf61e73a8af0-2010468efe3mr21310671637.21.1744088160876;
        Mon, 07 Apr 2025 21:56:00 -0700 (PDT)
Received: from [192.168.68.55] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d9806e9csm9495071b3a.83.2025.04.07.21.55.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 21:56:00 -0700 (PDT)
Message-ID: <822a348f-46e1-44cb-b475-1b120bf96de4@redhat.com>
Date: Tue, 8 Apr 2025 14:55:52 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 12/45] arm64: RME: Allocate/free RECs to match vCPUs
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
 <20250213161426.102987-13-steven.price@arm.com>
 <7639eca7-8fd8-491c-90bd-1be084fbd710@redhat.com>
 <4566d2d1-1f59-49e3-ad75-45c27ac4dfda@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <4566d2d1-1f59-49e3-ad75-45c27ac4dfda@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1iQ7vh8bglujObD79O6-Zzeg3LCyqU75A87jiGXvaq0_1744088161
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_215606_167851_E6158D25 
X-CRM114-Status: GOOD (  38.18  )
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

Hi Steven,

On 3/8/25 1:43 AM, Steven Price wrote:
> On 03/03/2025 07:08, Gavin Shan wrote:
>> On 2/14/25 2:13 AM, Steven Price wrote:
>>> The RMM maintains a data structure known as the Realm Execution Context
>>> (or REC). It is similar to struct kvm_vcpu and tracks the state of the
>>> virtual CPUs. KVM must delegate memory and request the structures are
>>> created when vCPUs are created, and suitably tear down on destruction.
>>>
>>> RECs must also be supplied with addition pages - auxiliary (or AUX)
>>> granules - for storing the larger registers state (e.g. for SVE). The
>>> number of AUX granules for a REC depends on the parameters with which
>>> the Realm was created - the RMM makes this information available via the
>>> RMI_REC_AUX_COUNT call performed after creating the Realm Descriptor
>>> (RD).
>>>
>>> Note that only some of register state for the REC can be set by KVM, the
>>> rest is defined by the RMM (zeroed). The register state then cannot be
>>> changed by KVM after the REC is created (except when the guest
>>> explicitly requests this e.g. by performing a PSCI call). The RMM also
>>> requires that the VMM creates RECs in ascending order of the MPIDR.
>>>
>>> See Realm Management Monitor specification (DEN0137) for more
>>> information:
>>> https://developer.arm.com/documentation/den0137/
>>>
>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>> ---
>>> Changes since v6:
>>>    * Avoid reporting the KVM_ARM_VCPU_REC feature if the guest isn't a
>>>      realm guest.
>>>    * Support host page size being larger than RMM's granule size when
>>>      allocating/freeing aux granules.
>>> Changes since v5:
>>>    * Separate the concept of vcpu_is_rec() and
>>>      kvm_arm_vcpu_rec_finalized() by using the KVM_ARM_VCPU_REC feature as
>>>      the indication that the VCPU is a REC.
>>> Changes since v2:
>>>    * Free rec->run earlier in kvm_destroy_realm() and adapt to previous
>>> patches.
>>> ---
>>>    arch/arm64/include/asm/kvm_emulate.h |   7 ++
>>>    arch/arm64/include/asm/kvm_host.h    |   3 +
>>>    arch/arm64/include/asm/kvm_rme.h     |  18 +++
>>>    arch/arm64/kvm/arm.c                 |  13 +-
>>>    arch/arm64/kvm/reset.c               |  11 ++
>>>    arch/arm64/kvm/rme.c                 | 179 +++++++++++++++++++++++++++
>>>    6 files changed, 229 insertions(+), 2 deletions(-)
>>>
>>
>> With the following one comment addressed:
>>
>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>>
>> [...]
>>
>>>      /*
>>> diff --git a/arch/arm64/include/asm/kvm_rme.h b/arch/arm64/include/
>>> asm/kvm_rme.h
>>> index 698bb48a8ae1..5db377943db4 100644
>>> --- a/arch/arm64/include/asm/kvm_rme.h
>>> +++ b/arch/arm64/include/asm/kvm_rme.h
>>> @@ -6,6 +6,7 @@
>>>    #ifndef __ASM_KVM_RME_H
>>>    #define __ASM_KVM_RME_H
>>>    +#include <asm/rmi_smc.h>
>>>    #include <uapi/linux/kvm.h>
>>>      /**
>>> @@ -65,6 +66,21 @@ struct realm {
>>>        unsigned int ia_bits;
>>>    };
>>>    +/**
>>> + * struct realm_rec - Additional per VCPU data for a Realm
>>> + *
>>> + * @mpidr: MPIDR (Multiprocessor Affinity Register) value to identify
>>> this VCPU
>>> + * @rec_page: Kernel VA of the RMM's private page for this REC
>>> + * @aux_pages: Additional pages private to the RMM for this REC
>>> + * @run: Kernel VA of the RmiRecRun structure shared with the RMM
>>> + */
>>> +struct realm_rec {
>>> +    unsigned long mpidr;
>>> +    void *rec_page;
>>> +    struct page *aux_pages[REC_PARAMS_AUX_GRANULES];
>>> +    struct rec_run *run;
>>> +};
>>> +
>>
>> REC_PARAMS_AUX_GRANULES represents the maximal number of the auxiliary
>> granules.
>> Since the base page size is always larger than or equal to granule size
>> (4KB).
>> The capacity of array @aux_pages[] needs to be REC_PARAMS_AUX_GRANULES.
>> Ideally,
>> the array's size can be computed dynamically and it's allocated in
>> kvm_create_rec().
> 
> This is indeed another example of where pages and granules have got
> mixed. The RMM specification provides a maximum number of granules (and
> there's a similar array in struct rec_params). Here the use of
> REC_PARAMS_AUX_GRANULES is just to keep the structure more simple (no
> dynamic allocation) with the cost of ~128bytes. Obviously if
> PAGE_SIZE>4k then this array could be smaller.
> 

Exactly. The confusion is caused by the mismatched size between page and granule.
We're declaring an array of pages and the array's capacity is REC_PARAMS_AUX_GRANULES.
A comment is needed to explain for now. In long run, I think it's nice to allocate
them dynamically. The buddy allocator allocates 2^N pages and memory waste will be
existing without perfect alignment.

>> Alternatively, to keep the code simple, a comment is needed here to
>> explain why
>> the array's size has been set to REC_PARAMS_AUX_GRANULES.
> 
> Definitely a valid point - this could do with a comment explaining the
> situation.
> 

Ack.

>> An relevant question: Do we plan to support differentiated sizes between
>> page
>> and granule? I had the assumption this feature will be supported in the
>> future
>> after the base model (equal page and granule size) gets merged first.
> 
> Yes I do plan to support it. This series actually has the basic support
> in it already, with an experimental patch at the end enabling that
> support. It "works" but I haven't tested it well and I think some of the
> error handling isn't quite right yet.
> 
> But there's also a bunch more work to be done (like here) to avoid
> over-allocating memory when PAGE_SIZE>4k. E.g. RTTs need an
> sub-allocator so that we don't waste an entire (larger) page on each RTT.
> 

Ok. Frankly I didn't expect it when I reviewed the first patches of this
series. I thought it would be an incremental feature, meaning a separate
series to support it after the base series is accepted. Anyway, it's something
I need to review on the next respin (v8) if it's going to be supported
together with the base functionalities :-)

Thanks,
Gavin


