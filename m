Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A2ECA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 07:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gEGoSrNeNp8LVSAih/jv9NghjCp3BZmPnibUPhtyTQM=; b=t1Ub2RdMVqpysOY/DOGsbsRa9E
	i46ErCWOwUy2EMyc6dZYba57qgOHFPh5JdIeIG+CO190JVM8WWG9M9R+w7GtvHEa7+H/yaRY3q2R0
	48fxqwSw4SL6+HXy9uLTs35v601L0QzKkbF6nxtXoBgFkQ9hjecaMspYDHgulBJ5vf0J3Bsv4er5e
	+CUwmPklXwfM7b/HMnpXhb0UWnZwIMyeVcFfxfkwaAsOg38NQCFI/cwg6DIXBCbUQBNyeEEAvVkP2
	NEMGYXfQvXZaAS+xM/SiBBFUD+2PTyffoIQuWP+N1qxODcxdkWNEA9nzmst2MybBO5L28IkFACLyp
	qS9Ynk1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCB7A-00000007zDD-1sLl;
	Thu, 01 Oct 2026 07:22:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCB78-00000007zCK-2wis
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 07:21:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 00509601FE;
	Thu,  1 Oct 2026 07:21:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C62F91F000FF;
	Thu,  1 Oct 2026 07:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790839317;
	bh=gEGoSrNeNp8LVSAih/jv9NghjCp3BZmPnibUPhtyTQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eqMOrzajN1ZB666iTc/dHkzEvg7SaX7jMlegP5YIoR/fvW63b/5BoKzRBaJiIJCro
	 IuKNcv3UZOi/vmgA4dDme7QsNlOIOwqPWJO7YfBZsTT9zkrvNSfNyXFU0rUHbOi/4J
	 rKCXnRYHRF5DKJYXbTBfYNwAUMQ/fFtkZUbvI7x2x0jT/Bslu12jD9cumBxgSBcNI0
	 Z2YN9goxR0qxMSYEB6MnQ6HvPFSa9rCaLHppDidBaWb0/9jFEy5XMLUhflj3lwfmLV
	 8uApljev46DXP1RmbwRtcC/4xB54trw4BuJGAkjrGBLchcjLxPWDszrizcVFiiPxwD
	 CWBKjicZtf0iQ==
Date: Thu, 1 Oct 2026 08:21:51 +0100
From: Will Deacon <will@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v2 00/21] arm64: Move overflow sp into SP_EL1 and kernel
 sp into SP_EL0
Message-ID: <ar4KD6FTZzw2Wq6w@willie-the-truck>
References: <20260918161407.2300-1-will@kernel.org>
 <CAD++jL=O30YiraMzpe=wd-s-ZHoiMWkXcr3B_qb_dp3TUk2A7g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jL=O30YiraMzpe=wd-s-ZHoiMWkXcr3B_qb_dp3TUk2A7g@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, Mostafa Saleh <smostafa@google.com>, Usama Anjum <usama.anjum@arm.com>, Marc Zyngier <maz@kernel.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Sep 30, 2026 at 11:42:51PM +0200, Linus Walleij wrote:
> On Fri, Sep 18, 2026 at 6:14 PM Will Deacon <will@kernel.org> wrote:
> 
> > This is version two of the kernel stack juggling patches I previously
> > posted here:
> >
> >   https://lore.kernel.org/r/20260907164247.17223-1-will@kernel.org
> >
> > Changes since v1 include:
> >   * Fixed suspend/resume paths to handle the stack pointers properly
> >   * Fixed restoration of ptrauth keys on resume
> >   * Added tags
> 
> Overall I like what I see, but can we split it in two... like first the patches
> up to fixing the overflow handling using SP_EL0 and finalize that?

Yes, that makes sense (and thanks for going through it). The whole thing
is bisectable, so lemme go through the feedback I've got so far and send
out a prefix that we could consider merging as preparatory work.

> Hopefully Usama can test just that part and see if it has a lesser
> performance impact as well.

I'd like to see those numbers at various points during the series, tbh,
so we can rule out any stack-protector changes etc.

Will

