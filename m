Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7671C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 11:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VK7AhVJ3F7THFxrXb84qbxNbA9ZQJ8dVwTTugtkUz/w=; b=dOeQ8PAqV52Ozo1p/kGt624vM0
	lHFbwKjEWjOpxRu+wBHKt3lYtAGu5/ihcA+MAMiG1sTIYeeFq7vJt5Xy3xsuDfYKBwdctlGDFGKAE
	a4cp42yJgdisjgV/u23Mee34QDGwKMnoPjG3RiFnbbsCXKdSGPrpvGl/LWA0zz9cqS2+4HiwY0yFc
	MDZtLqUgJPQGqfWYKLrQfURniRuMEd4jEieaaocIEBzes01xImxKK578z0URJR8+wnHlRDL4QSwUq
	hkEyXExP13uJmn5Rro9TekFdiQNn3j796Iu5QxLHCzohuT/XnZW0o95RhGjruZ+RmTsqPNWQbxyib
	qBE4ca2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu8DJ-00000002IjT-1YF5;
	Mon, 17 Mar 2025 11:00:57 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu8Ba-00000002I3b-1ZK7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 10:59:12 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3913fdd0120so2175760f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 03:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742209148; x=1742813948; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VK7AhVJ3F7THFxrXb84qbxNbA9ZQJ8dVwTTugtkUz/w=;
        b=tQx7NfsCUgubOqthEdInBZ4om4V2tDDzz3mKIGz7C79HrB9IYI3YchQRTw7T7gBrde
         ry6igjRjWSN4v1o3By/10reaqeUI/s9PsAU07m7qnWu8cFSfhtbDIRZgG2aavfcduoHu
         6WLbHmwrHQgHxkAo9T6xchMBwCp53GQkI5rzWDvLDxRJnN2EdlzNH+AcjY6KHvSUK8IJ
         IsV8q4gmfTmE2fLcUHXku15y24B1yFM2PZ4BHSSs1DYZ3BoLPDSy5lGv57i9NRL6Q8PH
         lCpuUMjZ5SPQ1AOoMupTxBp6L8wOUKRWoOLJ6BZOPNXD5WnBhacOypYzBjsDtyNLwts3
         DsWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742209148; x=1742813948;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VK7AhVJ3F7THFxrXb84qbxNbA9ZQJ8dVwTTugtkUz/w=;
        b=TAOqbMbffht8oSsDRq9f4pkbUwH1nnKXJbsUmGabpnwnZfhMvPL76gdJCZyiQbTWPu
         it9bnex8vfFCh45Y1GKgdfbvp9Mby24h+SD3ReF4jfgw5J5tQlNulQU6yGHwqRItIio3
         7UQG1tNXxBFNbB+nCFu+A1NlmqbZOCQQPs88jH93hUuWTNNR8jsJkP5QHpylxGUrhIn0
         KKkHwFihNZVPQMdjKqug4hLRPowL8IBkoHztWmGFqSeK2JraBJ1CDobTbpCzY33rrDSJ
         8FCLlN+ifDeoEd9/xnGx0Fchrn5UQi7qkOJ24A/SauvTN7+Otk3i5pk1Nhuz2ZnLKcPF
         qz7Q==
X-Forwarded-Encrypted: i=1; AJvYcCV8Eyq4JAKHhEzC7pK37gBf+t2DaKEiU58b5eoKPcojsvZVWK21yBBbHtA3AZ0Ch0CCndHvKUMxj01ubQuBp8na@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/6NFitxAPMpeeuYWpJ/FMM8wea5R5nETkWBKPWtXZOeoavo0j
	r1ENkgIJVAdsZLZOV8smj/VZ3TZHA0+QXBjXlg+n7uecdGH/fgKv0FWl8Qn8pcI=
