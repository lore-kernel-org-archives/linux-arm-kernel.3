Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 224D9E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 10:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wc3y2MMAV4l4fXGHcieZbsIyWfTg/ozhFPhFb4lifrk=; b=mTu3K/+o5ZMXj7FPVykobo60+X
	t65tpfB+s8uipd26kSWlX/TcJkAFqKk7jBYqYyHAClKbIy93B0fTzbE2sDNjsxxLTRVdN3Wa7QvhV
	YNE+6ULm7FzxiuRoxZFAzvtGnyq+65byBMFqjwlZre3we1CRd87OCL/nPFZhI8UaHjls3IoCXM0wv
	1ye1Z2C65TN6gmbiZA3kIS6Dj3wJU2PXBLzxlVkoBRbxiCRxl3dJpYBqitllpdAyZu+223UzXB99u
	x/auEPREPvFhVA+C1MN+qUHFC8bC7k5rcuYD5xtDCf+GOpjYcVjGMVG4YPm18RNMsjah3fnrM8VYc
	BBY2FHoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrGY-0000000GFta-2tpu;
	Wed, 18 Dec 2024 10:26:54 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrFS-0000000GFj8-20VK;
	Wed, 18 Dec 2024 10:25:47 +0000
Date: Wed, 18 Dec 2024 11:25:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1734517545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wc3y2MMAV4l4fXGHcieZbsIyWfTg/ozhFPhFb4lifrk=;
	b=2SSWoTmikqml+QyzziVj/m4Yg45xAoP4dNtwTBlJig2p14toOtHozKw5Bxfjy4L/DvACGV
	OMNT4R2Rekm2Ck8CCOW0XGD1j8FoyZrt3Z7jazkfGB6Zv+KWrHTMOhmUum+sr+mgUm1e61
	TM1KWhbGQXbTlvxJf51hlLY47fK7pZY7y05qey8SsXBH0Nkg9uMgzFSWUJ30b/nxZp2S3N
	Hy4DtDnFlOUNAID7T8cQaJtlrwqn059Y+FAOYDMu2CWWxXTn5NsAeABAkO/WY90H+pP48R
	uMCgaoU5KLrPl82I7qw8SvgoxROfvTSXg9ibM/gPkLEPvpm/oD+JPk198PVRXA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1734517545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wc3y2MMAV4l4fXGHcieZbsIyWfTg/ozhFPhFb4lifrk=;
	b=AoKeNEyuPrW2z0f+0sR+kxNpoFiiPy1/gq9ak22q5IqO1FLos7EO/vgThimKc+44ktm5ZR
	tRGCj/jF+KFa4yBw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
	Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-s390@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>
Subject: Re: [PATCH 03/17] vdso: Add generic time data storage
Message-ID: <20241218111724-41f5e3c6-f41d-41ec-beed-bd05cca05016@linutronix.de>
References: <20241216-vdso-store-rng-v1-0-f7aed1bdb3b2@linutronix.de>
 <20241216-vdso-store-rng-v1-3-f7aed1bdb3b2@linutronix.de>
 <3b44defd-cd2a-4a3c-b72d-bcc0530336da@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3b44defd-cd2a-4a3c-b72d-bcc0530336da@csgroup.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_022546_795944_9307E309 
X-CRM114-Status: GOOD (  20.87  )
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

Hi Christophe,

On Wed, Dec 18, 2024 at 08:32:14AM +0100, Christophe Leroy wrote:
> Le 16/12/2024 ‡ 15:09, Thomas Weiﬂschuh a Ècrit†:
> > Historically each architecture defined their own way to store the vDSO
> > data page. Add a generic mechanism to provide storage for that page.
> > 
> > Furthermore this generic storage will be extended to also provide
> > uniform storage for *non*-time-related data, like the random state or
> > architecture-specific data. These will have their own pages and data
> > structures, so rename 'vdso_data' into 'vdso_time_data' to make that
> > split clear from the name.
> > 
> > Also introduce a new consistent naming scheme for the symbols related to
> > the vDSO, which makes it clear if the symbol is accessible from
> > userspace or kernel space and the type of data behind the symbol.
> > 
> > The generic fault handler contains an optimization to prefault the vvar
> > page when the timens page is accessed. This was lifted from s390 and x86.
> > 
> > Co-developed-by: Nam Cao <namcao@linutronix.de>
> > Signed-off-by: Nam Cao <namcao@linutronix.de>
> > Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> > ---
> >   MAINTAINERS                    |  1 +
> >   include/linux/time_namespace.h |  1 +
> >   include/linux/vdso_datastore.h | 10 +++++
> >   include/vdso/datapage.h        | 69 +++++++++++++++++++++++++----
> >   lib/Kconfig                    |  1 +
> >   lib/Makefile                   |  2 +
> >   lib/vdso_kernel/Kconfig        |  7 +++
> >   lib/vdso_kernel/Makefile       |  3 ++
> >   lib/vdso_kernel/datastore.c    | 99 ++++++++++++++++++++++++++++++++++++++++++
> 
> There is only one single file, namely datastore.c. You don't need a new
> directory for that, I should go in lib/vdso/

lib/vdso/ currently only contains userspace code.
I don't have a strong opinion on that.
The lib/vdso_kernel location was suggested by tglx, maybe he has some
feedback. (Originally I put it into kernel/vdso_storage.c)

[..]

> > +enum vdso_pages {
> > +	VDSO_TIME_PAGE_OFFSET,
> > +	VDSO_TIMENS_PAGE_OFFSET,
> > +	VDSO_NR_PAGES
> > +};
> 
> Naming that VDSO_ is confusing. Most macros called VDSO_ are related to the
> VDSO Code. VDSO data related macros should be prefixed with VVAR_

Also a request from tglx.

[..]


Thanks!
Thomas

