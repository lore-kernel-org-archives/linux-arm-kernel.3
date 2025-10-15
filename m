Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5DD5CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 15:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ozzqX27qI/om600ZTPA46M3BTEK2ZsX0XsaZoTyCATk=; b=xWqkVCgiopbAb3utlnPnIoPEZ4
	X04m0wHiIcGhUC444VH4mt5VDK1vX/kWybXn1caRjtdlCWqbaKR9JVIKlR0hzXPQse6df20DsaotN
	cz7Xt1ncAUIeokxiZOQdEVfXjtxesmSdY0qQ+T90QaAZVVb8FL2B0WgJ6zsVd130w7FEM6zvVfwoN
	DwTS/IE2wVNw2SVDJ2EDmull4NX5BSEzi43gZ1m5wcmzQCa6ltAGWtiq22SkZmAi0qBdI2QxJp6rv
	xiOs6M7PFXOsrQB5LBtcVR1TWPij/2Dy9A8NzaWULFMJaRYsoFW6oROeGsebGor9zYpFHijooyMBf
	ksUczL/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v93HS-000000024Fz-1dwd;
	Wed, 15 Oct 2025 15:19:10 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v93HP-000000024ER-2hF2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 15:19:09 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-42557c5cedcso3611311f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 08:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760541546; x=1761146346; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ozzqX27qI/om600ZTPA46M3BTEK2ZsX0XsaZoTyCATk=;
        b=jDGw9XjnzWBnLP1j1UkTNDgOFeacP4M5wSBppQfpWm8PEGu3t8m1t+rOxwrjZPUL13
         KOdglogzWpK9F9eVakY5DmkO2y4oLhFbqA2AadMz50pp8JDe5iNnqvcb9kWxHkeQ9pgO
         VEuhLWleQWe2aRZZElKs/5WaPw7pU9ugbRaJjJmIho6+b8DPSwVAs7O31+JgVFcVK3A6
         n9aXz6EvqS+ap25kUxzxT1sI7LMkHCTxLzhzBnpRAeoHFb4nzHaB3kHT8iSJCuAOFCkw
         qd3KVsgc1anqzsukgZhQc1v2f2YAyQsZgGD6MGLwVViMCtRk+DwLX4hnoPcBwfG/0Jp1
         04Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760541546; x=1761146346;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ozzqX27qI/om600ZTPA46M3BTEK2ZsX0XsaZoTyCATk=;
        b=HHsYPVsMEnlRbTpqHD+/S0sQo/Ldq3FXEflpPlbjb5rQdSpzllLEjXkHska0PRUAXr
         ctI1DOLDFErZfSQ0SLeNU3HWk2R4kyWGwyB6de+v8dYTPvuNDm6fbr303fZRM8pQ2zSO
         G/xtz+FxMW48RivNYnsgijZBRmoHqTJ2RKYtuS9twDdmKi+Zfh553CTuN23AIWh8teZl
         1sIxQm5glPiwbLqBIHmVep6qYeNeMqn8I8MFNU8tPjSaB/WjfnUoKrq0tv9st3DB4ahN
         if4xME/LdcDOcp+o2pfdNz9BDtj6F/8XGnpm4feqtHCFYjDhqe2/fm+Hy+pFdpt9c4XY
         M6BQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmEFarZ3ZD6Qvjaa2jF4jT+gixa8NqzF4CC0qkyjgDMqE7LiY2MDpeWzF0iO26Lh6bcE9rupOli1HJHdO/km15@lists.infradead.org
X-Gm-Message-State: AOJu0YzKxT8/RSxc2OZkjGO/0gbbnSlohkaavtoCg7weSjT6vOqOEXMc
	/RDtyOaR7jCk9rir5Oe5fn8a+aPeTP2JofoxF1W1icdpFgAn347hkVoGrJyziNG+wcQ=
X-Gm-Gg: ASbGncs+hG3xQ31BH4plr9iiOdedjkTCtF/Dd0RnrtaRESaBLj2KWw0PtWWIJyTXTGh
	Q+fpkTC+LTrnwjKQzYHsMLMXwmQxrpnErFIxla1yFk+WHtbXs+Zp4bmnz+OGl0RpRMpZTRSnvIY
	I5JqUhqtvQVrp8Gr+GaIxpXicGv/JdT+dV/wtvT7gTTqkBR63vmNph5qBxbiVq4P8zcRL3pXcN8
	pTKdC9/w9hKI8dOM7Vn0KqDzamwSgXHHNWjutWE9+f1btDsD2max12OYF6Be6VaKmmZtfwJYPST
	KHKqvTCXIoEBfFJBqeATGhXTg+b2MyXJRDyOuZLP220shomBXZkLWwjUUfEzbFK/AXx1Skf3Fw4
	r8V/hR0sJGZdERYSDjjfDiye2nPoBwPol+BvNKG9fe9VoEP3Vp8M=
