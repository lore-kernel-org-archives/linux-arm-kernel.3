Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC70FD531F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 09:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XOdZaB3lOid4SOqrP5NMga5DLjNzennvRPzmBIDu08I=; b=Q9pF3g8n/NIqi66u7DDAqKWPdQ
	T/ucqCE2yvw5jrc7+BjHyEK7fA+gy6qmrxdfgdunvG2BnS6IZ4OZtC138oudlx0I/J9mZy8AyxkgY
	JbhCVLLAMA9NoRr7n7CR4WUZn6P50xY6vTgNEogFvX3zlHd0GR9njcpqZK/Lhd1eVOz5M6uriW02W
	VBs4EQPpUM7L4b87l1tEc1U+Hd/Qq/XBjot5xk4zGaQlB9XFWUzXqftis9nXoF1vbShCGDkJOH3pb
	ruF2lsJBZ1iKUVGA0jhzd0InHdnayn2xM+vWVm0TRT9YUtUwd4HS0DAdg2Qesq+3e/C028mmWTjZn
	uevkWBSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuCb-000000087yz-0u5s;
	Fri, 27 Feb 2026 09:32:05 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuCY-000000087xx-2L4I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 09:32:03 +0000
Date: Fri, 27 Feb 2026 10:31:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772184718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XOdZaB3lOid4SOqrP5NMga5DLjNzennvRPzmBIDu08I=;
	b=30xG3cOQq3Co+onLqk07Fl1SRub/xIIrWg5BlfgkzAWZ0VeIKC54fH8uO8eZEd+hg1DEWm
	3lFzR/rzBx84ZT1ZKzZrWltXdpoXCZ0ibq9i/Dsptb/aoovS1STcf39oBFQSEeuj/xseGE
	6K9RLDzVR2T8QKb0M8tvGIhDcPj4s3MmKysFRs7YVGQwx3ek5/b+BoabeLlNjEv9oYIZMb
	YGETHpEAry3zfcuN5E2Npk67Vw6JW2IG2s1TzFPZSDONjRyV4lLzE+jXmUHCikBXLonAGz
	fd3ywzi5SA0cqDHTHwGAWijGynVhIumuIoXjFDntV7gAIwKpTXIs6V1kTXWbUg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772184718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XOdZaB3lOid4SOqrP5NMga5DLjNzennvRPzmBIDu08I=;
	b=8swSz8Rslvq4Ux1k+Q/Nlj4jfo/n+8Kwiv+xQ3xlP0PoCvw9xbWvPet52abVwHEuj2VTTA
	7tuFl+I2R98cffCg==
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
Message-ID: <20260227100849-fb0bfec5-4d67-409c-8dc4-dad10c84fe98@linutronix.de>
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
 <20260227-vdso-compat_32bit_time-v1-5-3f0286a7bac3@linutronix.de>
 <7fb5b531-2d78-409f-8f65-e12757f9296e@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7fb5b531-2d78-409f-8f65-e12757f9296e@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_013202_779258_0EBB8F45 
X-CRM114-Status: GOOD (  26.41  )
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

On Fri, Feb 27, 2026 at 09:46:23AM +0100, Arnd Bergmann wrote:
> On Fri, Feb 27, 2026, at 07:57, Thomas Weiﬂschuh wrote:
> > This configuration option exists so "that we don't provide the symbol
> > when there's no possibility of there being a usable clocksource".
> > However it only covers __vdso_gettimeofday() and none of the other vDSO
> > functions which should be affected by the same circumstances.
> > As these are more widely used than gettimeofday() and nobody seems to
> > have had an issue with them so far, drop MIPS_CLOCK_VSYSCALL completely.
> >
> > The removal of the ifdeffery will also make some upcomming changes
> > easier to read.
> >
> > Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> 
> The #ifdef was originally been added in commit 7d2aa4bb90f5 ("mips:
> Fix gettimeofday() in the vdso library") as a bug fix. This may not
> have been the correct fix because I don't see how it addressed the
> case of a kernel with MIPS_CLOCK_VSYSCALL enabled running on a
> CPU without the timer registers, but I think we should try to make
> sure that there is no regression from reverting it now.

I can't make sense out of this commit. The generic vDSO automatically falls
back to the syscall if it can not handle the current clocksource.
There is no explanation *why* this should be broken on MIPS.
It works correctly on my x86 machines.
I will try to reproduce this in QEMU by removing the vDSO capability from
the respective clocksources.

Also vdso_clock_gettime() uses the same codepaths as vdso_gettimeofday()
and apparently that is not broken.

> > -config MIPS_CLOCK_VSYSCALL
> > -	def_bool CSRC_R4K || CLKSRC_MIPS_GIC
> > -
> 
> An easy alternative might be to drop the entire VDSO in
> configurations that turn off the gettimeofday vsyscall today:
> 
> diff --git a/arch/mips/vdso/Kconfig b/arch/mips/vdso/Kconfig
> index 70140248da72..4f6fba9e108f 100644
> --- a/arch/mips/vdso/Kconfig
> +++ b/arch/mips/vdso/Kconfig
> @@ -3,4 +3,4 @@
>  # the lack of relocations. As such, we disable the VDSO for microMIPS builds.
>  
>  config MIPS_DISABLE_VDSO
> -	def_bool CPU_MICROMIPS
> +	def_bool CPU_MICROMIPS || !(CSRC_R4K || CLKSRC_MIPS_GIC)

That is an an independent optimization IMO.


Thomas

