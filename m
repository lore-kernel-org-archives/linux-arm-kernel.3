Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD78C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 13:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S6j1u5Jf2C5SefjcHLkuoR9oF+Ietx4rrZSc7vUCYjk=; b=1ISP+Fw/GlH5hM3RzXl4tzG7qz
	slq2TGqUnzuHE8WDsa4r094fYcP0WfEKojKA4QXGaqECbOENI7trCJePDtxsoe92lUaQ6SxSy59/6
	r8XNyWT7fbEAEEsFz4u1cJvxmOSSUwalwK8ISE7QFTsW6kgk6qMobCj9ayK13IttFVS+dykYEp86X
	V5nb7m+VZZxs9YaMYr4rvnUyK36ZfnLpVeEErBjDVY3p7elqXMfu8ffGHISjXBU3YmOvRCOOZT6g9
	C+vLfw6N3Bs1aGL8x9FfPT1YQRXM21FVWC1oSpdGBJnR6xbIZAmbYX3ynblm4zN3QFfxwrj5zRO8t
	hR6GBeeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tppDg-00000008G5j-35jM;
	Wed, 05 Mar 2025 13:55:32 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tppB4-00000008FfZ-2VgE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 13:52:51 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43bc4b1603fso21364095e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 05:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741182768; x=1741787568; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S6j1u5Jf2C5SefjcHLkuoR9oF+Ietx4rrZSc7vUCYjk=;
        b=g63NmVsKbd/IL9im+hvCCVcbvtuNL58+YgceJIxJIkNjFApDVGmw2QS7QV9T8qErTn
         AoN/yymEjIh/+70CPHjiHMaH3IRnwnbAnPeomHrs5H3cXV6FzwonHOWltlilpxBjlcm1
         N153xejcGiM7Psrt7ZusV7J6AQpkdwIHj2tpXgowROixYFqe5GtLkBGq5CAcojkY+vYM
         utYPvoL002GEw0AO8/jc09Z5IJfNKMsGMSbP1vPuOw6vLbVNPs1GtnjULe0g94ueQ7HA
         i54hck0yH5cQT5ykCiCDlZyda59pPtJgEXSXHR65gwSIzsFFpkE3ECAfngXnWxVkQ70J
         xwsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741182768; x=1741787568;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S6j1u5Jf2C5SefjcHLkuoR9oF+Ietx4rrZSc7vUCYjk=;
        b=OogFBMKQxbqH4i/P/nxxLIzj9JacKXop1+dYJB8GE/vS6JlcRXY4Xgj1p2z3VnDyyD
         l+MpbSW5rMVj6StL0B+mmix0gNpEKugF/H4wTM4tpjugjn88s59VaphA1ulSB/v00AKY
         LePAOFT+5JRUWXiXcF7kNtGGn0uIDnBBJlEEsx0CkQXXvHmER3FDnWA6bqHDfMCCyuVM
         R/PZjggvIdc4l57kiXV/gV4GLsgSDOBMUyaMR8rggeMPe1q1w0ZJb0GMBYkRgLHXqDQl
         /ajKPGEmAg5rBIbVFP6EhAEN0UuYirzsLxLivQa/WpEwBeVHSxF6kNoZ6NFoGIOkQcnc
         Ml2g==
X-Forwarded-Encrypted: i=1; AJvYcCWwXTQQoePcjRCCe3N9XYN59/4Uo4xIpeRyjx5xkGdx1AnSlPRVIdeeWvBb/mBc5kcp2MTa53gfF+e46292KAO/@lists.infradead.org
X-Gm-Message-State: AOJu0YxWtjkrnxLljaha/bUmTKBLw185lhVzKUmB6+Sca6LQ9IctiYrB
	74Ul7ozm65aIwvlk6q+T4qlmLW1v06x0clmPMmFpe5u2p6/zuXOYIQTm59jhIjo=
X-Gm-Gg: ASbGncun25jlb/DNix4fvjxxi+c0yo9WJxLFetXD3OpN2FwO2KcIx8heS/D0KNs9/nN
	vUUEzJzthc+Xad9Y9Po2fUeqmVCxT6zt3BuYodpnWnBGAj6e9+SW/mcoo8U1R+7n3PwW/lj+9XF
	6jIurT7SbbOE56tZzfANAP7aDuLkLI32ZjwXRl/42aG7BlTrvJ7L53GB9sJDmvZ0ZplZGv9F5/W
	C7hyXVf3r2aSNDkRwxtLHgvI7GsV5R7WjXxaT3xuZL+7Tta+ivk0WkRXiKNcmSS9IKDesARitc4
	9SVg3MR/MzKg0RYL2OqTa1IswTRfRM+QkwplVe8ZJ4jZ3SW+u2y3haE=
X-Google-Smtp-Source: AGHT+IGNwGXre2668VQaI30m9O+IxSUr+emK+omtD1NUQBDyo+CUvESLBwBEmYF+kbGkg+9EZo3PhQ==
X-Received: by 2002:a5d:6d0d:0:b0:390:de66:cc0c with SMTP id ffacd0b85a97d-3911f7c750fmr2590694f8f.46.1741182768584;
        Wed, 05 Mar 2025 05:52:48 -0800 (PST)