X-Gm-Gg: ASbGncsJ33RQbjPGqgY91zzMFzlY2EOQZxhbjJB2mDoWcTi5i5hu1s7UFLaxIJdYm41
	fb94FLoqSL9OF7PHar/gz1Hn4tDrw260taQos50j0nUw+N6BVjoMzJR4jk5pD7TGhhLPMv3Oltd
	vHkPoMQWVwoahUxtKMIEB1fAd0Kn616qQ4H2Lk7kW9RG4sk4OL2/7pEixj7c0fsC4qNndo1+rUK
	QxDRXd/y2vr5x+OOab2rp0le7taCvEckBt7sH6cui66PDqDJ0TeF+LvRs2j6GonlbXXYtZ3f0AM
	osNJe5oBQXzwRTfyp+kjpNDatLnj4Av+cliVEDNb87Nrz7Wt0vnT0Q==
X-Google-Smtp-Source: AGHT+IE+pZAT6Zoz4mByy2Kt/0T1l09GR38j2gc34XOf4nGPlW76sJSyy7cY+0y2lLhYLTV7X3IOTQ==
X-Received: by 2002:a05:6000:381:b0:397:8ef9:a143 with SMTP id ffacd0b85a97d-3978ef9a95amr10631556f8f.23.1742209148257;
        Mon, 17 Mar 2025 03:59:08 -0700 (PDT)
