Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3523E9410B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 09:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8YcZUjg0311ZROYKDXEwwP7sobLx9I06Jhc3I1W6jb0=; b=X7nAbnXyYTbK5diM17EisRHj6v
	cQNyjHQFNIOUuwOMFCPTIoRcXu/jwewy/kyixsC5ueZWoIB1BrMQe52zCZGy87DFetoPeJkmgmi2L
	8NmWaON160c8p1cV/mpHsmJkAoyFLN5CQkBTbApRxrgW0GawdbNXymDxH/TbX5h4gDPSpLSeIfVWN
	+2nUpdl+MxCuloraDR3SWgTNq8xQ8JG20HW8CNONh6q2AFBTSx3BFcnyq1OxXudVJVUw5ktTEbeI8
	Tc5mIRJdbJu3eOeu22XpEUKvzwGKsdTNcU3il87DFk1LHnfxfurby8OzgKTn2/OmiSjnlzrvjNEU/
	a2wcqlDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbbUo-000000081Nl-3wrg;
	Fri, 02 Jan 2026 09:30:59 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbbUj-000000081NI-3K26;
	Fri, 02 Jan 2026 09:30:56 +0000
Date: Fri, 2 Jan 2026 10:30:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1767346250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8YcZUjg0311ZROYKDXEwwP7sobLx9I06Jhc3I1W6jb0=;
	b=avoC+DkYQZwGI05C6gFL2VwUUth9gGo3h2p/6b/8kXLMTZ9y5buFMYwCjSUJLnVovf0Wsg
	V9bdt982VUpWV/nAzfFAjyNuHs+Av3WLRaTitb2t24jqTV6LkVOT8uU+Eqflu87LXr2OHo
	bkzRuRWfp2e11+jhBFwhXgdL0Uv77O+tJPZVuJ5ToHr5/2xNfP9zOHwsTRmnazt0SLGW1a
	OPCBWX1cFdGalZJyvCsQI8WkMG32ECjDY3su8Y8msn066hp4h3o1hxxzINyACzWSlCDA1v
	C4KFqo+uVu9HSPVv8p9jT1wWHJV871NRtg3+Tzljr+dXyRWIFODyr2SpA1swwQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1767346250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8YcZUjg0311ZROYKDXEwwP7sobLx9I06Jhc3I1W6jb0=;
	b=VSC9aYeyN9I/qJAosGOK7GzWpi2d6w4BCnz12QUjMWzwKSqvOnKSx6FCVdQ0Q5UzEXnoM0
	MiX5oXCf0qlMPMCw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Dinh Nguyen <dinguyen@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/5] x86/uapi: Stop leaking kconfig references to
 userspace
Message-ID: <20260102093803-77269163-861e-4ea3-acdc-73be77c190a1@linutronix.de>
References: <20251230-headers_install-config-leak-v1-0-efba5c58073d@linutronix.de>
 <20251230-headers_install-config-leak-v1-4-efba5c58073d@linutronix.de>
 <a745a59f-947c-4847-b31c-5e32125a51a4@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a745a59f-947c-4847-b31c-5e32125a51a4@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_013054_072859_1EECB20D 
X-CRM114-Status: GOOD (  24.30  )
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

On Tue, Dec 30, 2025 at 10:08:04PM +0100, Arnd Bergmann wrote:
> On Tue, Dec 30, 2025, at 08:10, Thomas Weißschuh wrote:
> > 
> >  /* entries in ARCH_DLINFO: */
> > -#if defined(CONFIG_IA32_EMULATION) || !defined(CONFIG_X86_64)
> > +#if defined(__KERNEL__) && (defined(CONFIG_IA32_EMULATION) || 
> > !defined(CONFIG_X86_64))
> >  # define AT_VECTOR_SIZE_ARCH 3
> >  #else /* else it's non-compat x86-64 */
> >  # define AT_VECTOR_SIZE_ARCH 2
> 
> While this patch clearly keeps the current behavior, I think it's
> wrong, and 32-bit userspace should see a '3' instead of '2' here.
>
> It can probably just be '3' unconditionally, or we can
> make it more complex and have a userspace definition based
> on __x86_64__ being defined.

Does userspace even need to see this definition at all?
This value only makes sense in combination with AT_VECTOR_SIZE_BASE
which itself is not part of the UAPI. Debian codesearch did not bring
up a user for it. Not even CRIU, as they use their own definitions.
The value is wrong today on x86 and nobody seems to have noticed.
(Based on both the kconfig variables and the vDSO cmdline switches).
Also UML shares the same UAPI headers but in the kernel has its own
ARCH_DLINFO, so the values is "wrong" there, too.

> I also wonder if there is a problem with the third
> x86-64 entry being zero rather than AT_IGNORE. I see that
> some architectures do it like this, to keep the number constant
> even if some entries are missing:
> 
>         if (likely(signal_minsigstksz))                          \
>                 NEW_AUX_ENT(AT_MINSIGSTKSZ, signal_minsigstksz); \
>         else                                                     \
>                 NEW_AUX_ENT(AT_IGNORE, 0);                       \
> 
>      Arnd

The whole AUX_ENT handling seems brittle and slighly broken. Many changes to
AT_VECTOR_SIZE_BASE are done as fixes, as they were forgotten in the original
changes to the process setup code. The addition of AT_HWCAP3/AT_HWCAP4 is
still not reflected in AT_VECTOR_SIZE_BASE. (AT_HWCAP4 is never used anyways)

Then the same logic is duplicated between binfmt_elf.c and binfmt_elf_fdpic.c,
except that it is slightly different and the latter is missing some fields.
We should deduplicate this code and find a way add a static assertion.

Also space is wasted as more entries than possible are allocated in many cases.
For example AT_BASE_PLATFORM and AT_RSEQ_*. And those are not stubbed out with
AT_IGNORE either.


So I'd like to keep my current patch as is, to reach my current goal of getting
rid of kconfig leaks in the UAPI headers. In parallel we can remove
AT_VECTOR_SIZE_ARCH from the UAPI and fix the auxiliary vector handling in
two different patch series.


Thomas

