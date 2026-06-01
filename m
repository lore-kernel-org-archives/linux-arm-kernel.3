Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E82CCD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 15:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mgxgY8d+G/6RTOQ+BJPpqzlDf4UdD5DQTydgCd5fyJg=; b=AIPl71wd5PQN9adupmGn01ROv6
	kkmW6NVyCx6GX86wXwGykaaWxMFI2PxL2VV/bVxHUX0g8/4/RNwKITH1uK/TIGr9IoX5nrA5p1ESf
	SuSwEuutdNAzHl2k6KpgPQLPE6OgBirX3hK5Ya1tIH0WqByCQZjWC2TlTI6t35pnRqTFHzhcOqA5D
	u4SGhMAnCrfQCMiT8hwgTH5cU/maxPdRK1pFhjWWBp9yEuI0q40isTD8tBEB2DPSxu8SUtg/aHhx7
	t02u4hGNIwjbCAcyVjkj7Oz2u3qJf8D361kPdCdR5hlEjJy14QeaLahqnSglYp1iIMhvRwgAFsjBg
	c9egTWGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU4oX-0000000BOqA-3jrG;
	Mon, 01 Jun 2026 15:44:29 +0000
Received: from out-183.mta0.migadu.com ([91.218.175.183])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU4oV-0000000BOpD-0kZg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 15:44:28 +0000
Message-ID: <bbecce76-c677-4045-b0d1-ba822b84dcf5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780328656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mgxgY8d+G/6RTOQ+BJPpqzlDf4UdD5DQTydgCd5fyJg=;
	b=SW2HVAvw2yZu4I9MOOCod0UfssJYy4pt1A9hpEgVLqAe2/h1H9PZfGvrqmQ/pQbWApbAVx
	B2oofFQxFPT+jwLRowiWeqH/MqwmXVsj9A2gLQChaPYxKS5mCUEsoS/sy7zrgP4Ss71B8M
	J/USgdBKjwLAy16nGeLo9BqWWNTSL38=
Date: Mon, 1 Jun 2026 23:43:56 +0800
MIME-Version: 1.0
Subject: Re: [RFC PATCH 1/3] mm: make persistent huge zero folio read-only
Content-Language: en-US
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Dave Hansen <dave.hansen@intel.com>, Xueyuan chen <xueyuan.chen21@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, catalin.marinas@arm.com, will@kernel.org, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
 ljs@kernel.org, ziy@nvidia.com, baolin.wang@linux.alibaba.com,
 akpm@linux-foundation.org, ryan.roberts@arm.com, dev.jain@arm.com,
 yang@os.amperecomputing.com, jannh@google.com, linux-mm@kvack.org
References: <20260527035607.14919-1-xueyuan.chen21@gmail.com>
 <20260527035607.14919-2-xueyuan.chen21@gmail.com>
 <4e0696ee-895c-486d-aacc-71146f0e9047@intel.com>
 <929875a2-9e94-4dbc-9c98-b342ccc3f4e2@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <929875a2-9e94-4dbc-9c98-b342ccc3f4e2@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_084427_379023_BA03A060 
X-CRM114-Status: GOOD (  11.17  )
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



On 2026/6/1 21:49, David Hildenbrand (Arm) wrote:
> On 5/27/26 17:55, Dave Hansen wrote:
>> On 5/26/26 20:56, Xueyuan chen wrote:> +#ifdef
>> CONFIG_READONLY_HUGE_ZERO_FOLIO
>>> +bool __init arch_make_huge_zero_folio_readonly(struct folio *folio);
>>> +#endif
>>
>> All of the #ifdeffery needs to die, IMNHO.
>>
>> This function is also a bad idea. There is nothing "huge zero" specific
>> about it. It takes any old folio and tries to make it read only.
>>
>> Just make it:
>>
>> 	bool __init arch_make_folio_readonly(struct folio *folio)
>>
> 
> I'm not sure whether we want a folio-based interface, though.
> 
> This will likely be the only folio (that will actually have a "struct folio" in
> the future) compound page we'll ever mark read-only ... whereby I'd guess we'd
> want other non-folio pages to be read-only in the future (encryption keys etc,
> maybe?).
> 
> So I'd instead use a page-range based interface or sth like that.

Just to check, did you mean something like:

bool arch_make_pages_readonly(struct page *page, int nr_pages);

?

So it can work on pages as well, not only folios :)

