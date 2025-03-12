Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA022C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 10:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bAnXaXan8q+eIeBPOO4LIWIu74EXVlerHh73XPW6Gr0=; b=06938FIb4/KTcxggJ5XHyi7sgY
	Sg1M7Rd1qS8sXZVMfvxOUtJvNUpdE4tz6k+j5DkewsMvPIx92vyhBYwkhyzDxOC9j2H9aNUsz0DtP
	MMdayr6e8CdnKlfkC4EQ6TIQIsKPjTUBuyfoF6H0EbaPMnGUSLMgoulPnPpq7gcC60HLwxDgvmd1M
	wizKOnJsHyHu37nLlWfBQyjy+VfzdpFwaTj+q2FbSOe6AnzBvXQPBJnBIR1kxHWqUefBiYOyMJpYy
	VwKDJeQCfswIpdIim2fOdbsUUaKRAkAlX1oKhxW1bI3yuwluPl31T6Wnbqr43Drw1spKr0Imv0lPq
	DGIlEvBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJDB-00000008664-2hDJ;
	Wed, 12 Mar 2025 10:21:17 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJBW-000000085r3-03Vg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 10:19:35 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-391342fc0b5so5597416f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 03:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741774772; x=1742379572; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bAnXaXan8q+eIeBPOO4LIWIu74EXVlerHh73XPW6Gr0=;
        b=kHwNJ2gkNWF8ktDW52o297iPYKnQ0fPMy3XY3p/7DXKrfaBQN7rXxsd89hTGlH3X5g
         DGo89OENEU8Q1NGH9Ju1H+o7QQY2OUrkd5/1o2sjUT3hh8wZ3W7j1eyKmMKXZQYyMwXE
         fx2HbjbocdHNH1NlRrGibwmAUztlaX+31/bwT85o8RkHOBFlHQoI4C5iHHji3pvyvuWR
         cIp325Y6KUk2w0EivvUaP4pS+EmFGMqAnODMbHQWhsWrMsvVYocXcRqdaQHhKCiG+vH0
         vM8WrAY7k2nSLWO5Of8TwjuAX8jSrmFDUr6vGbDYsllxSuhm90W3Qg4ztp5b/431P90l
         TZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741774772; x=1742379572;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bAnXaXan8q+eIeBPOO4LIWIu74EXVlerHh73XPW6Gr0=;
        b=SKQ41Ih13tb+K2HQpIkbqhKXtbZNUWLe6N6f8hT/zHBMfvScKtYwSIB9ngJd9g6NBg
         1M542Fzpr0f6fzPA4maHzWgW8OoiaYIGZO03xyyr6v2Kjc8eYlfxX+JQQPuQIgA0/ZKu
         5e5SG4a4kdgfyvJk6AzqiLQcRJ60TuoD7rW0Fg4/Ffhd+QL+7PIZDsqIhYNeIaF/iech
         Wu8Osgtayqha8SZJrlVP1mp+2L6F/gkiLKs5+Lfz6pnmMZUSjWhzuAVpP586SBZGUK8v
         DyTVqyOfZjf1ngzMycaDSfxzy7Vh2uZkcr9NbsSmeTA26evlX20aV4+JzxeTelVN4dEQ
         NLyw==
X-Forwarded-Encrypted: i=1; AJvYcCU0l753HQP0zsgt4xU/RS26qbQgsxkRAa5GYVFBf2E+v9nnywKni2eTROlxJHY7k4mFkAuzmh/ctUtEPoqiZoSK@lists.infradead.org
X-Gm-Message-State: AOJu0YwX61LPTfJCDzb3NdZ1NJFVo2mYHJiWOpZcJzOuhdf6tCMTXUPi
	zFcO29n7Gs4vWef+fDgYJDWTqgGdXqRL9mz5bC2qrfb5wjJFy8I/oqvJIYW+6Eg=
X-Gm-Gg: ASbGncvmfEJf5AiV1xRDmnKr3nfABfCuwoGIrmE3R8qUBlhWXWRy5XlgDCKHBTz4cax
	bjUAuINB6LkQ0XFaphiY7xQfZwFkleuBQiNtRQx0rwAsFLSWzj2/R/aK1x7EcOKz6Mu5noD3IS8
	87iVIYOofMHMwM1ldLw9D37AkacfHlkdTy/NNRqtj1cVF20GpkBtHsbX0vaRb4rkk4412yV+l1J
	d3aYwtNzmLGrC7VxYDSo5WdfQo6NZXRLPVS8hwrMGFZOfS5MhchnyodDjy3hOxD1+BMkBl5vSox
	BH4rb/IvnOLPUpd4oVD57MHyWnMDZAfuvpV8OUiJnkUTcHWeEYGpCg==
X-Google-Smtp-Source: AGHT+IGR/07Qmf9smabg6S6zn97UBtsm5Jw10Ieg0WIleNha8nV/NH57N3KXiYK+7r8Klg1AgUB0Eg==
X-Received: by 2002:a5d:6d8f:0:b0:38d:d9e4:9ba6 with SMTP id ffacd0b85a97d-39132d090b1mr18246613f8f.3.1741774772405;
        Wed, 12 Mar 2025 03:19:32 -0700 (PDT)
