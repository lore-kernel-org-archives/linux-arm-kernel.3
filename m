Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BBE5CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o0czkPnsNoT6itj5A/RJq/dzv5oWFxkSBPgW94t4tks=; b=QySU3uYc9ALDr5dn08xl8H6WMe
	UbyeFK2Mr/YNGanNSCop3F1mH9UBMjxy21KViiNCOOSN8Ek39ovADtLIOJQsatk84db9RXiUbU51N
	pMYzXj0uXnon+5imJAzoXECyn5qNmXSkQ8v7ibXSloq7kxqXu7WC7vnNNEoA5i6dLKBSeTfLudfNU
	r4qql8crIRFXNQGnyc8MA3Ijqn/ipxxkzhAeT/v59JOrIGi7v7zclSYY7whieUr76ICxmUsbho0Pb
	GNV1Y7kiIhR8/HykNqnNSCNbHDua5ChygOw64yDUdTnhS9qhY+qQgsfZECvQ/YlZ1dKvsmeBD+unu
	wVn9gpHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9kG-0000000794D-3XXw;
	Sat, 30 Aug 2025 00:47:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us1hE-00000006MYB-2ABr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 16:11:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D23D0601D4;
	Fri, 29 Aug 2025 16:11:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 553CCC4CEF0;
	Fri, 29 Aug 2025 16:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756483883;
	bh=sqJTNjc9tqL3D56vJ9a8C8Qu0i2VXToHvsttDUp6REg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WyZYBY9dWSyaRvLdEkrWAcnQnR655At0UbTNlwKw15O8ake1aLvcMYcv7FK6w5mEQ
	 +iWVzxpMWFB8LRAwtARMeCVF5OmtzzeS4VTdwrOH8fDeZ2xw/KofblztMT2C30lV+j
	 /fNWEXPrMFH8igk6kL/8PpjQf9dC0UrYDGF60ePYgVxzDXe82Zjtry+ZuruG5UXWKR
	 /Nkizg3iDv54WJWXH0vTpmCna0scULQmI4wXtgX3TSdjK+7NWfFpmKxcWI/Ldg6c5n
	 lhMNIcIUtSSsAVzsvMk6Sl46KbX1DrlodZCuT9TurbWPzGOxppumEHu81l1WWeTeXJ
	 IHu3U552FvEsg==
Date: Fri, 29 Aug 2025 09:10:18 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Honza Fikar <j.fikar@gmail.com>, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Jason A . Donenfeld" <Jason@zx2c4.com>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 09/12] lib/crypto: blake2s: Always enable arch-optimized
 BLAKE2s code
Message-ID: <20250829161018.GB91803@sol>
References: <20250827151131.27733-1-ebiggers@kernel.org>
 <20250827151131.27733-10-ebiggers@kernel.org>
 <CAEH5pPY98CaSm+EXiuOzo6EuWzGu7rEQjGa3eojk18HP29Rs7w@mail.gmail.com>
 <20250829152912.GA91803@sol>
 <CAMj1kXGf+0b=6kPAzzxgesaOYSJtzoL1oQyNqT2VrUkWFzwJzA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMj1kXGf+0b=6kPAzzxgesaOYSJtzoL1oQyNqT2VrUkWFzwJzA@mail.gmail.com>
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

On Fri, Aug 29, 2025 at 06:05:42PM +0200, Ard Biesheuvel wrote:
> On Fri, 29 Aug 2025 at 17:30, Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > On Fri, Aug 29, 2025 at 03:08:56PM +0200, Honza Fikar wrote:
> > > On Fri, Aug 29, 2025 at 2:54 PM Eric Biggers <ebiggers@kernel.org> wrote:
> > >
> > > > Currently, BLAKE2s support is always enabled ('obj-y'), since random.c
> > > > uses it.  Therefore, the arch-optimized BLAKE2s code, which exists for
> > > > ARM and x86_64, should be always enabled too.
> > >
> > > Maybe a stupid question: what about ARM64? The current NEON
> > > implementation in kernel arch/arm/crypto/blake2s-core.S seems to be just
> > > for ARM.
> > >
> 
> That code is scalar not NEON, and is carefully tuned to make use of
> the ARM barrel shifter, which does not exist on arm64.
> 
> > > While the upstream BLAKE2s with NEON is both for ARM and Aarch64 (ARM64):
> > >
> > > https://github.com/BLAKE2/BLAKE2/blob/master/neon
> >
> > There's no ARM64 optimized BLAKE2s code in the Linux kernel yet.  If
> > it's useful, someone would need to contribute it.
> >
> 
> NEON is cumbersome in the kernel so this only makes sense if it is
> substantially more performant, and I'm skeptical that this is the
> case, as you pointed out yourself in
> 
> commit 5172d322d34c30fb926b29aeb5a064e1fd8a5e13
> Author: Eric Biggers <ebiggers@google.com>
> Date:   Wed Dec 23 00:09:59 2020 -0800
> 
>     crypto: arm/blake2s - add ARM scalar optimized BLAKE2s
> 
>     Add an ARM scalar optimized implementation of BLAKE2s.
> 
>     NEON isn't very useful for BLAKE2s because the BLAKE2s block size
>     is too small for NEON to help.  Each NEON instruction would depend
>     on the previous one, resulting in poor performance.
> 
> Even if NEON code might be slightly faster on some cores, the fact
> that it is sensitive to micro-architectural details makes it less
> attractive.

Yes, agreed: there isn't much opportunity for an ARM64 optimized BLAKE2s
implementation to be faster than the generic C code.

- Eric