Received: from [192.168.1.247] ([145.224.67.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb7ebaa5sm14530404f8f.87.2025.03.17.03.59.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 03:59:07 -0700 (PDT)
Message-ID: <919b1fa9-3b95-4be1-a966-9f0cfc166756@linaro.org>
Date: Mon, 17 Mar 2025 10:59:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] coresight: Add a KUnit test for
 coresight_find_default_sink()
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Leo Yan <leo.yan@arm.com>
References: <20250312-james-cs-kunit-test-v4-1-ae3dd718a26a@linaro.org>
 <48b192c7-4250-4e11-8dcd-b147dd8c0a28@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <48b192c7-4250-4e11-8dcd-b147dd8c0a28@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_035910_422033_F732B960 
X-CRM114-Status: GOOD (  32.58  )
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



On 14/03/2025 12:35 pm, Anshuman Khandual wrote:
> On 3/12/25 16:01, James Clark wrote:
>> Add a test to confirm that default sink selection skips over an ETF
>> and returns an ETR even if it's further away.
>>
>> This also makes it easier to add new unit tests in the future.
> 
> The test overall looks good but there are some comments below.
> 
>>
>> Reviewed-by: Leo Yan <leo.yan@arm.com>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>> Changes in v4:
>> - Rename etm to src now that it's not CORESIGHT_DEV_SUBTYPE_SOURCE_PROC
>> - Remove the now empty src_ops too
>> - Fix a rebase mistake in the Makefile that removed CTCU
>> - Link to v3: https://lore.kernel.org/r/20250312-james-cs-kunit-test-v3-1-dcfb69730161@linaro.org
>>
>> Changes in v3:
>> - Use CORESIGHT_DEV_SUBTYPE_SOURCE_BUS type instead of the default
>>    (CORESIGHT_DEV_SUBTYPE_SOURCE_PROC) so that the test still works even
>>    when TRBE sinks are registered. This also removes the need for the
>>    fake CPU ID callback.
>> - Link to v2: https://lore.kernel.org/r/20250305-james-cs-kunit-test-v2-1-83ba682b976c@linaro.org
>>
>> Changes in v2:
>> - Let devm free everything rather than doing individual kfrees:
>>    "Like with managed drivers, KUnit-managed fake devices are
>>    automatically cleaned up when the test finishes, but can be manually
>>    cleaned up early with kunit_device_unregister()."
>> - Link to v1: https://lore.kernel.org/r/20250225164639.522741-1-james.clark@linaro.org
>> ---
>>   drivers/hwtracing/coresight/Kconfig                |  9 +++
>>   drivers/hwtracing/coresight/Makefile               |  1 +
>>   drivers/hwtracing/coresight/coresight-core.c       |  1 +
>>   .../hwtracing/coresight/coresight-kunit-tests.c    | 74 ++++++++++++++++++++++
>>   4 files changed, 85 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
>> index ecd7086a5b83..f064e3d172b3 100644
>> --- a/drivers/hwtracing/coresight/Kconfig
>> +++ b/drivers/hwtracing/coresight/Kconfig
>> @@ -259,4 +259,13 @@ config CORESIGHT_DUMMY
>>   
>>   	  To compile this driver as a module, choose M here: the module will be
>>   	  called coresight-dummy.
>> +
>> +config CORESIGHT_KUNIT_TESTS
>> +	  tristate "Enable Coresight unit tests"
>> +	  depends on KUNIT
>> +	  default KUNIT_ALL_TESTS
>> +	  help
>> +	    Enable Coresight unit tests. Only useful for development and not
>> +	    intended for production.
> 
> The description sounds adequate given that more unit tests might be added later.
> 
>> +
>>   endif
>> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
>> index 8e62c3150aeb..4e6ea5b05b01 100644
>> --- a/drivers/hwtracing/coresight/Makefile
>> +++ b/drivers/hwtracing/coresight/Makefile
>> @@ -53,3 +53,4 @@ obj-$(CONFIG_ULTRASOC_SMB) += ultrasoc-smb.o
>>   obj-$(CONFIG_CORESIGHT_DUMMY) += coresight-dummy.o
>>   obj-$(CONFIG_CORESIGHT_CTCU) += coresight-ctcu.o
>>   coresight-ctcu-y := coresight-ctcu-core.o
>> +obj-$(CONFIG_CORESIGHT_KUNIT_TESTS) += coresight-kunit-tests.o
>> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
>> index fb43ef6a3b1f..47af75ba7a00 100644
>> --- a/drivers/hwtracing/coresight/coresight-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>> @@ -959,6 +959,7 @@ coresight_find_default_sink(struct coresight_device *csdev)
>>   	}
>>   	return csdev->def_sink;
>>   }
>> +EXPORT_SYMBOL_GPL(coresight_find_default_sink);
> 
> This symbol needs exporting given that the kunit test here can also be built
> as a module.
> 
>>   
>>   static int coresight_remove_sink_ref(struct device *dev, void *data)
>>   {
>> diff --git a/drivers/hwtracing/coresight/coresight-kunit-tests.c b/drivers/hwtracing/coresight/coresight-kunit-tests.c
>> new file mode 100644
>> index 000000000000..c8f361767c45
>> --- /dev/null
>> +++ b/drivers/hwtracing/coresight/coresight-kunit-tests.c
>> @@ -0,0 +1,74 @@
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
>> +	struct coresight_device *csdev = devm_kcalloc(dev, 1,
>> +						     sizeof(struct coresight_device),
>> +						     GFP_KERNEL);
>> +	csdev->pdata = devm_kcalloc(dev, 1,
>> +				   sizeof(struct coresight_platform_data),
>> +				   GFP_KERNEL);
> 
> Guess both these memory allocations gets freed up here automatically
> via kunit_device's device framework when the test suit exits ?
> 

Yes, see the change log in the cover letter.

>> +	return csdev;
>> +}
>> +
>> +static void test_default_sink(struct kunit *test)
>> +{
>> +	/*
>> +	 * Source -> ETF -> ETR -> CATU
>> +	 *                   ^
>> +	 *                   | default
>> +	 */
> 
> Should some more random path combinations involving ETR and ETF along with
> other coresight devices also be tested where ETR gets selected as default ?
> 

Probably, but I only added what was required to test Steve's original 
bug report. We can add more tests for coresight_find_default_sink() if 
when it gets changed or refactored in the future. At the moment without 
any changes in sight there wouldn't be any benefit.

>> +	struct device *dev = kunit_device_register(test, "coresight_kunit");
>> +	struct coresight_device *src = coresight_test_device(dev),
>> +				*etf = coresight_test_device(dev),
>> +				*etr = coresight_test_device(dev),
>> +				*catu = coresight_test_device(dev);
>> +	struct coresight_connection conn = {};
>> +
>> +	src->type = CORESIGHT_DEV_TYPE_SOURCE;
>> +	/*
>> +	 * Don't use CORESIGHT_DEV_SUBTYPE_SOURCE_PROC, that would always return
>> +	 * a TRBE sink if one is registered.
> 
> Probably this should be tested as well i.e when TRBE sink is also available
> and it gets picked up as a default.
> 

This is quite simple logic so it's probably even less of a valuable 
test. I only added a test for the other sinks because the recursive 
search for them is not easy code to follow by eye.


