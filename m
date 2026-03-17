Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 190A9FED9EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 17:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U9MP2hz2cPNv2UAixyquXMfTslcHQK4i+FKG5dyB4xc=; b=KUlPcPgyENCu4y6tEklJliJCps
	vjcoXdLvVjaDut699Pqoxqnh2pTjVdC0SKKt+vACqi/YFIoFvr/ig2Dksv6JBvVRbxtMd/9XjM3Nq
	YNIJtD4Lg1f0PUKQeWyN7hNQqIv6/ou+22N8uf50cm3We/CobvYz/7carYJsP/QkgrRz6bVdUTRpU
	RIv5K6ZcrCtGS/VcPsmthANYG1r9cdnDavqltSPcu2IaDrT3+qjV/H+PI5zkUS+NTndW206skN8iy
	AYtgSLj0d4fCrlh/iwHqRr/YGymP2zTEZbSLmoKslRtOq+cI+YMFEH24hUxpGzqSKjc17hmNdmwiS
	i1pZ7dYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Yan-00000006yrA-22gw;
	Tue, 17 Mar 2026 17:52:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Yal-00000006yqo-3jLY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 17:52:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 94FEE44369;
	Tue, 17 Mar 2026 17:52:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5666DC4CEF7;
	Tue, 17 Mar 2026 17:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773769950;
	bh=vnGr8s5RTA6GtfpXH520e+NXEN9z4J7oZSX4YLudI8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CQo/LiJ1zwJxaV+OLsDgcEqYRC4C4LsYLNRqCnIzfrMHc24K+e7hJlnutkptnS7IV
	 LZTFUs9XKCIaLUCmkX5YjQtJwYwrI8GvS3u3rFgsWVHS55fp4bOZ+SpMDL7swWCaL8
	 DDOJA0f8Ux7H0pZIhCEVLB+/6hGKNll0xMc/RJxCg3GL+NuHtr0Mm28xosXhkqLJ9w
	 nWP6LQLT8l2zXi4qXQB9I5WO+uc7+FKSndUX0XLHz1Pciie2cItRPDkiSGNd8RmtoZ
	 ZyzaikxyF2r2prfhp57lrYHdpr9JzHv8acOjJpNglZ0LTwn1izucqYKwRqXIUjyNUe
	 Ta6uKA4i6QbMg==
Date: Tue, 17 Mar 2026 10:52:27 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Song Liu <song@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH 14/14] klp-build: Support cross-compilation
Message-ID: <e2yxamlxwif5kxur7thr4x7yp7ppbde6awzm6vomdfkg6auxeq@aaahh3aclf2e>
References: <cover.1772681234.git.jpoimboe@kernel.org>
 <697c09ca0a8ffd545aa875e507502f62ad983419.1772681234.git.jpoimboe@kernel.org>
 <CAPhsuW6Cyw_z+9sWt5G1XOp94z8BbwNmsoVE9=iM8WQfkuNDBA@mail.gmail.com>
 <xzezfjfb5uttvmg2divzk3toym3qqvkh5c4w2enamsrku342m3@bogfmdj65wql>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <xzezfjfb5uttvmg2divzk3toym3qqvkh5c4w2enamsrku342m3@bogfmdj65wql>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_105231_979161_8580099A 
X-CRM114-Status: GOOD (  23.98  )
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

On Mon, Mar 16, 2026 at 12:15:28PM -0700, Josh Poimboeuf wrote:
> On Wed, Mar 11, 2026 at 04:18:40PM -0700, Song Liu wrote:
> > On Wed, Mar 4, 2026 at 7:32 PM Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> > >
> > > Add support for cross-compilation.  The user must export ARCH, and
> > > either CROSS_COMPILE or LLVM.
> > >
> > > Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> > > ---
> > >  scripts/livepatch/klp-build | 11 ++++++++++-
> > >  1 file changed, 10 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/scripts/livepatch/klp-build b/scripts/livepatch/klp-build
> > > index 809e198a561d..b6c057e2120f 100755
> > > --- a/scripts/livepatch/klp-build
> > > +++ b/scripts/livepatch/klp-build
> > > @@ -404,6 +404,14 @@ validate_patches() {
> > >         revert_patches
> > >  }
> > >
> > > +cross_compile_init() {
> > > +       if [[ -v LLVM ]]; then
> > > +               OBJCOPY=llvm-objcopy
> > > +       else
> > > +               OBJCOPY="${CROSS_COMPILE:-}objcopy"
> > > +       fi
> > > +}
> > 
> > Shall we show a specific warning if
> >   - ARCH is set; and
> >   - ARCH is not the same as (uname -m); and
> >   - neither LLVM nor CROSS_COMPILE is set.
> 
> Yeah, I think that would be a good idea.  Will do that for v2.

So, in general ARCH is complicated.  For example:

 - ARCH=arm64 would never match "uname -m" (aarch64)
 - ARCH=i386 would use the same gcc binary (no cross-compiler needed)
 - I'm sure there are many other edge cases...

Instead of a manual error, it may be simpler to just let the build fail
naturally if the user doesn't set the right ARCH.

Though, I think the check can be improved slightly, as ARCH is a
reasonably good indicator that cross-compiling is happening.  So I can
at least add an ARCH check at the beginning like so?

cross_compile_init() {
	if [[ ! -v ARCH ]]; then
		OBJCOPY=objcopy
		return 0
	fi

	if [[ -v LLVM ]]; then
		OBJCOPY=llvm-objcopy
	else
		OBJCOPY="${CROSS_COMPILE:-}objcopy"
	fi
}

-- 
Josh

