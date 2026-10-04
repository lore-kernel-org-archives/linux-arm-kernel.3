Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D6DCCA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 08:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ysCMt+UvNQ2q2GhknBwwA0WGWvISGRLv9Pa410wYVKk=; b=liL68KZZHf3mOcPG9qmo9MfYJA
	JtRGPkOKgTfVeH+90w5laTVnJWVeNXed/v15SYAAhGU2dvOTcbFYuzYO6csWRG0MRHjlz2ylghfNt
	vcjK12Qf7FDqqn2pFDpM4y7BeRmQGMDHrCm7tEmunLXyFmbU6h+By/SUjfBv1xy4cREk81yhfvhZD
	flv/bNgpvt5sd+D/4C+8SVTnRkAwnedZkLAXyoSxaPQYRg/Ooppa8HkVFAii4SGiG2dpqlH26ONZQ
	AzF5OVbj4osmjSFcpm6hbRlf24UJ0VN0ow3+6sL1QUFSsn46Mi0mHRPdQgbqW3EUC70N53pKkhHTu
	AtiGwT+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDHlH-0000000EYvl-1mjf;
	Sun, 04 Oct 2026 08:39:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDHlF-0000000EYvc-3neq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 08:39:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A2F0660052;
	Sun,  4 Oct 2026 08:39:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D4021F000FF;
	Sun,  4 Oct 2026 08:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791103195;
	bh=ysCMt+UvNQ2q2GhknBwwA0WGWvISGRLv9Pa410wYVKk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GFNi2Cqtkhy/RaU9rmxwM7iBW6xCm/wn7jq7nL2pckn4VRSfyIn14WyJpeZd2Mzn0
	 TCJ1w0NekhZRt31aGzOpaFAmXkgMQZ41bYRmI54G1NDjwWuW2l+1byLkKjmQ31tm76
	 yCbJIM4s7kMOyo/g6eg3DS+SJBTs81RZ/NmrIoFEmHn+xgt0XtprMt7CGWuA4VLXYw
	 L5jJqIZFqWN/9HUIfOi/AbuxzPQGmAwOQebUeQsC+uJQa18ublxFRHtEyT6s4+VghR
	 BMRgiqWzV8wRf8eBa/58taSjwFOn/e1Feg8MzYutW90JB9jwiAd1k1QEcM/1g/Y5Of
	 2rWTh9G625YMA==
Date: Sun, 4 Oct 2026 09:39:49 +0100
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/boot: Don't set PMUv3p9 FGT2 bits without PMUv3
Message-ID: <asIQ1ZwUjkmNJbRP@willie-the-truck>
References: <20260930121212.3101361-1-fuad.tabba@linux.dev>
 <ar-xtsSOqwWK9jWQ@willie-the-truck>
 <CA+EHjTzT+2M40GfyxHp6p6OugjoA2BRSkbFK-PMeLGz+qCUM9w@mail.gmail.com>
 <ar-5CnttybD-1ojM@willie-the-truck>
 <ar_E5HUSTxMSRZhL@arm.com>
 <CA+EHjTzemfoX9e8Ppw+AcuUpNND_CipLCUM9xgid1eYXmV=jzg@mail.gmail.com>
 <ar_QOXqCYTGargBe@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar_QOXqCYTGargBe@arm.com>
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

On Fri, Oct 02, 2026 at 04:39:37PM +0100, Catalin Marinas wrote:
> On Fri, Oct 02, 2026 at 04:24:06PM +0100, Fuad Tabba wrote:
> > On Fri, Oct 02, 2026 at 03:51:16PM +0100, Catalin Marinas wrote:
> > > I couldn't figure out the #8 either. I wonder whether it's more readable
> > > as (untested):
> > >
> > >     sub    x1, x1, #ID_AA64DFR0_EL1_PMUVer_V3P9
> > >     cmp    x1, #(ID_AA64DFR0_EL1_PMUVer_IMP_DEF - ID_AA64DFR0_EL1_PMUVer_V3P9)
> > >     b.hs    .Lskip_pmuv3p9_\@    // Skip unless V3P9 <= PMUVer < IMP_DEF
> > 
> > This looks correct to me.
> > 
> > That said, if readability is the goal, I think the plainest is two
> > compares and two branches. It's one more instruction, but this runs
> > once at boot:
> > 
> >       cmp     x1, #ID_AA64DFR0_EL1_PMUVer_IMP_DEF
> >       b.eq    .Lskip_pmuv3p9_\@
> >       cmp     x1, #ID_AA64DFR0_EL1_PMUVer_V3P9
> >       b.lt    .Lskip_pmuv3p9_\@
> > 
> > I used ccmp to match __init_el2_debug in the same file, which does the
> > same NI/IMP_DEF check with a raw #4, as does reset_pmuserenr_el0 in
> > assembler.h (and hyp-entry.S uses the same pattern for HVC64/HVC32).
> 
> I'll leave it to Will. My preference is whatever is more readable, no
> need to optimise another cycle or two here.

Now that Fuad's put me right and given that we already use ccmp in
__init_el2_debug, I think consistency is probably the winner so I'll queue
this as-is.

I wonder if it would be worth having some #defines for some of the common
conditions, so we could avoid having the bare immediates each time in
future? (obviously, that would be a separate cleanup rather than part of
this fix).

Will

