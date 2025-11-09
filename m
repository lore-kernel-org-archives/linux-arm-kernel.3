Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B66D3CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 03:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vP2lHqq1yss88mLftJL/V+DTQZsv/bcvlPmP+YM7xoI=; b=o3V79mxsJJ5dwmOS36t0v9OAWh
	4/HQxSCVmMgOHJ+Ir+XFum8G9skLARyHcRahhHpHzuCY3dMCp9DZeBAzzsjB1rZwY9j4/EHLmzcdp
	8J+VScFjfMENIsID3enbY8LrTgpvdIWQDlDNe6ZEeJn2HdhY1ogtRuqeLBsq6dwW1oWBvkC9KADYB
	ftA744mAfEgXSvusupeAOtkfEEH0JUfExjK3omZpiVGKZ8g2evR64u1rSCUyX36xzkc8OwtAfJOli
	nrrwSoyn2dtd36GRrf4fZ/W+tHTr2jEzYqCk9kV5J7CvJWbDycwloYBdUFvR444hakMS9a+KleFEZ
	m4MAUozQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHw1k-00000003gLs-1erL;
	Sun, 09 Nov 2025 03:23:40 +0000
Received: from angie.orcam.me.uk ([2001:4190:8020::34])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHw1h-00000003gLE-1FAP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 03:23:39 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 5947792009C; Sun,  9 Nov 2025 04:23:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 57A8792009B;
	Sun,  9 Nov 2025 03:23:31 +0000 (GMT)
Date: Sun, 9 Nov 2025 03:23:31 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Arnd Bergmann <arnd@arndb.de>
cc: Andy Lutomirski <luto@kernel.org>, 
    =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
    Thomas Gleixner <tglx@linutronix.de>, 
    Vincenzo Frascino <vincenzo.frascino@arm.com>, 
    "David S . Miller" <davem@davemloft.net>, 
    Andreas Larsson <andreas@gaisler.com>, 
    Nick Alcock <nick.alcock@oracle.com>, John Stultz <jstultz@google.com>, 
    Stephen Boyd <sboyd@kernel.org>, 
    John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
    shuah <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
    Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, 
    "Jason A . Donenfeld" <Jason@zx2c4.com>, 
    Russell King <linux@armlinux.org.uk>, 
    Madhavan Srinivasan <maddy@linux.ibm.com>, 
    Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
    Christophe Leroy <christophe.leroy@csgroup.eu>, 
    Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
    Alexander Gordeev <agordeev@linux.ibm.com>, 
    Christian Borntraeger <borntraeger@linux.ibm.com>, 
    Sven Schnelle <svens@linux.ibm.com>, Shannon Nelson <sln@onemain.com>, 
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    sparclinux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
    loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
    linux-s390@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH v5 00/34] sparc64: vdso: Switch to the generic vDSO
 library
In-Reply-To: <6452c785-872a-4fe7-90e1-8138d73c6218@app.fastmail.com>
Message-ID: <alpine.DEB.2.21.2511090221080.25436@angie.orcam.me.uk>
References: <20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de> <b870aa47-5ed4-4dcf-a407-eca83d1733d8@app.fastmail.com> <6452c785-872a-4fe7-90e1-8138d73c6218@app.fastmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_192337_506387_D7F8038A 
X-CRM114-Status: GOOD (  15.27  )
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

On Sat, 8 Nov 2025, Arnd Bergmann wrote:

> On other architectures, I see that parisc (always aliasing) has stubbed
> out the vdso functions, while mips/loongson has limited the page size
> selection to never alias. A few other mips platforms can theoretically
> enable both small pages and vdso, but my guess is that in practice
> they don't use the vdso (mips32/ath79) or they use 16KB pages
> (rm, dec, ip22) based on the defconfig settings.

 Umm, I'd have to dive into the details (and I hardly have the resources 
at hand), but quite a bunch of MIPS microarchitectures suffer from cache 
aliases; some even have VIVT caches.  A quick check with a system I have 
running at my lab:

$ ldd /bin/true
        linux-vdso.so.1 =>  (0x77ff4000)
        libc.so.6 => /lib/libc.so.6 (0x77e50000)
        /lib/ld.so.1 (0x77fcc000)
$ getconf PAGESIZE
4096
$ dmesg | grep linesize
Primary instruction cache 32kB, VIPT, 4-way, linesize 32 bytes.
Primary data cache 32kB, 4-way, VIPT, cache aliases, linesize 32 bytes
MIPS secondary cache 512kB, 8-way, linesize 32 bytes.
$ 

Some microarchitectures have aliasing prevention implemented in hardware, 
e.g. with the MTI 24K core:

                 Table 6-31 Config7 Register Field Descriptions
-------------+---------------------------------------------+-------+---------
   Fields    |                                             |       |
------+------+                                             | Read/ |  Reset 
 Name | Bits |                Description                  | Write |  State
======+======+=============================================+=======+=========
      |      | Alias removed: This bit indicates that the  |       |
      |      | data cache is organized to avoid virtual    |       |
  AR  |  16  | aliasing problems.  This bit is only set if |   R   |  Based
      |      | the data cache config and MMU type would    |       |  on HW
      |      | normally cause aliasing - i.e., only for    |       | present
      |      | the 32KB data cache and TLB-based MMU.      |       |
------+------+---------------------------------------------+-------+---------

But this is entirely optional and not architecturally guaranteed; Config7 
is a vendor space register.

 DEC platforms have a selectable page size (for R4k CPUs; R3k CPUs have a 
PIPT write-through cache, so no issue with aliasing ever) and 4KiB is the 
common choice, but they never suffer from aliases as the hardware resolves 
them.  It's not completely transparent as with the 24K option shown above, 
as a virtual coherency exception is triggered instead, at separate levels 
for the I$ and D$ each, and we handle it in software:

$ getconf PAGESIZE
4096
$ dmesg | grep linesize
Primary instruction cache 16kB, VIPT, direct mapped, linesize 16 bytes.
Primary data cache 16kB, direct mapped, VIPT, cache aliases, linesize 16 bytes
Unified secondary cache 1024kB direct mapped, linesize 32 bytes.
$ uptime
 02:46:16  up 250 days,  4:03,  2 users,  load average: 0.01, 0.01, 0.00
$ cat /proc/cpuinfo
system type		: Digital DECstation 5000/2x0
machine			: Unknown
processor		: 0
cpu model		: R4400SC V4.0  FPU V0.0
BogoMIPS		: 59.60
wait instruction	: no
microsecond timers	: yes
tlb_entries		: 48
extra interrupt vector	: no
hardware watchpoint	: yes, count: 0, address/irw mask: []
isa			: mips1 mips2 mips3
ASEs implemented	:
Options implemented	: tlb 4kex 4k_cache fpu 32fpr cache_cdex_p cache_cdex_s llsc dc_aliases inclusive_pcaches nan_legacy
shadow register sets	: 1
kscratch registers	: 0
package			: 0
core			: 0
VCED exceptions		: 372522
VCEI exceptions		: 16922804

$ 

(see the figures at the bottom; uptime quoted for an idea of the rate, 
though the system hasn't been heavily loaded).  It is possible with the 
aid of S$, which is inclusive and PIPT.

 FWIW,

  Maciej

