Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A69CED6AB10
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 23:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wal1G+niriEd5OFuTAoZp+pgrxbncQEn/nSBH8Fu61Y=; b=vV8VYkYqLDyBJ+6165M8mle9Fp
	fStDJ0MbWYG2lAeByosgOfGw5CekCq1/S8bp5qXM9wKXS+YmgyLOYhOKlTvngSPYxLuXuFAqMv5Wx
	JaUVp4Kudbu/YsN545lI5lO6Ype/NwnZDWyVUuDlEsWekhNcB9Q6TD44G7/BEtL5sdeLZCDXGB1bs
	clBqI/Yuk5iljPHhJE6aR0/V2HAWegGqQXAJEmg50yvxIbigWFNAuDQLyroYInRCdEwriwdiwwxO4
	Axg6DaGD39hM23dwgOmAEnOym3gGbtzgJPlppCgSWg1rVg3qnpgLqxM+B9YVAJr+61vKLAL5jS4qt
	rp26f/zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8RfT-00000000wtl-2307;
	Thu, 02 Apr 2026 23:41:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8RfS-00000000wtf-16W9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 23:41:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F102B60008;
	Thu,  2 Apr 2026 23:41:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89D87C116C6;
	Thu,  2 Apr 2026 23:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775173300;
	bh=7NOW3ITftkmp8qKTfa0k6SbUHcFY4cawziN3p3aCPzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TkcfvpWzktc1Bo9FBwdcwgXFMwCasG7oEuS/DudNm2kQdM6DspmrlBOXkcS2TTpO1
	 /sCjIvh2jS/HGl6wd6DiC20xNR8HQzjTn2uBQQE25kBJPvJ5z+vlcphLwTYnBD4s0r
	 qe0VlHnsAM9UgFcuwS26OjOSybAvoD+DOje4T0nT/FpfX86oAsSLXaCnFfgL7X+rJ5
	 Io3w/oxIdbFcio56DOq08Ki9kLz0INji3b5XtRNHFhkzDDvhHcujVSge0jtIycx9fV
	 Ux6Tfme1dbAkLgJuC0+TwuoGX7c/BEyW9X0M/TnmpIgWmy54L340rSPlKoxX4vLwZr
	 fW/zFo3XXBQ8A==
Date: Thu, 2 Apr 2026 16:40:28 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Demian Shulhan <demyansh@gmail.com>
Subject: Re: [PATCH 0/5] crc64: Tweak intrinsics code and enable it for ARM
Message-ID: <20260402234028.GA2256@sol>
References: <20260330144630.33026-7-ardb@kernel.org>
 <20260401195943.GA2466@quark>
 <dc424b4a-11b5-475f-a53a-987b5813bac5@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc424b4a-11b5-475f-a53a-987b5813bac5@app.fastmail.com>
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

On Thu, Apr 02, 2026 at 10:52:17AM +0200, Ard Biesheuvel wrote:
> 
> On Wed, 1 Apr 2026, at 21:59, Eric Biggers wrote:
> > On Mon, Mar 30, 2026 at 04:46:31PM +0200, Ard Biesheuvel wrote:
> >> Apply some tweaks to the new arm64 crc64 NEON intrinsics code, and wire
> >> it up for the 32-bit ARM build. Note that true 32-bit ARM CPUs usually
> >> don't implement the prerequisite 64x64 PMULL instructions, but 32-bit
> >> kernels are commonly used on 64-bit capable hardware too, which do
> >> implement the 32-bit versions of the crypto instructions if they are
> >> implemented for the 64-bit ISA (as per the architecture).
> >> 
> >> Cc: Demian Shulhan <demyansh@gmail.com>
> >> Cc: Eric Biggers <ebiggers@kernel.org>
> >> 
> >> Ard Biesheuvel (5):
> >>   lib/crc: arm64: Drop unnecessary chunking logic from crc64
> >>   lib/crc: arm64: Use existing macros for kernel-mode FPU cflags
> >>   ARM: Add a neon-intrinsics.h header like on arm64
> >>   lib/crc: arm64: Simplify intrinsics implementation
> >>   lib/crc: arm: Enable arm64's NEON intrinsics implementation of crc64
> >
> > I think patches 3 and 4 should be swapped, so it's cleanups first (which
> > make sense regardless of the 32-bit ARM support) and then the 32-bit ARM
> > support.
> >
> 
> Ok.

I can also apply patches 1-2 and 4 now if you want.  Let me know if I
should do that or if a new version is coming.

- Eric

