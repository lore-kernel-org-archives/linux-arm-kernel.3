Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C0BC369A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 15:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ysq3Coq358H4yMpQcctd5puOMXBWwelZzURuknrY7ys=; b=tQWCFbA9AeVKBqyEifD9tZS1tn
	UMFsy3yR06fBPcWFAaLlemyhQHyogjY3U5j400DjQmHRHEH8nR6c+ltUySQuMfqTH+MNYyQyD7qcz
	F8VOq/CcbChxSbA4tRyyH+ec+VJhsB/Wu7BiyASOlFtKfWEd31KUo+f0QA88+/G4N0+c/oa4xCYct
	sIiz8qnokP9Dt93RwlGOXG4EFzHIn6xuzvayq/SGodUtIO+P1cxDy2MOoSBuVpnH0YaP2DDyIbvEw
	ow58JTvTbB8Nmum0SpimApMXZTYG9VIc9yTtN67AAfgAO1wNmr4lgUWO+8AnhbI1XJzHMkm6mNryv
	tKyp6jGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2X3F-00000007c2m-1VhB;
	Wed, 09 Apr 2025 15:09:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Wkq-00000007XcC-0nWd;
	Wed, 09 Apr 2025 14:50:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52F3115A1;
	Wed,  9 Apr 2025 07:50:13 -0700 (PDT)
Received: from [10.57.67.254] (unknown [10.57.67.254])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 58A653F59E;
	Wed,  9 Apr 2025 07:50:07 -0700 (PDT)
Message-ID: <99771f33-8ad8-4ba5-9cf0-f504588d99a0@arm.com>
Date: Wed, 9 Apr 2025 16:50:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/12] x86: pgtable: Always use pte_free_kernel()
To: Matthew Wilcox <willy@infradead.org>, Dave Hansen <dave.hansen@intel.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Mark Rutland <mark.rutland@arm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 "Mike Rapoport (IBM)" <rppt@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Peter Zijlstra <peterz@infradead.org>, Qi Zheng
 <zhengqi.arch@bytedance.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Will Deacon <will@kernel.org>, Yang Shi <yang@os.amperecomputing.com>,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-openrisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, x86@kernel.org
References: <20250408095222.860601-1-kevin.brodsky@arm.com>
 <20250408095222.860601-3-kevin.brodsky@arm.com>
 <409d2019-a409-4e97-a16f-6b345b0f5a38@intel.com>
 <Z_VQxyqkU8DV7QGy@casper.infradead.org>
 <9247436d-ae01-4eb8-bd5d-370b2fb2eebc@intel.com>
 <Z_VfeFgrj23Oa0fX@casper.infradead.org>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <Z_VfeFgrj23Oa0fX@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_075016_277095_B5E29DCC 
X-CRM114-Status: GOOD (  14.51  )
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

On 08/04/2025 19:40, Matthew Wilcox wrote:
> On Tue, Apr 08, 2025 at 09:54:42AM -0700, Dave Hansen wrote:
>> On 4/8/25 09:37, Matthew Wilcox wrote:
>>> On Tue, Apr 08, 2025 at 08:22:47AM -0700, Dave Hansen wrote:
>>>> Are there any tests for folio_test_pgtable() at free_page() time? If we
>>>> had that, it would make it less likely that another free_page() user
>>>> could sneak in without calling the destructor.
>>> It's hidden, but yes:
>>>
>>> static inline bool page_expected_state(struct page *page,
>>>                                         unsigned long check_flags)
>>> {
>>>         if (unlikely(atomic_read(&page->_mapcount) != -1))
>>>                 return false;
>>>
>>> PageTable uses page_type which aliases with mapcount, so this check
>>> covers "PageTable is still set when the last refcount to it is put".
>> Huh, so shouldn't we have ended up in bad_page() for these, other than:
>>
>>         pagetable_dtor(virt_to_ptdesc(pmd));
>>         free_page((unsigned long)pmd);
> I think at this point in Kevin's series, we don't call the ctor for
> these pages, so we never set PageTable() on them. I could be wrong;

Correct, that's why I added this patch early in the series (the next
patch adds the ctor call in pte_alloc_one_kernel()).

The BUG() in v1 was indeed triggered by a page_expected_state() check [1].

> as Kevin says, this is all very twisty and confusing with exceptions and
> exceptions to exceptions.  This series should reduce the confusion.

I hope so!

- Kevin

[1] https://lore.kernel.org/oe-lkp/202503211612.e11bd73f-lkp@intel.com/

