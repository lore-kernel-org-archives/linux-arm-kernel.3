Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B61D74978
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 10:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NwhkGUfResPpuZgQXavQEqGLlDNuERIFFLVGm6UkHow=; b=A8jLH624zEP2AKRhwKezZ/jqwT
	v5K2RHMZ8SZp0UlmN1tZLCTuLYgN/4Wrr2c+GETDs/GQNeqvL8B9a4hJbZWpPq9ClriGUJbG53ohT
	HHrgHvQTGbJNujXz5XbXZLFx78XyH/J4HaLzsmjijZjhnOhYE34xoydaJoMAd6ev35Jg1zen79IaP
	qckvOMnP4AX88NmNA4nUw1IlP6dwWSUIgnf6j6wHjuDfbV3u1RM2r820wV06EzZDNjmjSfUxVzKBf
	ur2q3TvRwN8yWwgwGSEjm56YrtifPflIlvcWCymCVK5QZMWk+UQiPkRZVz71ArpWP+2jSz1q7H3pE
	QPO3W2aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXHG-0000000A0Es-1KXm;
	Fri, 19 Dec 2025 10:00:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXHC-0000000A0E8-0Dqp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 10:00:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8876DFEC;
	Fri, 19 Dec 2025 01:59:49 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3E7EB3F5CA;
	Fri, 19 Dec 2025 01:59:55 -0800 (PST)
Message-ID: <d4946831-fc8c-4727-abec-3edd92e357d1@arm.com>
Date: Fri, 19 Dec 2025 09:59:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 RESEND] coresight: etm-perf: Fix reference count leak
 in etm_setup_aux
To: Leo Yan <leo.yan@arm.com>, Ma Ke <make24@iscas.ac.cn>
Cc: jie.gan@oss.qualcomm.com, james.clark@linaro.org,
 akpm@linux-foundation.org, alexander.shishkin@linux.intel.com,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, mathieu.poirier@linaro.org,
 mike.leach@linaro.org, stable@vger.kernel.org
References: <f85c7d37-4980-46f0-9136-353a35a8f0ed@oss.qualcomm.com>
 <20251219023949.12699-1-make24@iscas.ac.cn>
 <20251219094141.GA9788@e132581.arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20251219094141.GA9788@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_015958_168163_02C9CC69 
X-CRM114-Status: GOOD (  21.85  )
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

On 19/12/2025 09:41, Leo Yan wrote:
> Hi,
> 
> On Fri, Dec 19, 2025 at 10:39:49AM +0800, Ma Ke wrote:
> 
> [...]
> 
>>  From the discussion, I note two possible fix directions:
>>
>> 1. Release the initial reference in etm_setup_aux() (current v2 patch)
>> 2. Modify the behavior of coresight_get_sink_by_id() itself so it
>> doesn't increase the reference count.
> 
> The option 2 is the right way to go.
> 
>> To ensure the correctness of the v3 patch, I'd like to confirm which
>> patch is preferred. If option 2 is the consensus, I'm happy to modify
>> the implementation of coresight_get_sink_by_id() as suggested.
> 
> It is good to use a separate patch to fix
> coresight_find_device_by_fwnode() mentioned by James:
> 
> diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
> index 0db64c5f4995..2b34f818ba88 100644
> --- a/drivers/hwtracing/coresight/coresight-platform.c
> +++ b/drivers/hwtracing/coresight/coresight-platform.c
> @@ -107,14 +107,16 @@ coresight_find_device_by_fwnode(struct fwnode_handle *fwnode)
>   	 * platform bus.
>   	 */
>   	dev = bus_find_device_by_fwnode(&platform_bus_type, fwnode);
> -	if (dev)
> -		return dev;
>   
>   	/*
>   	 * We have a configurable component - circle through the AMBA bus
>   	 * looking for the device that matches the endpoint node.
>   	 */
> -	return bus_find_device_by_fwnode(&amba_bustype, fwnode);
> +	if (!dev)
> +		dev = bus_find_device_by_fwnode(&amba_bustype, fwnode);
> +
> +	put_device(dev);

^^ NAK, see below.

> +	return dev;
>   }
>   
>   /*
> @@ -274,7 +276,6 @@ static int of_coresight_parse_endpoint(struct device *dev,
>   
>   	of_node_put(rparent);
>   	of_node_put(rep);
> -	put_device(rdev);

This doesn't look good. We can't use the "dev" reliably without the 
reference count. We are opening up use-after-free.

NAK for this.

Suzuki

>   
>   	return ret;
>   }
> 
> Thanks for working on this.


