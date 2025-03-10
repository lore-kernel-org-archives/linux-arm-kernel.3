Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE5F4C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 11:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JeeIlJLvSKNx8IGXbadj/rcjcZ406apj7BFAyaBARqM=; b=yFT4gGEU6hK/rI7UY/U5YrxTJv
	eqVjNMhPWTvfmgG3GbsuXmUxcl5CPyTtzsyJtF+c/i2tlpAp/CGgHEW8JLgOA74nrDNtOUIuqeoKO
	9izv/1as6lDrKLYWD/Snt3MgBdomtPXR72z1HQt37BAi81RmKhGOxjT9kej5bbyE1zna6qQkFSDnE
	rNOZg4gpNFmqwgPQs0ZKr5q7X/VZPvDIMa8h6ZCSAxNmtQj1/yKI8gnnm9QnmhpDvzgyndm+NhyL5
	9ughZUVSEiJdm9fVo0LTy8rRf+JdV1SeXdMTrpp6t6zBpotjZr6D3Lg7ihryDOAO1vJoZ8BG9OlKv
	fN07YqVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trbPs-00000002Rs2-2kZx;
	Mon, 10 Mar 2025 11:35:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1traC3-00000002E4C-1OdX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 10:17:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3737E153B;
	Mon, 10 Mar 2025 03:17:16 -0700 (PDT)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 78ECD3F673;
	Mon, 10 Mar 2025 03:17:03 -0700 (PDT)
Message-ID: <23943463-94d0-4e37-b5fa-5efb20015063@arm.com>
Date: Mon, 10 Mar 2025 10:17:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: add verification process for
 coresight_etm_get_trace_id
To: Jie Gan <quic_jiegan@quicinc.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250310022348.1654501-1-quic_jiegan@quicinc.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250310022348.1654501-1-quic_jiegan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_031707_420299_99071CD5 
X-CRM114-Status: GOOD (  13.33  )
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

On 10/03/2025 02:23, Jie Gan wrote:
> The coresight_etm_get_trace_id function is a global function. The
> verification process for 'csdev' is required prior to its usage.
> 
> Fixes: c367a89dec26 ("Coresight: Add trace_id function to retrieving the trace ID")
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index bd0a7edd38c9..5a7cd2376e2d 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -1616,9 +1616,12 @@ EXPORT_SYMBOL_GPL(coresight_remove_driver);
>   int coresight_etm_get_trace_id(struct coresight_device *csdev, enum cs_mode mode,
>   			       struct coresight_device *sink)
>   {
> -	int trace_id;
> -	int cpu = source_ops(csdev)->cpu_id(csdev);
> +	int cpu, trace_id;
> +
> +	if (csdev->type != CORESIGHT_DEV_TYPE_SOURCE && !source_ops(csdev)->cpu_id)

That must be :

	csdev->type != CORESIGHT_DEV_TYPE_SOURCE || !source_ops(csdev)->cpu_id)


Suzuki


> +		return -EINVAL;
>   
> +	cpu = source_ops(csdev)->cpu_id(csdev);
>   	switch (mode) {
>   	case CS_MODE_SYSFS:
>   		trace_id = coresight_trace_id_get_cpu_id(cpu);


