Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F7DD73086
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 02:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YLyfrpphk/pri+vsSR8ZKPbndfkUJotLPgfVmPM7TEQ=; b=ZTiAyXMehOKnpZxuRVLIv9HiVi
	mhGMHO5ecj3ep24Px/w1+T+ojHT4HJSfE/IFV81uL8sCmhHi2jYaZofG8U+4wZWJTJMawVMGjGM4D
	+ThSKKaOxkjnDn3FywxiLU0KFQWYA+JirxMDTotA3tHoAk8HV6GDcMh8Kud/z5ZFasFebjoln1P05
	oqCmehF9MuyIZasNx+bKnMzADvqBBmz6hlrkdAX16nwBFB97O+gI4iKLeO+6ojD6ykWpBCC6X59xX
	54jED7NbBRwjo5FIbOsGF9w5Jm3qGoinVKsfPEC9ymCd2eprim1DGniRsN0K0l3Upyfl+WFJEXUlm
	FlmMKYYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8U8y-0000000164b-0ZRj;
	Fri, 03 Apr 2026 02:20:20 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8U8t-0000000164F-2xNu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 02:20:17 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2b0c12be0ecso49155ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 19:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775182814; x=1775787614; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YLyfrpphk/pri+vsSR8ZKPbndfkUJotLPgfVmPM7TEQ=;
        b=Gzf9Gm0x63NKPNfkZfgIZZfYhNYivstMvd74lqkQm1ekrsZ5uE/z+kJIPbauHYmYYh
         G9Bg7opEdvwdxHfujgPy9Lf7A1/xmcUiHiAhnbdsb422oCncSBjkqx+n6gf1c4aZG+P/
         H4uvRV22ZormAeDC9+hGXahcnyQRArJLNlNldprEA4zQIqDNcjxFAWXtGNI3rANk4L5v
         NakezxV3KrRQph7gTP5PFLjofTDllMdpXSDnVBoeEq+m6+xlUaTo9XQyV4DtmPSaRhf6
         1QPrb1mLn35EL8SoJ87j4KTcMf3VkdcTzPkFN44wDi6RXLN9taGdbpCZRNcNlw54cij8
         ZOHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775182814; x=1775787614;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YLyfrpphk/pri+vsSR8ZKPbndfkUJotLPgfVmPM7TEQ=;
        b=R++fcheFBk7D+MKS9vGBhIcjw9oyArWaVzrApyfz0vdj2eMvRWy88yWiICKB5AkMwz
         zVXu0F9lMjwe4TvqiBUI07crbpnDiPeP/O05p0AgB2Tai7ZxOZUPH+ZX4S5NX+B42ZmW
         VvtX8RYGkL8SOTcb8I8wlciZfRWqJdeyfD18hX4r8lrfcpXZuXCKrsicudo222aWBJx4
         R6FV3ZGkjej8wojTkgMNP/xZsgjxmDncellPx1hy3+oJAH1SIn/5NEUXrc+y/DNer0uR
         qRNnLI+u5qTUnK1ms+rRKCj3J3dO+7jDDMxlGxeeguEnHNfRi5bjtxQkeCWdEtk/W0qT
         uJmw==
X-Forwarded-Encrypted: i=1; AJvYcCUG3+y5wQu7dhUVFslx6FLLpYRqbOLTRZQIX45+At8u6yDYYem9CIvOJWkUNmuJyTyJhu7ZgFDbScwIGjgO2ALC@lists.infradead.org
X-Gm-Message-State: AOJu0YwLivt/fHcaE1DXYLBumG89KK8DeaTCa6PaW/LvKVDYpEvtFMpd
	FxM4Hyp9XTXfkgFcc510dyZuO3qe+JMXSMuMMOI1OkaACq22qxqAV+UJXxrJQ3Qyfw==
X-Gm-Gg: AeBDievBunG2OFcJZSFUKlMaBot2ycBfb3hgmImU8L+pthxaYsehNwX8cDo2COCcuKP
	oQK77TFH2t/S/TzAyRZa93uyDu9xcGefLCLceTe6dfRoJyzaRMX2XDhf1yFxiS4CZ2OQ616eg/Z
	MSRXN8yXcy+fOPnFnvSBUYfrTCC183qXg8rTxZqLLxbY4KWzPGCTr7wZWcndD0l9PY3c2Hn17rG
	0BnSJDtSuesijbOgkJa+Nvp7K91F7ugyT/KBLDpzCJ/mgGSrygLItzI8PY277XVMDwOpSU8PmKw
	PMs6mQ17FK7axygTRciBlQICUJF2oQMB/SpcGcqPbYLBaGT01Uo/3H9lGWU5Bs25tckabD6HCuD
	mt18R3U1mdaC9/4meuVq8l9Nmebi9+b2I2A1R4X+20STrugseyVEianBouDKzwO/hMYktnG4FLw
	6aGu0qxTENwGUtyiXEMh47b3fNqtcQat98NAs1HAMJTpks+h9GcAY9ogUJqg==
