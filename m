Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28088CD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 12:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9S9SdGtbm1JyTfljX6WLjQs95rf1oKktzDq3rIIBuu0=; b=zUITvHv6hRb+yLMMDbRbeDon4Q
	MbFR85oiz3aZTppaB2ypTMdeUQZJOOvNqE6C7M1jL178sIFI9EL66j1jmr2+R8vcgvrCBdCDgSKTF
	J+LhrD8m0mmotzmGwWiYlrntXHmyJR+b3ZhX14Huf8RvS+O775U4j+iYnWxTV7JJWvWKURmUe2tzo
	A1K739W9eGcnJPgEE76m3HUv+E9YqD+ZcfNyEd5Kuk3X66rR7MJ+UphpmmFVFHUHAFFAiORMDIeDa
	Rl0G7QqkjlTbA5RQymOlYedFb4rIykvcKMMz5gtqUsgpHl7E7qspxWSRhM0IXj1PllR9cPOWpMqBP
	TwxH4T4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXest-00000009RWS-1Vxq;
	Thu, 11 Jun 2026 12:51:47 +0000
Received: from out-172.mta1.migadu.com ([2001:41d0:203:375::ac])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXesq-00000009RVF-3o4I
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 12:51:46 +0000
Message-ID: <1a547b9b-dd6a-40fb-8669-3bb307eb05e2@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781182291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9S9SdGtbm1JyTfljX6WLjQs95rf1oKktzDq3rIIBuu0=;
	b=eesZ0NDn4arZq1eS4Me+sKBxmY7/1zh2Xohy+gcqQwOvoaQoEOYaxTNVbuV3UrqYxOYMgS
	+wiEuiiDOgD4QpWz/uuqRw3jEL3Lso9r4Qc9VpX9LdZmf0E7EYh7LcKERuNt/hVveKmu5R
	QXn3GY34ZpXtYuPfbBLNl5hnkucIye0=
Date: Thu, 11 Jun 2026 20:50:04 +0800
MIME-Version: 1.0
Subject: Re: [RFC PATCH v2 1/3] mm/huge_memory: make persistent huge zero
 folio read-only
Content-Language: en-US
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: akpm@linux-foundation.org, xueyuan.chen21@gmail.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, catalin.marinas@arm.com, will@kernel.org, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 luto@kernel.org, peterz@infradead.org, hpa@zytor.com, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, ziy@nvidia.com, baolin.wang@linux.alibaba.com,
 npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
 baohua@kernel.org, yang@os.amperecomputing.com, jannh@google.com,
 dave.hansen@intel.com
References: <8c36a91d-288f-4ffb-b2ec-41e3ef789d72@kernel.org>
 <20260611115817.59353-1-lance.yang@linux.dev>
 <d943a03e-bf28-4086-8907-5a24665fb2f5@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <d943a03e-bf28-4086-8907-5a24665fb2f5@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_055145_099275_D537BA59 
X-CRM114-Status: GOOD (  11.10  )
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



On 2026/6/11 20:21, David Hildenbrand (Arm) wrote:
> On 6/11/26 13:58, Lance Yang wrote:
>>
>> On Thu, Jun 11, 2026 at 01:28:58PM +0200, David Hildenbrand (Arm) wrote:
>>> On 6/10/26 04:15, Lance Yang wrote:
>>>>
>>>>
>>>> Right, this came from the RFC v1 discussion[1]. David preferred a page-
>>>> range helper for possible future non-folio callers, not something folio-
>>>> only.
>>>>
>>>> Of course, we could also add a folio wrapper on top of that if needed :)
>>>
>>> Best to document that as part of the patch description: we don't really expect
>>> to have a lot of read-only folios in the near future (zero page is rather
>>> special; maybe it won't even be a folio in the future).
>>
>> Ah, good to know, thanks. Will spell that out in RFC v3.
>>
>> Maybe something like this?
>>
>> The huge zero page is pretty special case, and maybe it won't even be a
>> folio in the future. Since read-only folios are unlikely to become a
>> common thing, a page-range helper is the cleaner fit.
> 
> Right. And if read-only folios in FSes become a real thing, we can always add
> infrastructure for that.

Got it, that draws the line nicely :P

