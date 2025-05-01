Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C5FC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 00:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cBANZxuf9Ewcq9UHI1RdTA5tF6P0Odc/vpt5hBmkkMY=; b=M8uP5i1qxBhdpwUKoDhXGiybUp
	sfEXF8UTgIB3vQb4HvdL4D8Hso03htdlMLRTwwwofk7tD92Dg2zZi1VnH+gByERBy9YfsPbybApUc
	vgUrd5xUV5MgdqvRlF1YxUHuCLkXrk7s2+U6RaqZLu6DeYsDXssmGyBYCEZetswVGevH0AyNB5R6s
	bLWNdY7oY5QrPCjTBraeBudCxqsqBc3P6z291JxFFw1/3wazWe6fS7smSqkmeEaCuYLgLecUFLTx+
	RrqhvzkA6TRbA1nPnJxXLsK0zm7k/4CRCgKjfggkVkSi+5pj39LFUvLcmHCeUWzPaoOzwsn5IAXNf
	w9vQH1Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAeIT-00000000PvJ-2fGq;
	Fri, 02 May 2025 00:30:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAdoX-00000000Jtw-2VTN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 23:59:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746143976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cBANZxuf9Ewcq9UHI1RdTA5tF6P0Odc/vpt5hBmkkMY=;
	b=Jgw66BxQO/FGWTLR5ausNpI4SOr085EvZnh+qkDq0cg/rggXnl0q+tVeN4LOGj/pgFpuwQ
	xGQ+pN3zSyx48IAcJ1jbldz8TMgb0J1VbwKf3L1KRPjJX7CkfYODhUqrlGbiVNJSMq28ug
	xzDTHMSZgppOS82X/GCriioAFBPFzHc=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-315-NPQeDCQFMKy-5wyZHXdugw-1; Thu, 01 May 2025 19:59:35 -0400
X-MC-Unique: NPQeDCQFMKy-5wyZHXdugw-1
X-Mimecast-MFC-AGG-ID: NPQeDCQFMKy-5wyZHXdugw_1746143974
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7391d68617cso2444366b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 16:59:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746143974; x=1746748774;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cBANZxuf9Ewcq9UHI1RdTA5tF6P0Odc/vpt5hBmkkMY=;
        b=TT1CzTXRIywD6NS4RkC0ExVDCs7yFn4w+7XsF+wiZn2hEHLbF8lS/iS5fgxFlu6rNq
         /O9x3L68Qr18nBCC3yirW2OX+TqrUPbpmkoFZnLxzevHT3eRZpjwiAoVB2YehNkjun7D
         eMOzXTt7vjXzhHxjc6AWRyqTxcIHXX/SrNCBFIx2LkypMFcTAtTpQg0Cd0qUvgMhklLG
         AR8QwXMaHS8Bk3tJhyPhg0+T9aEbEijISle2H2XHgZd0oSYwkcRQbPNgFB/lHBT4MRDQ
         5tqnx+RmWTOUkBCubdRhAu1JMfWYacB3yEI1EOYxCL99XXzE4huapeoWxVwVUqfg595D
         GEyg==
X-Forwarded-Encrypted: i=1; AJvYcCVsfBwCF4gSGTJbYPSNfSZfcTURPaNnnb2bwpaFhrsVLHrS0/cUnt+M2CgQM5XgdsxJpluQcGKnOr0wUDwedMF9@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7B29M93smnNLPo2MOz9juqiHgq+pYMv7utatb5StMVpYsy9jg
	XFXphRk/q9im/a+91QftDc4jkIhCOMSEOJ4MtdNYsHGYp7C3OtMoPMKiSy0NFyD0yhyYGTU2emQ
	tCtep1XdVSlvcT9BLf/cZDlej6c6enfjvKvwoZm+xPqjto07ozP/Dfpu7r6NFiObBqZfmfZLK
X-Gm-Gg: ASbGncucLeodckpctESQZvOUDdKBaT20LP4rllV39cbPJz5lJ7m5deD4lDP3XCMzgva
	vGzCBob1EOpBiZhsskRt1fPhc+uB8LMfWa1QYYDh6Nl3ArKf4crAC9Vem40ipderYmLLFeq2POe
	F8PotO0SiBg00+8Ej13iclOTS+UCOkaTi/XfZs+Yn6erTif44OhKo7FXQNMmotpwwpkKVb6y7N/
	TjX7oPTWfIE3UmyuLHiYlxSp5KJEqxxp1JHBMgmxKzcDv0wU1D1xob01Ns+MabXS2UH9wf1sAJJ
	nkyEUv2vEEhD
X-Received: by 2002:a05:6a21:3a95:b0:1ee:a410:4aa5 with SMTP id adf61e73a8af0-20ccd77ed42mr1244493637.17.1746143973962;
        Thu, 01 May 2025 16:59:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMpgyoNeMNenmpM+HSomoVyyuNDLKcDkubN3MpNbx1DHID/acstvVT2f8CfagoMMSqLqN1+A==
X-Received: by 2002:a05:6a21:3a95:b0:1ee:a410:4aa5 with SMTP id adf61e73a8af0-20ccd77ed42mr1244475637.17.1746143973557;
        Thu, 01 May 2025 16:59:33 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058d7a497sm279346b3a.33.2025.05.01.16.59.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 16:59:32 -0700 (PDT)
