Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C142FC369D8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 01:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lhZqNPK+3qur5KT4zF1H9SCOT7iiZxQ3shEb0zor8do=; b=YZuIo1xYwC4seD5ggxNyR/cLKm
	hUPwibfZj12C7zuFrHk+DQauYad4avJhrACXsPJHlOP8XmJTzi/diKun+R413M8Z6HWHOViyic15f
	Q6Y2nVCCj+5GoUQNDDOIrfD23DNq7cJT33hC1JzhYYyTJeUaiPouwt7VGteG15Nt2hnFcZW4/ov5I
	0Np12us1AaF4oRD+Z2FyCekdU5Q6d6brk4Penkm4Jy2ZWFk+Eag2seu0tDyyrsAYUVMwTimc/i7kY
	8VfsOF7bRqjwYflOZFi5eL1zlSBF1eIdB7Oz7EC4C1EAv/SdKnXoCWgAvZR4iu6iHoKctEESVw2Fy
	68PO3NKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8qUZ-00000002hJu-3gKF;
	Sun, 27 Apr 2025 01:07:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8qPu-00000002gqe-0g5K;
	Sun, 27 Apr 2025 01:02:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4A6B45C5B40;
	Sun, 27 Apr 2025 01:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A008C4CEE2;
	Sun, 27 Apr 2025 01:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745715765;
	bh=MwWC0ebZT3d3MlgdSCMljk/IiWQqDJK/sfFSFFVgLjw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bPyZLOlvkggv+3wlQaPSM6gxDYFrytafe2vABHHUGe/DW28h51dobXwpP5JnZZv8e
	 siueA/NSLIi8nuwG9dfsk1681ilJovb4Z29iknbvMhR8GPTRbN0ZVeKBFFKZOwwljj
	 3U9QNUIWg3TN3LjeAfIWIWZYU3/vTYkS431OGKS6sxinbT9y/6X+clr/wOAXFX7E2r
	 VeFF9mnbIdUIuH/fv/IyMBN/ULQFSIccwdyDW2UT7HFOKtoe4pSnJMpfS90ZAD5CqB
	 IjZesituwcBevS0RAxopmnZA/CE/trjgjd8Bsfakzob1TBrOKKYrpOqivjGk4OuyjL
	 pu9aEs4XUVNSA==
Date: Sat, 26 Apr 2025 18:02:48 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
	linux-s390@vger.kernel.org, x86@kernel.org, ardb@kernel.org,
	Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: Re: [PATCH 11/13] crypto: x86/sha256 - implement library instead of
 shash
Message-ID: <20250427010248.GA68006@quark>
References: <20250426065041.1551914-12-ebiggers@kernel.org>
 <aAy6g3nblKtRj1l3@gondor.apana.org.au>
 <20250426180326.GA1184@sol.localdomain>
 <aA138IKjqyZeQLgB@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aA138IKjqyZeQLgB@gondor.apana.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_180246_246045_A0065DA4 
X-CRM114-Status: GOOD (  17.29  )
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

On Sun, Apr 27, 2025 at 08:18:56AM +0800, Herbert Xu wrote:
> On Sat, Apr 26, 2025 at 11:03:26AM -0700, Eric Biggers wrote:
> >
> > The SHA-256 library functions currently work in any context, and this patch
> > series preserves that behavior.  Changing that would be a separate change.
> 
> I've already removed the SIMD fallback path and your patch is
> adding it back.

While you've been pushing out a lot of random broken changes to shash recently,
the SHA-256 library functions weren't SIMD-optimized until this patchset.

> > But also as I've explained before, for the library API the performance benefit
> > of removing the crypto_simd_usable() doesn't seem to be worth the footgun that
> > would be introduced.  Your position is, effectively, that if someone calls one
> > of the sha256*() functions from a hardirq, we should sometimes corrupt a random
> > task's FPU registers.  That's a really bad bug that is very difficult to
> > root-cause.  My position is that we should make it just work as expected.
> 
> kernel_fpu_begin already does a WARN_ON when called in hardirq
> context and it can't safely use the FPU, there is no silent
> corruption.

Only when CONFIG_X86_DEBUG_FPU is enabled, which people don't enable in
production.  And even if that is enabled, it's just a WARN, so the registers
still get used and corrupted anyway.

- Eric

