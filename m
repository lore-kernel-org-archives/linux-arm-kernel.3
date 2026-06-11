Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86182CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 11:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cRjngGChT72OdyfI+6mmhcUVkfKxErUrhBdzRmYMjJY=; b=2pe+pI+JX1HlA7+szy6qwZ5N8x
	5mgkvPNk409FrmbmbUaAagTWvKl4r5xKvZj2MHZXiMcn2KI4jgRbfJwG7hhNOxEaVlNW9TUiKyxVw
	kCirkvvqB/NcH3etWN8qGu9AN+QTdlQiwgCPyU5t099efTSZpAsf5BAWdqE2fh/sxUC2Kvh6aoi3n
	cMFMSEx6g25f0rSbciTQ7g3XK0VgLZ95dQavSfFGLi7wggfsl5Co6l8ZYylZWxvchZ+kg7sWJZpzZ
	fjsAXrVM0nDwG126ijzbIgOyBVwP61FhGuOuXFj2T4Bh9daKj6eyC9jTstb7JZBROvqqSqVpr6CsP
	yNMcFtpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXe3W-00000009M3x-1FQ0;
	Thu, 11 Jun 2026 11:58:42 +0000
Received: from out-185.mta0.migadu.com ([2001:41d0:1004:224b::b9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXe3S-00000009M1V-3n0z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 11:58:40 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781179115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cRjngGChT72OdyfI+6mmhcUVkfKxErUrhBdzRmYMjJY=;
	b=iIHiRXWYOhkM76qqJ9NisfEY53PmcKcHbWDyAMpH5wWbBTNYdSqIzaeRLlrN4krVp50OP2
	755dQym1KT2Pw5aIBAYR1d/urcLO1QWd316sODKCu21CC2S6CM6GD4YRL+g7+XaZ1/bl1X
	7ykplj8gDBkU3rW5EXse1dcgY0A8G1E=
From: Lance Yang <lance.yang@linux.dev>
To: david@kernel.org
Cc: lance.yang@linux.dev,
	akpm@linux-foundation.org,
	xueyuan.chen21@gmail.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	hpa@zytor.com,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	yang@os.amperecomputing.com,
	jannh@google.com,
	dave.hansen@intel.com
Subject: Re: [RFC PATCH v2 1/3] mm/huge_memory: make persistent huge zero folio read-only
Date: Thu, 11 Jun 2026 19:58:17 +0800
Message-Id: <20260611115817.59353-1-lance.yang@linux.dev>
In-Reply-To: <8c36a91d-288f-4ffb-b2ec-41e3ef789d72@kernel.org>
References: <8c36a91d-288f-4ffb-b2ec-41e3ef789d72@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_045839_110150_424BC04B 
X-CRM114-Status: GOOD (  14.36  )
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


On Thu, Jun 11, 2026 at 01:28:58PM +0200, David Hildenbrand (Arm) wrote:
>On 6/10/26 04:15, Lance Yang wrote:
>> 
>> On Tue, Jun 09, 2026 at 12:45:49PM -0700, Andrew Morton wrote:
>>> On Tue,  9 Jun 2026 22:37:59 +0800 Xueyuan Chen <xueyuan.chen21@gmail.com> wrote:
>>>
>>>> The huge zero folio is shared globally, and its contents should never
>>>> change after initialization. As Jann Horn pointed out[1], the kernel has
>>>> had bugs, including security bugs, where read-only pages were later written
>>>> to. If the persistent huge zero folio is read-only in the direct map, such
>>>> writes fault instead of silently corrupting the shared zero contents.
>>>>
>>>> Add arch_make_pages_readonly() so mm code can request read-only direct-map
>>>> protection for a page range. Direct-map protection is
>>>> architecture-specific, so the generic weak implementation does nothing.
>>>>
>>>> This was inspired by Jann Horn's read-only zero page work[1] and follow-up
>>>> discussion[2] with Yang Shi.
>>>>
>>>> [1] https://lore.kernel.org/linux-mm/20260508-ro-zeropage-v1-1-9808abc20b49@google.com/
>>>> [2] https://lore.kernel.org/linux-mm/CAHbLzkrXXe7r3n3jXgDKtwZhRqj=jDx9E6dLOULohnhBguvi9A@mail.gmail.com/
>>>>
>>>> ...
>>>>
>>>> --- a/mm/huge_memory.c
>>>> +++ b/mm/huge_memory.c
>>>> @@ -308,6 +308,11 @@ static unsigned long shrink_huge_zero_folio_scan(struct shrinker *shrink,
>>>>  	return 0;
>>>>  }
>>>>  
>>>> +bool __weak arch_make_pages_readonly(struct page *page, int nr_pages)
>>>> +{
>>>> +	return false;
>>>> +}
>>>> +
>>>>  static struct shrinker *huge_zero_folio_shrinker;
>>>>  
>>>>  #ifdef CONFIG_SYSFS
>>>> @@ -982,8 +987,14 @@ static int __init thp_shrinker_init(void)
>>>>  		 * that get_huge_zero_folio() will most likely not fail as
>>>>  		 * thp_shrinker_init() is invoked early on during boot.
>>>>  		 */
>>>> -		if (!get_huge_zero_folio())
>>>> +		if (!get_huge_zero_folio()) {
>>>>  			pr_warn("Allocating persistent huge zero folio failed\n");
>>>> +			return 0;
>>>> +		}
>>>> +
>>>> +		arch_make_pages_readonly(folio_page(huge_zero_folio, 0),
>>>> +					HPAGE_PMD_NR);
>>>
>>> Can it simply pass the folio?
>> 
>> Right, this came from the RFC v1 discussion[1]. David preferred a page-
>> range helper for possible future non-folio callers, not something folio-
>> only.
>> 
>> Of course, we could also add a folio wrapper on top of that if needed :)
>
>Best to document that as part of the patch description: we don't really expect
>to have a lot of read-only folios in the near future (zero page is rather
>special; maybe it won't even be a folio in the future).

Ah, good to know, thanks. Will spell that out in RFC v3.

Maybe something like this?

The huge zero page is pretty special case, and maybe it won't even be a
folio in the future. Since read-only folios are unlikely to become a
common thing, a page-range helper is the cleaner fit.

