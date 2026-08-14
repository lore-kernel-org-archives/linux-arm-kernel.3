Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BAF6C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 08:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wWjwvjvKbePNx0gNHqW9UR/9cgD08zGtWqMf6sP/Lac=; b=Np1CUsWR1vwqbDG8772TQkSggA
	a1NRMZoMcrdRKtKJcBIxca5+Ob9/SNgwJnpml87btZGuOUx4awuT9Gpil96eGUrRtQn0fIbBXJroZ
	Eqwd7Ds4gzdkQFFgsXPv+/LN6zPjbRf2QCdZKEaY+ty5azOHhTDQTq/UVyY5G2DApvFvTi8F+pO1n
	U/4Qo3pHOXUL+xjMfzQa3oiiMVqfTDfB7QG3Kxn6CJDdF8S45a7+nPVCViFNb0VNoRU2TEcRaj7Fn
	nfuL8G8jh0n97vqJgu5QcS4fSgm4Z3ve/L8eEc7Uqk48kzcsb9BxwdiYucO6phbfpVXBlalQq+zyJ
	//7E+x5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wunRj-00000002IXy-3k9K;
	Fri, 14 Aug 2026 08:39:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wunRj-00000002IXn-12kj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 08:39:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6FE4A600AD;
	Fri, 14 Aug 2026 08:39:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC8D51F00A3A;
	Fri, 14 Aug 2026 08:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786696762;
	bh=wWjwvjvKbePNx0gNHqW9UR/9cgD08zGtWqMf6sP/Lac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SMBdxflzfEbnjJvs+dI9E7KCIpssTpXBiuGSwNu6Mh9A308UAjxnlztClwBaTBsWO
	 P6+xEvHg0JesRpxVO7qZhCkZ5M+lDWfrjTtff+DDwUHJJKB9S5uBYVrLxlEHVL2Nph
	 BLkFHVHyYd8gqLsWVhWZAqjIJD/lBgAuE6GPYgJQe5EfciJ8P7k4wBb6fW2/mFxaPF
	 MGG0Me/NJRaHZ5PoF+ypQXw9CsbA5EazChQJWkoH7++EsgXY/rQbPSCmENkqXkN/qu
	 ZRzF0l09pi9WIylEwKEMXFiEwnH+2ffUwFg7IxEzCW6Bfl+d+7TOk7Hj21efUGY1QJ
	 HXsdKcAueiccQ==
Date: Fri, 14 Aug 2026 09:39:16 +0100
From: Will Deacon <will@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Mostafa Saleh <smostafa@google.com>, iommu@lists.linux.dev,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	David Matlack <dmatlack@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Pranjal Shrivastava <praan@google.com>,
	Samiullah Khawaja <skhawaja@google.com>
Subject: Re: [PATCH v2 3/8] iommu/arm-smmu-v3: Optimize range invalidation
 for latency
Message-ID: <an7UNAA1WlEXG23-@willie-the-truck>
References: <0-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
 <3-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
 <akzm5BoV0rToJ7ij@google.com>
 <20260708001058.GA422027@nvidia.com>
 <an3MSKEj7VhT4WkP@google.com>
 <20260813141320.GF730363@nvidia.com>
 <an3ew9xbnLe1dr5g@google.com>
 <1791d7da-ecd9-4475-8f27-c8857477b442@arm.com>
 <20260813180102.GH730363@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813180102.GH730363@nvidia.com>
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

On Thu, Aug 13, 2026 at 03:01:02PM -0300, Jason Gunthorpe wrote:
> On Thu, Aug 13, 2026 at 06:25:59PM +0100, Robin Murphy wrote:
> > > > Yes, those exist, but again, they are already facing these problems if
> > > > running without RIL.
> > > 
> > > Yes, but my point is that those typically support RIL and that change
> > > regresses them.
> > 
> > Not even that - the main concern is over-invalidation of adjacent in-use
> > buffers due to rounding up; non-RIL absolutely does not have that issue and
> > never has.
> 
> It certainly does! SMMUv3 got an invalidate all path a while back
> because doing single for >> MB's of IOVA effectively soft lockups the
> system - especially with SVA.
> 
> We set the cut off at ~2M which matches when the CPU goes to
> invalidate all. That's 512 commands max of single TBLIs before we just
> dump the entire TLB. That's a huge over invalidation.
> 
> > Note that with RIL, even precise invalidation should only actually need at
> > most two commands (excepting absurd off-the-scale sizes) - the trick is to
> > consider that they can overlap.
> 
> Oh that's really interesting, I never thought about doing it like
> that. It is way better than the algorithm that is there right now.
> 
> Let me try it, it seems like it would make everyone happy.

I was planning to reply yesterday saying something like "Robin previously
mentioned this one neat trick...", but I didn't get round to it. So yeah,
if we can implement that, I think we can have one range invalidation
algorithm to rule them all.

Will

