Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E95FE9D3E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 14:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l6AtYwUunR7afkzowzveVcDPywpXTqRGxgr/+uwOtcY=; b=W4lZ3HXZBs2sNOqJyXxTGOd+ic
	jZ5aan7nJZEIVkMtJklJ0qpmdh1zArDkU++6yD9ZpljUNNy6vJp63hx26YF4ogTgK4XvuMdHgYSV1
	dYqszqzJx+JsfSsyICdn30l5OlUpAQf9HJ3E3qwYLuuaefSztzV+8Ov9w0kg0unGKFGmNIWRXPyAr
	Adlk4kvEElLv6boYsUPmCJd/8lroDN+atnsnz8FIa4UYgEUNmJy/aHZ8Isn6TAUG4FBj1z10SNywQ
	wcfTpGH1XuwpM7XDG91iZBanFTK7QOhJ61LqQLy5QiNkMHRStYBYDJTC65+oV4wJJSIqugY2DUTZ9
	YlvZbJLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vndfl-00000008ZqB-3dxb;
	Wed, 04 Feb 2026 14:16:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vndfj-00000008ZpI-0wb0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 14:16:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F51F436C4;
	Wed,  4 Feb 2026 14:15:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69DE9C4CEF7;
	Wed,  4 Feb 2026 14:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770214558;
	bh=E1jdxwYVfm2leYwVacUOhzPIAuFdaG8WtIXWBNAtcUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IEIGMLgZkHXkFgAdvwA8FEmf5l8TTj4oqyicVJQQbsnC/PBzaP9Pg5TjOmtwn7N52
	 p3Ff9aSftwE2aL1zZEcxyIeUJG7pBaGmHH3pS3H2o3nPmM5xovo4ttN/Q2rPbHJAlf
	 WHOIGLKLG2RgfjYgDGKq6Dw+6Z0ul/20rGH3v4vIr9kX38dHhWEfy1JnRhdeBWSEoq
	 /DvLYOR8jF9JfisiuA7zKSamB8M3X7RqKPGy/jYMB98MQW75D8BeHebA/CBJdLim8p
	 Rq/WAmYpirMcBNY5UXSeni2aZ+ei8kWPsIQTihd3k50/1nYlxPzR7fF/8XXUlBMdnP
	 Zii2AGtbOCkeA==
Date: Wed, 4 Feb 2026 14:15:52 +0000
From: Will Deacon <will@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Marco Elver <elver@google.com>,
	David Laight <david.laight.linux@gmail.com>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>,
	Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
	Boqun Feng <boqun@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v3 3/3] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
Message-ID: <aYNUmEfDzq7lTFFr@willie-the-truck>
References: <20260130132951.2714396-1-elver@google.com>
 <20260130132951.2714396-4-elver@google.com>
 <aYDFOIskB20CbztD@willie-the-truck>
 <20260202192923.0707e463@pumpkin>
 <aYHgNSF5a3F7UGU_@willie-the-truck>
 <CANpmjNNzx-zc_-ZPgwe5DoWLmexw5irT2n+XMUqxTrfwxTxTmg@mail.gmail.com>
 <20260204131400.GI2995752@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204131400.GI2995752@noisy.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_061559_303754_C32DEB7B 
X-CRM114-Status: GOOD (  28.68  )
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

On Wed, Feb 04, 2026 at 02:14:00PM +0100, Peter Zijlstra wrote:
> On Wed, Feb 04, 2026 at 11:46:02AM +0100, Marco Elver wrote:
> > On Tue, 3 Feb 2026 at 12:47, Will Deacon <will@kernel.org> wrote:
> > [...]
> > > > > What does GCC do with this? :/
> > > >
> > > > GCC currently doesn't see it, LTO is clang only.
> > >
> > > LTO is just one way that a compiler could end up breaking dependency
> > > chains, so I really want to maintain the option to enable this path for
> > > GCC in case we run into problems caused by other optimisations in future.
> > 
> > It will work for GCC, but only from GCC 11. Before that __auto_type
> > does not drop qualifiers:
> > https://godbolt.org/z/sc5bcnzKd (switch to GCC 11 to see it compile)
> > 
> > So to summarize, all supported Clang versions deal with __auto_type
> > correctly for the fallback; GCC from version 11 does (kernel currently
> > supports GCC 8 and above). From GCC 14 and Clang 19 we have
> > __typeof_unqual__.
> > 
> > I really don't see another way forward; there's no other good way to
> > solve this issue. I would advise against pessimizing new compilers and
> > features because maybe one day we might still want to enable this
> > version of READ_ONCE() for GCC 8-10.
> > 
> > Should we one day choose to enable this READ_ONCE() version for GCC,
> > we will (a) either have bumped the minimum GCC version to 11+, or (b)
> > we can only do so from GCC 11. At this point GCC 11 was released 5
> > years ago!
> 
> There is, from this thread:
> 
>   https://lkml.kernel.org/r/20260111182010.GH3634291@ZenIV
> 
> another trick to strip qualifiers:
> 
>   #define unqual_non_array(T) __typeof__(((T(*)(void))0)())
> 
> which will work from GCC-8.4 onwards. Arguably, it should be possible to
> raise the minimum from 8 to 8.4 (IMO).

That sounds reasonable to me but I'm not usually the one to push back
on raising the minimum compiler version!

> But yes; in general I think it is fine to have 'old' compilers generate
> suboptimal code.

I'm absolutely fine with the codegen being terrible for ancient
toolchains as long as it's correct.

Will

