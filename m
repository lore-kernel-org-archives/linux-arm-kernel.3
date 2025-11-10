Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C88CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 11:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A/l5IM2pys/idk62R90arU8t+o7fTnqV+02DKi4nACM=; b=Bjpz7cySJ9BIjAeBQYsEkuQE6Z
	kneYhy5XzDjJ3IECITNgkt+R2NMbJWCnygP9z7fJYHvJkAXR+MT0wOg1aT9Fi8ob+CJP1RISMDKpP
	MCsI1KDFqs2Ens7pCvYOiixf+YLuY+13ZBrH1JHE1QmgMydhwENfjEgr72UrU0/6vaVQ6P+vpibIs
	0GrqxtKFcwzLL7d4fzA6HrjANi9i0Geus++cQwYN3qCkKDfq+tNG+ld7CXpcx7zH5XV2Wc8Fm5FcE
	/kAwzKWlXDU24ikGVCCUqc5NgjcnAUA/5Pudt2ctmlQ6D54d9pERZeSADxlBHSxNoMZAWFZ6T325+
	Tlbc4YuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQJw-00000005LLV-3XK4;
	Mon, 10 Nov 2025 11:44:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQJs-00000005LKQ-21Ge
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 11:44:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE080497;
	Mon, 10 Nov 2025 03:44:15 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3640D3F63F;
	Mon, 10 Nov 2025 03:44:22 -0800 (PST)
Message-ID: <f52a601f-7275-478c-a759-1a87f0550c42@arm.com>
Date: Mon, 10 Nov 2025 11:44:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/11] coresight: etm4x: Reuse normal enable and
 disable logic in CPU idle
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20251103-arm_coresight_power_management_fix-v5-0-f803c19aa153@arm.com>
 <20251103-arm_coresight_power_management_fix-v5-11-f803c19aa153@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20251103-arm_coresight_power_management_fix-v5-11-f803c19aa153@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_034426_506899_62847BC6 
X-CRM114-Status: GOOD (  28.08  )
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

On 03/11/2025 16:49, Leo Yan wrote:
> The etm4_enable_trace_unit() function is almost identical to the restore
> flow, with a few differences listed below:
> 
> 1) TRCQCTLR register
> 
>     The TRCQCTLR register is saved and restored during CPU idle, but it
>     is never touched in the normal flow. Given the Q element is not
>     enabled (TRCCONFIGR.QE bits), it is acceptable to omit saving and
>     restoring this register during idle.
> 
> 2) TRCSSCSRn.STATUS bit
> 
>     The restore flow does not explicitly clear the TRCSSCSRn.STATUS bit
>     but instead directly loads the saved value. In contrast, the normal
>     flow clears this bit to 0 when re-enabling single-shot control.
> 
>     Therefore, the restore function passes the restart_ss argument as
>     false to etm4_enable_hw() to avoid re-enabling single-shot mode.
> 
> 3) Claim Tag Handling
> 
>     The claim tag is acquired and released in normal flow, on the other
>     hand, the claim protocol is not applied in CPU idle flow - it simply
>     restores the saved value.
> 
>     The claim bits serve two purpose:
> 
>     * Exclusive access between the kernel driver and an external
>       debugger. During CPU idle, the kernel driver locks the OS Lock,
>       ensuring that the external debugger cannot access the trace unit.
>       Therefore, it is safe to release the claim tag during idle.
> 
>     * Notification to supervisory software to save/restore context for
>       external debuggers. The kernel driver does not touch the external
>       debugger's claim bit (ETMCLAIM[0]).
> 
>     Based on this, it is safe to acquire and release claim tag in the
>     idle sequence.
> 
> 4) OS Lock Behavior
> 
>     The OS Lock should be locked during CPU idle states. This differs
>     from the normal flow, which unlock it. This special handling remains
>     in the CPU save path.
> 
> This commit reuses the normal enable and disable logic in the CPU idle
> path. The only addition is locking the OS Lock upon entering idle to
> ensure exclusive access.
> 
> The save context in the driver data is no longer needed and has been
> removed.
> 
> Tested-by: James Clark <james.clark@linaro.org>
> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 201 +--------------------
>   drivers/hwtracing/coresight/coresight-etm4x.h      |  57 ------
>   2 files changed, 5 insertions(+), 253 deletions(-)

nice diff stat !

> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 662492ddd296d9974406ddffad14e7ccb92edbae..d7da5f3b97b3b18d5d6eee0c20a3bdca0c4bec1a 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -1845,8 +1845,7 @@ static int etm4_dying_cpu(unsigned int cpu)
>   
>   static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
>   {
> -	int i, ret = 0;
> -	struct etmv4_save_state *state;
> +	int ret = 0;
>   	struct coresight_device *csdev = drvdata->csdev;
>   	struct csdev_access *csa;
>   	struct device *etm_dev;
> @@ -1876,93 +1875,11 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
>   		ret = -EBUSY;
>   		goto out;
>   	}


> +	etm4_cs_lock(drvdata, csa);

> +	etm4_disable_hw(drvdata);
>   
> +	etm4_cs_unlock(drvdata, csa);
This looks a bit hacky. Here are the options :

1. Leave it as above, but clearly explain in a comment why we do this.
2. The other option is to restructure etm4_disable_hw into
  etm4_cs_unlock()
  __etm4_disable_hw()
  etm4_cs_lock()

And use __etm4_disable_hw() from here.

>   	/* wait for TRCSTATR.IDLE to go up */
>   	if (etm4x_wait_status(csa, TRCSTATR_IDLE_BIT, 1)) {
>   		dev_err(etm_dev,
> @@ -1972,14 +1889,6 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
>   		goto out;

This goto can be removed too.

Suzuki

