Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD77C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 16:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zh0HsQ975MJmBXDsCbmWgWK1LZA5u2hBn3c+nLKAguk=; b=JKmmPYA/uCwP/FzCKgUzumVDOl
	MmG/KJuD/ghVMBKRgBuhOgwMJ4xxEAZf8ztCI8aYIuNO7DC4TB81t3SrUYrZpo/1lby920u/FEOCp
	/2MOl9jIWWrEJ5nhoXyk5pHQfha5d/v/41hD3lk0GNDkq//a+7Vycyho662of3A/lDy3K3eBOzrQr
	VhVLCrBK2a9XGfFk6VZr59bjc1pbWXdUWOPEsV5VZhkk4/ECF0I5wsS4zoGVuf8CbmShZEsFKt94W
	jcMQzaPbseVp5FMP2BHb09BvPoSIaLXbs5VBVD4qjUjyHu4UzGQwJ3vU+vxCaTofqT0bKrHheCYi8
	l6QQ2Vtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Grl-0000000EJty-1mXW;
	Fri, 11 Apr 2025 16:04:29 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Gpw-0000000EJii-18V6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 16:02:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8205EA4AB62;
	Fri, 11 Apr 2025 15:57:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 660A0C4CEE2;
	Fri, 11 Apr 2025 16:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744387354;
	bh=vAL2HWsYZdwCmYgBhqkDTW705E6nfjbHy8zZUtbDK1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lM3n2Loz/+36sq/6Lei4iAuRvu0gIZAxvFRJtwZJkrecobf/bxMztsQO8Ec0gJN/f
	 fXLjuuIGuhEKNlEDySUgAFXjabeqc/IU7+VSGmwoOungmellXHntYqTXYbyWHYqW5R
	 nPTTpV656C2vLz6f0jvUeU6hmU23lQqoEwlpFaf4W0hxSA0f2n12r/4oYKMyVz841q
	 DQloyDbE7vemgtETopzA47uMliPINAXLBoy/olrdvyxgU7Pd9lVlDefKAoo81dVMzU
	 8orDcHPaYgZPwO2Pzul9QKFGqTIjHhhv0N96eMQ1RSesLVcCCaGOeRgic6Rzpk29vL
	 Cx6nXHbilX9OA==
Date: Fri, 11 Apr 2025 17:02:26 +0100
From: Will Deacon <will@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, linux-kbuild@vger.kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>,
	Borislav Petkov <bp@alien8.de>, Brian Gerst <brgerst@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Ingo Molnar <mingo@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, Takashi Iwai <tiwai@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uros Bizjak <ubizjak@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-raid@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH 4/4] arm64: drop binutils version checks
Message-ID: <20250411160225.GA5675@willie-the-truck>
References: <20250407094116.1339199-1-arnd@kernel.org>
 <20250407094116.1339199-5-arnd@kernel.org>
 <20250408084642.GA1768@willie-the-truck>
 <f79695b7-f0c0-442f-963d-6ecae246ebf5@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f79695b7-f0c0-442f-963d-6ecae246ebf5@app.fastmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_090236_375213_1DCF343C 
X-CRM114-Status: GOOD (  21.15  )
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

On Tue, Apr 08, 2025 at 03:10:57PM +0200, Arnd Bergmann wrote:
> On Tue, Apr 8, 2025, at 10:46, Will Deacon wrote:
> > Hi Arnd,
> >
> > On Mon, Apr 07, 2025 at 11:41:16AM +0200, Arnd Bergmann wrote:
> >> From: Arnd Bergmann <arnd@arndb.de>
> >> 
> >> Now that gcc-8 and binutils-2.30 are the minimum versions, a lot of
> >> the individual feature checks can go away for simplification.
> >> 
> >> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> >> ---
> >>  arch/arm64/Kconfig              | 37 ++-------------------------------
> >>  arch/arm64/Makefile             | 21 ++-----------------
> >>  arch/arm64/include/asm/rwonce.h |  4 ----
> >>  arch/arm64/kvm/Kconfig          |  1 -
> >>  arch/arm64/lib/xor-neon.c       |  2 +-
> >>  5 files changed, 5 insertions(+), 60 deletions(-)
> >
> > Since some of these checks are dynamic (i.e. they try passing various
> > options to the tools to see if they barf), have you checked that the
> > minimum supported version of clang implements them all?
> 
> I did some randconfig build testing with clang-13/lld-13, since that
> is the oldest supported version, and checked that the options are
> all supported. I'm pretty sure it's been there for a long time before
> that already.

Thanks (especially to Mark!) for checking.

Will

