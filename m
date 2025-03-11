Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FBB8C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 16:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FXsmviR97V/C+Y6DN95zESwUd4Ub5ygS+7V9sfykhO8=; b=enhVAz2x2QVG+dbT4kE/3KsT5f
	B6BCo90RAIZfBLawmvVi2aWIhWvaLHod6qCEHcA6Y0ymEMdvdC3aM+2a8EUCYb7epkcwwdvZoLK+y
	CmEt+VmYvpt5ZJglsMtRBf95zjnvE0kYlfo5+UwaXyv1K8VAvLEjt+QSiM4x1LteWsERrX7oX2vJL
	MWiafs6OLW820CGTF1UI+vg1NgDWVFdswpquPAUud7cAoDsUapIb1g1BtHhNO0ycpUbCRPuAy5yZu
	nPB0Yt3iWr/6O7xQpbO8fIibJ14p9gavB683rWv+w6xWvqTnHRIqfraEnLbZDVCjJx96SngLkdOXp
	Oh0MlzCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts29R-00000006ISq-2i1e;
	Tue, 11 Mar 2025 16:08:17 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts27n-00000006Hrs-0idT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 16:06:36 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso2938323f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 09:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741709193; x=1742313993; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FXsmviR97V/C+Y6DN95zESwUd4Ub5ygS+7V9sfykhO8=;
        b=o+CLaoEQTXhNycB3KNw3Twn/+EW9szUXaeEL7+o/FAQy1c+FiTApjynp+szaLv3XgB
         yTmUSjPsrLr//yQnKxUXUpoVysxlOeaAhLTpl31lKKDAKypyfO0fsYkED/KwrkYgpXbL
         9K37vEgziKcEw8FFKUBDnp1AbIbabb8Dt+8AVyUk8+FUB9sEe8/EG5Ls5TtYYqavsvGB
         AfyWK307I/PHXXIjza6SmHeNsz8W+5ZPwDXgxvNWGrP2PT3keDAHX/BR7xYU/L2t/jYz
         NO4r8JXhEUznk77ZiJkmaCUz5vSeATowkTkx4MGVa2lsghW+5QNMRxBYD6HfFEQMEpZm
         NDHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741709193; x=1742313993;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FXsmviR97V/C+Y6DN95zESwUd4Ub5ygS+7V9sfykhO8=;
        b=DPJsA2lIrSt19dvvsinOlB1xME3iQ2ntvQY7zzppsNVu/SbOlFid8w4gSykK177SSr
         O9pFvoz7zKqQBbPS8knHBCIDKGIsk8vuhaH97l5F5ZT3/o4tiaDSwIWRm1hHAkoE9pYd
         hpkC+BZo1k2HJ49DyvrA3+UEWYbCPnLQd+iISpvNd+XEu9HYk9AQpbUQiW+BJ1KXUtMk
         BAJBK5Gr26FQDTdTDtX6NECnYGzJk2h79uAag9PKMAIaDKJKiW84AVf77HE16XDoQgdQ
         BYa/DxGj/VYmYngv63Y03KAqhSmX5sRTxwKMVrdqgpMCaSfg72n3AnqivAs/jf1BbX+9
         amVw==
X-Forwarded-Encrypted: i=1; AJvYcCXKitmb0zaHy+UsifVfLruGXstAbF9LzCf52EpDzIjUfn5kawmreKZ0gInZP+iSGiOmZosSDwrM4g5nLBqRbVwO@lists.infradead.org
X-Gm-Message-State: AOJu0YyPWzRj7C0uIG9YuJu3GjFkCnx1D9R/sgWCPdxE4oBSPK80/TeH
	MPB5D91/ekrf8Zb+BS43qtTLE3SMIZ/z69Mv5UDCb/7kGbNXZd7RzhqqYlfsUMU=
