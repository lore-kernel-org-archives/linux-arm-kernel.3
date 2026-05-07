Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8574BCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 09:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JUkIjpcmnqAY6snj5K4KsoGXaSrVhFlzy2v4P9fV3pM=; b=R5PO2GtfIgMxM3r8SQIEEBUNz8
	pvWa0fBNwQUrmDZyxQpiXk7OkNLTWac41TsEZisyGRLXKgD3U64Iczxe4Ci9oC7Ua/5+wcveXpqF7
	QAKcK4JY7PGprn7aD5ZNC0d8iVB+steNFIy7cA66wH5e38qLvWZXoAaY7up3CwKlwbaJAy/V8w8NQ
	ZMPC6iI9zRYE38S1RkqkHg6UUBZ+SJEvspO5qhgPM560hv39nWQsYbG/GDr/gDvgQTY7FQGggjPKo
	r2YpZg/iGOME5znLfGduUfWSvWRGysCVexxnfPSVrcHdOWuW+cdO2omfo2wPWIzuAADeBb5cUm6I0
	ncITXOLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKv91-00000003Mge-16H7;
	Thu, 07 May 2026 09:35:47 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKv8y-00000003Mg7-3hzd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 09:35:45 +0000
Received: by mail-pj1-x1043.google.com with SMTP id 98e67ed59e1d1-366089e42eeso276185a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 02:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778146544; x=1778751344; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JUkIjpcmnqAY6snj5K4KsoGXaSrVhFlzy2v4P9fV3pM=;
        b=bpfq/2HDfg72vYjM32RZpg212fRKAE7SXeISg9P2vkDCFcQarQfSNhArrkBJk2BHXx
         598jq5mXU5j8q2uN7P+IityOW/KrlTmKVyl8VgADcHQC7iHT5QOzV6Ayrv88EunJP5J4
         1Vj7gxHSFC0NFv2A5TM2l9yKpPnQ3c/yPLkqMSdlqlbO49puGqVmmgTrqVNGzQMZ51Yg
         Rhl7JrTy3PGqhf/COS4EbcApdQswJEiDyYxr6C89wtz2sWFGeSqjYOoJYtNp4v17kaAQ
         oHlULYdOfu5EEoSgCODJ07TqHqGXjUJQfq96JY4UDCgCWa6cQp/8ycewocLYlrN1gCwV
         z4nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778146544; x=1778751344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JUkIjpcmnqAY6snj5K4KsoGXaSrVhFlzy2v4P9fV3pM=;
        b=KnIPcuXi6Na7g/OuawJgZ47BSXAY6Y4Fm2vpZY1TmlFVjAn1Txrfi6/rd8eVUFIf4b
         CTrikpmDxVpTyJ94GkyzXrQjeOIbDES6Oq3B3w0om4lq2ddDHyK+OVLAntr8R1PI1rOW
         qB9x6xzpptSuVqg4V+3u0VNMoby7A7QJaOpvMKx/Q9VQ/EMPw5dL7F0EId+2n07jHqnZ
         d28qs7vkE1jEuJFaEUt8ZTibZISd0EpUQzz+idez2UgEO58TheuMqw+BhhgtLwvGmGhW
         g2ZplcmLg03jZ9Vx81YATV3ndnsp092LAgmWIE8wiqPNqiVnTYa6NfR4VKUujhcrME98
         bgVw==
X-Forwarded-Encrypted: i=1; AFNElJ8kZOiZyoVCZelgpc0xJLe4JQKzXzEp2RZPz1IvFrtlc7VdqeVtaC49Hle+5TCnge0YK1Km9NhcVP+LuVC+0saI@lists.infradead.org
X-Gm-Message-State: AOJu0YwLPEWQ6yUzjz5WnCNdaV0ntuvipZJ65rWvCfr3osTyhGlTeyad
	FmojhGdRsZur3vim6/gG9J5i5OIj9TlUW8EneFsW7crQig5L/fbShzas
