Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E673DCA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 11:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Fz/XiVPQbxeCrS6Ooyx7iK8DZuaZzJa+GXwQ5Vs63Y=; b=OSw2EF1c1t+YVi2J+hWslWKC3F
	xjgOR1vSm5kokNGVQlkjpPsdT5MPSX2p193ervlBKm/VWxLdVOPEznbt8Fhtj/fUbxhhtz4LgePp4
	tS47jk4JEv1lRv9ZvHM44/vRB1pY/5SOxCDmqk13dx6kOO+rwxwelKZzARX9h0nt2DKgm8JzlRX0g
	JkaMHW/EetvsITkWaZOVhTst5FjuNzBfcZ0DwBqxcMyDmWf2svy+mggj7UzZWYs7FYt3vZv7lhtvR
	Q8Mo9FHVF+7aJ4i/S/Jf1wZhd23aQ59utBUJxbv+kz3wLm4CJfQyoOzivTYZS4iibMVLcggwtNc6T
	KJHEWaDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCEZO-00000008a7A-2mS5;
	Thu, 01 Oct 2026 11:03:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCEZN-00000008a6o-1oce;
	Thu, 01 Oct 2026 11:03:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D89AD401C2;
	Thu,  1 Oct 2026 11:03:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E9AB1F00899;
	Thu,  1 Oct 2026 11:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790852600;
	bh=6Fz/XiVPQbxeCrS6Ooyx7iK8DZuaZzJa+GXwQ5Vs63Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ilyZfZwcyiaalOxi9FuCnkRKhUhFz2Rp84s1uKKcWMtsnqyjRTK4chwYRwfKNBpcG
	 xSWBcawjlZQB5N6YjSTxTcpFx29bHpXUFY+OWY1TkZB40Znnbzavrt+0sofMnIlCUg
	 Od59qfNTDltB+xCARwtpINaIAgDE6VSmDVPbipxbZz19xRjIq2SM0ui5Q0u18s0Gtl
	 NeQeaadbEMr4KuuuBha6lwUTBYKyOGuVxY1TXFcDAM/cJYztQkrdJjzWvC7M2HCZFM
	 aTGy5tCkS+EUw48u7uFYxLL2NBl9H+HwOLOBoQLTpCYdKAAi0YFeiPNJ2tJBVrTE2s
	 KBIVWg2Z/PAVA==
Date: Thu, 1 Oct 2026 13:03:10 +0200
From: Nathan Chancellor <nathan@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
Message-ID: <20261001110310.GA138012@ax162>
References: <CAKwvOd=BrMfFT88jsvBPhh383qqk5G+J07CsofNu0MVkziyhCg@mail.gmail.com>
 <20260930133813.GA3142230@ax162>
 <ar0a4b9CjL2YHCkY@zx2c4.com>
 <ar0gTS71qxnx9AkW@zx2c4.com>
 <20260930151337.GD3142230@ax162>
 <CAHmME9pA+AntJ6hWoFYpTVjh-NUSd0ZGXp5XiUuhQcq3HjQT3g@mail.gmail.com>
 <ede392d7-3104-4a0f-9fa1-99b22552dcd6@kernel.org>
 <ar4nD8aRH7wEvTMt@zx2c4.com>
 <20261001102059.GA4176271@ax162>
 <ar46ap4jzLWyP92C@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar46ap4jzLWyP92C@zx2c4.com>
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

On Thu, Oct 01, 2026 at 12:48:10PM +0200, Jason A. Donenfeld wrote:
> On Thu, Oct 01, 2026 at 12:20:59PM +0200, Nathan Chancellor wrote:
> > control. The change that introduced -max-store-memset only did it to
> > "allow fine-tuning of the inlining threshold for performance analysis
> > and optimization". If they decide to remove it for whatever reason,
> > we're back to square one.
> 
> I suppose all the more reason to get -finline-stringops=memset added to
> clang. Then the dual-default thing you came up with below will naturally
> start choosing the first option when it becomes available.

Fair point, I can file an issue with LLVM upstream.

> > I know something like below would be uglier due to the ifdef but it
> > would avoid changing anything for GCC while clearing up the issue at
> > hand for clang in a guaranteed stable and succinct manner.
> 
> But then we're back to the byte-by-byte codegen that Christophe pointed
> out.

I thought that was only because the fallback memset_inline() from v2 was
doing a byte-by-byte initialization? With my suggested diff, nothing
should change for GCC, as it does not have __builtin_memset_inline(), so
the "Before the patch" code generation that Christophe showed should
still be present.

> > If that is not acceptable, something like the following does appear to
> > work for me.
> 
> Okay, great, let's do that.
> 
> Does this commit seem okay with you? I used the diff you sent below and
> adjusted the commit message: https://git.zx2c4.com/linux-rng/commit/?id=56ff95ee85715047eb5b5220243778af657778c8

Yeah, that seems fine to me, thanks for taking care of it!

-- 
Cheers,
Nathan

