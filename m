Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BACE5C35FFF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 12:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e8ZNXPFVzOU94mt6m9mbPGIBWqdibsgDwCTGYVYUKFE=; b=yghug1UAusQRoU2nHnDUQTcdkw
	G7otD0L5+n9LELsVVPAEi1jRKxClgB6U38Ztl+WnVmHE8YDUN5GozSP7k/Ev3/FgzXpn+kQM4zPNJ
	NkR1rjiPeWVuvr8O/ceeax0aZHr20Yht07XNg/OGIwP5K5GzeBFVz4OumtfBcvMLn9nOHjVKWEeks
	aupktp9V7NWuprVKKl63KnOYOLoT7nQsmDaVn1tssQWH9IfZG1zDT46PxzUR3JZcNyQJ83p6eZ43w
	SH46Lb5OhGY2GALNaZoArLbXN6GaAc8vE1/zEmjmxAsg4gNRq6Xg0vX0dJpf14W9W5oVmve8cpaqN
	f3ad+50w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvF0Q-0000000C7EF-1H5N;
	Thu, 20 Mar 2025 12:28:14 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvEyJ-0000000C6vD-2BcP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 12:26:04 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso4560365e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 05:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742473562; x=1743078362; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e8ZNXPFVzOU94mt6m9mbPGIBWqdibsgDwCTGYVYUKFE=;
        b=wShEFx4ifmdDNtF5pUMHFRyVSsdOIHeIWqtEkaslbJxT8hkHck7aWyOYUhOW5mG1aM
         TnGX6oXdWxh46PLuUjuMWUPF/gJ8MtqXNmjipRTyDT0+mDzzua5B2EU2sIykGO/lCPlP
         dE2TZ2xQFTn74oaAXslFmCOjm8GNx3GAXISqEv1izmy92oBFFaqSaOEiRT2UewfQcPjr
         5ZVwT/yeop/tOv6O2oSyi9EezKLtbPH0aaWHmT2tnyPycaRjQgY0pYIWw3cAXLEoeIa/
         Z25Hqb6CMo48ljLoVx+aygxM9c8EL7fSZTWoqPiuKJsGrLEDwOlRq1BDeNLeJmLK12Gt
         3KBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742473562; x=1743078362;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e8ZNXPFVzOU94mt6m9mbPGIBWqdibsgDwCTGYVYUKFE=;
        b=f51EcSSLRG8dGjrnjnClAxbmJRqS+xp6w5P/TqXreqXGeEK772Fk+Jhqu1+ZYxDVfy
         i6iK/XLYinDQ/8uQMi0V8tk2ORZ/HV0SRWwRpsZ22Y0qJM1v+av6dGpVQeGbU9pZejFd
         yl2vv2SZn/V1PtEo3UCs2aApeI3DDXfhGrYJz8nB2te8KFLZccwGpGh2PmeTCQf01Xx9
         9RYODoMQVIknfrqMA+AM2ZJK+nf9pih8JyAEPJPEeMG0GWh+KsFCxxE/sBJYzSk2DH9B
         58iGfeRrUFrkqbADwD/nI1s1ruGHbOJOw3u2DAk8NmW9qrHP3druYisMc/ycS0DQUmS7
         Lfkw==
X-Forwarded-Encrypted: i=1; AJvYcCUpE75uPM4G7rDM/Juwrz2x0/aKiDdmCr8LVvVC8vGYJLtLbsk5OG8oHt5HIilhi7znqfQ6W557mcDW5D/FErUC@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0/qhKD8qI+51hKVqM2h2fxVkPiF0xXk1dK+7LHSmxm/l1pvN/
	kN35bAkdYOPFWsZKicr+QXiqdNppKZ7sIu4k/CpSSRACBTSYPaYxTyZ+YFeEHV8=
