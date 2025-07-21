Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E695BC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 20:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pC6N5OITXZeC0uUkeAFleXNH6YpHOYQFRnwNz1YKGyA=; b=LKWpzAATtw0TonWk+BJPSLa0Qv
	lIvpBCKjqwwKdXaFTwZ5tdPT5YZOMnrhPk0z0Gvj/uHqPTV9UbgvjcVka04qaZGI09tNM6idYuio0
	jVibUBOTyZgUT7PQ7eK9eG4MYi3rNHDMPAZ9NjzP/aU5iLpqynZw9wqb/Vzhz9uDqIJagXYr7hCGq
	FFOMa9ttK1bviTdlV52vu29TU9mfLUUapy/45tCReWnlpIcx3WjrpTmOOUFfbSrnseQjvaQ9Y4p22
	2Xz/0m5jO3Kk7xPlkn+klk88Ie12GQvk1Z5hbB14s7kPwXtQDMSODmIPlNVxRYoz1ZOL7fdEEXwR7
	OonHP5pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udxH0-00000000eJN-2XBg;
	Mon, 21 Jul 2025 20:38:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udwwT-00000000bHm-311e;
	Mon, 21 Jul 2025 20:16:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 42D9A5C5950;
	Mon, 21 Jul 2025 20:16:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4CE8C4CEED;
	Mon, 21 Jul 2025 20:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753129016;
	bh=fPCjBlrmUPA5mvNxfbJDvZCN5253HcHDupts84ahHrU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OZTE06mjfY3FbIlctpmaahVfBx8Ck81gl137LyK4mbMGhbJDdxgZK/YFqcRxcFs7I
	 GSierzely0mYMlZOPybWzDeEuexgHHZCVMrKRQVScg0f6wZVQdH2kKnBn8v5iEkUBG
	 jInQsZ0hyXk5meA5zT3I3fawRxEQdh2lWF2cvNxAQJ6enBocyTvzyTdbcth8dqtAQ4
	 RSLNhSDI3SFe5TsIggOzjkufSSyP0wrf5sYgxy2kZQU3dHKQdvUYaYQmdoc+hS4nj+
	 Rtw5TFIHe5eVMNmLMGYA80ueWZYHFnY0QHmC6Q6vRsAqK6arssfT0eivyT08pwrLsE
	 K9Qv9Noqniu9g==
Date: Mon, 21 Jul 2025 13:16:56 -0700
From: Kees Cook <kees@kernel.org>
To: Nicolas Schier <nicolas.schier@linux.dev>
Cc: Arnd Bergmann <arnd@arndb.de>, Ingo Molnar <mingo@kernel.org>,
	x86@kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-efi@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com, sparclinux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v3 01/13] stackleak: Rename STACKLEAK to KSTACK_ERASE
Message-ID: <202507211315.5164A33E@keescook>
References: <20250717231756.make.423-kees@kernel.org>
 <20250717232519.2984886-1-kees@kernel.org>
 <20250721-spiked-adamant-hyrax-eea284@lindesnes>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721-spiked-adamant-hyrax-eea284@lindesnes>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_131657_879366_431DF026 
X-CRM114-Status: GOOD (  19.81  )
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

On Mon, Jul 21, 2025 at 10:02:36PM +0200, Nicolas Schier wrote:
> On Thu, Jul 17, 2025 at 04:25:06PM -0700, Kees Cook wrote:
> > In preparation for adding Clang sanitizer coverage stack depth tracking
> > that can support stack depth callbacks:
> > 
> > - Add the new top-level CONFIG_KSTACK_ERASE option which will be
> >   implemented either with the stackleak GCC plugin, or with the Clang
> >   stack depth callback support.
> > - Rename CONFIG_GCC_PLUGIN_STACKLEAK as needed to CONFIG_KSTACK_ERASE,
> >   but keep it for anything specific to the GCC plugin itself.
> > - Rename all exposed "STACKLEAK" names and files to "KSTACK_ERASE" (named
> >   for what it does rather than what it protects against), but leave as
> >   many of the internals alone as possible to avoid even more churn.
> > 
> > While here, also split "prev_lowest_stack" into CONFIG_KSTACK_ERASE_METRICS,
> > since that's the only place it is referenced from.
> > 
> > Suggested-by: Ingo Molnar <mingo@kernel.org>
> > Signed-off-by: Kees Cook <kees@kernel.org>
> > ---
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: <x86@kernel.org>
> > Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> > Cc: <linux-doc@vger.kernel.org>
> > Cc: <linux-arm-kernel@lists.infradead.org>
> > Cc: <kvmarm@lists.linux.dev>
> > Cc: <linux-riscv@lists.infradead.org>
> > Cc: <linux-s390@vger.kernel.org>
> > Cc: <linux-efi@vger.kernel.org>
> > Cc: <linux-hardening@vger.kernel.org>
> > Cc: <linux-kbuild@vger.kernel.org>
> > Cc: <linux-security-module@vger.kernel.org>
> > Cc: <linux-kselftest@vger.kernel.org>
> > ---
> >  arch/Kconfig                                  |  4 +--
> >  arch/arm/Kconfig                              |  2 +-
> >  arch/arm64/Kconfig                            |  2 +-
> >  arch/riscv/Kconfig                            |  2 +-
> >  arch/s390/Kconfig                             |  2 +-
> >  arch/x86/Kconfig                              |  2 +-
> >  security/Kconfig.hardening                    | 36 ++++++++++---------
> >  arch/arm/boot/compressed/Makefile             |  2 +-
> >  arch/arm64/kernel/pi/Makefile                 |  2 +-
> >  arch/arm64/kvm/hyp/nvhe/Makefile              |  2 +-
> >  arch/riscv/kernel/pi/Makefile                 |  2 +-
> >  arch/riscv/purgatory/Makefile                 |  2 +-
> >  arch/x86/purgatory/Makefile                   |  2 +-
> 
> Did you miss arch/loongarch/Kconfig by accident?
> 
> $ git grep -Hrne ARCH_STACKLEAK
> arch/loongarch/Kconfig:127:     select HAVE_ARCH_STACKLEAK

Oh! Yes, I missed that when I rebased to v6.16 (which added loongarch
support for stackleak). Thanks for catching that!

-- 
Kees Cook

