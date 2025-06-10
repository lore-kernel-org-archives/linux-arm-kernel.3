Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 610BDC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 07:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KxyURF4jSnclFhkT4Z75R/BtAbvdRTxXoovlPuJLDGU=; b=ztTYX5yKV0Jzkw4E6yrLZ6Ua31
	mxwEGndffvqgZG/9pWjnbC7nBrkPGQHullAnpx/fl4l97BhJz5thrKC9MaSBACL5FZUH8cD2t6+20
	0zFFd63IdP5HucqpcJypcOrb5EYLzP1fKknMoqlkFWSggPOj9JBNPWK7vpytAm1DpuC0RqtpkgoC/
	esS/jLYLu45P6LlzawnSAcNu72A2gD7qbHBLWlEKyhcuNiHU9UzoUMI3b3Y1FQhZu654hUhkTrB+z
	uS8fbxlfW32KW3HHim+kD4FiFiGhK4Nk+PZEg9F+tbhLrtVNvgSeIOM3o1ueHWVKftTGpN+XlD58R
	lqCTrL4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOtot-000000065HI-3HgQ;
	Tue, 10 Jun 2025 07:54:55 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOtkj-000000064Ux-23jA;
	Tue, 10 Jun 2025 07:50:39 +0000
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bGgWw6GWqz9sWd;
	Tue, 10 Jun 2025 09:33:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IomiIPVP0wtF; Tue, 10 Jun 2025 09:33:48 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bGgWw5Tdpz9s9J;
	Tue, 10 Jun 2025 09:33:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B6E718B778;
	Tue, 10 Jun 2025 09:33:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 9xzMDpp4MJkO; Tue, 10 Jun 2025 09:33:48 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2AB3F8B76D;
	Tue, 10 Jun 2025 09:33:48 +0200 (CEST)
Message-ID: <cd96d70b-1eb3-494a-912a-52d479e3df87@csgroup.eu>
Date: Tue, 10 Jun 2025 09:33:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 00/11] Support page table check on PowerPC
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: x86@kernel.org, linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 pasha.tatashin@soleen.com, sweettea-kernel@dorminy.me
References: <20250411054354.511145-1-ajd@linux.ibm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250411054354.511145-1-ajd@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_005037_682471_B067FB17 
X-CRM114-Status: GOOD (  22.82  )
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



Le 11/04/2025 à 07:43, Andrew Donnellan a écrit :
> Support page table check on all PowerPC platforms. This works by
> serialising assignments, reassignments and clears of page table
> entries at each level in order to ensure that anonymous mappings
> have at most one writable consumer, and likewise that file-backed
> mappings are not simultaneously also anonymous mappings.
> 
> In order to support this infrastructure, a number of stubs must be
> defined for all powerpc platforms. Additionally, separate set_pte_at()
> and set_pte_at_unchecked(), to allow for internal, uninstrumented mappings.
> 
> (This series was written by Rohan McLure, who has left IBM and is no longer
> working on powerpc.)

This series requires a rebase after commit 91e40668e70a 
("mm/page_table_check: Batch-check pmds/puds just like ptes")


Christophe