X-Gm-Gg: ASbGncukL1FArLQUlWxjHTLy4lU7KiMvwSEW1zKustk0nzsOtsLoGvgF0f2VGi18nFS
	hEt0rFpnFO9SnDlfv7V+obX516IRCdORfD335rXIcj3+8TOPmd1uLG6l8QLfY9Js+lNYTsjafMm
	Jia/xQ4qYfiIPRYGs6auGVVK3exgzg6PxGlvNLS+KkcCG0EGmhmCBx6AEX6KFG0gDgbMc4VmOCH
	74Ap9Co1Xc3tyzxE4f6/YW42qT6UsPJ6xsBcbtr7OZg6jAii2eib2CcCVTQvbR6rwJN+ONp2zwi
	tevsHGXhVVmrrSXPDDukX34Y0sroSdQWig4h8c8cef6z2O/Heq4ir3+XnIjnrvsuLQU5e0OJUZm
	87tBp7gbdJvm6ow==
X-Google-Smtp-Source: AGHT+IFnoeXcjNAxgR/nncQsW47FJFX+8xYUDmI97yV8HuiwXCeccO5v+DsUKuiyYhZi6nrc3nxEYg==
X-Received: by 2002:a05:600c:4503:b0:43c:f6c6:578c with SMTP id 5b1f17b1804b1-43d437c330fmr74088995e9.15.1742473561773;
        Thu, 20 Mar 2025 05:26:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c7df35ecsm23914546f8f.16.2025.03.20.05.26.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 05:26:01 -0700 (PDT)
Message-ID: <8115698f-3cf7-4a6a-83cf-9dc288c84ee0@rivosinc.com>
Date: Thu, 20 Mar 2025 13:26:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] riscv: add support for SBI Supervisor Software
 Events extension
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Himanshu Chauhan <hchauhan@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Xu Lu <luxu.kernel@bytedance.com>,
 Atish Patra <atishp@atishpatra.org>
References: <20241206163102.843505-1-cleger@rivosinc.com>
 <20241206163102.843505-3-cleger@rivosinc.com>
 <20250319-46b625cf8b771616d4c7c053@orel>
 <b3fbd730-295f-4491-b0d6-d4e258941ae5@rivosinc.com>
 <20250320-5f9612f1b503c79c9b185b10@orel>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250320-5f9612f1b503c79c9b185b10@orel>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_052603_688677_4A61C2C9 
X-CRM114-Status: GOOD (  19.32  )
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



