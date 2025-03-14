Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51177C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 12:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oKMfOQf6auwzaKDD22yISXPvYXUmJM4msEsjlYJX3Kc=; b=CGtfYDMS62CfJwZIdquqlA+Ws9
	d1I4IR790+9HjmG5zoO+Yew9LcgfdBpq1+HalNGSyoNbCzB9nL7q8jW7+m7r9fzKfurymX/kXsTyM
	RHwU8umX32zTh77FLsxrn1OTHVawsay2X0hIPr2ZUQPeeG5udnlP20LTjGSR9Rs9FH9omr95syqcL
	eO9pPuBnjaxi49evvSuUq1l7ydB1FfIDM2dvGxqnLMuyAMxDikrr44lLZ26qiKyAgTXCBNMUv4heN
	84C1L/Q3M6AnkOsEk0Qxa4meY+ssQ0x3DXJu2M9yOe/oYwpPUznHHtezJfGv4xtOk/yrKKEjXTvyz
	5mJc70cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt4I5-0000000EBgR-2xOi;
	Fri, 14 Mar 2025 12:37:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt4GO-0000000EBSn-0Uq3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 12:35:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 79C831424;
	Fri, 14 Mar 2025 05:35:51 -0700 (PDT)
Received: from [10.163.40.244] (unknown [10.163.40.244])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A96EA3F5A1;
	Fri, 14 Mar 2025 05:35:38 -0700 (PDT)
Message-ID: <48b192c7-4250-4e11-8dcd-b147dd8c0a28@arm.com>
Date: Fri, 14 Mar 2025 18:05:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] coresight: Add a KUnit test for
 coresight_find_default_sink()
To: James Clark <james.clark@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Leo Yan <leo.yan@arm.com>
Cc: linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org
References: <20250312-james-cs-kunit-test-v4-1-ae3dd718a26a@linaro.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250312-james-cs-kunit-test-v4-1-ae3dd718a26a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_053544_256312_25091845 
X-CRM114-Status: GOOD (  31.45  )
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

On 3/12/25 16:01, James Clark wrote:
> Add a test to confirm that default sink selection skips over an ETF
> and returns an ETR even if it's further away.
> 
> This also makes it easier to add new unit tests in the future.

The test overall looks good but there are some comments below.

> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
> Changes in v4:
> - Rename etm to src now that it's not CORESIGHT_DEV_SUBTYPE_SOURCE_PROC
> - Remove the now empty src_ops too
> - Fix a rebase mistake in the Makefile that removed CTCU
> - Link to v3: https://lore.kernel.org/r/20250312-james-cs-kunit-test-v3-1-dcfb69730161@linaro.org
> 
> Changes in v3:
> - Use CORESIGHT_DEV_SUBTYPE_SOURCE_BUS type instead of the default
>   (CORESIGHT_DEV_SUBTYPE_SOURCE_PROC) so that the test still works even
>   when TRBE sinks are registered. This also removes the need for the
>   fake CPU ID callback.
> - Link to v2: https://lore.kernel.org/r/20250305-james-cs-kunit-test-v2-1-83ba682b976c@linaro.org
> 
> Changes in v2:
> - Let devm free everything rather than doing individual kfrees:
>   "Like with managed drivers, KUnit-managed fake devices are
>   automatically cleaned up when the test finishes, but can be manually
>   cleaned up early with kunit_device_unregister()."
> - Link to v1: https://lore.kernel.org/r/20250225164639.522741-1-james.clark@linaro.org
> ---
>  drivers/hwtracing/coresight/Kconfig                |  9 +++
>  drivers/hwtracing/coresight/Makefile               |  1 +
>  drivers/hwtracing/coresight/coresight-core.c       |  1 +
>  .../hwtracing/coresight/coresight-kunit-tests.c    | 74 ++++++++++++++++++++++
>  4 files changed, 85 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
> index ecd7086a5b83..f064e3d172b3 100644
> --- a/drivers/hwtracing/coresight/Kconfig
> +++ b/drivers/hwtracing/coresight/Kconfig
> @@ -259,4 +259,13 @@ config CORESIGHT_DUMMY
>  
>  	  To compile this driver as a module, choose M here: the module will be
>  	  called coresight-dummy.
> +
> +config CORESIGHT_KUNIT_TESTS
> +	  tristate "Enable Coresight unit tests"
> +	  depends on KUNIT
> +	  default KUNIT_ALL_TESTS
> +	  help
> +	    Enable Coresight unit tests. Only useful for development and not
> +	    intended for production.

The description sounds adequate given that more unit tests might be added later.

