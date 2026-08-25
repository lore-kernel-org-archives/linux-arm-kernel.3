Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF76FC61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 20:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+UVWWCrS7Z9braqaBJu/SYOmHoIkAvTjDiiMr9VZ9LM=; b=LkvnLtflzhOeZiDGfBy5F0OXmz
	JNR1yFL2sX//9x7fMfAWiBAb9c4K4s+6JSyHoNlx5EkznQyOVJ9+yFcdVGCcHWuycuxn9QFXB6bLm
	AWpUzh2dhJgfqhvWnqPabzK7aQA05x3b9AhpVcYl1uAO4pRXFUSOL38EjrWeyOsOk3Wc3dDAh3O2C
	xQQNsaq1UGW4O9Zt+U6M0nY23udyMKxgBv4U5VRsGpu47Xcd+lLTmnGGy4ujQ9E4HlIjI0BWv3keM
	BRpmm0/N+va0YFj897L7GmAstrVW3ou0Ki6F8asNajU3GhixoYiY5CMgV++xs1SI4mEqkS3WEd46H
	auEQQhgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyxS9-00000001Q2o-1kVS;
	Tue, 25 Aug 2026 20:09:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyxS8-00000001Q2e-1cok
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 20:09:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 38C7E600C4;
	Tue, 25 Aug 2026 20:08:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E03DB1F000E9;
	Tue, 25 Aug 2026 20:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787688538;
	bh=+UVWWCrS7Z9braqaBJu/SYOmHoIkAvTjDiiMr9VZ9LM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DnehS4KdP5yK86rMhajEVzIQvBNNdbmBiJg3g6QnHVqw+eqdnA/sY545wKraWnXQ/
	 IF3fqIU9TDgTooGgn7Zxui/IAr1cgLsf3sh1CnAwyl+sxMtqq9V4hPvwIW+VPKSx4y
	 dEgpQ5DELdeZHcuOZWyE9N7xcZ4yGrhDpHJpCNCAJcfcH7pcIbMVHWiPBYo0MInUyW
	 6JQ+GjGqxXgeH+sWC2j0h1qwZ3/bNowqs9SaFMeLPZ0sYRYhQUH+yNwSssMjh22rDn
	 SGM0EdFarsrTBdYf4C4hCEMH7QTvIgQsWdADbvwHHSsF2mkURwfCFhW6R2/CTvi4Fj
	 v1JAZ3AC0nT9A==
Date: Tue, 25 Aug 2026 16:08:56 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, will@kernel.org, 
	robin.murphy@arm.com, joro@8bytes.org, praan@google.com, kevin.tian@intel.com, 
	smostafa@google.com, linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, jamien@nvidia.com
Subject: Re: [PATCH v9 09/12] iommu/arm-smmu-v3-kdump: Implement
 is_attach_deferred()
Message-ID: <20260825-jovial-uncovered-dogfish-430879@meerkat>
References: <cover.1784663183.git.nicolinc@nvidia.com>
 <eb795edf2598c6df57122cd5951393ac1a860bcd.1784663184.git.nicolinc@nvidia.com>
 <178735412602.18212.5709943748630447883.b4-review@b4>
 <aonng6MDJ/s/MRuE@nvidia.com>
 <20260822200226.GO244917@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260822200226.GO244917@nvidia.com>
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

On Sat, Aug 22, 2026 at 05:02:26PM -0300, Jason Gunthorpe wrote:
> > 
> > This is for !CONFIG_CRASH_DUMP case. I think we need it.
> 
> Hmm, I am testing b4 review.. I had written
> 
> #define arm_smmu_kdump_is_attach_deferred NULL
> 
> ?
> 
> And I now realize b4 review drops lines starting with a #

I don't think that's intended -- I think the goal was to only drop leading
lines starting with # until the first non-# line is reached (i.e. the header).
I'll mark it as a bug.

-K

