Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D73CCD6E69
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 06:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sd7sOkllNO4XLGxbX/2aYhqo9JXcF7DuVUpDO/tIkqk=; b=M7Eu1zKhcT6b9GtZGamXCEjAdP
	Vniw+hdBVFgv7oTHXvuu2qlLkiqkIQqWUAZv3vDdMFcjG/4O8iaS7uKPX3Hp79HaVPVijFID8H56L
	ABAI3JDgwEvcCXB0j7lFL+F/19XLUy8lqRmwpq8Sc0mpVY6Lpia8zu5GYMfhSA35XUBH3DSveVZVI
	zly/GMBk7NM4GsOxFMHBGmP8/maQLGhAO9KuENyhg1QfrA+rf2yzwd0TKtlqcBmd0F5WmzeQ8Gxx+
	cankOjlSAM3HD1ouwfKd/QnZQEBBfnWse6Ax7P+fQS4tR3G26OZEjDyIdKQLgQg09cmTjRo0mXLcp
	6MsUMkNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUfL3-0000000EOyX-12k9;
	Wed, 03 Jun 2026 06:44:29 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUfL1-0000000EOxX-0vV9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 06:44:28 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-2c0b944f6edso35182985ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 23:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780469066; x=1781073866; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sd7sOkllNO4XLGxbX/2aYhqo9JXcF7DuVUpDO/tIkqk=;
        b=Tm2zaBjqFP+AKAM0RDuKDBA0tt9Wlk2DOYPfSWZGzDUVrYebpqzpho3pxypHLRXNVE
         TEkI6JIVcib5KzKBXCnXlh3vithxdz6akpHnreIpZMlazNHp0veHCbAoW9kninqbO9Mh
         YdT1lyQJIgHMj2Zzjeaxh7KB5hs1rSX3tsfOX3z7r6vGfWH0hSI4xU4asaqEwNnEeuZz
         VaD/OiX298VZY2NBk+zP5qGb64silE04skLy2lIb3PruNXYX/qNlHPf0nTpAioVQfM2/
         b6XQ+77dnXXThRJm7en41AzUB7nzzzMbeO0aSTVJgO+L7+TlY9QMvzU2q1lb52szZ9NK
         zgeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780469066; x=1781073866;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sd7sOkllNO4XLGxbX/2aYhqo9JXcF7DuVUpDO/tIkqk=;
        b=fVoeZNLG+3P82p1zUsBx+HA1ZKXP2wlQhlnwhMwmADcXGtI8gTeWtEMVwjftUgNS9e
         W8eHbULxnjZoULL0eandO4qav86I9mUJg48wdzUNAIHxyatUBlymfH74xeq6TquPP0Pa
         /w4ZHoZUa8qs2vwJDNKWPmdYfsFFnFCCkhTzJvoygEftyevfv/3rRAz/bOvUoOy90h5h
         GGc0Xja/Z+rCRpTv6JG6DOrCwS9R3OInzJGk3PP2zEO1C4O9tZK7hJgxAgrvejeInjQn
         2D0jGxPiWy7ldDV19jhYS6107RAfvpLBc/O6VMl1D02B57rMGe+wtF0FWvbT/oIOKq87
         BHHw==
X-Gm-Message-State: AOJu0YxzKi5yw35lGwyt+oeu+JCXpstZtX+7nOuKFzAB9BjYIBxcBzo4
	LqnGfeNRVGIYp4/zBt8sYKEJ4ewHwqyzPv1kVi0LHhK/ec4zGDp7/aXP
X-Gm-Gg: Acq92OFxZkTCq51ZFatvkGM9+EeeamEYiTWbCvQhczzB+L5Jo99nspybtPkFR7SOX8+
	4ucHQNwQAOy9eUyCIYXKSFUhSOwJKGfeiNFDnGJVOtDLb0DEQCR2J8mDajGRdAa6l6kXx8rNuSo
	vDNKKM8RcQ/U4MP7xZvEC7qIibwCIPzEjaSxqIXtaTMrhlzrhnlTpLrHFxE9y8qFVQ+sHohzvwu
	Ea4mw6Xfsag7EMVyw5QvTMgjyS9s0P2u66WzkXLRWLWGmUIdYyEL4DtwI1jkA3mglUzf728XB7N
	RrGAfdufJ33oMwcN8tAlIZ+E2RdexPeEjO9sIVnvu3EmJFcPfB1dnoZC99bzOaJFoFwkqOuRhRM
	JoD7tEHFKjr1Uo3FAzdem9MwQHgv2OTdU4aPeUMd+GiBeLAvjsZgXZZuMhCjsq7ogSBJClvaqwr
	qhePmkJFvgdlSn6Z3cOKFseW8tQDvFz20w6nSvUuFacA==
