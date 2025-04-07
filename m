Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DEF6C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 21:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aiwWlr7NvnGjsLoXYuTRpkLipjZY1y7PIoRt82ZvAFE=; b=pfaoukAyZ6Y1zpl9lqQ9sJnZZX
	PGL2hbeOgERKvOrGqvbA2HwRtWCbGh6TywPF4XfODla08FId8pDv47SYq5nxCPbkC0XcTJ8OWzQZc
	AVGgrFYeVGRdTP8MROt5EXoRRdRLhsm9A8r3CMfAxVTsMQGiv0kF9QRychcpDGMQVgTjFss6+ZjsP
	eGz3lz1GEuOmgBvhdMUEupGSSCVIRwbIP1vmEyEos5iMgHNz0Aqn34xoRUib4DHoKaibCUgivSDO1
	TNYoDTffVVi7HXf/tqDhj5zwwpZA1UZmTXekT+onjdELHqzHfx780Q4bPyTfMOEjyTsJMbcECGMiC
	WXB3GpSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1uIs-0000000248G-04l8;
	Mon, 07 Apr 2025 21:46:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rEn-00000001Yov-16QB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 18:30:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 773D75C2108;
	Mon,  7 Apr 2025 18:28:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D8DFC4CEDD;
	Mon,  7 Apr 2025 18:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744050624;
	bh=FQMfGLh5C6n7JuybfDzu2iuG/1Pw/ID6KqOpxvzKSf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qhr8f8gZiL0WRr46kStn2vSZUbAYQXAuO0aN9Q++95HNF7FaI8kzwZSbly1LsBypL
	 /MdsuXsMr+wp2Pjy8kXUAqkw5XZqGFteMbwpbvxr8Daj+eDx63tVuOgCzLkrgoFW9K
	 O7yUUZJSQ/RJHzcpPP4yliEQTYEVcmEjK2mx+nDQU2+Ab1HJ1pR9RlUjD3m2o1j2b6
	 iyU4WfBchLKbUk4sjkdCjSDahIan+K2xDP3sK0Lg34NFdEt8wEiBpS6EN36kmySjRl
	 5NvqLJyvpIJbfe3cCeJIcv2Smi4XWmBXtRP5YBIa5HO7wjSWuG2hkFAnzHl2/Cz0Pf
	 4LgmFHUyS9Mjg==
Date: Mon, 7 Apr 2025 20:30:15 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, linux-kbuild@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, "H. Peter Anvin" <hpa@zytor.com>,
	Ard Biesheuvel <ardb@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Brian Gerst <brgerst@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Ingo Molnar <mingo@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, Takashi Iwai <tiwai@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uros Bizjak <ubizjak@gmail.com>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-raid@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH 0/4] Make gcc-8.1 and binutils-2.30 the minimum version
Message-ID: <Z_QZt8mPEf-dlvcZ@gmail.com>
References: <20250407094116.1339199-1-arnd@kernel.org>
 <20250407164151.GB2536@sol.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407164151.GB2536@sol.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_113025_355385_C0C50906 
X-CRM114-Status: GOOD (  17.20  )
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


* Eric Biggers <ebiggers@kernel.org> wrote:

> On Mon, Apr 07, 2025 at 11:41:12AM +0200, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > x86 already requires gcc-8.1 since linux-6.15-rc1, which led me to
> > actually go through all  version checks and make this is the minimum
> > for all architectures.
> > 
> > Most of the actual resulting changes are actually for raising the
> > binutils version, which eliminates version checks on x86 and arm64.
> > 
> > Arnd Bergmann (4):
> >   kbuild: require gcc-8 and binutils-2.30
> >   raid6: skip avx512 checks
> >   x86: remove checks for binutils-2.30 and earlier
> >   arm64: drop binutils version checks
> 
> This is intended to supersede the patches from Uros that removed checks for
> binutils < 2.25, right?  See:
> 
> * https://lore.kernel.org/linux-crypto/20250404074135.520812-1-ubizjak@gmail.com/
> * https://lore.kernel.org/linux-crypto/20250404074135.520812-2-ubizjak@gmail.com
> * https://lore.kernel.org/linux-crypto/20250404074135.520812-3-ubizjak@gmail.com/

Yeah, so these commits (now pending in the x86 tree) should nicely 
complement each other, there shouldn't be much friction other than:

  a72d55dc3bd6 x86/idle: Remove CONFIG_AS_TPAUSE

... which will have a conflict in arch/x86/Kconfig.assembler but is 
straightforward to resolve.

> If we can indeed bump up the requirement to 2.30, that would be great.

Agreed.

Thanks,

	Ingo

