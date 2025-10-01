Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 190E4CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 12:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WYTXqVRUgKBecqzeWFJPcnJVjiQJBfMxkjWzOS+Rt7E=; b=KmmG33Z8IGirPa/oDUNx8ufwbv
	scxMlW3i+UYliERFJgOHBbgvq9CBL/z/qKsD17dGEB7XKmzbomQ9rLhd+fugPM+6cfre+gMLJ2SFs
	u0kwGCdzz/zs7xA2gTtjyrJd1p9CkGLe+DpgYSrm7VdJGfpEuN/9ZJqwTDaupzMljpC3sTwV6lsOX
	iUvXHV/dw6PzKdWTCaJMo6xVoyW9pNX4+Vw8MGwYAxQjMVxvpNydymqZ3P6XDNb+MXGaaT5ClHzmF
	0NanIDVhT/Ex5ybRfoaYfYszpxX7R+LzOZVkOX61WKuQ9vU+D9SwxQQYW38dH9LQrjGUTe7N33AtD
	Miq5+WZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3w8S-00000007vUs-12ZI;
	Wed, 01 Oct 2025 12:40:44 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3w8P-00000007vUV-2SVF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 12:40:42 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-46e2e6a708fso47235185e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 05:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759322439; x=1759927239; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WYTXqVRUgKBecqzeWFJPcnJVjiQJBfMxkjWzOS+Rt7E=;
        b=hpJweMx8mEcvMaYeHP22SyjLePgPBi2oVUjn1041r4CgpOIHFGX7cm6Cab5LVQFDSy
         B3ge3gJQj+WC6LTy1JHV716TLZyNkBaP5L/iu8RbTHdPS8b9tUb8GQMyo1IVOD3+pbGZ
         ib9NHGYtHnmEWzPxLn6UVbxvN9fyyaObrzLzEE81zI2/LUYo6C2Gb6hnNB8mccA9ojcB
         W1moBBcWF9fK9ndLhh1yGYXIH+JMcYzUvn+ZsLQho4mQxNp6wUzkhsec1nMWoWg8fJpI
         c90KQW5GqG6ZsXUW9+dPDiNmgtJOktpg0E+1XHN17I7Y3Z1SlhGGl0hF/5BQK8jmEhsp
         MuZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759322439; x=1759927239;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WYTXqVRUgKBecqzeWFJPcnJVjiQJBfMxkjWzOS+Rt7E=;
        b=tnXStkvjroyR97iPvijc0c/97MCLzhGuwF4ab8D+ralZgZpl6ab97v+Ie8a+IKbHpN
         /3T7I3TjsZcdewlFMHNgCxmhkwsn+ucIOsgoWkt6HQQS+Ai+U76krh2lxk/WCqKx/gLa
         7vL/ejLHAxPq7XOgWbX/GPW7o3q/fWRCsiqh/3sxW/w8yem7CMe23X6yztLcAYlvwnE9
         iAeyVpGeSDko6odYVc3+wf8YiLaBTHASBaG+EuB8ju+wo1kLbjl/3iAR4higL3ALRl96
         yhbsOHPo9ZK9fIyZymcw/Y7//rF4kCuYlBPBizzhYJWq4Osw/qukOmtZDdxUkeE6ViMU
         BZDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYGaisFAy8M4XqwEBMTf6rgt5uRo7mrshWPqxDpByb6arijUrWiG+76MCq5McI4mYW7m7sCW5goDZwAZ1hjiy0@lists.infradead.org
X-Gm-Message-State: AOJu0YwsqcGDTFlCcMVjoK2d494Z5z+BqfpNiywRz2qP34Vo7ExbFuf5
	y8aytH6+uX13FoBZyek6/XSDhvrLpZ4qkeUiaIVyo/oxMeLg6PkxnuUN5R7tAajJhss=