X-Gm-Gg: AeBDiev5HV7YcD0daiyykHpujGTCCRtC95NYX46GxqfGg2hjHrynpUSHIW9Yurz2d6Q
	xyjIDHBoqTKWRpjI/sdjmc/fJINyYYbwyl55d6jheX1A51hnMkRdrha4k+IPrY1FZ0GqaFvuOz2
	nNuGHVjFHfVvYm+HoT4EJlZoJ0tNAwm+2KKRQRiyLRmar9szRdfLP1pgjU6iS5FIx3TUZgag/kZ
	zLwNPdh1qq7aqwfuoqpPbMRWK5po+KUMABmwMxu578lgVmc0xx/qfIIMOrozwNzTvURuwqk1meK
	CKe0vbQBg713Y9opeQbJazMHgQaeoesrCAzZ77vyrOpeKqkNBbyE8TWVRjSn6HeTaN9LCGtgfvv
	h6iRzpySp9+EQJYNH+RcZHEtSUNAvxYLJKHWUG83oxL2wAsL2jhJufD2oLv9ET6brnsRxsm4weM
	vVHKUF3ou8oAEfaPrYYE6ZCWUpeSl4cKAUheikxEbCXA==
X-Received: by 2002:a17:90b:1c8b:b0:356:35a5:4a64 with SMTP id 98e67ed59e1d1-365ab9b8e5dmr6393838a91.4.1778146543874;
        Thu, 07 May 2026 02:35:43 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b4c19387sm6651310a91.7.2026.05.07.02.35.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 02:35:43 -0700 (PDT)
Message-ID: <1a8af3cf-5edc-4ca4-b340-12ebeb2ed982@gmail.com>
Date: Thu, 7 May 2026 17:35:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] of: reserved_mem: reject reserved memory outside
 physical address range
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
 <20260429065831.1510858-3-chenwandun@lixiang.com>
 <20260506015112.GA286568-robh@kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20260506015112.GA286568-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_023544_932789_B0DE6C77 
X-CRM114-Status: GOOD (  22.98  )
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



On 5/6/26 09:51, Rob Herring wrote:
> On Wed, Apr 29, 2026 at 02:58:22PM +0800, Chen Wandun wrote:
>> early_init_dt_reserve_memory() does not validate whether the region
>> falls within physical memory. If a device tree incorrectly specifies a
>> reserved memory region outside the physical address range:
>>
>>   - For the non-nomap path, memblock_reserve() blindly adds the region
>>     to memblock.reserved, creating a stale entry that refers to
>>     non-existent memory.
>>
>>   - For the nomap path, memblock_mark_nomap() silently fails to match
>>     any region in memblock.memory, but still returns success.
>>
>> Add a memblock_overlaps_region() check at the entry of
>> early_init_dt_reserve_memory() to reject such regions before any
>> memblock operation takes place. This also simplifies the existing nomap
>> guard: the original "overlaps && is_reserved" condition reduces to just
>> "is_reserved", since the overlap with physical memory is already
>> guaranteed by the new check.
> While I agree, I suspect we already have cases abusing reserved-memory
> like this.
Sashiko reviewed this patch and told me:
"Historically, the reserved-memory binding is often used to describe 
hardware
SRAM, DSP memory, or IOMEM carveouts that reside outside of system RAM."
IIUC, nowdays using mmio-sram DT binding is more appropriate for SRAM or 
IOMEM carveouts.
Should I drop this patch or keep it ?
Thanks.
>
>> Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
>> Tested-by: Zhao Meijing <zhaomeijing@lixiang.com>
>> ---
>>   drivers/of/of_reserved_mem.c | 15 +++++++++++----
>>   1 file changed, 11 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
>> index 9d1b0193864c..03c676052dab 100644
>> --- a/drivers/of/of_reserved_mem.c
>> +++ b/drivers/of/of_reserved_mem.c
>> @@ -112,14 +112,21 @@ static int fdt_fixup_reserved_mem_node(unsigned long node,
>>   static int __init early_init_dt_reserve_memory(phys_addr_t base,
>>   					       phys_addr_t size, bool nomap)
>>   {
>> +	if (!memblock_overlaps_region(&memblock.memory, base, size)) {
>> +		phys_addr_t end = base + size - 1;
>> +
>> +		pr_warn("Reserved memory region %pa..%pa is outside of physical memory\n",
>> +			&base, &end);
>> +		return -EINVAL;
>> +	}
>> +
>>   	if (nomap) {
>>   		/*
>>   		 * If the memory is already reserved (by another region), we
>> -		 * should not allow it to be marked nomap, but don't worry
>> -		 * if the region isn't memory as it won't be mapped.
>> +		 * should not allow it to be marked nomap. The region being
>> +		 * physical memory is guaranteed by the overlap check above.
>>   		 */
>> -		if (memblock_overlaps_region(&memblock.memory, base, size) &&
>> -		    memblock_is_region_reserved(base, size))
>> +		if (memblock_is_region_reserved(base, size))
>>   			return -EBUSY;
>>   
>>   		return memblock_mark_nomap(base, size);
>> -- 
>> 2.43.0
>>


