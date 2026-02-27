Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3713BFD7F87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 10:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jnNYf/NUprtOkvP6FQ7GazrZ/NHgbcfxwP/hg50mer4=; b=Ox+smrGPJWmKQC6lqz4mGYpTu3
	g8RuCaMpzOrodsuKjI3EkUZ1k0Qu2kG7ZDCqbIq5CT5ocb2aQ7lOk7yP1ZziRoGb6LfOKRjE8GJGr
	CaAXnnURb2TJ6BTw7XcBZ4VJ++x07quOzguQR5rHbba8QCCOkjMWVgR7lxwwMXmP8JESUtzbm+X/f
	BcYxg8VxUgcuhkTSSTTiBjuWH3y1Q0QFUXLoVwwawOQcaBZOtrlrRp+Raa59+4rUuTsfwRklZqmHx
	hFyE0x+jCf8CtxqZC9ExmNDyI6Pp6BpE8+Dzba55fftV73674WTMll3z2BymZUPpRvt9gA7AEVdIk
	9KORd3ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuuZ-00000008DUZ-1fzP;
	Fri, 27 Feb 2026 10:17:31 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuuX-00000008DUB-1gjG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 10:17:30 +0000
Date: Fri, 27 Feb 2026 11:17:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772187447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jnNYf/NUprtOkvP6FQ7GazrZ/NHgbcfxwP/hg50mer4=;
	b=uvUScOGeEtjwcP5o+9FlkcoM/tsQ2p+iS4golr6rEQzvNnBmfRrB15eREn36vin9xWtk4R
	R+scJBIbCwcu8ejzzwna0XvtrSvCJU0S8aMZFE7pPGYvoRQA/K66wp+k9XyoG6GyRWbLsR
	m+LrU3AmcH990iPdr88i4WX/bALPzfMPTotlvi/ViucHGI3Fg2oOsAThppaAKPHfkJyGCd
	KRNj5KvHaT/t5HDzXtvuP7H/4Gjxk7RJ16thKkCrlhyt+V5Coe+QKQ4+XyfXfRJ+5CnPYx
	ANjXNees6mZDGAcgX4GITascJiWwlGJVtUzrfRYlIUwjLMYaRBdBHsN98ofYrA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772187447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jnNYf/NUprtOkvP6FQ7GazrZ/NHgbcfxwP/hg50mer4=;
	b=zMotJU6zK8AJTd+oBLmYBsNqn5Y7oSIh33pnZakNw1vXBlklgnk+o8FNEKHG956G47ENbM
	iokcOGZSBbhwZKDw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH 5/7] MIPS: VDSO: Drop kconfig MIPS_CLOCK_VSYSCALL
Message-ID: <20260227110939-7ba009bc-3223-4d85-8ac8-e388568af399@linutronix.de>
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
 <20260227-vdso-compat_32bit_time-v1-5-3f0286a7bac3@linutronix.de>
 <7fb5b531-2d78-409f-8f65-e12757f9296e@app.fastmail.com>
 <20260227100849-fb0bfec5-4d67-409c-8dc4-dad10c84fe98@linutronix.de>
 <a1533e92-5d95-4c11-959a-a73d90eaf030@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a1533e92-5d95-4c11-959a-a73d90eaf030@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_021729_605825_AF21C185 
X-CRM114-Status: GOOD (  33.73  )
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

On Fri, Feb 27, 2026 at 11:03:30AM +0100, Arnd Bergmann wrote:
> On Fri, Feb 27, 2026, at 10:31, Thomas Weißschuh wrote:
> > On Fri, Feb 27, 2026 at 09:46:23AM +0100, Arnd Bergmann wrote:
> >> On Fri, Feb 27, 2026, at 07:57, Thomas Weißschuh wrote:
> >> 
> >> The #ifdef was originally been added in commit 7d2aa4bb90f5 ("mips:
> >> Fix gettimeofday() in the vdso library") as a bug fix. This may not
> >> have been the correct fix because I don't see how it addressed the
> >> case of a kernel with MIPS_CLOCK_VSYSCALL enabled running on a
> >> CPU without the timer registers, but I think we should try to make
> >> sure that there is no regression from reverting it now.
> >
> > I can't make sense out of this commit. The generic vDSO automatically falls
> > back to the syscall if it can not handle the current clocksource.
> > There is no explanation *why* this should be broken on MIPS.
> > It works correctly on my x86 machines.
> 
> Agreed, the explanation is incomplete at best. Maybe Vincenzo remembers
> more details as he did the original patch.

That would be great.

> Maybe the fallback logic didn't exist at the time of that fix?

It did, and as far as I can see it looks fine.

> > Also vdso_clock_gettime() uses the same codepaths as vdso_gettimeofday()
> > and apparently that is not broken.
> 
> Not sure, maybe nobody noticed the bug yet, or maybe both 
> vdso_gettimeofday() and vdso_clock_gettime() now work correctly
> after another bugfix.

This is my suspicion.

If I mark the R4K and GIC clocksources as not vDSO compatible,
the automatic syscall fallback works correctly in my tests.

> The condition is fairly rare, as almost all MIPS systems have
> a working clocksource, the few exceptions I see in Kconfig are
> 
> - R3000 based DECstation
> - Sibyte
> - Ingenic Xburst
> - Octeon
> 
> There are not many users left on R3000 and Sibyte platforms, but
> Xburst and Octeon were reasonably common in the past, so it should
> have come up at some point.
> 
> >>  config MIPS_DISABLE_VDSO
> >> -	def_bool CPU_MICROMIPS
> >> +	def_bool CPU_MICROMIPS || !(CSRC_R4K || CLKSRC_MIPS_GIC)
> >
> > That is an an independent optimization IMO.
> 
> The idea here was that doing this would save you the trouble
> of figuring out exactly how it was broken in the past and
> whether the #ifdef is still needed.

We would still have the problem that on modern systems the clocksource
can get marked as unstable which will trigger a switchover to another
clocksource. If that one is not vDSO compatible the systemcall fallback
will also be used. So we want to fix this properly in any case. And then
the config change is only an optimization.


Thomas

