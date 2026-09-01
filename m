Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B6DC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 14:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+RwiugeaifPQdmY9Zpdvu0ty8fQ/P33k9akYKvOyAbg=; b=UuJspD0ZcHi2jyXqTjk6SOdGkH
	Ja9ha+dDuC0Ha19ZBPjwAH0lp95Qkk4PqIvrB4P70wI0GFsbYMBOhNkFVndCQ8upvXF6oN12EJIbj
	w4Mp5Tz9bFSqEtfw1vy3tL8GdCLaDIKyMvyTwwKVtTf2MHf+0NAWvMjbro8M+UYneidk36abrGcjB
	upwumEEuAGCc1F4X+YvgoSSFJH5tW9rxV0rOiyHkWUkOsLWN6wB/n/3Mn91pkP9ORParfvdYcboEx
	Lv5r6gB10LUjcqGRtH/tlPzoEvtVbU6RBC+pdtjG8apvD1Ngrw6Py4te8YlCo+bcvfhkc3Q331O5w
	Q7tnEDxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1PPS-0000000CKSH-3wDH;
	Tue, 01 Sep 2026 14:24:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1PPP-0000000CKPf-4A0p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 14:24:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 465AC1756;
	Tue,  1 Sep 2026 07:24:12 -0700 (PDT)