Message-ID: <15b37ee8-2aeb-442e-b683-705e30f3b0ca@redhat.com>
Date: Fri, 2 May 2025 09:59:24 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 15/43] arm64: RME: Allow VMM to set RIPAS
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
References: <20250416134208.383984-1-steven.price@arm.com>
 <20250416134208.383984-16-steven.price@arm.com>
 <cc2c5834-c942-4454-903d-11b53f8f5451@redhat.com>
 <d2caa472-01da-4dc2-8c38-bf0cd4524bcd@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <d2caa472-01da-4dc2-8c38-bf0cd4524bcd@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gHROXIeJB62GgWWAdPD6Ngx_QA-fpniD_d-9FUniX7U_1746143974
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_165937_749132_5F0C8F21 
X-CRM114-Status: GOOD (  30.47  )
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

On 5/2/25 2:00 AM, Steven Price wrote:
> On 30/04/2025 12:38, Gavin Shan wrote:
>> On 4/16/25 11:41 PM, Steven Price wrote:
>>> Each page within the protected region of the realm guest can be marked
>>> as either RAM or EMPTY. Allow the VMM to control this before the guest
>>> has started and provide the equivalent functions to change this (with
>>> the guest's approval) at runtime.
>>>
>>> When transitioning from RIPAS RAM (1) to RIPAS EMPTY (0) the memory is
>>> unmapped from the guest and undelegated allowing the memory to be reused
>>> by the host. When transitioning to RIPAS RAM the actual population of
>>> the leaf RTTs is done later on stage 2 fault, however it may be
>>> necessary to allocate additional RTTs to allow the RMM track the RIPAS
>>> for the requested range.
>>>
>>> When freeing a block mapping it is necessary to temporarily unfold the
>>> RTT which requires delegating an extra page to the RMM, this page can
>>> then be recovered once the contents of the block mapping have been
>>> freed.
>>>
>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>> ---
>>> Changes from v7:
>>>    * Replace use of "only_shared" with the upstream "attr_filter" field
>>>      of struct kvm_gfn_range.
>>>    * Clean up the logic in alloc_delegated_granule() for when to call
>>>      kvm_account_pgtable_pages().
>>>    * Rename realm_destroy_protected_granule() to
>>>      realm_destroy_private_granule() to match the naming elsewhere. Also
>>>      fix the return codes in the function to be descriptive.
>>>    * Several other minor changes to names/return codes.
>>> Changes from v6:
>>>    * Split the code dealing with the guest triggering a RIPAS change into
>>>      a separate patch, so this patch is purely for the VMM setting up the
>>>      RIPAS before the guest first runs.
>>>    * Drop the useless flags argument from alloc_delegated_granule().
>>>    * Account RTTs allocated for a guest using kvm_account_pgtable_pages().
>>>    * Deal with the RMM granule size potentially being smaller than the
>>>      host's PAGE_SIZE. Although note alloc_delegated_granule() currently
>>>      still allocates an entire host page for every RMM granule (so wasting
>>>      memory when PAGE_SIZE>4k).
>>> Changes from v5:
>>>    * Adapt to rebasing.
>>>    * Introduce find_map_level()
>>>    * Rename some functions to be clearer.
>>>    * Drop the "spare page" functionality.
>>> Changes from v2:
>>>    * {alloc,free}_delegated_page() moved from previous patch to this one.
>>>    * alloc_delegated_page() now takes a gfp_t flags parameter.
>>>    * Fix the reference counting of guestmem pages to avoid leaking memory.
>>>    * Several misc code improvements and extra comments.
>>> ---
>>>    arch/arm64/include/asm/kvm_rme.h |   5 +
>>>    arch/arm64/kvm/mmu.c             |   8 +-
>>>    arch/arm64/kvm/rme.c             | 384 +++++++++++++++++++++++++++++++
>>>    3 files changed, 394 insertions(+), 3 deletions(-)
>>>

.../...

>>> +static int kvm_init_ipa_range_realm(struct kvm *kvm,
>>> +                    struct arm_rme_init_ripas *args)
>>> +{
>>> +    gpa_t addr, end;
>>> +    struct realm *realm = &kvm->arch.realm;
>>> +
>>> +    addr = args->base;
>>> +    end = addr + args->size;
>>> +
>>> +    if (end < addr)
>>> +        return -EINVAL;
>>
>> The check needs to cover 'end <= addr'. RMI_ERROR_INPUT is returned from
>> RMM::smc_rtt_init_ripas()
>> if 'end' is equal to 'addr', but we're returning 0, inconsistent to that.
> 
> I agree we're different to smc_rtt_init_ripas(), but I don't really see
> why we should prevent args->size==0. Calling the low level SMC in that
> case would clearly be wrong (the kernel should be validating and that
> would show a lack of validation), but we handle that with the while loop
> in realm_init_ipa_state().
> 
> Do you think it's important to define this uAPI to disallow size==0?
> 

No, it's not a big deal since it's just a nitpick. The current implementation
isn't wrong because 0 will be returned when size is 0, meaning it succeeds
but no work to do there. Please leave the code as of being :)

>>      if (end <= addr)
>>          return -EINVAL;
>>
>>> +
>>> +    if (kvm_realm_state(kvm) != REALM_STATE_NEW)
>>> +        return -EPERM;
>>
>> To keep the consistency, kvm_realm_is_created() can be used here.
>>
>>      if (kvm_realm_is_created(kvm))
>>          return -EPERM;
> 
> This isn't the same - kvm_realm_is_create() is checking for
> REALM_STATE_NONE, but we want to check for REALM_STATE_NEW.
> 

Hmm, sorry for the noise. The current code is good enough then :)

Thanks,
Gavin


