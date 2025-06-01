Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BDF3C5B555
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Jun 2025 23:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VLdinv37uoJCg/NqMkaiZgFpI3acFDq5XCKcz59TcpQ=; b=2CjbAwnYxr+9zTR2WTLUt4ROZ+
	8Qu4lqIx5Jhb+qQTEuEbXSkx10qjoLMfiiNu47fD/UVOg3yAd45Dvdq1uni5zTBGS+s0B6Q/zeuNT
	EqPKSlYCQBzusBAvZAQi9NDbJeHXaxcgKCJm4j5vj42tIzHI88s7HatzMnF0IgH8mX+JK1PDmgbmg
	Qr5DamX9f09osvGUgzDqRh7anlcfEN0MqhNJXZ6eECaz0AwrzZTgJ5iQN/+f/9X2XxrR5Ds/b56LB
	FLx0dW091XSPGKP9aEdHFyTzThVeh3s+zen85acoTTpqRELWkKBDt/QdUbvHPkb3sqIk1sMs6cv2P
	CHrRrsJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLs03-0000000650V-2vGi;
	Sun, 01 Jun 2025 23:21:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLrfO-0000000631F-2lhY;
	Sun, 01 Jun 2025 23:00:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CA61F60EDF;
	Sun,  1 Jun 2025 23:00:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14CC5C4CEE7;
	Sun,  1 Jun 2025 23:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748818833;
	bh=9iuAqFgWuAM8zbaClmJE1PWkDiz9aDszJI49BnUralg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vHFxc2VElAHlFA2+p6pUxtFWEe5J4xv+o56KAxPCmT8t7sop9JD+tvRSV5M6+149b
	 3yslurmUrK9306e+AjqkjU66ZE4+J12qO4pfC9GKOwcLYIKirbFU/Rg2oRbbVA43ns
	 5uDfSlrlHs9e9hvwYN9GazeDaNtZ3XeMSpkJHQHb3lkfbDihKnyqOzItzJyKZ/V5SA
	 kll91RZkjqNe9evwrPUGhmeKBh/iuKFMYirrTrajg0Qa5HWH48c/p5D7scSRNhf3bP
	 g9JW0K0QMuooWlvxhFXufeAQiYS/ENsn141k7rnLZBFnOMguZuObdXNfv/1/r4saJT
	 S2ckVl3S2NSgA==
Date: Sun, 1 Jun 2025 16:00:14 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Alex Williamson <alex.williamson@redhat.com>,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
	linux-s390@vger.kernel.org, x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v4 08/13] crypto: s390/sha256 - implement library instead
 of shash
Message-ID: <20250601230014.GB1228@sol>
References: <20250428170040.423825-1-ebiggers@kernel.org>
 <20250428170040.423825-9-ebiggers@kernel.org>
 <20250529110526.6d2959a9.alex.williamson@redhat.com>
 <20250529173702.GA3840196@google.com>
 <CAHk-=whCp-nMWyLxAot4e6yVMCGANTUCWErGfvmwqNkEfTQ=Sw@mail.gmail.com>
 <20250529211639.GD23614@sol>
 <CAHk-=wh+H-9649NHK5cayNKn0pmReH41rvG6hWee+oposb3EUg@mail.gmail.com>
 <20250530001858.GD3840196@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530001858.GD3840196@google.com>
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

On Fri, May 30, 2025 at 12:18:58AM +0000, Eric Biggers wrote:
> On Thu, May 29, 2025 at 04:54:34PM -0700, Linus Torvalds wrote:
> > On Thu, 29 May 2025 at 14:16, Eric Biggers <ebiggers@kernel.org> wrote:
> > >
> > > So using crc32c() + ext4 + x86 as an example (but SHA-256 would be very
> > > similar), the current behavior is that ext4.ko depends on the crc32c_arch()
> > > symbol.
> > 
> > Yes, I think that's a good example.
> > 
> > I think it's an example of something that "works", but it certainly is
> > a bit hacky.
> > 
> > Wouldn't it be nicer if just plain "crc32c()" did the right thing,
> > instead of users having to do strange hacks just to get the optimized
> > version that they are looking for?
> 
> For crc32c() that's exactly how it works (since v6.14, when I implemented it).
> The users call crc32c() which is an inline function, which then calls
> crc32c_arch() or crc32c_base() depending on the kconfig.  So that's why I said
> the symbol dependency is currently on crc32c_arch.  Sorry if I wasn't clear.
> The SHA-256, ChaCha, and Poly1305 library code now has a similar design too.
> 
> If we merged the arch and generic modules together, then the symbol would become
> crc32c.  But in either case crc32c() is the API that all the users call.
> 
> - Eric
> 

I implemented my proposal, for lib/crc first, in
https://lore.kernel.org/lkml/20250601224441.778374-1-ebiggers@kernel.org.
I think it's strictly better than the status quo, and once applied to lib/crypto
it will solve some of the problems we've been having there too.  But let me know
if you still have misgivings.

- Eric

