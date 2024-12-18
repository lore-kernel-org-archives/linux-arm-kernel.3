Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0053BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 15:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2PCfBV+N+0D5I2Uv7/hn0t8iMmZx5bcl62I6AxJsW8A=; b=M4LNyZfdIcm5pmWo6vjEqZTL+D
	7V+G4qdobWF1qSfcBJE32feyHgas5+Rl2JFZBBYfbh9r43utZjw2Vhw9DEoIXqNVXDHe9QM1nFfNF
	h46r4qsAdj86hwuzqkNzAoVKnNq2SXpOkoEvpYxQZehMjI2XgG0TkbCInqnA+TQHHq6CYoOpQtg9C
	SfVTFNUQQgoHa1AT1uZTA4hwGbekfa6WZoKGOj459gvA5JVa0lmdvcfty01EUGnNavEFSwJ7k0vNQ
	xdoFdfgGH74bvQVDWcwwcB4jriAK5JiY/fvZDo1vJPFT2oq8Ydz7yca3E1rAPqs9a6FJPykJG4Cga
	zGoC9Kvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNwJ4-0000000H57H-1Xib;
	Wed, 18 Dec 2024 15:49:50 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNwFg-0000000H4Ng-1z8c;
	Wed, 18 Dec 2024 15:46:22 +0000
Date: Wed, 18 Dec 2024 16:46:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1734536777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2PCfBV+N+0D5I2Uv7/hn0t8iMmZx5bcl62I6AxJsW8A=;
	b=pJxxVRCMHJdngSkzFgGSzBMnBJkDpDuzYyVQMMKK8s3jy4v88LTqHGSsTUFgwaCSaDtpLZ
	9Hz+NSXpB8buHGBeis4umt1p6y1gfXS+W/AM4nWblrH5gJgmsDTKEmgPHIxrL1TURvlt99
	aT2WVnX2bYOlW3X+S+Mecm0lX7V/SRbRpNstAWH6PZljh+0jmjttXmJWtOpxsaQWnDaeRw
	l9mFBpQQhDK9hywRLcUiS2JorNnttHGskIcqaBxCKPMKpA3hMQ9YEKUiIRZnZzY8m8Wfok
	kefZk2jPlkA3QweN8xWEXObFI0S9FXUHUoYjCf486xhj3+SxKW3ibx1LPjcCaA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1734536777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2PCfBV+N+0D5I2Uv7/hn0t8iMmZx5bcl62I6AxJsW8A=;
	b=wbyFSBHCt2AOMp8iwQLVuUtFnc5a3Q7N/OLe/EpksL5g0UriFWxndXCsQj4joqste9Sv6B
	7KCkZHwqquxkbHBQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Conor Dooley <conor@kernel.org>
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Helge Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Russell King <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-s390@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>
Subject: Re: [PATCH 07/17] riscv: vdso: Switch to generic storage
 implementation
Message-ID: <20241218162031-ee920684-db10-4f17-b1cb-50373d7ea954@linutronix.de>
References: <20241216-vdso-store-rng-v1-0-f7aed1bdb3b2@linutronix.de>
 <20241216-vdso-store-rng-v1-7-f7aed1bdb3b2@linutronix.de>
 <20241218-action-matchbook-571b597b7f55@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241218-action-matchbook-571b597b7f55@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_074620_790589_08FA35D6 
X-CRM114-Status: GOOD (  18.86  )
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

Hi Conor,

