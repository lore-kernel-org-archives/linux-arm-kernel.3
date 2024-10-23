Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA0F1CFA44F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 16:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I8bsCbuYj3wrkY+HeSAAVlp5CC82l84u/ffkdl8Y/1g=; b=peVlsPvz7JXDEU5MEUeF6qEQ8e
	HS6DsHbNIHDw5Tvr5dSeKKWLcdJD7WwtPo/jxiuNYo2edvW7rEnlIjaHMU5kRUMs1MW1IMIDDqUK2
	jzexpFczDiFuFQfpnDkJDD5OHkeq5NhFqYLic6nWrtaE8ufrprx6C8WhA5ccB6poB8WlWzkLg2MA8
	ZPk+dmFcAd4VZ6/LdkIh03xYXEo6UuxfooiU5DjugG56V0n05yoBjWNjpEntO823bCso63TeD69pq
	Z5PvkuiWh/OSk5PN8ubJjLr3w1abwg1BV6jtNMmcN9ZAryh6CPKvggM+f82djLmvNLBbOf6YqLi/K
	AzPEigOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3dyc-0000000F5wj-2kSs;
	Wed, 23 Oct 2024 16:12:50 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3dDm-0000000EwjO-0Lwh;
	Wed, 23 Oct 2024 15:24:27 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a99f629a7aaso187030866b.1;
        Wed, 23 Oct 2024 08:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729697064; x=1730301864; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I8bsCbuYj3wrkY+HeSAAVlp5CC82l84u/ffkdl8Y/1g=;
        b=YGpmK5oD0trMSah8aPRZypBMyN6e0j8e/eChLo8TRb/fapCWHUcnoENnu/escVFTL1
         +9lB8p5dGvwh2JLOZm/7Aj20vBzi+Jkc5LWkzwkpkvl8k0gPsZEJRum+O85hybx4L5K1
         AF2Z/Rm/0FxWYfZ1/XJBmQIz3L282kO0IDy/jqkOFs39E36EnNoKGmlUQaVkUgf8FQsR
         F0Ou66UCo7cyS4Zurq2IGE3jPCjv3024oKYYiYrimSX/oAo15YdZK2EkOVMQo/fOS+Zc
         ZlpW7HamuQov1xgH5FpIDyP1c0EGRTWFfzTA0AIW+mE3wVEUAbBt9P8HcMfUObnZu4tU
         MRCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729697064; x=1730301864;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I8bsCbuYj3wrkY+HeSAAVlp5CC82l84u/ffkdl8Y/1g=;
        b=ikGG9K+vklmjOCLxTYtxUL0KIVlg6Yc3Q5NocQbhA2FebReuGxxqyxjv/ph/kQDH9U
         V23hpF5bPXRp6iO7KD/ONDPIBf1AZXJJoIYjzCL9M5QGae21zTAUMr7eZKsH+TXz5sek
         7FtuItno0IdjGWKeSdkSfBsjf2UCMukbTYr2s7f/qynNJFZaiOB9oXDQF9714rSWHcfm
         EWEZRs6GmogBML6RSZme8hvnRhKqx06jdGqeJ64/CujnQ7ixEwHO8HuVGiZ4YebivD6y
         euWR/gsawQBT1nCU8R81VQx0Pf+wvijj0F+rFwJYV5q2rPe+K0mERjbD+MRHloEiRHvD
         qqyA==
X-Forwarded-Encrypted: i=1; AJvYcCWjOZRylhFW1lpbMLlwxLjPPh+29bJOUjBdXbzjbSbXbO8aIldMqdMTbXBSoOD8ht0QngopHg==@lists.infradead.org, AJvYcCXr7nDxOY2KEAnBoudVqFXfy3j6i1zSzFjXOJ2MlHj/WVCudqMe2Z8hHmzhaKtLZ/6c/6uoBfyII2qgOJMudoDKNg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzeyHUFx2JQmHS9WLolZe2zOJrR5aLUjk9WNucEfwiR3hDXvD7X
	krhrjqBwsl2VcZmSCsENLUh2WpcYZBVb80Z3Sxea67H/lwBOQslV
X-Google-Smtp-Source: AGHT+IGLxU7wxiCH3a1b/uHVpe3fD6Af7zQszRgnPFbDSKYaGfHilRmwG2cZ7GC2/X4IxrDdkB/rog==
X-Received: by 2002:a17:907:6d0c:b0:a8d:2281:94d9 with SMTP id a640c23a62f3a-a9aaa620d72mr822955666b.23.1729697063565;
        Wed, 23 Oct 2024 08:24:23 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1126:4:eb:d0d0:c7fd:c82c? ([2620:10d:c092:500::7:ca73])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a91559b33sm487702366b.116.2024.10.23.08.24.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 08:24:23 -0700 (PDT)
