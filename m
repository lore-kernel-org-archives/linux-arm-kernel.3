Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93F7CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 02:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sUscgkaVB9GhkTyYmcNNOPyIpn4q5HzwEqwgoYRL1cI=; b=jJrPXkcUsBVQcpVq4e6BoRrmwa
	/U3BSQbnV1aYC7+tp+TVu8mf1HibenU/0v7GQciBjEnqmmPpeIgLTt8Pkvc4DlZ7oqHw/gV2CtUOo
	KTp/IBEtQ+YrL3KMfvwaGtCeBjf1UiWvppGztXUU1txsT/Q653d6kVMAsFj16bp8cxu/gaVy1TLYZ
	/3cWIjOcM0MwiylnK3mF+MxThJlgAM7cjocFd2Zi3SSR0slXFwSxc3HAWUBAkkj6LXp88lVBKGKrz
	bOxMOq3I6JxqGMdo4eNszZH3LzbglkjEhQ5G5eBc6PpEW5MVTC6MwPzyLLe/UzcgtBhAEWKwipQEt
	cjDtSaqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX8Tl-00000006gq7-1WhG;
	Wed, 10 Jun 2026 02:15:41 +0000
Received: from out-171.mta1.migadu.com ([95.215.58.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX8Th-00000006gpM-3TIQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 02:15:39 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781057722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sUscgkaVB9GhkTyYmcNNOPyIpn4q5HzwEqwgoYRL1cI=;
	b=D6ijSBnPu590JadANQn6yWI4D34v3+8oS/4hsrM+AztYMR9ELQesm+n+bMbpuT5UnnPVdP
	3Sm7CUM7F7pRDF+SZFmKWng6A/cUb4qDR+aUBv6agV1CvTEsE1Q0M3wyCDU3CXHWnk0aUn
	MwSKL8vK12126gyL1mz8G54ZZJd+g4c=
From: Lance Yang <lance.yang@linux.dev>
To: akpm@linux-foundation.org
Cc: xueyuan.chen21@gmail.com,
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
	david@kernel.org,
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
	lance.yang@linux.dev,
	yang@os.amperecomputing.com,
	jannh@google.com,
	dave.hansen@intel.com
Subject: Re: [RFC PATCH v2 1/3] mm/huge_memory: make persistent huge zero folio read-only
Date: Wed, 10 Jun 2026 10:15:07 +0800
Message-Id: <20260610021508.46000-1-lance.yang@linux.dev>
In-Reply-To: <20260609124549.aff7e774603c4af188009408@linux-foundation.org>
References: <20260609124549.aff7e774603c4af188009408@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_191538_022215_A2CF3908 
X-CRM114-Status: GOOD (  12.58  )
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


On Tue, Jun 09, 2026 at 12:45:49PM -0700, Andrew Morton wrote:
>On Tue,  9 Jun 2026 22:37:59 +0800 Xueyuan Chen <xueyuan.chen21@gmail.com> wrote:
>
>> The huge zero folio is shared globally, and its contents should never
>> change after initialization. As Jann Horn pointed out[1], the kernel has
>> had bugs, including security bugs, where read-only pages were later written
>> to. If the persistent huge zero folio is read-only in the direct map, such
>> writes fault instead of silently corrupting the shared zero contents.
>> 
>> Add arch_make_pages_readonly() so mm code can request read-only direct-map
>> protection for a page range. Direct-map protection is
>> architecture-specific, so the generic weak implementation does nothing.
>> 
>> This was inspired by Jann Horn's read-only zero page work[1] and follow-up
>> discussion[2] with Yang Shi.
>> 
>> [1] https://lore.kernel.org/linux-mm/20260508-ro-zeropage-v1-1-9808abc20b49@google.com/
>> [2] https://lore.kernel.org/linux-mm/CAHbLzkrXXe7r3n3jXgDKtwZhRqj=jDx9E6dLOULohnhBguvi9A@mail.gmail.com/
>> 
>> ...
>>
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
>> @@ -308,6 +308,11 @@ static unsigned long shrink_huge_zero_folio_scan(struct shrinker *shrink,
>>  	return 0;
>>  }
>>  
>> +bool __weak arch_make_pages_readonly(struct page *page, int nr_pages)
>> +{
>> +	return false;
>> +}
>> +
>>  static struct shrinker *huge_zero_folio_shrinker;
>>  
>>  #ifdef CONFIG_SYSFS
>> @@ -982,8 +987,14 @@ static int __init thp_shrinker_init(void)
>>  		 * that get_huge_zero_folio() will most likely not fail as
>>  		 * thp_shrinker_init() is invoked early on during boot.
>>  		 */
>> -		if (!get_huge_zero_folio())
>> +		if (!get_huge_zero_folio()) {
>>  			pr_warn("Allocating persistent huge zero folio failed\n");
>> +			return 0;
>> +		}
>> +
>> +		arch_make_pages_readonly(folio_page(huge_zero_folio, 0),
>> +					HPAGE_PMD_NR);
>
>Can it simply pass the folio?

Right, this came from the RFC v1 discussion[1]. David preferred a page-
range helper for possible future non-folio callers, not something folio-
only.

Of course, we could also add a folio wrapper on top of that if needed :)

[1] https://lore.kernel.org/linux-mm/929875a2-9e94-4dbc-9c98-b342ccc3f4e2@kernel.org/

Thanks, Lance

