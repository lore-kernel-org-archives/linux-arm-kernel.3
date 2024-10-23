Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51495CDDE54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 10:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xi//lmY3CDXLB22ZA8QT8BrT/DH2hEHxXLSW2RSdvf4=; b=0iiJpYKDVyRzP1U5KDdzxZ6oQP
	yKzB9dAmg6nL4s3r3s97oeaf+FJJApw1G7MiB1XJ+MaUcXOU8Y+cVBgGula3oLHqXFGuN3jz6mfhp
	I98995HFnLhCpy+pFTO0s1UMv/bqIxY2DSmAw2+SJTkjeIsXO5Y0qyq2fTUMs4D8Qol34OKzjdgk5
	6rNL70AOeNMLZzQSwPO5X8t5wMt5mDyU/sM6ZqPg2ePIAsh0x5KihUt27UywL4pSTKaDIZ7jP0umO
	zzQT7PsAvfEAUwvOuY2oUITTRaqiQux1MOJfR8vaJqtxMF+RqRxo+yzHBdy5WZirjIOUGrQ+OHxj7
	G0Roc41Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3YKV-0000000Dw93-2FYf;
	Wed, 23 Oct 2024 10:11:03 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Xoa-0000000DpS9-22OQ;
	Wed, 23 Oct 2024 09:39:50 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a99eb8b607aso712874366b.2;
        Wed, 23 Oct 2024 02:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729676282; x=1730281082; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xi//lmY3CDXLB22ZA8QT8BrT/DH2hEHxXLSW2RSdvf4=;
        b=i+bmpvdXGTbWSgKmqdo9P6aOD4D9QJcN2RqTigBHW1npylAkzfcTpiehNW4U6uMrwJ
         nGQLYBDiMGmiNVKqbQ3LJ/qUZDXO0zYbwy/RXhPBTt3oHyEn0RdAHzNuftdADWwjoznn
         cMYNT+1QQDbjyUGc4hJX5dZdjFsc5C6BwnbD+RYmzjMz33GvAECdfwzfvzTljGazwmdG
         4snS1kwoemdN9VZpXd1Hx/kEBoGnsfu6fKHA5v/rN1+VS/YUYGcWxemGV2Cm8xeCnzXc
         wBYjIfbh/9O/pzN0kvwuI+7QGCfe10PhnB+6i5B3kpbsE7e67Kva3V9WJ49NAlyALw4a
         DS9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729676282; x=1730281082;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xi//lmY3CDXLB22ZA8QT8BrT/DH2hEHxXLSW2RSdvf4=;
        b=vP61h3otbny8/jlF9ACivOcMYGlHacQf/xMectt7Mqwi7/TY06ykD+FT8hK/lx2bNQ
         elSAHL+3CCs6bCPihG0P7hp0RC/nAcnqfQaDfOnrD+SV9sZ3KJK9VmCw/7/iJa7y0x9G
         xNQiv2U4js++MZ7oVWWRnD+LfUqA62RpNIScczIfY1O882Ii+8FD8g6VMj4KDz7iyAUc
         97qJ+Jjg912KU+EmiL6aZV+nd0lnKXzWuEsm34V72zz58LuSvaUqY/HbQgGNiOLMHPox
         XGOSDcSGhJpMDfvHqVQKS8GJhZLEoOX3wMP1FK7U2Y17yGI18ZWHUSEhZpaIJYqfkUCM
         mWsw==
X-Forwarded-Encrypted: i=1; AJvYcCVyIxHMl2OEI42EB9rfmFqJ8+jAeMSqdcruEhFfiWAehHARp29cOekIMTJPYzELWtEzvE7yNvQ02kjd/5i4cSYLOw==@lists.infradead.org, AJvYcCWBsqwzQhUOePR7zOo2X9HsNz0QJMYT2n7o3zOtQzgnpmO8mF0HYYGBGBnhah18Svb7X8Sfqw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9uKIqlNQJuVC7cNWIXWNGxQJc2VI7KuA2EHCFUenNMCD4y6CH
	5hlr00698Vev/ibMGehsx3DwllC0tzutEOImMmbidIfoc8wyv3qm124NqA==
X-Google-Smtp-Source: AGHT+IF2xpNDAMd7ETMVHrq0usZAhIAETenBmMVdyqyf3MuQ2dWpqhGHoIm9pnhbGW/M9Gz++KBoVA==
X-Received: by 2002:a17:906:c107:b0:a99:4261:e9f7 with SMTP id a640c23a62f3a-a9abf8d83damr180688066b.39.1729676282124;
        Wed, 23 Oct 2024 02:38:02 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1126:4:eb:d0d0:c7fd:c82c? ([2620:10d:c092:500::7:ca73])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a91598f29sm451110266b.190.2024.10.23.02.38.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 02:38:01 -0700 (PDT)
Message-ID: <6ff25181-3df7-4edd-b55b-021b74c3b624@gmail.com>
Date: Wed, 23 Oct 2024 10:38:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] of/kexec: save pa of initial_boot_params for arm64 and
 use it at kexec
