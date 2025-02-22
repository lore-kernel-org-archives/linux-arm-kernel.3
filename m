Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA64EC021B5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 08:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DRrg6c2K4XleizbMWxPQXWBwaxmuiY1RcYb2d/6rATA=; b=vRYq9Ou/e7Rtt0lfKoGs5qbmbr
	MPMxvztWXyAE5IOTL0U8jqyHKMISl8xFxzTvhIRkCzwEseiYN8xVSoLpfzgjsq9S3R4f9qaAVT2x+
	ZKng0GVBrc/q0oiF8uHkMkSE9tEnuXWkdE7nQ5RssiThQsM06skGVQKX/ODg7iuyo7fCuC0Q4VLuW
	stlzXZ55Vb1RKAx1IX/TTB/9HPVWoRxXWOFWuFqs33Xowc5ZnJnr7YNrrM+w1XkEGN7Ow+KxsdIta
	l/UN6eGYUHmaLm3GUkCVU+XZQfDbeVizgiE/jtaLD4W2pCVH/XBd4a5jrD/ZczrgRxdJ7er7fRohT
	V0Ri62nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlkj5-00000007d0W-0aWS;
	Sat, 22 Feb 2025 08:19:07 +0000
Received: from xry111.site ([89.208.246.23])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlkhZ-00000007ctc-1Gpt;
	Sat, 22 Feb 2025 08:17:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1740212245;
	bh=DRrg6c2K4XleizbMWxPQXWBwaxmuiY1RcYb2d/6rATA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=mxCULzsFy+M3Qz7kr+B8TCoUHkY61qs2EE21/SAsu8dCHPwCpct2pFOvu969Ocl3s
	 3+0fwJi5iyByd1gTd2oOzNAEQ95uFEOfVlBckNfGH7F/RK4jwrEEYd2KAgG0N9p3fA
	 JVJPoQThpV2zdJoTWKqL1tfqPnfiS+++Jpwg52AY=
