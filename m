Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA244C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 06:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RIqr1G8w341JdjB67nlcBhtQ9EOdz3z9dERZmNVdkZk=; b=aR3Jto3Ti3zqdMxOcgKTxft1I3
	ayWsUBs0oehzFihBW+0JXRKw8GenHo+I8VnMkSXpemqEOaDnAcXCt8Jk9Sc3lHapE2Do6GKLrfIpi
	nmhpndpHul/q+q71X0gzfJ+vHX5nggRJ6T8P2KCpevk87JH3FefGmSk+TjlF+OAVSIVWGf8AuWzHB
	1FWM0PhsGcZnQmxxrEkwdq6pgVs2k26EBEhnfa9xBM6W+f1rs3Fru+fumk0Wz11irs3Xw+kqHScMS
	kyZcVfDr4ZNDaPOVvIRCI+b2NtfALtq3UEzLUHAtidE1WHhVSRXiFkf72xGG6BEzG8LV8xUtUVPJM
	MZoCr/Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV2dQ-0000000DiEC-1XKU;
	Fri, 27 Jun 2025 06:32:28 +0000
Received: from out-177.mta1.migadu.com ([95.215.58.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV2MF-0000000Dg7n-02uo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 06:14:45 +0000
Message-ID: <e33bbf93-ed78-4cbd-9ed7-1e36453549c0@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751004880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RIqr1G8w341JdjB67nlcBhtQ9EOdz3z9dERZmNVdkZk=;
	b=YfudznCYk3WoX9DBBDdaJTY5VlTsRNSRfpU+C/HCgg4VyCUC021HG0XVnTunKtN57mjv5I
	P9Md7kHGGVfC0XgIc8DZFDdo/bVJqb8S9fohOQPbyv4PUceTJBy2Cwl1fATsK446rJr5f1
	YBewEH6Gy68GWtDSCHkKRwOtL6+xozs=
Date: Fri, 27 Jun 2025 14:14:32 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] mm/rmap: make folio unmap batching safe and support
 partial batches
Content-Language: en-US
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, david@redhat.com,
 baolin.wang@linux.alibaba.com, chrisl@kernel.org, kasong@tencent.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com,
 x86@kernel.org, huang.ying.caritas@gmail.com, zhengtangquan@oppo.com,
 riel@surriel.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 harry.yoo@oracle.com, mingzhe.yang@ly.com, Lance Yang <ioworker0@gmail.com>
References: <20250627025214.30887-1-lance.yang@linux.dev>
 <CAGsJ_4yjvHzeUTDoALafLddTCTOSzYiFQNvAmSQORLJV1HPhPQ@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <CAGsJ_4yjvHzeUTDoALafLddTCTOSzYiFQNvAmSQORLJV1HPhPQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_231443_796849_F96C1613 
X-CRM114-Status: GOOD (  13.18  )
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



On 2025/6/27 13:02, Barry Song wrote:
> On Fri, Jun 27, 2025 at 2:53 PM Lance Yang <ioworker0@gmail.com> wrote:
>>
>> From: Lance Yang <lance.yang@linux.dev>
>>
>> As pointed out by David[1], the batched unmap logic in try_to_unmap_one()
>> can read past the end of a PTE table if a large folio is mapped starting at
>> the last entry of that table.
>>
>> So let's fix the out-of-bounds read by refactoring the logic into a new
>> helper, folio_unmap_pte_batch().
>>
>> The new helper now correctly calculates the safe number of pages to scan by
>> limiting the operation to the boundaries of the current VMA and the PTE
>> table.
>>
>> In addition, the "all-or-nothing" batching restriction is removed to
>> support partial batches. The reference counting is also cleaned up to use
>> folio_put_refs().
>>
>> [1] https://lore.kernel.org/linux-mm/a694398c-9f03-4737-81b9-7e49c857fcbe@redhat.com
>>
>> Fixes: 354dffd29575 ("mm: support batched unmap for lazyfree large folios during reclamation")
>> Suggested-by: David Hildenbrand <david@redhat.com>
>> Suggested-by: Barry Song <baohua@kernel.org>
>> Signed-off-by: Lance Yang <lance.yang@linux.dev>
> 
> I'd prefer changing the subject to something like
> "Fix potential out-of-bounds page table access during batched unmap"

Yep, that's much better.

> 
> Supporting partial batching is a cleanup-related benefit of this fix.
> It's worth mentioning that the affected cases are quite rare,
> since MADV_FREE typically performs split_folio().

Yeah, it would be quite rare in practice ;)

> 
> Also, we need to Cc stable.

Thanks! Will do.


