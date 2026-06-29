Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED53C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 08:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2CYHaiLd9ywNSZ9pftV2yPbkytXEfUK5AIl8p5DJYxA=; b=01Ry6FPpn2TYaVYwWcMJjSqUem
	PRyMsBtnay5ET8Q0ugTOFAlhYhTQyT4eV59PWxJL1eWT2Fg2VskAHBUIfByaaVPVHqewgBBgJitPd
	BptW1yUI7oYhJS9sqkN/XPlwcfpeEVwYq0atfHz2iHDAY0nAJq3cbFRFNbbD3QLaeU60SeTsIYnSu
	Fg9n6nNoaQMU8LDYgxPPO+II65O9hltLjNIz878z09J5AzTCLiolIeC0v6bzLLK2uLMMyTyi0fX68
	Zvt9ra/Go4s7+C8r3gzC6jmpsyMp+VUfbB8ncoVNYSGawQBtY7M8GjInOsZlzASXB5wB3qMaRMAl1
	i/KP1hxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7fD-0000000E27j-2wx0;
	Mon, 29 Jun 2026 08:48:23 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7fB-0000000E27C-1EPx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 08:48:22 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2c81db32393so66345ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 01:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782722900; x=1783327700; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2CYHaiLd9ywNSZ9pftV2yPbkytXEfUK5AIl8p5DJYxA=;
        b=BLFFe/JRYEGsn9tUj4niKMc0M632LrGL5zLw8LkCXWvgwTtTGDcitpRcv2MQkwZ/gG
         a9jo/7tOTOTF+5E3zI6YcZz6CIr7qGd2o7a87sZ+oRNom08X3nUv+1U6kFT+6IzRdd2B
         /JmSPrVWaw8yVMNaZ5VoH/ylAWiUM5E/t6rpYz+9L04rp9hN2qfdRCHM6K2bQ4hSzSzX
         8+3vSoP50AkZid/OX5fNPWMa4tYVuZJID0v9KrANMAKeDm75hKRt6uSzbfVdnGn5UMW+
         d529ciBmayPwPbneMv7BuV3AsqB2rsFKdtx3A0H0vGYTLnxAZfoRG39p5V76yGHQk5AT
         K4OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782722900; x=1783327700;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2CYHaiLd9ywNSZ9pftV2yPbkytXEfUK5AIl8p5DJYxA=;
        b=TkFTSBXMSiL+eZ6/i+lPi7pE5ILvnE1siSqS7ncA68PeiAcPSZ041MbLY1Evq9qd6w
         5T69SWSF82iOI7r/kujATc2tPqnso4tcSR34dy9zCP0AwzbPPyGt6IRkpzCGBX1vZDD2
         WltCQJLunV83vSZMpYoOXXDux7NrjTBt2ujC8hiCeFvapsthaoq/EdXwpTKZD/UyVI7+
         P5jUfpo6qZ2zYAVh/L3xWN9Vo1EYHN0nSDqoJOCXgp6zRbCFY7IcdY34gcki7MvYhSK9
         /AMfltAZaPpciFXkxx1oll1U+P0XF2KE7sfhUb8NLiKxOcUyxnGtj+4S1uFwGopOq/HP
         nvHw==
X-Forwarded-Encrypted: i=1; AHgh+Rru1mMxCn112K+qIvPF77y3QYjryobGBReocSqfTN0nt4BuREEiRwHONXSgQTtdZM2QHpI4plRZUK7Okug/s3WU@lists.infradead.org
X-Gm-Message-State: AOJu0YxtxGQchXg8glgDypaosc81R25ZjH6Gw2J1VPhZgNuFPLw35whw
	3DH9+QQ67brnav7m6MnyrHytKkovh6GEupeadX7JE2MG0zzFA+oGPVMPHWgSfm63Jw==
X-Gm-Gg: AfdE7ckNVosVjWieK0O8emMgnM3ML+3+Ee7ytI0GkgtsizUYXuf2jfnnsf6if7vA0eQ
	vzD9L5K+qMjVxCUyRKNRRXe/epTEPKd7St0hreQrQGszumYkKtnDvwhbUXFFpxLVfodvo4j/Bzk
	FMd/hgTowzEhhmgTnqL2hI+11xnN5M5hrZ5IOCLwqg7KMMXRxcpOwZuZ2ac3OtdeOrAOSnpHeyU
	xTTwAlIBKtnKRQ6XzOqodAfEm3g8E2S8qBMBWgdZz7drJT+3yYEH31xd12pT7OjGYwEx3jbcJTe
	GQKelGTsMIES6Xet7gr5/qsJqIgpGyoZDyKWQnqIiPZEj83z3hL3TK4QDK8pLx3GSQiufzBAkd0
	PwAStoj+QHQHqLQxLN6DgMXOZVMNt1znHdMHaZqcC6wmbe+2t1HBQw5NTqrie5ae/G2gwuBMz9Z
	+ZyQ/lMEsijPV53spXyJZeK/dKB1hDbQ7lwaUi63MXlVGJISA=
