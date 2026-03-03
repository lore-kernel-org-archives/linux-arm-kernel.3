Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF04E67A9B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 09:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hAmgGPSYsj6mBhFgQ4TVKIloeXzWPIr90l9O3rgeS6A=; b=iqijCm1C2I6FYzkVey2/T2LKYj
	NeO8mA2tXs6qSfK6rYMY8/+bI+0rv1fh6uVzqBIVSlfN/5rKZ0tAgFJCwhb0M9CPhKGSsPfgAWCsa
	PvhzlmIWf5xFpAGfIS54NpP8WlMfMPdFE8nARoZ2mKKIYEqpGc4PqExLaDKZgshb37GputzjLi4xD
	ruQIHhN7JNre7nK5mYgcDBbVlt8hLSB6tg/3EAWam58e8XH35Qdc5NaPT/5uSg5rSOBEoeUU1EMCM
	tHF7XtLGLMxpoyE1Tk+zOVCUsNyt0a3lLJ7vmMoJreRwib3jLi3X73gYuMxyAJMro8EFWQdiarUAj
	12bEyoEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxLci-0000000EpeI-0p3y;
	Tue, 03 Mar 2026 09:01:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxLcb-0000000Epdi-3aU5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 09:00:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 269D243335;
	Tue,  3 Mar 2026 09:00:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1713C116C6;
	Tue,  3 Mar 2026 09:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772528453;
	bh=3dVrtbk4cGUF1pWmZh+6baPm+xvADcchrMO5vTV2IvE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ccnNdfoJ5l+jc5QqQZQ2k0gHRvVY+IvHBiVv77pmPxkvbGv1cDMPgODVvy8IYbq3y
	 HsmtdmRbBWVGoVLp0+JZ6vq8ImAdepWoGX49zoXrDhEl9sE59TNSZyTvfbTn83g1UA
	 6ly0Nu+su+M+7zKfFuBHxd1vGp0hMCdKGnZMk1lyE3YyLSgz5IeNkRL8I/hi164drR
	 xt/jXBwfAD9PerGPUWZrumQHMA028QFDQfXBwa9G9PjQcOzA6uShTxuQ8jsTxQGMwk
	 3si5ZOHuIkj5xpHufNWARGA28uRH6+COtQCpM4dWRsfMJEf0S2i+dp1k6vzUdaI1IT
	 OKQccE+kZayGQ==
Message-ID: <05e6034d-3493-4961-a97d-a80fff78289b@kernel.org>
Date: Tue, 3 Mar 2026 10:00:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/2] arm64/mm: Reject memory removal that splits a
 kernel leaf mapping
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Yang Shi <yang@os.amperecomputing.com>, Christoph Lameter <cl@gentwo.org>,
 linux-kernel@vger.kernel.org
References: <20260224062423.972404-1-anshuman.khandual@arm.com>
 <20260224062423.972404-3-anshuman.khandual@arm.com>
 <6eee7f14-c3f2-4e16-b713-65c2ea141457@kernel.org>
 <2d07e814-a7a3-4cec-8a59-158420bde1f2@arm.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <2d07e814-a7a3-4cec-8a59-158420bde1f2@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_010053_983941_25E2C080 
X-CRM114-Status: GOOD (  15.46  )
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

>> I can understand the desire for this check, but I am confused about Fixes:
> 
> Probably nothing is broken now I guess but the original memory hot remove
> patch should have taken care of this scenario. Although don't have strong
> opinions either way. We could drop both "Fixes" and "Closes" tags here if
> that is preferred.
> 

We tend to only tag actual fixes. If we consider this a possible fix, we
should ask ourselves whether this would be stable material.

...

>>> +		return false;
>>> +
>>> +	pgdp = pgd_offset_k(addr);
>>> +	pgd = pgdp_get(pgdp);
>>> +	if (!pgd_present(pgd))
>>> +		return false;
>>
>> How could we end up with non-present areas in a range we hotplugged earlier?
> 
> We might not in reality but in order to be sure just an additional protection.

I'm rather wondering if this would indicate a real bug somewhere else
that we would silently swallow.

Anyhow, no real preference from my side, just something I considered weird.

[...]

>>> +
>>> +static bool can_unmap_without_split(unsigned long pfn, unsigned long nr_pages)
>>> +{
>>> +	unsigned long phys_start, phys_end, size, start, end;
>>> +
>>> +	phys_start = PFN_PHYS(pfn);
>>> +	phys_end = phys_start + nr_pages * PAGE_SIZE;
>>> +
>>> +	/*
>>> +	 * PFN range's linear map edges are leaf entry aligned
>>> +	 */
>>> +	start = __phys_to_virt(phys_start);
>>> +	end =  __phys_to_virt(phys_end);
>>> +	if (addr_splits_kernel_leaf(start) || addr_splits_kernel_leaf(end)) {
>>> +		pr_warn("[%lx %lx] splits a leaf entry in linear map\n",
>>> +			phys_start, phys_end);
>>> +		return false;
>>> +	}
>>> +
>>> +	/*
>>> +	 * PFN range's vmemmap edges are leaf entry aligned
>>> +	 */
>>> +	size = nr_pages * sizeof(struct page);
>>> +	start = (unsigned long)pfn_to_page(pfn);
>>> +	end = start + size;
>>
>> As arm64 cannot be used with CONFIG_SPARSEMEM (only with
>> CONFIG_SPARSEMEM_VMEMMAP, as it sets SPARSEMEM_VMEMMAP_ENABLE),
>> I think you can just do

Just to clarify:

What I meant here is: with CONFIG_SPARSEMEM but without
CONFIG_SPARSEMEM_VMEMMAP.


-- 
Cheers,

David

