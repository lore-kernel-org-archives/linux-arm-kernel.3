Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 945A9CD4F57
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 09:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5iPQsDpXFreqn+HTJJE9Cfh7oPvo6yeobA2GeaD3Wso=; b=NmuUT6oKDh4juE+sIFGe2/S+PJ
	oyCOQkeNIfxHf/OO5laTpb4GOsEL77VBG+EbJRGFYP9sLM1xCGexbJAaA4AlcThI/KKitVDFH1Q2I
	gZFB5mIycjijYXH2p1ecwjvXBVuoulZs+EK0e7h4YGFnTBMi8Bf1amkPy6w0HMfaBN6QajEnpv9mF
	iYehUG0TCnCOWPxK6yplWsvXqAtjbVJ9RtlBmciZzIqmc4/1RYd+S4dlFyWOY5n6Efrcp+784cMPI
	HcwBAjE+x1JlZ3QfqOY+mBMZ9D10/ZoxOiUHib9mQq4k8PS1AbGtBQCive1LixtWetVjtK/o+FFHw
	btFpFGCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGPG-00000000qv4-1SKB;
	Tue, 19 May 2026 09:06:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGPC-00000000qtp-151u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 09:06:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E2EBE34FC;
	Tue, 19 May 2026 02:06:18 -0700 (PDT)
Received: from [10.57.21.217] (unknown [10.57.21.217])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA3CC3F632;
	Tue, 19 May 2026 02:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779181584; bh=YZ8qCa5hmacJ+0fwYw5u1WZFYIdWda7ROTjpCvycpWU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HOAofCaunu9kqKKbshr5Bv9mnrPJFV30N9w+YqVOHhLJs0wXjYRoT/gNbDEzKKw7R
	 42xowttsiloJZMQ5bWdM7yhJbg5wuo0MKQNqqZyg3ZEdjnaqQjJLSMQQ5kr2l1Jsj1
	 v5mjbnxM+YQuQGEBylikY81XL7JLvJD+65PxKLss=
Message-ID: <26091753-3806-4c55-a953-3f3006160239@arm.com>
Date: Tue, 19 May 2026 10:06:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: drop lookup reference in
 coresight_get_sink_by_id()
Content-Language: en-GB
To: Ma Ke <make24@iscas.ac.cn>, mike.leach@arm.com, james.clark@linaro.org,
 leo.yan@arm.com, alexander.shishkin@linux.intel.com,
 mathieu.poirier@linaro.org, peterz@infradead.org, acme@redhat.com
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
 stable@vger.kernel.org
References: <20260519084317.1472444-1-make24@iscas.ac.cn>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260519084317.1472444-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_020626_357799_CA101DDA 
X-CRM114-Status: GOOD (  24.54  )
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

On 19/05/2026 09:43, Ma Ke wrote:
> bus_find_device() returns a device with its reference count
> incremented. coresight_get_sink_by_id() only uses the returned device
> to find the matching CoreSight sink by id and does not need to
> transfer this lookup reference to its callers.
> 
> Keeping the reference forces callers such as etm_setup_aux() to know
> about the internal lookup implementation and to drop the reference
> themselves. This is error-prone and led to a leaked reference when a
> user-selected sink is used for perf AUX tracing.
> 
> Drop the reference inside coresight_get_sink_by_id() after converting
> the device to the corresponding coresight_device. The CoreSight path
> code takes device references it needs when building/using the path.
> 
> Found by code review.

Thanks for the report. But..


> 
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> Cc: stable@vger.kernel.org
> Fixes: 226443925887 ("coresight: Use event attributes for sink selection")

I would rather drop the reference in the etm_setup_aux, to make sure we
are still dealing with a valid device, that has not been removed under
our feet.

Suzuki



> ---
>   drivers/hwtracing/coresight/coresight-core.c | 15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 46f247f73cf6..2cca4ed83e2c 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -624,11 +624,24 @@ static int coresight_sink_by_id(struct device *dev, const void *data)
>   struct coresight_device *coresight_get_sink_by_id(u32 id)
>   {
>   	struct device *dev = NULL;
> +	struct coresight_device *csdev;
>   
>   	dev = bus_find_device(&coresight_bustype, NULL, &id,
>   			      coresight_sink_by_id);
> +	if (!dev)
> +		return NULL;
> +
> +	csdev = to_coresight_device(dev);
> +
> +	/*
> +	 * bus_find_device() returns a device with its reference count
> +	 * incremented. coresight_get_sink_by_id() only performs a lookup;
> +	 * the CoreSight path code takes the references it needs when the
> +	 * path is built, so drop the lookup reference here.
> +	 */
> +	put_device(dev);
>   
> -	return dev ? to_coresight_device(dev) : NULL;
> +	return csdev;
>   }
>   
>   /**


