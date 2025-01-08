Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CB1E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 11:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j4wmS7H8dGfpoIByQwrpWO7x+faK8pib1ddK+J2PaS8=; b=PKTtP0vDmDeKKoHh6gOtzIXTKL
	GFCvqouleuhAgPdtbR1e+VYlyZ0AT1Gm3DURtsVXXlgUY/sPJuvaVyW9inCISmFQK1isP5fMHhigu
	Pj2tMnazjeX40ehJQ0iqF1fRxyDR917qILDO3Ce/Skik2iZAYk8L+TDAN/zMu3HmhE84NMc3kwC/7
	jIbyLbbVSevmuxxJmnodonjx041+bfdH9h+ukkohxWpznGo8s/i5G2aXJU041D42GgGvamFbl+VCD
	LEYxDIOM0iLrzHpU0PaVCwWySg1gk1SaNZzkYjUPsohkFkYZQm0BsPmLldofiY1G8sTxsJa9WvSCP
	W1Mp/QKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVTnt-0000000877c-3V3Z;
	Wed, 08 Jan 2025 11:00:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVTfi-000000084DO-1lWW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 10:52:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3275013D5;
	Wed,  8 Jan 2025 02:52:50 -0800 (PST)
Received: from [10.162.16.95] (a077893.blr.arm.com [10.162.16.95])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E67693F66E;
	Wed,  8 Jan 2025 02:52:17 -0800 (PST)
Message-ID: <1c1504a7-3515-48f2-8ca7-15b2379dea22@arm.com>
Date: Wed, 8 Jan 2025 16:22:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm64: mm: Populate vmemmap/linear at the page level
 for hotplugged sections
To: Zhenhua Huang <quic_zhenhuah@quicinc.com>,
 Catalin Marinas <catalin.marinas@arm.com>
Cc: will@kernel.org, ardb@kernel.org, ryan.roberts@arm.com,
 mark.rutland@arm.com, joey.gouly@arm.com, dave.hansen@linux.intel.com,
 akpm@linux-foundation.org, chenfeiyang@loongson.cn, chenhuacai@kernel.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, quic_tingweiz@quicinc.com,
 stable@vger.kernel.org
References: <20250107074252.1062127-1-quic_zhenhuah@quicinc.com>
 <Z31--x4unDHRU5Zo@arm.com> <406d5113-ff3d-4c2a-81f0-de791bcbeffb@quicinc.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <406d5113-ff3d-4c2a-81f0-de791bcbeffb@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_025222_502992_F980B4BE 
X-CRM114-Status: GOOD (  12.71  )
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


On 1/8/25 15:37, Zhenhua Huang wrote:
> 
>>
>>>                 /*
>>> @@ -1175,9 +1178,21 @@ int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
>>>   int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
>>>           struct vmem_altmap *altmap)
>>>   {
>>> +    unsigned long start_pfn;
>>> +    struct mem_section *ms;
>>> +
>>>       WARN_ON((start < VMEMMAP_START) || (end > VMEMMAP_END));
>>>   -    if (!IS_ENABLED(CONFIG_ARM64_4K_PAGES))
>>> +    start_pfn = page_to_pfn((struct page *)start);
>>> +    ms = __pfn_to_section(start_pfn);
>>
>> Hmm, it would have been better if the core code provided the start pfn
>> as it does for vmemmap_populate_compound_pages() but I'm fine with
>> deducting it from 'start'.
> 
> I found another bug, that even for early section, when vmemmap_populate is called, SECTION_IS_EARLY is not set. Therefore, early_section() always return false.

Hmm, well that's unexpected.

> 
> Since vmemmap_populate() occurs during section initialization, it may be hard to say it is a bug..
> However, should we instead using SECTION_MARKED_PRESENT to check? I tested well in my setup.
> 
> Hot plug flow:
> 1. section_activate -> vmemmap_populate
> 2. mark PRESENT
> 
> In contrast, the early flow:
> 1. memblocks_present -> mark PRESENT
> 2. __populate_section_memmap -> vmemmap_populate

But from a semantics perspective, should SECTION_MARKED_PRESENT be marked on a
section before SECTION_IS_EARLY ? Is it really the expected behaviour here or
that needs to be fixed first ? 

Although SYSTEM_BOOTING state check might help but section flag seems to be the
right thing to do here.