Received: from [192.168.1.247] ([209.198.129.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b6ceesm20813720f8f.45.2025.03.05.05.52.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 05:52:48 -0800 (PST)
Message-ID: <67c484d7-6929-4a65-b89c-f3fb85682028@linaro.org>
Date: Wed, 5 Mar 2025 13:52:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: Add a KUnit test for
 coresight_find_default_sink()
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, scclevenger@os.amperecomputing.com,
 yeoreum.yun@arm.com, Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241217171132.834943-1-james.clark@linaro.org>
 <20250305114211.GG13418@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250305114211.GG13418@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_055250_658710_568DD0B1 
X-CRM114-Status: GOOD (  22.41  )
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



On 05/03/2025 11:42 am, Leo Yan wrote:
> On Tue, Dec 17, 2024 at 05:11:31PM +0000, James Clark wrote:
>>
>> Add a test to confirm that default sink selection skips over an ETF
>> and returns an ETR even if it's further away.
>>
>> This also makes it easier to add new unit tests in the future.
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   drivers/hwtracing/coresight/Kconfig           |  9 ++
>>   drivers/hwtracing/coresight/Makefile          |  1 +
>>   drivers/hwtracing/coresight/coresight-core.c  |  1 +
>>   .../coresight/coresight-kunit-tests.c         | 90 +++++++++++++++++++
>>   4 files changed, 101 insertions(+)
>>   create mode 100644 drivers/hwtracing/coresight/coresight-kunit-tests.c
>>
>> diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
>> index 06f0a7594169..056d04bc540a 100644
>> --- a/drivers/hwtracing/coresight/Kconfig
>> +++ b/drivers/hwtracing/coresight/Kconfig
>> @@ -247,4 +247,13 @@ config CORESIGHT_DUMMY
>>
>>            To compile this driver as a module, choose M here: the module will be
>>            called coresight-dummy.
>> +
>> +config CORESIGHT_KUNIT_TESTS
>> +         tristate "Enable Coresight unit tests"
>> +         depends on KUNIT
>> +         default KUNIT_ALL_TESTS
>> +         help
>> +           Enable Coresight unit tests. Only useful for development and not
>> +           intended for production.
>> +
>>   endif
>> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
>> index 4ba478211b31..c170a41b3056 100644
>> --- a/drivers/hwtracing/coresight/Makefile
>> +++ b/drivers/hwtracing/coresight/Makefile
>> @@ -51,3 +51,4 @@ coresight-cti-y := coresight-cti-core.o       coresight-cti-platform.o \
>>                     coresight-cti-sysfs.o
>>   obj-$(CONFIG_ULTRASOC_SMB) += ultrasoc-smb.o
>>   obj-$(CONFIG_CORESIGHT_DUMMY) += coresight-dummy.o
>> +obj-$(CONFIG_CORESIGHT_KUNIT_TESTS) += coresight-kunit-tests.o
>> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
>> index ea38ecf26fcb..ce63b68d5503 100644
>> --- a/drivers/hwtracing/coresight/coresight-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>> @@ -869,6 +869,7 @@ coresight_find_default_sink(struct coresight_device *csdev)
>>          }
>>          return csdev->def_sink;
>>   }
>> +EXPORT_SYMBOL_GPL(coresight_find_default_sink);
>>
>>   static int coresight_remove_sink_ref(struct device *dev, void *data)
>>   {
>> diff --git a/drivers/hwtracing/coresight/coresight-kunit-tests.c b/drivers/hwtracing/coresight/coresight-kunit-tests.c
>> new file mode 100644
>> index 000000000000..d022bacc8357
>> --- /dev/null
>> +++ b/drivers/hwtracing/coresight/coresight-kunit-tests.c
>> @@ -0,0 +1,90 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +#include <kunit/test.h>
>> +#include <kunit/device.h>
>> +#include <linux/coresight.h>
>> +
>> +#include "coresight-priv.h"
>> +
>> +static struct coresight_device *coresight_test_device(struct device *dev)
>> +{
>> +       struct coresight_device *csdev = devm_kcalloc(dev, 1,
>> +                                                    sizeof(struct coresight_device),
>> +                                                    GFP_KERNEL);
>> +       csdev->pdata = devm_kcalloc(dev, 1,
>> +                                  sizeof(struct coresight_platform_data),
>> +                                  GFP_KERNEL);
>> +       return csdev;
>> +}
>> +
>> +static void coresight_free_test_device(struct device *dev,
>> +                                      struct coresight_device *csdev)
>> +{
>> +       devm_kfree(dev, csdev->pdata->out_conns);
> 
> It will lead memory leaking if we don't release connections pointed by
> 'out_conns' pointer array.  Something like:
> 
>            for (i = 0; i < csdev->pdata->nr_outconns; i++)
>                 devm_kfree(dev, csdev->pdata->out_conns[i]);
>            devm_kfree(dev, csdev->pdata->out_conns);
> 
> Otherwise, it looks good to me.
> 
> Thanks,
> Leo
> 

Ah yeah, I'll just free the whole device instead of the individual 
kfrees then and let devm handle it.