From: Usama Arif <usamaarif642@gmail.com>
To: Rob Herring <robh@kernel.org>, mark.rutland@arm.com, will@kernel.org
Cc: leitao@debian.org, catalin.marinas@arm.com, saravanak@google.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kexec@lists.infradead.org
References: <20241003113840.2972416-1-usamaarif642@gmail.com>
 <20241004000316.GA1910499-robh@kernel.org>
 <d3d90f10-1ccd-4557-843c-5b546d3b913c@gmail.com>
 <CAL_JsqJVEjPt9tHNr0uAGHQwGnUbZDZoe7kURp3Qx0ce1jv+vw@mail.gmail.com>
 <4b9456a3-47ea-4a00-92fe-131ccd80e550@gmail.com>
Content-Language: en-US
In-Reply-To: <4b9456a3-47ea-4a00-92fe-131ccd80e550@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_023804_722674_F75B1166 
X-CRM114-Status: GOOD (  29.60  )
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



On 07/10/2024 16:30, Usama Arif wrote:
> 
> 
> On 07/10/2024 15:39, Rob Herring wrote:
>> On Mon, Oct 7, 2024 at 9:06 AM Usama Arif <usamaarif642@gmail.com> wrote:
>>>
>>>
>>>
>>> On 04/10/2024 01:03, Rob Herring wrote:
>>>> On Thu, Oct 03, 2024 at 12:38:40PM +0100, Usama Arif wrote:
>>>>>  __pa() is only intended to be used for linear map addresses and using
>>>>> it for initial_boot_params which is in fixmap for arm64 will give an
>>>>> incorrect value. Hence stash the physical address when it is known at
>>>>> boot time and use it at kexec time instead of converting the virtual
>>>>> address using __pa().
>>>>>
>>>>> Reported-by: Breno Leitao <leitao@debian.org>
>>>>> Suggested-by: Mark Rutland <mark.rutland@arm.com>
>>>>> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
>>>>> Fixes: ac10be5cdbfa ("arm64: Use common of_kexec_alloc_and_setup_fdt()")
>>>>> ---
>>>>>  arch/arm64/kernel/setup.c | 8 ++++++++
>>>>>  drivers/of/fdt.c          | 6 ++++++
>>>>>  drivers/of/kexec.c        | 8 ++++++--
>>>>>  include/linux/of_fdt.h    | 2 ++
>>>>>  4 files changed, 22 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
>>>>> index b22d28ec8028..a4d96f5e2e05 100644
>>>>> --- a/arch/arm64/kernel/setup.c
>>>>> +++ b/arch/arm64/kernel/setup.c
>>>>> @@ -194,6 +194,14 @@ static void __init setup_machine_fdt(phys_addr_t dt_phys)
>>>>>      /* Early fixups are done, map the FDT as read-only now */
>>>>>      fixmap_remap_fdt(dt_phys, &size, PAGE_KERNEL_RO);
>>>>>
>>>>> +    /*
>>>>> +     * Save dt_phys address so that it can be used later for kexec. This
>>>>> +     * is done as __pa() is only intended to be used for linear map addresses
>>>>> +     * and using it for initial_boot_params which is in fixmap will give an
>>>>> +     * incorrect value.
>>>>> +     */
>>>>> +    set_initial_boot_params_pa(dt_phys);
>>>>
>>>> No new arch->dt functions please. If we need to save off the PA, then do
>>>> that when we set initial_boot_params.
>>>>
>>>> Rob
>>>
>>>
>>> initial_boot_params is set in early_init_dt_verify, called by early_init_dt_scan.
>>> This is done in setup_machine_fdt in arm64 where the PA is available,
>>> but in other functions in other architectures, where the PA is not available.
>>
>> Doesn't __pa() work for all the other architectures? That's what your
>> patch indicates.
>>
> 
> Yes, __pa() works for all other architectures.
> 
> But we would need to add initial_boot_params_pa of type phys_addr_t
> as an argument for early_init_dt_scan, which is called by all other archs,
> and we technically cant use 0 as an invalid value.
> 
> We could convert initial_boot_params_pa to void *, and pass NULL for all
> other archs. But again, I don't really think we should be changing the
> early_init_dt_scan(dt_virt) call in all other archs to
> early_init_dt_scan(dt_virt, NULL) just to save initial_boot_params_pa
> in arm64?
> 
>>> So it makes it quite messy to set it in the same place as initial_boot_params.
>>> Its only needed for arm64 and making a change in all archs probably isnt a good idea?
>>>
>>> Any reason to not add a new function to make arch -> of/fdt call?
>>
>> Yes. It is the opposite direction I have reworked the interfaces to.
>> We don't want each arch calling various early DT functions at random
>> times and order. That's fragile when the DT functions make assumptions
>> about when they are called or what's been initialized already.
>>
>> Another option is to make arm64 copy the DT as some arches do.
>>
>> Rob
> 
> Ah maybe I didn't understand this properly, but isnt early_init_dt_scan an
> arch -> of/fdt interfaces. set_initial_boot_params_pa is a similar interface
> to early_init_dt_scan?

Hi,

Just wanted to check in on above. I feel what I am doing here is similar to
early_init_dt_scan so should be ok? There is just a small comment from Saravana
that I need to address which I can in v2, but wanted to check on above before
sending it.

Thanks,
Usama


