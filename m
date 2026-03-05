Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625EBF30955
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 12:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SbxQf47xfZ/5C2jELl3sJw8N8vSCBcYcs6zW8A2N7KM=; b=0Dg3lt+h0M2FUkJoVBDe+FTYgL
	mqaSY5JgbOipZS/UkNsSGgY7GUA8B+7Z2bRh3+0UlaIbrYuVBlNDa7KQduULq5AYXWOlwLMxeoQKd
	BQ8UANMcd23eT4Pv38a6Sbc9SbA1GJKLK9mHCfIqvecOdiBDCimu4RP3B0usYqjDpRhxTqDo14jwB
	NZoW4HQ/k8ObnLvPFu7fIvNGFhd039+GN8uqgwV+78qa+5nkJJk62AxdD7yB6gwkj5uo5B130+z/d
	IhsuqjUJSPgt9YXcq61jxAZZWcNyRRp4IA33lWL1Ni2PxkQZ0n4/Ie3uJa6NNyLFzoB1M87lUfYVB
	R5bsTp0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy7zZ-00000001msg-1Zmg;
	Thu, 05 Mar 2026 12:39:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy7zY-00000001ms7-117y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 12:39:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 447446183D;
	Thu,  5 Mar 2026 12:39:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AEA2C19423;
	Thu,  5 Mar 2026 12:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772714387;
	bh=NHjvP5Apmcg681KyizLkhQcHDwKR9Nf0s0Y484PlvsA=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=P9ZCpTm1C4pe2uAMW7UXulE7Cj+noO09jxkI0IAcsCHXDK+ESrzixqBiWF1lNG3JS
	 B3UUBAEApJ0pH9jMpMJUF3hu9+uevGNBlHRzCZ+9zrNMg09LhEw6sVVj5pwCi3Vo8/
	 dLRxaXLPK0V4srgxVV1s/M5AIWmLyPmbr+FrTTOv8hoqjZZSY/YE0dh5n2Z3V5gyfX
	 W/wze6nPqQoKPpl3ADdqw7zgRNw+oYa1kclyeH6hULDs6IiX04jDTI19C5hI4KJO34
	 FWSiKcFHzvK2Pa5n506ZfD7toKcC0yj0cTnMzr3zI+QUAt16ywy3mz5DeFppf/IkJO
	 bVqQeepibU1eQ==
Message-ID: <3884dd41-8ab1-45ee-8daa-198384d59c20@kernel.org>
Date: Thu, 5 Mar 2026 13:39:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 2/2] arm64/mm: Reject memory removal that splits a
 kernel leaf mapping
From: "David Hildenbrand (Arm)" <david@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Yang Shi <yang@os.amperecomputing.com>,
 Christoph Lameter <cl@gentwo.org>, linux-kernel@vger.kernel.org
References: <20260305053148.3765710-1-anshuman.khandual@arm.com>
 <20260305053148.3765710-3-anshuman.khandual@arm.com>
 <a2b81b60-eb8e-44a2-84fe-8c61bc5fadbe@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <a2b81b60-eb8e-44a2-84fe-8c61bc5fadbe@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 3/5/26 13:37, David Hildenbrand (Arm) wrote:
> On 3/5/26 06:31, Anshuman Khandual wrote:
>> Linear and vmemmap mappings that get torn down during a memory hot remove
>> operation might contain leaf level entries on any page table level. If the
>> requested memory range's linear or vmemmap mappings falls within such leaf
>> entries, new mappings need to be created for the remaining memory mapped on
>> the leaf entry earlier, following standard break before make aka BBM rules.
>> But kernel cannot tolerate BBM and hence remapping to fine grained leaves
>> would not be possible on systems without BBML2_NOABORT.
>>
>> Currently memory hot remove operation does not perform such restructuring,
>> and so removing memory ranges that could split a kernel leaf level mapping
>> need to be rejected.
>>
>> While memory_hotplug.c does appear to permit hot removing arbitrary ranges
>> of memory, the higher layers that drive memory_hotplug (e.g. ACPI, virtio,
>> ...) all appear to treat memory as fixed size devices. So it is impossible
>> to hot unplug a different amount than was previously hot plugged, and hence
>> we should never see a rejection in practice, but adding the check makes us
>> robust against a future change.
>>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Link: https://lore.kernel.org/all/aWZYXhrT6D2M-7-N@willie-the-truck/
>> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
>> Suggested-by: Ryan Roberts <ryan.roberts@arm.com>
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
> 
> [...]
> 
>> +
>> +	/*
>> +	 * PFN range's linear map edges are leaf entry aligned
>> +	 */
> 
> Nit: single-line comments are usually written as
> 
> /* ... */
> 
>> +	start = __phys_to_virt(phys_start);
>> +	end =  __phys_to_virt(phys_end);
>> +	if (addr_splits_kernel_leaf(start) || addr_splits_kernel_leaf(end)) {
>> +		pr_warn("[%lx %lx] splits a leaf entry in linear map\n",
>> +			phys_start, phys_end);
>> +		return false;
>> +	}
>> +
>> +	/*
>> +	 * PFN range's vmemmap edges are leaf entry aligned
>> +	 */
> 
> Dito.
> 
> LGTM, thanks!
> 
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> 

In fact,

Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>

:)

-- 
Cheers,

David

