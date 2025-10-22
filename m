Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567F4CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 17:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hw4Qw8EBJ7SWXYCbg5AlxrDZQV9CyZufcCdtO9ZOUzE=; b=EQbmVl+87wb4PPFM/n4JEe3M86
	MFLJ7ptuNIbADFjhA9YIn0QFJDOMvjdVVKz3e+aCS9B3JBm5KfCxCZYLrf9NS89DdC9teEvr53Sak
	aJicHkq6YjEuJRQu2H0t72s5yoJ0hu2Lkxz6F+FtAs3AkwOaJUKTHvyh873BaSx0A1x1xbjxxcADj
	dGiFMZQaO5irEWTFTo16yNVQTqYFR4YJrfq/Geic154ZxXKLpwd10jflNWvuYG30hOhfmHK9kGGfS
	NiB21ApxmCl76zHKxO0RKUBIrCj+BLSkKCw5carvqa2ufJgr7TxdYsDVlRbJTjmNC0rLH7cTVq4+b
	MSA2cEFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBd7b-00000003v9u-36Ul;
	Wed, 22 Oct 2025 17:59:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBd7Z-00000003v9L-3F6V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 17:59:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 54C7D62676;
	Wed, 22 Oct 2025 17:59:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAEF8C4CEE7;
	Wed, 22 Oct 2025 17:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761155976;
	bh=9gx3OGdb0uIusRT1OUkumJNGerW8QboTuA02KwXp8SA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XNZ/D84OnEvWq0hPHRa2JfYwECvRchIFPwxWBOcwmcTyOTRVtou0qZVOs0Hzqtt55
	 bmhRtjKgQLPobPbaWutj5XMInarn6n3p0Ci7nSAAhvZol1PyIZz4FlhCO5Xzybk5Ap
	 p5PPk5+QbMfgNKZVTQwB/ah5K80YdWgL2/CcqClk9T2bsGuUHE7Le1JA0Z27yGsPoC
	 131sA5lcua4B/QAOwg2wm1MFmn0xbE9nejABosRPJ6wXpLVFtI3oNq5rVu4k6JTrQQ
	 Zh9fn3pfxrHxaregnyfdSIH+VrcbN5/sPU78OnCS1/MJ/8Ygd7tPpcmt1gMWISTFxL
	 iTbRaCRExEjXw==
Date: Wed, 22 Oct 2025 10:59:34 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: David Sterba <dsterba@suse.cz>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH 10/10] btrfs: switch to library APIs for checksums
Message-ID: <20251022175934.GA1646@quark>
References: <20251018043106.375964-1-ebiggers@kernel.org>
 <20251018043106.375964-11-ebiggers@kernel.org>
 <20251022071141.GV13776@twin.jikos.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022071141.GV13776@twin.jikos.cz>
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

On Wed, Oct 22, 2025 at 09:11:41AM +0200, David Sterba wrote:
> On Fri, Oct 17, 2025 at 09:31:06PM -0700, Eric Biggers wrote:
> > Make btrfs use the library APIs instead of crypto_shash, for all
> > checksum computations.  This has many benefits:
> > 
> > - Allows future checksum types, e.g. XXH3 or CRC64, to be more easily
> >   supported.  Only a library API will be needed, not crypto_shash too.
> > 
> > - Eliminates the overhead of the generic crypto layer, including an
> >   indirect call for every function call and other API overhead.  A
> >   microbenchmark of btrfs_check_read_bio() with crc32c checksums shows a
> >   speedup from 658 cycles to 608 cycles per 4096-byte block.
> > 
> > - Decreases the stack usage of btrfs by reducing the size of checksum
> >   contexts from 384 bytes to 240 bytes, and by eliminating the need for
> >   some functions to declare a checksum context at all.
> > 
> > - Increases reliability.  The library functions always succeed and
> >   return void.  In contrast, crypto_shash can fail and return errors.
> >   Also, the library functions are guaranteed to be available when btrfs
> >   is loaded; there's no longer any need to use module softdeps to try to
> >   work around the crypto modules sometimes not being loaded.
> > 
> > - Fixes a bug where blake2b checksums didn't work on kernels booted with
> >   fips=1.  Since btrfs checksums are for integrity only, it's fine for
> >   them to use non-FIPS-approved algorithms.
> > 
> > Note that with having to handle 4 algorithms instead of just 1-2, this
> > commit does result in a slightly positive diffstat.  That being said,
> > this wouldn't have been the case if btrfs had actually checked for
> > errors from crypto_shash, which technically it should have been doing.
> > 
> > Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> 
> Thanks, this simplifies quite a few things. I'd like to take it via the
> btrfs tree as there may be the hash additions (XXH3, BLAKE3) but
> currently I'm not sure if it won't make things more complicated. I
> haven't started the kernel part yet so I can use this patchset for
> development and rebase once it's merged. 

Great.  I'm planning to take patches 1-9 through libcrypto-next for
6.19.  You can then take patch 10 through the btrfs tree for 6.20.  Does
that sound good?  We can work out the XXH3 and BLAKE3 support later.  If
you'd like to add another checksum algorithm, I'd suggest picking just
one.  btrfs already supports an awful lot of choices for the checksum.
But we can discuss that later.

- Eric

