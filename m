Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F94C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 23:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kFCm6qFAyYGc4VFf2sS3vwJnAyvK+30pL4l8MO3Di54=; b=j2n1sCHLYjd08qh4/CnXpBqScX
	ju8hdtvXK0MROCvosW6Wt+ufPNN5jTiL+Gqfr8L+xd1eDVfmZGYm9N75RVESyeQ5bIRIyVhcSy19Q
	sVx3uQOo1KDQLXgSErf/OOK6luBmEilzbm8oenCCXW7KJsxzwRS84sZWtrGV1SbaQ4bSL3RJeAe8C
	WtBrqiAU9NRTFWVwiveUJrFJpwP/cxwHLSdz9yREjLbp2UQgrghRvETd3TtjKl0mvax4a8POtZhhH
	mhNvgVnpJKKcmBAl0ED7vlO+w6ayuHgoTjdoRRtyP8E3onreLJOwWkWpZnIQnjzIC6heuQ0K90DaO
	fA6tx+uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpyGR-00000009d5M-2OgM;
	Wed, 05 Mar 2025 23:34:59 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpyEp-00000009clu-0qxf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 23:33:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741217597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kFCm6qFAyYGc4VFf2sS3vwJnAyvK+30pL4l8MO3Di54=;
	b=N6cLrUlBj49YYTXrUcO7GaI0UB4k8A29fe3zBXSY54opnP5ek2pPvBL0zFZeIxPO+FPCJ8
	q+5Julj46jsh08fRHQqoTe99KsjykVxIupE+hZHSqpEYguQiqvu/3W3CZQatdZCZ9Wfw7O
	Re5M/WhTInO1XBvsT8cSbZ+Yf9Z7pnc=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513-px_MHC_mPbu1c6TUDHTGHA-1; Wed, 05 Mar 2025 18:31:54 -0500
X-MC-Unique: px_MHC_mPbu1c6TUDHTGHA-1
X-Mimecast-MFC-AGG-ID: px_MHC_mPbu1c6TUDHTGHA_1741217513
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2234bf13b47so509565ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 15:31:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741217513; x=1741822313;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kFCm6qFAyYGc4VFf2sS3vwJnAyvK+30pL4l8MO3Di54=;
        b=c7CT/Ey9r9t9Z5iRFRc5TsRv8nSXhr/gUkGcLVCeKWfAK0WHhkQMsrZ83aa3Qehun4
         r7RvduYUnsfxn2qZ+Ue8RsGoQ//19q44jE336nzJrgu0/LoKNwHT7y3z+Vqzt4xDUMkF
         wbn8BDd+nykZsLi7No9Cl+p6FBbFkrWknqZpjwhTxFbKIbfOV0lyukgmIpJ5TEGaTgCS
         bOeEUIQMDfbSX9WNnVPy1BcRUeP0u3CKuQ93Mp4fu9x11xzE5tA8ozW1EAa6rSTF+EZZ
         3T8nfBgrg4It6z3vTHO0aa8n08Ri8yX1Q04QlA1RfVH4Cb1tEfU6d9nyfTlFdDZNmcHM
         Em4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXjn6vpkmD/I4GM2tCN9rGH94shTmOeBbuB0n+4CeS25rkGo8gJosCsGBA+s+8a6gIO+A9duRr0qJsCSJp8BUej@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3YSXErqhVtBT0Aowg7IAxEfaZU8f5h2a6W7EBiTAClhBsVsM3
	UlpVr9qQyFahEAOpu/3d0Z8MWaxSNOH9SIx12s/M+u3WyLi/yh8paRrpph5c0b5Xdlgkn7GDWP9
	cNEF7yPOky/KZomMtFlYWyeA+lo8my2/IjHxhSC2NnnC5MDAfKB4kgqEuVwDLmiWGxzQ2dwrs
X-Gm-Gg: ASbGncsnlCm31FXLx7qMO5irXD23y+HQTh84r3Y/3lLA41F1rUla3r0akg2cKtlkRVX
	mlbGHq41T6GNR9+VkNRqfjS3AebFBrtJNLz+iytnht8Muntb6hHyeLxkv3znYXoBN5qXEKHXaUV
	I3CXToWt65XPSHCLH68I7S1PRvC/7qgRvkogJSHIoslH5Ox/3G4iN192Nr5Rn8TK2CQwB+K7DRG
	yQjVDNIu2LfRa+rQ5+CQoiIDyPJE+xXwMEUo0zi8h4r6w9S7vcL/uU4H0ba5Pw3pX1fWBLo8Ilj
	i6LexSYA44k/l9o=
X-Received: by 2002:a05:6a00:856:b0:736:51a6:78b1 with SMTP id d2e1a72fcca58-73682bdf13fmr5864407b3a.11.1741217512910;
        Wed, 05 Mar 2025 15:31:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFr5llQOo8uwX2X7Rw/daISqoaMPhAadKna3dfRjuli6+dA3NfteMRLNkx9LXdBAsG0P/3xwA==
X-Received: by 2002:a05:6a00:856:b0:736:51a6:78b1 with SMTP id d2e1a72fcca58-73682bdf13fmr5864388b3a.11.1741217512567;
        Wed, 05 Mar 2025 15:31:52 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a00400a0sm13952388b3a.140.2025.03.05.15.31.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 15:31:51 -0800 (PST)
