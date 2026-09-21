Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A72C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 12:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=61Ma0ewUMnjyMeM1Wq480iH1x1T4S9hRZE82Sqp1OUo=; b=LmcseaVT8glWq7CiN0Sj2tC2rc
	sCt7GJzkfA0qRNnCKELDS4H5ALL6WvboRMWL3AG3UvkNeiW+Oov2moLaPLE86KGhSdL9nJ5lCy7I2
	QNGI6su/BhRxqRVwcQqcWdG5n1IcW/eH5v+S0n33O1Oozm2DsaCfQrEeo4Tyx1AFgxT+Zv1O6w+b7
	kS/0h09UxSIqhl/GR58uTWUYPT5UJHK80WiSlA3KrBREo2ASPpSvcZ/jO0qo8EuWJuyKQ9EvA+bBo
	/I+NmwSgiGjNJ22HaO8vrKRpv57ABPj0UQDueIJ6fMwHeK38M8aJINTS422cM6r0lieWTpklpQLAP
	chHqVxew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dUh-0000000290i-1lWz;
	Mon, 21 Sep 2026 12:51:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dUf-0000000290N-3s0g;
	Mon, 21 Sep 2026 12:51:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=61Ma0ewUMnjyMeM1Wq480iH1x1T4S9hRZE82Sqp1OUo=; b=KSXiII83FTPs1mua2v5J8mvVUx
	6jZjvXPnG7fWfTGqaWp+hMjsWc2kCdAB9OsSMn8y4yYdvmRMZ5Q4BqqAoAw25WQfJmz7Knh+XrW5C
	n7DdBvpfaASZNgnqXreOgMO4nxVjT4fg9fIKLV6P/bZNl9necjga1WgvnpcwwGLX5/d5uXUKdizys
	0MLOR/COxXzUsgUODl3AzGjgyT5N5BnJS24lpjmpXmgHKqz1A67HtPLSzSL6jnMFpdzGD20XjgBnh
	pkhHnW3bYCun3zQ2HemHxP5WX/gPMg8m7nCzZSOMDTgy0h0gPLuswxxLpxIfY2iCtSi92aFnOGOoX
	08fs4t3g==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8dUW-0000000CIdc-2wrU;
	Mon, 21 Sep 2026 12:51:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E855176C;
	Mon, 21 Sep 2026 05:51:18 -0700 (PDT)
Received: from [10.57.6.224] (unknown [10.57.6.224])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 369BE3F86C;
	Mon, 21 Sep 2026 05:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789995082; bh=HXAhdpQuILv12trenzrxa0DxHNLn7f/XIZHr5cv391k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ShtSmcPDUXgPFJquxoISwgyxA0JeEBWLYMWSo5Kp/sAkxe8UArxJYx54OQw5DhKo5
	 91/PuhmUkjC3DEWhdBC9lka/rh0pM3m0nVfSaqpUkfTDsBcvRFYZZSXMBptKHvfkEq
	 2RXCaLm+4k0zuOQBpH3bJ8i8jcHuTYYleBbqAy+A=
Message-ID: <c4a38552-abdd-42e4-8b7d-bb1716888f1f@arm.com>
Date: Mon, 21 Sep 2026 14:51:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] set_memory: add number of pages parameter to
 set_direct_map APIs
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?Q?Adrian_Barna=C5=9B?= <abarnas@google.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Brendan Jackman <brendan.jackman@linux.dev>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@kernel.org>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Len Brown <lenb@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Sven Schnelle <svens@linux.ibm.com>,
 Thomas Gleixner <tglx@kernel.org>, Uladzislau Rezki <urezki@gmail.com>,
 Vasily Gorbik <gor@linux.ibm.com>, WANG Xuerui <kernel@xen0n.name>,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-pm@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 loongarch@lists.linux.dev
References: <20260903-execmem-set-vm-perms-v0-2-v3-0-949b64a9f755@kernel.org>
 <20260903-execmem-set-vm-perms-v0-2-v3-1-949b64a9f755@kernel.org>
 <d299f7c5-6c71-499a-b8cd-aa69c4c81dd1@arm.com> <aqzjBA_101LcKRCD@kernel.org>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <aqzjBA_101LcKRCD@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_135130_209274_489D4948 
X-CRM114-Status: GOOD (  14.27  )
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

On 18/09/2026 09:06, Mike Rapoport wrote:
> On Thu, Sep 17, 2026 at 08:11:22PM +0200, Kevin Brodsky wrote:
>> On 03/09/2026 11:28, Mike Rapoport (Microsoft) wrote:
>>> When set_direct_map APIs were introduced by the commit d253ca0c3865
>>> ("x86/mm/cpa: Add set_direct_map_*() functions") the single page
>>> parameter made sense because the initial callers (vmalloc and
>>> hibernation) had sets of unsorted struct pages that required changes of
>>> their mappings in the direct map.
>>>
>>> Since there is an increasing demand for direct map manipulation and it
>>> is also desirable to be able to update larger physically contiguous
>>> mappings, for example an entire large folio, extend set_direct_map APIs
>>> to receive number of pages parameter.
>>>
>>> As there is still only a handful of callers, change the existing
>>> functions directly and update all the call sites rather than adding
>>> wrappers for single page case.
>>>
>>> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>>> ---
>>>  arch/arm64/include/asm/set_memory.h     | 4 ++--
>>>  arch/arm64/mm/pageattr.c                | 8 ++++----
>>>  arch/loongarch/include/asm/set_memory.h | 4 ++--
>>>  arch/loongarch/mm/pageattr.c            | 8 ++++----
>>>  arch/riscv/include/asm/set_memory.h     | 4 ++--
>>>  arch/riscv/mm/pageattr.c                | 8 ++++----
>>>  arch/s390/include/asm/set_memory.h      | 4 ++--
>>>  arch/s390/mm/pageattr.c                 | 8 ++++----
>>>  arch/x86/include/asm/set_memory.h       | 4 ++--
>>>  arch/x86/mm/pat/set_memory.c            | 8 ++++----
>>>  include/linux/set_memory.h              | 6 ++++--
>>>  kernel/power/snapshot.c                 | 4 ++--
>>>  mm/secretmem.c                          | 6 +++---
>>>  mm/vmalloc.c                            | 5 +++--
>>>  14 files changed, 42 insertions(+), 39 deletions(-)
>>>
>>> diff --git a/arch/arm64/include/asm/set_memory.h b/arch/arm64/include/asm/set_memory.h
>>> index 90f61b17275e1..b07fd4e026eac 100644
>>> --- a/arch/arm64/include/asm/set_memory.h
>>> +++ b/arch/arm64/include/asm/set_memory.h
>>> @@ -11,8 +11,8 @@ bool can_set_direct_map(void);
>>>  
>>>  int set_memory_valid(unsigned long addr, int numpages, int enable);
>>>  
>>> -int set_direct_map_invalid_noflush(struct page *page);
>>> -int set_direct_map_default_noflush(struct page *page);
>>> +int set_direct_map_invalid_noflush(struct page *page, unsigned int numpages);
>>> +int set_direct_map_default_noflush(struct page *page, unsigned int numpages);
>> I don't have a strong opinion on whether to call the argument nr or
>> numpages, but we might as well be consistent across archs :)
> Well, it's either consistent across archs or consistent within each arch :)
> Or add a churny patch that renames it everywhere to nr_pages :)

Eh fair enough... Clearly not the biggest inconsistency in the
set_direct_map API anyway!

- Kevin

