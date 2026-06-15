Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD60CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 18:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0QQFE4Q78ROfwCE6RiQR0WbwEbAFg2bEgRUVC0vIbxA=; b=WraWF1OyDoe+GDbe1EGmwMf+kM
	6miu1NVQpnJ6lAdA7WHmArt4RfQBaI8NrAktlT9q2us47I406lN7ds3Oaxgss0T379t2xjYFCCYnE
	o9LeuYjTqsYbdOtS6E1HXQbMFznSc9PMRoGva8UNVHmwyc/izCLBgr+slWotsbv+s0prSrqslobuu
	x6IliD7McBXWd9dx1zRIHOehvl5Mfd9TAzNGgZkgjeTnU84t/ek+2GIvB96BPvVNzcLghdwNK6wd4
	++bcJcgfMO9CkTWiEOUnCyDCtzo8pIXxnBR1EUHXn+n1zDMD/F58+/hQjiJyhrWlXN42rtw5hvZDN
	GDs7oBvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZBvK-0000000EijK-2CML;
	Mon, 15 Jun 2026 18:20:38 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZBvF-0000000EiiY-3Qyq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 18:20:36 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-490bd64ca95so8685e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 11:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781547632; x=1782152432; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0QQFE4Q78ROfwCE6RiQR0WbwEbAFg2bEgRUVC0vIbxA=;
        b=NhlFu8pEs4FKDjvbo50tct6IwQe9+A+4HVn1gxT+wkvlWdkZCRZ0CzAqWXX41RH9sC
         lvLYGsEPP8DVeINDvAV3fJ8hAM8kQN0slTq0ZiHkbdELdTcnbjEOfzPvw1fqmaqgqD8B
         lpWwAHdzRFIwbWDsLamaYZUB2jS7Jby6NKe4UnHQeSSTky8BKbPEBgRshudnU4miQqJw
         4KIAscOEt5D1Jg/95Z+7Jouxx92K2xbNEuH+XsvI5pjCalETlVpor7CbSBOztTfjveoS
         JR8BroMljXbBMleMVsv1kCZW+P3w5whqTfUfL0xrI5GAsTSWnIsIuxCh7GmxYBivtAKL
         0atA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781547632; x=1782152432;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0QQFE4Q78ROfwCE6RiQR0WbwEbAFg2bEgRUVC0vIbxA=;
        b=r0i0/ecCuveDAnbqZRbQXBvuYfWIVjvhm7+7+dCDntYtUYCduKbMjuzFr97LSNPFTI
         o6QWWE2RmcYYfCM4wbsoP/hQ51Jrc1T3SOWxVGks187dKBoRefqspzkiEsRuhZZFEcv+
         PiXUokiSMli6MsqjqEp6IBMSEqkY+epwdpNPdgO/oa+saRiNMHlVbewL7EniYY9Xg37s
         X/yZoQxSjha9P0AzfyLZ36NF9cFfeNWzZHHeEi0Syq8CylmnLCCEBmzRp8MklA7w6u+T
         ZaGgRF0RpN/V210lbTVmsjudyryNRxEH1smH/FSfmdPOi4rnCxpjcKY/WwEmVjZulLjT
         E9QA==
X-Forwarded-Encrypted: i=1; AFNElJ+irFK/ycIK9+SXTvS5ks8xggrSpLpi93iyWO6dMrC4HYl11+8af1wHyXL91eejLQ4sIrj9yC5DAe8jCaUKOT8V@lists.infradead.org
X-Gm-Message-State: AOJu0Yxon/g9BThMNbVjTRcDgzsKzu11ZjgA1lN3ZwepJ1hoCp9EMyMv
	Io7FYcVYnVCx70D6aD1KV2FoAs6fCGhmdONBmexFBC1Q+hMdV8Y1oxSSgK4Lok/Qsw==
X-Gm-Gg: Acq92OEn+iwidUcPcyqP4WpSCPCY/qjdCnrUcKHE4dVNb+2eeYlr44/2+/MR20utjXV
	uKZFKlWkRjDl1XVy4tBtF1iV1zvnlninkF3nflp/zlU/etciiHlrTeRcctimirQzTIwv4kBJeP8
	APjzREvWYz2uQCx1NI/P1NeBecPTApLJAK8TUY4JvyWL36edTuoqCdAdxvZ1V1mBuktGuuxAatz
	5y42BUtLnv27sReivh71U3Q0+CPNR4EWADmMJ7bBRIr8ZR2FvdloNZqQTnFn8e9XXIDLe9h6MyW
	WE8mx2uDsXynNIkHqLvHOBptrwPZInKvhBLSub+YvI+C0bbc9NkkEtmZngYI4nzytIYR/bfbtke
	CKYDLunvfQn6GBJUfqunPvrpCB5dbTtWpovbDMT6IlGWx4NglMs8qbJxSRYpWNBm+9agBISxoRP
	BYWD9sS+JxSrXqznFmu0v6YR8ElfDg9En+yB4pDUH6BI3wMZn0p2U7TPUkzz8DtQ==