X-Gm-Gg: ASbGnctr0XfZCofxZ1CAZx/A0UD7mtG4zJxE2X1VBoLVA9/OEaz+NtiqGWz7ZikTvOA
	RNsDhPo7jPsHuN/QWcy9hQ0mLJLutDz07twgJ4/PrFcwEFmgDoG1a7l4Nkj16UvudbiIBILqToV
	2uL9kQCfM1ItTLqlDcEjNN6BYPznzkZVZjoaPQAMK8B1zLQkXqdFitvkFqbAqj1Kun7K1Yoa00n
	fndllurUONrJOgiaNc8nHFbf9gfOgJ05Pd7UDQj+kuB8m7G9iFNRXX/CYFg4HgZUOjRjHdjd9Vr
	vUxr8zb0PEJf1epfJeU0H45Pdo8Oq+62hrKLYOOpcAIfCDbS7aO0rrM7Z2w01N4JzkaQf/AfTLg
	94vLdH4V02uUx9ab9+O+ePfflAFco2VHYHi7A8S62dHeNA+uiyX/3
X-Google-Smtp-Source: AGHT+IGo2u62hTBre5IhKlA68oJLY9wdX6JZmyVYIDOL0eOH23ZnAYoa4shn9eEhSc/1I5hVi4MaZA==
X-Received: by 2002:a05:600c:870b:b0:46e:3e63:9a8e with SMTP id 5b1f17b1804b1-46e612856c2mr29292665e9.26.1759322439276;
        Wed, 01 Oct 2025 05:40:39 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e6199202csm38083815e9.4.2025.10.01.05.40.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 05:40:38 -0700 (PDT)
Message-ID: <3a731a9e-0621-42b6-b7fc-4b0fd9b7da6e@linaro.org>
Date: Wed, 1 Oct 2025 13:40:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] coresight: Add format attribute for setting the
 timestamp interval
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20250814-james-cs-syncfreq-v2-0-c76fcb87696d@linaro.org>
 <20250814-james-cs-syncfreq-v2-5-c76fcb87696d@linaro.org>
 <20250930151414.GK7985@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250930151414.GK7985@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_054041_671966_32653F4A 
X-CRM114-Status: GOOD (  25.04  )
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



