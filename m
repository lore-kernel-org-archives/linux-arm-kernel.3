Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41107CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 09:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4bPY4fJ6c9uP07ufSfPcuq2d7wSLvbUz6mUS+a9l00c=; b=ZdZZNpZzn2ZATISzKzZxP60QJy
	XIfuLRRDjpMac+gm2u4LqpN5dZ7K1gIF0xOaxpnBnDi7j/XTHxvw3UFwNtRsLf42cFCFOnUzzZrMY
	qVGaFiPgsuVZhtGkKoz6LGaTBaH74efjzrjY9OoC3CXjJScmSnGq3k4fxUZHKkhvXmhIapZcwyt2L
	gIlyydyZxn73bjkx++plPTZdUZPTheukuBrId0F/qfKjIibJT60i9uOX8Gcl7ng4pJfazJXxvKLnU
	OrePhQzf6fuXmHFMM7XWV9OUF+yZyPVBkojM/bT9nrk1RvcYPszh1nnkBtbN4k1L9J32Ibd0eR3Po
	jbpOzlEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wULej-0000000Ch9M-1BdA;
	Tue, 02 Jun 2026 09:43:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wULeh-0000000Ch93-3VSw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 09:43:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 03AB56001A;
	Tue,  2 Jun 2026 09:43:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D85081F00893;
	Tue,  2 Jun 2026 09:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780393406;
	bh=4bPY4fJ6c9uP07ufSfPcuq2d7wSLvbUz6mUS+a9l00c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gzXKXxmC3P5o3dySXNAJu+zeZEwj9UBO/v0KTIuNNvh8Ej4STiKcOPOHo0ZIgaFtJ
	 eSrWI4uSeLhxM1n2alt/Ar8C1z7/xaM9r0/pywPQu97dhXsEAPFe/Bk0rRmPEo0Xni
	 tVmqMN38Cwkvb0AsC7BvQ6WtRFeSztNRIT/jSG3VCCLx7waIf5S0KmEIG0ZEyh4gVp
	 hTF+lp3wVJo4EtAMhKuzeeMyMsg868tIE06X7oei5fmb1xG7X2TLm4G4wHg5Nr0vlJ
	 wWbF7NfnuqFTZtnh3VMagiWz4EIKQRz5aijEsLWT+LVzOla4ZZFCWPqtJBOYo29u5B
	 z/1Q3q5IlAgqg==
Date: Tue, 2 Jun 2026 10:43:18 +0100
From: Will Deacon <will@kernel.org>
To: Rong Xu <xur@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Yabin Cui <yabinc@google.com>,
	Han Shen <shenhan@google.com>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Kees Cook <kees@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Linus Walleij <linusw@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>,
	linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	Helge Deller <deller@gmx.de>, Ryan Roberts <ryan.roberts@arm.com>,
	Marc Zyngier <maz@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Vincent Donnefort <vdonnefort@google.com>,
	Alice Ryhl <aliceryhl@google.com>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/2] kconfig: Remove the architecture specific config
 for Propeller
Message-ID: <ah6ltnOk2ol8_2ly@willie-the-truck>
References: <20260527214510.3907973-1-xur@google.com>
 <20260527214510.3907973-3-xur@google.com>
 <178010203122.3743687.12531843798236779880.b4-review@b4>
 <CAF1bQ=RNokHJtf=8RGKyP12jNPKUvyztJVRaDZ2fnXSVzZ3L5g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF1bQ=RNokHJtf=8RGKyP12jNPKUvyztJVRaDZ2fnXSVzZ3L5g@mail.gmail.com>
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

On Mon, Jun 01, 2026 at 11:18:27AM -0700, Rong Xu wrote:
> On Fri, May 29, 2026 at 5:47 PM Nathan Chancellor <nathan@kernel.org> wrote:
> > On Wed, 27 May 2026 14:45:08 -0700, xur@google.com <xur@google.com> wrote:
> > > diff --git a/arch/Kconfig b/arch/Kconfig
> > > index e510c585ea84..e4eaca9c917c 100644
> > > --- a/arch/Kconfig
> > > +++ b/arch/Kconfig
> > > @@ -879,12 +879,8 @@ config AUTOFDO_CLANG
> > >
> > >         If unsure, say N.
> > >
> > > -config ARCH_SUPPORTS_PROPELLER_CLANG
> > > -     bool
> > > -
> > >  config PROPELLER_CLANG
> > >       bool "Enable Clang's Propeller build"
> > > -     depends on ARCH_SUPPORTS_PROPELLER_CLANG
> >
> > It does not look like '' or its predecessor,
> > '-fbasic-block-sections=labels', are supported by all architectures?
> > This will break allmodconfig for some architectures in that case, so
> > this needs to addressed with some other dependency.
> 
> Thanks for catching this. Yes. -fbasic-block-address-map currently
> only supports Arm64 and X86_64 as of now.
> We thought people would only enable this config if they knew Propeller
> was supported on that architecture.
> But the allmodconfig build breaks this assumption.  I think I have to
> keep this config for propeller, and make arm64 opt-in.
> 
> >
> >   | $ make -skj"$(nproc)" ARCH=arm LLVM=1 mrproper allmodconfig all
> >   | ...
> >   | clang: error: unsupported option '-fbasic-block-address-map' for target 'armv6k-unknown-linux-gnueabi'
> >   | ...
> >   |
> >   | $ make -skj"$(nproc)" ARCH=s390 LLVM=1 mrproper allmodconfig all
> >   | ...
> >   | clang: error: unsupported option '-fbasic-block-address-map' for target 's390x-unknown-linux-gnu'
> >   | ...
> >
> > Maybe something like
> >
> >   depends on CC_IS_CLANG && $(cc-option,-fbasic-block-address-map)
> >
> > then cleaning up scripts/Makefile.propeller to use it exclusively?
> 
> I think keep ARCH_SUPPORTS_PROPELLER_CLANG is cleaner.

I still don't think it has anything to do with the arch. If the compiler
supports the option, then we can use it. The arch code in the kernel
doesn't need to do anything, right? So can you just check if the
compiler accepts the option using a 'depends on $(cc-option, ...)' line?

Will

