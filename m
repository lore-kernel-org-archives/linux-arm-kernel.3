Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F59C9EC97
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 15:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=992kLV1rcSjZd+c9WxIk+C0mlZRjyskv49xpfa8dA7U=; b=AGeefcWtWCeS65wN1BZhrQCBVh
	7hBiUK4R3y6iXC9MqMAq2SblT8mSn+alsTNiayaoWuZlsZy4U33SdoxuJNrQ/FYHUytcCPo4vDYqY
	8WT3Cs6YLoMyltoVSxI8nJEKk8MgLPU/7q+cYOrc4cqQbuykN294QErXjC+zk5arNO/6q+u+us6Y4
	ocZPM5MnbLZBTT/lwvLrAfKOkrdzmk0BXyiZhdGPEbzdTNkh/lOsMc6QdLaFDXP3No6bM0V0c+3Xh
	DLDqTHxssHAHd0FJQANRbnhgH/XSFe0b0F6IQFobAKVgqd3fgKYro25+o7SW4Rrkt7QXYU6VCyOeN
	2e8oQ5cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfKEh-00000005fmd-0KXe;
	Mon, 12 Jan 2026 15:53:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfKEf-00000005fmV-2haf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 15:53:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E78536000A;
	Mon, 12 Jan 2026 15:53:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7459EC16AAE;
	Mon, 12 Jan 2026 15:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768233220;
	bh=Iwz2FZB7Ir4MOz88EBGnyMaOkJY3tnWlW7Bxq070cus=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JxixVHp6QGt172wu0poHq5+oMZ2CU8nIbuhotT0mjSZb5/+6YJLBIk4TFWsb3ePV0
	 5XjNL4IkcVx+tTURrRqMxqNJ19Sl1sjJGjk6ixKSDtR3nj0T3uPLSXGB+xwD/142C4
	 nPMkQeQHmt+0dCAbBHuKnlQqiM661a1YmpoW1whGkqxGIAzhfTJ5r529xGeQJJ3k+Y
	 SG5iCe6tsz1q2UB3Nm9X5i72LF6+R6e/NwKDCZAEQ0nK6FraXkn2KkZuM1QZSkq3h5
	 XlpFtV2LXj2J5AH+QqlkxoWCbd4sOlpF1kdq1W/7ANqjOqWuIhvZTaBnm67ai+BLnx
	 34gcMQZnsHKgw==
Date: Mon, 12 Jan 2026 15:53:29 +0000
From: Will Deacon <will@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, robin.murphy@arm.com,
	joro@8bytes.org, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	skolothumtho@nvidia.com, praan@google.com,
	xueshuai@linux.alibaba.com, smostafa@google.com
Subject: Re: [PATCH rc v5 1/4] iommu/arm-smmu-v3: Add update_safe bits to fix
 STE update sequence
Message-ID: <aWUY-f3kvM94z4qh@willie-the-truck>
References: <cover.1766093909.git.nicolinc@nvidia.com>
 <58f5af553fa7c3b5fd16f1eb13a81ae428f85678.1766093909.git.nicolinc@nvidia.com>
 <aV7OBrH-TDiGRblt@willie-the-truck>
 <20260108003646.GA537728@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108003646.GA537728@nvidia.com>
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

On Wed, Jan 07, 2026 at 08:36:46PM -0400, Jason Gunthorpe wrote:
> On Wed, Jan 07, 2026 at 09:20:06PM +0000, Will Deacon wrote:
> > >  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  2 ++
> > >  .../iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c  | 18 ++++++++++---
> > >  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 27 ++++++++++++++-----
> > >  3 files changed, 37 insertions(+), 10 deletions(-)
> > 
> > Hmm. So this appears to ignore the safe bits entirely, whereas the
> > rationale for the change is that going from {MEV,EATS} disabled to
> > enabled is safe (which I agree with). 
> 
> The argument was it doesn't matter for either direction be it disabled
> to enabled or vice versa, see my reply to Mustfa in the v4 posting:
> 
> https://lore.kernel.org/all/20251218180129.GA254720@nvidia.com/

It would be good to include some of that rationale in the comment and
commit message for patch 3, as at the moment it only talks about the
change in one direction.

I'm also still not convinced that this is generally safe, even if it
works within what Linux currently does. For example, if somebody tries
to disable S2S and enable ATS at the same time, couldn't you transiently
get an illegal STE?

Will