On 30/09/2025 4:14 pm, Leo Yan wrote:
> On Thu, Aug 14, 2025 at 11:49:56AM +0100, James Clark wrote:
> 
> [...]
> 
>> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
>> @@ -25,6 +25,11 @@
>>   #include "coresight-syscfg.h"
>>   #include "coresight-trace-id.h"
>>   
>> +#if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
>> +#include <linux/perf/arm_pmu.h>
>> +#include "coresight-etm4x.h"
>> +#endif
>> +
>>   static struct pmu etm_pmu;
>>   static bool etm_perf_up;
>>   
>> @@ -69,7 +74,10 @@ PMU_FORMAT_ATTR(sinkid,		"config2:0-31");
>>   /* config ID - set if a system configuration is selected */
>>   PMU_FORMAT_ATTR(configid,	"config2:32-63");
>>   PMU_FORMAT_ATTR(cc_threshold,	"config3:0-11");
>> -
>> +#if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
>> +/* Interval = (2 ^ ts_level) */
>> +GEN_PMU_FORMAT_ATTR(ts_level);
>> +#endif
>>   
>>   /*
>>    * contextid always traces the "PID".  The PID is in CONTEXTIDR_EL1
>> @@ -103,6 +111,9 @@ static struct attribute *etm_config_formats_attr[] = {
>>   	&format_attr_configid.attr,
>>   	&format_attr_branch_broadcast.attr,
>>   	&format_attr_cc_threshold.attr,
>> +#if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
>> +	&format_attr_ts_level.attr,
>> +#endif
> 
> By using .visible() callback for attrs, we can improve a bit code
> without spreading "#ifdef IS_ENABLED()" in this file. E.g.,
> 
>     static umode_t format_attr_is_visible(struct kobject *kobj,
>                                     struct attribute *attr, int n)
>     {
>          struct device *dev = kobj_to_dev(kobj);
> 
>          if (attr == &format_attr_ts_level.attr &&
> 	    !IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X))
>                  return 0;
> 
>          return attr->mode;
>     }
> 
> Otherwise, LGTM:
> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>
> 

Unfortunately that won't work because you'd have to always include 
coresight-etm4x.h. This file is compiled for both arm32 and arm64 so it 
would break the arm32 build.

I could define the TTR_CFG_FLD_ts_level_* stuff somewhere else but then 
it becomes messier than just doing the #ifdefs here.

>>   	NULL,
>>   };
>>   
>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> index 1a2d02bdcb88..42277c201d4f 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> @@ -28,6 +28,7 @@
>>   #include <linux/amba/bus.h>
>>   #include <linux/seq_file.h>
>>   #include <linux/uaccess.h>
>> +#include <linux/perf/arm_pmu.h>
>>   #include <linux/perf_event.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/pm_runtime.h>
>> @@ -615,7 +616,7 @@ static void etm4_enable_hw_smp_call(void *info)
>>    *  +--------------+
>>    *         |
>>    *  +------v-------+
>> - *  | Counter x    |   (reload to 1 on underflow)
>> + *  | Counter x    |   (reload to 2 ^ ts_level on underflow)
>>    *  +--------------+
>>    *         |
>>    *  +------v--------------+
>> @@ -626,11 +627,17 @@ static void etm4_enable_hw_smp_call(void *info)
>>    *  | Timestamp Generator  |  (timestamp on resource y)
>>    *  +----------------------+
>>    */
>> -static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
>> +static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata,
>> +				       struct perf_event_attr *attr)
>>   {
>>   	int ctridx;
>>   	int rselector;
>>   	struct etmv4_config *config = &drvdata->config;
>> +	u8 ts_level = ATTR_CFG_GET_FLD(attr, ts_level);
>> +
>> +	/* Disable when ts_level == MAX */
>> +	if (ts_level == FIELD_GET(ATTR_CFG_FLD_ts_level_MASK, UINT_MAX))
>> +		return 0;
>>   
>>   	/* No point in trying if we don't have at least one counter */
>>   	if (!drvdata->nr_cntr)
>> @@ -666,12 +673,8 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
>>   		return -ENOSPC;
>>   	}
>>   
>> -	/*
>> -	 * Initialise original and reload counter value to the smallest
>> -	 * possible value in order to get as much precision as we can.
>> -	 */
>> -	config->cntr_val[ctridx] = 1;
>> -	config->cntrldvr[ctridx] = 1;
>> +	/* Initialise original and reload counter value. */
>> +	config->cntr_val[ctridx] = config->cntrldvr[ctridx] = 1 << ts_level;
>>   
>>   	/*
>>   	 * Trace Counter Control Register TRCCNTCTLRn
>> @@ -761,7 +764,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>>   		 * order to correlate instructions executed on different CPUs
>>   		 * (CPU-wide trace scenarios).
>>   		 */
>> -		ret = etm4_config_timestamp_event(drvdata);
>> +		ret = etm4_config_timestamp_event(drvdata, attr);
>>   
>>   		/*
>>   		 * No need to go further if timestamp intervals can't
>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
>> index aaa6633b2d67..54558de158fa 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm4x.h
>> +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
>> @@ -598,6 +598,12 @@
>>   #define ETM_CNTR_MAX_VAL		0xFFFF
>>   #define ETM_TRACEID_MASK		0x3f
>>   
>> +#define ATTR_CFG_FLD_ts_level_CFG	config3
>> +#define ATTR_CFG_FLD_ts_level_LO	12
>> +#define ATTR_CFG_FLD_ts_level_HI	15
>> +#define ATTR_CFG_FLD_ts_level_MASK	GENMASK(ATTR_CFG_FLD_ts_level_HI, \
>> +						ATTR_CFG_FLD_ts_level_LO)
>> +
>>   /* ETMv4 programming modes */
>>   #define ETM_MODE_EXCLUDE		BIT(0)
>>   #define ETM_MODE_LOAD			BIT(1)
>>
>> -- 
>> 2.34.1
>>


