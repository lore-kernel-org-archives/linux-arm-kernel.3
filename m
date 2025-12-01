Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF29D111A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 10:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7s2CQ04eEct1/mGMiqM3DGDPGmUSvEIytacsW18oQA0=; b=GeZEbjkuSmYdADRsLrnJ1f9epg
	iJkqIsdKmrQW0cF/uO/1fw2ymdgxJxiTgE6k3O9ejJ7xlu366XvwIxNfkWzX95uxbznJQ79D76eLR
	Gjepp89WZQUqlxq02+6CPIHpN8BG6Bc2BPSZ54U0f1b9H4T68PDSRTFZr4EfBaXBKGLOvKzGa9Qrw
	ypwr+uwsdmYTn11dZbHJpIC42G6vV+QlSLU9CX1Sdl9rMmO14YgXuXrO9jq28nYYcQz854okJ0Tdd
	MKvqzAA7hQynZ6RNmS/Cytf2N775nHms4mmTgGymB117u2C+2ZXzNfyQoo02rfN6iyr4lDVITL55b
	g6wcGLqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1An-00000003KqK-2OfU;
	Mon, 01 Dec 2025 10:30:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1Ak-00000003Kpr-1N5A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 10:30:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E08CA1516;
	Mon,  1 Dec 2025 02:30:13 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D0B9E3F73B;
	Mon,  1 Dec 2025 02:30:18 -0800 (PST)
Date: Mon, 1 Dec 2025 10:30:16 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: david laight <david.laight@runbox.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, linux@armlinux.org.uk,
	catalin.marinas@arm.com, will@kernel.org, chris@zankel.net,
	jcmvbkbc@gmail.com, akpm@linux-foundation.org, macro@orcam.me.uk,
	charlie@rivosinc.com, deller@gmx.de, ldv@strace.io,
	rostedt@goodmis.org, tglx@linutronix.de,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: Avoid memcpy() for syscall_get_arguments()
Message-ID: <aS1uOGm7cQf1euIw@J2N7QTR9R3>
References: <20251127123630.4149828-1-ruanjinjie@huawei.com>
 <20251127123630.4149828-3-ruanjinjie@huawei.com>
 <aS1qYhHhZK3CD_bU@J2N7QTR9R3>
 <20251201102633.17a99afc@pumpkin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201102633.17a99afc@pumpkin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_023022_411177_81FBEA73 
X-CRM114-Status: GOOD (  11.49  )
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

On Mon, Dec 01, 2025 at 10:26:33AM +0000, david laight wrote:
> On Mon, 1 Dec 2025 10:13:54 +0000
> Mark Rutland <mark.rutland@arm.com> wrote:
> > On Thu, Nov 27, 2025 at 08:36:30PM +0800, Jinjie Ruan wrote:
> > > Before:
> > > <syscall_get_arguments.constprop.0>:
> > >        aa0103e2        mov     x2, x1
> > >        91002003        add     x3, x0, #0x8
> > >        f9408804        ldr     x4, [x0, #272]
> > >        f8008444        str     x4, [x2], #8
> > >        a9409404        ldp     x4, x5, [x0, #8]
> > >        a9009424        stp     x4, x5, [x1, #8]
> > >        a9418400        ldp     x0, x1, [x0, #24]
> > >        a9010440        stp     x0, x1, [x2, #16]
> > >        f9401060        ldr     x0, [x3, #32]
> > >        f9001040        str     x0, [x2, #32]
> > >        d65f03c0        ret
> > >        d503201f        nop
> > > 
> > > After:
> > >        a9408e82        ldp     x2, x3, [x20, #8]
> > >        2a1603e0        mov     w0, w22
> > >        f9400e84        ldr     x4, [x20, #24]
> > >        f9408a81        ldr     x1, [x20, #272]
> > >        9401c4ba        bl      ffff800080215ca8 <__audit_syscall_entry>  
> > 
> > It's probably worth noting that __audit_syscall_entry() only takes 4
> > syscall arguments, and hence the compiler has elided the copy of
> > regs->regs[4] and regs->regs[5], which it apparently couldn't manage
> > before.
> 
> Hasn't it actually inlined it and completely optimised away the regs[] array?
> It looks (from the asm) as though syscall_get_arguments() is followed by:
> 	fn(regs[0], regs[1], regs[2], regs[3])

Yes; I was assuming that people could infer that.

I was poining out that the elision of copies/loads of regs->regs[4] and
regs->regs[5] in particular was not a bug.

Mark.

