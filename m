Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 505C3CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 16:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FvNJIlvuv8DuYsQcjswCkspCQ+KgqGDEd5xxQU3hip4=; b=Z11mD+mzsnFNySNcF0f7pcGsWU
	d5M/n5ljqMi5ofs3oXYKQshfrkPsi3eLilozYRInPGASqnxmejR9CCqCBo9LQTYGPcDE+pGnabuD3
	l00+tG1MJXwSdxR/X7nQGEfdW7k7520FW9sMF209Hv6F040y21xwPXKXyGEoiZqEbaHfIAZsNUVsC
	RzVRghzlTUfTe22t6zE4CyWc9/yYRnT0ttaUL1G7Gf/Itv78dQot32pqQYw7tMLxYyK7sJyP3X7U6
	YfU6nS8arPm+5jETx/BDNnByD5Ll4XidJoRFS7ij/KoqkDizgE1VPN4b+ZSOMxPk8G4+P+CWzrco0
	3W+P3eUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIrXy-00000007UOT-1eZo;
	Tue, 11 Nov 2025 16:48:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIrXw-00000007UNi-0oV8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 16:48:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F91C497;
	Tue, 11 Nov 2025 08:48:35 -0800 (PST)
Received: from [10.57.73.196] (unknown [10.57.73.196])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 358D53F63F;
	Tue, 11 Nov 2025 08:48:41 -0800 (PST)
Message-ID: <43937832-0e03-4f0b-bdce-dfa12fa801c2@arm.com>
Date: Tue, 11 Nov 2025 16:48:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: etm-perf: Fix reference count leak in
 etm_setup_aux
Content-Language: en-GB
To: Ma Ke <make24@iscas.ac.cn>, mike.leach@linaro.org,
 james.clark@linaro.org, alexander.shishkin@linux.intel.com,
 mathieu.poirier@linaro.org
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
 stable@vger.kernel.org
References: <20251111144203.16498-1-make24@iscas.ac.cn>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20251111144203.16498-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_084844_279985_559F5BC4 
X-CRM114-Status: GOOD (  16.76  )
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

Hi

On 11/11/2025 14:42, Ma Ke wrote:
> In etm_setup_aux(), when a user sink is obtained via
> coresight_get_sink_by_id(), it increments the reference count of the
> sink device. However, if the sink is used in path building, the path
> holds a reference, but the initial reference from
> coresight_get_sink_by_id() is not released, causing a reference count
> leak. We should release the initial reference after the path is built.
> 
> Found by code review.
> 
> Cc: stable@vger.kernel.org
> Fixes: 0e6c20517596 ("coresight: etm-perf: Allow an event to use different sinks")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
>   drivers/hwtracing/coresight/coresight-etm-perf.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index f677c08233ba..6584f6aa87bf 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -453,6 +453,11 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
>   	if (!event_data->snk_config)
>   		goto err;
>   
> +	if (user_sink) {
> +		put_device(&user_sink->dev);
> +		user_sink = NULL;
> +	}
> +

I would recommend moving this to the out: label below, to make sure
we drop the refcount even in the error path.

Otherwise looks good to me.

Suzuki

>   out:
>   	return event_data;
>   