On Wed, Dec 18, 2024 at 03:08:28PM +0000, Conor Dooley wrote:
> On Mon, Dec 16, 2024 at 03:10:03PM +0100, Thomas Weiﬂschuh wrote:
> > The generic storage implementation provides the same features as the
> > custom one. However it can be shared between architectures, making
> > maintenance easier.
> > 
> > Co-developed-by: Nam Cao <namcao@linutronix.de>
> > Signed-off-by: Nam Cao <namcao@linutronix.de>
> > Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> > ---
> >  arch/riscv/Kconfig                                 |  3 +-
> >  arch/riscv/include/asm/vdso.h                      |  2 +-
> >  .../include/asm/vdso/{time_data.h => arch_data.h}  |  8 +-
> >  arch/riscv/include/asm/vdso/gettimeofday.h         | 14 +---
> >  arch/riscv/include/asm/vdso/vsyscall.h             |  9 ---
> >  arch/riscv/kernel/sys_hwprobe.c                    |  3 +-
> >  arch/riscv/kernel/vdso.c                           | 90 +---------------------
> >  arch/riscv/kernel/vdso/hwprobe.c                   |  6 +-
> >  arch/riscv/kernel/vdso/vdso.lds.S                  |  7 +-
> >  9 files changed, 18 insertions(+), 124 deletions(-)
> 
> Fails to build:
> Patch 7/17: Test 1/12: .github/scripts/patches/tests/build_rv32_defconfig.sh
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:11:33: warning: declaration of 'struct riscv_hwprobe' will not be visible outside of this function [-Wvisibility]
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:15:41: warning: declaration of 'struct riscv_hwprobe' will not be visible outside of this function [-Wvisibility]
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:19:37: error: call to undeclared function '__arch_get_vdso_u_arch_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:19:31: error: incompatible integer to pointer conversion initializing 'const struct vdso_arch_data *' with an expression of type 'int' [-Wint-conversion]
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:22:36: error: arithmetic on a pointer to an incomplete type 'struct riscv_hwprobe'
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:30:40: error: incomplete definition of type 'const struct vdso_arch_data'
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:31:24: error: incompatible pointer types passing 'struct riscv_hwprobe *' to parameter of type 'struct riscv_hwprobe *' [-Werror,-Wincompatible-pointer-types]
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:35:7: error: call to undeclared function 'riscv_hwprobe_key_is_valid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:35:35: error: incomplete definition of type 'struct riscv_hwprobe'
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:36:5: error: incomplete definition of type 'struct riscv_hwprobe'
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:36:18: error: incomplete definition of type 'const struct vdso_arch_data'
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:36:44: error: incomplete definition of type 'struct riscv_hwprobe'
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:39:5: error: incomplete definition of type 'struct riscv_hwprobe'
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:40:5: error: incomplete definition of type 'struct riscv_hwprobe'
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:43:4: error: arithmetic on a pointer to an incomplete type 'struct riscv_hwprobe'
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:49:39: warning: declaration of 'struct riscv_hwprobe' will not be visible outside of this function [-Wvisibility]
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:53:37: error: call to undeclared function '__arch_get_vdso_u_arch_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:53:31: error: incompatible integer to pointer conversion initializing 'const struct vdso_arch_data *' with an expression of type 'int' [-Wint-conversion]
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:55:36: error: arithmetic on a pointer to an incomplete type 'struct riscv_hwprobe'
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:71:61: error: incomplete definition of type 'const struct vdso_arch_data'
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:71:29: error: use of undeclared identifier 'RISCV_HWPROBE_WHICH_CPUS'
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:72:24: error: incompatible pointer types passing 'struct riscv_hwprobe *' to parameter of type 'struct riscv_hwprobe *' [-Werror,-Wincompatible-pointer-types]
>   fatal error: too many errors emitted, stopping now [-ferror-limit=]
> 
> Might be a clang thing, allmodconfig with clang doesn't build either.

The proposed generic storage infrastructure currently expects that all
its users also use HAVE_GENERIC_VDSO.
I missed rv32 when checking this assumption.

I can add a bunch of ifdefs into the storage code to handle this.

Or we re-add the time vDSO functions which were removed in commit
d4c08b9776b3 ("riscv: Use latest system call ABI").
Today there are upstream ports of musl and glibc which can use them.
(currently musl even tries to use __vdso_clock_gettime() as 64-bit only
on rv32 due to a copy-and-paste error from its rv64 code)

There is precedence in providing 64bit only vDSO functions, for example
__vdso_clock_gettime64() in arm.
I do have a small, so far untested, proof-of-concept patch for it.
This would even be less code than the ifdefs.

What do you think about it?


Thomas

