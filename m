Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59B75D10BE3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Oct 2024 04:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jySHzZ8/vGp5shiphRLX2u48Y+EMwjM/czZOmM2fFT0=; b=ZRwKBYb1BUl2wPkUp76muYdMme
	m5BI7BVqEZIoU5vMIaXqUDlVvKPpk7Mc9QRZUYPClQ55S5G+Qy8CCZRiSegJ42jRAmUdk4PhPc31W
	1RI9RlJmgx2S6BS8O9uLsx9ipEjbI7gvOn6XeCA9ZlsRQnrAXUUO6zy88Y49evEMaZjiGqGLR/e2y
	vkGIofAjYKAW/eLxSBopkmo3VK7IAYh7z0aB8KG+KpHVq7vszDWzYGjCpRYGILkqU1eKNghoTp4WP
	I0N9KVRfMbgVjigREeeSQ7Iv7aIw9PEkDOMYS7cRc9O67sqn8XVWMyZnTs19dzorgZ7e8fx7phmHd
	3v7H0cmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Y9O-00000005soL-3XQ9;
	Sat, 26 Oct 2024 04:11:42 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Y7n-00000005sZk-0WCs;
	Sat, 26 Oct 2024 04:10:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 87A2BA40220;
	Sat, 26 Oct 2024 04:08:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16197C4CEC6;
	Sat, 26 Oct 2024 04:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729915800;
	bh=lF+GZ34WavKbRCh+8SpENUkvMTOj0nNu/+wtL6EWAuc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dKuSS0eBaRI/CXii2QB5Wp13VN5M0EyqE+pRWQ0FIrWhJKg/vIHpdl8T4W8QxNuij
	 T0CG7+FxcgukLYYess7ilgKdACYxJyTQbvNYi5tggRwq+/XFBRGniANM7V3triPr8F
	 UUsS6muPo9iWYwGQFgwiv9w4YPPRVc28KYUlaAdjilM3SQfI6maVNNNlOFU9fEDXsq
	 Gk3BBORntTohGffZpXt1Y890883/3runspv9c8/UKZctcqZ0RsPobpG7rjK4cA5CnO
	 8NZmDph5HkYR8xfmcMREDDHLdj4UGjCSN4dQNMDqTidBJmggOvZ+kQyIdFd4kqd50G
	 JFBNHlz+eaPyA==
Date: Fri, 25 Oct 2024 21:09:58 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v2 04/18] crypto: crc32 - don't unnecessarily register
 arch algorithms
Message-ID: <20241026040958.GA34351@sol.localdomain>
References: <20241025191454.72616-1-ebiggers@kernel.org>
 <20241025191454.72616-5-ebiggers@kernel.org>
 <CAMj1kXEsq7iJThqZ7WA00ei4m59vpC23wPM+Mrj9W+HXfk-aSg@mail.gmail.com>
 <20241025220239.GB2637569@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025220239.GB2637569@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_211003_323317_2A09F25E 
X-CRM114-Status: GOOD (  37.05  )
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

On Fri, Oct 25, 2024 at 10:02:39PM +0000, Eric Biggers wrote:
> On Fri, Oct 25, 2024 at 10:47:15PM +0200, Ard Biesheuvel wrote:
> > On Fri, 25 Oct 2024 at 21:15, Eric Biggers <ebiggers@kernel.org> wrote:
> > >
> > > From: Eric Biggers <ebiggers@google.com>
> > >
> > > Instead of registering the crc32-$arch and crc32c-$arch algorithms if
> > > the arch-specific code was built, only register them when that code was
> > > built *and* is not falling back to the base implementation at runtime.
> > >
> > > This avoids confusing users like btrfs which checks the shash driver
> > > name to determine whether it is crc32c-generic.
> > >
> > 
> > I think we agree that 'generic' specifically means a C implementation
> > that is identical across all architectures, which is why I updated my
> > patch to export -arch instead of wrapping the C code in yet another
> > driver just for the fuzzing tests.
> > 
> > So why is this a problem? If no optimizations are available at
> > runtime, crc32-arch and crc32-generic are interchangeable, and so it
> > shouldn't matter whether you use one or the other.
> > 
> > You can infer from the driver name whether the C code is being used,
> > not whether or not the implementation is 'fast', and the btrfs hack is
> > already broken on arm64.
> > 
> > > (It would also make sense to change btrfs to test the crc32_optimization
> > > flags itself, so that it doesn't have to use the weird hack of parsing
> > > the driver name.  This change still makes sense either way though.)
> > >
> > 
> > Indeed. That hack is very dubious and I'd be inclined just to ignore
> > this. On x86 and arm64, it shouldn't make a difference, given that
> > crc32-arch will be 'fast' in the vast majority of cases. On other
> > architectures, btrfs may use the C implementation while assuming it is
> > something faster, and if anyone actually notices the difference, we
> > can work with the btrfs devs to do something more sensible here.
> 
> Yes, we probably could get away without this.  It's never really been
> appropriate to use the crypto driver names for anything important.  And btrfs
> probably should just assume CRC32C == fast unconditionally, like what it does
> with xxHash64, or even do a quick benchmark to measure the actual speed of its
> hash algorithm (which can also be sha256 or blake2b which can be very fast too).
> 
> Besides the btrfs case, my concern was there may be advice floating around about
> checking /proc/crypto to check what optimized code is being used.  Having
> crc32-$arch potentially be running the generic code would make that misleading.
> It might make sense to keep it working similar to how it did before.
> 
> But I do agree that we could probably get away without this.

While testing this patchset I notice that none of the crypto API drivers for
crc32 or crc32c even need to be loaded on my system anymore, as everything on my
system that uses those algorithms (such as ext4) just uses the library APIs now.
That makes the "check /proc/crypto" trick stop working anyway.

I think you're right that we shouldn't bother with patches 3-4, and I'll plan to
go back to leaving them out in the next version, unless someone yells.

- Eric

