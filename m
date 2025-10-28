Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A89CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 17:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qU10Z8G6J7eXJWo7d4xe6BYajKfdH+fdizfK14pbJew=; b=qNWcZ37ltHBd1HsryLsAQYObdG
	FgQXO9Pfm6kanl/ULeBWi1HxS05Q9yOKDK3+FshjWWxpHDCaAp1qUSooHLZ7A/oFg9xEqUFnG+86+
	r9rSVwwxKd3bqmFhM0TOfoaEProlQ4B4piYOpKJ32NGOhc4Y6NC8o1aGP0Rf82baBlr1FdvoY+pWW
	3NO6WL38kJRSPyxdNoexsiR74MrKtJdKnZ1ZzD6FnB3X7AFFKh3+WODkqZgZ07sNH7MAcT0IN7bCE
	rAzs2nJ/ftllA55LeC3t7+HLXmEfIDNn/PopteaZgJXVI7Pf39UrrBUt86ch1+RkTRYRoGyn/2YGE
	5zxuMyOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDndB-0000000GPpl-3mJb;
	Tue, 28 Oct 2025 17:37:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDnd9-0000000GPpO-1Zjo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 17:37:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA05C168F;
	Tue, 28 Oct 2025 10:37:01 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D3223F673;
	Tue, 28 Oct 2025 10:37:03 -0700 (PDT)
Message-ID: <d91f65fb-900f-4d21-ad5e-0cbe146bbb65@arm.com>
Date: Tue, 28 Oct 2025 17:37:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/mpam: Clean MBWU monitor overflow bit
To: Zeng Heng <zengheng4@huawei.com>, james.morse@arm.com
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 catalin.marinas@arm.com, dakr@kernel.org, dave.martin@arm.com,
 david@redhat.com, dfustini@baylibre.com, fenghuay@nvidia.com,
 gregkh@linuxfoundation.org, gshan@redhat.com, guohanjun@huawei.com,
 jeremy.linton@arm.com, jonathan.cameron@huawei.com, kobak@nvidia.com,
 lcherian@marvell.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lpieralisi@kernel.org, peternewman@google.com, quic_jiles@quicinc.com,
 rafael@kernel.org, robh@kernel.org, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com, sudeep.holla@arm.com,
 sunnanyong@huawei.com, tan.shaopeng@fujitsu.com, wangkefeng.wang@huawei.com,
 will@kernel.org, xhao@linux.alibaba.com
References: <a3e95937-b0c7-020e-d52d-7189d2540f8f@huawei.com>
 <20251025093428.1379218-1-zengheng4@huawei.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20251025093428.1379218-1-zengheng4@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_103711_548560_4168D8EC 
X-CRM114-Status: GOOD (  22.16  )
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

Hi Zeng,

On 10/25/25 10:34, Zeng Heng wrote:
> The MSMON_MBWU register accumulates counts monotonically forward and
> would not automatically cleared to zero on overflow. The overflow portion
> is exactly what mpam_msmon_overflow_val() computes, there is no need to
> additionally subtract mbwu_state->prev_val.
> 
> Before invoking write_msmon_ctl_flt_vals(), the overflow bit of the
> MSMON_MBWU register must first be read to prevent it from being
> inadvertently cleared by the write operation. Then, before updating the
> monitor configuration, the overflow bit should be cleared to zero.
> 
> Finally, use the overflow bit instead of relying on counter wrap-around
> to determine whether an overflow has occurred, that avoids the case where
> a wrap-around (now > prev_val) is overlooked.
> 
> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
> ---
>  drivers/resctrl/mpam_devices.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 0dd048279e02..575980e3a366 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -1062,6 +1062,21 @@ static u64 mpam_msmon_overflow_val(enum mpam_device_features type)
>  	}
>  }
>  
> +static bool read_msmon_mbwu_is_overflow(struct mpam_msc *msc)
> +{
> +	u32 ctl;
> +	bool overflow;
> +
> +	ctl = mpam_read_monsel_reg(msc, CFG_MBWU_CTL);
> +	overflow = ctl & MSMON_CFG_x_CTL_OFLOW_STATUS ? true : false;
> +
> +	if (overflow)
> +		mpam_write_monsel_reg(msc, CFG_MBWU_CTL, ctl &
> +				     ~MSMON_CFG_x_CTL_OFLOW_STATUS);


Seems sensible. It's best to consider the overflow status bit for long
counters as well. Although, that's introduced later in the series so
depends on patch ordering. (Sorry, was considering patches on top of the
full series when I commented on counter length before.)

> +
> +	return overflow;
> +}
> +
>  /* Call with MSC lock held */
>  static void __ris_msmon_read(void *arg)
>  {
> @@ -1069,6 +1084,7 @@ static void __ris_msmon_read(void *arg)
>  	bool config_mismatch;
>  	struct mon_read *m = arg;
>  	u64 now, overflow_val = 0;
> +	bool mbwu_overflow = false;
>  	struct mon_cfg *ctx = m->ctx;
>  	bool reset_on_next_read = false;
>  	struct mpam_msc_ris *ris = m->ris;
> @@ -1091,6 +1107,7 @@ static void __ris_msmon_read(void *arg)
>  			reset_on_next_read = mbwu_state->reset_on_next_read;
>  			mbwu_state->reset_on_next_read = false;
>  		}
> +		mbwu_overflow = read_msmon_mbwu_is_overflow(msc);

If the config is then found to mismatch, then mbwu_overflow can be
subsequently set to false.

>  	}
>  
>  	/*
> @@ -1138,8 +1155,8 @@ static void __ris_msmon_read(void *arg)
>  		mbwu_state = &ris->mbwu_state[ctx->mon];
>  
>  		/* Add any pre-overflow value to the mbwu_state->val */
> -		if (mbwu_state->prev_val > now)
> -			overflow_val = mpam_msmon_overflow_val(m->type) - mbwu_state->prev_val;
> +		if (mbwu_overflow)
> +			overflow_val = mpam_msmon_overflow_val(m->type);

Yep, makes sense.

>  
>  		mbwu_state->prev_val = now;

With this prev_val no longer has any use.

>  		mbwu_state->correction += overflow_val;
Thanks,

Ben


