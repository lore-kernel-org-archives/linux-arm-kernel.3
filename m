Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C3BCD149F7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 22:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qpkv/o79CY52uHe4bP0C2cz6jWIS3ZVo75haFMpKvB8=; b=tBZQTzlbehXzw5dAmfv+kTifwN
	XWqv3AnSJphd1amwK3/oFVk9DasrT0ImYcXSWLa7mLMeZ3TkTZKfoyhxAiYanXBC2rGJCOntB+Jth
	PGPAAVJHe7JR03gf2n56BIQsOj20rsgc36Q2r3eHQFCGZz3WHCoyjCXJXfAX3LSPnQbSiIiQBVOat
	GMwIbX1dMR7nVeq2dPSo9WfWH0onvyA9Zh34Us26r1bF+cxRdc+h7iDzRBKePOGBPGVPSb4pKfGko
	+WWRL7+89Kr2VvOnIXyFMAVSWOP3c7R+i25fneWLU3ewL2pZ2T7HrXlcIb/xGVKTyY1rlsWucf8r/
	JcgHs7Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4SPu-00000005OXv-3EWm;
	Fri, 25 Oct 2024 22:04:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4SOM-00000005OOR-1iau;
	Fri, 25 Oct 2024 22:02:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Qpkv/o79CY52uHe4bP0C2cz6jWIS3ZVo75haFMpKvB8=; b=qfPHyVt0JH/D7VPYVG/oeYoRKC
	BWjKZAGKmAttDUXgJ0RSd5u0WDdhTkD7rhyQ8FR5RBB7T9vL6G3Gq02WFQ4ST3VvAuGrfMyoubAPC
	agQ7mt2GbW4ZFsYJwiai67NW8m+iNaa+Uy2JzquUtEmJpK8gEMfWWeT9tGm9C/jvjJ+2/PAqGGlGh
	SyHVeU85y66XNdyVwqz97oZ/FZW3F6rRnZzvh/NWdYaqIAi+DuRZv4HmYLBG2EroYYsLutdyhArRD
	Z7k5s9/KwbVg5Bzaub5t+xwIn9g3meLAGu19Rq9UUxLMRv274Qwpnwl+wBOxgMe64JIk52KMqztj5
	ytdleRmA==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4SOI-000000097cv-3tbN;
	Fri, 25 Oct 2024 22:02:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CCB6B5C5B7A;
	Fri, 25 Oct 2024 22:01:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 779EAC4CEC3;
	Fri, 25 Oct 2024 22:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729893760;
	bh=ehUyipyJYKOHtqA1xl/ASG6Px2MP+X3bw4HigUGDv+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nQ+Gvwdd9yysGsp0/7UPqj/qXd3zSzWYpyvhpi0++ZJ5oQTUKoSH0rAiYPTtQ9twV
	 qkHDbr3AJhjxOl6A1njpP1LPsg5esbBqjAK0dw53bkgrilMNsjgC8+SWoctEzkofEe
	 q5umojB4/VPj4s/EOR8drq3xpoD+hK70iS+el1oIMN7x3T4ma4ag8dWhGsBPuFPD08
	 X7fDq4cuocWDtE6fuI3dssWTW6C4FHK/Nv0gXa6ZDOzj9d21s6umvhxfOdT6/qSJJk
	 9Kfr57sbZvF4ubur0lRMtnU0gryP99paij167WI2Z/0vW9vxVu0blssafGUNty8k6B
	 scwlea49za9xA==
Date: Fri, 25 Oct 2024 22:02:39 +0000
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
Message-ID: <20241025220239.GB2637569@google.com>
References: <20241025191454.72616-1-ebiggers@kernel.org>
 <20241025191454.72616-5-ebiggers@kernel.org>
 <CAMj1kXEsq7iJThqZ7WA00ei4m59vpC23wPM+Mrj9W+HXfk-aSg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXEsq7iJThqZ7WA00ei4m59vpC23wPM+Mrj9W+HXfk-aSg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_230243_561080_5763F240 
X-CRM114-Status: GOOD (  29.94  )
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

On Fri, Oct 25, 2024 at 10:47:15PM +0200, Ard Biesheuvel wrote:
> On Fri, 25 Oct 2024 at 21:15, Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > From: Eric Biggers <ebiggers@google.com>
> >
> > Instead of registering the crc32-$arch and crc32c-$arch algorithms if
> > the arch-specific code was built, only register them when that code was
> > built *and* is not falling back to the base implementation at runtime.
> >
> > This avoids confusing users like btrfs which checks the shash driver
> > name to determine whether it is crc32c-generic.
> >
> 
> I think we agree that 'generic' specifically means a C implementation
> that is identical across all architectures, which is why I updated my
> patch to export -arch instead of wrapping the C code in yet another
> driver just for the fuzzing tests.
> 
> So why is this a problem? If no optimizations are available at
> runtime, crc32-arch and crc32-generic are interchangeable, and so it
> shouldn't matter whether you use one or the other.
> 
> You can infer from the driver name whether the C code is being used,
> not whether or not the implementation is 'fast', and the btrfs hack is
> already broken on arm64.
> 
> > (It would also make sense to change btrfs to test the crc32_optimization
> > flags itself, so that it doesn't have to use the weird hack of parsing
> > the driver name.  This change still makes sense either way though.)
> >
> 
> Indeed. That hack is very dubious and I'd be inclined just to ignore
> this. On x86 and arm64, it shouldn't make a difference, given that
> crc32-arch will be 'fast' in the vast majority of cases. On other
> architectures, btrfs may use the C implementation while assuming it is
> something faster, and if anyone actually notices the difference, we
> can work with the btrfs devs to do something more sensible here.

Yes, we probably could get away without this.  It's never really been
appropriate to use the crypto driver names for anything important.  And btrfs
probably should just assume CRC32C == fast unconditionally, like what it does
with xxHash64, or even do a quick benchmark to measure the actual speed of its
hash algorithm (which can also be sha256 or blake2b which can be very fast too).

Besides the btrfs case, my concern was there may be advice floating around about
checking /proc/crypto to check what optimized code is being used.  Having
crc32-$arch potentially be running the generic code would make that misleading.
It might make sense to keep it working similar to how it did before.

But I do agree that we could probably get away without this.

- Eric