X-Received: by 2002:a05:600c:8a09:10b0:490:b2ae:44ca with SMTP id 5b1f17b1804b1-4922ffea1dcmr122675e9.5.1781547631529;
        Mon, 15 Jun 2026 11:20:31 -0700 (PDT)
Received: from google.com (140.240.76.34.bc.googleusercontent.com. [34.76.240.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa50e97sm12797275e9.8.2026.06.15.11.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 11:20:30 -0700 (PDT)
Date: Mon, 15 Jun 2026 18:20:27 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Pranjal Shrivastava <praan@google.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>,
	Daniel Mentz <danielmentz@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 09/12] iommu/arm-smmu-v3: Implement pm_runtime &
 system sleep ops
Message-ID: <ajBCazla1VoJX9Ms@google.com>
References: <20260601215909.3958732-1-praan@google.com>
 <20260601215909.3958732-10-praan@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601215909.3958732-10-praan@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_112033_899040_9DF3BA7A 
X-CRM114-Status: GOOD (  36.72  )
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

On Mon, Jun 01, 2026 at 09:59:06PM +0000, Pranjal Shrivastava wrote:
> Implement pm_runtime and system sleep ops for arm-smmu-v3.
> 
> The suspend callback configures the SMMU to abort new transactions,
> disables the main translation unit and then drains the command queue
> to ensure completion of any in-flight commands. A software gate
> (STOP_FLAG) and synchronization barriers are used to quiesce the command
> submission pipeline and ensure state consistency before power-off.
> 
> To prevent software metadata flags from leaking into physical registers
> or polluting the tracking pointer, a newly introduced bitmask
> (CMDQ_PROD_IDX_MASK) is applied to all register writes and tracking
> updates.
> 
> The resume callback restores the MSI configuration and performs a full
> device reset via `arm_smmu_device_reset` to bring the SMMU back to an
> operational state. The MSIs are cached during the msi_write and are
> restored during the resume operation by using the helper. The STOP_FLAG
> is cleared only after the CMDQ is enabled in hardware.
> 
> Suggested-by: Daniel Mentz <danielmentz@google.com>
> Signed-off-by: Pranjal Shrivastava <praan@google.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 172 +++++++++++++++++++-
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  18 ++
>  2 files changed, 188 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index d31e50b64b50..542de3a3173a 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -28,6 +28,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/sort.h>
>  #include <linux/string_choices.h>
> +#include <linux/pm_runtime.h>
>  #include <kunit/visibility.h>
>  #include <uapi/linux/iommufd.h>
>  
> @@ -110,6 +111,40 @@ static const char * const event_class_str[] = {
>  static int arm_smmu_alloc_cd_tables(struct arm_smmu_master *master);
>  static bool arm_smmu_ats_supported(struct arm_smmu_master *master);
>  
> +/* Runtime PM helpers */
> +__maybe_unused static int arm_smmu_rpm_get(struct arm_smmu_device *smmu)
> +{
> +	int ret;
> +
> +	if (!pm_runtime_enabled(smmu->dev))
> +		return 0;
> +
> +	ret = pm_runtime_resume_and_get(smmu->dev);
> +	if (ret < 0) {
> +		dev_err(smmu->dev, "failed to resume device: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +__maybe_unused static void arm_smmu_rpm_put(struct arm_smmu_device *smmu)
> +{
> +	int ret;
> +
> +	if (!pm_runtime_enabled(smmu->dev))
> +		return;
> +
> +	ret = pm_runtime_put_autosuspend(smmu->dev);
> +	if (ret < 0)
> +		dev_err(smmu->dev, "failed to suspend device: %d\n", ret);
> +}
> +
> +static inline u32 arm_smmu_cmdq_owner_prod_idx(struct arm_smmu_cmdq *cmdq)
> +{
> +	return atomic_read(&cmdq->owner_prod) & CMDQ_PROD_IDX_MASK;
> +}
> +
>  static void parse_driver_options(struct arm_smmu_device *smmu)
>  {
>  	int i = 0;
> @@ -789,7 +824,8 @@ int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
>  		/* b. Stop gathering work by clearing the owned flag */
>  		prod = atomic_fetch_andnot_relaxed(CMDQ_PROD_OWNED_FLAG,
>  						   &cmdq->q.llq.atomic.prod);
> -		prod &= ~CMDQ_PROD_OWNED_FLAG;
> +		/* Strip all metadata flags */
> +		prod &= CMDQ_PROD_IDX_MASK;
>  
>  		/*
>  		 * c. Wait for any gathered work to be written to the queue.
> @@ -4828,7 +4864,8 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
>  
>  	/* Command queue */
>  	writeq_relaxed(smmu->cmdq.q.q_base, smmu->base + ARM_SMMU_CMDQ_BASE);
> -	writel_relaxed(smmu->cmdq.q.llq.prod, smmu->base + ARM_SMMU_CMDQ_PROD);
> +	writel_relaxed(smmu->cmdq.q.llq.prod & CMDQ_PROD_IDX_MASK,
> +		       smmu->base + ARM_SMMU_CMDQ_PROD);
>  	writel_relaxed(smmu->cmdq.q.llq.cons, smmu->base + ARM_SMMU_CMDQ_CONS);
>  
>  	enables = CR0_CMDQEN;
> @@ -4839,6 +4876,10 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
>  		return ret;
>  	}
>  
> +	/* Clear any flags from the previous life */
> +	atomic_andnot(CMDQ_PROD_STOP_FLAG, &smmu->cmdq.owner_prod);
> +	atomic_andnot(CMDQ_PROD_STOP_FLAG, &smmu->cmdq.q.llq.atomic.prod);

Should not that be done from the suspend call?

> +
>  	/* Invalidate any cached configuration */
>  	arm_smmu_cmdq_issue_cmd_with_sync(smmu, arm_smmu_make_cmd_cfgi_all());
>  
> @@ -4898,6 +4939,21 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
>  	if (is_kdump_kernel())
>  		enables &= ~(CR0_EVTQEN | CR0_PRIQEN);
>  
> +	/*
> +	 * While the SMMU was suspended, concurrent CPU threads may have
> +	 * updated in-memory structures (such as STEs, CDs, and PTEs).
> +	 * Any invalidations corresponding to those updates were safely
> +	 * elided because the command queue was stopped (STOP_FLAG == 1).
> +	 *
> +	 * Since the reset invalidate-all commands above have fully cleared
> +	 * the HW TLBs and config caches, the SMMU will fetch these descriptors
> +	 * directly from RAM as soon as translation is enabled.
> +	 *
> +	 * Add a memory barrier to collect all prior RAM writes to ensure the
> +	 * SMMU sees a consistent view of memory before translation is enabled.
> +	 */
> +	smp_mb();

Should not that be dma_wmb() as this is syncing with the HW?

> +
>  	/* Enable the SMMU interface */
>  	enables |= CR0_SMMUEN;
>  	ret = arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0,
> @@ -5580,6 +5636,117 @@ static void arm_smmu_device_shutdown(struct platform_device *pdev)
>  	arm_smmu_device_disable(smmu);
>  }
>  
> +static int __maybe_unused arm_smmu_runtime_suspend(struct device *dev)
> +{
> +	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
> +	struct arm_smmu_cmdq *cmdq = &smmu->cmdq;
> +	int timeout = ARM_SMMU_SUSPEND_TIMEOUT_US;
> +	u32 enables, target;
> +	int ret;
> +
> +	/* Abort all transactions before disable to avoid spurious bypass */
> +	arm_smmu_update_gbpa(smmu, GBPA_ABORT, 0);
> +
> +	/* Disable the SMMU via CR0.EN and all queues except CMDQ */
> +	enables = CR0_CMDQEN;
> +	ret = arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0, ARM_SMMU_CR0ACK);
> +	if (ret) {
> +		dev_err(smmu->dev, "failed to disable SMMU\n");
> +		return ret;
> +	}
> +
> +	/*
> +	 * At this point the SMMU is completely disabled and won't access
> +	 * any translation/config structures, even speculative accesses
> +	 * aren't performed as per the IHI0070 spec (section 6.3.9.6).
> +	 */
> +
> +	/* Mark the CMDQ to stop and get the target index before the stop */
> +	target = atomic_fetch_or_relaxed(CMDQ_PROD_STOP_FLAG, &cmdq->q.llq.atomic.prod);

As Daniel mentioned, I think this shouldn't be relaxed.

> +	target &= CMDQ_PROD_IDX_MASK;
> +
> +
> +	/* Wait for the last committed owner to reach the hardware */
> +	while ((arm_smmu_cmdq_owner_prod_idx(cmdq) != target) && --timeout)
> +		udelay(1);

I think --timeout has an off-by-one.

Thanks,
Mostafa


