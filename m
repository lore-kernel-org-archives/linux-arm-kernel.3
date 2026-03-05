Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F02F33A8B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 15:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3lgPzYY+h2rxgMib06rpA2OEDOgbBdmE+X7ijJayJaU=; b=lQGsKeZYxBSlwjCNwe79z0p9QG
	LS5ERLZTuWzqjVIx0sWxe3DamVw7JgJJx+ULZT+f9RP2dvV7Jf6LxaWIHllbZJ+544nl1Ou0QvY/U
	czJYf3ARHmz1KYw8G6GInlHhDMjiHU1KntFG7FqRT6AOW+/Xjzp+su4kHQ9nNWz7JDRTw3i6BPGP/
	OLi1ViFprBpZ1LHO0K/S9xc0kOYVd6Y32Yho5JJwdfTIgVSOEcN7GFR4zr0lyumsy3W8LiLxaOut1
	xGzfEffyNw3FgpLH85xVeFCYgfK7Jw7hvREaN9QzWD0j4G3Vb0pVy5a/JodOjeLn2W8XQbZsFwDG5
	iLAimpCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyASk-000000026Nq-0cjI;
	Thu, 05 Mar 2026 15:18:06 +0000
Received: from arcturus.nroach44.id.au ([45.32.188.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyASg-000000026MK-3R29
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 15:18:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nroach44.id.au;
	s=dYX2HNEqNNRL; t=1772723869;
	bh=YYARtrHKCTb0FOK3T5y+Ihj4HwkDUufhHFrwTteinjk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bvb72usqbeorYI+W3WJxKjNS6uV8hxy7oYYxCRqPo1ZOaBD4DBhBdCWoh3TR6Gnv9
	 0XrIJo/MTt52iq5msgOako4JPQryUdDV2ogSRYfeU7bY3ARZl2pwzb4lRzV/xj4qAB
	 MRMU74/B3AUgzFZmPG/VkxTVAAVRNcv3LDq29kPacXlh88DDcOsPtGtvFBi9Y2Yitp
	 C3eGW2h3uE2YLxhEC59Hf3C+xeRzbhVasj03zhW7aMh1ffxHhMg8Fp30653MQK9s9A
	 /+nzaOHLojxN5JsnaI8iJQCVUG4rR/r1Mk4M+Q/n4XqYudS9CbxPMzs/9+tYGVVGMz
	 vuhn/3QtN/2ag==
Received: from arcturus.nroach44.id.au (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by arcturus.nroach44.id.au (Postfix) with ESMTPS id 3BD9531150
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Mar 2026 23:17:49 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nroach44.id.au;
	s=dYX2HNEqNNRL; t=1772723869;
	bh=YYARtrHKCTb0FOK3T5y+Ihj4HwkDUufhHFrwTteinjk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bvb72usqbeorYI+W3WJxKjNS6uV8hxy7oYYxCRqPo1ZOaBD4DBhBdCWoh3TR6Gnv9
	 0XrIJo/MTt52iq5msgOako4JPQryUdDV2ogSRYfeU7bY3ARZl2pwzb4lRzV/xj4qAB
	 MRMU74/B3AUgzFZmPG/VkxTVAAVRNcv3LDq29kPacXlh88DDcOsPtGtvFBi9Y2Yitp
	 C3eGW2h3uE2YLxhEC59Hf3C+xeRzbhVasj03zhW7aMh1ffxHhMg8Fp30653MQK9s9A
	 /+nzaOHLojxN5JsnaI8iJQCVUG4rR/r1Mk4M+Q/n4XqYudS9CbxPMzs/9+tYGVVGMz
	 vuhn/3QtN/2ag==
Received: by arcturus.nroach44.id.au (Postfix, from userid 5555)
	id 218B031153; Thu,  5 Mar 2026 23:17:49 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nroach44.id.au;
	s=dYX2HNEqNNRL; t=1772723852;
	bh=YYARtrHKCTb0FOK3T5y+Ihj4HwkDUufhHFrwTteinjk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=j6HEjp58CAncqr+uwXPGkZ8lbR369/LG+98D/0XTHkVG3l29sNkU52WgCB9M9dhew
	 gfYeHT+jf9fW3OfG/GF2ck8167gHXSBgmfi6zT9ikR3LMg0qsPoY8nZSWjrMI8OJMj
	 kMd1y8ytlCPRepikIB3G0QISj/p2xbEqBa0pK59UYEzty8JgqZBIuj16Yj6eh2Rwin
	 RqmxUyGdqP+iWTSqkWn4TEleHa5tBEEY1MFUvIEGuDv8GfTrCrGQcMjfyPuSXM+3gd
	 YedViadoD7BXyM4xh27Cob7Y7tDuZ5rBOkg4Zdw1yQSY4SCVwDPQ2Y427CbPT0C5YX
	 UV5C2DMMj3FPw==
Received: from [IPV6:2403:5814:4228:10:6097:a659:11f5:50c] (unknown [IPv6:2403:5814:4228:10:6097:a659:11f5:50c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by arcturus.nroach44.id.au (Postfix) with ESMTPSA id 3DB73308D6;
	Thu,  5 Mar 2026 23:17:30 +0800 (AWST)
Message-ID: <9dfc93b5-8269-4c72-aedc-2a1d5311b4a5@nroach44.id.au>
Date: Thu, 5 Mar 2026 23:17:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/14] sparc64: vdso: Switch to the generic vDSO
 library
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Andy Lutomirski <luto@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Arnd Bergmann
 <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Nick Alcock <nick.alcock@oracle.com>,
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Shuah Khan <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Russell King
 <linux@armlinux.org.uk>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Shannon Nelson <sln@onemain.com>,
 Thomas Gleixner <tglx@kernel.org>, Christophe Leroy <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org,
 Arnd Bergmann <arnd@kernel.org>
References: <20260304-vdso-sparc64-generic-2-v6-0-d8eb3b0e1410@linutronix.de>
Content-Language: en-US
From: Nathaniel Roach <nroach44@nroach44.id.au>
In-Reply-To: <20260304-vdso-sparc64-generic-2-v6-0-d8eb3b0e1410@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_071803_435683_D1EAAACF 
X-CRM114-Status: GOOD (  25.02  )
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

No (new) issues seen on SPARC T5-2.

On 4/3/26 15:48, Thomas Weißschuh wrote:
> The generic vDSO provides a lot common functionality shared between
> different architectures. SPARC is the last architecture not using it,
> preventing some necessary code cleanup.
>
> Make use of the generic infrastructure.
>
> Follow-up to and replacement for Arnd's SPARC vDSO removal patches:
> https://lore.kernel.org/lkml/20250707144726.4008707-1-arnd@kernel.org/
>
> SPARC64 can not map .bss into userspace, so the vDSO datapages are
> switched over to be allocated dynamically.
>
> Tested on a Niagara T4 and QEMU.
>
> This has emantic conflicts with
> * "vdso: Reject absolute relocations during build" [0]
> * "vDSO: Respect COMPAT_32BIT_TIME" [1]
>
> But I expect both other serieses to need more discussions.
>
> [0] https://lore.kernel.org/lkml/20250812-vdso-absolute-reloc-v4-0-61a8b615e5ec@linutronix.de/
> [1] https://lore.kernel.org/lkml/20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de/
>
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Tested-by: Nathaniel Roach <nroach44@nroach44.id.au> # SPARC T5-2
> ---
> Changes in v6:
> - Provide statically allocated during early boot to avoid canges to the rng core
> - Use non-compound data pages
> - Reword commit messages
> - Rebase on v7.0-rc1
> - Link to v5: https://lore.kernel.org/r/20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de
>
> Changes in v5:
> - Merge the patches for 'struct page' mapping and dynamic allocation
> - Zero out newly-allocated data pages
> - Pick up review tags
> - Link to v4: https://lore.kernel.org/r/20251014-vdso-sparc64-generic-2-v4-0-e0607bf49dea@linutronix.de
>
> Changes in v4:
> - Rebase on v6.18-rc1.
> - Keep inclusion of asm/clocksource.h from linux/clocksource.h
> - Reword description of "s390/time: Set up vDSO datapage later"
> - Link to v3: https://lore.kernel.org/r/20250917-vdso-sparc64-generic-2-v3-0-3679b1bc8ee8@linutronix.de
>
> Changes in v3:
> - Allocate vDSO data pages dynamically (and lots of preparations for that)
> - Drop clock_getres()
> - Fix 32bit clock_gettime() syscall fallback
> - Link to v2: https://lore.kernel.org/r/20250815-vdso-sparc64-generic-2-v2-0-b5ff80672347@linutronix.de
>
> Changes in v2:
> - Rebase on v6.17-rc1
> - Drop RFC state
> - Fix typo in commit message
> - Drop duplicate 'select GENERIC_TIME_VSYSCALL'
> - Merge "sparc64: time: Remove architecture-specific clocksource data" into the
>    main conversion patch. It violated the check in __clocksource_register_scale()
> - Link to v1: https://lore.kernel.org/r/20250724-vdso-sparc64-generic-2-v1-0-e376a3bd24d1@linutronix.de
>
> ---
> Arnd Bergmann (1):
>        clocksource: remove ARCH_CLOCKSOURCE_DATA
>
> Thomas Weißschuh (13):
>        vdso/datastore: Reduce scope of some variables in vvar_fault()
>        vdso/datastore: Drop inclusion of linux/mmap_lock.h
>        vdso/datastore: Allocate data pages dynamically
>        sparc64: vdso: Link with -z noexecstack
>        sparc64: vdso: Remove obsolete "fake section table" reservation
>        sparc64: vdso: Replace code patching with runtime conditional
>        sparc64: vdso: Move hardware counter read into header
>        sparc64: vdso: Move syscall fallbacks into header
>        sparc64: vdso: Introduce vdso/processor.h
>        sparc64: vdso: Switch to the generic vDSO library
>        sparc64: vdso2c: Drop sym_vvar_start handling
>        sparc64: vdso2c: Remove symbol handling
>        sparc64: vdso: Implement clock_gettime64()
>
>   arch/sparc/Kconfig                         |   3 +-
>   arch/sparc/include/asm/clocksource.h       |   9 -
>   arch/sparc/include/asm/processor.h         |   3 +
>   arch/sparc/include/asm/processor_32.h      |   2 -
>   arch/sparc/include/asm/processor_64.h      |  25 --
>   arch/sparc/include/asm/vdso.h              |   2 -
>   arch/sparc/include/asm/vdso/clocksource.h  |  10 +
>   arch/sparc/include/asm/vdso/gettimeofday.h | 184 ++++++++++++++
>   arch/sparc/include/asm/vdso/processor.h    |  41 ++++
>   arch/sparc/include/asm/vdso/vsyscall.h     |  10 +
>   arch/sparc/include/asm/vvar.h              |  75 ------
>   arch/sparc/kernel/Makefile                 |   1 -
>   arch/sparc/kernel/time_64.c                |   6 +-
>   arch/sparc/kernel/vdso.c                   |  69 ------
>   arch/sparc/vdso/Makefile                   |   8 +-
>   arch/sparc/vdso/vclock_gettime.c           | 380 ++---------------------------
>   arch/sparc/vdso/vdso-layout.lds.S          |  26 +-
>   arch/sparc/vdso/vdso.lds.S                 |   2 -
>   arch/sparc/vdso/vdso2c.c                   |  24 --
>   arch/sparc/vdso/vdso2c.h                   |  45 +---
>   arch/sparc/vdso/vdso32/vdso32.lds.S        |   4 +-
>   arch/sparc/vdso/vma.c                      | 274 ++-------------------
>   include/linux/clocksource.h                |   6 +-
>   include/linux/vdso_datastore.h             |   6 +
>   init/main.c                                |   2 +
>   kernel/time/Kconfig                        |   4 -
>   lib/vdso/datastore.c                       |  97 +++++---
>   27 files changed, 375 insertions(+), 943 deletions(-)
> ---
> base-commit: f02e02079ac56b44ff89d4c2189cf7185ab794f3
> change-id: 20250722-vdso-sparc64-generic-2-25f2e058e92c
>
> Best regards,

