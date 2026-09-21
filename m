Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88077C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 10:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JOIIwBcHwXvhGohwhLmN0ckUZewr1XmsdIkqY7rlIfU=; b=Z7qjGEH0ottatJT32TmJXnb6kU
	u3WBTi00PjaEhoqAE2SvcUrM2cS1Q1pMwW7AFqlGaFGJ1szBh4zkGdccJBhKee0WjjMlm29P3N0g/
	NPmtrd8BxUcqpgn1Lt80VU8f4fbn4IFm+5iCafOANh9lxX19/qY8jCbzLzNFZPryLih2vt8cSzCO9
	DXmmFlutO8EkyeXgzYOlYET2eoXARMcd70mofgvFWSKRPh68MbrbGIkt0wGl3PWHqVvLXtg7O15FR
	pdIbQRiFhTq2D3U1/BQio7bszDjTjOzHzcAOji4QvE7+VxtpDJqYulDw5B101PQpLFrX1MfEQdC9W
	uE4AmCiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bfz-00000001lCS-3y8T;
	Mon, 21 Sep 2026 10:55:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bfv-00000001lBt-2OIZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 10:55:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23B091570;
	Mon, 21 Sep 2026 03:55:03 -0700 (PDT)
Received: from [10.57.83.12] (unknown [10.57.83.12])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B1D1C3F86C;
	Mon, 21 Sep 2026 03:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789988106; bh=VeIsaNzzDd9f9NeJzVh3EXPEgrmVN3PnEqsJPHZMPRs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TcrqUl2GOeCmADC+jcCe/JsSC8+pdpNPcZ+lZEqkLwHaF82/grSesMT2K8TGrEkh8
	 Qc3oT/5ZQjSahcQhuvh7uXmdSxiUefczLAMViYr1PQ+k3g3NIwl+tJWn304rX67Hed
	 cHuJUz2DRzDomCBX+TgkYOUQ70K+qqdbA41d7D/k=
Message-ID: <9aed35be-a411-4d9d-805c-03c836e9e56a@arm.com>
Date: Mon, 21 Sep 2026 11:55:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] arm64/mm: Convert pgtable READ_ONCE() as pxdp_get()
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Lorenzo Stoakes <ljs@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Linu Cherian <linu.cherian@arm.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20260903060657.2717457-1-anshuman.khandual@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
Content-Language: en-GB
In-Reply-To: <20260903060657.2717457-1-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_035507_701034_29E8D015 
X-CRM114-Status: GOOD (  18.71  )
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

On 03/09/2026 07:06, Anshuman Khandual wrote:
> Route READ_ONCE() accesses on pgtable entries via level specific generic MM
> pxdp_get() helpers which platforms could then override when required. These
> accessors on arm64, will help in ensuring page table accesses are performed
> in an atomic manner while reading 128 bit page table entries later. But for
> now they just default to READ_ONCE(), thus preserving existing behaviour on
> current D64 translation.
> 
> This is similar to generic MM, where all atomic accesses have already been
> converted from READ_ONCE() into pgtable level specific accessors.
> 
> These are preparatory patches for D128 enablement, although standing their
> own for D64 translation as well. These patches are split from earlier D128
> V1 series. There are no functional changes here, and besides mm kselftests
> do not show any regression.
> 
> https://lore.kernel.org/linux-mm/20260729122452.3797443-1-anshuman.khandual@arm.com/
> 
> This series applies on v3.7-rc1 but after applying the following patches

I assume you meant v7.3-rc1 here?

> related to pgtable entry print standardization posted earlier.
> 
> https://lore.kernel.org/linux-mm/20260831054331.625505-1-anshuman.khandual@arm.com/

This applies.

> 
> https://lore.kernel.org/linux-mm/20260901065454.1906343-1-anshuman.khandual@arm.com/

This fails:
---8<---
$ b4 shazam 20260901065454.1906343-1-anshuman.khandual@arm.com
Grabbing thread from
lore.kernel.org/all/20260901065454.1906343-1-anshuman.khandual@arm.com/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
  Added from v3: 3 patches
  Added from v2: 3 patches
Analyzing 14 messages in the thread
Looking for additional code-review trailers on lore.kernel.org
Will use the latest revision: v3
You can pick other revisions using the -vN flag
Checking attestation on all messages, may take a moment...
---
  ✓ [PATCH v3 1/2] arm64/mm: Move __check_safe_pte_update()
  ✓ [PATCH v3 2/2] arm64/mm: Standardize printing for pgtable entries
  ---
  ✓ Signed: DKIM/arm.com
---
Total patches: 2
---
Applying: arm64/mm: Move __check_safe_pte_update()
Applying: arm64/mm: Standardize printing for pgtable entries
Patch failed at 0002 arm64/mm: Standardize printing for pgtable entries
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
error: patch failed: arch/arm64/mm/fault.c:160
error: arch/arm64/mm/fault.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
---8<---

And as a result I can't apply this series. Any tips?

Thanks,
Ryan


> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Lorenzo Stoakes <ljs@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Linu Cherian <linu.cherian@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-mm@kvack.org
> 
> Anshuman Khandual (4):
>   arm64/mm: Convert READ_ONCE() as pmdp_get() while accessing PMD
>   arm64/mm: Convert READ_ONCE() as pudp_get() while accessing PUD
>   arm64/mm: Convert READ_ONCE() as p4dp_get() while accessing P4D
>   arm64/mm: Convert READ_ONCE() as pgdp_get() while accessing PGD
> 
>  arch/arm64/include/asm/pgtable.h |  6 ++--
>  arch/arm64/mm/fault.c            |  8 ++---
>  arch/arm64/mm/fixmap.c           |  6 ++--
>  arch/arm64/mm/hugetlbpage.c      | 10 +++---
>  arch/arm64/mm/kasan_init.c       | 18 +++++-----
>  arch/arm64/mm/mmu.c              | 60 ++++++++++++++++----------------
>  arch/arm64/mm/pageattr.c         |  8 ++---
>  arch/arm64/mm/trans_pgd.c        | 14 ++++----
>  8 files changed, 66 insertions(+), 64 deletions(-)
> 


