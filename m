Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C23C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 12:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f12dV12I+MMps004lAe5FKDU+d0MmRTfY8S6E4Wcg94=; b=Oi2WedyjFJb0o0iFXDaPZWMRb0
	WgxoFzf6lsoqJXGw8kU8+3UkDWot7audNVbYdAHYNb6wr9WnXwreuh5LTw12jVxX0+mlTakbX62/P
	zGmP/BQgij0Nb91/rSvMJwmBIMtnZL87V/9/i0h3gynH/NXOLbt9jI+0xeKgSEjLDOR96UAgZAJuL
	CWxpTldgTZEDkFJb3Q16rJ8ChmP4KVk+Ulfr2qPFmAKYuRump9juPtNUxgdr1Xi/xLoqc9q+C8QdI
	MKaZ5Mpv/E3789Len3kF4RtcceJZFayrOxSk/vF0pmVLWP/uTGzvN3/xnsMFKG+GNBUxRxLyxcuz7
	CI076duA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD0RJ-00000000clQ-3tzV;
	Thu, 08 May 2025 12:33:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD0Or-00000000cSy-1JIz;
	Thu, 08 May 2025 12:30:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 008C24442B;
	Thu,  8 May 2025 12:30:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 993C4C4CEE7;
	Thu,  8 May 2025 12:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746707452;
	bh=JJPW3pg6cZkOHMvhRauntwsoTRRsn+zJqEIoKIpwLkA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rd6u/bQWZ8gH7/YC5SBwtNOV0WXVhjwJPQcJXV4yEaBgZGUr/9yakFCWFIrid5i3B
	 2cd6AKn9b1tHMbXMjCap5Aalj6FU/kxG7T9sHDnYt62R0t3OKjw6PgJkhTM0mPFe6C
	 GNgG4SpCW7VMMw/iOkkg+9hz0osB11J1AK2yMuPM9Shh9VnU3a6HvhrRuK6LTJIgFH
	 15G59Gnv4i6F4W+ozSABchoqW55c/xDsYEwfYn1HwokfWMcjYGQVYjSPSbCtsfhl4A
	 MyIP16eXwmNt7J8w7vqPawTLf+oxHIeDInhMFzIvxTA450HKB2/Z8iiwgJmPC5NndM
	 jZ4aiuiEcvCNw==
Date: Thu, 8 May 2025 13:30:47 +0100
From: Will Deacon <will@kernel.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Matthew Wilcox <willy@infradead.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH v5 0/9] Merge arm64/riscv hugetlbfs contpte support
Message-ID: <20250508123046.GA3706@willie-the-truck>
References: <20250321130635.227011-1-alexghiti@rivosinc.com>
 <4dd5d187-f977-4f27-9937-8608991797b5@ghiti.fr>
 <64409a13-1c07-42cd-b1ec-572042738f1b@arm.com>
 <84cb893a-46e3-408a-ba0e-2eff0b44d2a1@ghiti.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84cb893a-46e3-408a-ba0e-2eff0b44d2a1@ghiti.fr>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_053053_387947_9C7857D4 
X-CRM114-Status: GOOD (  29.64  )
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

Hi folks,

On Mon, May 05, 2025 at 06:08:50PM +0200, Alexandre Ghiti wrote:
> On 29/04/2025 16:09, Ryan Roberts wrote:
> > On 07/04/2025 13:04, Alexandre Ghiti wrote:
> > > Can someone from arm64 review this? I think it's preferable to share the same
> > > implementation between riscv and arm64.
> > I've been thinking about this for a while and had some conversations internally.
> > This patchset has both pros and cons.
> > 
> > In the pros column, it increases code reuse in an area that has had quite of few
> > bugs popping up lately; so this would bring more eyes and hopefully higher
> > quality in the long run.
> > 
> > But in the cons column, we have seen HW errata in similar areas in the past and
> > I'm nervous that by hoisting this code to mm, we make it harder to workaround
> > any future errata. Additionally I can imagine that this change could make it
> > harder to support future Arm architecture enhancements.
> > 
> > I appreciate the cons are not strong *technical* arguments but nevertheless they
> > are winning out in this case; My opinion is that we should keep the arm64
> > implementations of huge_pte_ (and contpte_ too - I know you have a separate
> > series for this) private to arm64.
> > 
> > Sorry about that.
> > 
> > > The end goal is the support of mTHP using svnapot on riscv, which we want soon,
> > > so if that patchset does not gain any traction, I'll just copy/paste the arm64
> > > implementation into riscv.
> > This copy/paste approach would be my preference.
> 
> 
> I have to admit that I disagree with this approach, the riscv and arm64
> implementations are *exactly* the same so it sounds weird to duplicate code,
> the pros you mention outweigh the cons.
> 
> Unless I'm missing something about the erratas? To me, that's easily fixed
> by providing arch specific overrides no? Can you describe what sort of
> erratas would not fit then?

If we start with the common implementation you have here, nothing
prevents us from forking the code in future if the architectures diverge
so I'd be inclined to merge this series and see how we get on. However,
one thing I *do* think we need to ensure is that the relevant folks from
both arm64 (i.e. Ryan) and riscv (i.e. Alexandre) are cc'd on changes to
the common code. Otherwise, it's going to be a step backwards in terms
of maintainability.

Could we add something to MAINTAINERS so that the new file picks you both
up as reviewers?

Will

