Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8912F53D89
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 19:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GTSDQWcroJYdyZBj3xuXxJA/kq241mELKPO/KJXyqGU=; b=Ql7ijO70RtdjLOcVSES2sQOsSH
	JFuiNCkXIHvANBPG44hMZo/wUVRKrM1Pmz+YqA+kgPK/bvGhiKI2FNcVeDv6k+ez5iPIBkMuKTJCz
	KgMu90H5Ib+iZmv4//+q4j4R/MMt6+wP4IK3s3+RpcGAbSGyCUm2FQWH2FpglEfOEbfPQivHxHSqg
	uJWeYeJHxLUElxCooB/px9WCKjcbu6ly+TRnglbja6GvsbiWG7BLdVMlrhnnjI4FIdy1vA762Pdts
	DdAElonfKXZEMIzkZ9/4+BHSKHhGkeq7Co1PF2r9SOChoDrA235XZ7Ig1xwu8yR6d52kO4ZEP/6+y
	CrxCoZ0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2DPZ-00000004jz7-0GE1;
	Mon, 16 Mar 2026 19:15:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2DPY-00000004jz1-1A2J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 19:15:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4412A60123;
	Mon, 16 Mar 2026 19:15:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4E44C19421;
	Mon, 16 Mar 2026 19:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773688531;
	bh=8Xrt7tVqPzJTL2IdyswvMZ2hYvzOD/82Zlg0vgQjhus=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LEAcfQqkUNP7PTtEPOfPAmDzWZY+CEl+lOzezRk74cf3r+aAllQXMYju3Lgmks4PT
	 f90C1QqyQxRpytNtrbSPtMOlUhLj/PNE6mb6iLrRvb+TOvRphLedoUD0tZdAfyc60D
	 bKoeDYxxJoI9q9ENaKnkg7mhfKJ9886cNISAzSa4k6Xk++gvwmoSnDbO6bsiDvgACk
	 2qFYzBZXNlKbbcK/tpz4deOYGX5f2CGcQWeqlOWxL7JHwyRr2hFhHEH/OeBaqQ/xSA
	 WAo9YK3vrgqWtB5jredQFPz5PvsUQHWvM6ufJQgC0WhR4vkTBoVvLSYg+ecTc8YQ0/
	 kJ0VQ83KgcKdA==
Date: Mon, 16 Mar 2026 12:15:28 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Song Liu <song@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH 14/14] klp-build: Support cross-compilation
Message-ID: <xzezfjfb5uttvmg2divzk3toym3qqvkh5c4w2enamsrku342m3@bogfmdj65wql>
References: <cover.1772681234.git.jpoimboe@kernel.org>
 <697c09ca0a8ffd545aa875e507502f62ad983419.1772681234.git.jpoimboe@kernel.org>
 <CAPhsuW6Cyw_z+9sWt5G1XOp94z8BbwNmsoVE9=iM8WQfkuNDBA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPhsuW6Cyw_z+9sWt5G1XOp94z8BbwNmsoVE9=iM8WQfkuNDBA@mail.gmail.com>
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

On Wed, Mar 11, 2026 at 04:18:40PM -0700, Song Liu wrote:
> On Wed, Mar 4, 2026 at 7:32 PM Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> >
> > Add support for cross-compilation.  The user must export ARCH, and
> > either CROSS_COMPILE or LLVM.
> >
> > Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> > ---
> >  scripts/livepatch/klp-build | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> >
> > diff --git a/scripts/livepatch/klp-build b/scripts/livepatch/klp-build
> > index 809e198a561d..b6c057e2120f 100755
> > --- a/scripts/livepatch/klp-build
> > +++ b/scripts/livepatch/klp-build
> > @@ -404,6 +404,14 @@ validate_patches() {
> >         revert_patches
> >  }
> >
> > +cross_compile_init() {
> > +       if [[ -v LLVM ]]; then
> > +               OBJCOPY=llvm-objcopy
> > +       else
> > +               OBJCOPY="${CROSS_COMPILE:-}objcopy"
> > +       fi
> > +}
> 
> Shall we show a specific warning if
>   - ARCH is set; and
>   - ARCH is not the same as (uname -m); and
>   - neither LLVM nor CROSS_COMPILE is set.

Yeah, I think that would be a good idea.  Will do that for v2.

-- 
Josh

