Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1788E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 23:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FWNCpfD8cIslUNL3x9us2iTs+Y560LjHdwC0t4LjPMU=; b=IE32ZNT3pQSSm9y1Ml9ZTby+CM
	fHuI2g9fzkpx5wZ4VSAX4xmAtZ/jQ/4Vtih/K8uAZ65epRwUolSlztmNQ/Q05RbmKGqgpXh9CnTmY
	FQLxRua83/aFWoW46IVgzcbfCPLben6TykZlO8FdZTDSmbuZf7uhnV1zPtxe/Dw1gZh/B+x6jdsDd
	eIyrUBTsA9UMNPRVG4FWq3xfO5JK0IhNY7eyKMClKIqc/vxZZuQ/ci3/z1eICeYXLseKlzOgYDgZ2
	Uy/A0g+vfqiH+Cuhpch+3JCtAH9JU0Bz1fFMXGI0vdLFVG5KcL4nsp1KtvP4eKcnyXkLGDwsjh5ua
	L2E1ElXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKmqY-00000009VlN-1Tx3;
	Mon, 09 Dec 2024 23:07:22 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKmpW-00000009VhN-1OYP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 23:06:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D163DA419FC;
	Mon,  9 Dec 2024 23:04:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C540CC4CED1;
	Mon,  9 Dec 2024 23:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733785577;
	bh=nI45IWdza/lGjrHUHY+hfOBTFUpcPsRRCggpavDqgIM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GrF4o+vEfaeGYNO2bHvI3IV6KLYEVodBGu7kt0gaxLLo8lHuQWNiEhP6LEuebe1H/
	 4yAxSbiV0j9ZvAhDNOz+YfyCxTS2AGJFKF6nSFuL2EH6B+Giq7hlIh3uidLs4zQlBT
	 8HiP/jIPx0efODD/6duYQmppKOwjZG0GwVs3g84zbO4m4gtSmwU/c7NuurCecC8I/R
	 PkklROAUDh8/qqAy1jMAwoze0jZnmiZM+YXou9dNpzl6EehN3hJYsiAYgMayKLKlgA
	 AFUVEeeYZyvnW4kb3YY3x6jZ80w90Ue/z+AapUypQO19wEoESSEdGkzBjz6EmwXP8J
	 ZwDwTPuDUSnmA==
Date: Mon, 9 Dec 2024 23:06:12 +0000
From: Will Deacon <will@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>, patches@lists.linux.dev
Subject: Re: [PATCH 3/3] iommu/arm-smmu-v3: Remove domain_alloc_paging()
Message-ID: <20241209230611.GA13790@willie-the-truck>
References: <0-v1-0bb8d5313a27+27b-smmuv3_paging_flags_jgg@nvidia.com>
 <3-v1-0bb8d5313a27+27b-smmuv3_paging_flags_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3-v1-0bb8d5313a27+27b-smmuv3_paging_flags_jgg@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_150618_431618_02EEF6A8 
X-CRM114-Status: GOOD (  10.35  )
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

On Thu, Dec 05, 2024 at 11:43:29AM -0400, Jason Gunthorpe wrote:
> arm_smmu_domain_alloc_paging_flags() with a flags = 0 now does the same
> thing as arm_smmu_domain_alloc_paging(), remove
> arm_smmu_domain_alloc_paging().
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 31 ---------------------
>  1 file changed, 31 deletions(-)

Ha! I was reviewing the previous patch and about to reply asking why we
couldn't just implement arm_smmu_domain_alloc_paging() as a wrapper
around arm_smmu_domain_alloc_paging() with flags of 0.

Good thing I read ahead :)

Will

