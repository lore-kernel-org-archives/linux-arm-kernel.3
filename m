Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB73C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 15:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UPSjr9JU+pCYrEmDJ7OVpfKAUb1nOpu7R28XymotIVY=; b=Zfc0IHcrK2HH8W/T+uij0/Dp82
	a3TSQlwW3fy5bLH1vm3/nTI0nblOdtf4DB3/8BstsvQFjUPKl+LqkixHCkNvF9gYRS/akGJTwhFfY
	ABotbMBxgMvzFr4NwiYqbfRNrP0sbkbCJZohETpLSeNsoqsWjNqrGiTN4GbNK8RCNWhuHinLfttJ2
	vkMZo2DSrPUF9FQg2wVGN/kWjWwcHn+Bu+jbwhKMMM/lsdOA0cf9JAtFv+23xCC7PFqbSZoQTV1NL
	kyYQJHi5DhbBTF9yQP1RzBV3kA63LLzlnsZM7hVG6FviAzsB9tA3HvmlNQRyy8QxAITbLcbO0/iIo
	1oywafZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDhr-0000000F2Lv-2oes;
	Mon, 29 Jun 2026 15:15:31 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDhp-0000000F2L6-0V60
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 15:15:30 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2c9b2ac97cdso55775ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 08:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782746128; x=1783350928; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UPSjr9JU+pCYrEmDJ7OVpfKAUb1nOpu7R28XymotIVY=;
        b=dhrNcb1IBwTnV/peqcKw40hJ027d+/KC3UjcrpLQ1UQLsJApjleXVZ4vS7ithDXg9L
         V/O1ixrSSfI7tQatD1HsW2r7lTzGBHkt+NbfhNjguILrdmTA8p9XSPV1dMy9pyORTv6u
         qFzq9H/+w0UicI10FcRY/WWpkD1cnSY/SX+KZWzUaBLXHbaAphd/eISNAnXHJON8lmd+
         xEB5G7+UZy5Gl+ngVObzVE1DpXTEFr2d/f0gUwwhh3Ks3oJa341QZbpVsXuyqDQpIJ1E
         LiTn6SL+QRZtYVUqMKrAWKpBvfwwTznYCQ24Jqwkqnjl+VQ9nu9cL1zSE8AQ/xgRNO3K
         k/rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782746128; x=1783350928;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UPSjr9JU+pCYrEmDJ7OVpfKAUb1nOpu7R28XymotIVY=;
        b=CkwB6BfQ5mSWHs40g/+4dYrg8tiOfQUEtuNvdUXh0vMUuj+JPIsQ/Bw51dXz2qhh/v
         P7+b4aGoCUeBF3ORu4GvImPSWb4rXTZD3CmDMSfcPh4s6chs9Cl99eQwDBo72dID4Ecj
         i10KCksZhfvIUxPIs9SQLmxSdN0zGSO13dOROIWShok4JzJUv6tYNjPd1GpLn2igHLDo
         sOymKYqIC+uIqqwMgM2ueQcjF02kt85sb8J1zONSb3s4V22ZjyTxzARLjIvJw56jQite
         cpN0qecscD/b7VyO/9zwFOsSJyZvUas1ocjRowbuMH6CmJKOBvvaYzbMoFedpH+FttKl
         L5Rw==
X-Forwarded-Encrypted: i=1; AHgh+RqQodX2A1UBs22A6JCXjxfAy+IJzfS0CGYaeIZnEVOJCkW2DnJpfB/pVMVTK8CJ339KDO/tieF4gOOWzPUEPaBF@lists.infradead.org
X-Gm-Message-State: AOJu0YxI5FI/UV7qhdDcFQxPWuGZcQ5+99k78uXFGPCS0PLYzicChCtj
	zY4oMayeS8x208srSbP3+n2qBwJd6nQTnp6xS9zTubTv7VbZS1FsxSaTlApcLrxynA==
X-Gm-Gg: AfdE7cmUvGvfSHH8x/Zo/K5EV5SOz6G+f2P1JdkVbzi8VdcE4ExUFDxogOs10r44tY6
	v7o+7HAOWnZayMbNdWNiNqvdy8DiwvhafV02Re4a28igkzlFodfsjNGyw28b6l74Nq+Kc+Xqg98
	YDRplv3az07eqPyxn9Dt0eYv/a5sIAvCyJ9Qe0ww4SdIBA9NuOG5bNzKjLjQ6/UQwb7OwrFsDE5
	H9lBsvXMfhPeQ4R0X1SE7Ig1wGTqWjQtMS62NosxzDN280E63ahupOONk6ye659JJ3dkvvYPQSX
	FE+jFle5AdohIetKyr3PtFRTNCHPdLZ/JVStl7zVCq/hpMOGrtVzZUTDPopntEPXOUqxj9O9QQl
	Pi1UJt/pQ1Nq1+j91/VqTeQKVFSGG1GxZ0MVQtLS4PZR2c0rh2PE9MfkO6jMWafQvJQD3Cq0rro
	b+Tot8q6kNUgFxqkXOz6K1zFj7negVmqwRMa1y10AAE4xb4ls=
