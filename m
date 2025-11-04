Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D10BCCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 08:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C0LvKOhhmgkPbAnJv9RUevotOR4DI1Uoh5ENCeo7njA=; b=1tbydZt13nwWHoPRBkbHhIfcAM
	RLV5uoKZDwbZK7wf+XwOha7zkc2PqQIAa0QNUPVaOHKwtN8etehJz1IvtngoshNOx471WChSvOzO9
	K5NRwRhYMDqenM9N992yHKiNTaZkWZNG4SONAp51zbqFhKsLBUyau6/iB6/Xw5WltqRF1BVhELxvL
	E7H08gGsRFoc47xkBBPVJlXB2eDIMXH3yUEm+fA3/LXX08ooZ0thk9f3F9sGeZJ7te9x3ZTDsKxkq
	DuKJUoUzmjPipe4AQLqdl4BX+ZApxg/rQ/OQwoPe6qc2Cq26Tp7flxXJHF7kf7n1MScns8zLKaHzc
	hy1CDj3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCsH-0000000BU2r-3unP;
	Tue, 04 Nov 2025 08:58:45 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCsF-0000000BU2F-2n5D
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 08:58:45 +0000
Date: Tue, 4 Nov 2025 09:58:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762246719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C0LvKOhhmgkPbAnJv9RUevotOR4DI1Uoh5ENCeo7njA=;
	b=PCKNJxulpg/PvsGYBz8V1FU4pIkAMexataoGH0wB1Wq12nZZHH8f2DwldZBJQaarAJVsP8
	yusjtIDWmV+OdYsTjKunNaFJcWiiyhHX6oDRiKaBNw6mbt6vWYMefNn74zwVvtcQNanAb/
	sFKjzpbAdgHOKh9I1DfB1uxqKlG9OH5OjQWRzQk9ok7MeccZ7XACWEaO4CMbje+8IR5FNE
	ksy6MxBeFin8cOh8nSGbd7sgJ1u4+BFBLgtkTy0AC0nIyqKnVIQCZ0PrgpFKDWnHjNm1K5
	thTLlUN+ZyklfklQSZjodwcMM1QHkniqB323QaFPf3lG/gDXH1KQ8B2yVTGLvw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762246719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C0LvKOhhmgkPbAnJv9RUevotOR4DI1Uoh5ENCeo7njA=;
	b=AYbRVmwTnBF9DHCl3zSORA5EBbeymIDmU5LN0MCGPkSaFq3DfisSLGnmVmNwMSYywgJ4+e
	uTDyt4qZNgxw5dDg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Mark Brown <broonie@kernel.org>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Nick Alcock <nick.alcock@oracle.com>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Shuah Khan <shuah@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Russell King <linux@armlinux.org.uk>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Nagarathnam Muthusamy <nagarathnam.muthusamy@oracle.com>, Shannon Nelson <sln@onemain.com>, linux-kernel@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, Aishwarya.TCV@arm.com
Subject: Re: [PATCH v4 23/35] vdso/datastore: Map pages through struct page
Message-ID: <20251104095555-ed009488-3aa8-43c5-b39f-066f04dee5a3@linutronix.de>
References: <20251014-vdso-sparc64-generic-2-v4-0-e0607bf49dea@linutronix.de>
 <20251014-vdso-sparc64-generic-2-v4-23-e0607bf49dea@linutronix.de>
 <aQjJNmwniQwwjeBR@finisterre.sirena.org.uk>
 <CGME20251104084442eucas1p2af1bd88393f4d6a532df1cd41f32a287@eucas1p2.samsung.com>
 <e7f05748-a11c-47eb-b1fa-cdc9dc6d05e0@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e7f05748-a11c-47eb-b1fa-cdc9dc6d05e0@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_005843_852584_B3893F6E 
X-CRM114-Status: GOOD (  20.81  )
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

Hi Marek,

