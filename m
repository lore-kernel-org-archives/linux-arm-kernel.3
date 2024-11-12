Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C280D42BAF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 17:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fxjfSbbMPAMCjY8CycHtCSja0X64h4LReUAqSuKGhmE=; b=smfRekD32nYh26TCuXrFG6APON
	+ulXt9QJ7kTUw5joazLRZoWeSJVP5XTKtkvuvvTxjnRb1EcU2wP0mbXS0mJsOlb3J5eKHOxxOWC9o
	bV+qrUnlB7voTOjF9n7Ir8Vh6cVwf0N0HbwaCJYBivKAXT8y1QjG0A0xTJbtfalLTpf0y3ITHuKFK
	Qs/S6dDQkeKpUM3amxBlSFb06gx088EjxScPF2BMRbc/+l4HNVqYbZLKc8RSLsXxZiiHfvz7Id7xP
	w9m/9idJkGnrdVylgRwja+FWrF/ByTLAZ32P+qenN0rGnZV12hf5Oro/X1dK3G92ncfoqfZSagtuF
	pUUUNmcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAuGJ-00000004Gct-2gwj;
	Tue, 12 Nov 2024 17:01:07 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAt3k-00000003zrE-3kzj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 15:44:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CE7DAA41DAE;
	Tue, 12 Nov 2024 15:42:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1C96C4CECD;
	Tue, 12 Nov 2024 15:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731426243;
	bh=RWbFSkRwUfOAIWE/dWO3OuIoKs6Ba942vCIh+QcEl9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W133iUhAXaQgeRjeCR+PpubsmgTOlhZSgfHnmjnT8hpu9zNSB81u2y1ykfLFaySrg
	 y9EPBAt2b8wUHecg30ttVHBr1B6ofqAOpPNMVtDSXUIekKGpV5AOUKE+DzyIHoM22r
	 gNSZIvDodxT05KkgceFEgjw9LwT1SZ02J2nlRWmVtK5BKtZMhigLYvK79NfLMFclnp
	 4kp3SvfBtsa/c7RXQI+8PAa6m+L3odgZHfEai5GcrBWpMWDGLw5ekSuJVINmMXMLOC
	 Q6xuSgIkzzoMddlLNBqvntq+xC9oSIhImRk3ShAgL++O2yDz1MMR5eMq6E7pqpBsws
	 VZ4uoJjBbC4Og==
Date: Tue, 12 Nov 2024 15:43:59 +0000
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: joro@8bytes.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] iommu/arm-smmu: Make instance lookup robust
Message-ID: <20241112154358.GA21479@willie-the-truck>
References: <cover.1731088789.git.robin.murphy@arm.com>
 <9d2ec624a640c421e97334deff537a2e899356c7.1731088789.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d2ec624a640c421e97334deff537a2e899356c7.1731088789.git.robin.murphy@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_074405_025787_53E28E04 
X-CRM114-Status: GOOD (  25.70  )
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

On Fri, Nov 08, 2024 at 06:30:15PM +0000, Robin Murphy wrote:
> Relying on the driver list was a cute idea for minimising the scope of
> our SMMU device lookups, however it turns out to have a subtle flaw. The
> SMMU device only gets added to that list after arm_smmu_device_probe()
> returns success, so there's actually no way the iommu_device_register()
> call from there could ever work as intended, even if it wasn't already
> hampered by the fwspec setup not happening early enough.
> 
> Switch both arm_smmu_get_by_fwnode() implementations to use a platform
> bus lookup instead, which *will* reliably work. Also make sure that we
> don't register SMMUv2 instances until we've fully initialised them, to
> avoid similar consequences of the lookup now finding a device with no
> drvdata. Moving that code is also a perfect excuse to give it a little
> dev_err_probe() tidyup as well.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
> 
> This should in theory replace 229e6ee43d2a ("iommu/arm-smmu: Defer
> probe of clients after smmu device bound"), or at least allow it to be
> reverted going forward.

Let's revert that as part of this series, then?

>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |  4 +--
>  drivers/iommu/arm/arm-smmu/arm-smmu.c       | 31 ++++++++++-----------
>  2 files changed, 16 insertions(+), 19 deletions(-)

[...]

> @@ -2255,6 +2240,18 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>  	arm_smmu_device_reset(smmu);
>  	arm_smmu_test_smr_masks(smmu);
>  
> +	err = iommu_device_sysfs_add(&smmu->iommu, smmu->dev, NULL,
> +				     "smmu.%pa", &smmu->ioaddr);
> +	if (err)
> +		return dev_err_probe(dev, err, "Failed to register iommu in sysfs\n");
> +
> +	err = iommu_device_register(&smmu->iommu, &arm_smmu_ops,
> +				    using_legacy_binding ? NULL : dev);
> +	if (err) {
> +		iommu_device_sysfs_remove(&smmu->iommu);
> +		return dev_err_probe(dev, err, "Failed to register iommu\n");

Why is dev_err_probe() better here? I've not seen it before, so I was
trying to figure out what it does. It mainly looks to be handling
the EPROBE_DEFER case, but after your other changes to use
bus_find_device_by_fwnode() I'm wondering whether we actually hit that
(particularly in iommu_device_sysfs_add())?

I'm not saying there's a problem, just that I'm not sure why
dev_err_probe() is tidier than dev_err().

Will