X-Received: by 2002:a17:903:2f0d:b0:2ae:4808:bd99 with SMTP id d9443c01a7336-2b282ed3780mr1613755ad.2.1775182813067;
        Thu, 02 Apr 2026 19:20:13 -0700 (PDT)
Received: from google.com (10.129.124.34.bc.googleusercontent.com. [34.124.129.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c71e62sm4165949b3a.44.2026.04.02.19.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 19:20:12 -0700 (PDT)
Date: Fri, 3 Apr 2026 02:20:06 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
Subject: Re: [PATCH v2] iommu/arm-smmu: Use pm_runtime in fault handlers
Message-ID: <ac8j1jlFNxgZWzzK@google.com>
References: <20260313-smmu-rpm-v2-1-8c2236b402b0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-smmu-rpm-v2-1-8c2236b402b0@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_192015_808587_025E3750 
X-CRM114-Status: GOOD (  38.66  )
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

On Fri, Mar 13, 2026 at 03:53:53PM +0530, Prakash Gupta wrote:
> Commit d4a44f0750bb ("iommu/arm-smmu: Invoke pm_runtime across the driver")
> enabled pm_runtime for the arm-smmu device. On systems where the SMMU
> sits in a power domain, all register accesses must be done while the
> device is runtime active to avoid unclocked register reads and
> potential NoC errors.
> 
> So far, this has not been an issue for most SMMU clients because
> stall-on-fault is enabled by default. While a translation fault is
> being handled, the SMMU stalls further translations for that context
> bank, so the fault handler would not race with a powered-down
> SMMU.
> 
> Adreno SMMU now disables stall-on-fault in the presence of fault
> storms to avoid saturating SMMU resources and hanging the GMU. With
> stall-on-fault disabled, the SMMU can generate faults while its power
> domain may no longer be enabled, which makes unclocked accesses to
> fault-status registers in the SMMU fault handlers possible.
> 
> Guard the context and global fault handlers with pm_runtime_get_if_active()
> and pm_runtime_put_autosuspend() so that all SMMU fault register accesses
> are done with the SMMU powered. In case pm_runtime is not active we can
> safely ignore the fault as for pm runtime resume the smmu device is
> reset and fault registers are cleared.
> 
> Fixes: b13044092c1e ("drm/msm: Temporarily disable stall-on-fault after a page fault")
> Co-developed-by: Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
> Signed-off-by: Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
> Signed-off-by: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
> ---
> Changes in v2:
> - Switched from arm_smmu_rpm_get()/arm_smmu_rpm_put() wrappers to
>   pm_runtime_get_if_active()/pm_runtime_put_autosuspend() APIs
> - Added support for smmu->impl->global_fault callback in global fault handler
> - Remove threaded irq context fault restriction to allow modifying stall
>   mode for adreno smmu
> - Link to v1: https://patch.msgid.link/20260127-smmu-rpm-v1-1-2ef2f4c85305@oss.qualcomm.com
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu.c | 60 +++++++++++++++++++++++------------
>  1 file changed, 39 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index 5e690cf85ec9..f4c46491a03d 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -462,10 +462,20 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
>  	int idx = smmu_domain->cfg.cbndx;
>  	int ret;
>  
> +	if (!pm_runtime_get_if_active(smmu->dev))

Note that the pm_runtime_get_if_active(dev) only returns a positive
value if the device state is exactly RPM_ACTIVE. If the device is in the
middle of its runtime_suspend callback, its state is RPM_SUSPENDING.

Thus, if a fault races with the suspend callback, we'll return IRQ_NONE
and the suspend callback doesn't seem to be disabling interrupts.

This isn't any better if we're in a fault-storm caused by
level-triggered interrupts, we'd simply keep entering this handler and
return.

I believe we should clear / handle any pending faults/interrupts or
atleast mask interrupt in the suspend handler to avoid this situation.

> +		return IRQ_NONE;
> +

Maybe we could add another wrapped-helper to maintain consistency:

static inline int arm_smmu_rpm_get_if_active(struct arm_smmu_device *smmu)
{
     if (!pm_runtime_enabled(smmu->dev))
         return 1; // Assume active/powered if RPM is not used
     return pm_runtime_get_if_active(smmu->dev);
}

This returns -EINVAL otherwise which isn't a problem for the if
condition but slightly cleaner.

> +	if (smmu->impl && smmu->impl->context_fault) {
> +		ret = smmu->impl->context_fault(irq, dev);
> +		goto out_power_off;
> +	}
> +

We've moved impl-specific handlers here, I don't see a functional change.
This looks fine.

>  	arm_smmu_read_context_fault_info(smmu, idx, &cfi);
>  
> -	if (!(cfi.fsr & ARM_SMMU_CB_FSR_FAULT))
> -		return IRQ_NONE;
> +	if (!(cfi.fsr & ARM_SMMU_CB_FSR_FAULT)) {
> +		ret = IRQ_NONE;
> +		goto out_power_off;
> +	}
>  
>  	ret = report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
>  		cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
> @@ -480,7 +490,12 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
>  				  ret == -EAGAIN ? 0 : ARM_SMMU_RESUME_TERMINATE);
>  	}
>  
> -	return IRQ_HANDLED;
> +	ret = IRQ_HANDLED;
> +
> +out_power_off:
> +	pm_runtime_put_autosuspend(smmu->dev);