Message-ID: <237a32b7-e2c9-4db4-9358-918ce54da779@gmail.com>
Date: Wed, 23 Oct 2024 16:24:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] of/kexec: save pa of initial_boot_params for arm64 and
 use it at kexec
To: Rob Herring <robh@kernel.org>
Cc: mark.rutland@arm.com, will@kernel.org, leitao@debian.org,
 catalin.marinas@arm.com, saravanak@google.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kexec@lists.infradead.org
References: <20241003113840.2972416-1-usamaarif642@gmail.com>
 <20241004000316.GA1910499-robh@kernel.org>
 <d3d90f10-1ccd-4557-843c-5b546d3b913c@gmail.com>
 <CAL_JsqJVEjPt9tHNr0uAGHQwGnUbZDZoe7kURp3Qx0ce1jv+vw@mail.gmail.com>
 <4b9456a3-47ea-4a00-92fe-131ccd80e550@gmail.com>
 <CAL_JsqLLxyhjrc-Aqg12mjUZHGGgw59=AJxPpOfh5uSST8hY0Q@mail.gmail.com>
 <1e117d65-b454-4d5c-b03a-c3ab3b078093@gmail.com>
 <CAL_JsqJhd0X+eCW6WgXUjCLb-dBqHN4_01vzRRLU07Wz5Q2tLw@mail.gmail.com>
Content-Language: en-US
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <CAL_JsqJhd0X+eCW6WgXUjCLb-dBqHN4_01vzRRLU07Wz5Q2tLw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_082426_164415_0A67288E 
X-CRM114-Status: GOOD (  35.84  )
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



