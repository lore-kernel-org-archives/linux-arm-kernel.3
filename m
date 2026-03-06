Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F35BDFCB638
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 23:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ZR7Dp2IPiEMUD6BfjnRAuZaSEUl5mI6F5vABdqGEZ0=; b=0hX2BHQrX+Lna+CnKjixlZ8+EB
	yYmyGwP6T0dU3N8hU4PN5gaOY7ccU5hN5zhTFXlkiIRfKti4heBQvjf6QDGxGpccimKD4f/7SIYAf
	KOgAh/+OpVv1Mpas/ZZ8FZO0YzdOu2cd9Yg/7iBLezSJSZS+wPL7HO0d4wuIMlouDyHeOhvcfPtkb
	NNPiAds8yhgI6fw/zgjqspc48grluooQz38P8i6vTvXS+4mg9fCVkJNT925e0uMcFbi+y/7w4BB+X
	+sH7M2hGchV7/UssJDgW8gJss82oKBlQVNVRr3B/UFe03cpO/j1iLWcOPlQ+U1qWC0qKvhRY8DLQQ
	b4ZUp/QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeQ1-00000004d18-3T9o;
	Fri, 06 Mar 2026 23:17:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeQ0-00000004d10-2tRB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 23:17:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 79D9260018;
	Fri,  6 Mar 2026 23:17:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86B13C4CEF7;
	Fri,  6 Mar 2026 23:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772839035;
	bh=A/uuCYUUHbNrrdKdzYdGzSe5pMInGIZfaSIgsjBFQtg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CiNTmhly2/1kTdtRkuNAgOXwAQT7A+wQx51m3gawq6ph2TOb1AmR20TS/sy1txYNU
	 iElaZlD0mEOexw6DRDS/H4TTDu/pyj/oV6d7iSt93lYyho/X6/HC8T986ocCrdSX8f
	 W0fMhB4DiENlMrX0hKOJVXylpR8JdeJwPK1us4hrvgF/gpr5p0tTJy8J9/hBJuGZ7x
	 J6oOaB9DvzC1IcXPWbDiXcwZ6M+56B4nTerYJlMNfl+KbCI8z/0xfmHkRzg6Ie7YMn
	 mh/kZD1RDkMqTowspybgiAXSVWjmzHV1BRX2XnLenj50feqtNdUtqkWd/KSVt0jhRK
	 6S7laj3n5tF8A==
Date: Fri, 6 Mar 2026 16:17:05 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Nicolas Schier <nsc@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-efi@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH 0/2] kbuild: Switch from '-fms-extensions' to
 '-fms-anonymous-structs' when available
Message-ID: <20260306231705.GD2746259@ax162>
References: <20260223-fms-anonymous-structs-v1-0-8ee406d3c36c@kernel.org>
 <01433066-eb9b-4a96-8d7f-794af941d365@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01433066-eb9b-4a96-8d7f-794af941d365@zytor.com>
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

On Thu, Mar 05, 2026 at 03:43:29PM -0800, H. Peter Anvin wrote:
> Question: does clang allow this with __extension__, or only if the option is
> on the command line?  It would be desirable in the long run if both clang and

It looks like only on the command line:

  https://godbolt.org/z/zrE766obe

> gcc would allow this with __extension__, as that would be required to use it
> in uapi headers (at least without some doable-but-nontrivial preprocessing,
> which might be worthwhile to do anyway...)

I agree that would be desirable but wouldn't that change how
__extension__ works? As far as I can tell from reading GCC's
documentation [1], __extension__ just supresses warnings from -pedantic
and such, it does not actually enable a used extension if it conflicts
with whatever -std= value is passed?

[1]: https://gcc.gnu.org/onlinedocs/gcc/Alternate-Keywords.html

Cheers,
Nathan

