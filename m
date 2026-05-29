Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5946CD6E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 09:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uzo32oK+c9/mN88MoqwaPMwrM7aXXpjDEFaIn8sWzK4=; b=c8dCKusypRjt4GsvpJPng3Q6/k
	TxGeHpJNA5+/uKnALiLrg3PMRsf5WfMs5H9eezBiPZ1dz9XrqA89mN/HmBxLawZJkFHBd7lhwadHu
	KC6Ys74GG18jxtkSAnQL8v63jYmkGyUpZXghI6IJoA/EtuP8i3l74CdfwWy24RVL9X44ho+vk+RUN
	l41vAPCdwiTNCBTCYdWsWMR0w0wN1PXgqMYQHduNS+BuwPtiSPVodsrQqgUvRUrt1bPwpZIvpzRvI
	Q9U9/XUnmKEawm4upi4dOqvoZsophGIW7RtaIyWqM3ZO5KjsD9TpOI01qIok7SjnTV8GpJqxlvg1C
	aBR09d2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wStEr-000000072Uc-3rQ8;
	Fri, 29 May 2026 09:10:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wStEp-000000072TZ-2ULw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 09:10:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A13502103;
	Fri, 29 May 2026 02:10:35 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 041593F905;
	Fri, 29 May 2026 02:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780045840; bh=X2wPCYS8sd8ZPqpJFapp4g1rTj2bthmSFl8gViU/14w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Za2SUu40QqXq4u/rRr0cmV2rAaU0D1DGXjljjEsx2mQ8UHfTMTWUg/AzhZwLf9FOL
	 d2PnaUeo4VVv8hPkpRhKhl5vS8x57kSq3FfVm3INW9k12u2AsbXC2rHmEcbt04DSKP
	 7GHbD5NyAlv+IippGAsohAw6QNw24bDzyYg2dxow=
Date: Fri, 29 May 2026 10:10:35 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	broonie@kernel.org, catalin.marinas@arm.com, james.morse@arm.com,
	maz@kernel.org, oupton@kernel.org, tabba@google.com,
	will@kernel.org
Subject: Re: [PATCH 17/18] arm64: fpsimd: Move SME save/restore inline
Message-ID: <ahlYC2qgqzNQxggP@J2N7QTR9R3>
References: <20260521132556.584676-1-mark.rutland@arm.com>
 <20260521132556.584676-18-mark.rutland@arm.com>
 <ahWpST4K3rbMbjWK@J2N7QTR9R3>
 <08e5ce52-be74-4fc5-a0b2-8f405a5eff99@arm.com>
 <ahW8Eba3SNqfVDdk@J2N7QTR9R3>
 <ahXMkPEpgaZQf_Nk@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahXMkPEpgaZQf_Nk@J2N7QTR9R3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_021043_674470_C603A1BA 
X-CRM114-Status: GOOD (  25.73  )
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

On Tue, May 26, 2026 at 05:38:40PM +0100, Mark Rutland wrote:
> On Tue, May 26, 2026 at 04:28:17PM +0100, Mark Rutland wrote:
> > On Tue, May 26, 2026 at 03:39:56PM +0100, Vladimir Murzin wrote:
> > > Hi Mark,
> > > 
> > > On 5/26/26 15:08, Mark Rutland wrote:
> > > > On Thu, May 21, 2026 at 02:25:55PM +0100, Mark Rutland wrote:
> > > >> +static inline void __sme_save_za(struct sme_state *state, unsigned long svl)
> > > >> +{
> > > >> +	/* The <Wv> argument to STR (array vector) can only encode W12-W15 */
> > > >> +	register unsigned long v asm ("12");
> > > > Sorry, I had meant to put "x12" here, but evidently GCC and LLVM accept
> > > > "12" on its own.
> > > > 
> > > > For clarity (e.g. to match the comment) I'll change that to "w12" and
> > > > make the type unsigned int. Likewise in __sme_load_za().
> > > 
> > > I suspect you are intentionally not using "Ucj" constrain to limit register allocator,
> > > if so I'm wondering why?
> > 
> > Thanks for the suggestion; that was ignorance rather than intent.
> > 
> > I was not aware of "Ucj" as it doesn't appear on the public GCC
> > documentation:
> > 
> >   https://gcc.gnu.org/onlinedocs/gcc/Machine-Constraints.html
> > 
> > Looking at the machine description file, that's marked with '@internal',
> > so IIUC GCC folk don't seem to expect/want people to use it. That said,
> > LLVM seems to support it.
> > 
> > I'll go check that all relevant toolchains support this, and poke GCC
> > folk to see if they're happy to promote that to a public constraint.
> 
> GCC folk seem happy to make this public, which is great! I'll cross-link
> a thread here if/when patches appear.

Alex Coplan sent a patch for GCC to make this public:

  https://gcc.gnu.org/pipermail/gcc-patches/2026-May/718560.html

In v2 of the series I stuck with the register variable since the older
end of our supported compilers don't support "Ucj", but we should be
able to move to that in future as we drop support for those older
compilers.

Mark.

