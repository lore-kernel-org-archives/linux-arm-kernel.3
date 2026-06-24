Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A8ECDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 13:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GZV9AIpiCFVK4tdxG3Z8tFEyC+qJoxAahhaSiAUDsyI=; b=sa/FY9RpW2WY0UXZgkYvuHr8pC
	bYOiztAEqjXuwh7OANwe4RmnmbL1RcJlURSpH0LitolmLajgVnFXvNuT3I6df/M+zuWoAdjeNqDQ2
	r302LnQwlYbyqf6JyXMFPxosRfCnNPNELRPstTLxrkSoYOUn+y3iurvcg/O/u5oIcl/NytfphU7Pz
	MQbJ0ODeIgFh4z9PoDWzM5w3xF206Ja8TIIjn2uLciEgxoygZBWhkBd2gpV6hoWHXRNqtBKZGGpXl
	lpJDOQ9XZcMyqZ+F62fZH2J2oPMsr9JSffwLL4XRa2n/A6TFBMVhzaM3bgF20N/oq9hd5Qj0GM2HM
	IBsySvtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcO3x-00000007rYD-0Ja0;
	Wed, 24 Jun 2026 13:54:45 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcO3u-00000007rXa-2BpN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 13:54:43 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-49222b6e871so6887555e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 06:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782309280; x=1782914080; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GZV9AIpiCFVK4tdxG3Z8tFEyC+qJoxAahhaSiAUDsyI=;
        b=Yvu8uurqsRkWp8oqVNfr5gWbf4q8xLMBGPETmxlZ3HRZE+i04PuNzvdKZ7ntDL5BRa
         A/w2uDkIcbITclThDgPHsL5gO9sk4ta1b08z8mwYmnR30gCgZ/chCc6a8qEzN/aawJiX
         wH3+pFd6YaxPzr670VCC9fZqAlIQd6XBSAj5sW/TZXamH6JLN/YKm6Qi8VANFUvAPXYI
         lOBlKsqGhR/X0AlmxRVoGn3yNBNuzzc2UVjls45DYMuE/b6MOaQ97sMX6REAayb8BeRf
         uP8llvSytsuvX9qhWLHFm7U2uuvPldKCRpbTjyWoKYFWytsy+UwQTLq3/zzJFRSOSMRy
         8NTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782309280; x=1782914080;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GZV9AIpiCFVK4tdxG3Z8tFEyC+qJoxAahhaSiAUDsyI=;
        b=kyQ+/4tVoAUzDl+GRv9g82lP7gOz1ky/0WVp0R10ExBzbCxbLV/NeRxR3tAPetNNWi
         Wo04ml3JkGirOxWotxFWcZyGU/QTV1J5Djm+lepBrqxctLhtk/U95pgmoB9mbgOodpKy
         LbPT5X2N9BMusD82saGjjffJNkWVxDKWcsIoRRN7XBIkIUCZXdaGs2DtYdrZXUoU98aR
         lU2/0HyPv/VzjudZpXvIQiqNih3W9hsm6uNCXqpIg8dqbZ2FALbmm9MTL6d1v2iw8o6F
         thQ/KZnhva+eNgRemaz4fADQv2uBpHpfBoy1ayhBs1oLO85Iq4dKpwow5WdhlFblK2Of
         kU/g==
X-Gm-Message-State: AOJu0YwOXKDjcjjZY+ZuGWzm5zjAo4TDCJQ2eJrtuqnBcxsrdJGwfrSE
	vtikO36fJiIbZZDXd1wyo7orAiuw8trvLHshpbYmAtOdaHYI3EZFESzlO9f3gCkJ2A==
X-Gm-Gg: AfdE7cmQ/8AlC8q8BujApncgMtTIVpDsVUQjAeGCmsh6wAfnotyCDxto59QcKhwc4M/
	H3lVndaIpSMsyz97TFeHt5F0s5g1/lMblP9HahYvUb/6FHOaARZZCokVjhRnSzyWsJxXCoRBnqf
	wPrcFbwzp9vbEr5tObeVZwGJ8yWawtBVEJc8/SYramGklbugjmrZhUCZsIwk3F6fOqVYLKmpOr5
	t0DTxwKg4nAvCm5mggAX03X7eMXarygn5Yx5KjdWs3W3jiu1FKai+8i27RlPyuhxDc4UyLB1Zry
	pY/kfk0f96ZCCmNKb/j0FiltksaV/tzm7VaKw305kXMqPTlNNrL2oMdo3d802xJSnwoo16DDRWR
	/7N3QIMypqSLZx0kSnX86jHXu2ZUJohqOpMulHYLEsZWehLT2i3YdkfTUasP3rZRZpR9d4YFMud
	6Whm7q2rQHVBsutzd5s7x0QL/muzwTr8uom6nL35k1Ep0OFrbVfUfuFMNiHQ==
