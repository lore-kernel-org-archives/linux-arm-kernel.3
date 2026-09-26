Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40965C98338
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 12:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fX1UOorzk2WNkUzS8vq28akGhPcRScYxSKIHc7khZsE=; b=mZ9aHkXjd3Agdvm385F4LXMQfZ
	k2ZPNokggkequBtzX9fg3/dXIIYzalLUpMt6qifg6XM29sB6evu1xf59IYN6yqF+vtNqxG9KWLxfj
	hFsdoZMfMJoqyfHAMAhNQerZ1nPy0h+PXctvMHZ1tUajuvY6DCU4izh/OPbXzzuzunZj6I+ci/NFP
	5WIptQutJGRm59CagcaWYKVYg1yuw9Mv+8lkJc4fG86INcGDKHP1ECe5yQi+cYeWxQEF3tTPA3ZbF
	4NvfXwdxrcHOYfJeXFKEhZy9aiAFHY5R2iG+5Y69VY79A5WwEWSuqE4eFXaheSTFJmJE8nzlauPRo
	0ic6pJmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xARNT-0000000FMtW-1gWj;
	Sat, 26 Sep 2026 12:19:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xARNR-0000000FMtM-4BQY;
	Sat, 26 Sep 2026 12:19:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 22F39434A1;
	Sat, 26 Sep 2026 12:19:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20C6B1F000FF;
	Sat, 26 Sep 2026 12:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790425176;
	bh=fX1UOorzk2WNkUzS8vq28akGhPcRScYxSKIHc7khZsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fUXIg6SjJk+Qr1M0g3x4kQiPdWY0pMcyzGHOa/cNhZMob/KEO2PpiVHQtdd6QWG3x
	 dZ1y+306fsaJBZodcxplS8L82NhW9YwwaaW61njzxIIsMh2aygiTjvDyx579LwgTlk
	 TiNEAn/LIYOFBCadmux7/TrQTROL8C9DBsngCTXN5FvYS+wlAGeerAjS/qGI8F8zSt
	 zNqskNZyO093mE4xSamxYt4pPd91MQE+lyJXBwlx8zyyl/XlWLoHwQD1qUMS1tbOL6
	 bgAKynwX99Ez+3lc/SWDJSSB8c5kqNCTcs0gDxMX99zbcw5tfAFyKVemNQNOkTs/aX
	 D6EfHEKDJYwZw==
Date: Sat, 26 Sep 2026 13:19:27 +0100
From: Nathan Chancellor <nathan@kernel.org>
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Theodore Ts'o <tytso@mit.edu>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
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
Message-ID: <20260926121927.GA1486962@ax162>
References: <20260925-vdso-getrandom-avoid-memset-llvm-24-v2-1-ce640f872393@kernel.org>
 <87zex4ic68.fsf@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zex4ic68.fsf@linux-m68k.org>
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

On Sat, Sep 26, 2026 at 11:39:43AM +0200, Andreas Schwab wrote:
> On Sep 25 2026, Nathan Chancellor wrote:
> 
> > +#if __has_builtin(__builtin_memset_inline)
> > +#define memset_inline(dst, value, size) __builtin_memset_inline(dst, value, size)
> > +#elif IS_ENABLED(CONFIG_CC_HAS_OPT_INLINE_MEMSET)
> > +#define memset_inline(dst, value, size) __builtin_memset(dst, value, size)
> > +#else
> > +static inline void *memset_inline(void *dst, int value, size_t size)
> > +{
> > +	char *d = dst;
> > +
> > +	while (size--)
> > +		*d++ = value;
> > +
> > +	return d;
> > +}
> > +#endif
> > +
> 
> memset actually returns the original pointer, not the incremented one.
> Nothing uses the return value of memset_inline here, but it is
> confusing.

Whoops, good catch, I guess my fingers gave up on those last two
characters :) I will fix this for v3 once there has been some time for
further review.

-- 
Cheers,
Nathan

