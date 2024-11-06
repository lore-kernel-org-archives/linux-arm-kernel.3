Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7167ED59F53
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 16:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ybeGWPpi/uz9Pri1xMVCFJL6kqeKVqv2bhOd06GKvuY=; b=y6PkaPMBouE7Tso4AIxkipp6Rp
	3sf6dc+bZn7q3xbcccq5VMc6H5hHwBWLzl6rPthyjUPYRInIc1OiVQe+an5HfZHBqsMiT/UiOBuZo
	bgp9z85caCdMoWy3qJzxUHvpFPdq7tQTcsuWIhbWxD8RkhyHEEGnTz5XPYXKhJZAizA7a+gFMViuB
	gAJkJl9+bszlp82aPca50mZ5DPwYedTSva4qiRqMOXh3bqfRkrmtIZ0Xv+riBg5ismkmCNSppKHoQ
	B2iJcqFO4LQ061Qw/0UarrO/7mCXcKO229l/onzA7wWshPY/8ufcDJB1KcK3GLcqAXMIdjiQ0uU/d
	BvnhKM4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8ipo-000000041EU-1Mqd;
	Wed, 06 Nov 2024 16:24:44 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8io4-000000040zn-2tcK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 16:22:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 002EFA43FF3;
	Wed,  6 Nov 2024 16:21:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E12EC4CED5;
	Wed,  6 Nov 2024 16:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730910175;
	bh=fko2d8Xv/YYA+GV+21EM8ZaKw6eqvgyyyHl4/3gL/Gc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vNCduIyLgJ/+J00/AAxsHgY8tBhMN97vlbiNC2skrfGXhUHojPNpgznfYgpVGiCGv
	 8LM72hveI+/iUDqpsvHhCLWX8KT2YyUC0wiNlGIWe69Mb5+PJA4dKZqxkiPsL7L5ic
	 rmQVgoluQYSC1H++FEXNMXdjQNdI/xbEAec21SeHwkK448/T/fMptFOdAn0PRUV6qq
	 8WTKpjAqoARgTcPhp6m6eTgv1Hgn1h93WEReHGmvOU7O/w8PM2d5IKtqyP37KCFeDV
	 3aiqC55DjPNRJ2l3PFjCOPbfkpT1WgFohFWAqwaZS2LJUtxqDRTKrtk1o5Yh3ntO9V
	 Jx2Ohi2F0fPrw==
Date: Wed, 6 Nov 2024 16:22:50 +0000
From: Will Deacon <will@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>, catalin.marinas@arm.com,
	kernel-team@android.com,
	Boris Brezillon <boris.brezillon@collabora.com>,
	dri-devel@lists.freedesktop.org, Liviu Dudau <liviu.dudau@arm.com>,
	patches@lists.linux.dev, Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v3 0/3] Remove split on unmap behavior
Message-ID: <20241106162249.GA14615@willie-the-truck>
References: <0-v3-b3a5b5937f56+7bb-arm_no_split_jgg@nvidia.com>
 <173090505900.4167208.10850898110820689849.b4-ty@kernel.org>
 <20241106161520.GJ35848@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106161520.GJ35848@ziepe.ca>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_082256_810484_B7039BEB 
X-CRM114-Status: GOOD (  21.62  )
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

On Wed, Nov 06, 2024 at 12:15:20PM -0400, Jason Gunthorpe wrote:
> On Wed, Nov 06, 2024 at 03:53:23PM +0000, Will Deacon wrote:
> > On Tue, 05 Nov 2024 14:14:23 -0400, Jason Gunthorpe wrote:
> > > This is the result of the discussion on removing split. We agreed that
> > > split is not required, and no application should ask for anything that
> > > would not unmap a full large IOPTE.
> > > 
> > > Instead of split the two ARM drivers will now WARN_ON and return 0. This
> > > is in contrast to what several other drivers do of removing the whole
> > > IOPTE and returning 0.
> > > 
> > > [...]
> > 
> > Applied to iommu (arm/smmu), thanks!
> > 
> > [1/3] iommu/io-pgtable-arm: Remove split on unmap behavior
> >       https://git.kernel.org/iommu/c/33729a5fc0ca
> > [2/3] iommu/io-pgtable-arm-v7s: Remove split on unmap behavior
> >       https://git.kernel.org/iommu/c/fd50651636fb
> > [3/3] iommu: Add a kdoc to iommu_unmap()
> >       https://git.kernel.org/iommu/c/6ac7dffe7cca
> 
> Thanks, can you add this hunk to fix the W=1 warning?
> 
> --- a/drivers/iommu/io-pgtable-arm-v7s.c
> +++ b/drivers/iommu/io-pgtable-arm-v7s.c
> @@ -820,7 +820,7 @@ static int __init arm_v7s_do_selftests(void)
>                 .pgsize_bitmap = SZ_4K | SZ_64K | SZ_1M | SZ_16M,
>         };
>         unsigned int iova, size;
> -       unsigned int i, loopnr = 0;
> +       unsigned int i;
>         size_t mapped;
>  
>         selftest_running = true;
> @@ -868,7 +868,6 @@ static int __init arm_v7s_do_selftests(void)
>                         return __FAIL(ops);
>  
>                 iova += SZ_16M;
> -               loopnr++;
>         }
>  
>         /* Full unmap */

I think I'd already folded that in, but please check!

Will

