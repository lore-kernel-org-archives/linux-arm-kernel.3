Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D1AC55822
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 17:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xUQ6+Wm1NFEwRP6d51BRTk84DCU0LW89DYgV5pi9fcI=; b=0gki6yxHrmk2pP1aKkX7vQkmBS
	8hm2kj97d9jicyzNLLRlJgrGQb/8qsYDocR1xw5+7ofdpQ9nsfaSKcQdW8a6kR+uBEq+Qmz5LbOvL
	pB80iGJXmYtSdqhIrT4m2Prd6+GHlN+c8dleAZ/tUPUIAvZnH/t1VicAqpfpQYwZ8nxTp3920mqcR
	V7mU260hZ/QurUcJl2SGcz1rNSTuAHpdNRQ6V3pGBx0dG5i2eoCuFxrLqU2FIzh12EBQcOaub6EpA
	RNrO1jKBrS2+/vaGxKNTOOYLP3HJbGAHsMy+OaU+8kCBZ16hyQE9LFbeYoXSQ1MgQ4Gck1GiA47Oc
	gQQ3FeAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqwUT-00000000Eq4-1Iqz;
	Mon, 03 Aug 2026 17:30:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqwUQ-00000000Epd-1iMH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 17:30:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC4BA143D;
	Mon,  3 Aug 2026 10:30:08 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E2EC3F632;
	Mon,  3 Aug 2026 10:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785778212; bh=9YM35LW5OLzP8OftHEbL6r3w+81q6IrW3F6X2Vt474Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pBxzW30lBcff3mXSkDZZV8G4XUG141b0Or932Tt2N3JBCsoiG+YOWCfX8rLV3rK/V
	 g2k6tVCh2h7Yta99awsT6G7XLT1fzyTf8smWty9f2ygWSMfQYa6ndxwXQZtyZeWtNF
	 k0oMEnZJ26ueqHhOe93FeRHjGEDGsoArqSd55+LU=
Message-ID: <a812717f-cf0d-4722-849c-b6f5c7b5b395@arm.com>
Date: Mon, 3 Aug 2026 18:30:08 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v7 10/11] arm_mpam: change MPAM-Fb error IRQ to use a
 threaded IRQ handler
To: Andre Przywara <andre.przywara@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 James Morse <james.morse@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
 Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
 Trilok Soni <tsoni@quicinc.com>, Srinivas Ramana <sramana@qti.qualcomm.com>,
 Niyas Sait <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
 Ritwick Sharma <ritwick.sharma@arm.com>, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260731170324.2927758-1-andre.przywara@arm.com>
 <20260731170324.2927758-11-andre.przywara@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260731170324.2927758-11-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_103014_531407_B342BB30 
X-CRM114-Status: GOOD (  35.21  )
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

Hi Andre,