X-Received: by 2002:a05:600c:3b17:b0:492:62d9:4e57 with SMTP id 5b1f17b1804b1-49262d94ef2mr19529165e9.2.1782309279820;
        Wed, 24 Jun 2026 06:54:39 -0700 (PDT)
Received: from google.com (97.113.76.34.bc.googleusercontent.com. [34.76.113.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926064f0d8sm49968305e9.0.2026.06.24.06.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 06:54:39 -0700 (PDT)
Date: Wed, 24 Jun 2026 13:54:35 +0000
From: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, David Hildenbrand <david@kernel.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>, Christoph Lameter <cl@gentwo.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	Brendan Jackman <jackmanb@google.com>
Subject: Re: [RFC PATCH 2/6] arm64: mm: allow huge vmap permission
 adjustments with bbml2_no_abort
Message-ID: <ajvhm2aRQJPhRGW7@google.com>
References: <20260611130144.1385343-1-abarnas@google.com>
 <20260611130144.1385343-3-abarnas@google.com>
 <07ab8b6f-cb58-4f8c-af7e-c99c2fb8933a@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <07ab8b6f-cb58-4f8c-af7e-c99c2fb8933a@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_065442_597266_17471055 
X-CRM114-Status: GOOD (  22.55  )
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

On Thu, Jun 18, 2026 at 03:21:24PM +0100, Ryan Roberts wrote:
>On 11/06/2026 14:01, Adrian Barnaś wrote:
>> Remove the protection against huge vmap permission adjustments on
>> systems that support the bbml2_no_abort CPU feature.
>>
>> Splitting live kernel VA section mappings into page mappings was
>> restricted because it could cause TLB Conflict Aborts. This forced
>> permission adjustments on memory allocated with VM_ALLOW_HUGE_VMAP to be
>> rejected, resulting in performance drops (e.g., when enforcing rodata=on
>> disables huge mappings).
>>
>> The bbml2_no_abort feature (which mirrors the architectural guarantees of
>> FEAT_BBML3) ensures that changing between table and block sizes without
>> following a break-before-make sequence will not generate a TLB Conflict
>> Abort. This hardware guarantee makes it safe to allow dynamic permission
>> adjustments on huge vmap regions.
>
>FYI Linu Cherian has a series that renames bbml2_no_abort to bbml3. I think he's
>planning to post at -rc1. Would be good to rebase this on top once merged.
>

I will keep an eye on next releases.

>>
>> Signed-off-by: Adrian Barnaś <abarnas@google.com>
>> ---
>>  arch/arm64/mm/pageattr.c | 22 ++++++++++++++--------
>>  1 file changed, 14 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
>> index 358d1dc9a576..88720bbba892 100644
>> --- a/arch/arm64/mm/pageattr.c
>> +++ b/arch/arm64/mm/pageattr.c
>> @@ -157,23 +157,29 @@ static int change_memory_common(unsigned long addr, int numpages,
>>  	}
>>
>>  	/*
>> -	 * Kernel VA mappings are always live, and splitting live section
>> -	 * mappings into page mappings may cause TLB conflicts. This means
>> -	 * we have to ensure that changing the permission bits of the range
>> -	 * we are operating on does not result in such splitting.
>> -	 *
>>  	 * Let's restrict ourselves to mappings created by vmalloc (or vmap).
>> -	 * Disallow VM_ALLOW_HUGE_VMAP mappings to guarantee that only page
>> -	 * mappings are updated and splitting is never needed.
>>  	 *
>>  	 * So check whether the [addr, addr + size) interval is entirely
>>  	 * covered by precisely one VM area that has the VM_ALLOC flag set.
>>  	 */
>>  	area = find_vm_area((void *)addr);
>> +
>>  	if (!area ||
>>  	    ((unsigned long)kasan_reset_tag((void *)end) >
>>  	     (unsigned long)kasan_reset_tag(area->addr) + area->size) ||
>> -	    ((area->flags & (VM_ALLOC | VM_ALLOW_HUGE_VMAP)) != VM_ALLOC))
>> +	    !(area->flags & VM_ALLOC))
>> +		return -EINVAL;
>> +
>> +	/*
>> +	 * Kernel VA mappings are always live, and splitting live section
>> +	 * mappings into page mappings may cause TLB conflicts if bbml2_noabort
>> +	 * is not present.
>> +	 *
>> +	 * While bbml2_noabort is not present disallow VM_ALLOW_HUGE_VMAP mappings
>> +	 * to guarantee that only page mappings are updated and splitting is not
>> +	 * needed.
>> +	 */
>> +	if (!system_supports_bbml2_noabort() && (area->flags & (VM_ALLOW_HUGE_VMAP)))
>
>nit: no need for the parentheses around VM_ALLOW_HUGE_VMAP.
>
>With that:
>
>Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
>
>>  		return -EINVAL;
>>
>>  	if (!numpages)
>

Thanks,
Adrian

