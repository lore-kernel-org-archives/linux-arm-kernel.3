Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A55C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 19:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=62D4jT8FqgvCQAvir88qqLUPmBFgY8nEPATu4+rGZ4M=; b=BDqUpYoZ5LgEaO6daliwNslBQk
	nHLhzjgMqJ+HHad1VWRmx7kaV6XdiB96BMHbfyc9/EUX3+h0RuNu8lGknPPfncyM9K57ECYabsCcw
	NWwK9R9bzneQsPmPHRaE+Qoi6sYaY2VeS4TTJwGhQIIyPuVblDjUCzK3sYmywhf3zWN65dmUlKotN
	/1N+Mcy0+lT+liCGKc9PIeiVA479Ek9gbIFRfZrW/2AVdlZ5A7Psrz8djYwdcNSvsDgUMfQPBu99y
	2XoqvUl/g8iN9jACW2gATq9FLpUBb7zsqkJubaPHjwhq7NuPslbqBl5QiWlICxq1mT0ApZudbIUF/
	1IQ2Olzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCkeU-0000000Gb5n-04qY;
	Wed, 07 May 2025 19:41:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCkcX-0000000Gari-2wfT;
	Wed, 07 May 2025 19:39:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E271629D8;
	Wed,  7 May 2025 19:39:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0DA0C4CEE2;
	Wed,  7 May 2025 19:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746646796;
	bh=5I7Y42gv0Xc24O6cWYZHG0MvTqIyPfed5hpojVV46Cs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u1SqsDxB/g600BTu4sky4DKUVjfl1oDoOHSjos3OglBUO3r5ziZEUSYrGhQEJbIGc
	 /hgDGGywWZjMgVHBWxIKFxid7W3NlXGhudDVowJiD8A7xtMyHlDtVXGX4dR2D++Xv3
	 BSgZR4gzpPkvKRUJ3mqOJY76mhFzdikOJ1pam4u+BpTPzRaGrv+6RT1oIQ2SfBv0eK
	 6yflLpCPdfQXrNcxLl52iB/aS5GNE124Nm8Llx95t7b46xZUQIJi/xCMvyN/LsRTGn
	 zqQ1gCN6R7qB0uIhywhZ7QC1LmeWo55N1MJoJW7lvm+Lhk4UkrEorBUDm9BVmEvaZj
	 /eDEXU4AwO0ng==
Date: Wed, 7 May 2025 21:39:48 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, x86@kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-efi@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com, sparclinux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH 3/8] stackleak: Rename CONFIG_GCC_PLUGIN_STACKLEAK to
 CONFIG_STACKLEAK
Message-ID: <aBu3BNS60PEw5Uwu@gmail.com>
References: <20250507180852.work.231-kees@kernel.org>
 <20250507181615.1947159-3-kees@kernel.org>
 <aBuqO9BVlIV3oA2M@gmail.com>
 <202505071236.AC25A6CC2@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202505071236.AC25A6CC2@keescook>
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


* Kees Cook <kees@kernel.org> wrote:

> On Wed, May 07, 2025 at 08:45:15PM +0200, Ingo Molnar wrote:
> > 
> > * Kees Cook <kees@kernel.org> wrote:
> > 
> > > -	  The STACKLEAK gcc plugin instruments the kernel code for tracking
> > > +	  The STACKLEAK options instruments the kernel code for tracking
> > 
> > speling.
> 
> Thanks!
> 
> > Also, any chance to fix this terrible name? Should be something like 
> > KSTACKZERO or KSTACKCLEAR, to tell people that it doesn't leak the 
> > stack but prevents leaks on the stack by clearing it, and that it's 
> > about the kernel stack, not any other stack.
> 
> Yeah, better to name it for what it does rather than want to protects
> against. The internal naming for what it does is "stack erase", so
> perhaps KSTACK_ERASE ?

That's even better, and I like the word separation as well. Thanks!

	Ingo

