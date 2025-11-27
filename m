Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694D3CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 16:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3cpIrGri61+e+bZAB58zpN3dYTJlO6XdCHLnWd6iMRc=; b=hRqoNyNRJWvPaBWsdYithuZe5C
	OSBoqhBSqUHXePcTwVNXLD4trry63fAj2D+558FXy/FTo98Yry5DZm1oZ4vMcdh7DwZGrK33cnSTD
	Oj0rG1GRAKFGw+258K6Lp0IAzQnOVs2PWpUMIuqnwqzXHAZX3QpF95Ze+I5CBqGZPVBqBQh2yqeTP
	A2R6vgQb5M+qP8fyzmfHjO8EJtIT11Sc3eOzjU0MuPA5GFera8GsuTgJRV21AuKcotLcMZui5p+65
	neKSsJZEldUmqaDCHb/au8SUpwR1RQbcZkXVUoZdKUKxZwlq6lhd5ynd4NbTCGu+rNKSAPcRZb9IZ
	9Dea4eSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOeZ6-0000000GuXn-3QX5;
	Thu, 27 Nov 2025 16:09:52 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOeZ3-0000000GuXH-0eey
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 16:09:51 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4775895d69cso4370745e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 08:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764259787; x=1764864587; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3cpIrGri61+e+bZAB58zpN3dYTJlO6XdCHLnWd6iMRc=;
        b=KtN7kgy0G+dTjV8FBhqC/bLTHFiSEhZD+UkfZ8coGTCFvosMF2JSGYHm3rpEaSBA3c
         NZ0M3sOdQTNLLfyQ+MCjc5XragwJ673isn5SGaeEhJlHpxfDHC4xpsAycCFQqJgqIoMz
         RlqioEGkwW9WqabALUpRVTHqkGXUn6uh/aYYLtfdNc86WZUm2+2dA5tBjHw5IrtovmTl
         gUMSCNu0HO2wRhVysY9c8jADoBMdznoChjc2mWIrlIvOTZ2jgq7mcUDtguOscqGKIHl1
         tM08Bn2yquyv50N50V9t1pThH/Yp79t6ZmzHzrWeDk8ZuB4JlmkBgErKK/EBrkTW/XfJ
         Ec1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764259787; x=1764864587;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3cpIrGri61+e+bZAB58zpN3dYTJlO6XdCHLnWd6iMRc=;
        b=rHoqGxfBH97z13JZ77Aw3SXeR0Zi4INpkJuehOePSCLHTkLlbBLII9UklHCWcTjGX8
         fgH9WsZ9cwRarVwpBv+2QU1ckogLPE2G5lePPEWI+KwyUJeUx2ALvOtODQLpLdF42IPB
         luZBK9D3Za/1m/Su4UxKQpTzmbJreTmv7tNgYjPLP7yhpVICXsC+1fqGjunxTeon5Xz1
         NhjduPO9wG3iZTk3dYWvA7ge3CCjCXPz/5sjtjy1P8jLSs6IMm2MJ9cHHby4bn/XoQsE
         rSaBGbqSoXPKnCFcDvZKO0STwe+bU419U5WZeBxwv0cttKSDtspkYg37iWk3juHknUx4
         JpzA==
X-Forwarded-Encrypted: i=1; AJvYcCU0Wl5S+COuqPKLqic8I/2tPPFJVGG5xC0sE6fQG8lmeRmbRqXmouAiCbc5fIyx8TWoayg19Wg1E4YfvuzpyDkk@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2x+ttS2NRjDppBK0EUwT9uqtXaxYejH2mZBhvUf7pLBSa4Pu3
	iPx2w9GBfOsofLZRxXiTO0DRSCUbxqYIPdhs+TGkLrc9Gbl04YGri0nXR5BGkQjTATo=
X-Gm-Gg: ASbGncv5emJFrBkM64+eYlP5NnOaoivSCSFX9UerAVKCzCUE+hRMUwkowudDQgtZhja
	G1+gRoM+CSWBdRxBb3MmnkWJbFLNVzONiIzZ6NsPR1Cv4OdZSyxq1h0/Bv+a90TFY9x1e+LgXG3
	F5/OuM6Dappu3CR+AmDHlpzknd3J4vzq9/OOVmIB5Uxbctm82VUcNfJzonBUkGKWDS0t385VZr8
	RArn4lwVLH3i/WnfAXTIrnUyh2P+/BzjrXrAa2NgR/sI1X3mrqa5L7PhqfDvQ0yruAvI5HFaHGE
	Jq5TiVksouEpZfqjxBd+BG9QPbmoe40lm5RtapibOuzY27LvXeYefdljRZy1yPeCb9GcZj2CO12
	f4Z0jsy6r9uANeaphNGtdAfNfySJBGZAZElfxiw0QVPH2S1NwfaKom2RuVTZXInIXASdFckme4I
	g14iptX7g2eJNWWdaO
X-Google-Smtp-Source: AGHT+IGXhcwFBRvfQzDOHSo9hFl4xdfh4gra5/RCy9pJflHLTngXIl7AkUmgjKB8t4pi3YsRh+RXCQ==
X-Received: by 2002:a05:600c:21cb:b0:477:acb7:7141 with SMTP id 5b1f17b1804b1-4790f03337dmr46833965e9.3.1764259787134;
        Thu, 27 Nov 2025 08:09:47 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790adc8bc7sm113711125e9.1.2025.11.27.08.09.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 08:09:46 -0800 (PST)
