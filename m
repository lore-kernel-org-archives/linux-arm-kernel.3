Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 307FCD1A627
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 13:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FWIjlFv6jJqppx2LoyUbbHVPgKacvPuyCBOajXnJvKU=; b=g7uIJwlRrmmHRKK6OpCPhoCn55
	TlmP2H7QCq8juucbTQB6tPbylqjEbGAOOKITLx7pkAoC4yhTHNa/8vKvMAnEARe8mjSrICdjBrlyr
	O8HVVR9Zbl4XJwXXCeSvOY98McfnXV0YJBIT3zmvC+3jl3AROKkFpu76hk8W/Yoq0c3XgmlL5tQkJ
	/dZfqWNOygSRJ+F77Gfiih4NTfZOgbmJXS7qiA0z3ox5NZp2zu05n8zSvTbFYO0/TD6FR+VEk/Bk4
	BSXyFMmDxWogVG7B0QKKRqYJhLzjZgn409bANotF8G+WBu4kiBRBDdEAOJEN0okZv2xU05GRngfa8
	aQ+cim/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veCm9-00000002Mok-3H24;
	Fri, 09 Jan 2026 13:43:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veCm6-00000002MoN-3wOn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 13:43:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4A75D40539;
	Fri,  9 Jan 2026 13:43:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A0C6C4CEF1;
	Fri,  9 Jan 2026 13:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767966214;
	bh=ijLJjYW1cc6SO67EopKRqCC5IeK0M9dJP6RDnaTpVqU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jq8+HDoWfq+dnQNCjupi8t3wJr3s2gFU/PZ+Mw9p2emhpnvQ4wtgBty04uXbNk61D
	 pNNPamcF60pYnh283bb1GkqvMttXrjLp8u7mPUIvt9NWaV3fpMZbPRnkTuEPT0Llrj
	 8Yt3UjdNFby5p8HerssTXgGz6oX8DulSCX0Auw4wa5TWQHIbb7ZQlnH/wloeDJ6jtW
	 yant4tlpZ7jRtbPwfiDiCLKl1YaqQ1cVNNNBicAEjsz+Qb/Tj7rv3d3L591HucBl9T
	 j/jWJ/WBZe7w9ztoI5e6doC/wmtuASzCC/PVJHwCuzCs4X98ZeSZ/riOmzgPWfP7oR
	 CwUWQShgEQbxg==
Date: Fri, 9 Jan 2026 13:43:25 +0000
From: Will Deacon <will@kernel.org>
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH v7 02/15] kasan: arm64: x86: Make special tags arch
 specific
Message-ID: <aWEF_eJ9Bnn5-8dZ@willie-the-truck>
References: <cover.1765386422.git.m.wieczorretman@pm.me>
 <0db7ec3b1a813b4d9e3aa8648b3c212166a248b7.1765386422.git.m.wieczorretman@pm.me>
 <aV_v18YWCHXMETVK@willie-the-truck>
 <aWEDDjQms8zbMgsB@wieczorr-mobl1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWEDDjQms8zbMgsB@wieczorr-mobl1.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_054334_998983_914D6C17 
X-CRM114-Status: GOOD (  17.92  )
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

On Fri, Jan 09, 2026 at 01:37:49PM +0000, Maciej Wieczor-Retman wrote:
> Hi, and thanks for looking at the patches!
> 
> On 2026-01-08 at 17:56:39 +0000, Will Deacon wrote:
> >On Wed, Dec 10, 2025 at 05:28:43PM +0000, Maciej Wieczor-Retman wrote:
> >> From: Samuel Holland <samuel.holland@sifive.com>
> ...
> >> +#ifdef CONFIG_KASAN_HW_TAGS
> >> +#define KASAN_TAG_MIN		0xF0 /* minimum value for random tags */
> >> +#define KASAN_TAG_WIDTH		4
> >> +#else
> >> +#define KASAN_TAG_WIDTH		8
> >> +#endif
> >
> >Shouldn't this be 0 when KASAN is not in use at all?
> >
> >Will
> 
> This file (as well as the x86 version) gets included in
> include/linux/kasan-tags.h:
> 
> 	#if defined(CONFIG_KASAN_SW_TAGS) || defined(CONFIG_KASAN_HW_TAGS)
> 	#include <asm/kasan-tags.h>
> 	#endif
> 
> 	#ifndef KASAN_TAG_WIDTH
> 	#define KASAN_TAG_WIDTH		0
> 	#endif
> 
> So the 8 or 4 value is only assigned if SW_TAGS or HW_TAGS are enabled.
> Otherwise it's set to zero.

Thanks for the explanation, I'd missed the conditional inclusion of the
arch header.

In which case, the arm64 side looks fine to me:

Acked-by: Will Deacon <will@kernel.org>

Cheers,

Will

