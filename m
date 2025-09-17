Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EED8CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 15:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U/sWpX1d0FqUQZmJaMW2nRnPQMp56EHFIU2k1H50MYU=; b=Sjuw4gT8m9cygTruhMdFHnzNm3
	tsP711OnTXt4mQC4S0ePUmwdbjqv+zCwKzBcLsNdZA4qUo1IlqM/re0odUCz338vaFve9wwHkIiJu
	SlpuxtGdhR0mwXB0bn6Kk3LOzv9nKkveXWxs5NDhp3cH331CVKEEaOqz2vJPM3hZN36gsThZGvUew
	kdCsEP0FdHAxMj2E23Vvc+g9BZJ20R7y6I72Yv14xGT1N0YsjfLIE0V1dI4WfIASxJrAFIUYyUb7p
	ThUrs5tbUrGaPI6tv9/HlfAiu2LglMzgZjSkr5Q9+25/uiZPZcU0nB7TFLFEziP3Fj9wmLjafovPO
	sgxLneJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytyJ-0000000Cf3C-3fYE;
	Wed, 17 Sep 2025 15:21:27 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytyH-0000000Cf16-0BxM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 15:21:26 +0000
Date: Wed, 17 Sep 2025 17:21:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758122483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U/sWpX1d0FqUQZmJaMW2nRnPQMp56EHFIU2k1H50MYU=;
	b=3nhivmngd6+PmA3+eV33THTVRq9jhpe+HBt/O4eCUY3Xh5mSatPaAakAkLSiN/PgvcAopM
	y0Vf/JBYg9oMJuBPbUW8p3kfUkXUykpOTcPsUyVMjVq1GXYPIMNETdFVpFy8Dq/WubWuCF
	s78V7VLCyrlgSlUS4fRKO9Jc+yrd1jlMFKyXuxYp5AiWpIVOuskTy+86RTMbqukB7HkVfE
	7tOkUXZcX2xRhQyZwhU66M/r+VdJA/P0eIRfDbHpsj4zJHjLjz1urRGJEwwhNOxhg3HUFu
	gLLrhHi+vVShPn758ZvkO2UBIFtcaaRzj0ag6ZXNqRNipr1zS9Npoc4oLzCXjA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758122483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U/sWpX1d0FqUQZmJaMW2nRnPQMp56EHFIU2k1H50MYU=;
	b=ob8EioHSqHCIf/3CBZz5Tz2bb9bzFkW7kWflQdESNktBSVsvxeZSnY6E6RONhA6DbGeGkn
	5sDsyosGlBsU7rDA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Nick Alcock <nick.alcock@oracle.com>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Shuah Khan <shuah@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Russell King <linux@armlinux.org.uk>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Shannon Nelson <sln@onemain.com>, linux-kernel@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH v3 07/36] powerpc/vdso: Explicitly include asm/cputable.h
 and asm/feature-fixups.h
Message-ID: <20250917171207-1fad0416-7543-481c-a998-5881fab1714e@linutronix.de>
References: <20250917-vdso-sparc64-generic-2-v3-0-3679b1bc8ee8@linutronix.de>
 <20250917-vdso-sparc64-generic-2-v3-7-3679b1bc8ee8@linutronix.de>
 <41d100c5-4706-400e-a61a-46b068f1bc74@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <41d100c5-4706-400e-a61a-46b068f1bc74@csgroup.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_082125_225332_67604CEE 
X-CRM114-Status: GOOD (  19.61  )
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

On Wed, Sep 17, 2025 at 04:41:49PM +0200, Christophe Leroy wrote:
> 
> 
> Le 17/09/2025 ‡ 16:00, Thomas Weiﬂschuh a Ècrit†:
> > The usage of ASM_FTR_IFCLR(CPU_TR_ARCH_31) requires asm/cputable.h and
> > asm/feature-fixups.h. Currently these headers are included transitively,
> > but that transitive inclusion is about to go away.
> 
> Hum ...
> 
> That was unexpectedly added by commit 9c7bfc2dc21e ("powerpc/64s: Make
> POWER10 and later use pause_short in cpu_relax loops")
> 
> In theory, vdso/ headers shouldn't include any headers outside of vdso/

I am aware. But this is the dependency as it exists today and I don't really
want to make this series larger than it already is. This is by far not the
only such layering violation in the vDSO headers. I have some patches prepared...

> > Explicitly include the headers.
> > 
> > Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> > ---
> >   arch/powerpc/include/asm/vdso/processor.h | 3 +++
> >   1 file changed, 3 insertions(+)
> > 
> > diff --git a/arch/powerpc/include/asm/vdso/processor.h b/arch/powerpc/include/asm/vdso/processor.h
> > index 80d13207c5688d73954822aede2bbe2d0e05c054..42b64903bdf47cc5bd571fc3b5caed45e6358cb9 100644
> > --- a/arch/powerpc/include/asm/vdso/processor.h
> > +++ b/arch/powerpc/include/asm/vdso/processor.h
> > @@ -4,6 +4,9 @@
> >   #ifndef __ASSEMBLY__
> 
> __ASSEMBLY__ is replaced by __ASSEMBLER__ in powerpc-next in commit
> 74db6cc331b0 ("powerpc: Replace __ASSEMBLY__ with __ASSEMBLER__ in non-uapi
> headers")

Ack. I'll have to rebase this series after -rc1 in any case. Right now I am
hoping to collect some Acks.

> > +#include <asm/cputable.h>
> > +#include <asm/feature-fixups.h>
> > +
> >   /* Macros for adjusting thread priority (hardware multi-threading) */
> >   #ifdef CONFIG_PPC64
> >   #define HMT_very_low()		asm volatile("or 31, 31, 31	# very low priority")
> > 
> 