X-Google-Smtp-Source: AGHT+IF3N4RF7wjNKV78n5ehk7O1cj857Eb665p5lv3nX2KcjaMyC/Xbc7kHngxEcnnvUHEwHV5Jog==
X-Received: by 2002:a05:6000:3105:b0:3f9:1571:fdea with SMTP id ffacd0b85a97d-4266e8dd683mr21126849f8f.44.1760541545655;
        Wed, 15 Oct 2025 08:19:05 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5e0e70sm29524067f8f.40.2025.10.15.08.19.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 08:19:05 -0700 (PDT)
Message-ID: <bfce6b68-783f-4aa1-b9db-d905230be609@linaro.org>
Date: Wed, 15 Oct 2025 16:19:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] coresight: Add format attribute for setting the
 timestamp interval
To: Mike Leach <mike.leach@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Leo Yan <leo.yan@arm.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20251002-james-cs-syncfreq-v3-0-fe5df2bf91d1@linaro.org>
 <20251002-james-cs-syncfreq-v3-4-fe5df2bf91d1@linaro.org>
 <CAJ9a7Vj1NnikoJyabXnad+=3SDULKCyqoZiNb_S66SkG+HD+dw@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAJ9a7Vj1NnikoJyabXnad+=3SDULKCyqoZiNb_S66SkG+HD+dw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_081907_905290_DD48595F 
X-CRM114-Status: GOOD (  35.34  )
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



On 09/10/2025 4:50 pm, Mike Leach wrote:
> Hi James
> 
> On Thu, 2 Oct 2025 at 11:10, James Clark <james.clark@linaro.org> wrote:
>>
>> Timestamps are currently emitted at the maximum rate possible, which is
>> much too frequent for most use cases. Add an attribute to be able to set
>> the interval. Granular control is not required, so save space in the
>> config by interpreting it as 2 ^ ts_interval. And then 4 bits (0 - 15) is
>> enough to set the interval to be larger than the existing SYNC timestamp
>> interval.
>>
>> No sysfs file is needed for this attribute because counter generated
>> timestamps are only configured for Perf mode.
>>
>> Only show this attribute for ETM4x because timestamps aren't configured
>> in the same way for ETM3x. The attribute is only ever read in
>> coresight-etm4x-core.c.
>>
>> Reviewed-by: Leo Yan <leo.yan@arm.com>
>> Tested-by: Leo Yan <leo.yan@arm.com>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   drivers/hwtracing/coresight/coresight-etm-perf.c   | 16 +++++++++++++++-
>>   drivers/hwtracing/coresight/coresight-etm-perf.h   |  7 +++++++
>>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 21 ++++++++++++---------
>>   3 files changed, 34 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
>> index f677c08233ba..0c1b990fc56e 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
>> @@ -13,6 +13,7 @@
>>   #include <linux/mm.h>
>>   #include <linux/init.h>
>>   #include <linux/perf_event.h>
>> +#include <linux/perf/arm_pmu.h>
>>   #include <linux/percpu-defs.h>
>>   #include <linux/slab.h>
>>   #include <linux/stringhash.h>
>> @@ -69,7 +70,8 @@ PMU_FORMAT_ATTR(sinkid,               "config2:0-31");
>>   /* config ID - set if a system configuration is selected */
>>   PMU_FORMAT_ATTR(configid,      "config2:32-63");
>>   PMU_FORMAT_ATTR(cc_threshold,  "config3:0-11");
>> -
>> +/* Interval = (2 ^ ts_level) */
>> +GEN_PMU_FORMAT_ATTR(ts_level);
>>
>>   /*
>>    * contextid always traces the "PID".  The PID is in CONTEXTIDR_EL1
>> @@ -103,11 +105,23 @@ static struct attribute *etm_config_formats_attr[] = {
>>          &format_attr_configid.attr,
>>          &format_attr_branch_broadcast.attr,
>>          &format_attr_cc_threshold.attr,
>> +       &format_attr_ts_level.attr,
>>          NULL,
>>   };
>>
>> +static umode_t etm_format_attr_is_visible(struct kobject *kobj,
>> +                                         struct attribute *attr, int unused)
>> +{
>> +       if (attr == &format_attr_ts_level.attr &&
>> +           !IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X))
>> +               return 0;
>> +
>> +       return attr->mode;
>> +}
>> +
>>   static const struct attribute_group etm_pmu_format_group = {
>>          .name   = "format",
>> +       .is_visible = etm_format_attr_is_visible,
>>          .attrs  = etm_config_formats_attr,
>>   };
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.h b/drivers/hwtracing/coresight/coresight-etm-perf.h
>> index 5febbcdb8696..d2664ffb33e5 100644
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
>> @@ -20,6 +21,12 @@ struct cscfg_config_desc;
>>    */
>>   #define ETM_ADDR_CMP_MAX       8
>>
>> +#define ATTR_CFG_FLD_ts_level_CFG      config3
>> +#define ATTR_CFG_FLD_ts_level_LO       12
>> +#define ATTR_CFG_FLD_ts_level_HI       15
>> +#define ATTR_CFG_FLD_ts_level_MASK     GENMASK(ATTR_CFG_FLD_ts_level_HI, \
>> +                                               ATTR_CFG_FLD_ts_level_LO)
>> +
>>   /**
>>    * struct etm_filter - single instruction range or start/stop configuration.
>>    * @start_addr:        The address to start tracing on.
>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> index 920d092ef862..034844f52bb2 100644
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
>> @@ -616,7 +617,7 @@ static void etm4_enable_hw_smp_call(void *info)
>>    *  +--------------+
>>    *         |
>>    *  +------v-------+
>> - *  | Counter x    |   (reload to 1 on underflow)
>> + *  | Counter x    |   (reload to 2 ^ ts_level on underflow)
>>    *  +--------------+
>>    *         |
>>    *  +------v--------------+
>> @@ -627,11 +628,17 @@ static void etm4_enable_hw_smp_call(void *info)
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
>> +       u8 ts_level = ATTR_CFG_GET_FLD(attr, ts_level);
>> +
>> +       /* Disable when ts_level == MAX */
>> +       if (ts_level == FIELD_GET(ATTR_CFG_FLD_ts_level_MASK, UINT_MAX))
>> +               return 0;
>>
> 
> Returning 0 from this function _enables_ the timestamps
> 

