Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7387DCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 19:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PVL1fgCYNQNbfGvmIgyZvmai4Ca8jPd8nUCpL+b5j+w=; b=AHmkZjcMlHY2DDAS7aRyENfCSb
	d+QfPMjEr4/q+vk2gO9ma0oIc4a29JMuEPXKYQxE7H28qi5oV1XV6u1A2dZJEN74pmJd7DfEA537U
	mXb8WByZY7mKptQbHqfOqTxFSIVzhn+l44vRt5YBP0Ur9oss5Vl6Kx6HvhRNrEGUsIQpfjINX56wV
	G6QCzfGGqHawIjhqlUNPdWKJ6q2rUNjJq3T9Jcnli0CcT9q46hlQP3qclM+rOV0juZrC4Fr0VOXQ3
	O8o3ktrwTj4xkGx6azLgHEIfDHoBp20sRgdHLUXa9UjQi/QTNYTQeFHey16NoCo9NOhATNXSz+j2N
	+ud/KzBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT35i-00000008C1S-0aIQ;
	Fri, 29 May 2026 19:41:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT35f-00000008C1K-439U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 19:41:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 07402601DE;
	Fri, 29 May 2026 19:41:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 401231F00893;
	Fri, 29 May 2026 19:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780083714;
	bh=PVL1fgCYNQNbfGvmIgyZvmai4Ca8jPd8nUCpL+b5j+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N82RkD+Au9NUqfH6VFKACTfa6rn1e+dWFN6H5xhDd/jKzekSGBC6gNYAGBB7OU7u/
	 +8PDk4DWSRNaMXdxlHS1uWKZfIch955zUSnFxgUD8dkD7bjVrw33XXmm5zuJVYTPQe
	 DNF6XRHwfb1QI5senSPQoeRcQaJt2W4vVxOuCF9tLgV0qKi1BqJMJkaPzXCIgwrpXY
	 Sk7AAZbdLFYgyhFbbvHRDtNObBcdnkLt4GVbT15/tRk7Pf4SfQ0vo3FTvF2R8bKSbu
	 P2gq0K0o9oWXNXNZRdEuarQYLzcP72lsEAKpxf8cTypKpRqTfaP7sLLaN91ojVql2t
	 C6CXrYJEjcgeA==
Date: Fri, 29 May 2026 12:41:52 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Corentin Labbe <clabbe.montjoie@gmail.com>
Cc: Tianchu Chen <tianchu.chen@linux.dev>, herbert@gondor.apana.org.au,
	davem@davemloft.net, wens@kernel.org, jernej.skrabec@gmail.com,
	samuel@sholland.org, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] crypto: sun4i-ss - clamp PRNG seed length to prevent
 heap overflow
Message-ID: <20260529194152.GA3628@quark>
References: <af749a8447bd7f0e9dd26ca6c87e9c6afecb09d9@linux.dev>
 <4d4407c05835a50413fa1e974e3aa3f4abfe2d5b@linux.dev>
 <20260529161057.GA2706@sol>
 <ahnIbpBLyn5z_siT@Red>
 <20260529173341.GA566433@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260529173341.GA566433@google.com>
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

On Fri, May 29, 2026 at 05:33:41PM +0000, Eric Biggers wrote:
> On Fri, May 29, 2026 at 07:10:06PM +0200, Corentin Labbe wrote:
> > Le Fri, May 29, 2026 at 09:10:57AM -0700, Eric Biggers a écrit :
> > > On Fri, May 29, 2026 at 08:08:01AM +0000, Tianchu Chen wrote:
> > > > From: Tianchu Chen <flynnnchen@tencent.com>
> > > > 
> > > > sun4i_ss_prng_seed() copies the user-supplied seed into ss->seed
> > > > using the user-provided length with no bounds check. The crypto core
> > > > does not enforce slen <= seedsize before calling into the driver, so a
> > > > userspace caller via AF_ALG setsockopt(ALG_SET_KEY) can pass up to
> > > > sysctl_optmem_max bytes, overflowing the fixed-size buffer and
> > > > corrupting adjacent heap memory.
> > > > 
> > > > Clamp the copy length to the buffer size, matching the approach used by
> > > > loongson-rng for oversized seeds.
> > > > 
> > > > Discovered by Atuin - Automated Vulnerability Discovery Engine.
> > > > 
> > > > Fixes: 6298e948215f ("crypto: sunxi-ss - Add Allwinner Security System crypto accelerator")
> > > > Cc: stable@vger.kernel.org
> > > > Signed-off-by: Tianchu Chen <flynnnchen@tencent.com>
> > > > ---
> > > > v2: Silently clamp oversized seeds with min_t instead of returning
> > > >     -EINVAL (Herbert Xu).
> > > 
> > > sun4i-ss-prng.c is useless, is still broken, and should just be deleted.
> > 
> > Hello
> > 
> > useless ? clearly no, it helped a lot on devices where it is.
> 
> The only way this code is reachable is via "rng" algorithm type in
> AF_ALG, which is almost never used.  Everyone just uses the regular
> Linux RNG (/dev/random etc) instead, as they should.
> 
> In fact, anyone were to accidentally use this it would be a security
> vulnerability, seeing as sun4i_ss_prng_generate() doesn't actually fill
> in all the bytes that were requested.  It also doesn't wait for the FIFO
> to be ready when reading data from it.
> 
> Is it possible that there's a misunderstanding here and you think this
> provides entropy to the regular Linux RNG?  It doesn't.  hwrng does
> that, crypto_rng does not.
> 
> The correct fix is to mark CRYPTO_DEV_SUN8I_CE_PRNG as BROKEN or remove
> it entirely.  Doing otherwise is not responsible.

Looking into it a bit more, just removing CRYPTO_DEV_SUN4I_SS_PRNG is
clearly the way to go.  This patch does it:
https://lore.kernel.org/linux-crypto/20260529193648.18172-1-ebiggers@kernel.org

- Eric

