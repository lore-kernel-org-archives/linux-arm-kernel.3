Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18DD9CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 16:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yKamkUDjsfk4YAIiTwJdXeHRBmP4B1CQXH9ksNVd4r8=; b=BPdvNQcTsML5DUttZdmMaTpba6
	N36bYj/2bmq7nJztxjSJz+0YPUao8oe9B+uC/ehNmYXwI9Ju2w0VU3aEVtC+X6Nw4sAzkK7oZTsVt
	AXVgvMlpywdFYO92dr8mZSf13u3+nUT2f+nye//2C2OUyY4XZoT+C4wfUg/UQeXlrCAknhkA679jU
	bDGqqwJT0C24mPMUTl8AnXjRB57mX5amkFoX8u/Tz7awcgc4Do+8xd4sovEJUqkwNHP9bN3USHtOa
	whh1wWk0D4Ypi3CfrTQiX167F7W3DWrlVRwbiAQ5nPyl+vWD5M+jOk45fYrriZOvvWVxgFh74WX36
	8XYCx87w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU5En-0000000BRk0-1RfX;
	Mon, 01 Jun 2026 16:11:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU5Ek-0000000BRjU-2exd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 16:11:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52B411A32;
	Mon,  1 Jun 2026 09:11:27 -0700 (PDT)
Received: from [10.57.23.191] (unknown [10.57.23.191])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DBC8C3F632;
	Mon,  1 Jun 2026 09:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780330292; bh=TULWjN09Z6nS4UtMfpWaFE8bnuqS0NDd7Fvo4J5jCPk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RFxQ+6gF7u+eckKx9LoPeqnSr2BIPkzOhB3KtgwOZBTlkGawyWbGoC0XnTxo27BeX
	 LoMQ/fH9f6R/y1eH56GnzNL+5L7Rrs4KmlLK5ZbBK0fE/k4Jtene6+/8Jgh2hv22mm
	 iHnQLx8Jm5s6ywQrfRMl7YqQ6VlWDjYN1H6kjFQ0=
Message-ID: <0fe7c30c-85e4-4205-930c-0c496d6263b8@arm.com>
Date: Mon, 1 Jun 2026 17:11:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 09/13] coresight: etm4x: missing
 cscfg_csdev_disable_active_config() in perf enable
Content-Language: en-GB
To: Yeoreum Yun <yeoreum.yun@arm.com>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, mike.leach@arm.com, james.clark@linaro.org,
 alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
References: <20260519154812.254884-1-yeoreum.yun@arm.com>
 <20260519154812.254884-10-yeoreum.yun@arm.com>
 <20260528143358.GF101133@e132581.arm.com> <ahhUnJSIvGabGbQe@e129823.arm.com>
 <20260528152633.GH101133@e132581.arm.com> <ahhm0uIwQw56WhYO@e129823.arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <ahhm0uIwQw56WhYO@e129823.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_091134_779108_92485A94 
X-CRM114-Status: GOOD (  25.15  )
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

