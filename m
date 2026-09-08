Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 578DBC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 06:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tQCExSqn1W0rL2KHHjcgog6hZgpy3PJqmFXUPMAfp8c=; b=c/TCxyLzPCr2t+KNN3Yl++OafT
	8rV5V7ZVrrbplgaADD6KO/eAFNvQJsADLFnm8spLw1aZ7l4OPAhT73JzUE2WyqMhAvEQ8OKajL5T5
	XJSODboInl/RXWz1o4i6VtIx6S7gYrjfz25xkcG6syVkQ7CycVYnb+f/XaEQ/zqZjB+mYMlgk+0GV
	HcbmxQqmDYVPYymi9IpLKfPfu2AmKZObj6vnXrp1/etMT5j7EMXWB8n9tKTkP19ahg+4DPUNjXwUU
	7nSfV4bVdmM1LjMiByOMsjS9moD0nlS8VL3/MUJmAvU7l503zWrQfNexuWjganjIhiZcrhiiK05MW
	yafCSzGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pgx-00000008DWr-42aH;
	Tue, 08 Sep 2026 06:52:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pgx-00000008DWi-0GA4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 06:52:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6FDA742EA1;
	Tue,  8 Sep 2026 06:52:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D9921F00A3A;
	Tue,  8 Sep 2026 06:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788850346;
	bh=tQCExSqn1W0rL2KHHjcgog6hZgpy3PJqmFXUPMAfp8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MxGHPr/o7Egzf7/M8R8Ao6xgWW828L9KjV5g84sSn7wi9vQ7ZcW0u0yYAkaDvectd
	 mR4UMWwASyruj3B4tXUeARgiJB6uF8PJhd7Vk5pHsWytx6JL63jN1/RAI90iaZDj5v
	 BSMATV5Tjnay2NldoJaKCaxkJf+B14z9AyDmY+MVafeEWhRzFRldWfi0CqcNr52USK
	 953kOdfoLHavZRSp42M83cfpJ14CsK0C7vG3yQyKNcguUsP8lAJpH7cavlJCQtN9Gc
	 1lsmIJCiWgIzHl6QoyQVlGhaNA5yh2Rs7v8dUZbABjex8SUJroXjJK4pnfLnMSZmk4
	 hpWo7/SVN/Y7Q==
Date: Tue, 8 Sep 2026 09:52:12 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-hardening@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Jann Horn <jannh@google.com>, Jeff Xu <jeffxu@chromium.org>,
	Joey Gouly <joey.gouly@arm.com>, Kees Cook <kees@kernel.org>,
	Linu Cherian <linu.cherian@arm.com>,
	Linus Walleij <linusw@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Maxwell Bland <mbland@motorola.com>,
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
Subject: Re: [PATCH RFC v9 01/25] mm: Introduce kpkeys
Message-ID: <ap-wnHAwfdX_b39o@kernel.org>
References: <20260818-kpkeys-v9-0-743ad31b2c8f@arm.com>
 <20260818-kpkeys-v9-1-743ad31b2c8f@arm.com>
 <178877845406.3691569.6930315020588094755.b4-review@b4>
 <3f6e7678-0784-4ac1-acb4-b128887803c5@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f6e7678-0784-4ac1-acb4-b128887803c5@arm.com>
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

On Mon, Sep 07, 2026 at 05:49:42PM +0200, Kevin Brodsky wrote:
> On 07/09/2026 12:54, Mike Rapoport wrote:
> >> +
> >> +#include <linux/bug.h>
> >> +#include <linux/cleanup.h>
> >> +#include <linux/kpkeys_types.h>
> >> +
> >> +/**
> >> + * KPKEYS_GUARD_NOOP() - define a guard type that does nothing
> > Nit: I'd suggest to drop "define" from all the descriptions, they would
> > read better without it IMHO.
> 
> Fair enough, but if we say just "a guard type that does nothing" is it
> clear that this is a macro defining a type, and not a type itself?

Then maybe "helper to define", like cleanup.h does?
 
> - Kevin

-- 
Sincerely yours,
Mike.

