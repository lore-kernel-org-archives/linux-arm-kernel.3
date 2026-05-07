Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5D2CD3442
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 08:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2g4HOatV1Ssugu2qkDT6I/dNGmnk+MzQNypIG54pufk=; b=HQCxNe+qkZKwJ5WQktMbrYKdlw
	A1NJduzWouC/hjPJ3lFP5WQ9tEhWa7a/yz59kEzsateqVUgD8DMJHZ23WORuQ+KeSCUf6o9DHP6OW
	OT4cV/fuGiQJ8eAqREL08/7ubq5lFjD2ruX1wfu2W/Po6FkMFMyLDX/3p+4Uoh7DZr76sa8CDQ//N
	NBvy2bW+aJbT5AIRPIvv+EYDb2EtYnnZkGADUwBdMM9F2aQ84d28UySbeUMGiJ1YyxlpbteL/iczz
	t/IhEDFy5YJMf6QLxLFR9e9Y3N8cHZitpXbLQRAdJjMZmcI3XUASDPCs9+6G3PJUl8YfB5ZT+CjP5
	WfpTbMkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKuPD-00000003EDy-45t2;
	Thu, 07 May 2026 08:48:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKuPC-00000003EBs-0R2X
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 07 May 2026 08:48:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2g4HOatV1Ssugu2qkDT6I/dNGmnk+MzQNypIG54pufk=; b=LA4oe+UKaCvqLXg+7PgQOy7/8p
	fPEcd0XUYK3mJEoqWDrU6T5nhhwXAgR+h8DfczFDeO8V8cWnTyuy8RGSGYQp7GixIvg3hes07tVsm
	fG3snXsU9g+GTq7YN+yc1m2rIjIZJiP9n9r7kqTBnrXk48iMQxWpQVRPeRilnTJQoDDFeP01TSzLq
	E4a6JmMXoH2a13nl4vcYhES9GTX+ptjgt/C2AiA6RwFJZSezsV/cjKhWSzEMCsWkuXiMpjnS2rigv
	d/bHutskr65u5X6SRNstO0K3ET3FsReKDAiE3AujWv7GLqmRrBvB3v5rUq4D1caqegTK6MpSe/1SB
	nLIcHZwA==;
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKuP8-00000002xlO-3Uku
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 08:48:24 +0000
Received: by mail-pl1-x643.google.com with SMTP id d9443c01a7336-2aaed195901so2970445ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 01:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778143700; x=1778748500; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2g4HOatV1Ssugu2qkDT6I/dNGmnk+MzQNypIG54pufk=;
        b=r3rBcs5gUDKWlI8PS1ryE7c1lzGXvmmUrXlxeX+6kjdc5Lnj25/WpxT3D/c+6uObkT
         iWmi4lJA58aZWq9AFb3V+mFAK+kVAzsb4jVJyEQghQHatUlgZuubVD8SajJaXA0KZSm6
         xDoCGpc+OhlDGuSp0XPgY5I0m4szy5FvW69FIzA+FVKkj32HBJkV0rMr2IeOfGQOav3O
         jBrEojfYCR8XyYUZ1ufy2P5bx3qLOSZjZv2HDeAMpFyBD3RwUkzt4Sdt6X5bVJPy6kRI
         tJNANQg206GnhbaJ9UNZqRMaEYyuoH5n2O0thYZdZD0Fp9HVB/2AEUapIh6q5HWHHOYk
         Fb+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778143700; x=1778748500;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2g4HOatV1Ssugu2qkDT6I/dNGmnk+MzQNypIG54pufk=;
        b=clbapUENwgDCgXFON6lTcAswcxY7DYKZgVzQQ+SP6sGQat5xWJaGNZDEyIN6AxR8SB
         53UckY5AntyOTV+C3eqAQjghjn2gSAdr3QTtnvXwK93JjhffplZwvE0chCMw4iZ+e7Ki
         vPZawdFtBn+irtOmH0UWJfHJgd6cC1UZdjQXgigz0aKNuH99mtQwrJtG6lfAan3L2o9h
         Kz+ZLxvXYOWf4nyKrlP9nWNShSypv6aeRbfAzWVVj2mKFrKn26hK+T7MsyDKV73BGsEP
         Z3WezpgKUNgTxTaVxim2o9Wi8RE9Kx5GY8+mTmfYeLDUiuvcvru8Vy98PdzEwzoNdcAa
         O9Zg==