Returning 0 just means that etm4_parse_event_config() doesn't exit with 
an error. For ts_level == MAX we want to disable timestamps generated by 
the counter, but we still want the minimum periodic timestamps.

To disable all timestamps you'd need to have attr->config & 
BIT(ETM_OPT_TS) == false. This is set by the "timestamp" format flag 
which I tried to explain that in the docs change.

I could also change the comment to say "/* Disable counter generated 
timestamps with ts_level == MAX */"

It's unfortunate that there are now two format options for timestamps. 
Maybe instead of adding a second option we can change "timestamp" from a 
1 bit field to 4 bits, with the following meanings:

  0:     No counter timestamps or SYNC timestamps
  1-14:  Counter timestamps = 2 ^ x. Plus SYNC timestamps
  15:    Only SYNC timestamps

Now we basically have the same meanings except you also have to set the 
timestamp bit. Seems a bit pointless.

Previous versions of Perf were hard coding the timestamp format bit 
rather than reading it out of 
"/sys/bus/event_source/devices/cs_etm/format/timestamp" though:

-       /* All good, let the kernel know */
-       evsel->core.attr.config |= (1 << ETM_OPT_TS);

For that reason we'd have to leave that one where it is for backwards 
compatibility. If it's set it would be equivalent to the new wider 
timestamp field == 1.

I don't know if there's any precedent for changing the bitfield that 
backs a format field, but presumably that's the point of publishing them 
in files rather than a header.

>>          /* No point in trying if we don't have at least one counter */
>>          if (!drvdata->nr_cntr)
>> @@ -667,12 +674,8 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
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
>> +       config->cntr_val[ctridx] = config->cntrldvr[ctridx] = 1 << ts_level;
>>
>>          /*
>>           * Trace Counter Control Register TRCCNTCTLRn
>> @@ -762,7 +765,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
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
> Regards
> 
> 
> Mike
> 
> --
> Mike Leach
> Principal Engineer, ARM Ltd.
> Manchester Design Centre. UK


