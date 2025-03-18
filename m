Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A9DDC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 12:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=64IIiCxSmb90ZQ6fmueb4xJ3WQaFIC2OATzJjR0a98k=; b=hEPFf5y7gHcAhMb0B06EINxxg7
	NY1lITD9P32FZWDBqPnAIizOr+zFYr3WrYpR5Kwu8GgiLBfTAXVKkw8KfTCIeNMvA5E1BdPh0FKYv
	2nSinye2YGECP++vK1SGvZSSvF+KY8Q9Ngl6fb7U8XyR//CsFs64DbE1SNNiI2YS2ov191hpVLD7Y
	I81YXc4xAZqKFGgdTdSYA1uiPI9+eKJxovVUBZ5VIlrg6PzSkwmBENtXzcmgJYzPf5lUyCVr+o5ge
	RuoTpOPVD6wc98DWbUhg4oUz6YRCmVGmfbw8bilIpX0reakDH7aw0+AqejvSooxA0/r5JLDMwLxNQ
	pn7FMhJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuVte-00000005rUK-0faz;
	Tue, 18 Mar 2025 12:18:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuVq3-00000005qke-0zkR;
	Tue, 18 Mar 2025 12:14:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E278013D5;
	Tue, 18 Mar 2025 05:14:38 -0700 (PDT)
Received: from [10.57.85.104] (unknown [10.57.85.104])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7AF4D3F673;
	Tue, 18 Mar 2025 05:14:22 -0700 (PDT)
Message-ID: <e79f9aa9-ce1b-4d42-8a61-aebaae1744fc@arm.com>
Date: Tue, 18 Mar 2025 13:14:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] Always call constructor for kernel page tables
To: Ryan Roberts <ryan.roberts@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Mark Rutland <mark.rutland@arm.com>, Matthew Wilcox <willy@infradead.org>,
 Michael Ellerman <mpe@ellerman.id.au>, "Mike Rapoport (IBM)"
 <rppt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Peter Zijlstra <peterz@infradead.org>, Qi Zheng
 <zhengqi.arch@bytedance.com>, Will Deacon <will@kernel.org>,
 Yang Shi <yang@os.amperecomputing.com>, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
References: <20250317141700.3701581-1-kevin.brodsky@arm.com>
 <70349335-84ee-4bca-a3d6-d7cf3c05b92b@arm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <70349335-84ee-4bca-a3d6-d7cf3c05b92b@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_051431_322781_065E8843 
X-CRM114-Status: GOOD (  16.83  )
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

On 17/03/2025 16:30, Ryan Roberts wrote:
> On 17/03/2025 14:16, Kevin Brodsky wrote:
>> The complications in those special pgtable allocators beg the question:
>> does it really make sense to treat efi_mm and init_mm differently in
>> e.g. apply_to_pte_range()? Maybe what we really need is a way to tell if
>> an mm corresponds to user memory or not, and never use split locks for
>> non-user mm's. Feedback and suggestions welcome!
> The difference in treatment is whether or not the ptl is taken, right? So the
> real question is when calling apply_to_pte_range() for efi_mm, is there already
> a higher level serialization mechanism that prevents racy accesses? For init_mm,
> I think this is handled implicitly because there is no way for user space to
> cause apply_to_pte_range() for an arbitrary piece of kernel memory. Although I
> can't even see where apply_to_page_range() is called for efi_mm.

The commit I mentioned above, 61444cde9170 ("ARM: 8591/1: mm: use fully
constructed struct pages for EFI pgd allocations"), shows that
apply_to_page_range() is called from efi_set_mapping_permissions(), and
this indeed hasn't changed. It is itself called from efi_virtmap_init().
I would expect that no locking at all is necessary here, since the
mapping has just been created and surely isn't used yet. Now the
question is where exactly init_mm is special-cased in this manner. I can
see that walk_page_range() does something similar, there may be more
cases. And the other question is whether those functions are ever used
on special mm's, aside from efi_set_mapping_permissions().
> FWIW, contpte.c has mm_is_user() which is used by arm64.

Interesting! But not pretty, that's basically checking that the mm is
not &init_mm or &efi_mm... which wouldn't work for a generic
implementation. It feels like adding some attribute to mm_struct
wouldn't hurt. It looks like we've run out of MMF_* flags though :/

- Kevin