On 28/05/2026 17:01, Yeoreum Yun wrote:
>> On Thu, May 28, 2026 at 03:43:40PM +0100, Yeoreum Yun wrote:
>>
>> [...]
>>
>>>> @@ -931,6 +919,18 @@ static int etm4_enable_perf(struct coresight_device *csdev,
>>>>   	if (ret)
>>>>   		goto err;
>>>>   
>>>> +	/*
>>>> +	 * Set any selected configuration and preset. A zero configid means no
>>>> +	 * configuration active, preset = 0 means no preset selected.
>>>> +	 */
>>>> +	cfg_hash = ATTR_CFG_GET_FLD(attr, configid);
>>>> +	if (cfg_hash) {
>>>> +		preset = ATTR_CFG_GET_FLD(attr, preset);
>>>> +		ret = cscfg_csdev_enable_active_config(csdev, cfg_hash, preset);
>>>> +		if (ret)
>>>> +			goto err;
>>>> +	}
>>>> +
>>
>>> No. since preset overrides the "perf configuratoin" formerly but
>>> this code makes it vice versa.
>>
>> The above proposed change applies cfgfs after calling
>> etm4_parse_event_config(). This is just use preset to override the
>> config. Do I miss anything?
> 
> Ah sorry. I've misread the code location that was my bad.
> 
>>
>>> Also, cfg_hash and prest is also part of
>>> etm4_parse_event_config(), and it doesn't seem to good to separate
>>> cfgfs handling from that function.
>>>
>>> IMHO, It would be better to keep this as it is.
>>
>> I have another version to give a try. I'd leave to you and maintainers
>> to choose which is better.
> 
> Funcionally, Code works. However, To be honest, the pairing between
> etm4_parse_event_config() and etm4_clean_event_config() feels a bit artificial to me.
> 
> So here I have simply followed the principle that,
> if etm4_parse_event_config() fails, the configuration it touched should be
> cleaned up within that function; and if a failure happens after
> etm4_parse_event_config() has succeeded, the caller should perform the cleanup.
> 
> Renaming etm4_parse_event_config() and splitting out the
> CSCFG-related handling as suggested would be possible,
> although I still feel it may not be strictly necessary.
> 
> My preference would be to keep this as-is, but Suzuki, what do you think?

I prefer the end result with Leo's patch applied. That kind of indicates
clearly that we need to cleanup something from the event config parsing
and keeps the disabling only once, rather than spreading it.

Cheers
Suzuki



> 
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> index 0889937811cb..471824234800 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> @@ -882,16 +882,6 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>>   		/* bit[12], Return stack enable bit */
>>   		config->cfg |= TRCCONFIGR_RS;
>>   
>> -	/*
>> -	 * Set any selected configuration and preset. A zero configid means no
>> -	 * configuration active, preset = 0 means no preset selected.
>> -	 */
>> -	cfg_hash = ATTR_CFG_GET_FLD(attr, configid);
>> -	if (cfg_hash) {
>> -		preset = ATTR_CFG_GET_FLD(attr, preset);
>> -		ret = cscfg_csdev_enable_active_config(csdev, cfg_hash, preset);
>> -	}
>> -
>>   	/* branch broadcast - enable if selected and supported */
>>   	if (ATTR_CFG_GET_FLD(attr, branch_broadcast)) {
>>   		if (!caps->trcbb) {
>> @@ -899,8 +889,6 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>>   			 * Missing BB support could cause silent decode errors
>>   			 * so fail to open if it's not supported.
>>   			 */
>> -			if (cfg_hash)
>> -				cscfg_csdev_disable_active_config(csdev);
>>   			ret = -EINVAL;
>>   			goto out;
>>   		} else {
>> @@ -908,10 +896,31 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>>   		}
>>   	}
>>   
>> +	/*
>> +	 * Set any selected configuration and preset. A zero configid means no
>> +	 * configuration active, preset = 0 means no preset selected.
>> +	 */
>> +	cfg_hash = ATTR_CFG_GET_FLD(attr, configid);
>> +	if (cfg_hash) {
>> +		preset = ATTR_CFG_GET_FLD(attr, preset);
>> +		ret = cscfg_csdev_enable_active_config(csdev, cfg_hash, preset);
>> +	}
>> +
>>   out:
>>   	return ret;
>>   }
>>   
>> +static void etm4_clean_event_config(struct coresight_device *csdev,
>> +				    struct perf_event *event)
>> +{
>> +	struct perf_event_attr *attr = &event->attr;
>> +	unsigned long cfg_hash;
>> +
>> +	cfg_hash = ATTR_CFG_GET_FLD(attr, configid);
>> +	if (cfg_hash)
>> +		cscfg_csdev_disable_active_config(csdev);
>> +}
>> +
>>   static int etm4_enable_perf(struct coresight_device *csdev,
>>   			    struct perf_event *event,
>>   			    struct coresight_path *path)
>> @@ -938,15 +947,14 @@ static int etm4_enable_perf(struct coresight_device *csdev,
>>   
>>   	/* And enable it */
>>   	ret = etm4_enable_hw(drvdata);
>> -	if (ret) {
>> -		if (ATTR_CFG_GET_FLD(attr, configid))
>> -			cscfg_csdev_disable_active_config(csdev);
>> -		goto err;
>> -	}
>> +	if (ret)
>> +		goto err_hw;
>>   
>>   	csdev->path = path;
>>   	return 0;
>>   
>> +err_hw:
>> +	etm4_clean_event_config(csdev, event);
>>   err:
>>   	/* Failed to start tracer; roll back to DISABLED mode */
>>   	coresight_set_mode(csdev, CS_MODE_DISABLED);
> 


