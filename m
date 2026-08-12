Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA16C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 10:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0nFHBCckinCTeWhtqGBwRJEbOqSgiMtmkEGgpj2JEUY=; b=uAGm/f88p0MK5S2vGragpvtxAD
	xGVTDOoVaWoyfkZIO0elOSkI3oUshPXGGwa574qmG49BUXV05Ga5zDpXof5Lc3C4rQga64FV/7zPx
	+SoP3NLpCfhECIdNKjyzrqmmOBXa9JZS96zTXzpywWCuTTilm3zpPeXHN05u7ubTaXHttz/MLeB0v
	f1qasEFNTZNHK9RgokuesXrZI9VM4y01peztbxrima8cKRzLaooGT5SCdJisBUJPQPceCcB60bO7W
	yHV8qeNcNia/SxxMB0EcvuQqTPF9rFcU8QhkjnWtqYe4YlXi8huZoL9Tb5JLx2s0T9VVTLLXdvKMa
	YOo5gKDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu6JE-0000000FuSi-2wcb;
	Wed, 12 Aug 2026 10:35:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu6JA-0000000FuRn-2dX0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 10:35:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786530937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0nFHBCckinCTeWhtqGBwRJEbOqSgiMtmkEGgpj2JEUY=;
	b=IYsYManqe4Wut0H2fMGppRqAogF1C3B+F3yMGsJEMP3ccTMtVrxZnHniXfpzbr2w0Al6rk
	9wQqKHOJdO6Deye4VGBn+ZU3nBbz6PSO7YIFo013NTlwdnsgiM0Ba3lY72CtaICtz9WkKE
	kb6brpIMP6sTBDAGbQ5lTAuTMaoj5G4=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-Ndo1D4LzMH2bR_cKES3K2w-1; Wed, 12 Aug 2026 06:35:23 -0400
X-MC-Unique: Ndo1D4LzMH2bR_cKES3K2w-1
X-Mimecast-MFC-AGG-ID: Ndo1D4LzMH2bR_cKES3K2w_1786530919
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e22137fb3so1139678a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 03:35:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786530919; x=1787135719;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0nFHBCckinCTeWhtqGBwRJEbOqSgiMtmkEGgpj2JEUY=;
        b=Gu1UKcQHwTGxodfRriyShJDwaa/ickz+EFfpTn/SN4XERhZJa4FCK+/j0IzIbsYlzm
         kmZPgeRdU1gwB7N4AxY/7DW1IRrPO5rTbD2TaoBm3bOMmNnEn232+mpfyGdWGRPzRuj8
         mlg0nGB0IWHvwhj3BOHC3/XCyh5VqGClgnwBh6BRBhoKMkVmW5kaYBhaM2/RpFKKyC7f
         lplkN15+K+4bkISxuzu5Id/NE+Dk6wxZckllCKCXJ3YLy5xudG88rXHWdS63hubFn3//
         fJ7D2StOv+sitZWnsEL4UCoQ0qBm0euVyeVrhB91MoyjCKSVaeuEsoNEvKJJp2sG2BJV
         NiNA==
X-Forwarded-Encrypted: i=1; AHgh+RroKu5tJuQBmIsRVG4zeBZunxVb0UGrRdBqpcPbhVGsrRWh9tJeKPFHx2b3kzyhYWdPRKxzFAfAUs0iwihujYNH@lists.infradead.org
X-Gm-Message-State: AOJu0YztaT2skQaAqnhEQCQOdiXJg1bnG3gPW+qGUWA4uIEXzQmpiZiO
	o9JzvE79pbDh5Etgesf95xJGS3ibX7Mi+DkuJQNLZVarQ1XzDKamY+fOwvxokGaJaAdfxlQpslt
	AhYVJ3oLFUnZZsSMWPAPbEaz9cBtcY8PJ5eth72KTRqwPkk/TBF6+rwXIvQr9F/UUVlA7YujhVo
	ZK
