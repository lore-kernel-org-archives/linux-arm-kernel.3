Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 569CEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 10:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CmGr1LsCvRq8WX79ooawn41VBpzZWSzROGsoa7z/P2s=; b=ZrnimsC+GJzfrlLil4+h+YAzuG
	/08Gf7RUS2404PrSCdw9655gB56gG88Cfoh99CN1SqTZz/B/ocxl2OJfMYZ68zae4JXt8UbHP7Q5X
	jS2u6LEsTeYj6YEmMaxzA9lHjWCIFsihyMX2iWerpzRQzOyFtqeQd8lm9YIgialp3O5LkWB+0L2S9
	oMag7L6lw54TwpGVS9uIUd6imaQIpLHCiygTpafpqiMgvB/dV6F2YjoX7IXWbtaqGwc/gcgK5FD2E
	oP9OI17siY1Q2ZNIBaHp+EyDDaxSn3hvM/B3AsFsF9MH0L3BPyN2OtRCl9UUPSJI1yTzWrPHKpfSX
	k3ouOkLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbZE-00000006jTl-3Gn3;
	Fri, 03 Jul 2026 10:56:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbZB-00000006jSh-3FM1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 10:56:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 11EC11F91;
	Fri,  3 Jul 2026 03:56:12 -0700 (PDT)
Received: from [10.211.55.3] (unknown [10.57.73.238])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 405E13F905;
	Fri,  3 Jul 2026 03:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783076176; bh=ib+jJeqAaNrgnlTJcoYJ6GWsMpg4EWkroOHnmx53RzI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dq3gTaOglJw3duLPTmbmtELC62r50lAPmCDJJTHO+w2qzB6g/CyyuOToBNHbUOXZT
	 ULsg2vAvZo6Ho7U5E1FHwj7ioUb5Lw6vwBO5a0t5DoUxnJPVOV3RcyiEbVlbReHkxd
	 kSN8oMq5oJLa34wGP+E3WjG/8VW7NTKRfGjVaEqs=
Message-ID: <f418f531-bc0b-4bff-a96f-121034c6c693@arm.com>
Date: Fri, 3 Jul 2026 11:54:55 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v2 14/15] arm_mpam: prevent MPAM-Fb accesses inside IRQ
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
 Niyas Sait <niyas.sait@arm.com>, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260702162229.4008659-1-andre.przywara@arm.com>
 <20260702162229.4008659-15-andre.przywara@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260702162229.4008659-15-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_035617_996333_3626F2A1 
X-CRM114-Status: GOOD (  24.42  )
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

On 7/2/26 17:22, Andre Przywara wrote:
> When an MPAM MSC gets into an error condition, it can trigger an error
> IRQ. We cannot really do much about those errors, but we at least query
> and log the error, then disable MPAM functionality.
> 
> This error report relies on reading the MSC's error status register
> (ESR) in the IRQ handler, which is not possible for MPAM-Fb based
> MSC accesses, since they involve mailbox routines that might sleep.
> The same is true for clearing the interrupt at the source, which
> requires MSC access.
> 
> For simplicity just skip the ESR read when the MSC is not using direct
> MMIO accesses, and just ignore the pending interrupts. We will wrap up
> MPAM functionality regardless, knowing the exact error value will not
> change that.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/resctrl/mpam_devices.c | 35 +++++++++++++++++++---------------
>  1 file changed, 20 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index b858ff389bff..4a088e6cd235 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -2639,7 +2639,7 @@ static int mpam_disable_msc_ecr(void *_msc)
>  
>  static irqreturn_t __mpam_irq_handler(int irq, struct mpam_msc *msc)
>  {
> -	u64 reg;
> +	u64 reg = 0;
>  	u16 partid;
>  	u8 errcode, pmg, ris;
>  
> @@ -2648,25 +2648,30 @@ static irqreturn_t __mpam_irq_handler(int irq, struct mpam_msc *msc)
>  					   &msc->accessibility)))
>  		return IRQ_NONE;
>  
> -	mpam_msc_read_esr(msc, &reg);
> +	/* MPAM-Fb MSC accesses cannot be done in atomic context. */
> +	if (msc->iface == MPAM_IFACE_MMIO) {
> +		mpam_msc_read_esr(msc, &reg);
>  
> -	errcode = FIELD_GET(MPAMF_ESR_ERRCODE, reg);
> -	if (!errcode)
> -		return IRQ_NONE;
> +		errcode = FIELD_GET(MPAMF_ESR_ERRCODE, reg);
> +		if (!errcode)
> +			return IRQ_NONE;
>  
> -	/* Clear level triggered irq */
> -	mpam_msc_clear_esr(msc);
> +		/* Clear level triggered irq */
> +		mpam_msc_clear_esr(msc);
>  
> -	partid = FIELD_GET(MPAMF_ESR_PARTID_MON, reg);
> -	pmg = FIELD_GET(MPAMF_ESR_PMG, reg);
> -	ris = FIELD_GET(MPAMF_ESR_RIS, reg);
> +		partid = FIELD_GET(MPAMF_ESR_PARTID_MON, reg);
> +		pmg = FIELD_GET(MPAMF_ESR_PMG, reg);
> +		ris = FIELD_GET(MPAMF_ESR_RIS, reg);
>  
> -	pr_err_ratelimited("error irq from msc:%u '%s', partid:%u, pmg: %u, ris: %u\n",
> -			   msc->id, mpam_errcode_names[errcode], partid, pmg,
> -			   ris);
> +		pr_err_ratelimited("error irq from msc:%u '%s', partid:%u, pmg: %u, ris: %u\n",
> +				   msc->id, mpam_errcode_names[errcode], partid,
> +				   pmg, ris);
>  
> -	/* Disable this interrupt. */
> -	mpam_disable_msc_ecr(msc);
> +		/* Disable this interrupt. */
> +		mpam_disable_msc_ecr(msc);

As an error interrupt is final can we just disable the IRQ? Is it
useful? I see there is a function disable_irq_no_sync().

> +	} else {
> +		pr_err_ratelimited("unknown error irq from msc:%u\n", msc->id);

Should we report by irq number?
As MSC may share interrupts we don't know which MSC caused the error irq
at this point. On MMIO platforms we read the ESR to establish this.

Thanks,

Ben

> +	}
>  
>  	/* Are we racing with the thread disabling MPAM? */
>  	if (!mpam_is_enabled())