X-Received: by 2002:a17:903:298c:b0:2c1:4d9:c8db with SMTP id d9443c01a7336-2c1644dbfbamr22648805ad.37.1780469065484;
        Tue, 02 Jun 2026 23:44:25 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16629cfb4sm13674395ad.59.2026.06.02.23.44.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 23:44:24 -0700 (PDT)
Message-ID: <79932afc-2e91-4a54-aff9-f550be784c36@gmail.com>
Date: Wed, 3 Jun 2026 14:44:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/11] of: reserved_mem: avoid post-init UAF when
 alloc_reserved_mem_array() fails
To: Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, kexec@lists.infradead.org,
 iommu@lists.linux.dev, zhaomeijing@lixiang.com, catalin.marinas@arm.com,
 will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 saravanak@kernel.org, akpm@linux-foundation.org, bhe@redhat.com,
 rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org,
 ruirui.yang@linux.dev, m.szyprowski@samsung.com, robin.murphy@arm.com,
 quic_obabatun@quicinc.com
References: <20260527032917.3385849-1-chenwandun1@gmail.com>
 <20260527032917.3385849-4-chenwandun1@gmail.com>
 <20260602162450.GA442759-robh@kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20260602162450.GA442759-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_234427_293510_C5FE8067 
X-CRM114-Status: GOOD (  23.43  )
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



On 6/3/26 00:24, Rob Herring wrote:
> On Wed, May 27, 2026 at 11:29:09AM +0800, Wandun Chen wrote:
>> From: Wandun Chen <chenwandun@lixiang.com>
>>
>> The global pointer 'reserved_mem' continues to reference the
>> reserved_mem_array which lives in __initdata if
>> alloc_reserved_mem_array() fails. of_reserved_mem_lookup() is
>> exported for post-init use, that would dereference freed memory
>> and trigger a use-after-free.
>>
>> So reset reserved_mem_count to 0 when alloc_reserved_mem_array()
>> fails.
>>
>> Fixes: 00c9a452a235 ("of: reserved_mem: Add code to dynamically allocate reserved_mem array")
> Fixes should come first in a series.
Understood, will do in future submissions.
>
>> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
>> ---
>>   drivers/of/of_reserved_mem.c | 20 ++++++++++++++------
>>   1 file changed, 14 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
>> index 313cbc57aa45..6d479381ff1f 100644
>> --- a/drivers/of/of_reserved_mem.c
>> +++ b/drivers/of/of_reserved_mem.c
>> @@ -69,29 +69,31 @@ static int __init early_init_dt_alloc_reserved_memory_arch(phys_addr_t size,
>>    * the initial static array is copied over to this new array and
>>    * the new array is used from this point on.
>>    */
>> -static void __init alloc_reserved_mem_array(void)
>> +static bool __init alloc_reserved_mem_array(void)
>>   {
>>   	struct reserved_mem *new_array;
>>   	size_t alloc_size, copy_size, memset_size;
>>   
>> +	if (!total_reserved_mem_cnt)
>> +		return true;
>> +
>>   	alloc_size = array_size(total_reserved_mem_cnt, sizeof(*new_array));
>>   	if (alloc_size == SIZE_MAX) {
>>   		pr_err("Failed to allocate memory for reserved_mem array with err: %d", -EOVERFLOW);
>> -		return;
>> +		goto fail;
>>   	}
>>   
>>   	new_array = memblock_alloc(alloc_size, SMP_CACHE_BYTES);
>>   	if (!new_array) {
>>   		pr_err("Failed to allocate memory for reserved_mem array with err: %d", -ENOMEM);
>> -		return;
>> +		goto fail;
>>   	}
>>   
>>   	copy_size = array_size(reserved_mem_count, sizeof(*new_array));
>>   	if (copy_size == SIZE_MAX) {
>>   		memblock_free(new_array, alloc_size);
>> -		total_reserved_mem_cnt = MAX_RESERVED_REGIONS;
>>   		pr_err("Failed to allocate memory for reserved_mem array with err: %d", -EOVERFLOW);
> These prints could be moved to 'fail'. Perhaps instead of just printing
> an error value, you can return the error value instead of boolean.
Will do, consolidating pr_err() under 'fail' and changing the return type
to int.
>
> If you respin just this patch, I can pick it up for 7.2.
Before I respin, I'd like to flag a dependency:
patch 05/07 in this series build on the signature change introduced by this
patch ("the void -> bool return type change of alloc_reserved_mem_array()")

Could you let me know which of the following you'd prefer:
a) Take patch 03 alone via your tree as you suggested, after it lands, I'll
    respin the remaining patches of this series.

b) Keep patch 03 in the v4 respin of the full series, reordered to the front
    per your earlier comment.

Best regards,
Wandun
>
> Rob


