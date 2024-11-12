Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A970D42BA2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 15:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Ua92oaFR9BRPF4/PV2PVTFwSA21WaO64eI6cKbfFbc=; b=iQCuvI80DT2E6jaMAnDibNOQ1x
	qNLL8ThLRNAaimaQvkRz3AlGCfeVmw+DbPQexorMhiMTtpulNWrr+FQiIgvuWk8HAJoJzZq7Y7UWI
	h2cwuawD9ta9OOLFh9IlMTtXe+R+JXHIdJoS0LtirI0rhhKzepq3C5j1O4PmQKMeSjFaux8XNlqCD
	rKiFnupl52QTZV2Iuuc8/TJk9vGyR1Pl1OIea68TAfNq9+DkjzJwlI2/tkvzkNUvHSswIDn0jSziV
	Tt1T+5OTyieoDj9XRnoPo6ZQ0ayPUgfVdR1zxkdAusZhrMD4j8C9bVKLx08MoY31SeITTeOgfXZBe
	3VaWlDLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtGd-0000000422Y-3dMw;
	Tue, 12 Nov 2024 15:57:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtEp-000000041gn-2FJA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 15:55:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3D6B15C54AD;
	Tue, 12 Nov 2024 15:54:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67D80C4CECD;
	Tue, 12 Nov 2024 15:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731426930;
	bh=A5OSnOKgQ1/NZdqMpuahVt5qjI55hR/PC1GnAzNRwg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PAWIhXjDNSI58YrPLUOJqJGfoI4EDqMT4XT65E18FXvAr962bVO4vWDzbyYtHGWfi
	 wfCWkBb0cDr9RzS8MPmPzfU/qLcquwJtUTZwVE/7AJBlwtwRfRWrwgKQlvoi3wMiBX
	 MeSp2eFyOGh447VdPPkuynbyGym2wQwTLg5jYGJ7h6y5SUbZ31oIoNZkYSH/NCNuWW
	 mqYWCTqeNOQxZMgvMGEmcdabTG3eU6Yb1Wlmvl8ADfF0996Nb4UaBWAP/TjOpYKqtX
	 xz4F1ZvBJZG7llT3drrSHHQ74MZNORV/B1uU9heXqxVkwEqJ3+/XM6thEhVhVM66I8
	 PBwdakLTcrEPQ==
Date: Tue, 12 Nov 2024 15:55:26 +0000
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: joro@8bytes.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] iommu/arm-smmu-v3: Clean up iopf queue on probe
 failure
Message-ID: <20241112155525.GB21479@willie-the-truck>
References: <cover.1731088789.git.robin.murphy@arm.com>
 <161cf3bfde2993cc29e82589df947ff23fb82845.1731088789.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <161cf3bfde2993cc29e82589df947ff23fb82845.1731088789.git.robin.murphy@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_075531_708531_41A6DEE6 
X-CRM114-Status: GOOD (  21.78  )
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

On Fri, Nov 08, 2024 at 06:30:16PM +0000, Robin Murphy wrote:
> kmemleak noticed that the iopf queue allocated deep down within
> arm_smmu_init_structures() can be leaked by a subsequent error return
> from arm_smmu_device_probe(). Hardly a big deal when probe failure
> represents something much more seriously wrong in the first place,
> but on principle, adopt a dedicated cleanup path for those.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index b7dcb1494aa4..7908fca962fe 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -4609,7 +4609,7 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>  	/* Initialise in-memory data structures */
>  	ret = arm_smmu_init_structures(smmu);
>  	if (ret)
> -		return ret;
> +		goto free_iopf;
>  
>  	/* Record our private device structure */
>  	platform_set_drvdata(pdev, smmu);
> @@ -4620,22 +4620,27 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>  	/* Reset the device */
>  	ret = arm_smmu_device_reset(smmu);
>  	if (ret)
> -		return ret;
> +		goto free_iopf;
>  
>  	/* And we're up. Go go go! */
>  	ret = iommu_device_sysfs_add(&smmu->iommu, dev, NULL,
>  				     "smmu3.%pa", &ioaddr);
>  	if (ret)
> -		return ret;
> +		goto free_iopf;
>  
>  	ret = iommu_device_register(&smmu->iommu, &arm_smmu_ops, dev);
>  	if (ret) {
>  		dev_err(dev, "Failed to register iommu\n");
> -		iommu_device_sysfs_remove(&smmu->iommu);
> -		return ret;
> +		goto free_sysfs;
>  	}
>  
>  	return 0;
> +
> +free_sysfs:
> +	iommu_device_sysfs_remove(&smmu->iommu);
> +free_iopf:
> +	iopf_queue_free(smmu->evtq.iopf);
> +	return ret;
>  }

Thanks. I think this is correct (and iopf_queue_free() checks for NULL,
so we're good there) but I just wonder whether it would be more
consistent to use devm_add_action_or_reset(), like we do for the MSIs.

Will

