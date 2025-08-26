Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8FF7CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 10:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0pUOWx42AgBtSnbqWsfc6CIjNCLJp3kVqSsR4yIRJ/o=; b=X3tcXNsvrN9DPs/feEa9Rg8D55
	try8r9k4AnGr53JpCzldwjut/Yabrf32z0iB15QMmFUxyiDd9VeeHJZb0WmsnupbcJQcw5REmPWZp
	zDcsK14ZDHQKCZ9mUzdlgEhfrr9KLv+aO3G9UwER+qOsl3+QN4+27JuGZHEcrYBw9Sruyi/yTtyh7
	2X4sVamlHtAZhIyiWWqfK7DLziN0tNMEqm4XWRMXMe89Fj3q90Nv7ngGH/lILI1atSeVegsgzxgU6
	ejRXV+f02TTkX9vHAbA1SE/7fT+SxxrJIWDfI9fWmw02uSFlPjndKEP+YpKGmosAPups+hJBl7xB7
	ySNktMoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqr3N-0000000BdtY-0NoO;
	Tue, 26 Aug 2025 10:37:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqqJy-0000000BUuY-0g5F
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 09:50:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3231C1A00;
	Tue, 26 Aug 2025 02:50:19 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AABA83F63F;
	Tue, 26 Aug 2025 02:50:22 -0700 (PDT)
Date: Tue, 26 Aug 2025 10:50:15 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Sam Edwards <cfsworks@gmail.com>
Cc: Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Baruch Siach <baruch@tkos.co.il>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] arm64/boot: Zero-initialize idmap PGDs before use
Message-ID: <aK2DV_joOnaU85Tx@J2N7QTR9R3>
References: <20250822041526.467434-1-CFSworks@gmail.com>
 <CAMj1kXH38gOUpDDdarCXPAY3BHBbuFzdD=Dq7Knsg-qHJoNqzQ@mail.gmail.com>
 <CAH5Ym4gTTLcyucnXjxFtNutVR1HQ0G2k_YBSNO-7G3-4YXUtag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5Ym4gTTLcyucnXjxFtNutVR1HQ0G2k_YBSNO-7G3-4YXUtag@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_025030_287097_D84E1320 
X-CRM114-Status: GOOD (  30.61  )
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

On Sat, Aug 23, 2025 at 04:55:44PM -0700, Sam Edwards wrote:
> On Sat, Aug 23, 2025 at 3:25 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > Hi Sam,
> >
> > On Fri, 22 Aug 2025 at 14:15, Sam Edwards <cfsworks@gmail.com> wrote:
> > >
> > > In early boot, Linux creates identity virtual->physical address mappings
> > > so that it can enable the MMU before full memory management is ready.
> > > To ensure some available physical memory to back these structures,
> > > vmlinux.lds reserves some space (and defines marker symbols) in the
> > > middle of the kernel image. However, because they are defined outside of
> > > PROGBITS sections, they aren't pre-initialized -- at least as far as ELF
> > > is concerned.
> > >
> > > In the typical case, this isn't actually a problem: the boot image is
> > > prepared with objcopy, which zero-fills the gaps, so these structures
> > > are incidentally zero-initialized (an all-zeroes entry is considered
> > > absent, so zero-initialization is appropriate).
> > >
> > > However, that is just a happy accident: the `vmlinux` ELF output
> > > authoritatively represents the state of memory at entry. If the ELF
> > > says a region of memory isn't initialized, we must treat it as
> > > uninitialized. Indeed, certain bootloaders (e.g. Broadcom CFE) ingest
> > > the ELF directly -- sidestepping the objcopy-produced image entirely --
> > > and therefore do not initialize the gaps. This results in the early boot
> > > code crashing when it attempts to create identity mappings.
> > >
> > > Therefore, add boot-time zero-initialization for the following:
> > > - __pi_init_idmap_pg_dir..__pi_init_idmap_pg_end
> > > - idmap_pg_dir
> > > - reserved_pg_dir
> >
> > I don't think this is the right approach.
> >
> > If the ELF representation is inaccurate, it should be fixed, and this
> > should be achievable without impacting the binary image at all.
> 
> Hi Ard,
> 
> I don't believe I can declare the ELF output "inaccurate" per se,
> since it's the linker's final determination about the state of memory
> at kernel entry -- including which regions are not the loader's
> responsibility to initialize (and should therefore be initialized at
> runtime, e.g. .bss). But, I think I understand your meaning: you would
> prefer consistent load-time zero-initialization over run-time. I'm
> open to that approach if that's the consensus here, but it will make
> `vmlinux` dozens of KBs larger (even though it keeps `Image` the same
> size).

Our intent was that these are zeroed at build time in the Image. If the
vmlinux isn't consistent with that, that's a problem with the way we
generate the vmlinux, and hence "the ELF representation is inaccurate".

I agree with Ard that it's better to bring the vmlinux into line with
that (if we need to handlr this at all), even if that means making the
vmlinux a few KB bigger.

Mark.

