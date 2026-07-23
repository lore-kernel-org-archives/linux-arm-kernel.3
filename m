Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648E4C531F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 17:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mhvakF01QTKOFvoRu/kiJy2zPqdwWYyqEZLX74sbO6k=; b=zcZHvXuV5cZnlPU7TNAJwyOnq2
	V3iJO9NUDx0KyPi444P5SanwOKXoUYifprAMmnUKXvE+AAvP0fRBmpNlyBUnowZ5h4z88GmBXrqca
	/GRdZrNSZCRXDWYKALXynZfPkFm+9DixLinroM0a3L/vof7/+7c7DH+uOc6R4Z5T99ZakBLGQPsb3
	bDNvyrbiaeaJRd+1ewiolujneXWKbtVfNT6VOVyA8RyJPbwFpPglKaAcs8KNjNoEEWVN6FWw20Nvq
	KMSkNw48wbyfHqQ0jt/z8l36ipSxagb0SFEmeT8G2Pike55/IAhBUqLB4Pfbj9fNfpQfEg+MMoQCk
	GQRGgScg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmx6i-0000000EoFO-13gp;
	Thu, 23 Jul 2026 17:21:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmx6h-0000000EoF5-0U7Y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 17:21:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 401C5600AD;
	Thu, 23 Jul 2026 17:21:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA73D1F000E9;
	Thu, 23 Jul 2026 17:21:13 +0000 (UTC)
Date: Thu, 23 Jul 2026 10:21:07 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jakub Raczynski <j.raczynski@samsung.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net v3 0/2] net/stmmac: Secure against failures of DMA
 memory allocation
Message-ID: <20260723102107.08464361@kernel.org>
In-Reply-To: <amIySsYvx+ZhOXzm@AMDC4622.eu.corp.samsungelectronics.net>
References: <CGME20260715123609eucas1p276498c4701060ffbb6789cb096696a31@eucas1p2.samsung.com>
	<20260715123602.51950-1-j.raczynski@samsung.com>
	<20260723072352.6db4df7f@kernel.org>
	<amIySsYvx+ZhOXzm@AMDC4622.eu.corp.samsungelectronics.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 23 Jul 2026 17:24:58 +0200 Jakub Raczynski wrote:
> On Thu, Jul 23, 2026 at 07:23:52AM -0700, Jakub Kicinski wrote:
> > On Wed, 15 Jul 2026 14:36:00 +0200 Jakub Raczynski wrote:  
> > > This series fixing two issues related to fails of
> > > __alloc_dma_rx_desc_resources(). Original issue from 1st patch is related to
> > > page_pool that has happened in testing env, while second was requested by
> > > Sashiko to have similar change for DMA allocation. 
> > > To have complete fix for all failures of __alloc_dma_rx_desc_resources(),
> > > merge two fixes into series.  
> > 
> > Clashiko is not impressed by the second patch.
> > Is it possible to avoid calling the functions in semi-consistent state?  
> 
> Again clash against AI lost, damn you AI. Although I cannot say its wrong.
> My bad I didn't really respond to it sooner, especially 13 character Fixes tag,
> wonder how that slipped past internal review...
> 
> Now being serious, regarding calling in semi-consistent, it is matter of
> symmetry between open/close or alloc/dealloc paths.
> Since __alloc_dma_{tx/rx}_desc_resources does full initialization,
> __free_dma_{tx/rx}_desc_resources should be able to handle whole cycle.
> So if __alloc_ failed in the middle, __free_ should handle that state,
> whatever it might be.
> 
> One thing I will say that AI review is not even about patches themselves,
> but about
> "If the intent is to make __free_dma_rx_desc_resources() safe to
> run twice on the same queue, [...]",
> which is the point, although original patch was generated by
> real issue that occured. Other issues it reports are valid but did not
> trigger.
> 
> So AI is right that everything should be handled in one patchset when
> this is touched, but funnily it didn't report it previous review.
> Will send another version that will fix all these issues/complains
> at some point.

As you fix these issues it'd be great to step back and figure out what
model we want to follow. Personally I find the "idempotent cleanup"
to be inferior, it's better to know what state we're in. Failing that
a single indicator of state being initialized is usually fine. Having
field-by-field safeties is a recipe for 1000 fixes. IOW stmmac is
terribly architected, so we should figure out the end goal first, 
and target that, instead of addressing issues one by one.