On 23/10/2024 16:17, Rob Herring wrote:
> On Wed, Oct 23, 2024 at 9:43 AM Usama Arif <usamaarif642@gmail.com> wrote:
>>
>>
>>
>> On 23/10/2024 14:40, Rob Herring wrote:
>>> On Mon, Oct 7, 2024 at 10:30 AM Usama Arif <usamaarif642@gmail.com> wrote:
>>>>
>>>>
>>>>
>>>> On 07/10/2024 15:39, Rob Herring wrote:
>>>>> On Mon, Oct 7, 2024 at 9:06 AM Usama Arif <usamaarif642@gmail.com> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 04/10/2024 01:03, Rob Herring wrote:
>>>>>>> On Thu, Oct 03, 2024 at 12:38:40PM +0100, Usama Arif wrote:
>>>>>>>>  __pa() is only intended to be used for linear map addresses and using
>>>>>>>> it for initial_boot_params which is in fixmap for arm64 will give an
>>>>>>>> incorrect value. Hence stash the physical address when it is known at
>>>>>>>> boot time and use it at kexec time instead of converting the virtual
>>>>>>>> address using __pa().
>>>>>>>>
>>>>>>>> Reported-by: Breno Leitao <leitao@debian.org>
>>>>>>>> Suggested-by: Mark Rutland <mark.rutland@arm.com>
>>>>>>>> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
>>>>>>>> Fixes: ac10be5cdbfa ("arm64: Use common of_kexec_alloc_and_setup_fdt()")
>>>>>>>> ---
>>>>>>>>  arch/arm64/kernel/setup.c | 8 ++++++++
>>>>>>>>  drivers/of/fdt.c          | 6 ++++++
>>>>>>>>  drivers/of/kexec.c        | 8 ++++++--
>>>>>>>>  include/linux/of_fdt.h    | 2 ++
>>>>>>>>  4 files changed, 22 insertions(+), 2 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
>>>>>>>> index b22d28ec8028..a4d96f5e2e05 100644
>>>>>>>> --- a/arch/arm64/kernel/setup.c
>>>>>>>> +++ b/arch/arm64/kernel/setup.c
>>>>>>>> @@ -194,6 +194,14 @@ static void __init setup_machine_fdt(phys_addr_t dt_phys)
>>>>>>>>      /* Early fixups are done, map the FDT as read-only now */
>>>>>>>>      fixmap_remap_fdt(dt_phys, &size, PAGE_KERNEL_RO);
>>>>>>>>
>>>>>>>> +    /*
>>>>>>>> +     * Save dt_phys address so that it can be used later for kexec. This
>>>>>>>> +     * is done as __pa() is only intended to be used for linear map addresses
>>>>>>>> +     * and using it for initial_boot_params which is in fixmap will give an
>>>>>>>> +     * incorrect value.
>>>>>>>> +     */
>>>>>>>> +    set_initial_boot_params_pa(dt_phys);
>>>>>>>
>>>>>>> No new arch->dt functions please. If we need to save off the PA, then do
>>>>>>> that when we set initial_boot_params.
>>>>>>>
>>>>>>> Rob
>>>>>>
>>>>>>
>>>>>> initial_boot_params is set in early_init_dt_verify, called by early_init_dt_scan.
>>>>>> This is done in setup_machine_fdt in arm64 where the PA is available,
>>>>>> but in other functions in other architectures, where the PA is not available.
>>>>>
>>>>> Doesn't __pa() work for all the other architectures? That's what your
>>>>> patch indicates.
>>>>>
>>>>
>>>> Yes, __pa() works for all other architectures.
>>>>
>>>> But we would need to add initial_boot_params_pa of type phys_addr_t
>>>> as an argument for early_init_dt_scan, which is called by all other archs,
>>>> and we technically cant use 0 as an invalid value.
>>>>
>>>> We could convert initial_boot_params_pa to void *, and pass NULL for all
>>>> other archs. But again, I don't really think we should be changing the
>>>> early_init_dt_scan(dt_virt) call in all other archs to
>>>> early_init_dt_scan(dt_virt, NULL) just to save initial_boot_params_pa
>>>> in arm64?
>>>>
>>>>>> So it makes it quite messy to set it in the same place as initial_boot_params.
>>>>>> Its only needed for arm64 and making a change in all archs probably isnt a good idea?
>>>>>>
>>>>>> Any reason to not add a new function to make arch -> of/fdt call?
>>>>>
>>>>> Yes. It is the opposite direction I have reworked the interfaces to.
>>>>> We don't want each arch calling various early DT functions at random
>>>>> times and order. That's fragile when the DT functions make assumptions
>>>>> about when they are called or what's been initialized already.
>>>>>
>>>>> Another option is to make arm64 copy the DT as some arches do.
>>>>>
>>>>> Rob
>>>>
>>>> Ah maybe I didn't understand this properly, but isnt early_init_dt_scan an
>>>> arch -> of/fdt interfaces. set_initial_boot_params_pa is a similar interface
>>>> to early_init_dt_scan?
>>>
>>> Yes, and I don't want more APIs if they can be avoided. When is
>>> set_initial_boot_params_pa() supposed to be called? Is it before or
>>> after early_init_dt_scan()?
>>
>> Its only needed in arm64, and can be either before or after, as long as its
>> somewhere in setup_machine_fdt, where dt_phys is available.
> 
> Maybe only arm64 today. What happens when riscv decides they too want
> to support the DT anywhere in memory including outside the linear
> address map and then they need the same thing.
> 
>>> Can subsequent OF functions assume the PA
>>> is valid?
>>
>> After set_initial_boot_params_pa has been called, yes.
> 
> How do I know it has been called? Do I have to go wade thru every arch
> to see? You could document the requirement to be immediately after
> early_init_dt_scan(), but then how do you enforce that? You can't
> unless you design the interface to just avoid the problem in the first
> place.
> 
>>> If an arch doesn't call set_initial_boot_params_pa() is
>>> __pa() valid or did they just forget to call it?
>>
>> Only arm64 seems to do the fixmap as discussed in
>> https://lore.kernel.org/all/1ea5538f-7e96-4034-9af9-e2d5fd72e069@gmail.com/,
>> so __pa should work in others.
>>
>> Requiring the PA to
>>> be set at the same time as initial_boot_params avoids all those issues
>>> with any period of time having the PA incorrect.
>>>
>>
>> Are you recommending I send a patch which changes all archs to call
>> early_init_dt_scan(dt_virt, NULL)?
>> or maybe early_init_dt_scan(dt_virt, __pa(dt_virt))?
>> and arm to call early_init_dt_scan(dt_virt, dt_phys).
> 
> I believe that's what I suggested already, so yes. Whether NULL or
> __pa(dt_virt))? __pa() would be better because then the arch has to
> think about whether that is right or not.


Sounds good! Will send a v2 with the change.

Thanks
> 
>> Happy to do send a v2 with that if its the way forward, although I feel
>> set_initial_boot_params_pa() in just one arch might be better than
>> changing this for all archs.
> 
> We don't work around kernel APIs if they don't meet changing needs. We
> change them.
> 
> Rob