On Tue, Nov 04, 2025 at 09:44:38AM +0100, Marek Szyprowski wrote:
> On 03.11.2025 16:24, Mark Brown wrote:
> > On Tue, Oct 14, 2025 at 08:49:09AM +0200, Thomas Weißschuh wrote:
> >
> >> An upcoming change will allocate the datapages dynamically instead of as
> >> part of the kernel image. Such pages can only be mapped through
> >> 'struct page' and not through PFNs.
> > I'm seeing some boot failures on some arm64 platforms in -next which are
> > bisecting to this patch in -next.  Unfortunately the diagnostics aren't
> > super useful, we seem to just stop making progress in userspace with no
> > obvious output.  One sample log from the FVP is:

(...)

> Then I've tested it on ARM64bit (RaspberrryPi3b+ board) and got the 
> following panic on 6a011a228293 ("vdso/datastore: Map pages through 
> struct page") commit:
> 
> VFS: Mounted root (ext4 filesystem) on device 179:3. Trying to move old 
> root to /initrd ... okay devtmpfs: mounted Freeing unused kernel memory: 
> 12672K Run /sbin/init as init process Unable to handle kernel paging 
> request at virtual address ffffffffc20b5d48 Mem abort info: ESR = 
> 0x0000000096000006 EC = 0x25: DABT (current EL), IL = 32 bits SET = 0, 
> FnV = 0 EA = 0, S1PTW = 0 FSC = 0x06: level 2 translation fault Data 
> abort info: ISV = 0, ISS = 0x00000006, ISS2 = 0x00000000 CM = 0, WnR = 
> 0, TnD = 0, TagAccess = 0 GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0 
> swapper pgtable: 4k pages, 48-bit VAs, pgdp=000000000230b000 
> [ffffffffc20b5d48] pgd=0000000000000000, p4d=0000000003618403, 
> pud=0000000003619403, pmd=0000000000000000 Internal error: Oops: 
> 0000000096000006 [#1] SMP Modules linked in: CPU: 2 UID: 0 PID: 1 Comm: 
> init Tainted: G W 6.18.0-rc1+ #16136 PREEMPT Tainted: [W]=WARN Hardware 
> name: Raspberry Pi 3 Model B (DT) pstate: 80000005 (Nzcv daif -PAN -UAO 
> -TCO -DIT -SSBS BTYPE=--) pc : vvar_fault+0x7c/0x17c lr : 
> vvar_fault+0x24/0x17c ... Call trace: vvar_fault+0x7c/0x17c (P) 
> special_mapping_fault+0x24/0xd0 __do_fault+0x3c/0x238 
> __handle_mm_fault+0xaa0/0x19e0 handle_mm_fault+0xcc/0x384 
> do_page_fault+0x1a0/0x720 do_translation_fault+0x60/0x6c 
> do_mem_abort+0x44/0x94 el0_da+0x54/0x230 el0t_64_sync_handler+0xd0/0xe4 
> el0t_64_sync+0x198/0x19c Code: f2d83fe0 8b010063 d34cfc63 8b031803 
> (f9400461) ---[ end trace 0000000000000000 ]--- Kernel panic - not 
> syncing: Attempted to kill init! exitcode=0x0000000b SMP: stopping 
> secondary CPUs Kernel Offset: disabled CPU features: 
> 0x000000,00180000,40004000,0400421b Memory Limit: none ---[ end Kernel 
> panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---
> 
> Reverting "clocksource: Remove ARCH_CLOCKSOURCE_DATA", "vdso/datastore: 
> Allocate data pages dynamically" and "vdso/datastore: Map pages through 
> struct page" on top of linux-next fixes booting on all tested boards.

Thanks for the report. I have a Raspberry Pi 3 Model B V1.2 here and will try
to reproduce the issue with it.
Can you send me your kernel configuration?
Which line is vvar_fault+0x7c/0x17c?


Thomas