On 20/03/2025 12:52, Andrew Jones wrote:
> On Thu, Mar 20, 2025 at 09:16:07AM +0100, Clément Léger wrote:
>>
>>
>> On 19/03/2025 18:08, Andrew Jones wrote:
>>> On Fri, Dec 06, 2024 at 05:30:58PM +0100, Clément Léger wrote:
>>> ...
>>>> +int arch_sse_init_event(struct sse_event_arch_data *arch_evt, u32 evt_id, int cpu)
>>>> +{
>>>> +	void *stack;
>>>> +
>>>> +	arch_evt->evt_id = evt_id;
>>>> +	stack = sse_stack_alloc(cpu, SSE_STACK_SIZE);
>>>> +	if (!stack)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	arch_evt->stack = stack + SSE_STACK_SIZE;
>>>> +
>>>> +	if (sse_init_scs(cpu, arch_evt))
>>>> +		goto free_stack;
>>>> +
>>>> +	if (is_kernel_percpu_address((unsigned long)&arch_evt->interrupted)) {
>>>> +		arch_evt->interrupted_state_phys =
>>>> +				per_cpu_ptr_to_phys(&arch_evt->interrupted);
>>>> +	} else {
>>>> +		arch_evt->interrupted_state_phys =
>>>> +				virt_to_phys(&arch_evt->interrupted);
>>>> +	}
>>>> +
>>>> +	return 0;
>>>
>>> Hi Clément,
>>>
>>> Testing SSE support with tools/testing/selftests/kvm/riscv/sbi_pmu_test
>>> led to an opensbi sbi_trap_error because the output_phys_lo address passed
>>> to sbi_sse_read_attrs() wasn't a physical address. The reason is that
>>> is_kernel_percpu_address() can only be used on static percpu addresses,
>>> but local sse events get their percpu addresses with alloc_percpu(), so
>>> is_kernel_percpu_address() was returning false even for local events. I
>>> made the following changes to get things working.
>>
>> Hi Andrew,
>>
>> Did something changed recently ? Because I tested that when it was send
>> (PMU + some kernel internal testsuite) and didn't saw that. Anyway, I'll
>> respin it with your changes as well.
> 
> It depends on the kernel config. Configs that don't have many
> alloc_percpu() calls prior to the one made by sse can work, because,
> iiuc, alloc_percpu() will get its allocation from the percpu allocator's
> first chunk until that chunck fills up. The first chunck is shared with
> the static allocations.

Makes sense ! Thanks, I'll look at it.

> 
> Thanks,
> drew
> 
>>
>> Thanks !
>>
>> Clément
>>
>>>
>>> Thanks,
>>> drew
>>>
>>> diff --git a/arch/riscv/kernel/sse.c b/arch/riscv/kernel/sse.c
>>> index b48ae69dad8d..f46893946086 100644
>>> --- a/arch/riscv/kernel/sse.c
>>> +++ b/arch/riscv/kernel/sse.c
>>> @@ -100,12 +100,12 @@ int arch_sse_init_event(struct sse_event_arch_data *arch_evt, u32 evt_id, int cp
>>>         if (sse_init_scs(cpu, arch_evt))
>>>                 goto free_stack;
>>>
>>> -       if (is_kernel_percpu_address((unsigned long)&arch_evt->interrupted)) {
>>> +       if (sse_event_is_global(evt_id)) {
>>>                 arch_evt->interrupted_state_phys =
>>> -                               per_cpu_ptr_to_phys(&arch_evt->interrupted);
>>> +                               virt_to_phys(&arch_evt->interrupted);
>>>         } else {
>>>                 arch_evt->interrupted_state_phys =
>>> -                               virt_to_phys(&arch_evt->interrupted);
>>> +                               per_cpu_ptr_to_phys(&arch_evt->interrupted);
>>>         }
>>>
>>>         return 0;
>>> diff --git a/drivers/firmware/riscv/riscv_sse.c b/drivers/firmware/riscv/riscv_sse.c
>>> index 511db9ad7a9e..fef375046f75 100644
>>> --- a/drivers/firmware/riscv/riscv_sse.c
>>> +++ b/drivers/firmware/riscv/riscv_sse.c
>>> @@ -62,11 +62,6 @@ void sse_handle_event(struct sse_event_arch_data *arch_event,
>>>                         ret);
>>>  }
>>>
>>> -static bool sse_event_is_global(u32 evt)
>>> -{
>>> -       return !!(evt & SBI_SSE_EVENT_GLOBAL);
>>> -}
>>> -
>>>  static
>>>  struct sse_event *sse_event_get(u32 evt)
>>>  {
>>> diff --git a/include/linux/riscv_sse.h b/include/linux/riscv_sse.h
>>> index 16700677f1e8..06b757b036b0 100644
>>> --- a/include/linux/riscv_sse.h
>>> +++ b/include/linux/riscv_sse.h
>>> @@ -8,6 +8,7 @@
>>>
>>>  #include <linux/types.h>
>>>  #include <linux/linkage.h>
>>> +#include <asm/sbi.h>
>>>
>>>  struct sse_event;
>>>  struct pt_regs;
>>> @@ -16,6 +17,11 @@ struct ghes;
>>>
>>>  typedef int (sse_event_handler)(u32 event_num, void *arg, struct pt_regs *regs);
>>>
>>> +static inline bool sse_event_is_global(u32 evt)
>>> +{
>>> +       return !!(evt & SBI_SSE_EVENT_GLOBAL);
>>> +}
>>> +
>>>  #ifdef CONFIG_RISCV_SSE
>>>
>>>  struct sse_event *sse_event_register(u32 event_num, u32 priority,
>>