> +
>  endif
> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
> index 8e62c3150aeb..4e6ea5b05b01 100644
> --- a/drivers/hwtracing/coresight/Makefile
> +++ b/drivers/hwtracing/coresight/Makefile
> @@ -53,3 +53,4 @@ obj-$(CONFIG_ULTRASOC_SMB) += ultrasoc-smb.o
>  obj-$(CONFIG_CORESIGHT_DUMMY) += coresight-dummy.o
>  obj-$(CONFIG_CORESIGHT_CTCU) += coresight-ctcu.o
>  coresight-ctcu-y := coresight-ctcu-core.o
> +obj-$(CONFIG_CORESIGHT_KUNIT_TESTS) += coresight-kunit-tests.o
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index fb43ef6a3b1f..47af75ba7a00 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -959,6 +959,7 @@ coresight_find_default_sink(struct coresight_device *csdev)
>  	}
>  	return csdev->def_sink;
>  }
> +EXPORT_SYMBOL_GPL(coresight_find_default_sink);

This symbol needs exporting given that the kunit test here can also be built
as a module.

>  
>  static int coresight_remove_sink_ref(struct device *dev, void *data)
>  {
> diff --git a/drivers/hwtracing/coresight/coresight-kunit-tests.c b/drivers/hwtracing/coresight/coresight-kunit-tests.c
> new file mode 100644
> index 000000000000..c8f361767c45
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/coresight-kunit-tests.c
> @@ -0,0 +1,74 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <kunit/test.h>
> +#include <kunit/device.h>
> +#include <linux/coresight.h>
> +
> +#include "coresight-priv.h"
> +
> +static struct coresight_device *coresight_test_device(struct device *dev)
> +{
> +	struct coresight_device *csdev = devm_kcalloc(dev, 1,
> +						     sizeof(struct coresight_device),
> +						     GFP_KERNEL);
> +	csdev->pdata = devm_kcalloc(dev, 1,
> +				   sizeof(struct coresight_platform_data),
> +				   GFP_KERNEL);

Guess both these memory allocations gets freed up here automatically
via kunit_device's device framework when the test suit exits ?

> +	return csdev;
> +}
> +
> +static void test_default_sink(struct kunit *test)
> +{
> +	/*
> +	 * Source -> ETF -> ETR -> CATU
> +	 *                   ^
> +	 *                   | default
> +	 */

Should some more random path combinations involving ETR and ETF along with
other coresight devices also be tested where ETR gets selected as default ?

> +	struct device *dev = kunit_device_register(test, "coresight_kunit");
> +	struct coresight_device *src = coresight_test_device(dev),
> +				*etf = coresight_test_device(dev),
> +				*etr = coresight_test_device(dev),
> +				*catu = coresight_test_device(dev);
> +	struct coresight_connection conn = {};
> +
> +	src->type = CORESIGHT_DEV_TYPE_SOURCE;
> +	/*
> +	 * Don't use CORESIGHT_DEV_SUBTYPE_SOURCE_PROC, that would always return
> +	 * a TRBE sink if one is registered.

Probably this should be tested as well i.e when TRBE sink is also available
and it gets picked up as a default.

> +	 */
> +	src->subtype.source_subtype = CORESIGHT_DEV_SUBTYPE_SOURCE_BUS;
> +	etf->type = CORESIGHT_DEV_TYPE_LINKSINK;
> +	etf->subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_BUFFER;
> +	etr->type = CORESIGHT_DEV_TYPE_SINK;
> +	etr->subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_SYSMEM;
> +	catu->type = CORESIGHT_DEV_TYPE_HELPER;
> +
> +	conn.src_dev = src;
> +	conn.dest_dev = etf;
> +	coresight_add_out_conn(dev, src->pdata, &conn);
> +
> +	conn.src_dev = etf;
> +	conn.dest_dev = etr;
> +	coresight_add_out_conn(dev, etf->pdata, &conn);
> +
> +	conn.src_dev = etr;
> +	conn.dest_dev = catu;
> +	coresight_add_out_conn(dev, etr->pdata, &conn);
> +
> +	KUNIT_ASSERT_PTR_EQ(test, coresight_find_default_sink(src), etr);
> +}
> +
> +static struct kunit_case coresight_testcases[] = {
> +	KUNIT_CASE(test_default_sink),
> +	{}
> +};
> +
> +static struct kunit_suite coresight_test_suite = {
> +	.name = "coresight_test_suite",
> +	.test_cases = coresight_testcases,
> +};
> +
> +kunit_test_suites(&coresight_test_suite);
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("James Clark <james.clark@linaro.org>");
> +MODULE_DESCRIPTION("Arm CoreSight KUnit tests");
> 
> ---
> base-commit: 3eadce8308bc8d808fd9e3a9d211c84215087451
> change-id: 20250305-james-cs-kunit-test-3af1df2401e6
> 
> Best regards,

