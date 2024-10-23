Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A0BCF5396
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 14:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q5rYTkHY31+cXuKv/fhTi/vwecjYJXbckDY0ZiVGZng=; b=5C+d4Ti9l3lfoYnCTK1LpsQOm5
	l5eWPQVOqDpN+2XPFyHYa5r7POzTbO6jrY/jJz3iDCNJiUtTB1h7ftp4PBebR6ShTFJEG3dZMiUNY
	fJ8LwzzyFjc7lTvvizCqjJCSbx4ZRyzxvFQV6RngiOhJwxhOENxATVBD7fY9gINRfEonUBwFXeub6
	64pphbWFdWQH3Pc6bsVZVHBVhEV6m12qZiNyQcRMCMc9LiR3U+NEguoNzsBb/84ZX7U7RAfAA2M6B
	eSOiLtHnnmKIP0G7BSdHCJhngyhz9sjTtUbaPEBQDlVlY1hGXCm6W2fo3VD/IAd4S9XfWBjaccwE4
	KK1eNx2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3cgI-0000000Eo7H-10Jp;
	Wed, 23 Oct 2024 14:49:50 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3caU-0000000EmZb-0OK4;
	Wed, 23 Oct 2024 14:43:51 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5c94b0b466cso7773283a12.0;
        Wed, 23 Oct 2024 07:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729694628; x=1730299428; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q5rYTkHY31+cXuKv/fhTi/vwecjYJXbckDY0ZiVGZng=;
        b=CEmH2eDcxQar7hhSot2+jLXRHl8a5G5afp1o0+ii55kE/Ilf31nxAtTf0tBRU43egu
         Q7k7Izz0SflwXDyjlWuNHKBGQM4wYEVWtSaEtRQXY0pxjHvy/Cy8Qy8PdIt5QlIQP3o7
         +bwgs4T6Kh10pKGrS4imznsCXXo7MTP0hjXABSEmVWt5sY4PAHLuAFqRx4baNQsQH8S+
         rlVFWW3WB8U1ucPOyNRZnzWDvlpr5cOIF//scXu+aL3/K1CfHv3b1KaBkwio4ts7KtxP
         cT5sh0HaUaPKLfBR2JbcBIr+9bbifhexkpnSDb+WEWwY4bsJLZpwpgAr2rQ1ZnZvxO4P
         y/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729694628; x=1730299428;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q5rYTkHY31+cXuKv/fhTi/vwecjYJXbckDY0ZiVGZng=;
        b=AMapNdVidHOnaO+gDm5clg4c5YxS2PZo/Pe/vfgmJghOEiXDYQm3oR1OlBSZ510f+l
         Ynis3XERI2eXCCm49uvGf3zydoxtGpRlQfF5lJ/K+XjFIpKzZJZ1XQtmyrB2T99/21Vg
         J9KMh3F39t87IaadEhQjmHK5jpr0n63hMtoZTh3AnEZIiXIaJlKAV8Sp1fIzGYUpx7L0
         Ihn3l6Ihf954JoQiVgCdR9/ErD/RUQtZie0PfVrvk/HxGX/1mX2wV/u1zz416siqBmBm
         EfQka/ESSYXknyZFItiZhe8Cx0UJg3vfdb6KMOI3iL5npvodHwrXLhP95g1Safv1Q5sa
         lJ6A==
X-Forwarded-Encrypted: i=1; AJvYcCU7j9pP5vq/VNr7D2jRKwkSgtNooRl/kmJjoYz//t/A2gehqyDZVf9aYmwZ3vUxLoWCVzSk23fkd3VlZJcTeAgiWw==@lists.infradead.org, AJvYcCVqCNvJE1dt9E9nlDqkI3farA8KvPZ/pMQiRQXVfQV9PnOFTDmJkiVLdZERNI9UsuhwM9BuQQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9BArgsGITyToio3hzokdS8/g5mxwO2Godw3wCr51tnbj6e1nU
	GxKibSNgDP/ez+CaRtOJ3R8+n0xG9/joyqbaAJLjHdcsKjO4ISF+
X-Google-Smtp-Source: AGHT+IHDJbvo8KOhjbBnEUwYt4z0DNUgMPzm4YxcQUEljWBb7Z20ciaU2eAHyabV6G4Hjpki7LKWTA==
X-Received: by 2002:a05:6402:2106:b0:5ca:d9f:9146 with SMTP id 4fb4d7f45d1cf-5cb8acfa78amr2972462a12.17.1729694625893;
        Wed, 23 Oct 2024 07:43:45 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1126:4:eb:d0d0:c7fd:c82c? ([2620:10d:c092:500::7:ca73])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb6696b68fsm4503334a12.1.2024.10.23.07.43.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 07:43:45 -0700 (PDT)
Message-ID: <1e117d65-b454-4d5c-b03a-c3ab3b078093@gmail.com>
Date: Wed, 23 Oct 2024 15:43:44 +0100
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
Content-Language: en-US
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <CAL_JsqLLxyhjrc-Aqg12mjUZHGGgw59=AJxPpOfh5uSST8hY0Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_074350_170489_82810D89 
X-CRM114-Status: GOOD (  28.99  )
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



