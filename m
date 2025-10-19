Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B272ACCD195
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Oct 2025 16:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Karn116GYjTx2H81CntcrkAvTygSq7TejQKGOkTyXIM=; b=3NuqSWTqMIRyPhEcDVF45ONBJe
	DFmjt263mehVet3cj5nuA06zQepGG5AXXz3tIFghIkxKCg4g6P5EXVkfQu36fqbuwlP+WefXjoHjg
	ZwfB9FXWZOBAHvPLb5B6/bMbdnns4T1SUUxEjpZaKYEFlyoqOJVS6TC+vP56Y2wSeXPGPGj1ySdVg
	V7WJ8NnbMHt9NzcCZoW+k6vSGUpiXRopB7rb3QH3p5KOnLvVOqdNFoSX6/xYwg4+Q8h+UN4uMJXPQ
	fNLP0DwsgWf0aTE7IuSqAro9okA4v1PzfNoFHm586zXfNifeRE4fL39fF/m8sUsm9C6nlJyEFAwaM
	5/l5anmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAWDj-0000000BCDy-3LSd;
	Sun, 19 Oct 2025 16:25:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAWDg-0000000BCDU-3FdU;
	Sun, 19 Oct 2025 16:25:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8C9C944476;
	Sun, 19 Oct 2025 16:25:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7610C4CEE7;
	Sun, 19 Oct 2025 16:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760891119;
	bh=AqeDRU1eKSmQXUiCZ7pwi0Bd8BGGXBM48O4Ou5Xs+sw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F2EokHRLd68kZBeDRRdhxJ1rDW2elFlh8EnkyaTJnHSCfqkoujh7BohpZc68H407D
	 6bUXmBrNoq7Ww0jTMF1QQwGeMEpfXz0BrGd0k+T8PJbgWDRrKfDcnhwumf2RRZV3Tp
	 M1nqa0cZRI89OYqyvuvRWeFwctcqJgDf9nK43gHk2G3mRl3usq7ey6ziFEp5oxVwef
	 8ha/lyEniLuE2fegL9ApZJO+lst38G6OUrwAE6O/NFZ/Mz1YaBFZd+ociss1pkQv9d
	 0MzWPAoBwoLUZ5+ACw5ohULeXVrjB6+3sdA7UiNPKC79wDn4zGf7+6LA7UKkZ5vUk5
	 GbYsQCDUj5ADg==
Date: Sun, 19 Oct 2025 09:23:46 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Askar Safin <safinaskar@gmail.com>
Cc: ardb@kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org,
	x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH v4 15/19] lib/crc32: make crc32c() go directly to lib
Message-ID: <20251019162346.GB1604@sol>
References: <20241202010844.144356-16-ebiggers@kernel.org>
 <20251019060845.553414-1-safinaskar@gmail.com>
 <CAPnZJGAb7AM4p=HdsDhYcANCzD8=gpGjuP4wYfr2utLp3WMSNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPnZJGAb7AM4p=HdsDhYcANCzD8=gpGjuP4wYfr2utLp3WMSNQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_092520_876965_13F3EC67 
X-CRM114-Status: GOOD (  22.04  )
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

On Sun, Oct 19, 2025 at 11:10:25AM +0300, Askar Safin wrote:
> On Sun, Oct 19, 2025 at 9:09 AM Askar Safin <safinaskar@gmail.com> wrote:
> >
> > Eric Biggers <ebiggers@kernel.org>:
> > > Now that the lower level __crc32c_le() library function is optimized for
> >
> > This patch (i. e. 38a9a5121c3b ("lib/crc32: make crc32c() go directly to lib"))
> > solves actual bug I found in practice. So, please, backport it
> > to stable kernels.
> 
> Oops. I just noticed that this patch removes module "libcrc32c".
> And this breaks build for Debian kernel v6.12.48.
> Previously I tested minimal build using "make localmodconfig".
> Now I tried full build of Debian kernel using "dpkg-buildpackage".
> And it failed, because some of Debian files reference "libcrc32c",
> which is not available.
> 
> So, please, don't backport this patch to stable kernels.
> I'm sorry.

Right, this commit simplified the CRC library design by removing the
libcrc32c module.  initramfs build scripts that hard-coded the addition
of libcrc32c.ko into the ramdisk (which I don't think was ever necessary
in the first place, though it did used to be useful to hard-code some of
the *other* CRC modules like crc32c-intel) had to be updated to remove
it.  It looks like Debian did indeed do that, and they updated it in
https://salsa.debian.org/kernel-team/linux/-/commit/6c242c647f84bfdbdc22a6a758fa59da4e941a10#1251f9400a85485d275e1709758350aa098709a8

As for your original problem, I'd glad to see that the simplified design
is preventing problems.  There's an issue with backporting this commit
alone, though.  This was patch 15 of a 19-patch series for a good
reason: the CRC-32C implementation in lib/ wasn't architecture-optimized
until after patches 1-14 of this series.  Backporting this commit alone
would make crc32c() no longer utilize architecture-optimized code.

Now, it already didn't do so reliably (and this patch series fixed
that).  However, backporting this commit alone would make it never do
so.  So it would regress performance in some cases.

Since the errors you're actually getting are:

    [   19.619731] Invalid ELF header magic: != ELF
    modprobe: can't load module libcrc32c (kernel/lib/libcrc32c.ko.xz): unknown symbol in module, or unknown parameter

I do have to wonder if this is actually a busybox bug or
misconfiguration, where it's passing a compressed module to the kernel
without decompressing it?  And removing the module just hid the problem.

- Eric