Received: from [127.0.0.1] (unknown [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 391F8676C9;
	Sat, 22 Feb 2025 03:17:18 -0500 (EST)
Message-ID: <1adbf1603237b654a2948ae13692c6b6db0ab7eb.camel@xry111.site>
Subject: Re: [PATCH v3 09/18] riscv: vdso: Switch to generic storage
 implementation
From: Xi Ruoyao <xry111@xry111.site>
To: Thomas =?ISO-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge
 Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>,  Thomas Gleixner
 <tglx@linutronix.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Anna-Maria Behnsen	 <anna-maria@linutronix.de>, Frederic Weisbecker
 <frederic@kernel.org>,  Andrew Morton <akpm@linux-foundation.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon	 <will@kernel.org>, Theodore
 Ts'o <tytso@mit.edu>, "Jason A. Donenfeld"	 <Jason@zx2c4.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt	 <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen	 <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Russell King	 <linux@armlinux.org.uk>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik	 <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas
 Bogendoerfer	 <tsbogend@alpha.franken.de>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Naveen N Rao	 <naveen@kernel.org>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Ingo Molnar	 <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen	 <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,  Arnd Bergmann	
 <arnd@arndb.de>, Guo Ren <guoren@kernel.org>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>, 
	linux-csky@vger.kernel.org
Date: Sat, 22 Feb 2025 16:17:16 +0800
In-Reply-To: <20250204-vdso-store-rng-v3-9-13a4669dfc8c@linutronix.de>
References: <20250204-vdso-store-rng-v3-0-13a4669dfc8c@linutronix.de>
	 <20250204-vdso-store-rng-v3-9-13a4669dfc8c@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_001733_368127_A9A4CFB9 
X-CRM114-Status: GOOD (  28.76  )
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

On Tue, 2025-02-04 at 13:05 +0100, Thomas Wei=C3=9Fschuh wrote:
> The generic storage implementation provides the same features as the
> custom one. However it can be shared between architectures, making
> maintenance easier.
>=20
> Co-developed-by: Nam Cao <namcao@linutronix.de>
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>

I made a RISC-V vDSO getrandom implementation on top of this and it
works fine.  I'll submit it when this is merged.

Tested-by: Xi Ruoyao <xry111@xry111.site>

> ---
> =C2=A0arch/riscv/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 3 +-
> =C2=A0arch/riscv/include/asm/vdso.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0.../include/asm/vdso/{time_data.h =3D> arch_data.h}=C2=A0 |=C2=A0 8=
 +-
> =C2=A0arch/riscv/include/asm/vdso/gettimeofday.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 14 +---
> =C2=A0arch/riscv/include/asm/vdso/vsyscall.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 9 ---
> =C2=A0arch/riscv/kernel/sys_hwprobe.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 3 +-
> =C2=A0arch/riscv/kernel/vdso.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 90 +------------
> ---------
> =C2=A0arch/riscv/kernel/vdso/hwprobe.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 6 +-
> =C2=A0arch/riscv/kernel/vdso/vdso.lds.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 7 +-
> =C2=A09 files changed, 18 insertions(+), 124 deletions(-)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index
> 7612c52e9b1e35607f1dd4603a596416d3357a71..aa8ea53186c04ad68582255f74b0
> 9a0605fe8368 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -53,7 +53,7 @@ config RISCV
> =C2=A0	select ARCH_HAS_SYSCALL_WRAPPER
> =C2=A0	select ARCH_HAS_TICK_BROADCAST if
> GENERIC_CLOCKEVENTS_BROADCAST
> =C2=A0	select ARCH_HAS_UBSAN
> -	select ARCH_HAS_VDSO_TIME_DATA
> +	select ARCH_HAS_VDSO_ARCH_DATA if GENERIC_VDSO_DATA_STORE
> =C2=A0	select ARCH_KEEP_MEMBLOCK if ACPI
> =C2=A0	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE	if 64BIT &&
> MMU
> =C2=A0	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
> @@ -116,6 +116,7 @@ config RISCV
> =C2=A0	select GENERIC_SCHED_CLOCK
> =C2=A0	select GENERIC_SMP_IDLE_THREAD
> =C2=A0	select GENERIC_TIME_VSYSCALL if MMU && 64BIT
> +	select GENERIC_VDSO_DATA_STORE if MMU
> =C2=A0	select GENERIC_VDSO_TIME_NS if HAVE_GENERIC_VDSO
> =C2=A0	select HARDIRQS_SW_RESEND
> =C2=A0	select HAS_IOPORT if MMU
> diff --git a/arch/riscv/include/asm/vdso.h
> b/arch/riscv/include/asm/vdso.h
> index
> f891478829a52c41e06240f67611694cc28197d9..c130d8100232cbe50e52e35eb418
> e354bd114cb7 100644
> --- a/arch/riscv/include/asm/vdso.h
> +++ b/arch/riscv/include/asm/vdso.h
> @@ -14,7 +14,7 @@
> =C2=A0 */
> =C2=A0#ifdef CONFIG_MMU
> =C2=A0
> -#define __VVAR_PAGES=C2=A0=C2=A0=C2=A0 2
> +#define __VDSO_PAGES=C2=A0=C2=A0=C2=A0 4
> =C2=A0
> =C2=A0#ifndef __ASSEMBLY__
> =C2=A0#include <generated/vdso-offsets.h>
> diff --git a/arch/riscv/include/asm/vdso/time_data.h
> b/arch/riscv/include/asm/vdso/arch_data.h
> similarity index 71%
> rename from arch/riscv/include/asm/vdso/time_data.h
> rename to arch/riscv/include/asm/vdso/arch_data.h
> index
> dfa65228999bed41dfd6c5e36cb678e1e055eec8..da57a3786f7a53c866fc00948826
> b4a2d839940f 100644
> --- a/arch/riscv/include/asm/vdso/time_data.h
> +++ b/arch/riscv/include/asm/vdso/arch_data.h
> @@ -1,12 +1,12 @@
> =C2=A0/* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef __RISCV_ASM_VDSO_TIME_DATA_H
> -#define __RISCV_ASM_VDSO_TIME_DATA_H
> +#ifndef __RISCV_ASM_VDSO_ARCH_DATA_H
> +#define __RISCV_ASM_VDSO_ARCH_DATA_H
> =C2=A0
> =C2=A0#include <linux/types.h>
> =C2=A0#include <vdso/datapage.h>
> =C2=A0#include <asm/hwprobe.h>
> =C2=A0
> -struct arch_vdso_time_data {
> +struct vdso_arch_data {
> =C2=A0	/* Stash static answers to the hwprobe queries when all CPUs
> are selected. */
> =C2=A0	__u64 all_cpu_hwprobe_values[RISCV_HWPROBE_MAX_KEY + 1];
> =C2=A0
> @@ -14,4 +14,4 @@ struct arch_vdso_time_data {
> =C2=A0	__u8 homogeneous_cpus;
> =C2=A0};
> =C2=A0
> -#endif /* __RISCV_ASM_VDSO_TIME_DATA_H */
> +#endif /* __RISCV_ASM_VDSO_ARCH_DATA_H */
> diff --git a/arch/riscv/include/asm/vdso/gettimeofday.h
> b/arch/riscv/include/asm/vdso/gettimeofday.h
> index
> ba3283cf7accaa93a38512d2c17eda0eefde0612..29164f84f93cec6e28251e6a0adf
> bc341ac88241 100644
> --- a/arch/riscv/include/asm/vdso/gettimeofday.h
> +++ b/arch/riscv/include/asm/vdso/gettimeofday.h
> @@ -69,7 +69,7 @@ int clock_getres_fallback(clockid_t _clkid, struct
> __kernel_timespec *_ts)
> =C2=A0#endif /* CONFIG_GENERIC_TIME_VSYSCALL */
> =C2=A0
> =C2=A0static __always_inline u64 __arch_get_hw_counter(s32 clock_mode,
> -						 const struct
> vdso_data *vd)
> +						 const struct
> vdso_time_data *vd)
> =C2=A0{
> =C2=A0	/*
> =C2=A0	 * The purpose of csr_read(CSR_TIME) is to trap the system
> into
> @@ -79,18 +79,6 @@ static __always_inline u64
> __arch_get_hw_counter(s32 clock_mode,
> =C2=A0	return csr_read(CSR_TIME);
> =C2=A0}
> =C2=A0
> -static __always_inline const struct vdso_data
> *__arch_get_vdso_data(void)
> -{
> -	return _vdso_data;
> -}
> -
> -#ifdef CONFIG_TIME_NS
> -static __always_inline
> -const struct vdso_data *__arch_get_timens_vdso_data(const struct
> vdso_data *vd)
> -{
> -	return _timens_data;
> -}
> -#endif
> =C2=A0#endif /* !__ASSEMBLY__ */
> =C2=A0
> =C2=A0#endif /* __ASM_VDSO_GETTIMEOFDAY_H */
> diff --git a/arch/riscv/include/asm/vdso/vsyscall.h
> b/arch/riscv/include/asm/vdso/vsyscall.h
> index
> e8a9c4b53c0c9f4744196eed800b21f3918d1040..1140b54b4bc8278d7a322036cd9f
> 84f71258f246 100644
> --- a/arch/riscv/include/asm/vdso/vsyscall.h
> +++ b/arch/riscv/include/asm/vdso/vsyscall.h
> @@ -6,15 +6,6 @@
> =C2=A0
> =C2=A0#include <vdso/datapage.h>
> =C2=A0
> -extern struct vdso_data *vdso_data;
> -
> -static __always_inline struct vdso_data
> *__riscv_get_k_vdso_data(void)
> -{
> -	return vdso_data;
> -}
> -
> -#define __arch_get_k_vdso_data __riscv_get_k_vdso_data
> -
> =C2=A0/* The asm-generic header needs to be included after the definition=
s
> above */
> =C2=A0#include <asm-generic/vdso/vsyscall.h>
> =C2=A0
> diff --git a/arch/riscv/kernel/sys_hwprobe.c
> b/arch/riscv/kernel/sys_hwprobe.c
> index
> bcd3b816306c22df62f60ad044f4ae58f7dad4d1..04a4e549551284bb3340673eb76a
> 2e7bd457025e 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -450,8 +450,7 @@ static int do_riscv_hwprobe(struct riscv_hwprobe
> __user *pairs,
> =C2=A0
> =C2=A0static int __init init_hwprobe_vdso_data(void)
> =C2=A0{
> -	struct vdso_data *vd =3D __arch_get_k_vdso_data();
> -	struct arch_vdso_time_data *avd =3D &vd->arch_data;
> +	struct vdso_arch_data *avd =3D vdso_k_arch_data;
> =C2=A0	u64 id_bitsmash =3D 0;
> =C2=A0	struct riscv_hwprobe pair;
> =C2=A0	int key;
> diff --git a/arch/riscv/kernel/vdso.c b/arch/riscv/kernel/vdso.c
> index
> 3ca3ae4277e187e790a8bf513a9e80d8b6290bb2..cc2895d1fbc2fe752b3edc94f4e2
> 8a6a8fca7a3b 100644
> --- a/arch/riscv/kernel/vdso.c
> +++ b/arch/riscv/kernel/vdso.c
> @@ -13,20 +13,11 @@
> =C2=A0#include <linux/err.h>
> =C2=A0#include <asm/page.h>
> =C2=A0#include <asm/vdso.h>
> -#include <linux/time_namespace.h>
> +#include <linux/vdso_datastore.h>
> =C2=A0#include <vdso/datapage.h>
> =C2=A0#include <vdso/vsyscall.h>
> =C2=A0
> -enum vvar_pages {
> -	VVAR_DATA_PAGE_OFFSET,
> -	VVAR_TIMENS_PAGE_OFFSET,
> -	VVAR_NR_PAGES,
> -};
> -
> -#define VVAR_SIZE=C2=A0 (VVAR_NR_PAGES << PAGE_SHIFT)
> -
> -static union vdso_data_store vdso_data_store __page_aligned_data;
> -struct vdso_data *vdso_data =3D vdso_data_store.data;
> +#define VVAR_SIZE=C2=A0 (VDSO_NR_PAGES << PAGE_SHIFT)
> =C2=A0
> =C2=A0struct __vdso_info {
> =C2=A0	const char *name;
> @@ -79,78 +70,6 @@ static void __init __vdso_init(struct __vdso_info
> *vdso_info)
> =C2=A0	vdso_info->cm->pages =3D vdso_pagelist;
> =C2=A0}
> =C2=A0
> -#ifdef CONFIG_TIME_NS
> -struct vdso_data *arch_get_vdso_data(void *vvar_page)
> -{
> -	return (struct vdso_data *)(vvar_page);
> -}
> -
> -static const struct vm_special_mapping rv_vvar_map;
> -
> -/*
> - * The vvar mapping contains data for a specific time namespace, so
> when a task
> - * changes namespace we must unmap its vvar data for the old
> namespace.
> - * Subsequent faults will map in data for the new namespace.
> - *
> - * For more details see timens_setup_vdso_data().
> - */
> -int vdso_join_timens(struct task_struct *task, struct time_namespace
> *ns)
> -{
> -	struct mm_struct *mm =3D task->mm;
> -	struct vm_area_struct *vma;
> -	VMA_ITERATOR(vmi, mm, 0);
> -
> -	mmap_read_lock(mm);
> -
> -	for_each_vma(vmi, vma) {
> -		if (vma_is_special_mapping(vma, &rv_vvar_map))
> -			zap_vma_pages(vma);
> -	}
> -
> -	mmap_read_unlock(mm);
> -	return 0;
> -}
> -#endif
> -
> -static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 struct vm_area_struct *vma, struct
> vm_fault *vmf)
> -{
> -	struct page *timens_page =3D find_timens_vvar_page(vma);
> -	unsigned long pfn;
> -
> -	switch (vmf->pgoff) {
> -	case VVAR_DATA_PAGE_OFFSET:
> -		if (timens_page)
> -			pfn =3D page_to_pfn(timens_page);
> -		else
> -			pfn =3D sym_to_pfn(vdso_data);
> -		break;
> -#ifdef CONFIG_TIME_NS
> -	case VVAR_TIMENS_PAGE_OFFSET:
> -		/*
> -		 * If a task belongs to a time namespace then a
> namespace
> -		 * specific VVAR is mapped with the
> VVAR_DATA_PAGE_OFFSET and
> -		 * the real VVAR page is mapped with the
> VVAR_TIMENS_PAGE_OFFSET
> -		 * offset.
> -		 * See also the comment near
> timens_setup_vdso_data().
> -		 */
> -		if (!timens_page)
> -			return VM_FAULT_SIGBUS;
> -		pfn =3D sym_to_pfn(vdso_data);
> -		break;
> -#endif /* CONFIG_TIME_NS */
> -	default:
> -		return VM_FAULT_SIGBUS;
> -	}
> -
> -	return vmf_insert_pfn(vma, vmf->address, pfn);
> -}
> -
> -static const struct vm_special_mapping rv_vvar_map =3D {
> -	.name=C2=A0=C2=A0 =3D "[vvar]",
> -	.fault =3D vvar_fault,
> -};
> -
> =C2=A0static struct vm_special_mapping rv_vdso_map __ro_after_init =3D {
> =C2=A0	.name=C2=A0=C2=A0 =3D "[vdso]",
> =C2=A0	.mremap =3D vdso_mremap,
> @@ -196,7 +115,7 @@ static int __setup_additional_pages(struct
> mm_struct *mm,
> =C2=A0	unsigned long vdso_base, vdso_text_len, vdso_mapping_len;
> =C2=A0	void *ret;
> =C2=A0
> -	BUILD_BUG_ON(VVAR_NR_PAGES !=3D __VVAR_PAGES);
> +	BUILD_BUG_ON(VDSO_NR_PAGES !=3D __VDSO_PAGES);
> =C2=A0
> =C2=A0	vdso_text_len =3D vdso_info->vdso_pages << PAGE_SHIFT;
> =C2=A0	/* Be sure to map the data page */
> @@ -208,8 +127,7 @@ static int __setup_additional_pages(struct
> mm_struct *mm,
> =C2=A0		goto up_fail;
> =C2=A0	}
> =C2=A0
> -	ret =3D _install_special_mapping(mm, vdso_base, VVAR_SIZE,
> -		(VM_READ | VM_MAYREAD | VM_PFNMAP), &rv_vvar_map);
> +	ret =3D vdso_install_vvar_mapping(mm, vdso_base);
> =C2=A0	if (IS_ERR(ret))
> =C2=A0		goto up_fail;
> =C2=A0
> diff --git a/arch/riscv/kernel/vdso/hwprobe.c
> b/arch/riscv/kernel/vdso/hwprobe.c
> index
> a158c029344f60c022e7565757ff44df7e3d89e5..2ddeba6c68dda09b0249117fd06a
> 5d249f3b0abd 100644
> --- a/arch/riscv/kernel/vdso/hwprobe.c
> +++ b/arch/riscv/kernel/vdso/hwprobe.c
> @@ -16,8 +16,7 @@ static int riscv_vdso_get_values(struct
> riscv_hwprobe *pairs, size_t pair_count,
> =C2=A0				 size_t cpusetsize, unsigned long
> *cpus,
> =C2=A0				 unsigned int flags)
> =C2=A0{
> -	const struct vdso_data *vd =3D __arch_get_vdso_data();
> -	const struct arch_vdso_time_data *avd =3D &vd->arch_data;
> +	const struct vdso_arch_data *avd =3D &vdso_u_arch_data;
> =C2=A0	bool all_cpus =3D !cpusetsize && !cpus;
> =C2=A0	struct riscv_hwprobe *p =3D pairs;
> =C2=A0	struct riscv_hwprobe *end =3D pairs + pair_count;
> @@ -51,8 +50,7 @@ static int riscv_vdso_get_cpus(struct riscv_hwprobe
> *pairs, size_t pair_count,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_t cpusetsize, unsigned=
 long
> *cpus,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int flags)
> =C2=A0{
> -	const struct vdso_data *vd =3D __arch_get_vdso_data();
> -	const struct arch_vdso_time_data *avd =3D &vd->arch_data;
> +	const struct vdso_arch_data *avd =3D &vdso_u_arch_data;
> =C2=A0	struct riscv_hwprobe *p =3D pairs;
> =C2=A0	struct riscv_hwprobe *end =3D pairs + pair_count;
> =C2=A0	unsigned char *c =3D (unsigned char *)cpus;
> diff --git a/arch/riscv/kernel/vdso/vdso.lds.S
> b/arch/riscv/kernel/vdso/vdso.lds.S
> index
> cbe2a179331d2511a8b4a26c06383e46131661b1..8e86965a8aae4d7c5a36d0f26026
> cd1c8680b339 100644
> --- a/arch/riscv/kernel/vdso/vdso.lds.S
> +++ b/arch/riscv/kernel/vdso/vdso.lds.S
> @@ -4,15 +4,14 @@
> =C2=A0 */
> =C2=A0#include <asm/page.h>
> =C2=A0#include <asm/vdso.h>
> +#include <vdso/datapage.h>
> =C2=A0
> =C2=A0OUTPUT_ARCH(riscv)
> =C2=A0
> =C2=A0SECTIONS
> =C2=A0{
> -	PROVIDE(_vdso_data =3D . - __VVAR_PAGES * PAGE_SIZE);
> -#ifdef CONFIG_TIME_NS
> -	PROVIDE(_timens_data =3D _vdso_data + PAGE_SIZE);
> -#endif
> +	VDSO_VVAR_SYMS
> +
> =C2=A0	. =3D SIZEOF_HEADERS;
> =C2=A0
> =C2=A0	.hash		: { *(.hash) }			:text
>=20

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University