X-Forwarded-Encrypted: i=1; AFNElJ9N4Ge3okSvA7bBnNdLbWtTKl1YHpwhMyASpUVsBnL4cgP1WyKuXu0ispmSytPU3C61ti2ck7QVtDIzcaonwuEp@lists.infradead.org
X-Gm-Message-State: AOJu0Yz504ArYaAP/P65TWqz6vPhTQB5hwrk1TPPRbQ6ERItpgqjTiSN
	MDB88bXqcIN0OlA014B+b2g5FBUzqCUYee5g9rJSIG5htLmLDvD6u9jh
X-Gm-Gg: AeBDievkkeZ5SMMWWIkintFgNI0tAiFoJyslmD7X8CeL1/wmJOsNYP0l0UsG+5rRrIC
	CcR+Jv5jADR3fJHCPzjWyizlHLmcmKf9nZE+Dy0Hdu82x703ukfuOHQpriiAO7PuVk+NB75Iqz8
	yPJvRYbRiTi3dDdF1v3pjI3mAe0mtZAcLJHFkYTC/Jlw/hgdbU+GvzzwreeDWqyauOuWDV88qvt
	hi2NV179o61FkqQELe89P0Z6LHZ1pSYHe3xugLF1al7WkuQohziLRFBdtZE8RfzIMYYH1WQkw34
	18gtPDaaVU9Gp8C44OtYR+6/CWf3Pq+SA/PEvrFdOrJjG7k/dD+c6CVfRUiIYImmVvBqihuKLKz
	nd5pIeBeIxxu9+X4+6OzXldxju11BFnZsDpGND40YWSgVgIv+e22BNoGfwfFZeRQf5HgrobxJJ4
	US33m81v7SOURRSKv68v+UB3aXAg0HbYAG8HwEcbSyqw==
X-Received: by 2002:a17:903:903:b0:2b0:5d60:7f3f with SMTP id d9443c01a7336-2ba78f7320amr72637805ad.16.1778143700446;
        Thu, 07 May 2026 01:48:20 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2babab0152csm19143165ad.35.2026.05.07.01.48.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 01:48:19 -0700 (PDT)
Message-ID: <6056bd1f-3998-44ff-8c4f-972704e0b896@gmail.com>
Date: Thu, 7 May 2026 16:48:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] of: reserved_mem: add no-dump crash_mem exclusion
 helpers
To: Rob Herring <robh@kernel.org>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, akpm@linux-foundation.org, bhe@redhat.com,
 rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org,
 ruirui.yang@linux.dev, corbet@lwn.net, skhan@linuxfoundation.org,
 catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
 kernel@xen0n.name, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, saravanak@kernel.org, chenwandun@lixiang.com,
 zhaomeijing@lixiang.com, everyzhao@126.com
References: <20260429065831.1510858-1-chenwandun@lixiang.com>
 <20260429065831.1510858-8-chenwandun@lixiang.com>
 <20260506145022.GA2084721-robh@kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20260506145022.GA2084721-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_094823_267513_9FB052CC 
X-CRM114-Status: GOOD (  22.40  )
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


