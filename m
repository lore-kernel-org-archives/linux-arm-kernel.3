Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C659ACCFA0C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 15:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6/0fonC1CcSFJ/vzCGw398TxXXxzhqjx7ZhCqclZhJI=; b=XVmUilJ/aP1TbqV3gF3S9I/b9h
	4wrUFRh6WyyhLJMUpMgR8nUqc+9S6G2gDdxOjQGUoOWS5FneMdP9HvUfEtEakBukHfOFa4pSUY1p0
	sprAJD8+xhoxzpxu2rOTnGv0H0giDLVSQ3Yla5cbq2DsrUAmPmUAU2FmISpBznc/hy2Ron7L+J/gz
	BmLB0TNATYDvrFEqlctYJcdZKu03l3RuujyEPKCS6awGBUKwgw7lmzeTjCGicAah23lLoRdtL6b1h
	EZTSm+antEOg1AxYO5nZiPC4o4chfMRecfImigmuZlL/sUiwRdfGMMbmwgosGYiUA85TsBawC1iyn
	1qh5KVdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJCD-0000000C7SR-2bex;
	Tue, 04 Nov 2025 15:43:45 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJCB-0000000C7Ra-1Q95
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 15:43:44 +0000
Date: Tue, 4 Nov 2025 16:43:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762271019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6/0fonC1CcSFJ/vzCGw398TxXXxzhqjx7ZhCqclZhJI=;
	b=rjbrvle2cRAQ2r1/E6AUyn/63AoNirT+MeY3CSkMLQkjVu4MZ9i9gsM5VaY1sb3+Qse+3E
	k5Tsj3k0sX10MaW1Vt77Ml/iwrO90sXCi7ohIUnxBp8RCfq2diJY/ZCpc3gLIELLZkZ1gT
	L/BTyFm2ieNoLfdbPm3joETfalKC7jCYGiBCKDuN65AUEULDiusUD1wLGQDHRp47rNGPSE
	CNiRZhbWp4pKi5KAc4rKlwVrMeyIJALch4gPPlEKog+++hdtB+pAyXWGyDy2/FQb1lBsmj
	YmFrBOIEWYHsmogSRF3LDckjk1IVIHNKXQ3GxfoNtiFlAXBk/A7zx0VxilqApg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762271019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6/0fonC1CcSFJ/vzCGw398TxXXxzhqjx7ZhCqclZhJI=;
	b=FojQgXp5lZ7JuVC/TErfcQFIVgMu5YQg1OclEVtlB2s1//ebKD9BRtli3pju35zYRju4WW
	6T9NeyF0VG7+qZCA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Mark Brown <broonie@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Andy Lutomirski <luto@kernel.org>, 
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
Message-ID: <20251104162009-8cffa62d-e95b-466b-9a27-c51b0f5257cd@linutronix.de>
References: <20251014-vdso-sparc64-generic-2-v4-0-e0607bf49dea@linutronix.de>
 <20251014-vdso-sparc64-generic-2-v4-23-e0607bf49dea@linutronix.de>
 <aQjJNmwniQwwjeBR@finisterre.sirena.org.uk>
 <CGME20251104084442eucas1p2af1bd88393f4d6a532df1cd41f32a287@eucas1p2.samsung.com>
 <e7f05748-a11c-47eb-b1fa-cdc9dc6d05e0@samsung.com>
 <aQn8G9r2OWv_yEQp@finisterre.sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQn8G9r2OWv_yEQp@finisterre.sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_074343_516103_B04C9F57 
X-CRM114-Status: GOOD (  27.51  )
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

On Tue, Nov 04, 2025 at 01:14:03PM +0000, Mark Brown wrote:
> On Tue, Nov 04, 2025 at 09:44:38AM +0100, Marek Szyprowski wrote:
> > On 03.11.2025 16:24, Mark Brown wrote:
> 
> > > We do have some other serious breakage affecting arm64 in -next which
> > > are making it hard to get a clear picture of which platforms are
> > > affected, at least the FVP and O6 are unaffected by those other issues
> > > (due to using MTE on platforms that don't have it, those platforms do
> > > have MTE).
> 
> > I got almost the same result while bisecting on ARM 32bit Exynos-based 
> > boards, so the issue with this patchset is not fully ARM64 specific. For 
> > some reasons it also doesn't affect all systems though. It is even 
> > worse, because it affected only a subset of boards, but different for 
> > each tested commit. The observed failure looks exactly the same:
> 
> I've now got the results for this specific commit, it looks like every
> single arm64 system is failing.  I didn't test any other architectures.

Which one do you mean exactly with "this specific commit"?

6a011a228293 ("vdso/datastore: Map pages through struct page")
10d91dac2ea5 ("vdso/datastore: Allocate data pages dynamically")

> > Then I've tested it on ARM64bit (RaspberrryPi3b+ board) and got the 
> > following panic on 6a011a228293 ("vdso/datastore: Map pages through 
> > struct page") commit:
> 
> I'm seeing the same thing on at least some of the systems - this is with
> arm64 defconfig (I suspect that's what Marek is doing too).  For
> example:

I can now reproduce this issue, too. Even on QEMU. But it goes away,
as soon as the second commit is applied. The two commits should be merged.
That could also explain the weird bisection results, landing on either one
of the commits. However I can't reproduce the "silent freeze" issue on commit
10d91dac2ea5 ("vdso/datastore: Allocate data pages dynamically") on my
Raspberry Pi 3b+.

Any chance I could get remote access to one of your test machines?
I don't have access to the exact machines and that should reduce the chance
of chasing down dead ends.


Thomas