Nit: Please use arm_smmu_rpm_put() here.. while at it, I guess we can
also bring back pm_runtime_put_autosuspend() in arm_smmu_rpm_put() since
it is updated now to also mark last busy.

> +
> +	return ret;
>  }
>  
>  static irqreturn_t arm_smmu_global_fault(int irq, void *dev)
> @@ -489,14 +504,25 @@ static irqreturn_t arm_smmu_global_fault(int irq, void *dev)
>  	struct arm_smmu_device *smmu = dev;
>  	static DEFINE_RATELIMIT_STATE(rs, DEFAULT_RATELIMIT_INTERVAL,
>  				      DEFAULT_RATELIMIT_BURST);
> +	int ret;
> +
> +	if (!pm_runtime_get_if_active(smmu->dev))
> +		return IRQ_NONE;
> +

Same here.

> +	if (smmu->impl && smmu->impl->global_fault) {
> +		ret = smmu->impl->global_fault(irq, dev);
> +		goto out_power_off;
> +	}
>  
>  	gfsr = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_sGFSR);
>  	gfsynr0 = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_sGFSYNR0);
>  	gfsynr1 = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_sGFSYNR1);
>  	gfsynr2 = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_sGFSYNR2);
>  
> -	if (!gfsr)
> -		return IRQ_NONE;
> +	if (!gfsr) {
> +		ret = IRQ_NONE;
> +		goto out_power_off;
> +	}
>  
>  	if (__ratelimit(&rs)) {
>  		if (IS_ENABLED(CONFIG_ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT) &&
> @@ -513,7 +539,11 @@ static irqreturn_t arm_smmu_global_fault(int irq, void *dev)
>  	}
>  
>  	arm_smmu_gr0_write(smmu, ARM_SMMU_GR0_sGFSR, gfsr);
> -	return IRQ_HANDLED;
> +	ret = IRQ_HANDLED;
> +
> +out_power_off:
> +	pm_runtime_put_autosuspend(smmu->dev);
> +	return ret;
>  }
>  
>  static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain,
> @@ -683,7 +713,6 @@ static int arm_smmu_init_domain_context(struct arm_smmu_domain *smmu_domain,
>  	enum io_pgtable_fmt fmt;
>  	struct iommu_domain *domain = &smmu_domain->domain;
>  	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
> -	irqreturn_t (*context_fault)(int irq, void *dev);
>  
>  	mutex_lock(&smmu_domain->init_mutex);
>  	if (smmu_domain->smmu)
> @@ -850,19 +879,14 @@ static int arm_smmu_init_domain_context(struct arm_smmu_domain *smmu_domain,
>  	 */
>  	irq = smmu->irqs[cfg->irptndx];
>  
> -	if (smmu->impl && smmu->impl->context_fault)
> -		context_fault = smmu->impl->context_fault;
> -	else
> -		context_fault = arm_smmu_context_fault;
> -
>  	if (smmu->impl && smmu->impl->context_fault_needs_threaded_irq)
>  		ret = devm_request_threaded_irq(smmu->dev, irq, NULL,
> -						context_fault,
> +						arm_smmu_context_fault,
>  						IRQF_ONESHOT | IRQF_SHARED,
>  						"arm-smmu-context-fault",
>  						smmu_domain);
>  	else
> -		ret = devm_request_irq(smmu->dev, irq, context_fault, IRQF_SHARED,
> +		ret = devm_request_irq(smmu->dev, irq, arm_smmu_context_fault, IRQF_SHARED,
>  				       "arm-smmu-context-fault", smmu_domain);
>  
>  	if (ret < 0) {
> @@ -2125,7 +2149,6 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	int num_irqs, i, err;
>  	u32 global_irqs, pmu_irqs;
> -	irqreturn_t (*global_fault)(int irq, void *dev);
>  
>  	smmu = devm_kzalloc(dev, sizeof(*smmu), GFP_KERNEL);
>  	if (!smmu) {
> @@ -2205,18 +2228,13 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>  		smmu->num_context_irqs = smmu->num_context_banks;
>  	}
>  
> -	if (smmu->impl && smmu->impl->global_fault)
> -		global_fault = smmu->impl->global_fault;
> -	else
> -		global_fault = arm_smmu_global_fault;
> -
>  	for (i = 0; i < global_irqs; i++) {
>  		int irq = platform_get_irq(pdev, i);
>  
>  		if (irq < 0)
>  			return irq;
>  
> -		err = devm_request_irq(dev, irq, global_fault, IRQF_SHARED,
> +		err = devm_request_irq(dev, irq, arm_smmu_global_fault, IRQF_SHARED,
>  				       "arm-smmu global fault", smmu);
>  		if (err)
>  			return dev_err_probe(dev, err,
> 

Thanks,
Praan

