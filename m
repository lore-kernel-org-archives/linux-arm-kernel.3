Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F83CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 14:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ee8P1tFhKxvly/ZTq0b1RUjGrPK1o7ySfvF6TcwJsFA=; b=421/uFyRzmHo5OUoXI9qV0/jCD
	0BEfORaepHBR4Ac/40v1PDgLnzTtdfgrTMDeIWUWWx/tAMC/XauFvG3ZyP7VEDWIRZqHRxV/n3lD1
	NHStg3ZmJrudS1D62bVu8ap4FqQzGuPLVL+/YWW/1h8iANeY8Sp20KJXxHp/o4Tjnidk5xzJT6iQ7
	RHCNjWotGY6Hu4WZreunk49a7kA8XTMB+2H1nRYTmGGBAjKCudY0cfYymziuf1JoGvRGIy5mzCgHj
	AfIHNBSi/Iigqdrl79YEGX6198bPdlTx6FWBv/LKthjEQpuF+KHr2rffDdzBm5Z65o6C6t5+moP0i
	Y9kRkm0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9Eh-0000000GuoO-2Dro;
	Thu, 04 Jun 2026 14:39:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9Eg-0000000Gunf-0gLB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 14:39:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 096FA600B0;
	Thu,  4 Jun 2026 14:39:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAB041F00893;
	Thu,  4 Jun 2026 14:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780583992;
	bh=ee8P1tFhKxvly/ZTq0b1RUjGrPK1o7ySfvF6TcwJsFA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EpSXDkSMw5AZDuqlPmQPMNc8l0eY9JmMHDAbRtmbiB0NzKYOygRT2U0DkZ5/FygiN
	 7qF5RKNNjOzUtNx+qrXa1QVriiUWFYNBPY+SHvo8Go3QvS9x+NI1iEEsoFAwicSlHE
	 GeREOhls4S+i2b4vAJrTsREN2YR8RJl6M3fG+p7sepnb6sLonpGuZWJgbgpuH0ydSs
	 cxXYgdnLOF8EtniLsDjEy0gbeRrowImn05V/vvwacM/xCJnIZCmnxwD+78QDrq0Mjj
	 GmP1+MyBiN3zxQfPT8X6/aYXFld0uDC99xa50CEHk/AtvO1/4sRkk2rpfLvXdciWeZ
	 fbIuiVkwwEL4g==
Date: Thu, 4 Jun 2026 15:39:44 +0100
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
Message-ID: <aiGOMPZfk7LIAb59@willie-the-truck>
References: <20260527214510.3907973-1-xur@google.com>
 <20260527214510.3907973-3-xur@google.com>
 <178010203122.3743687.12531843798236779880.b4-review@b4>
 <CAF1bQ=RNokHJtf=8RGKyP12jNPKUvyztJVRaDZ2fnXSVzZ3L5g@mail.gmail.com>
 <ah6ltnOk2ol8_2ly@willie-the-truck>
 <CAF1bQ=TfCAdxh64cSNeO5wiT8o02o6+bVooju1Bgy3odM1NYwQ@mail.gmail.com>
 <20260603015354.GD1940387@ax162>
 <CAF1bQ=S-p+Mi80a8C8pZzJ3E3bW_5tr6WBUKVV1LaXC9iBor=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF1bQ=S-p+Mi80a8C8pZzJ3E3bW_5tr6WBUKVV1LaXC9iBor=g@mail.gmail.com>
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

On Wed, Jun 03, 2026 at 03:15:02PM -0700, Rong Xu wrote:
> On Tue, Jun 2, 2026 at 6:54 PM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > On Tue, Jun 02, 2026 at 10:52:48AM -0700, Rong Xu wrote:
> > > On Tue, Jun 2, 2026 at 2:43 AM Will Deacon <will@kernel.org> wrote:
> > > > I still don't think it has anything to do with the arch. If the compiler
> > > > supports the option, then we can use it. The arch code in the kernel
> > > > doesn't need to do anything, right? So can you just check if the
> > > > compiler accepts the option using a 'depends on $(cc-option, ...)' line?
> > >
> > > Yes, arch code in the kernel does not need to do anything—it is just a marker.
> > >
> > > I understand your concern. I can use (cc-options,...) in PROPELLER_CLANG config.
> > > But I will not use -fbasic-block-address-map for backward compatiliby reason.
> > > I would use "-fbasic-block-sections=list=/dev/null".
> > >
> > > I'll send the updated patch shortly.
> >
> > Technically, an architecture needs to add the section generated by this
> > compiler option to their linker script to avoid an orphan section
> > warning (or error from CONFIG_WERROR) if enabled, as has been done in
> > this series.
> >
> > I worry that moving to a dynamic check will cause build breakage if an
> > LLVM target gains support for Propeller without having their kernel
> > image linker script adjusted. Maybe that will not happen very often and
> > even if it does, I do not mind taking on the maintenance burden of
> > fixing it but there is a cost of moving to a dynamic check like this.
> >
> 
> This is true.
> 
> That said, these orphan sections usually won't impact correctness. The
> linker will group these together even withgout the link script change,
> even though it generates a lot of warnings.
> 
> With moving to a dynamic check, correct usage of this feature remains
> the user's responsibility -- I think this is Will's point from the
> very beginning.
> As noted in your previous response, the dynamic check is primarily
> intended to prevent "allmodconfig" build failures.
> 
> I am comfortable with either the arch_kconfig or dynamic_check
> approach. Once a preferred solution is decided, please let me know so
> I can submit v4 for review.

I continue to object to the pointless ARCH_ selection and much prefer
having the core Kconfig check the cc-option.

Will