X-Received: by 2002:a17:902:f612:b0:2c7:9e6a:1a8d with SMTP id d9443c01a7336-2c9a24512fcmr3816645ad.12.1782722899601;
        Mon, 29 Jun 2026 01:48:19 -0700 (PDT)
Received: from google.com (10.129.124.34.bc.googleusercontent.com. [34.124.129.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-846de12ed24sm2482229b3a.8.2026.06.29.01.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 01:48:18 -0700 (PDT)
Date: Mon, 29 Jun 2026 08:48:11 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, jgg@nvidia.com, joro@8bytes.org,
	kees@kernel.org, baolu.lu@linux.intel.com, kevin.tian@intel.com,
	miko.lenczewski@arm.com, smostafa@google.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	jamien@nvidia.com
Subject: Re: [PATCH rc v6 3/7] iommu/arm-smmu-v3: Do not enable EVTQ/PRIQ
 interrupts in kdump kernel
Message-ID: <akIxS7kuhuLRHAMg@google.com>
References: <cover.1779265413.git.nicolinc@nvidia.com>
 <e643786d849d274c1d8dcfc03795f572aef812bd.1779265413.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e643786d849d274c1d8dcfc03795f572aef812bd.1779265413.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_014821_371368_C6CB34FA 
X-CRM114-Status: GOOD (  29.82  )
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

On Wed, May 20, 2026 at 10:03:20AM -0700, Nicolin Chen wrote:
> In kdump cases, the crashed kernel's CDs and page tables can be corrupted,
> which could trigger event spamming. Also, we cannot serve page requests.
> 
> Skip the IRQ setup for EVTQ/PRIQ in arm_smmu_setup_irqs().
> 
> Skip their IRQ handler registration in unique-IRQ and combined-IRQ cases.
> 
> Fixes: b63b3439b856 ("iommu/arm-smmu-v3: Abort all transactions if SMMU is enabled in kdump kernel")
> Cc: stable@vger.kernel.org # v6.12+
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 58 ++++++++++++++-------
>  1 file changed, 39 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 2d7eb42449eaf..e00b28e36f9c4 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -2464,7 +2464,11 @@ static irqreturn_t arm_smmu_combined_irq_thread(int irq, void *dev)
>  
>  static irqreturn_t arm_smmu_combined_irq_handler(int irq, void *dev)
>  {
> -	arm_smmu_gerror_handler(irq, dev);
> +	irqreturn_t ret = arm_smmu_gerror_handler(irq, dev);
> +
> +	/* In kdump, EVTQ/PRIQ are disabled and there is no thread to wake */
> +	if (is_kdump_kernel())
> +		return ret;
>  	return IRQ_WAKE_THREAD;
>  }
>  
> @@ -4963,6 +4967,21 @@ static void arm_smmu_setup_unique_irqs(struct arm_smmu_device *smmu)
>  	arm_smmu_setup_msis(smmu);
>  
>  	/* Request interrupt lines */
> +	irq = smmu->gerr_irq;
> +	if (irq) {
> +		ret = devm_request_irq(smmu->dev, irq, arm_smmu_gerror_handler,
> +				       0, "arm-smmu-v3-gerror", smmu);
> +		if (ret < 0)
> +			dev_warn(smmu->dev, "failed to enable gerror irq\n");
> +	} else {
> +		dev_warn(smmu->dev,
> +			 "no gerr irq - errors will not be reported!\n");
> +	}
> +
> +	/* No EVTQ/PRIQ interrupts in kdump -- queues are disabled */
> +	if (is_kdump_kernel())
> +		return;
> +
>  	irq = smmu->evtq.q.irq;
>  	if (irq) {
>  		ret = devm_request_threaded_irq(smmu->dev, irq, NULL,
> @@ -4975,16 +4994,6 @@ static void arm_smmu_setup_unique_irqs(struct arm_smmu_device *smmu)
>  		dev_warn(smmu->dev, "no evtq irq - events will not be reported!\n");
>  	}
>  
> -	irq = smmu->gerr_irq;
> -	if (irq) {
> -		ret = devm_request_irq(smmu->dev, irq, arm_smmu_gerror_handler,
> -				       0, "arm-smmu-v3-gerror", smmu);
> -		if (ret < 0)
> -			dev_warn(smmu->dev, "failed to enable gerror irq\n");
> -	} else {
> -		dev_warn(smmu->dev, "no gerr irq - errors will not be reported!\n");
> -	}
> -
>  	if (smmu->features & ARM_SMMU_FEAT_PRI) {
>  		irq = smmu->priq.q.irq;
>  		if (irq) {
> @@ -5005,7 +5014,7 @@ static void arm_smmu_setup_unique_irqs(struct arm_smmu_device *smmu)
>  static int arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
>  {
>  	int ret, irq;
> -	u32 irqen_flags = IRQ_CTRL_EVTQ_IRQEN | IRQ_CTRL_GERROR_IRQEN;
> +	u32 irqen_flags = IRQ_CTRL_GERROR_IRQEN;
>  
>  	/* Disable IRQs first */
>  	ret = arm_smmu_write_reg_sync(smmu, 0, ARM_SMMU_IRQ_CTRL,
> @@ -5020,19 +5029,30 @@ static int arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
>  		/*
>  		 * Cavium ThunderX2 implementation doesn't support unique irq
>  		 * lines. Use a single irq line for all the SMMUv3 interrupts.
> +		 *
> +		 * In kdump, EVTQ/PRIQ are disabled, so no threaded handling.
>  		 */
> -		ret = devm_request_threaded_irq(smmu->dev, irq,
> -					arm_smmu_combined_irq_handler,
> -					arm_smmu_combined_irq_thread,
> -					IRQF_ONESHOT,
> -					"arm-smmu-v3-combined-irq", smmu);
> +		if (is_kdump_kernel())
> +			ret = devm_request_irq(smmu->dev, irq,
> +					       arm_smmu_combined_irq_handler, 0,
> +					       "arm-smmu-v3-combined-irq",
> +					       smmu);

This `if` isn't needed, we can continue using devm_request_threaded_irq,
if you look at the doc for devm_request_threaded_irq [1] it says:

/**
 * devm_request_threaded_irq - allocate an interrupt line for a managed device with error logging
 * @dev:	Device to request interrupt for
 * @irq:	Interrupt line to allocate
 * @handler:	Function to be called when the interrupt occurs
 * @thread_fn:	Function to be called in a threaded interrupt context. NULL
 *		for devices which handle everything in @handler
 * @irqflags:	Interrupt type flags
 * @devname:	An ascii name for the claiming device, dev_name(dev) if NULL
 * @dev_id:	A cookie passed back to the handler function
[...]
*/

So, we can pass handler() here while leaving the thread_fn == NULL:

ret = devm_request_threaded_irq(smmu->dev, irq,
         arm_smmu_combined_irq_handler,
         is_kdump_kernel() ? NULL : arm_smmu_combined_irq_thread,
         IRQF_ONESHOT,
         "arm-smmu-v3-combined-irq", smmu);

(In fact that's exactly what devm_request_irq does under the hood [2])

Additionally, the arm_smmu_combined_irq_handler() returns 
IRQ_WAKE_THREAD unconditionally, which causes us to hit the warn_on[3] in
__handle_irq_event_percpu.

Hence, we'd need to refactor the arm_smmu_combined_irq_handler() to
return IRQ_HANDLED / _NONE if is_kdump_kernel().

> +		else
> +			ret = devm_request_threaded_irq(
> +				smmu->dev, irq, arm_smmu_combined_irq_handler,
> +				arm_smmu_combined_irq_thread, IRQF_ONESHOT,
> +				"arm-smmu-v3-combined-irq", smmu);
>  		if (ret < 0)
>  			dev_warn(smmu->dev, "failed to enable combined irq\n");
>  	} else
>  		arm_smmu_setup_unique_irqs(smmu);
>  
> -	if (smmu->features & ARM_SMMU_FEAT_PRI)
> -		irqen_flags |= IRQ_CTRL_PRIQ_IRQEN;
> +	/* No EVTQ/PRIQ IRQ generation in kdump -- queues are disabled */
> +	if (!is_kdump_kernel()) {
> +		irqen_flags |= IRQ_CTRL_EVTQ_IRQEN;
> +		if (smmu->features & ARM_SMMU_FEAT_PRI)
> +			irqen_flags |= IRQ_CTRL_PRIQ_IRQEN;
> +	}
>  
>  	/* Enable interrupt generation on the SMMU */
>  	ret = arm_smmu_write_reg_sync(smmu, irqen_flags,
> -- 
> 2.43.0
> 

Thanks,
Praan

[1] https://elixir.bootlin.com/linux/v7.1.1/source/kernel/irq/devres.c#L75
[2] https://elixir.bootlin.com/linux/v7.1.1/source/include/linux/interrupt.h#L218
[3] https://elixir.bootlin.com/linux/v7.1.1/source/kernel/irq/handle.c#L225

