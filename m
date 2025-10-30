Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09441CCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 03:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jsjqieVlu7j26QztQ4gx8a0IlvRQKGUmWf0NzLPg2hg=; b=ETD+hZFh8oyLtWdj0DZYNbj0su
	LnVYeeLZ6nQ52q01gfFO5/lmnA0etPB9pIj9zKp5AyPx8uNTWEb1yHSah5QD1AWkBsmx/9uxz8ExN
	t0cz1DU+XT98Qzii3VHJivVg3y9RW1ihkt/KHbe+utL/8yVqk7z278/Epuu0e69wrjt+7Huoa40SX
	/5vZvRMWAHBPid+wQIqY+WXKdvE+8TxkqdoDpunHLvpRLzV6M46mfWRRZW6hxv5pHXBYoUcL00KbV
	VoGANKT9tfSF7eP5siAtcv4aqXi+SSUMKXM1c/QXTCe1ktln8N+OMYQp8CbrFRk7/V/C12z/nV/IW
	IW2ylM2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEIxP-00000003OhJ-0422;
	Thu, 30 Oct 2025 03:04:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEIxN-00000003Ogu-05Oc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 03:04:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 227AC44CBE;
	Thu, 30 Oct 2025 03:04:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E68BDC4CEF7;
	Thu, 30 Oct 2025 03:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761793446;
	bh=AxveStPh2elBDvaO3K+y6I5FgqDnSBSlQMj0Px3/aIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EZaDyQxgEBdxypDayV4zGIOC0hSpv/dimzVnZC6eD32j8HcYuLqXdqpfemFhJ/qjE
	 fSS1UN28q2IgsCqqxMq6EZaVJTO2Xom8IuurL5aVSJ0D+E4E+9p2M8S4oyHxH0tVbc
	 sCU/iAKPoST3uSPQc9greA1oCzdhXml2aOWtEpuNmUko0B61sesPBShgY8+NWmSOn/
	 cTjD20hRAUKrV8tlMd6uLlS5oeMvsLW2W06i4CZDEamhbPZ1ZoEJo0lUJbriX9rnhF
	 yCOTw0XExmFAp14LIcsxAiAElyXWgreXbAg7nwlZIhQd5qxGigk62k+ULsEsw3a2qu
	 BvjswhKmGmznw==
Date: Wed, 29 Oct 2025 20:04:05 -0700
From: Kees Cook <kees@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sami Tolvanen <samitolvanen@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Russell King <linux@armlinux.org.uk>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Michal Kubiak <michal.kubiak@intel.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org
Subject: Re: [PATCH 2/3] ARM: Select ARCH_USES_CFI_GENERIC_LLVM_PASS
Message-ID: <202510292002.10FDB135C3@keescook>
References: <20251025-idpf-fix-arm-kcfi-build-error-v1-0-ec57221153ae@kernel.org>
 <20251025-idpf-fix-arm-kcfi-build-error-v1-2-ec57221153ae@kernel.org>
 <CABCJKuesdSH2xhm_NZOjxHWpt5M866EL_RUBdQNZ54ov7ObH-Q@mail.gmail.com>
 <CACRpkdaeOYEcK9w1oy59WBqjNrK7q5zT2rzg8pHgDdZdKWVKZg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdaeOYEcK9w1oy59WBqjNrK7q5zT2rzg8pHgDdZdKWVKZg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_200409_081450_15EDEC40 
X-CRM114-Status: GOOD (  18.19  )
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

On Mon, Oct 27, 2025 at 11:56:21PM +0100, Linus Walleij wrote:
> On Mon, Oct 27, 2025 at 4:54 PM Sami Tolvanen <samitolvanen@google.com> wrote:
> > On Sat, Oct 25, 2025 at 1:53 PM Nathan Chancellor <nathan@kernel.org> wrote:
> > >
> > > Prior to clang 22.0.0 [1], ARM did not have an architecture specific
> > > kCFI bundle lowering in the backend, which may cause issues. Select
> > > CONFIG_ARCH_USES_CFI_GENERIC_LLVM_PASS to enable use of __nocfi_generic.
> > >
> > > Link: https://github.com/llvm/llvm-project/commit/d130f402642fba3d065aacb506cb061c899558de [1]
> > > Link: https://github.com/ClangBuiltLinux/linux/issues/2124
> > > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> 
> I didn't know Kees stepped in and fixed this, christmas comes
> early this year! I had it on my TODO to do this or get someone to
> do this, but now it turns out I don't have to.
> 
> > > +       # https://github.com/llvm/llvm-project/commit/d130f402642fba3d065aacb506cb061c899558de
> > > +       select ARCH_USES_CFI_GENERIC_LLVM_PASS if CLANG_VERSION < 220000
> >
> > Instead of working around issues with the generic pass, would it make
> > more sense to just disable arm32 CFI with older Clang versions
> > entirely? Linus, any thoughts?
> 
> We have people using this with the default compilers that come with
> Debiand and Fedora. I would say as soon as the latest release of
> the major distributions supports this, we can drop support for older
> compilers.

Okay, it seems like the consensus is to take this series so we don't
break existing users, even if they are rare.

Unless someone screams, I'll take this via the hardening tree...

-- 
Kees Cook