On 5/6/26 22:50, Rob Herring wrote:
> On Wed, Apr 29, 2026 at 02:58:27PM +0800, Chen Wandun wrote:
>> Provide two kdump-oriented helpers so that arch kexec_file code does
>> not have to open-code the no-dump filtering loop:
>>
>>   - of_reserved_mem_no_dump_nr_ranges() returns the number of reserved
>>     regions flagged with linux,no-dump. Each exclusion may split one
>>     existing crash_mem range into two, so callers use this count to
>>     pre-size their crash_mem allocation.
>>
>>   - of_reserved_mem_exclude_no_dump() walks the reserved_mem[] array
>>     and calls crash_exclude_mem_range() for each no-dump region.
>>
>> Both helpers are guarded by CONFIG_KEXEC_FILE; empty inline stubs are
>> provided for the !KEXEC_FILE case so architecture code can call them
>> unconditionally.
>>
>> The consumers are added in the following arm64, riscv and loongarch
>> patches in this series.
>>
>> Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
>> Tested-by: Zhao Meijing <zhaomeijing@lixiang.com>
>> ---
>>   drivers/of/of_reserved_mem.c    | 54 +++++++++++++++++++++++++++++++++
>>   include/linux/of_reserved_mem.h | 15 +++++++++
>>   2 files changed, 69 insertions(+)
>>
>> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
>> index 4b80420da2d2..038056a6408a 100644
>> --- a/drivers/of/of_reserved_mem.c
>> +++ b/drivers/of/of_reserved_mem.c
>> @@ -27,6 +27,10 @@
>>   
>>   #include "of_private.h"
>>   
>> +#ifdef CONFIG_KEXEC_FILE
>> +#include <linux/crash_core.h>
>> +#endif
> You shouldn't need ifdef around includes.
>
>> +
>>   static struct reserved_mem reserved_mem_array[MAX_RESERVED_REGIONS] __initdata;
>>   static struct reserved_mem *reserved_mem __refdata = reserved_mem_array;
>>   static int total_reserved_mem_cnt = MAX_RESERVED_REGIONS;
>> @@ -916,6 +920,56 @@ struct reserved_mem *of_reserved_mem_lookup(struct device_node *np)
>>   }
>>   EXPORT_SYMBOL_GPL(of_reserved_mem_lookup);
>>   
>> +#ifdef CONFIG_KEXEC_FILE
> Use 'if (IS_ENABLED())' within the function.
Get it, thanks.
>
>> +/**
>> + * of_reserved_mem_no_dump_nr_ranges() - count reserved regions flagged
>> + * with the linux,no-dump property.
>> + *
>> + * Each such region may split an existing crash_mem range into two when
>> + * it is excluded, so callers can use this count to pre-size their
>> + * crash_mem allocation.
>> + */
>> +unsigned int of_reserved_mem_no_dump_nr_ranges(void)
>> +{
>> +	unsigned int i, n = 0;
>> +
>> +	for (i = 0; i < reserved_mem_count; i++)
>> +		if (reserved_mem[i].no_dump)
>> +			n++;
>> +	return n;
>> +}
>> +
>> +/**
>> + * of_reserved_mem_exclude_no_dump() - exclude no-dump reserved regions
>> + * from a crash_mem list.
>> + * @cmem: crash memory list to modify
>> + *
>> + * Walks the reserved_mem[] array and calls crash_exclude_mem_range() for
>> + * every region with no_dump set. Intended to be called from arch kdump
>> + * code when constructing the elfcorehdr.
>> + *
>> + * Returns 0 on success, or a negative error returned by
>> + * crash_exclude_mem_range() on the first failure.
>> + */
>> +int of_reserved_mem_exclude_no_dump(struct crash_mem *cmem)
>> +{
>> +	unsigned int i;
>> +	int ret;
>> +
>> +	for (i = 0; i < reserved_mem_count; i++) {
>> +		struct reserved_mem *r = &reserved_mem[i];
>> +
>> +		if (!r->no_dump || !r->size)
>> +			continue;
>> +		ret = crash_exclude_mem_range(cmem, r->base,
>> +					      r->base + r->size - 1);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +	return 0;
>> +}
>> +#endif /* CONFIG_KEXEC_FILE */

