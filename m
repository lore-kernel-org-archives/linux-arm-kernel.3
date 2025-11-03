Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BFC4CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 14:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NdmHEZcNwg95QNmx30+4B0XVanJnQry283E+q8lC1Wo=; b=y/0QCDbKIN3x6WQWIMQxaG4sx2
	Th1qLjqHe8PBrfpvvJbwFpcJijnXXdzAJc/5rWhbdbdW0gSP4Aa4r08lWtpCnlFzOQRSP2KNyRqjn
	VK+wzCK0MWzjO8KGJMl0y7Et0YLsnVo7NAZUZquwGfsMaG79ffYtrnU+miLJm8KG/kgaUzXEihf6Z
	xcvXWiyKujRS41kYIESYAusdi9vBQNdCqK+EJVA9rP5rP4g1N7HndEWFTQig6hqPjR3nSIxIqtSyB
	HUO3sDEdVgVJMSzOqR1F4BAZ+OnjaxhFGjmHc+yPNWMeSDCs30khGngc9KisB8WBHIFVVqGJdNnJ3
	6x5FfVPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFvZu-0000000A1LS-3gMc;
	Mon, 03 Nov 2025 14:30:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFvZr-0000000A1KK-1HbF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 14:30:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C08051D14;
	Mon,  3 Nov 2025 06:30:24 -0800 (PST)
Received: from [10.57.71.89] (unknown [10.57.71.89])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 974803F694;
	Mon,  3 Nov 2025 06:30:30 -0800 (PST)
Message-ID: <da93580c-08de-4f0d-a05e-b5e2d34e8602@arm.com>
Date: Mon, 3 Nov 2025 14:30:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/11] coresight: etm4x: Properly control filter in CPU
 idle with FEAT_TRF
Content-Language: en-GB
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20251024-arm_coresight_power_management_fix-v4-0-690e69ae6977@arm.com>
 <20251024-arm_coresight_power_management_fix-v4-7-690e69ae6977@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20251024-arm_coresight_power_management_fix-v4-7-690e69ae6977@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_063035_450071_A31B54BD 
X-CRM114-Status: GOOD (  24.23  )
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

On 24/10/2025 17:45, Leo Yan wrote:
> If a CPU supports FEAT_TRF, as described in the section K5.5 "Context
> switching", Arm ARM (ARM DDI 0487 L.a), it defines a flow to prohibit
> program-flow trace, execute a TSB CSYNC instruction for flushing,
> followed by clearing TRCPRGCTLR.EN bit.
> 
> To restore the state, the reverse sequence is required.
> 
> This differs from the procedure described in the section 3.4.1 "The
> procedure when powering down the PE" of ARM IHI0064H.b, which involves
> the OS Lock to prevent external debugger accesses and implicitly
> disables trace.
> 
> To be compatible with different ETM versions, explicitly control trace
> unit using etm4_disable_trace_unit() and etm4_enable_trace_unit()
> during CPU idle to comply with FEAT_TRF.
> 
> As a result, the save states for TRFCR_ELx and trcprgctlr are redundant,
> remove them.
> 
> Fixes: f188b5e76aae ("coresight: etm4x: Save/restore state across CPU low power states")
> Reviewed-by: Mike Leach <mike.leach@linaro.org>
> Tested-by: James Clark <james.clark@linaro.org>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 28 ++++++++++++++++------
>   drivers/hwtracing/coresight/coresight-etm4x.h      |  3 ---
>   2 files changed, 21 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 7eb30e85bf03d1eda8212faa3c831338b70f86c3..df3260f2dfa72456c60fba4a8fa655fb6b48b95b 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -1882,9 +1882,18 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
>   		goto out;
>   	}
>  



> +	if (!drvdata->paused)
> +		etm4_disable_trace_unit(drvdata);
> +
> +	/*
> +	 * As recommended by section 4.3.7 (Synchronization of register updates)
> +	 * of ARM IHI 0064H.b, the self-hosted trace analyzer always executes an
> +	 * ISB instruction after programming the trace unit registers.
> +	 */
> +	isb();
> +



>   	/* Unlock the OS lock to re-enable trace and external debug access */
>   	etm4_os_unlock(drvdata);
> +
> +	if (!drvdata->paused)
> +		etm4_enable_trace_unit(drvdata);
> +
> +	/*
> +	 * As recommended by section 4.3.7 (Synchronization of register updates)
> +	 * of ARM IHI 0064H.b, the self-hosted trace analyzer always executes an
> +	 * ISB instruction after programming the trace unit registers.
> +	 */
> +	isb();

I guess these ISBs are not required according to the comment on the 
previous patch ? Otherwise looks good to me.

Suzuki


> +
>   	etm4_cs_lock(drvdata, csa);
>   }
>   
>   static void etm4_cpu_restore(struct etmv4_drvdata *drvdata)
>   {
> -	if (drvdata->trfcr)
> -		write_trfcr(drvdata->save_trfcr);
>   	if (drvdata->state_needs_restore)
>   		__etm4_cpu_restore(drvdata);
>   }
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
> index 13ec9ecef46f5b60a38c464e8ebde3ef72e7d50b..b8796b4271025f6aba79fe3cd6e4d17d0b56952d 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x.h
> +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
> @@ -866,7 +866,6 @@ struct etmv4_config {
>    * struct etm4_save_state - state to be preserved when ETM is without power
>    */
>   struct etmv4_save_state {
> -	u32	trcprgctlr;
>   	u32	trcprocselr;
>   	u32	trcconfigr;
>   	u32	trcauxctlr;
> @@ -980,7 +979,6 @@ struct etmv4_save_state {
>    *		at runtime, due to the additional setting of TRFCR_CX when
>    *		in EL2. Otherwise, 0.
>    * @config:	structure holding configuration parameters.
> - * @save_trfcr:	Saved TRFCR_EL1 register during a CPU PM event.
>    * @save_state:	State to be preserved across power loss
>    * @state_needs_restore: True when there is context to restore after PM exit
>    * @skip_power_up: Indicates if an implementation can skip powering up
> @@ -1037,7 +1035,6 @@ struct etmv4_drvdata {
>   	bool				lpoverride;
>   	u64				trfcr;
>   	struct etmv4_config		config;
> -	u64				save_trfcr;
>   	struct etmv4_save_state		*save_state;
>   	bool				state_needs_restore;
>   	bool				skip_power_up;
> 