X-Received: by 2002:a17:902:e5c1:b0:2c7:b1e7:501e with SMTP id d9443c01a7336-2ca2ce7f8b4mr86255ad.3.1782746127572;
        Mon, 29 Jun 2026 08:15:27 -0700 (PDT)
Received: from google.com (10.129.124.34.bc.googleusercontent.com. [34.124.129.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c9b0992227sm50676885ad.37.2026.06.29.08.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 08:15:26 -0700 (PDT)
Date: Mon, 29 Jun 2026 15:15:21 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, jgg@nvidia.com, joro@8bytes.org,
	kees@kernel.org, baolu.lu@linux.intel.com, kevin.tian@intel.com,
	miko.lenczewski@arm.com, smostafa@google.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	jamien@nvidia.com
Subject: Re: [PATCH rc v6 4/7] iommu/arm-smmu-v3: Skip EVTQ/PRIQ setup in
 kdump kernel
Message-ID: <akKMCYsdH4lVSyf7@google.com>
References: <cover.1779265413.git.nicolinc@nvidia.com>
 <1280ac4fdb37f998fd6dcb2bf8f4437283279395.1779265413.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1280ac4fdb37f998fd6dcb2bf8f4437283279395.1779265413.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_081529_161168_6F4157ED 
X-CRM114-Status: GOOD (  23.01  )
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

On Wed, May 20, 2026 at 10:03:21AM -0700, Nicolin Chen wrote:
> In kdump cases, the crashed kernel's CDs and page tables can be corrupted,
> which could trigger event spamming. Also, we cannot serve page requests.
> 
> Skip the EVTQ/PRIQ setup entirely rather than enabling then disabling them.
> 
> Also add some inline comments explaining that.
> 
> Fixes: b63b3439b856 ("iommu/arm-smmu-v3: Abort all transactions if SMMU is enabled in kdump kernel")
> Cc: stable@vger.kernel.org # v6.12+
> Suggested-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 43 +++++++++++++--------
>  1 file changed, 27 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index e00b28e36f9c4..3f22949391c82 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -5161,21 +5161,35 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
>  	cmd.opcode = CMDQ_OP_TLBI_NSNH_ALL;
>  	arm_smmu_cmdq_issue_cmd_with_sync(smmu, &cmd);
>  
> -	/* Event queue */
> -	writeq_relaxed(smmu->evtq.q.q_base, smmu->base + ARM_SMMU_EVTQ_BASE);
> -	writel_relaxed(smmu->evtq.q.llq.prod, smmu->page1 + ARM_SMMU_EVTQ_PROD);
> -	writel_relaxed(smmu->evtq.q.llq.cons, smmu->page1 + ARM_SMMU_EVTQ_CONS);
> -
> -	enables |= CR0_EVTQEN;
> -	ret = arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0,
> -				      ARM_SMMU_CR0ACK);
> -	if (ret) {
> -		dev_err(smmu->dev, "failed to enable event queue\n");
> -		return ret;
> +	/*
> +	 * Event queue
> +	 *
> +	 * Do not enable in a kdump case, as the crashed kernel's CDs and page
> +	 * tables might be corrupted, triggering event spamming.
> +	 */
> +	if (!is_kdump_kernel()) {
> +		writeq_relaxed(smmu->evtq.q.q_base,
> +			       smmu->base + ARM_SMMU_EVTQ_BASE);
> +		writel_relaxed(smmu->evtq.q.llq.prod,
> +			       smmu->page1 + ARM_SMMU_EVTQ_PROD);
> +		writel_relaxed(smmu->evtq.q.llq.cons,
> +			       smmu->page1 + ARM_SMMU_EVTQ_CONS);
> +
> +		enables |= CR0_EVTQEN;
> +		ret = arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0,
> +					      ARM_SMMU_CR0ACK);

Nit:
I believe only the write_reg_sync(CR0) should be under this if condition
do we see any weird behavior if we perform the reg writes in
kdump_kernel?

> +		if (ret) {
> +			dev_err(smmu->dev, "failed to enable event queue\n");
> +			return ret;
> +		}
>  	}
>  
> -	/* PRI queue */
> -	if (smmu->features & ARM_SMMU_FEAT_PRI) {
> +	/*
> +	 * PRI queue
> +	 *
> +	 * Do not enable in a kdump case, as we cannot serve page requests.
> +	 */
> +	if (!is_kdump_kernel() && (smmu->features & ARM_SMMU_FEAT_PRI)) {
>  		writeq_relaxed(smmu->priq.q.q_base,
>  			       smmu->base + ARM_SMMU_PRIQ_BASE);
>  		writel_relaxed(smmu->priq.q.llq.prod,
> @@ -5208,9 +5222,6 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
>  		return ret;
>  	}
>  
> -	if (is_kdump_kernel())
> -		enables &= ~(CR0_EVTQEN | CR0_PRIQEN);
> -
>  	/* Enable the SMMU interface */
>  	enables |= CR0_SMMUEN;
>  	ret = arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0,
> -- 
> 2.43.0
> 

Apart from that nit, 

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

