Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED6FC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 08:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E1X6HiCNhqQpbU8h+HCa0tdn7ioFvop7dl7Gz/vECDs=; b=rl0tySPHQqhlPgQ0+gxhfZYPqd
	tA5XA3TVXKnLpcKqqj4kCb6ZOABdLV60lyo4tm7w81nDSKst05KUasU1W+695XZVIgs8iO9IgFoXA
	n8VgGYGithSmeG4QBeE7HkwKJLGCvRiZKDUuOuDqsWKD3UMcJ21ZqRk7msHypIUk8mjwNCG9bE+6T
	2mKLPDKtgfrMdORec29OAhDMxYmF6WEYaUAoMtjoVb8kXWkdr8vU5AVxqR9vEId3HZzNAh2tF/T2V
	O//F/8aLgE0KVdLBCtfHcakYx7UuE60xKk/sxu8f19vDp0U6N56Cvv9Jq5jf4Fn25gs2FrAPGNzot
	a5vjO+qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvB7B-0000000BVFS-2TBn;
	Thu, 20 Mar 2025 08:18:57 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvB4U-0000000BUtU-0TSO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 08:16:11 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so2803135e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 01:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742458569; x=1743063369; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E1X6HiCNhqQpbU8h+HCa0tdn7ioFvop7dl7Gz/vECDs=;
        b=0qVD3VUpVWC6oWywQEL34tnyEknwPh1Dl0n77na1kvlID/bw/LeQSAIvIj/vQVYzCZ
         GIPAozVOH1VTX1OjWw554Jn8bjh/o8+ucQ9MBKGEED25lo2PGvTnZ79a7QTPcAVd+/Dt
         0arVsouROFHx2IlinpDWMe92vKOsd7K/LDclyQGC5i1jQroOrcJlqOI3Oa1EqBsISpH6
         E83+bLr/wzngrMF4ktxAUXgF7L/iYFhFbcg1cl1mLJYYA6+eeEzVNfFrSIbKl9wwjRoI
         kEXGSu7JxL1kknxKSQspMrs74WAIx9MCVfIwdQrQ+8xhBC0q6QV8vH10W2AsEzPynHpu
         5eEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742458569; x=1743063369;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E1X6HiCNhqQpbU8h+HCa0tdn7ioFvop7dl7Gz/vECDs=;
        b=jpBRI2orBmi7R1ZevbOetj5/byP7LzqHz8KTLNHEMxps+P7RNaIQQKbWlhcEYl2auI
         Nj/6YCwmbJYJ69jgHxdiSRcQdl6k5H8sZ4sBpFBOGGJA1x6L6ctfkwa8rtXqTGMjeD8+
         pbHuxWtoeRmMNN/oHnSkkQAhc59Ms6SlTEz3y7j6H1pM+WmS8YbUdrmrMfn+LQWEQd14
         hiRv0Qfg0G28ykO1RwNJUNulpEogMcaQU5pj+dWLeaMntd9k6nzZcnz6Id3NB0fXPb6D
         wtoOxqqEF05S/2wvy/8acLC7lYoTVjSJacelLKKvYE0UZYo/MEI0xCOQDka4KkpXxgbP
         ftLA==
X-Forwarded-Encrypted: i=1; AJvYcCVzC/Akfpwzsjw4+COPy+jkPH7/g0Y2l2XV5EmoUDABOOygcXPokv3E+vPSdKae6kQjta4QMtvbmwGQOxvoSNYt@lists.infradead.org
X-Gm-Message-State: AOJu0YwQ57LvT8jYx2WdV4TonOGUfE4tiU5WhWIhwOOzO5Pm/LStof4B
	YD6vsqASIAJM8JjQrT8uHl+Y5fVDz/f7L/EOSrZe3aFNcn/pfP3MESJDojrLATU=
X-Gm-Gg: ASbGncsZolxJ8i7Ui6GdOl3m3IaaXrNmlpjN+xtegVfzHT8xW0baSzRopYQ3s1AzdZz
	JKzRoGx7i6A7LtHO5OILL188RWA9vxlTxBRmiPUw7Hw0F7r3GN0jOVvIJkP9W6PpBCoj0dWCfzu
	sBpULuz2c7nvjUawZE/GzWUMnoFh6QdHX8o714fZ2IILccHUWBnjHqOSFfpG/P/lmoHh6TChZiK
	83G6Af4aFOd/232tkUPvHvmXHVMjNqLneUU8yYKYoq/68b6jyKtpFqZuLnYWShCUAjYYPKd7+92
	TNzKl/SzAAvgjZDEAQjaE08Je7K3fgP5+I7aZm6U5GN7aDaF8B4fqkU3edrMrNeSjqjNs318FKa
	rhseCy4GhPHzPUv8Bqfmj6+87
X-Google-Smtp-Source: AGHT+IHYWdVATok5OeQt7CfFPf3qhSrzissvd7+Tw9VxEB8HsbKeIOWAY9VTxxUIqbY9hRBee5DGgw==
X-Received: by 2002:a05:600c:1e0b:b0:43d:94:2d1e with SMTP id 5b1f17b1804b1-43d437a9655mr50996955e9.13.1742458568551;
        Thu, 20 Mar 2025 01:16:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39973c9d93bsm4176927f8f.65.2025.03.20.01.16.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 01:16:08 -0700 (PDT)
