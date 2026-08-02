Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E9CCC55171
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 09:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DiXxJ7FfxIMWhg+QWHNrDA/BR14L2eXTYivLTU47jAQ=; b=c2RB2knsJ1KQyPRTDW0V+9/Ru2
	/WnZqQraOQMqK6jyjUH/oz+7zYA0YlMa7Z19alkYGU9u5i3V5ybRUHL3S7IZjJG9tke+mU4ko7/UV
	mZZUCB0+ndG45kSTV+snW5QuO0r0dpOzpsU09DFZQAma4bBOIdAwnErpd25WJkas4eddXa6XgqJfq
	ez6/HWVSJTAcEYnK7l3rOdXAX+vEuWtsynjgGfwZLGo5huhCW/qfnnhDugjCEZeu1Dz28bxypo75P
	y506j7bTTAZQOzmP18Wucb4MFxFAKyrZPfVTqY5PaBcCkpgNWKY1E8+CTFDGCAsew+g/ln45qu5Th
	SaptH6Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqSQI-0000000FVyg-1aiR;
	Sun, 02 Aug 2026 09:23:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqSQH-0000000FVyZ-27Mo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 09:23:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DD3F96013A;
	Sun,  2 Aug 2026 09:23:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB62D1F000E9;
	Sun,  2 Aug 2026 09:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785662634;
	bh=DiXxJ7FfxIMWhg+QWHNrDA/BR14L2eXTYivLTU47jAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kBdnCxCzKEyzCd72YuQeTcXLzo/D5xWX8++RW5ux61t4DNRa0+qQfBrwxatVx92rp
	 J9nGEJp1+cpcNSU9Xq5hHbuo9FYyT/B6Bg975Lrg93ecwafYvOYRf0X2pDoeySHu4f
	 HDaTqpW8or0bLwDw47kL5Uyx6wpSLLaSC3uwlHe8gGIflLSIJyFKVLyX4ST7EzRCjQ
	 CwyyicjWwy/6DRS/O9DOKYNDZTPLd81BQ5ccVuRClHyLsX1PMM6Au5dJLT0X1cQIoU
	 5QoZyeC6KMi7SYk1j0kF5EZqO5nea+1FpFDztxzoSZ3OYwhqufjZGZ9RE5eqW7sFkw
	 jdLEEdDMMenFQ==
Date: Sun, 2 Aug 2026 10:23:48 +0100
From: Will Deacon <will@kernel.org>
To: Kuan-Wei Chiu <visitorckw@gmail.com>, nicolinc@nvidia.com
Cc: joro@8bytes.org, akpm@linux-foundation.org, robin.murphy@arm.com,
	cychu@google.com, hhchung@google.com, amitamishra@google.com,
	marscheng@google.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com
Subject: Re: [PATCH 1/2] iommu/arm-smmu-v3: Replace sort_nonatomic() with
 sort()
Message-ID: <am8MpGR14HAg58Gd@willie-the-truck>
References: <20260730181216.2709088-1-visitorckw@gmail.com>
 <20260730181216.2709088-2-visitorckw@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730181216.2709088-2-visitorckw@gmail.com>
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

On Thu, Jul 30, 2026 at 06:12:15PM +0000, Kuan-Wei Chiu wrote:
> The number of master->num_streams per master device is typically very
> small in practice. Sorting this array takes a very small amount of
> time, so there is no practical risk of triggering a soft lockup that
> would necessitate calling cond_resched() during the sort.
> 
> Replace sort_nonatomic() with the standard sort(). Since this is the
> only remaining in-tree caller of sort_nonatomic(), this change paves
> the way to eventually remove the unused sort_nonatomic() API from the
> core library.
> 
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
> Build-tested only.
> 
> I'm not really familiar with this driver or smmu internals.
> Based on my limited knowledge, master->num_streams should be small
> enough to safely switch from sort_nonatomic() to sort(), but I could be
> wrong. 
> 
> Please review carefully and let me know if there are any cases where
> num_streams could actually be large enough to cause issues.
> 
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index a10affb483a4..dcb6be2df95e 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -4047,9 +4047,9 @@ static int arm_smmu_insert_master(struct arm_smmu_device *smmu,
>  	}
>  
>  	/* Put the ids into order for sorted to_merge/to_unref arrays */
> -	sort_nonatomic(master->streams, master->num_streams,
> -		       sizeof(master->streams[0]), arm_smmu_stream_id_cmp,
> -		       NULL);
> +	sort(master->streams, master->num_streams,
> +	     sizeof(master->streams[0]), arm_smmu_stream_id_cmp,
> +	     NULL);

Makes sense to me. Nicolin, did you choose the nonatomic version
specifically?

Will