X-Gm-Gg: AR+sD11igcYh5KExvjQBweVOxCRHwixFoFUYTMm+cfxgADnE2hi15LHSXHPF6RkBd35
	52EE9wjsJcCMVq3zUUZMN6SvJXUsSH3k9EdETeqUk1kqKFSRD6xmqYnzmGKyFyUng47EGQ+dy0D
	Xx1xzzZYYIxVMP2cQRroxiH48/mAVndzf+3VvtkGvXmWYDh7usX6RxDUfwtKJxhBNi/kYMBWF65
	Nvbye3KfFzoibEqOuY99oudh7B6G9QpnTRUtbg6sTrl+6Ir4IYh0MtJz3C1pZ5ggnETrJ7b1Tgt
	oMxry+uucxKploxTgNxt1qsSnP2GwLqQiB1POe+CSEwr1OCMbx5zfAu39rQXhV9Kclb6/QSjFAM
	2gOG79m/9bU4VJ3qS54jTHn+Leg+lnfON/AlHP4d4ci0=
X-Received: by 2002:a17:90b:35cc:b0:38f:5828:a40c with SMTP id 98e67ed59e1d1-3930151d000mr4704154a91.10.1786530918657;
        Wed, 12 Aug 2026 03:35:18 -0700 (PDT)
X-Received: by 2002:a17:90b:35cc:b0:38f:5828:a40c with SMTP id 98e67ed59e1d1-3930151d000mr4704090a91.10.1786530918167;
        Wed, 12 Aug 2026 03:35:18 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392f88d1e8csm3212165a91.5.2026.08.12.03.35.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 03:35:17 -0700 (PDT)
Message-ID: <ad7d1093-685d-4c11-807d-929d16271cdb@redhat.com>
Date: Wed, 12 Aug 2026 20:35:05 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 00/45] arm64: Support for Arm CCA in KVM
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Alper Gun <alpergun@google.com>
Cc: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>,
 Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
 James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>,
 Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve
 <vannapurve@google.com>, WeiLin.Chang@arm.com,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Javier.AlmansaSobrino@arm.com
References: <20260803134403.80630-1-steven.price@arm.com>
 <42170467-fe36-4382-867f-49bdc6a7bc9a@arm.com>
 <d0ffbcb5-0cca-4d1e-9788-6b430345fa9b@redhat.com>
 <5e86232a-89ed-40ff-89e2-9e48fbf9554e@arm.com>
 <e2894206-7470-4606-b9ac-eedc8d2bdaf3@redhat.com>
 <CABpDEukGY+ctSi6wHAaC7o4pGmastX_Y18K2_VYDhNME7TF+wQ@mail.gmail.com>
 <f5d47f5f-5869-4e3a-a176-4fd632567975@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <f5d47f5f-5869-4e3a-a176-4fd632567975@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dAhaFFvDXbiImLKIBLLdNs5iOmGt9IGB4SlmNMUvf4w_1786530919
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_033540_868609_4F556C31 
X-CRM114-Status: GOOD (  27.02  )
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

Hi Alper and Suzuki,

