Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8DEBCD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 10:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wDhDgAuXOeD0pPRDTmM6h0iJN02LwwWCd0CW1+CS+vM=; b=RhGRosqtq3IwQT4VtRWLwdfe/Z
	yJdPD+ejTMfOHgh3oMwAocgeXgvVqUvSxntlm3/IQzYtokZhw3V597PxSRWJWw+VvJGhI4mBUdR19
	eZQ6nqWMcfqAQQtf0W+L7qAC4SUEruA6Z8ylDbAQ9vL+IsgMlk5V6UQslIETO+QPTpFeeDTD2tXmT
	EeDvWGdzcXaqv/ubWlrvvkqpSKxsWMxD+26Fct2gCyajnDln46rOf2jvj7jJH4u2zi2qHReyMG7WX
	3o98l61nJzazcTW0c3YIE2q1XyVKmwoqEprRZFI9cKy1lqKd0Fupff0yNfVqpEjpswyPQmHGCPz8T
	kozKn8Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNqBd-000000086fk-3Xkk;
	Fri, 15 May 2026 10:54:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNqBb-000000086f4-21lJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 10:54:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1DF4D22FC;
	Fri, 15 May 2026 03:54:23 -0700 (PDT)
Received: from [10.57.26.40] (unknown [10.57.26.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D4F443FAF5;
	Fri, 15 May 2026 03:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778842468; bh=H7MJsX9jsODINQGlfy1MCRS84oO0OdoWKKVS6csFg2c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=moUnevfOE/pdqaEsml6rGpeXJ6JgNJu1ClSO/SdtGoaEon0qWINrSlT295ZGPubbz
	 qavwb/x3fGLczuCSrSuRXGu+zrDCRFT/Ldr5XPVCwgnWhxkW/cB9Wo0uKp0BOiMdDN
	 Nv+8k2969KD3E2hB986l6SGpigLWQov8cCQlYYO8=
Message-ID: <a40b0d0f-bbf8-4ba4-9370-2b5be71bdc44@arm.com>
Date: Fri, 15 May 2026 11:54:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 19/28] coresight: Save active path for system tracers
Content-Language: en-GB
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
 Jie Gan <jie.gan@oss.qualcomm.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20260511-arm_coresight_path_power_management_improvement-v12-0-1c9dcb1de8c9@arm.com>
 <20260511-arm_coresight_path_power_management_improvement-v12-19-1c9dcb1de8c9@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260511-arm_coresight_path_power_management_improvement-v12-19-1c9dcb1de8c9@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_035431_797623_AFB1D5C7 
X-CRM114-Status: GOOD (  26.69  )
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

On 11/05/2026 12:11, Leo Yan wrote:
> This commit only set the path pointer for system tracers (e.g. STM) in
> coresight_{enable|disable}_source().
> 
> Later changes will set the path pointer locally for per-CPU sources.
> This is because the mode and path pointer must be set together, so that
> they are observed atomically by the CPU PM notifier.
> 
> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Reviewed-by: James Clark <james.clark@linaro.org>
> Tested-by: James Clark <james.clark@linaro.org>
> Tested-by: Jie Gan <jie.gan@oss.qualcomm.com>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c | 23 ++++++++++++++++++++++-
>   include/linux/coresight.h                    |  2 ++
>   2 files changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index ff882769cab2bb20bc2cb768e86f111f8a09cc8d..f07f6f28b9162911cdc673a454702f3ac4dc29ad 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -487,10 +487,28 @@ int coresight_enable_source(struct coresight_device *csdev,
>   			    struct perf_event *event, enum cs_mode mode,
>   			    struct coresight_path *path)
>   {
> +	int ret;
> +
>   	if (!coresight_is_device_source(csdev))
>   		return -EINVAL;
>   
> -	return source_ops(csdev)->enable(csdev, event, mode, path);
> +	ret = source_ops(csdev)->enable(csdev, event, mode, path);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Update the path pointer until after the source is enabled to avoid
> +	 * races where multiple paths attempt to enable the same source.
> +	 *
> +	 * Do not set the path pointer here for per-CPU sources; set it locally
> +	 * on the CPU instead. Otherwise, there is a window where the path is
> +	 * enabled but the pointer is not yet set, causing CPU PM notifiers to
> +	 * miss PM operations due to reading a NULL pointer.
> +	 */
> +	if (!coresight_is_percpu_source(csdev))
> +		csdev->path = path;

Do we need to specail case this for non-percpu sources ? We could always 
let the driver save/clear the path leaving the core out of it. We can 
fix it separately from this series in a follow up patch.

Suzuki



> +
> +	return 0;
>   }
>   
>   void coresight_disable_source(struct coresight_device *csdev, void *data)
> @@ -498,6 +516,9 @@ void coresight_disable_source(struct coresight_device *csdev, void *data)
>   	if (!coresight_is_device_source(csdev))
>   		return;
>   
> +	if (!coresight_is_percpu_source(csdev))
> +		csdev->path = NULL;
> +
>   	source_ops(csdev)->disable(csdev, data);
>   }
>   EXPORT_SYMBOL_GPL(coresight_disable_source);
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 5f9d7ea9f5941ab01eb6a084ca558a9417c7727f..58d474b269806d32cad6ed87da96550b06f1f30f 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -257,6 +257,7 @@ struct coresight_trace_id_map {
>    *		by @coresight_ops.
>    * @access:	Device i/o access abstraction for this device.
>    * @dev:	The device entity associated to this component.
> + * @path:	Activated path pointer (only used for source device).
>    * @mode:	The device mode, i.e sysFS, Perf or disabled. This is actually
>    *		an 'enum cs_mode' but stored in an atomic type. Access is always
>    *		through atomic APIs, ensuring SMP-safe synchronisation between
> @@ -291,6 +292,7 @@ struct coresight_device {
>   	const struct coresight_ops *ops;
>   	struct csdev_access access;
>   	struct device dev;
> +	struct coresight_path *path;
>   	atomic_t mode;
>   	int refcnt;
>   	int cpu;
> 


