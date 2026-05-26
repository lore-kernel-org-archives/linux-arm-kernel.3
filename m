Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D56CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 16:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WX3fSbPHXNnYKt9igo0iKj83uJQjAdYW2RyLj5xjSEs=; b=OvYwPn00IHCe7b4MfyQedOVsVi
	aRbozLUgbzW0kS3yaJMiRDd5IHQB0RPFUyqsVRDGq4gJIWmcGd4513meMG6EUXMxg5TcTZMMbUAc4
	LTGSqqjbUJCgN1tSO2a4EHP6RwiyaLtmfvxx/sjiEpFLtmFZhGkGK+SrePqiGDn7eYC1ogtvXaKhU
	OSDaW8VCiqZUJYASZcF/EfYy2X4wh/TueVLwsvqpj9a4oH2lK8/V3GylKl6Ww9W6rxjhJjbN2mDpR
	RU8fJlpQ0uzvD7oySLF+vzAnpmuTcg0oZfPyZYr3YWMPcyBEGXebIE6S6O+mq1D+VebM5EVNv2GS9
	T32vUzbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRuns-00000002XHU-2XAy;
	Tue, 26 May 2026 16:38:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRunr-00000002XH0-0Isx
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 26 May 2026 16:38:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WX3fSbPHXNnYKt9igo0iKj83uJQjAdYW2RyLj5xjSEs=; b=rNeYBqZTTsFwgvm2+BXKL1YsXR
	AXujZrljIWmrGBzGycgnjiGrNkM9k/MTTqQX1Xy2AhD8gCYdyln3/tPzpekwYeEe7tWyfeJIZLwRO
	3v5xyL5+fELR0Ft5OAFMU6UoeEPLuHSlAzGQ4gtPHWWnLXquHoQLuDJWPWEECf9nd8Dsf5+TWvze+
	hUunAVlMzdiigssZcg6HhHG1idkKzZLdJ/YJtsKv2xF3fODTx2yaFm3NPznEuB7/QcGARhE+NZQrx
	sWEjek+5WR/3DLAHydTaPUkHml8i2VjPZGX81d6Hr0UaNWaUaNTGbcDKiAYE4Xc2tzdb6Yn4oL9yA
	wkJQ9gCA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRunn-0000000BrUf-17Gj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 16:38:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 86BD62936;
	Tue, 26 May 2026 09:38:40 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A8FB83F7B4;
	Tue, 26 May 2026 09:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779813525; bh=hgd1a5KIJvCclvHmLPaarvh/x6qz4vlG4cI8Vl8saEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kVtWIPKzazU6BuSfUf/We1In6vv915fVFqrrQplqcLlQwy/jhbeNSLl7bpTrN+DUZ
	 aM+jCXfuD3MTZwEUQl204iRsb9nNIelbclSXHM94zFqmXMHcgNFmqXcM/Pb2v/jnbF
	 eJUFR/HV98gAxo5OmQlcMgqLCXhC0OVVJUMYDdUA=
Date: Tue, 26 May 2026 17:38:40 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	broonie@kernel.org, catalin.marinas@arm.com, james.morse@arm.com,
	maz@kernel.org, oupton@kernel.org, tabba@google.com,
	will@kernel.org
Subject: Re: [PATCH 17/18] arm64: fpsimd: Move SME save/restore inline
Message-ID: <ahXMkPEpgaZQf_Nk@J2N7QTR9R3>
References: <20260521132556.584676-1-mark.rutland@arm.com>
 <20260521132556.584676-18-mark.rutland@arm.com>
 <ahWpST4K3rbMbjWK@J2N7QTR9R3>
 <08e5ce52-be74-4fc5-a0b2-8f405a5eff99@arm.com>
 <ahW8Eba3SNqfVDdk@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahW8Eba3SNqfVDdk@J2N7QTR9R3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_173847_815857_778871E3 
X-CRM114-Status: GOOD (  25.31  )
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

On Tue, May 26, 2026 at 04:28:17PM +0100, Mark Rutland wrote:
> On Tue, May 26, 2026 at 03:39:56PM +0100, Vladimir Murzin wrote:
> > Hi Mark,
> > 
> > On 5/26/26 15:08, Mark Rutland wrote:
> > > On Thu, May 21, 2026 at 02:25:55PM +0100, Mark Rutland wrote:
> > >> +static inline void __sme_save_za(struct sme_state *state, unsigned long svl)
> > >> +{
> > >> +	/* The <Wv> argument to STR (array vector) can only encode W12-W15 */
> > >> +	register unsigned long v asm ("12");
> > > Sorry, I had meant to put "x12" here, but evidently GCC and LLVM accept
> > > "12" on its own.
> > > 
> > > For clarity (e.g. to match the comment) I'll change that to "w12" and
> > > make the type unsigned int. Likewise in __sme_load_za().
> > 
> > I suspect you are intentionally not using "Ucj" constrain to limit register allocator,
> > if so I'm wondering why?
> 
> Thanks for the suggestion; that was ignorance rather than intent.
> 
> I was not aware of "Ucj" as it doesn't appear on the public GCC
> documentation:
> 
>   https://gcc.gnu.org/onlinedocs/gcc/Machine-Constraints.html
> 
> Looking at the machine description file, that's marked with '@internal',
> so IIUC GCC folk don't seem to expect/want people to use it. That said,
> LLVM seems to support it.
> 
> I'll go check that all relevant toolchains support this, and poke GCC
> folk to see if they're happy to promote that to a public constraint.

GCC folk seem happy to make this public, which is great! I'll cross-link
a thread here if/when patches appear.

In the short term, using "Ucj" would require bumping our minimum
supported toolchain necessary for SME:

* GCC gained "Ucj" in 14.1.0, tagged on 7 May 2024.

* LLVM gained "Ucj" in 18.1.0, tagged on 27 Feb 2024.

... so using that would require adding a dependency on a newer
toolchain, e.g. via a CC_HAS_UCJ_CONSTRAINT to match the existing
CC_HAS_K_CONSTRAINT.

Aligned with the rationale on patch 8, v6.16 (tagged 27 July 2025) was
contemporary with GCC 15.1.0 (tagged 25 April 2025) and LLVM 20.1.0
(tagged 4 March 2025), both of which supported "Ucj".

> If that's all good, I'll move over to "Ucj". If not, I'll update the
> commit message and/or comments to explain why.

If Will and Catalin are happy to depend on a toolchain as above, I'll go
add the necessary CC_HAS_UCJ_CONSTRAINT Kconfig logic.

Otherwise I'll go note the above in a comment, and stick with the
register variable for now.

Mark.

