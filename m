Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E80CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 15:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n01WCNPeg9z3AiuLAtvEO/xgxNAlHvGR+6lhhr+hIWk=; b=g6AApu+wiAGWJ+CODfJUN5PaXR
	lhq/TXcdm075mfwQakPYuCNzcU9pby+6vn+sCSLWGPFQzoAJ9hvcmwi+mYMfP+3gSCyoFQpgjmQHY
	DV6USyEZAM7MeLZbpeekqTMGVNo618PDFPoDpNkGJzD+8jZK0yza83JSFVENkpU5qeyZdwwC+5LEx
	EzZNzgkH4zwLM5oHu/LYIN6xzrvID7r9eK7lY1JoB3EvymnpVr7n3I7AWukPCxt6fLd4jLjU5yxv+
	ByAU91ySKSWI6JAQ35lipmtuyOd1ELUZ4Iw8/dpg5+6vJg0keDnDUcgnN87tpKmhVkOKmRDHHT3mN
	Tj4p9Y7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCfIX-0000000BwSj-24hN;
	Fri, 02 Oct 2026 15:35:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCfIV-0000000BwSM-35cs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 15:35:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 660BE143D;
	Fri,  2 Oct 2026 08:35:39 -0700 (PDT)
Received: from [10.211.55.3] (unknown [10.57.85.160])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 938703F882;
	Fri,  2 Oct 2026 08:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790955342; bh=Ey7NB0qS8ZKugxYGyiBGHdk7OWdkE3p8zHjWGF3bJIU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DQs0wtCCgfEpU67TSvbohdw6qNHUkNJsGw92h4qZqWNL0cUCqrQv85AdepTt58uCF
	 Bt0GMxEaN4JTO9wdQsnxKA3+CpF0o4pGW4CuSMBpopq4pelsJMalKLMKqhL5GYs/CB
	 OJ3URr3fW5C9idBqNqj7NeZ0I/Mqy8PfqUdd33Eg=
Message-ID: <99c7f8d2-b65a-4e8b-bb7e-1de16fed3190@arm.com>
Date: Fri, 2 Oct 2026 16:35:37 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v12 08/13] arm_mpam: propagate MSC access errors for
 interrupt control
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
 Ritwick Sharma <ritwick.sharma@arm.com>, Gavin Shan <gshan@redhat.com>,
 linux-acpi@vger.kernel.org--cc, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261001153439.3295416-1-andre.przywara@arm.com>
 <20261001153439.3295416-9-andre.przywara@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261001153439.3295416-9-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_083543_872098_003D568E 
X-CRM114-Status: GOOD (  20.09  )
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

On 01/10/2026 16:34, Andre Przywara wrote:
> Allow the functions dealing with interrupt registration and enablement
> to check for and return errors, and propagate MSC read and write errors
> from the lower level up.
> This does not cover the IRQ handler yet, as this needs some more
> attention.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

Reviewed-by: Ben Horgan <ben.horgan@arm.com>

Thanks,

Ben

> ---
>  drivers/resctrl/mpam_devices.c | 23 +++++++++++------------
>  1 file changed, 11 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index b876f4d2e9a77..60f6a39176ea1 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -1118,7 +1118,9 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
>  	}
>  
>  	/* Clear any stale errors */
> -	mpam_msc_clear_esr(msc);
> +	ret = mpam_msc_clear_esr(msc);
> +	if (ret)
> +		return ret;
>  
>  	spin_lock(&partid_max_lock);
>  	mpam_partid_max = min(mpam_partid_max, msc->partid_max);
> @@ -2681,9 +2683,7 @@ static int mpam_enable_msc_ecr(void *_msc)
>  {
>  	struct mpam_msc *msc = _msc;
>  
> -	__mpam_write_reg(msc, MPAMF_ECR, MPAMF_ECR_INTEN);
> -
> -	return 0;
> +	return __mpam_write_reg(msc, MPAMF_ECR, MPAMF_ECR_INTEN);
>  }
>  
>  /* This can run in mpam_disable(), and the interrupt handler on the same CPU */
> @@ -2691,9 +2691,7 @@ static int mpam_disable_msc_ecr(void *_msc)
>  {
>  	struct mpam_msc *msc = _msc;
>  
> -	__mpam_write_reg(msc, MPAMF_ECR, 0);
> -
> -	return 0;
> +	return __mpam_write_reg(msc, MPAMF_ECR, 0);
>  }
>  
>  static irqreturn_t __mpam_irq_handler(int irq, struct mpam_msc *msc)
> @@ -2790,11 +2788,12 @@ static int mpam_register_irqs(void)
>  				return err;
>  		}
>  
> -		mutex_lock(&msc->error_irq_lock);
> +		guard(mutex)(&msc->error_irq_lock);
>  		msc->error_irq_req = true;
> -		mpam_touch_msc(msc, mpam_enable_msc_ecr, msc);
> +		err = mpam_touch_msc(msc, mpam_enable_msc_ecr, msc);
> +		if (err)
> +			return err;
>  		msc->error_irq_hw_enabled = true;
> -		mutex_unlock(&msc->error_irq_lock);
>  	}
>  
>  	return 0;
> @@ -2815,8 +2814,8 @@ static void mpam_unregister_irqs(void)
>  
>  		mutex_lock(&msc->error_irq_lock);
>  		if (msc->error_irq_hw_enabled) {
> -			mpam_touch_msc(msc, mpam_disable_msc_ecr, msc);
> -			msc->error_irq_hw_enabled = false;
> +			if (!mpam_touch_msc(msc, mpam_disable_msc_ecr, msc))
> +				msc->error_irq_hw_enabled = false;
>  		}
>  
>  		if (msc->error_irq_req) {