X-Gm-Gg: ASbGncs6Vvel1lr/sElDEJSj8wR1hbPAnc01G3yff0H20otv9MK1hV/8v01UQQz0h2V
	3HQLj14++siztFajcZKNUA6DxjBYhgj1fDTlou02T2p7sk3NUJLPl+WQMpvnAhlzw8xdQlR/TAE
	CUTf/9IinsY2ToxzyoSxB69XB0EoM668+9RNUmpJ/E7Dh1YLho02pIPISDqXjwJArMaW9r/ANSt
	RVcQVt1E+nkX92hPJuLycRvTqpFbgpcnvU5hiwglGK6Vbe/FharDa9Bq9pZ49+nPoYQ5hQDCNiM
	BqoAazq3qS3OQHheFQYc8l92VjX+RICmxGw+gXXD64/QqOSvkpjHQnE3nhehLPU=
X-Google-Smtp-Source: AGHT+IHSsCm8PJOCNTBLbU5hS9VK9UHGVgainULGpG4I1aqQfmscGAZFmbLVme10Qk7EkXAo6AGeDQ==
X-Received: by 2002:a05:6000:1a8f:b0:391:3207:2e68 with SMTP id ffacd0b85a97d-3926c3b8b38mr4616837f8f.9.1741709193494;
        Tue, 11 Mar 2025 09:06:33 -0700 (PDT)
Received: from [192.168.1.247] ([145.224.65.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c01de21sm18711241f8f.59.2025.03.11.09.06.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 09:06:32 -0700 (PDT)
Message-ID: <16fd2023-1ffa-4e87-ad89-a7ccdd8ba458@linaro.org>
Date: Tue, 11 Mar 2025 16:06:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] coresight: Add a KUnit test for
 coresight_find_default_sink()
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Leo Yan <leo.yan@arm.com>
References: <20250305-james-cs-kunit-test-v2-1-83ba682b976c@linaro.org>
 <c31de6cb-f8f5-432c-b99e-68b10a24bc5e@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <c31de6cb-f8f5-432c-b99e-68b10a24bc5e@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_090635_225907_754328CB 
X-CRM114-Status: GOOD (  25.98  )
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



On 11/03/2025 3:00 pm, Suzuki K Poulose wrote:
> On 05/03/2025 15:07, James Clark wrote:
>> Add a test to confirm that default sink selection skips over an ETF
>> and returns an ETR even if it's further away.
>>
>> This also makes it easier to add new unit tests in the future.
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
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
>> index 000000000000..a136af05eaf4
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
>> +static int coresight_test_cpuid(struct coresight_device *csdev)
>> +{
>> +    return 0;
>> +}
>> +
>> +static void test_default_sink(struct kunit *test)
>> +{
>> +    /*
>> +     * ETM -> ETF -> ETR -> CATU
>> +     *                ^
>> +     *                | default
>> +     */
>> +    struct device *dev = kunit_device_register(test, "coresight_kunit");
>> +    struct coresight_device *etm = coresight_test_device(dev),
>> +                *etf = coresight_test_device(dev),
>> +                *etr = coresight_test_device(dev),
>> +                *catu = coresight_test_device(dev);
>> +    struct coresight_connection conn = {};
>> +    struct coresight_ops_source src_ops = {.cpu_id = 
>> coresight_test_cpuid };
> 
> Do we need the trace_id() ? Why is this required ?
> 
> Suzuki
> 

Because it tests with per-cpu sources so it checks if any of the TRBE 
sinks have been assigned first:

  /* look for a default sink if we have not found for this device */
    if (!csdev->def_sink) {
       if (coresight_is_percpu_source(csdev))
	 csdev->def_sink = per_cpu(csdev_sink,
                                    source_ops(csdev)->cpu_id(csdev));

I think this test would probably fail if run somewhere TRBE was already 
probed. I can make the source subtype to be 
CORESIGHT_DEV_SUBTYPE_SOURCE_BUS for the test to work around it. Any 
value other than CORESIGHT_DEV_SUBTYPE_SOURCE_PROC will work. And then I 
can drop the fake cpu_id() callback.


