Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF6DC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 19:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C4OQQiEapNElJG/QIf+DgO1xfoV1fkZfJR1iX1tkGgA=; b=BYOi+NvMO55PDH3xWIvKvr3/Wm
	DWurypLRQoTd/Dow0QuxWkopYsIzmzvTpVo+644Ih7eUugMxew/VVBfdLf8jljSnw41/0rsu1zaM7
	rJxVw4p6/2P+vh2PB4XGgSxwThCXWBxCgqMn+xwOvftb83BBbUBu+dkGMlPylfJoioUgnEukHCgWA
	iT9/0a/JPvxh7LMKVfTGnGg9cqRFfwnJQYG9mlVskPMo4Zj87+cFhSYaxBEYzu+Tu19quulSvBnW1
	k6abe7PE1fV5HKiikJNK6VrseD7JRWU7UlQmorum51mRh5utdI13q/TGwbTiwXmkwcRLOauE+OuSY
	yYBIrHVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKiYD-0000000GPSw-46O4;
	Thu, 29 May 2025 19:04:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKiV1-0000000GOtv-0d49;
	Thu, 29 May 2025 19:01:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5BAA05C68F5;
	Thu, 29 May 2025 18:58:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FDDBC4CEE7;
	Thu, 29 May 2025 19:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748545266;
	bh=HpaSpxKPSTcKVq++ch2t3YrzhRTS1hIvLrLQoyh88o8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UyWCGQH8aj3D49i85BBT7NPpHwUvBNW7d1DfFwr/mwzpOzC5U7+XTtZFiWWAe14Ze
	 nhqUnY10VFWI+BKCwfDErzkzVF4tXKboIXWPiF3WPOTJTPo6c+6cM21vYBpUrO9/mN
	 sMPsJ3m64/v4Q+P8hT3rYcwitHqZ5dt7G3sw8nq+u/W/ReCZeRlJwpyZh0Wsr22aAX
	 xQCMSf21bnDaIcGcTdDvZ4CZK1D78q6RaISBNlaQveskEp46EPZFsHeJR4y/IBHKmc
	 NYuNP8oMHiKaatq8+i4kWnfFu6o59oSDZxsb5ZVDoCGlE7dj6qoySYQY8lweYQvnUH
	 TG5FI1zL6wzOg==
Date: Thu, 29 May 2025 12:00:48 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
	linux-s390@vger.kernel.org, x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v4 08/13] crypto: s390/sha256 - implement library instead
 of shash
Message-ID: <20250529190048.GA23614@sol>
References: <20250428170040.423825-1-ebiggers@kernel.org>
 <20250428170040.423825-9-ebiggers@kernel.org>
 <20250529110526.6d2959a9.alex.williamson@redhat.com>
 <20250529173702.GA3840196@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529173702.GA3840196@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_120107_233582_A843AF61 
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

On Thu, May 29, 2025 at 05:37:02PM +0000, Eric Biggers wrote:
> On Thu, May 29, 2025 at 11:05:26AM -0600, Alex Williamson wrote:
> > On Mon, 28 Apr 2025 10:00:33 -0700
> > Eric Biggers <ebiggers@kernel.org> wrote:
> > 
> > > From: Eric Biggers <ebiggers@google.com>
> > > 
> > > Instead of providing crypto_shash algorithms for the arch-optimized
> > > SHA-256 code, instead implement the SHA-256 library.  This is much
> > > simpler, it makes the SHA-256 library functions be arch-optimized, and
> > > it fixes the longstanding issue where the arch-optimized SHA-256 was
> > > disabled by default.  SHA-256 still remains available through
> > > crypto_shash, but individual architectures no longer need to handle it.
> > 
> > I can get to the following error after this patch, now merged as commit
> > b9eac03edcf8 ("crypto: s390/sha256 - implement library instead of shash"):
> > 
> > error: the following would cause module name conflict:
> >   crypto/sha256.ko
> >   arch/s390/lib/crypto/sha256.ko
> 
> Thanks for reporting this.  For now the s390 one should be renamed to
> sha256-s390, similar to how the other architectures' sha256 modules are named.
> I'll send a patch.
> 
> Long-term, I'd like to find a clean way to consolidate the library code for each
> algorithm into a single module.  So instead of e.g. libsha256.ko,
> libsha256-generic.ko, and sha256-s390.ko (all of which get loaded when the
> SHA-256 library is needed), we'd just have libsha256.ko.  (Or just sha256.ko,
> with the old-school crypto API one renamed to sha256-cryptoapi.ko.)  A lot of
> these weird build problems we've been having are caused by the unnecessary
> separation into multiple modules.
> 
> - Eric
> 

Patch sent: https://lore.kernel.org/r/20250529185913.25091-1-ebiggers@kernel.org

- Eric