Message-ID: <718ffc8b-21ec-4536-b0c4-aaf2635aaf75@linaro.org>
Date: Thu, 27 Nov 2025 16:09:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 12/13] coresight: Allow setting the timestamp interval
To: Mike Leach <mike.leach@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>,
 Randy Dunlap <rdunlap@infradead.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20251126-james-cs-syncfreq-v7-0-7fae5e0e5e16@linaro.org>
 <20251126-james-cs-syncfreq-v7-12-7fae5e0e5e16@linaro.org>
 <CAJ9a7VgqGJ=YLG6+ypMnqV9YJ_dMBw6qyhusXdR_NR2=RTis-w@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAJ9a7VgqGJ=YLG6+ypMnqV9YJ_dMBw6qyhusXdR_NR2=RTis-w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_080949_237929_E53274A0 
X-CRM114-Status: GOOD (  27.75  )
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



On 27/11/2025 3:48 pm, Mike Leach wrote:
> Hi James
> 
> On Wed, 26 Nov 2025 at 10:57, James Clark <james.clark@linaro.org> wrote:
>>
>> Timestamps are currently emitted at the maximum rate possible, which is
>> much too frequent for most use cases. Set the interval using the value
>> from the timestamp field. Granular control is not required, so save
>> space in the config by interpreting it as 2 ^ timestamp. And then 4
>> bits (0 - 15) is enough to set the interval to be larger than the
>> existing SYNC timestamp interval.
>>
>> No sysfs mode support is needed for this attribute because counter
>> generated timestamps are only configured for Perf mode.
>>
>> Reviewed-by: Leo Yan <leo.yan@arm.com>
>> Tested-by: Leo Yan <leo.yan@arm.com>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   drivers/hwtracing/coresight/coresight-etm-perf.h   |  1 +
>>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 28 +++++++++++++++-------
>>   2 files changed, 20 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.h b/drivers/hwtracing/coresight/coresight-etm-perf.h
>> index 24d929428633..128f80bb1443 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm-perf.h
>> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.h
>> @@ -7,6 +7,7 @@
>>   #ifndef _CORESIGHT_ETM_PERF_H
>>   #define _CORESIGHT_ETM_PERF_H
>>
>> +#include <linux/bits.h>
>>   #include <linux/percpu-defs.h>
>>   #include "coresight-priv.h"
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> index c7bf73c8f2d7..0129b0502726 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> @@ -651,7 +651,7 @@ static void etm4_enable_sysfs_smp_call(void *info)
>>    *  +--------------+
>>    *         |
>>    *  +------v-------+
>> - *  | Counter x    |   (reload to 1 on underflow)
>> + *  | Counter x    |   (reload to 2 ^ timestamp on underflow)
>>    *  +--------------+
>>    *         |
>>    *  +------v--------------+
>> @@ -662,11 +662,25 @@ static void etm4_enable_sysfs_smp_call(void *info)
>>    *  | Timestamp Generator  |  (timestamp on resource y)
>>    *  +----------------------+
>>    */
>> -static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
>> +static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata,
>> +                                      struct perf_event_attr *attr)
>>   {
>>          int ctridx;
>>          int rselector;
>>          struct etmv4_config *config = &drvdata->config;
>> +       struct perf_event_attr max_timestamp = {
>> +               .ATTR_CFG_FLD_timestamp_CFG = U64_MAX,
>> +       };
>> +
>> +       /* timestamp may be 0 if deprecated_timestamp is used, so make min 1 */
>> +       u8 ts_level = max(1, ATTR_CFG_GET_FLD(attr, timestamp));
>> +
> 
> I could be missing something here - but if we have a perf command line:
> 
> perf -e cs_etm/timestamp=0/
> 
> is this bit not changing that to timestamp=1 regardless? The docs
> (patch 13) indicate timestamp=0 to be timestamps off.
> 
> This command is used in test_arm_coresight.sh when testing the
> combination of options on the CS system.
> 
> Mike
> 

No, no change. This function never gets called if either timestamp or 
deprecated_timestamp = 0.

timestamp=0 and timestamp=1 still behave exactly the same as before. The 
only new change is timestamp values > 1 and that the bits used in the 
config are different.

>> +       /*
>> +        * Disable counter generated timestamps when timestamp == MAX. Leave
>> +        * only SYNC timestamps.
>> +        */
>> +       if (ts_level == ATTR_CFG_GET_FLD(&max_timestamp, timestamp))
>> +               return 0;
>>
>>          /* No point in trying if we don't have at least one counter */
>>          if (!drvdata->nr_cntr)
>> @@ -704,12 +718,8 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
>>                  return -ENOSPC;
>>          }
>>
>> -       /*
>> -        * Initialise original and reload counter value to the smallest
>> -        * possible value in order to get as much precision as we can.
>> -        */
>> -       config->cntr_val[ctridx] = 1;
>> -       config->cntrldvr[ctridx] = 1;
>> +       /* Initialise original and reload counter value. */
>> +       config->cntr_val[ctridx] = config->cntrldvr[ctridx] = 1 << (ts_level - 1);
>>
>>          /*
>>           * Trace Counter Control Register TRCCNTCTLRn
>> @@ -799,7 +809,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>>                   * order to correlate instructions executed on different CPUs
>>                   * (CPU-wide trace scenarios).
>>                   */
>> -               ret = etm4_config_timestamp_event(drvdata);
>> +               ret = etm4_config_timestamp_event(drvdata, attr);
>>
>>                  /*
>>                   * No need to go further if timestamp intervals can't
>>
>> --
>> 2.34.1
>>
> 
> 


