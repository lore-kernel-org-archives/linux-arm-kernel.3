Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E30DC7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 16:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kBC/1zbAsFpTgrTOlWvqmN/0W6sOeRbe2I8GaEuZn+U=; b=t5BEZkXGOGqWGYaiz48BeCiSgM
	FeyOiCllJKj7xMK+hHXOocsBTfI/FQBX25yhfEDVqwNMUBpzEvyosyUuAkGUajFRNgUPXc99zqGGC
	mrCkDMr5wZmsMvB9+klenOIRC59Ghnd67awoOwqviqk+HTsKMygPAV3wvc/who2UvPTiW2cSQJpU0
	zzR/yb3b6U9hlKhVEn/OKnVK4lZQ8OeGQzZjb6dsAGFFU9VyNdhowVBCwbMm50MiO9ER/fGmnBybp
	40ZNJHuDYoc14ZiSpUPh7fCMKUpcQ+Jz5eCVPbc86z6JRzAMLQYAuXWuBhLsOfR3zLdRosEkO/iwh
	aOeQnz5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUp6Y-0000000CDRZ-1CPJ;
	Thu, 26 Jun 2025 16:05:38 +0000
Received: from out-176.mta1.migadu.com ([95.215.58.176])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUoCI-0000000C3UO-3iZK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 15:07:32 +0000
Message-ID: <424599d3-9bd0-4cd5-9ad7-37cebdc765e5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750950438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kBC/1zbAsFpTgrTOlWvqmN/0W6sOeRbe2I8GaEuZn+U=;
	b=rwXJthZvAow/TQ7NghrfNCplJc1HKGgRLL2BT/VCLAVS9iExHzIvFe76KM5Ym+drnT9iNK
	I7eq87HK3WMGi/9Y+aMJIQQOZ4EVrCIDZNQKaKIUbL0aGyMz4LGpRNYOOURq7W4o4CbUDK
	om962XvRHAyMXkvg+foBGCsYMvV/vvI=
Date: Thu, 26 Jun 2025 23:06:11 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>
Cc: 21cnbao@gmail.com, akpm@linux-foundation.org,
 baolin.wang@linux.alibaba.com, chrisl@kernel.org, kasong@tencent.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com,
 x86@kernel.org, ying.huang@intel.com, zhengtangquan@oppo.com,
 Lance Yang <ioworker0@gmail.com>
References: <20250626092905.31305-1-ioworker0@gmail.com>
 <20250626124445.77865-1-ioworker0@gmail.com>
 <1a55f9f3-f5b1-4761-97ba-423756c707fe@redhat.com>
 <ce78181f-b8f0-4710-be22-eff123760a51@linux.dev>
 <6fbcf806-eb3c-4bcd-8daf-8d87fd759d2b@redhat.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <6fbcf806-eb3c-4bcd-8daf-8d87fd759d2b@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_080731_060891_5D4D8FE4 
X-CRM114-Status: UNSURE (   9.34  )
X-CRM114-Notice: Please train this message.
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



On 2025/6/26 22:39, David Hildenbrand wrote:
[...]
>>>> @@ -1870,12 +1870,13 @@ static inline unsigned int
>>>> folio_unmap_pte_batch(struct folio *folio,
>>>>            return 1;
>>>>        /* ... where we must be able to batch the whole folio. */
>>>
>>> Why is that still required? :)
>>
>> Sorry ... I was still stuck in the "all-or-nothing" mindset ...
>>
>> So, IIUC, you mean we should completely remove the "max_nr < nr_pages"
>> check and just let folio_pte_batch handle whatever partial batch it
>> safely can.
>>
>>>
>>>> -    if (pte_pfn(pte) != folio_pfn(folio) || max_nr !=
>>>> folio_nr_pages(folio))
>>>> +    if (pte_pfn(pte) != folio_pfn(folio) || max_nr < nr_pages)
>>>>            return 1;
>>>> -    max_nr = folio_pte_batch(folio, addr, pvmw->pte, pte, max_nr,
>>>> fpb_flags,
>>>> -                 NULL, NULL, NULL);
>>>> -    return (max_nr != folio_nr_pages(folio)) ? 1 : max_nr;
>>>> +    max_nr = folio_pte_batch(folio, addr, pvmw->pte, pte, nr_pages,
>>>> +                 fpb_flags, NULL, NULL, NULL);
>>>> +
>>>> +    return (max_nr != nr_pages) ? 1 : max_nr;
>>>
>>> Why is that still required? :)
>>
>> Then simply return the number of PTEs that consecutively map to the
>> large folio. Right?
> 
> Yes. Any part of the large folio. Just return folio_pte_batch() ...
> 

Ah, got it. Thanks!