Received: from [192.168.1.247] ([209.198.129.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfba686sm21058822f8f.19.2025.03.12.03.19.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Mar 2025 03:19:32 -0700 (PDT)
Message-ID: <4d058a15-376a-4e9a-bfc0-06bd4ffbd71a@linaro.org>
Date: Wed, 12 Mar 2025 10:19:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] coresight: Add a KUnit test for
 coresight_find_default_sink()
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Leo Yan <leo.yan@arm.com>
Cc: linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org
References: <20250312-james-cs-kunit-test-v3-1-dcfb69730161@linaro.org>
 <d6194071-bc52-4f67-a36e-fc8d9d1be94c@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <d6194071-bc52-4f67-a36e-fc8d9d1be94c@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_031934_051436_2B336E51 
X-CRM114-Status: GOOD (  23.93  )
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



On 12/03/2025 10:14 am, Suzuki K Poulose wrote:
> Hi James
> 
> 
> On 12/03/2025 10:11, James Clark wrote:
>> Add a test to confirm that default sink selection skips over an ETF
>> and returns an ETR even if it's further away.
>>
>> This also makes it easier to add new unit tests in the future.
>>
>> Reviewed-by: Leo Yan <leo.yan@arm.com>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>> Changes in v3:
>> - Use CORESIGHT_DEV_SUBTYPE_SOURCE_BUS type instead of the default
>>    (CORESIGHT_DEV_SUBTYPE_SOURCE_PROC) so that the test still works even
>>    when TRBE sinks are registered. This also removes the need for the
>>    fake CPU ID callback.
>> - Link to v2: https://lore.kernel.org/r/20250305-james-cs-kunit-test- 
>> v2-1-83ba682b976c@linaro.org
>>
>> Changes in v2:
>> - Let devm free everything rather than doing individual kfrees:
>>    "Like with managed drivers, KUnit-managed fake devices are
>>    automatically cleaned up when the test finishes, but can be manually
>>    cleaned up early with kunit_device_unregister()."
>> - Link to v1: https://lore.kernel.org/r/20250225164639.522741-1- 
>> james.clark@linaro.org
>> ---
>>   drivers/hwtracing/coresight/Kconfig                |  9 +++
>>   drivers/hwtracing/coresight/Makefile               |  3 +-
>>   drivers/hwtracing/coresight/coresight-core.c       |  1 +
>>   .../hwtracing/coresight/coresight-kunit-tests.c    | 77 ++++++++++++ 
>> ++++++++++
>>   4 files changed, 88 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/ 
>> coresight/Kconfig
>> index ecd7086a5b83..f064e3d172b3 100644
>> --- a/drivers/hwtracing/coresight/Kconfig
>> +++ b/drivers/hwtracing/coresight/Kconfig
>> @@ -259,4 +259,13 @@ config CORESIGHT_DUMMY
>>         To compile this driver as a module, choose M here: the module 
>> will be
>>         called coresight-dummy.
>> +
>> +config CORESIGHT_KUNIT_TESTS
>> +      tristate "Enable Coresight unit tests"
>> +      depends on KUNIT
>> +      default KUNIT_ALL_TESTS
>> +      help
>> +        Enable Coresight unit tests. Only useful for development and not
>> +        intended for production.
>> +
>>   endif
>> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/ 
>> coresight/Makefile
>> index 8e62c3150aeb..96f0dfedb1bf 100644
>> --- a/drivers/hwtracing/coresight/Makefile
>> +++ b/drivers/hwtracing/coresight/Makefile
>> @@ -51,5 +51,4 @@ coresight-cti-y := coresight-cti-core.o    
>> coresight-cti-platform.o \
>>              coresight-cti-sysfs.o
>>   obj-$(CONFIG_ULTRASOC_SMB) += ultrasoc-smb.o
>>   obj-$(CONFIG_CORESIGHT_DUMMY) += coresight-dummy.o
>> -obj-$(CONFIG_CORESIGHT_CTCU) += coresight-ctcu.o
>> -coresight-ctcu-y := coresight-ctcu-core.o
>> +obj-$(CONFIG_CORESIGHT_KUNIT_TESTS) += coresight-kunit-tests.o
>> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/ 
>> hwtracing/coresight/coresight-core.c
>> index bd0a7edd38c9..b101aa133ceb 100644
>> --- a/drivers/hwtracing/coresight/coresight-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>> @@ -959,6 +959,7 @@ coresight_find_default_sink(struct 
>> coresight_device *csdev)
>>       }
>>       return csdev->def_sink;
>>   }
>> +EXPORT_SYMBOL_GPL(coresight_find_default_sink);
>>   static int coresight_remove_sink_ref(struct device *dev, void *data)
>>   {
>> diff --git a/drivers/hwtracing/coresight/coresight-kunit-tests.c b/ 
>> drivers/hwtracing/coresight/coresight-kunit-tests.c
>> new file mode 100644
>> index 000000000000..87439769207c
>> --- /dev/null
>> +++ b/drivers/hwtracing/coresight/coresight-kunit-tests.c
>> @@ -0,0 +1,77 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +#include <kunit/test.h>
>> +#include <kunit/device.h>
>> +#include <linux/coresight.h>
>> +
>> +#include "coresight-priv.h"
>> +
>> +static struct coresight_device *coresight_test_device(struct device 
>> *dev)
>> +{
>> +    struct coresight_device *csdev = devm_kcalloc(dev, 1,
>> +                             sizeof(struct coresight_device),
>> +                             GFP_KERNEL);
>> +    csdev->pdata = devm_kcalloc(dev, 1,
>> +                   sizeof(struct coresight_platform_data),
>> +                   GFP_KERNEL);
>> +    return csdev;
>> +}
>> +
>> +static void test_default_sink(struct kunit *test)
>> +{
>> +    /*
>> +     * ETM -> ETF -> ETR -> CATU
>> +     *                ^
>> +     *                | default
> 
> minor nit: Using ETM here is going to be confusing, with the SUBTYPE we
> are using. Please could we rename it something else and also rename the 
> variable "etm" ? Say, "source" ?
> 
> Rest looks good to me.
> 
> Suzuki
> 
> 

Yeah good point, "Source" makes sense.