On 23/10/2024 14:40, Rob Herring wrote:
> On Mon, Oct 7, 2024 at 10:30 AM Usama Arif <usamaarif642@gmail.com> wrote:
>>
>>
>>
>> On 07/10/2024 15:39, Rob Herring wrote:
>>> On Mon, Oct 7, 2024 at 9:06 AM Usama Arif <usamaarif642@gmail.com> wrote:
>>>>
>>>>
>>>>
>>>> On 04/10/2024 01:03, Rob Herring wrote:
>>>>> On Thu, Oct 03, 2024 at 12:38:40PM +0100, Usama Arif wrote:
>>>>>>  __pa() is only intended to be used for linear map addresses and using
>>>>>> it for initial_boot_params which is in fixmap for arm64 will give an
>>>>>> incorrect value. Hence stash the physical address when it is known at
>>>>>> boot time and use it at kexec time instead of converting the virtual
>>>>>> address using __pa().
>>>>>>
>>>>>> Reported-by: Breno Leitao <leitao@debian.org>
>>>>>> Suggested-by: Mark Rutland <mark.rutland@arm.com>
>>>>>> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
>>>>>> Fixes: ac10be5cdbfa ("arm64: Use common of_kexec_alloc_and_setup_fdt()")
>>>>>> ---
>>>>>>  arch/arm64/kernel/setup.c | 8 ++++++++
>>>>>>  drivers/of/fdt.c          | 6 ++++++
>>>>>>  drivers/of/kexec.c        | 8 ++++++--
>>>>>>  include/linux/of_fdt.h    | 2 ++
>>>>>>  4 files changed, 22 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
>>>>>> index b22d28ec8028..a4d96f5e2e05 100644
>>>>>> --- a/arch/arm64/kernel/setup.c
>>>>>> +++ b/arch/arm64/kernel/setup.c
>>>>>> @@ -194,6 +194,14 @@ static void __init setup_machine_fdt(phys_addr_t dt_phys)
>>>>>>      /* Early fixups are done, map the FDT as read-only now */
>>>>>>      fixmap_remap_fdt(dt_phys, &size, PAGE_KERNEL_RO);
>>>>>>
>>>>>> +    /*
>>>>>> +     * Save dt_phys address so that it can be used later for kexec. This
>>>>>> +     * is done as __pa() is only intended to be used for linear map addresses
>>>>>> +     * and using it for initial_boot_params which is in fixmap will give an
>>>>>> +     * incorrect value.
>>>>>> +     */
>>>>>> +    set_initial_boot_params_pa(dt_phys);
>>>>>
>>>>> No new arch->dt functions please. If we need to save off the PA, then do
>>>>> that when we set initial_boot_params.
>>>>>
>>>>> Rob
>>>>
>>>>
>>>> initial_boot_params is set in early_init_dt_verify, called by early_init_dt_scan.
>>>> This is done in setup_machine_fdt in arm64 where the PA is available,
>>>> but in other functions in other architectures, where the PA is not available.
>>>
>>> Doesn't __pa() work for all the other architectures? That's what your
>>> patch indicates.
>>>
>>
>> Yes, __pa() works for all other architectures.
>>
>> But we would need to add initial_boot_params_pa of type phys_addr_t
>> as an argument for early_init_dt_scan, which is called by all other archs,
>> and we technically cant use 0 as an invalid value.
>>
>> We could convert initial_boot_params_pa to void *, and pass NULL for all
>> other archs. But again, I don't really think we should be changing the
>> early_init_dt_scan(dt_virt) call in all other archs to
>> early_init_dt_scan(dt_virt, NULL) just to save initial_boot_params_pa
>> in arm64?
>>
>>>> So it makes it quite messy to set it in the same place as initial_boot_params.
>>>> Its only needed for arm64 and making a change in all archs probably isnt a good idea?
>>>>
>>>> Any reason to not add a new function to make arch -> of/fdt call?
>>>
>>> Yes. It is the opposite direction I have reworked the interfaces to.
>>> We don't want each arch calling various early DT functions at random
>>> times and order. That's fragile when the DT functions make assumptions
>>> about when they are called or what's been initialized already.
>>>
>>> Another option is to make arm64 copy the DT as some arches do.
>>>
>>> Rob
>>
>> Ah maybe I didn't understand this properly, but isnt early_init_dt_scan an
>> arch -> of/fdt interfaces. set_initial_boot_params_pa is a similar interface
>> to early_init_dt_scan?
> 
> Yes, and I don't want more APIs if they can be avoided. When is
> set_initial_boot_params_pa() supposed to be called? Is it before or
> after early_init_dt_scan()? 

Its only needed in arm64, and can be either before or after, as long as its
somewhere in setup_machine_fdt, where dt_phys is available.

> Can subsequent OF functions assume the PA
> is valid?

After set_initial_boot_params_pa has been called, yes.

> If an arch doesn't call set_initial_boot_params_pa() is
> __pa() valid or did they just forget to call it? 

Only arm64 seems to do the fixmap as discussed in
https://lore.kernel.org/all/1ea5538f-7e96-4034-9af9-e2d5fd72e069@gmail.com/,
so __pa should work in others.

Requiring the PA to
> be set at the same time as initial_boot_params avoids all those issues
> with any period of time having the PA incorrect.
> 

Are you recommending I send a patch which changes all archs to call
early_init_dt_scan(dt_virt, NULL)?
or maybe early_init_dt_scan(dt_virt, __pa(dt_virt))?
and arm to call early_init_dt_scan(dt_virt, dt_phys).

Happy to do send a v2 with that if its the way forward, although I feel
set_initial_boot_params_pa() in just one arch might be better than
changing this for all archs.

Thanks
Usama

> Rob


