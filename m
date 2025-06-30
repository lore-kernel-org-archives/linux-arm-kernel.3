Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 063FDC7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 11:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NFXazq3d0dD9vNx22retVODrSQ7RDXp1O4VwwFxZjTI=; b=DZtf+dGeGsPOp1w2709kEfyLH1
	D6mUgVYiuBTeIi6emvDJfludeSA3iJkHKn9byraVsROsbGsP1maWUcCCU7iKknp4f/PQTOaBM65LA
	ljDgmkI7fwRD1PaR0FeD0iJJ8RecSmUgcCA8/lLbXYGbX2924w7+guDpf6F+/hPacRY5os8PdesVF
	g7+QPdjyVGK/ZE+bVAFL7RVGO3gxmId54tNjlaJN7hbnU//wW5r5oA5NoDEIkK3JRod5WIlZiwEly
	bucD1exX+ITAf8yVZ7skuus/lfS+G+NgBbLNUED4Xg1EZirPIGvDgY0nGM2ysSeHfC2iQWANWLyn3
	jDyBirjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWCLU-00000001ySO-3RsW;
	Mon, 30 Jun 2025 11:06:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWBtZ-00000001uS7-0P9w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 10:37:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E3F21D34;
	Mon, 30 Jun 2025 03:37:34 -0700 (PDT)
Received: from [10.57.86.51] (unknown [10.57.86.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EF1783F58B;
	Mon, 30 Jun 2025 03:37:48 -0700 (PDT)
Message-ID: <8feaae24-835a-43e3-bd4a-615390a0ba3b@arm.com>
Date: Mon, 30 Jun 2025 11:37:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: Only register perf symlink for sinks with
 alloc_buffer
Content-Language: en-GB
To: Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250630-etm_perf_sink-v1-1-e4a7211f9ad7@quicinc.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250630-etm_perf_sink-v1-1-e4a7211f9ad7@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_033753_175593_635F32BE 
X-CRM114-Status: GOOD (  14.82  )
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

On 30/06/2025 11:26, Yuanfang Zhang wrote:
> Ensure that etm_perf_add_symlink_sink() is only called for devices
> that implement the alloc_buffer operation. This prevents invalid
> symlink creation for dummy sinks that do not implement alloc_buffer.
> 
> Without this check, perf may attempt to use a dummy sink that lacks
> alloc_buffer operationsu to initialise perf's ring buffer, leading
> to runtime failures.
> 
> Fixes: 9d3ba0b6c0569 ("Coresight: Add coresight dummy driver")
> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index fa758cc21827552a5c97b6bdd05d22dec4994b22..fddf04c5ee46eb4d559416296f7e85ce6c5689fa 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -1374,8 +1374,9 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
>   		goto out_unlock;
>   	}
>   
> -	if (csdev->type == CORESIGHT_DEV_TYPE_SINK ||
> -	    csdev->type == CORESIGHT_DEV_TYPE_LINKSINK) {
> +	if ((csdev->type == CORESIGHT_DEV_TYPE_SINK ||
> +	     csdev->type == CORESIGHT_DEV_TYPE_LINKSINK) &&
> +	    sink_ops(csdev)->alloc_buffer) {
>   		ret = etm_perf_add_symlink_sink(csdev);
>   
>   		if (ret) {
> 

Looks good to me, I will queue this

Suzuki


