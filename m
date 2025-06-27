Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE4D3C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 07:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2YlWsvrV7BaACfyKv597+qNsvY3pISsv0aYbyAd91Ns=; b=G8ETxhIKgKx4pkimXbOI7QwmJf
	OTAy8LAqGIoZxn0m/J2/JHat7k7ZbZv8Rv+Lw6aJm5tUifaIEZ1r3rew3FMDE51xO5AWro/YxdvNr
	CUmWSoUovucX9w/P6vgnrdC2zS15Youi/kOFyyrK18Y265wCvrVKI2zLUCYPVRN4w4BC6UhLXA+j7
	ByCgHjCnxg26p5vjH+fUdzg4H4diszGLeakUjZOR92KY1C0TI+XWvRvo1kdRuA5k0b/CFJBam1AEj
	hul7OoEK5Z21BC/nyaaGHlhNsjIVwiYReidFJXZVxjmBMd8VUyVVb1cc9IF3UeVlPMF+u2QDJbIje
	J+Y6IKzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV3Zn-0000000Dpnh-0FXy;
	Fri, 27 Jun 2025 07:32:47 +0000
Received: from out-179.mta0.migadu.com ([91.218.175.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV3JR-0000000Do4E-3U4W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 07:15:55 +0000
Message-ID: <1d39b66e-4009-4143-a8fa-5d876bc1f7e7@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751008550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2YlWsvrV7BaACfyKv597+qNsvY3pISsv0aYbyAd91Ns=;
	b=b/S9FkV17dZyBU9gyIoqvCZ9lEWKMXK/izhpXtTf2yF3lzMVVnGX5YDWIEAMOyw+JsnWYy
	ZS/rlXdv+yGYpIGe7LtEkl5IvH7HC+w5BVIfUfUlYeVeQFfEQNv2+ilmf3FIPf6WpIp1B5
	GZr8YjBl/kjDa13f8vVty5wzMBiXjgI=
Date: Fri, 27 Jun 2025 15:15:41 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/1] mm/rmap: fix potential out-of-bounds page table
 access during batched unmap
Content-Language: en-US
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, david@redhat.com,
 baolin.wang@linux.alibaba.com, chrisl@kernel.org, kasong@tencent.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com,
 x86@kernel.org, huang.ying.caritas@gmail.com, zhengtangquan@oppo.com,
 riel@surriel.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 harry.yoo@oracle.com, mingzhe.yang@ly.com, stable@vger.kernel.org,
 Lance Yang <ioworker0@gmail.com>
References: <20250627062319.84936-1-lance.yang@linux.dev>
 <CAGsJ_4xQW3O=-VoC7aTCiwU4NZnK0tNsG1faAUgLvf4aZSm8Eg@mail.gmail.com>
 <CAGsJ_4z+DU-FhNk9vkS-epdxgUMjrCvh31ZBwoAs98uWnbTK-A@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <CAGsJ_4z+DU-FhNk9vkS-epdxgUMjrCvh31ZBwoAs98uWnbTK-A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_001554_268963_4D9B0BB3 
X-CRM114-Status: GOOD (  13.95  )
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



On 2025/6/27 14:55, Barry Song wrote:
> On Fri, Jun 27, 2025 at 6:52 PM Barry Song <21cnbao@gmail.com> wrote:
>>
>> On Fri, Jun 27, 2025 at 6:23 PM Lance Yang <ioworker0@gmail.com> wrote:
>>>
>>> From: Lance Yang <lance.yang@linux.dev>
>>>
>>> As pointed out by David[1], the batched unmap logic in try_to_unmap_one()
>>> can read past the end of a PTE table if a large folio is mapped starting at
>>> the last entry of that table. It would be quite rare in practice, as
>>> MADV_FREE typically splits the large folio ;)
>>>
>>> So let's fix the potential out-of-bounds read by refactoring the logic into
>>> a new helper, folio_unmap_pte_batch().
>>>
>>> The new helper now correctly calculates the safe number of pages to scan by
>>> limiting the operation to the boundaries of the current VMA and the PTE
>>> table.
>>>
>>> In addition, the "all-or-nothing" batching restriction is removed to
>>> support partial batches. The reference counting is also cleaned up to use
>>> folio_put_refs().
>>>
>>> [1] https://lore.kernel.org/linux-mm/a694398c-9f03-4737-81b9-7e49c857fcbe@redhat.com
>>>
>>
>> What about ?
>>
>> As pointed out by David[1], the batched unmap logic in try_to_unmap_one()
>> may read past the end of a PTE table when a large folio spans across two PMDs,
>> particularly after being remapped with mremap(). This patch fixes the
>> potential out-of-bounds access by capping the batch at vm_end and the PMD
>> boundary.
>>
>> It also refactors the logic into a new helper, folio_unmap_pte_batch(),
>> which supports batching between 1 and folio_nr_pages. This improves code
>> clarity. Note that such cases are rare in practice, as MADV_FREE typically
>> splits large folios.
> 
> Sorry, I meant that MADV_FREE typically splits large folios if the specified
> range doesn't cover the entire folio.

Hmm... I got it wrong as well :( It's the partial coverage that triggers 
the split.

how about this revised version:

As pointed out by David[1], the batched unmap logic in try_to_unmap_one()
may read past the end of a PTE table when a large folio spans across two
PMDs, particularly after being remapped with mremap(). This patch fixes
the potential out-of-bounds access by capping the batch at vm_end and the
PMD boundary.

It also refactors the logic into a new helper, folio_unmap_pte_batch(),
which supports batching between 1 and folio_nr_pages. This improves code
clarity. Note that such boundary-straddling cases are rare in practice, as
MADV_FREE will typically split a large folio if the advice range does not
cover the entire folio.