On 7/31/26 18:03, Andre Przywara wrote:
> When an MPAM MSC gets into an error condition, it can trigger an error
> IRQ. We cannot really do much about those errors, but we at least query
> and log the error, then disable MPAM functionality.
> 
> This error report relies on reading the MSC's error status register
> (ESR) in the current hard-IRQ handler, which is not possible for MPAM-Fb
> based MSC accesses, since they involve mailbox routines that might sleep.
> The same is true for clearing the interrupt at the source, which requires
> an MSC access as well.
> 
> When an MSC is using MPAM-Fb, change the error IRQ to use a threaded IRQ
> handler, with an empty hard IRQ routine, and doing all the MSC accesses
> (to access the status and disable the IRQ line) in the threaded part.
> Also forbid per-CPU interrupts (PPIs) for MPAM-Fb, as we cannot use a
> threaded IRQ here.
> 
> The change in the actual IRQ handler is minimal, we just check for the
> first MSC access error and bail out early. MMIO based MSCs keep using a
> hard-IRQ handler, since they must be at least non-migrate-able when doing
> MSC accesses, for the CPU affinity check to work.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/resctrl/mpam_devices.c | 52 +++++++++++++++++++++++++---------
>  1 file changed, 39 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index ea08c12f717a..b238feb559d4 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -2713,24 +2713,38 @@ static int mpam_disable_msc_ecr(void *_msc)
>  	return 0;
>  }
>  
> +/*
> + * This will run as the threaded IRQ handler part when using MPAM-Fb, but
> + * as the sole hard-IRQ handler for MMIO based accesses.
> + */
>  static irqreturn_t __mpam_irq_handler(int irq, struct mpam_msc *msc)
>  {
>  	u64 reg;
> +	int ret;
>  	u16 partid;
>  	u8 errcode, pmg, ris;
>  
> -	if (WARN_ON_ONCE(!msc) ||
> +	if (WARN_ON_ONCE(!msc))
> +		return IRQ_NONE;
> +
> +	if (msc->iface == MPAM_IFACE_MMIO &&
>  	    WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(),
>  					   &msc->accessibility)))
>  		return IRQ_NONE;
>  
> -	mpam_msc_read_esr(msc, &reg);
> +	ret = mpam_msc_read_esr(msc, &reg);
> +	if (ret) {
> +		pr_err_ratelimited("unknown error irq from msc:%u\n", msc->id);
> +
> +		/* Try out best here ... */
> +		goto out_disable;
> +	}
>  
>  	errcode = FIELD_GET(MPAMF_ESR_ERRCODE, reg);
>  	if (!errcode)
>  		return IRQ_NONE;
>  
> -	/* Clear level triggered irq */
> +	/* Clear level triggered irq. Ignore errors, we need to proceed. */
>  	mpam_msc_clear_esr(msc);
>  
>  	partid = FIELD_GET(MPAMF_ESR_PARTID_MON, reg);
> @@ -2741,19 +2755,19 @@ static irqreturn_t __mpam_irq_handler(int irq, struct mpam_msc *msc)
>  			   msc->id, mpam_errcode_names[errcode], partid, pmg,
>  			   ris);
>  
> -	/* Disable this interrupt. */
> +out_disable:
> +	/* Disable this interrupt. Ignore errors, we need to proceed anyway. */
>  	mpam_disable_msc_ecr(msc);


If IRQ_NONE is not correct is disable_irq_nosync() better? We only ever need the error irq handler
to run once and we don't want the schedule_work() to contend with the handler being run again and again.

Thanks,

Ben

>  
> -	/* Are we racing with the thread disabling MPAM? */
> -	if (!mpam_is_enabled())
> -		return IRQ_HANDLED;
> -
>  	/*
> -	 * Schedule the teardown work. Don't use a threaded IRQ as we can't
> -	 * unregister the interrupt from the threaded part of the handler.
> +	 * Schedule the teardown work. We have to defer it as we can't
> +	 * unregister the interrupt from the threaded part of a handler.
> +	 * Check whether we are racing with the thread disabling MPAM.
>  	 */
> -	mpam_disable_reason = "hardware error interrupt";
> -	schedule_work(&mpam_broken_work);
> +	if (mpam_is_enabled()) {
> +		mpam_disable_reason = "hardware error interrupt";
> +		schedule_work(&mpam_broken_work);
> +	}
>  
>  	return IRQ_HANDLED;
>  }
> @@ -2789,6 +2803,11 @@ static int mpam_register_irqs(void)
>  		/* The MPAM spec says the interrupt can be SPI, PPI or LPI */
>  		/* We anticipate sharing the interrupt with other MSCs */
>  		if (irq_is_percpu(irq)) {
> +			if (msc->iface != MPAM_IFACE_MMIO) {
> +				dev_err(&msc->pdev->dev,
> +					"Only MMIO MSCs can use per-CPU interrupts\n");
> +				return -EINVAL;
> +			}
>  			err = request_percpu_irq(irq, &mpam_ppi_handler,
>  						 "mpam:msc:error",
>  						 msc->error_dev_id);
> @@ -2799,12 +2818,19 @@ static int mpam_register_irqs(void)
>  			smp_call_function_many(&msc->accessibility,
>  					       &_enable_percpu_irq, &irq,
>  					       true);
> -		} else {
> +		} else if (msc->iface == MPAM_IFACE_MMIO) {
>  			err = devm_request_irq(&msc->pdev->dev, irq,
>  					       &mpam_spi_handler, IRQF_SHARED,
>  					       "mpam:msc:error", msc);
>  			if (err)
>  				return err;
> +		} else {
> +			err = devm_request_threaded_irq(&msc->pdev->dev, irq,
> +							NULL, &mpam_spi_handler,
> +							IRQF_SHARED | IRQF_ONESHOT,
> +							"mpam:msc:error", msc);
> +			if (err)
> +				return err;
>  		}
>  
>  		mutex_lock(&msc->error_irq_lock);


