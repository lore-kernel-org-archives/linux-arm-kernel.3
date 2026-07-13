Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93251C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 13:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gy/cfC9eWSI/4w83EWhj+5TaSyCxLCsDNooQU9g7aCY=; b=3R+w/LjjOwLLf84iXRqVRKjtJC
	r2YEdJrQC9hlRM1zTGNhwqGI/7Aq0Up0hKkSOGEeimqB0V1bWf5orKpxKjBc29UIoRabjYChjwPGk
	HSjAp1/jldbrprc4A+Wxjyj6ktbH68/H6m8d9jTfzlP7j21+M8/lJ9JVQomTdGEj3AdKyCK+UTRmG
	b7Qb67KP9/DimHEiTwoZnXp1z5n+vDnyUkBOt0ZSnQRP4cTQPUCm55mxnt6BYyla/vDOWq2lRoI70
	7Q4qPJkuTjn7VlU49mqRXVaOWYZNRUj1q4BS5qUJ48ivBN0GTTy9zGSBNp/GEgLPK4Fp82Nf+AUos
	2jyGr60g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGfD-00000009OXM-1Eub;
	Mon, 13 Jul 2026 13:25:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGfC-00000009OX5-3VDS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 13:25:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 25126601D9;
	Mon, 13 Jul 2026 13:25:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6341D1F000E9;
	Mon, 13 Jul 2026 13:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783949137;
	bh=Gy/cfC9eWSI/4w83EWhj+5TaSyCxLCsDNooQU9g7aCY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ix3MMdiKvNSDH1QKARVBfMh230lzDNqULteYdKoRLu+kj4TBW0nXjt5LZXKm71YNZ
	 OfzCXxpC1msmJNB9OnvOSolywlOVzc03JCLnUrRt60hAafrXur6pgFwUXFgRtJZaO3
	 VKz3ogHoYS6xtxGcEnRdCnOwD8tpKzBvzPIsYsUI=
Date: Mon, 13 Jul 2026 15:19:34 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: demiobenour@gmail.com, Russell King <linux@armlinux.org.uk>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] drivers/crypto: Mark QCE as BROKEN
Message-ID: <2026071312-prowler-expectant-8294@gregkh>
References: <20260712-qce-broken-v2-1-b2dfff47f7f5@gmail.com>
 <2026071312-uncover-refining-8cac@gregkh>
 <20260713130745.GA2254@quark>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713130745.GA2254@quark>
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

On Mon, Jul 13, 2026 at 09:07:45AM -0400, Eric Biggers wrote:
> On Mon, Jul 13, 2026 at 06:47:07AM +0200, Greg KH wrote:
> > On Sun, Jul 12, 2026 at 05:31:31PM -0400, Demi Marie Obenour via B4 Relay wrote:
> > > From: Demi Marie Obenour <demiobenour@gmail.com>
> > > 
> > > This driver is harmful:
> > > 
> > > - It is much slower than the CPU [1] [2].
> > > - It Has a history of bugs [2] [3].
> > > - It does not have exclusive access to the hardware [4], causing races
> > >   with the secure world.
> > > - It register its implementations with too low a cra_priority for them
> > >   to be actually used [5].
> > > 
> > > Therefore, disable it to ensure that nobody builds it into kernels they
> > > intend to ship.
> > > 
> > > In the future, the driver will be used for processing restricted media
> > > content.  However, the kernel does not currently support this.  Since
> > > the driver will have future uses, allow building it if COMPILE_TEST is
> > > enabled.
> > 
> > Why not just delete it now, and then bring it back when it is needed in
> > the future?  Otherwise this will just trip up the static code checkers
> > who will attempt to "fix" things in it.
> 
> That makes sense to me, but Qualcomm pushed back on deletion:
> https://lore.kernel.org/linux-crypto/20260602-qcom-qce-broken-v1-1-a4ef756089e0@oss.qualcomm.com/
> 
> But I've still not seen any evidence that this driver is useful for
> anything or has any users.  Even Qualcomm seems to be unwilling to make
> such claims; they only claim that the IP is used (i.e., not in Linux)
> and that new features are planned.

Well we don't normally have drivers that are marked as BROKEN just
laying around in the tree these days, especially given that a LLM is
bound to do a drive-by and find lots of issues that people will not
realize doesn't matter given that the code is never actually built.

But hey, it's not my subsystem, if you want to keep it here, fine with
me, just asking :)

thanks,

greg k-h

