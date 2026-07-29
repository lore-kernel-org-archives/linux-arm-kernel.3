Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A11C53219
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 15:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7BZQAJ04IfTNc0CkDFzgPEWJ5U0mGWd/ronQVT6SGBw=; b=QO1k+wJYQnjiAQXayC/tGjkUBb
	VYaSh8AKQYIpKcO6rfpIq51TtZa0Zi73ccFKQaulWayfmdZatvI7uoUDLhAQHd3QnhWbc6a32fsjE
	ennhXdbhI1xPphe9CuclqKEpmfM/qMXM9wVqG60CRZYbGiqmEuGaWebNVhXaWRlu/iNq7+X60tpS7
	uAoGahfIwOzOFwUzhxAp2s3uPwZp+TAc9kd0jSeSho5+AD8+lr7PQomS9ZRNYrTqoZJ6Tr0Fzntoc
	6rEow3rfkmaLMtD0EjLvGjHfGYIEa1iAeGZrdebot1LftFliR9ayzG8Amch/XZqldM1CSJmEpIy1R
	ZoLXB26Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp688-00000008OAL-09Hc;
	Wed, 29 Jul 2026 15:23:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp680-00000008O5w-1HBq
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 29 Jul 2026 15:23:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7BZQAJ04IfTNc0CkDFzgPEWJ5U0mGWd/ronQVT6SGBw=; b=LXBqh7HpMppvi2RRxUyBfokr1W
	iklbuEU9COtKuuxT3NgsF67t2PGvEDae5oK2FFeG8QJbeRs8nTBpOVliZ67qTcJyg0JfwYdyEKb4j
	iMr8Hsvt6Wjpk7CQhH1HZuyQkGEQeVGcsbqNx2SsnUySgRjIhf/lKc9Rktdl40179HlFVaVIYvCd3
	eVMvpnqKOdCYYgmvIj/Q/Q/cwaUq5jnUKM5SWJy/uX0AnWg6xpCi0DJAQegWsKJ6HbExr1p1AeUqY
	UB43uLTL1dsb/A/z8fisRZbmd0H2FiCmvYj5NBnA4UFjnOF6LgUks/3QWsTJIXvOiHk660GxNliY5
	W/isr2bA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wp67x-00000005wrx-03sf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 15:23:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56E3A1684;
	Wed, 29 Jul 2026 08:23:18 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A1BAD3F763;
	Wed, 29 Jul 2026 08:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785338602; bh=6HpZg3HTf+dCj1Efa/gkF7FZ9+bHwZGO9kLymlTaf9M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Yrz7TVUAHRSB36VjRm1//NZMBIaL+MHHh4Rv2vuxoIqFgR9IJHuQJ4GmN6eGnE9Oc
	 QwWYI+HfUr5B5cmXFQ7lC6GnrSvXvfHa4kI2FUTg65RlbmZZ4V+akm0y5YYxxhNWlV
	 8/MwjWb1JWbBgJp19ohf5pZhMWiCh2QmRu87Fe3M=
Message-ID: <881a3224-fb19-4ded-ae7e-3f7ae139fe52@arm.com>
Date: Wed, 29 Jul 2026 16:23:18 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v5 09/10] arm_mpam: change error IRQ to use a threaded IRQ
 handler
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
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260729134124.2506269-1-andre.przywara@arm.com>
 <20260729134124.2506269-10-andre.przywara@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260729134124.2506269-10-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_162325_421851_C7072323 
X-CRM114-Status: GOOD (  31.13  )
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

On 7/29/26 14:41, Andre Przywara wrote:
> When an MPAM MSC gets into an error condition, it can trigger an error
> IRQ. We cannot really do much about those errors, but we at least query
> and log the error, then disable MPAM functionality.
> 
> This error report relies on reading the MSC's error status register
> (ESR) in the IRQ handler, which is not possible for MPAM-Fb based
> MSC accesses, since they involve mailbox routines that might sleep.
> The same is true for clearing the interrupt at the source, which
> requires an MSC access as well.
> 
> Change the error IRQ to use a threaded IRQ handler, with an empty hard
> IRQ routine, and doing all the MSC accesses (to access the status and
> disable the IRQ line) in the threaded part. The change is minimal, we
> just check for the first MSC access error and bail out early.
> Also forbid per-CPU interrupts (PPIs) for MPAM-Fb, as we cannot use a
> threaded IRQ here.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/resctrl/mpam_devices.c | 42 ++++++++++++++++++++++------------
>  1 file changed, 28 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index abe1e628928f..e535603d2c7d 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -2659,9 +2659,11 @@ static int mpam_disable_msc_ecr(void *_msc)
>  	return 0;
>  }
>  
> +/* threaded IRQ handler for shared IRQs, to allow MPAM-Fb accesses to sleep */

This comment seems incomplete. The same handler is used for the PPI hardirq.
>  static irqreturn_t __mpam_irq_handler(int irq, struct mpam_msc *msc)
>  {
>  	u64 reg;
> +	int ret;
>  	u16 partid;
>  	u8 errcode, pmg, ris;
>  
> @@ -2670,13 +2672,19 @@ static irqreturn_t __mpam_irq_handler(int irq, struct mpam_msc *msc)
>  					   &msc->accessibility)))
>  		return IRQ_NONE;
>  
> -	mpam_msc_read_esr(msc, &reg);
> +	ret = mpam_msc_read_esr(msc, &reg);

This is also called for MMIO accesses and the checks in the reads and writes call smp_processor_id()
which will give warnings if we are preemptible. There is also a similar to check higher up in this
handler. We need to choose in what context we call things based on whether we are using MMIO
accesses or MPAM-Fb.

Thanks,

Ben

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
> @@ -2687,19 +2695,19 @@ static irqreturn_t __mpam_irq_handler(int irq, struct mpam_msc *msc)
>  			   msc->id, mpam_errcode_names[errcode], partid, pmg,
>  			   ris);
>  
> -	/* Disable this interrupt. */
> +out_disable:
> +	/* Disable this interrupt. Ignore errors, we need to proceed anyway. */
>  	mpam_disable_msc_ecr(msc);
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
> @@ -2735,6 +2743,11 @@ static int mpam_register_irqs(void)
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
> @@ -2746,9 +2759,10 @@ static int mpam_register_irqs(void)
>  					       &_enable_percpu_irq, &irq,
>  					       true);
>  		} else {
> -			err = devm_request_irq(&msc->pdev->dev, irq,
> -					       &mpam_spi_handler, IRQF_SHARED,
> -					       "mpam:msc:error", msc);
> +			err = devm_request_threaded_irq(&msc->pdev->dev, irq,
> +							NULL, &mpam_spi_handler,
> +							IRQF_SHARED | IRQF_ONESHOT,
> +							"mpam:msc:error", msc);
>  			if (err)
>  				return err;
>  		}