Message-ID: <b3fbd730-295f-4491-b0d6-d4e258941ae5@rivosinc.com>
Date: Thu, 20 Mar 2025 09:16:07 +0100
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
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250319-46b625cf8b771616d4c7c053@orel>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_011610_154070_FA74D6A5 
X-CRM114-Status: GOOD (  23.20  )
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



On 19/03/2025 18:08, Andrew Jones wrote:
> On Fri, Dec 06, 2024 at 05:30:58PM +0100, Clément Léger wrote:
> ...
>> +int arch_sse_init_event(struct sse_event_arch_data *arch_evt, u32 evt_id, int cpu)
>> +{
>> +	void *stack;
>> +
>> +	arch_evt->evt_id = evt_id;
>> +	stack = sse_stack_alloc(cpu, SSE_STACK_SIZE);
>> +	if (!stack)
>> +		return -ENOMEM;
>> +
>> +	arch_evt->stack = stack + SSE_STACK_SIZE;
>> +
>> +	if (sse_init_scs(cpu, arch_evt))
>> +		goto free_stack;
>> +
>> +	if (is_kernel_percpu_address((unsigned long)&arch_evt->interrupted)) {
>> +		arch_evt->interrupted_state_phys =
>> +				per_cpu_ptr_to_phys(&arch_evt->interrupted);
>> +	} else {
>> +		arch_evt->interrupted_state_phys =
>> +				virt_to_phys(&arch_evt->interrupted);
>> +	}
>> +
>> +	return 0;
> 
> Hi Clément,
> 
> Testing SSE support with tools/testing/selftests/kvm/riscv/sbi_pmu_test
> led to an opensbi sbi_trap_error because the output_phys_lo address passed
> to sbi_sse_read_attrs() wasn't a physical address. The reason is that
> is_kernel_percpu_address() can only be used on static percpu addresses,
> but local sse events get their percpu addresses with alloc_percpu(), so
> is_kernel_percpu_address() was returning false even for local events. I
> made the following changes to get things working.

Hi Andrew,

Did something changed recently ? Because I tested that when it was send
(PMU + some kernel internal testsuite) and didn't saw that. Anyway, I'll
respin it with your changes as well.

Thanks !

Clément

> 
> Thanks,
> drew
> 
> diff --git a/arch/riscv/kernel/sse.c b/arch/riscv/kernel/sse.c
> index b48ae69dad8d..f46893946086 100644
> --- a/arch/riscv/kernel/sse.c
> +++ b/arch/riscv/kernel/sse.c
> @@ -100,12 +100,12 @@ int arch_sse_init_event(struct sse_event_arch_data *arch_evt, u32 evt_id, int cp
>         if (sse_init_scs(cpu, arch_evt))
>                 goto free_stack;
> 
> -       if (is_kernel_percpu_address((unsigned long)&arch_evt->interrupted)) {
> +       if (sse_event_is_global(evt_id)) {
>                 arch_evt->interrupted_state_phys =
> -                               per_cpu_ptr_to_phys(&arch_evt->interrupted);
> +                               virt_to_phys(&arch_evt->interrupted);
>         } else {
>                 arch_evt->interrupted_state_phys =
> -                               virt_to_phys(&arch_evt->interrupted);
> +                               per_cpu_ptr_to_phys(&arch_evt->interrupted);
>         }
> 
>         return 0;
> diff --git a/drivers/firmware/riscv/riscv_sse.c b/drivers/firmware/riscv/riscv_sse.c
> index 511db9ad7a9e..fef375046f75 100644
> --- a/drivers/firmware/riscv/riscv_sse.c
> +++ b/drivers/firmware/riscv/riscv_sse.c
> @@ -62,11 +62,6 @@ void sse_handle_event(struct sse_event_arch_data *arch_event,
>                         ret);
>  }
> 
> -static bool sse_event_is_global(u32 evt)
> -{
> -       return !!(evt & SBI_SSE_EVENT_GLOBAL);
> -}
> -
>  static
>  struct sse_event *sse_event_get(u32 evt)
>  {
> diff --git a/include/linux/riscv_sse.h b/include/linux/riscv_sse.h
> index 16700677f1e8..06b757b036b0 100644
> --- a/include/linux/riscv_sse.h
> +++ b/include/linux/riscv_sse.h
> @@ -8,6 +8,7 @@
> 
>  #include <linux/types.h>
>  #include <linux/linkage.h>
> +#include <asm/sbi.h>
> 
>  struct sse_event;
>  struct pt_regs;
> @@ -16,6 +17,11 @@ struct ghes;
> 
>  typedef int (sse_event_handler)(u32 event_num, void *arg, struct pt_regs *regs);
> 
> +static inline bool sse_event_is_global(u32 evt)
> +{
> +       return !!(evt & SBI_SSE_EVENT_GLOBAL);
> +}
> +
>  #ifdef CONFIG_RISCV_SSE
> 
>  struct sse_event *sse_event_register(u32 event_num, u32 priority,