> 
> v14:
>   * Fix a call to page_table_check_pud_set() that was missed (akpm)
> 
> v13:
>   * Rebase on mainline
>   * Don't use set_pte_at_unchecked() for early boot purposes (Pasha)
> Link: https://lore.kernel.org/linuxppc-dev/20250211161404.850215-1-ajd@linux.ibm.com/
> 
> v12:
>   * Rename commits that revert changes to instead reflect that we are
>     reinstating old behaviour due to it providing more flexibility
>   * Add return line to pud_pfn() stub
>   * Instrument ptep_get_and_clear() for nohash
> Link: https://lore.kernel.org/linuxppc-dev/20240402051154.476244-1-rmclure@linux.ibm.com/
> 
> v11:
>   * The pud_pfn() stub, which previously had no legitimate users on any
>     powerpc platform, now has users in Book3s64 with transparent pages.
>     Include a stub of the same name for each platform that does not
>     define their own.
>   * Drop patch that standardised use of p*d_leaf(), as already included
>     upstream in v6.9.
>   * Provide fallback definitions of p{m,u}d_user_accessible_page() that
>     do not reference p*d_leaf(), p*d_pte(), as they are defined after
>     powerpc/mm headers by linux/mm headers.
>   * Ensure that set_pte_at_unchecked() has the same checks as
>     set_pte_at().
> Link: https://lore.kernel.org/linuxppc-dev/20240328045535.194800-14-rmclure@linux.ibm.com/
> 
> v10:
>   * Revert patches that removed address and mm parameters from page table
>     check routines, including consuming code from arm64, x86_64 and
>     riscv.
>   * Implement *_user_accessible_page() routines in terms of pte_user()
>     where available (64-bit, book3s) but otherwise by checking the
>     address (on platforms where the pte does not imply whether the
>     mapping is for user or kernel)
>   * Internal set_pte_at() calls replaced with set_pte_at_unchecked(), which
>     is identical, but prevents double instrumentation.
> Link: https://lore.kernel.org/linuxppc-dev/20240313042118.230397-9-rmclure@linux.ibm.com/T/
> 
> v9:
>   * Adapt to using the set_ptes() API, using __set_pte_at() where we need
>     must avoid instrumentation.
>   * Use the logic of *_access_permitted() for implementing
>     *_user_accessible_page(), which are required routines for page table
>     check.
>   * Even though we no longer need p{m,u,4}d_leaf(), still default
>     implement these to assist in refactoring out extant
>     p{m,u,4}_is_leaf().
>   * Add p{m,u}_pte() stubs where asm-generic does not provide them, as
>     page table check wants all *user_accessible_page() variants, and we
>     would like to default implement the variants in terms of
>     pte_user_accessible_page().
>   * Avoid the ugly pmdp_collapse_flush() macro nonsense! Just instrument
>     its constituent calls instead for radix and hash.
> Link: https://lore.kernel.org/linuxppc-dev/20231130025404.37179-2-rmclure@linux.ibm.com/
> 
> v8:
>   * Fix linux/page_table_check.h include in asm/pgtable.h breaking
>     32-bit.
> Link: https://lore.kernel.org/linuxppc-dev/20230215231153.2147454-1-rmclure@linux.ibm.com/
> 
> v7:
>   * Remove use of extern in set_pte prototypes
>   * Clean up pmdp_collapse_flush macro
>   * Replace set_pte_at with static inline function
>   * Fix commit message for patch 7
> Link: https://lore.kernel.org/linuxppc-dev/20230215020155.1969194-1-rmclure@linux.ibm.com/
> 
> v6:
>   * Support huge pages and p{m,u}d accounting.
>   * Remove instrumentation from set_pte from kernel internal pages.
>   * 64s: Implement pmdp_collapse_flush in terms of __pmdp_collapse_flush
>     as access to the mm_struct * is required.
> Link: https://lore.kernel.org/linuxppc-dev/20230214015939.1853438-1-rmclure@linux.ibm.com/
> 
> v5:
> Link: https://lore.kernel.org/linuxppc-dev/20221118002146.25979-1-rmclure@linux.ibm.com/
> 
> Rohan McLure (11):
>    mm/page_table_check: Reinstate address parameter in
>      [__]page_table_check_pud_set()
>    mm/page_table_check: Reinstate address parameter in
>      [__]page_table_check_pmd_set()
>    mm/page_table_check: Provide addr parameter to
>      page_table_check_pte_set()
>    mm/page_table_check: Reinstate address parameter in
>      [__]page_table_check_pud_clear()
>    mm/page_table_check: Reinstate address parameter in
>      [__]page_table_check_pmd_clear()
>    mm/page_table_check: Reinstate address parameter in
>      [__]page_table_check_pte_clear()
>    mm: Provide address parameter to p{te,md,ud}_user_accessible_page()
>    powerpc: mm: Add pud_pfn() stub
>    powerpc: mm: Implement *_user_accessible_page() for ptes
>    powerpc: mm: Use set_pte_at_unchecked() for internal usages
>    powerpc: mm: Support page table check
> 
>   arch/arm64/include/asm/pgtable.h             | 18 +++---
>   arch/powerpc/Kconfig                         |  1 +
>   arch/powerpc/include/asm/book3s/32/pgtable.h | 12 +++-
>   arch/powerpc/include/asm/book3s/64/pgtable.h | 62 +++++++++++++++---
>   arch/powerpc/include/asm/nohash/pgtable.h    | 13 +++-
>   arch/powerpc/include/asm/pgtable.h           | 19 ++++++
>   arch/powerpc/mm/book3s64/hash_pgtable.c      |  4 ++
>   arch/powerpc/mm/book3s64/pgtable.c           | 17 +++--
>   arch/powerpc/mm/book3s64/radix_pgtable.c     |  9 ++-
>   arch/powerpc/mm/pgtable.c                    | 12 ++++
>   arch/riscv/include/asm/pgtable.h             | 18 +++---
>   arch/x86/include/asm/pgtable.h               | 22 +++----
>   include/linux/page_table_check.h             | 67 ++++++++++++--------
>   include/linux/pgtable.h                      | 10 +--
>   mm/page_table_check.c                        | 39 +++++++-----
>   15 files changed, 226 insertions(+), 97 deletions(-)
> 


