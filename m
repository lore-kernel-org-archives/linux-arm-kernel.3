Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E29FED9F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 18:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yX1H+yli7F6QnDpOVa3ZsI/pCt/3rOvqjsXfS0uWx54=; b=uzqWwM0+ZHogUMzeCbh5N9Kjj/
	b7Yodvj2PD75exI/FCTHZnbJNIUhFHJtQqelmAWuQWjBt82vPoKZ4LFkwXw5kLkX/aiLFhjRTA4V9
	gIfYJ9O2QgyW29fjLs4A+6U8+tJzOfTMCPhf7uqB79Ski2gyeANJQhCLpabIO1nQwBcvQsAdPPHbn
	aY8UOT7ghWcAyq7ogVEgrlSW6xTI6nQjOQo7IwWw82vcTKhxq34DHUmEWB/X812eA74QUDtHJCl6W
	yGNEmKM79gqJFW4keelgv5q5hyMF1I/ZcaIIo+JQcAhej+IC6CaXIXtxrHFNcBKEdPoBTnOYbTKPX
	PV8m+8nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ZYG-000000075ej-249I;
	Tue, 17 Mar 2026 18:54:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ZYD-000000075eL-0XaR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 18:53:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 53F7644521;
	Tue, 17 Mar 2026 18:53:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4C21C4CEF7;
	Tue, 17 Mar 2026 18:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773773636;
	bh=jNR9DAFkcObKj+OM+bo14Lk9Gz1PHKQn1T7rQ6OiOJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FC+l/gjaFn+93bJCK46Y0q/6rRibEoUlvSL/UMR5T8Za/4IK41Xxik+6YKre8abFp
	 QSFj7mMRmp2LB1bWOm1sH/rPoyCmvrWcdvoZaAXqFncS7J4rP6ZHNm7baCh3NoQvx4
	 8uiGd2cBdgQPYmMubqHBTwuTf24frFIo62fbcH+TwZ4y0slrp3HWFt0zHLtzw36VwS
	 wYjPKzo7yQJoY4YVnAoYzWwPYFeKOluURi/Ayjk7uMTn34k16x2wJSDTJFfcbvrghC
	 NJ5YWupohRWV4a2m9tLy3RuLhY9hG1yoMXhYg0CE+7NDC+wLa9i/WLd/SoVh/FRiqb
	 +z8y3PcMNlUTA==
Date: Tue, 17 Mar 2026 11:53:52 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Song Liu <song@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH 14/14] klp-build: Support cross-compilation
Message-ID: <74fwwcyggggcnh7pj2i7nhglhagltkqeth4ykhtqs4izx4dtig@lzyai66d2vn6>
References: <cover.1772681234.git.jpoimboe@kernel.org>
 <697c09ca0a8ffd545aa875e507502f62ad983419.1772681234.git.jpoimboe@kernel.org>
 <CAPhsuW6Cyw_z+9sWt5G1XOp94z8BbwNmsoVE9=iM8WQfkuNDBA@mail.gmail.com>
 <xzezfjfb5uttvmg2divzk3toym3qqvkh5c4w2enamsrku342m3@bogfmdj65wql>
 <e2yxamlxwif5kxur7thr4x7yp7ppbde6awzm6vomdfkg6auxeq@aaahh3aclf2e>
 <CAPhsuW6SsDTDCJ8-w9OP3FeS2d0Rj6jgP7gYbzD3pZhAmK5nAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPhsuW6SsDTDCJ8-w9OP3FeS2d0Rj6jgP7gYbzD3pZhAmK5nAg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_115357_191591_90FFF4C3 
X-CRM114-Status: GOOD (  23.11  )
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

On Tue, Mar 17, 2026 at 11:21:43AM -0700, Song Liu wrote:
> On Tue, Mar 17, 2026 at 10:52 AM Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> [...]
> > >
> > > Yeah, I think that would be a good idea.  Will do that for v2.
> >
> > So, in general ARCH is complicated.  For example:
> >
> >  - ARCH=arm64 would never match "uname -m" (aarch64)
> >  - ARCH=i386 would use the same gcc binary (no cross-compiler needed)
> >  - I'm sure there are many other edge cases...
> 
> Agreed. I haven't worked with i386 for a long time, but I did notice
> the arm64 vs. aarch64 difference.
> 
> > Instead of a manual error, it may be simpler to just let the build fail
> > naturally if the user doesn't set the right ARCH.
> >
> > Though, I think the check can be improved slightly, as ARCH is a
> > reasonably good indicator that cross-compiling is happening.  So I can
> > at least add an ARCH check at the beginning like so?
> >
> > cross_compile_init() {
> >         if [[ ! -v ARCH ]]; then
> >                 OBJCOPY=objcopy
> >                 return 0
> >         fi
> >
> >         if [[ -v LLVM ]]; then
> >                 OBJCOPY=llvm-objcopy
> >         else
> >                 OBJCOPY="${CROSS_COMPILE:-}objcopy"
> >         fi
> > }
> 
> Do we need ARCH when CROSS_COMPILE is set? I was
> under the impression that CROSS_COMPILE doesn't require
> ARCH.

If CROSS_COMPILE is used without ARCH, it will just try to use the host
arch.  I'm not sure if that's considered cross-compiling?   I suppose it
should use the CROSS_COMPILE version of objcopy in that case?  Though in
practice it probably doesn't matter.

I guess the original version of the function is probably fine and we
don't need to complicate matters.

-- 
Josh