On 8/12/26 4:04 PM, Suzuki K Poulose wrote:
> Hi Alper, Gavin
> 
> On 12/08/2026 04:25, Alper Gun wrote:
>> On Tue, Aug 11, 2026 at 8:08 PM Gavin Shan <gshan@redhat.com> wrote:
>>> As the following calltrace indicates, -EAGAIN is returned from tf-rmm::update_ripas()
>>> because true is returned from s2tte_drain_pending() for the S2TTE corresponding to
>>> IPA 0x80000000. Linux host received error (RMI_ERROR_RTT, level=3) in ripas_change().
>>> Upon this specific error and the IPA range [0x80000000 0x90000000], find_map_level()
>>> returns level of 2, and realm_create_rtt_levels() returns 0 without populating any
>>> RTTs. After that, rmi_rtt_set_ripas() is re-executed and the above loop starts over
>>> again.
>>>
>>>     Linux host
>>>     ==========
>>>     kvm_arch_vcpu_ioctl_run                     // cca/host-v16
>>>       check_vcpu_requests
>>>         kvm_check_request
>>>           kvm_rec_handle_request
>>>             kvm_complete_ripas_change
>>>               realm_set_ipa_state
>>>                 ripas_change
>>>                   rmi_rtt_set_ripas
>>>                     SMC_RMI_RTT_SET_RIPAS
>>>
>>>     TF-RMM
>>>     ======
>>>     SMC_RMI_RTT_SET_RIPAS                      // tf-rmm/topics/rmm-v2.0-poc_3
>>>       smc_rtt_set_ripas
>>>         s2tt_walk_lock_unlock
>>>         rtt_set_ripas_range
>>>           update_ripas
>>>             s2tte_drain_pending                // true, returns -EAGAIN
>>>
>>> The problem is the pending-bit for RTE corresponding IPA address 0x80000000 isn't cleared
>>> when SMC_RMI_RTT_SET_RIPAS is invoked. I didn't figure out how this bit is set and why
>>> it's not cleared in time.
> 
> Thanks for the details.
> 
>>>
>>
>> Hi Gavin, Suzuki,
>>
>> I think I ran into a similar issue on rmm-v2.0-poc_3 last week.
>> This looks like a potential RMM bug: could bit 32 be part of the physical
>> Address (if PA >= 4 GiB)?
>>
>> It seems s2tte_drain_pending() in lib/s2tt/src/s2tt.c checks bit 32 without
>> checking whether the descriptor is valid or invalid.
>>
>> In my testing, guarding the drain checks with a check for S2TTE_INVALID seemed
>> to resolve the boot hang:
>> --- a/lib/s2tt/src/s2tt.c
>> +++ b/lib/s2tt/src/s2tt.c
>> @@ -1701,6 +1701,10 @@ unsigned long
>> s2tte_clear_drain_pending(unsigned long s2tte)
>>
>>   bool s2tte_drain_pending(unsigned long s2tte)
>>   {
>> + if ((s2tte & S2TT_DESC_VALID_MASK) != S2TTE_INVALID) {
>> + return false;
> 
> We should use also consider cases where the entry is INVALID, but
> has HIPAS=ASSIGNED/ASSIGNED_DEV to make it tighter. So, I think
> it is better to use :
> 
> s2tte_is_unassigned() or in the library stick to :
> 
> if (!s2tte_has_hipas(s2tte, S2TTE_INVALID_HIPAS_UNASSIGNED))
>      return false;
> 
> May be we should assert this and make the caller responsible for
> checking the bit. I will leave it to the tf-RMM team to fix.
> 
> But for now, please use the above fix.
> 

Both worked for me. With the extra check in place, the realm guest can boot
up successfully.

FYI, The below additional checks in s2tte_tlbi_pending() and s2tte_drain_handle()
aren't needed because they're always guarded by s2tte_drain_pending() in all
calling sites.

Thanks,
Gavin


> Cheers
> Suzuki
> 
> 
>> + }
>> +
>>    return (s2tte & S2TTE_SW_DRAIN_PENDING_BIT) != 0UL;
>>   }
>>
>> @@ -1730,11 +1734,19 @@ unsigned long
>> s2tte_clear_tlbi_pending(unsigned long s2tte)
>>
>>   bool s2tte_tlbi_pending(unsigned long s2tte)
>>   {
>> + if ((s2tte & S2TT_DESC_VALID_MASK) != S2TTE_INVALID) {
>> + return false;
>> + }
>> +
>>    return (s2tte & S2TTE_SW_TLBI_PENDING_BIT) != 0UL;
>>   }
>>
>>   unsigned int s2tte_drain_handle(unsigned long s2tte)
>>   {
>> + if ((s2tte & S2TT_DESC_VALID_MASK) != S2TTE_INVALID) {
>> + return 0U;
>> + }
>> +
>>    return (unsigned int)EXTRACT(S2TTE_SW_HANDLE, s2tte);
>>   }
>>
> 
> 
> 
> 
>> Sharing in case it helps.
>> Thanks,
>> Alper
> 


