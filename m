Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6978C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 22:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ub6l+gGnhbpnVJSf1sECQFZws1/JGSNU3EBgSX0gJT0=; b=yQtwFa0oXVVepMQoNgHtgEsFWR
	r2TbrS29FCgdh2DLk01/GYWU9RSXg04QXwh+kuDaIEk+XSZd0Q93+bTP87TrMlL0k8gqJffSYxgRE
	ujOeJFUrIKVAuYFCG9FSPQYkdVd/4Mj9p9+vRBOAlxMm+NLO9bRzO/PY7NisKAetiADeDf+93lKNh
	KzBelZ/X09FM0kIy19IFQnG+6QMdqWJ+0lpqszVtl2RMU/ATdWDBsxaL43/M1dtu2R4jAT8do53wH
	qUaGj11ONWdgVHDQVFHn8J0S2EYY+FXGSYphYK6tgQkADmyE0ErV926emTsxdWBnHKgRLC8GFkPGE
	e9op68tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAEGT-0000000EYiI-0ile;
	Fri, 25 Sep 2026 22:19:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAEGR-0000000EYhz-2MLv;
	Fri, 25 Sep 2026 22:19:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A6E9D60136;
	Fri, 25 Sep 2026 22:19:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBFD91F00893;
	Fri, 25 Sep 2026 22:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790374770;
	bh=Ub6l+gGnhbpnVJSf1sECQFZws1/JGSNU3EBgSX0gJT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PQxXz8Bqrp5fZyfGD0+JAGV/Kt9gf1keLvC0fg5oDg0FbTEbVJGuxWGMfLX4a64tp
	 AWVr2a0nGnUzgI0wEPXnVpyWA2bs9xiS75lcfbRaZsj6SsbeBpDWwM2a1brofqNtc/
	 PMVzMywMMPqnL/kNGdSX9F63rKLKf3sNQoadBGdYyIoJVHaFD9o2FxX3/eeZttbdAW
	 inqLQvas8M54Ltq6wI4sRbZF3B+T/RIAJD3NcO6l0rUleguc0EzcHCV7vzFkNvo/WV
	 yh0CnZKvY/rQthUclqO6rQJbXjy8+yJDamlNxOKl56QmZxkkB7YCoqP8hpwRiy5WMz
	 6mMauv2SHxwSg==
Date: Fri, 25 Sep 2026 23:19:21 +0100
From: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Theodore Ts'o <tytso@mit.edu>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
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
Message-ID: <20260925221921.GA2296912@ax162>
References: <20260925-vdso-getrandom-avoid-memset-llvm-24-v2-1-ce640f872393@kernel.org>
 <CAKwvOdmuvn0LZkYEsH84hnOGTYhTtzuWs3wMARtWdTeL6dD9sA@mail.gmail.com>
 <CAKwvOdnxKVpn=nAFaqP+9PTx4PqgHsUVWv6e60Pcr29W_eZrpQ@mail.gmail.com>
 <CAKwvOdmNZL3eFvV3v77GXDzL+XLgz+BT9TA=my0yTnbsHqVeSg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdmNZL3eFvV3v77GXDzL+XLgz+BT9TA=my0yTnbsHqVeSg@mail.gmail.com>
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

On Fri, Sep 25, 2026 at 03:00:46PM -0700, Nick Desaulniers wrote:
> > > > +static inline void *memset_inline(void *dst, int value, size_t size)
> > > > +{
> > > > +       char *d = dst;
> > > > +
> > > > +       while (size--)
> > > > +               *d++ = value;
> > > > +
> > > > +       return d;
> > > > +}
> > >
> > > Does this work?
> > > https://godbolt.org/z/Tx6EaGMfb
> >
> > Hmmm...possibly.
> > https://godbolt.org/z/ec9rzd9Yf
> > I don't get it...
> 
> Just keep it under 2 pages, it will be fine:
> https://godbolt.org/z/qqoMqfxev

Yeah, it might be worth a comment that this is only safe for small
values of size so it should not be blindly copied elsewhere (although I
guess if it is, the outlined version exists in the majority of other
places).

-- 
Cheers,
Nathan