Received: from localhost (a079125.arm.com [10.164.21.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4935A3F882;
	Tue,  1 Sep 2026 07:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788272656; bh=/+VTS/wowKUBMEJfUdOzNr9Rhq2odKsUrNC+nH+Ov6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l4FEsQQe49YrVK3Eui9gTKKd5V+dmOfEGgip57IjEp8fEHqxuePGNLZ8GuKu3jUkH
	 Nuu4Yb8TJamyzrltg+7AYmQs+NWdzyZYMLwxZNhYodLsRsv4xL01vE1oUHLn7FgNkk
	 bnf93fyhdWxCsyIBOYeKlsSDcxBRvdiBP1KnBM5k=
Date: Tue, 1 Sep 2026 19:54:12 +0530
From: Linu Cherian <linu.cherian@arm.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-hardening@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Jann Horn <jannh@google.com>, Jeff Xu <jeffxu@chromium.org>,
	Joey Gouly <joey.gouly@arm.com>, Kees Cook <kees@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Maxwell Bland <mbland@motorola.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Pierre Langlois <pierre.langlois@arm.com>,
	=?iso-8859-1?Q?Pierre-Cl=E9ment?= Tosi <ptosi@google.com>,
	Quentin Perret <qperret@google.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	x86@kernel.org, Ira Weiny <iweiny@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH RFC v9 00/25] pkeys-based page table hardening
Message-ID: <apbgDNjQPLBdsUe0@a079125.arm.com>
References: <20260818-kpkeys-v9-0-743ad31b2c8f@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818-kpkeys-v9-0-743ad31b2c8f@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_072420_116471_64E6D5DE 
X-CRM114-Status: GOOD (  38.27  )
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

Hi Kevin,

On Tue, Aug 18, 2026 at 03:08:42PM +0100, Kevin Brodsky wrote:
> [Sending during the merge window in case reviewers have spare
> cycles; I'm not aiming to have this series merged in v7.3.]
> 
> This is a proposal to leverage protection keys (pkeys) to harden
> critical kernel data, by making it mostly read-only. The series includes
> a simple framework called "kpkeys" to manipulate pkeys for in-kernel use,
> as well as a page table hardening feature based on that framework,
> "kpkeys_hardened_pgtables". Both are implemented on arm64 as a proof of
> concept, but they are designed to be compatible with any architecture
> that supports pkeys.
> 
> The proposed approach is a typical use of pkeys: the data to protect is
> mapped with a given pkey P, and the pkey register is initially
> configured to grant read-only access to P. Where the protected data
> needs to be written to, the pkey register is temporarily switched to
> grant write access to P on the current CPU.
> 
> The key fact this approach relies on is that the target data is
> only written to via a limited and well-defined API. This makes it
> possible to explicitly switch the pkey register where needed, without
> introducing excessively invasive changes, and only for a small amount of
> trusted code.
> 
> Page tables are chosen as an initial target because of their especially
> critical nature - a single write may result in arbitrary pages becoming
> accessible to any context (including userspace). In order to keep the
> series digestible for reviewers, this version focuses on functionality
> rather than performance, making it most suitable as a debug feature. The
> key trade-off is the requirement to PTE-map the linear map - see section
> "Protected page table allocation" for details.
> 
> This series has similarities with the "PKS write protected page tables"
> series posted by Rick Edgecombe a few years ago [1] but it is not
> specific to x86/PKS - the approach is meant to be generic.
> 
> This proposal (as of RFC v5) was presented at Linux Security Summit
> Europe 2025 [2].
> 
> [Table of contents]
> 
> * kpkeys
>   - pkey register management
> 
> * kpkeys_hardened_pgtables
>   - Protected page table allocation
>   - kpkeys context switching
>   - Performance
>   - Limitations
> 
> * This series
>   - Branches
> 
> * Threat model
> 
> * Further use-cases
> 
> * Open questions
> 
> kpkeys
> ======
> 
> The use of pkeys involves two separate mechanisms: assigning a pkey to
> pages, and defining the pkeys -> permissions mapping via the pkey
> register. This is implemented through the following interface:
> 
> - Pages are assigned a pkey in the linear map using set_memory_pkey().
>   This is sufficient for this series, but it is also plausible for
>   higher-level allocators to support marking allocations with a given
>   pkey.
> 
> - The pkey register is configured based on a *kpkeys context*. kpkeys
>   contexts are represented as simple integers that correspond to a given
>   configuration, for instance:
> 
>   KPKEYS_CTX_DEFAULT:
>         RW access to KPKEYS_PKEY_DEFAULT
>         RO access to any other KPKEYS_PKEY_*
> 
>   KPKEYS_CTX_<FEAT>:
>         RW access to KPKEYS_PKEY_DEFAULT
>         RW access to KPKEYS_PKEY_<FEAT>
>         RO access to any other KPKEYS_PKEY_*
> 
>   Only pkeys that are managed by the kpkeys framework are impacted;
>   permissions for other pkeys are left unchanged (this allows for other
>   schemes using pkeys to be used in parallel, and arch-specific use of
>   certain pkeys).


- Adding some basic details on what a scheme and context is quite helpful.

 - Giving some hints (may be an example) on how multiple schemes and multiple contexts
  play together would be quite helpful.

Adding a documentation that covers these aspects would be much
appreciated.

My understanding is that pkeys are being partitioned across different
contexts. But then the introduction of the term "scheme" looks bit confusing to me.


> 
>   The current kpkeys context is changed by calling
>   kpkeys_enter_context(), which will set the pkey register
>   accordingly and return the original state. A
>   subsequent call to kpkeys_leave_context() restores the original
>   state (and thus the original kpkeys context). The numeric value of
>   KPKEYS_CTX_* (kpkeys context) is purely symbolic and thus generic,
>   however each architecture is free to define non-default pkeys
>   values (KPKEYS_PKEY_*).
> 
..snip

> Open questions
> ==============
> 
> A few aspects in this RFC that are debatable and/or worth discussing:
> 
> - There is currently no restriction on how kpkeys contexts map to pkeys
>   permissions. A typical approach is to allocate one pkey per context and
>   make it writable in that context only. As the number of contexts

Probably to avoid the assumption, may be we can we have something like
below 

For a pkey P, we could define
PKEY_P_PERM_CTXT_OTHERS	 //permission for pkey p in other contexts
PKEY_P_PERM_CTXT_SELF	 //permission for pkey p in self context

With the assumption of one pkey mapped for every context,
the permission for the default context would look something like,

PKEY_DEF_PERM_CTXT_SELF << PKEY_DEF_PKEY_SHIFT |
PKEY_CT0_PERM_CTXT_OTHERS << PKEY_CT0_PKEY_SHIFT | 
PKEY_CT1_PERM_CTXT_OTHERS << PKEY_CT1_PKEY_SHIFT |
...(for all valid contexts)

where,
Permission key, PKEY_DEF is associated with context DEFAULT,
Permission key, PKEY_CT0 is associated with context CT0,
Permission key, PKEY_CT1 is associated with context CT1

>   increases, we may however run out of pkeys, especially on arm64 (just
>   8 pkeys with POE). Depending on the use-cases, it may be acceptable to
>   use the same pkey for the data associated to multiple contexts.

Lets say two contexts A and B, use the same pkey P as their permission matches.
But then, when we enter context A, permission for pkey P gets
relaxed, then that would relax permission for pages associated with
context B as well which is unintended ? 

As the hardware supports 16 pkeys, should we consider removing the limit
of 8 pkeys so that we can have unique pkeys for each context ?

--
Linu Cherian