Message-ID: <3190c4b0-4826-4d9b-9b12-8063acff57fa@redhat.com>
Date: Thu, 6 Mar 2025 09:31:43 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 09/45] kvm: arm64: Expose debug HW register numbers for
 Realm
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20250213161426.102987-1-steven.price@arm.com>
 <20250213161426.102987-10-steven.price@arm.com>
 <cec600f2-2ddc-4c71-9bab-0a0403132b43@redhat.com>
 <ea9bb982-cf31-4079-8fea-dc39e91a975b@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <ea9bb982-cf31-4079-8fea-dc39e91a975b@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7gPx28u37zy6XeBrwFCUXvLe7tRCWmnSoOsuIRZpKTk_1741217513
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_153319_318734_948A5090 
X-CRM114-Status: GOOD (  26.63  )
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

On 3/6/25 2:25 AM, Steven Price wrote:
> On 03/03/2025 04:48, Gavin Shan wrote:
>> On 2/14/25 2:13 AM, Steven Price wrote:
>>> From: Suzuki K Poulose <suzuki.poulose@arm.com>
>>>
>>> Expose VM specific Debug HW register numbers.
> 
> Looking at this now, this patch description is garbage. Probably the
> patch has changed over time - so I suspect it's my fault not Suzuki's.
> We're not exposing anything new here. This is purely about telling the
> VMM that a realm cannot (currently) be debugged. Something like the
> below would be more accurate:
> 
> """
> kvm: arm64: Don't expose debug capabilities for realm guests
> 
> RMM v1.0 provides no mechanism for the host to perform debug operations
> on the guest. So don't expose KVM_CAP_SET_GUEST_DEBUG and report 0
> breakpoints and 0 watch points.
> """
> 

Yes, the improved change log looks good to me.

>>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>> ---
>>>    arch/arm64/kvm/arm.c | 24 +++++++++++++++++++++---
>>>    1 file changed, 21 insertions(+), 3 deletions(-)
>>>
>>
>> Documentation/virt/kvm/api.rst needs to be updated accordingly.
> 
> I don't think (with the above clarification) there's anything to update
> in the API documentation. There's nothing new being added, just
> capabilities being hidden where the functionality isn't available.
> 
> And eventually we hope to add support for this (in a later RMM spec) - I
> don't yet know exactly what form this will take, but I hope to keep the
> interfaces as close as possible to what we already have so that existing
> tooling can be used.
> 

Ok.

>>> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
>>> index b8fa82be251c..df6eb5e9ca96 100644
>>> --- a/arch/arm64/kvm/arm.c
>>> +++ b/arch/arm64/kvm/arm.c
>>> @@ -78,6 +78,22 @@ bool is_kvm_arm_initialised(void)
>>>        return kvm_arm_initialised;
>>>    }
>>>    +static u32 kvm_arm_get_num_brps(struct kvm *kvm)
>>> +{
>>> +    if (!kvm_is_realm(kvm))
>>> +        return get_num_brps();
>>> +    /* Realm guest is not debuggable. */
>>> +    return 0;
>>> +}
>>> +
>>> +static u32 kvm_arm_get_num_wrps(struct kvm *kvm)
>>> +{
>>> +    if (!kvm_is_realm(kvm))
>>> +        return get_num_wrps();
>>> +    /* Realm guest is not debuggable. */
>>> +    return 0;
>>> +}
>>> +
>>
>> The above two comments "Realm guest is not debuggable." can be dropped
>> since
>> the code is self-explanatory, and those two functions are unnecessary to be
>> kept in that way, for example:
>>
>>      case KVM_CAP_GUEST_DEBUG_HW_BPS:
>>          return kvm_is_realm(kvm) ? 0 : get_num_brps();
>>      case KVM_CAP_GUEST_DEBUG_HW_WRPS:
>>          return kvm_is_realm(kvm) ? 0 : get_num_wrps();
>>
>>
>>>    int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
>>>    {
>>>        return kvm_vcpu_exiting_guest_mode(vcpu) == IN_GUEST_MODE;
>>> @@ -323,7 +339,6 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm,
>>> long ext)
>>>        case KVM_CAP_ARM_IRQ_LINE_LAYOUT_2:
>>>        case KVM_CAP_ARM_NISV_TO_USER:
>>>        case KVM_CAP_ARM_INJECT_EXT_DABT:
>>> -    case KVM_CAP_SET_GUEST_DEBUG:
>>>        case KVM_CAP_VCPU_ATTRIBUTES:
>>>        case KVM_CAP_PTP_KVM:
>>>        case KVM_CAP_ARM_SYSTEM_SUSPEND:
>>> @@ -331,6 +346,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm,
>>> long ext)
>>>        case KVM_CAP_COUNTER_OFFSET:
>>>            r = 1;
>>>            break;
>>> +    case KVM_CAP_SET_GUEST_DEBUG:
>>> +        r = !kvm_is_realm(kvm);
>>> +        break;
>>>        case KVM_CAP_SET_GUEST_DEBUG2:
>>>            return KVM_GUESTDBG_VALID_MASK;
>>>        case KVM_CAP_ARM_SET_DEVICE_ADDR:
>>> @@ -376,10 +394,10 @@ int kvm_vm_ioctl_check_extension(struct kvm
>>> *kvm, long ext)
>>>            r = cpus_have_final_cap(ARM64_HAS_32BIT_EL1);
>>>            break;
>>>        case KVM_CAP_GUEST_DEBUG_HW_BPS:
>>> -        r = get_num_brps();
>>> +        r = kvm_arm_get_num_brps(kvm);
>>>            break;
>>>        case KVM_CAP_GUEST_DEBUG_HW_WPS:
>>> -        r = get_num_wrps();
>>> +        r = kvm_arm_get_num_wrps(kvm);
>>>            break;
>>>        case KVM_CAP_ARM_PMU_V3:
>>>            r = kvm_arm_support_pmu_v3();
>>

Thanks,
Gavin


