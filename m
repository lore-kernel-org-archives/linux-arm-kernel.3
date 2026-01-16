Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C725D47CDE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 12:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m4xj4CRpx5Rn02x3ca442JNSKW3N63XvSapnCzBXF8o=; b=OlNGuoDjSf3WmGu6q6cow4lwDt
	/27aAaHJNACphI402yDQOioNuIP0bXF4TjbZKdTun2ZFwlZgGvgY1kDvmdlIXx0I11Lq7w1uhuR0g
	YbDJhuv9Mbhx6OrFHJd2OTZ9l95lGzb0Tsdf/kBQOQRxi+zrKPZdeHWXW/KFwKrUXYTKbdDWjWrrm
	4qPZOWhibwE0ejLzcWe1do3i0NZpTOM4I3hsEGW4CxH1UHYqhApaojfAB5olJNIpQyimCTtSPm34b
	lH/a/ESWh/g5HRnkqBH/uGpEwrUmNygEkNa7P0mdKz9vtxynWjgz7As12YVPbWUqI5OwccmxMRPWV
	bxE35/wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgifG-0000000E5dV-0a3W;
	Fri, 16 Jan 2026 12:10:54 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgifB-0000000E5c8-0U9W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 12:10:52 +0000
Date: Fri, 16 Jan 2026 13:10:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768565444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m4xj4CRpx5Rn02x3ca442JNSKW3N63XvSapnCzBXF8o=;
	b=tcY57KtkxrC2Kv4y0HkpbJbC/pQS5RHj9Kp4rg1YyeKUZFPhAszR0J9jXDYqU8XKMRt5yy
	/cxA+qFjtYuGq3R5ue0ASh4BzD6PkPogDxaC3NG7jOvQXfc6a8y1Mj7UjwdcpmtWm6QmMF
	P4JSJneYYVjhf0ropRohWWEJusj5z7WghKS+mseOsE/SiZUELdvQaP4mmZXIUcYfG0KM1J
	SyKqrKtvAZQtbn0EioFiC39BcksrufdUvJKV41PHxEM0/XUOhtZ5Su8mpUxN4BGoJ8QcpA
	pDPq2VQryd3zYOIkU4e5rPmQSuL5HuVQPwsqa2yeFNGSwpwptypePDBSAzdFGA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768565444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m4xj4CRpx5Rn02x3ca442JNSKW3N63XvSapnCzBXF8o=;
	b=RoLHU8R2m4lh+TOUGYaYUhiHbsJz60UbhmEfkq+Ri9skt252VpVK6rulxmT2CKH3E9ZPhM
	NY+TbhTMPWk9blDA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Nick Alcock <nick.alcock@oracle.com>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Shuah Khan <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, "Russell King (Oracle)" <linux@armlinux.org.uk>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Shannon Nelson <sln@onemain.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	sparclinux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH v5 00/34] sparc64: vdso: Switch to the generic vDSO
 library
Message-ID: <20260116124847-4bbc0b99-fa0c-4bd1-a229-1bd248ee8c6b@linutronix.de>
References: <20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de>
 <b870aa47-5ed4-4dcf-a407-eca83d1733d8@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b870aa47-5ed4-4dcf-a407-eca83d1733d8@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_041049_341698_6DB47772 
X-CRM114-Status: GOOD (  42.26  )
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

Hi Andy,

sorry for the long delay.

On Fri, Nov 07, 2025 at 04:17:14PM -0800, Andy Lutomirski wrote:
> On Thu, Nov 6, 2025, at 2:01 AM, Thomas Weißschuh wrote:
> > The generic vDSO provides a lot common functionality shared between
> > different architectures. SPARC is the last architecture not using it,
> > preventing some necessary code cleanup.
> >
> > Make use of the generic infrastructure.
> >
> > Follow-up to and replacement for Arnd's SPARC vDSO removal patches:
> > https://lore.kernel.org/lkml/20250707144726.4008707-1-arnd@kernel.org/
> >
> > SPARC64 can not map .bss into userspace, so the vDSO datapages are
> > switched over to be allocated dynamically. This requires changes to the
> > s390 and random subsystem vDSO initialization as preparation.
> > The random subsystem changes in turn require some cleanup of the vDSO
> > headers to not end up as ugly #ifdef mess.
> >
> 
> I hate to say it, but this patch series seems like a step backwards.  You're
> adding a whole lot of complexity and opportunity for screwups (boot failure?
> corruption?) to support SPARC, where other architectures have no problem with
> the existing code.  And this complexity appears to infect basically every
> kernel subsystem that supplies data to the vDSO.

Ack.

> Can you at least explain what the problem is and maybe give some discussion
> of why SPARC has no workaround available?  The closest I found was this bit
> from "[PATCH v4 24/35] vdso/datastore: Allocate data pages dynamically":
> 
> > Allocating the datapages as part of the kernel image does not work on
> SPARC. It is also problematic with regards to dcache aliasing as there is
> no guarantee that the virtual addresses used by the kernel are compatible
> with those used by userspace.
> 
> Now I'm not an expert on any architecture that has these aliasing (coloring?)
> issues, but from my limited understanding, it ought to be possible to choose
> a correctly colored address to map the vdso data given where it's being
> mapped from.  If there's an issue with gathering a bunch of basically
> arbitrarily relatively positioned physical pages into their necessary
> arrangement in usermode, you could presumably fix it either with some linker
> script magic or by rearranging the C code to stick everything into a
> multipage structure.

After I wrote that commit message it turned out to probably not be an
aliasing issue. Even with matching alignments the error would persist.
The real reason is unknown. Nobody came up with an explanatin so far.

But another advantage of this dynamic allocation is to enable mlockall()
on these VMAs. This avoids unexpected page faults and latency spikes for
realtime applications.
 
> Or maybe you could arrange to allocate all these pages during early boot and
> to fudge up some relocation to get all the existing generic code to find
> them.  Or create some pointers that all the generic code will use that, on
> non-sparc architectures, will be statically populated with the right
> addresses by the linker.  IOW, conceptually,
> 
> struct the_type some_vdso_thing;
> 
> could change to:
> 
> const struct the_type some_vdso_thing = &the_actual_data;
> 
> and SPARC could fix up the initialization of the pointer. And generic code
> would use the pointer instead of the_actual_data.

These pointers alread exist and are used by the generic code:
vdso_k_time_data, vdso_k_rng_data, vdso_k_arch_data.
As proposed elsewhere in this thread, these can point to statically allocated
memory at first so they can be accessed by the other kernel subsystems.
Then they after the dynamic allocation we do a mempcy from the static storage
to the dynamic one and update the pointer. I have the code for that which
does work nicely.

While we could limit this treatment to SPARC, I prefer to keep the code
aligned between the different architectures. Otherwise we would need
duplicate implementations as one uses PFN maps and the other 'struct page'
maps. Also the mlockall() usecase is architecture-agnostic.

Does this sound acceptable?

> If you really really really need to have non-arch-specific kernel C code
> running before the vdso data is allocated, can you give a very clear
> explanation of what, exactly, is wrong on sparc?  And maybe put that
> explanation into an appropriate comment somewhere so that future kernel
> programmers don't look at the headers and the code and think "wow, what I
> mess -- I bet I can clean this up by using statically allocated data".

Ack, will do. But as I mentioned, I do not have an actual root cause.

> (Can SPARC really not map things that existed during early boot into userspace?)

It looks like it.


Thomas

