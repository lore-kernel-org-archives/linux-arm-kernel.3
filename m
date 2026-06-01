Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0EE1CD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 09:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s3hOLoL80Rg0mGQt/eifQj/gsfVePmxrgHiSgEhcEUg=; b=FTEFPdsCL+/GLNNr4rCJJW6R+I
	lkKnAeyGNvcw56AbWF8jY4ZmiwgVRnB0szsuftMUREy3kSqSUAaM1RDGL8cMK+jk0xt7xt2eJi5e3
	b1AtQx+jXTregmxf7/Vj85DlG7uOSXKzuagzhETH1fSA8/xpgcTGgmpq5zhXjipI6wmQ0wH04gcAE
	XntjN5OHtlsvyKQhi55sc0Y7T+MVP6uuT4h81aSj0h1+zIYk3tJmNkyy3s4FENtt/HwCeKfQ4fUWP
	mqj5ZyxrBqGLqKFUrgpSXe8mcOG5DQ13sX1G9C1tVKxioaYiq2LDJNC3Z+GjwZ2Z3lFP/XZtWiLrb
	7+SqdBjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzKG-0000000AZ6S-1p6U;
	Mon, 01 Jun 2026 09:52:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzKD-0000000AZ63-1nlo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 09:52:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D03631682;
	Mon,  1 Jun 2026 02:52:42 -0700 (PDT)
Received: from [10.1.38.31] (Suzukis-MBP.cambridge.arm.com [10.1.38.31])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC22C3F905;
	Mon,  1 Jun 2026 02:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780307567; bh=LFDJQmDrINHw4OwHKny0l67PJC4qq1iRplJcbH2pqlw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gbnsSzK1VxRgugA3da6ax6XRunC1jQ0BRaH0MPkaPDmH9hpAljqekOdMutsEkBjjD
	 SzR2E3Cl5Eaxz0CigYZBlQIJH0WqtpBvQ0M2HiqMYeibDHg24rM+PZH9CGa3t7Sxxv
	 ytg8zZGJMIara9iGNvlkZnpcNWyjAS5GWfxxsUxE=
Message-ID: <24427ef2-8d32-4c29-b652-bf1019e04f40@arm.com>
Date: Mon, 1 Jun 2026 10:52:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/13] coresight: etm4x: fix underflow for nrseqstate
Content-Language: en-GB
To: Yeoreum Yun <yeoreum.yun@arm.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: mike.leach@arm.com, james.clark@linaro.org,
 alexander.shishkin@linux.intel.com, leo.yan@arm.com, jie.gan@oss.qualcomm.com
References: <20260519154812.254884-1-yeoreum.yun@arm.com>
 <20260519154812.254884-3-yeoreum.yun@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260519154812.254884-3-yeoreum.yun@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_025249_554187_8973E1E8 
X-CRM114-Status: GOOD (  17.87  )
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

On 19/05/2026 16:48, Yeoreum Yun wrote:
> TCRSEQEVR<n> is implemented only when TCRIDR5.NUMSEQSTATE is 0b100,
> in which case n ranges from 0 to 2; otherwise, TCRIDR5.NUMSEQSTATE is 0b000.
> 
> Therefore, drvdata->nrseqstate should be checked before entering the loop.

s/TCR/TRC/g ^^^ and every other patch in the series. Seem like you have 
been playing with the MMU code ;-)


> 
> Link: https://developer.arm.com/documentation/ihi0064/latest/ [0]
> Fixes: 2e1cdfe184b5 ("coresight-etm4x: Adding CoreSight ETM4x driver")
> Reviewed-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>   .../hwtracing/coresight/coresight-etm4x-core.c | 18 ++++++++++--------
>   .../coresight/coresight-etm4x-sysfs.c          |  2 ++
>   2 files changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 1e3b0344dc00..94b9385e964a 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -542,9 +542,11 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
>   	etm4x_relaxed_write32(csa, config->vissctlr, TRCVISSCTLR);
>   	if (drvdata->nr_pe_cmp)
>   		etm4x_relaxed_write32(csa, config->vipcssctlr, TRCVIPCSSCTLR);
> -	for (i = 0; i < drvdata->nrseqstate - 1; i++)
> -		etm4x_relaxed_write32(csa, config->seq_ctrl[i], TRCSEQEVRn(i));
> +
>   	if (drvdata->nrseqstate) {
> +		for (i = 0; i < drvdata->nrseqstate - 1; i++)
> +			etm4x_relaxed_write32(csa, config->seq_ctrl[i], TRCSEQEVRn(i));

Looking at this again, I think we are contemplating two different values 
from a single variable (blame the architecture). Instead, we should:

1. Disconnect number of TRCSEQEVRn from drvdata->nrseqstate, and add 
nr_seq_ctrls to drvdata and initialise this at probe.


for (i = 0; i < drvdata->nr_seq_ctrls; i++)

Suzuki




> +
>   		etm4x_relaxed_write32(csa, config->seq_rst, TRCSEQRSTEVR);
>   		etm4x_relaxed_write32(csa, config->seq_state, TRCSEQSTR);
>   	}
> @@ -1896,10 +1898,10 @@ static int etm4_cpu_save(struct coresight_device *csdev)
>   	if (drvdata->nr_pe_cmp)
>   		state->trcvipcssctlr = etm4x_read32(csa, TRCVIPCSSCTLR);
>   
> -	for (i = 0; i < drvdata->nrseqstate - 1; i++)
> -		state->trcseqevr[i] = etm4x_read32(csa, TRCSEQEVRn(i));
> -
>   	if (drvdata->nrseqstate) {
> +		for (i = 0; i < drvdata->nrseqstate - 1; i++)
> +			state->trcseqevr[i] = etm4x_read32(csa, TRCSEQEVRn(i));
> +
>   		state->trcseqrstevr = etm4x_read32(csa, TRCSEQRSTEVR);
>   		state->trcseqstr = etm4x_read32(csa, TRCSEQSTR);
>   	}
> @@ -2009,10 +2011,10 @@ static void etm4_cpu_restore(struct coresight_device *csdev)
>   	if (drvdata->nr_pe_cmp)
>   		etm4x_relaxed_write32(csa, state->trcvipcssctlr, TRCVIPCSSCTLR);
>   
> -	for (i = 0; i < drvdata->nrseqstate - 1; i++)
> -		etm4x_relaxed_write32(csa, state->trcseqevr[i], TRCSEQEVRn(i));
> -
>   	if (drvdata->nrseqstate) {
> +		for (i = 0; i < drvdata->nrseqstate - 1; i++)
> +			etm4x_relaxed_write32(csa, state->trcseqevr[i], TRCSEQEVRn(i));
> +
>   		etm4x_relaxed_write32(csa, state->trcseqrstevr, TRCSEQRSTEVR);
>   		etm4x_relaxed_write32(csa, state->trcseqstr, TRCSEQSTR);
>   	}
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> index e9eeea6240d5..0e1ad175aa1e 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> @@ -1395,6 +1395,8 @@ static ssize_t seq_idx_store(struct device *dev,
>   	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
>   	struct etmv4_config *config = &drvdata->config;
>   
> +	if (!drvdata->nrseqstate)
> +		return -ENOTSUPP;
>   	if (kstrtoul(buf, 16, &val))
>   		return -EINVAL;
>   	if (val >= drvdata->nrseqstate - 1)


