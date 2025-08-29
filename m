Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C99CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 19:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pm25Q/lKNzUKoxs3qT22KLl9gwPR3idydot1cXnOFr4=; b=JNTW7/penqxHZ3SWjueadXql8s
	HfRmDz62vCcFQOqbxM42CVe59gsAu40P/54/TT4inbOgJ7c7d7aVDs4FiFK6TwK0nJ7j8qdNaiop6
	J+0wxFRXzReXp2j+Np9a43SYS33SZA/PpVKe8Eyot++8OCDsLeNS0ugYMKtIjL67N7bbpYE+TrO5W
	ArJNLkIoSdk86uDADWxFG5s+wAf0oBv07ZATMuGTUYs3jNioj9+ZXlAl5NgVNheKJNQFYEkjDbF0X
	/dHCCFAK9fZqfUfjTVsVa7CPKmdNB+djDQHUHE5v+71crkyqhqB3e0ymaLSHJLTWwQP8CpZrVQqvw
	AB6vkeZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us4yj-00000006nHd-0Ndt;
	Fri, 29 Aug 2025 19:41:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us2PK-00000006TEh-1Eqo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 16:56:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2033B12FC;
	Fri, 29 Aug 2025 09:56:49 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8F50B3F738;
	Fri, 29 Aug 2025 09:56:51 -0700 (PDT)
Message-ID: <ee847bec-ad08-473e-96b5-407872c2a0f2@arm.com>
Date: Fri, 29 Aug 2025 17:56:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 32/33] arm_mpam: Add kunit test for bitmap reset
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com,
 baisheng.gao@unisoc.com, Jonathan Cameron <jonathan.cameron@huawei.com>,
 Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250822153048.2287-1-james.morse@arm.com>
 <20250822153048.2287-33-james.morse@arm.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20250822153048.2287-33-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_095658_413966_BF635C52 
X-CRM114-Status: GOOD (  24.33  )
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

Hi James,

On 8/22/25 16:30, James Morse wrote:
> The bitmap reset code has been a source of bugs. Add a unit test.
> 
> This currently has to be built in, as the rest of the driver is
> builtin.
> 
> Suggested-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
>  drivers/resctrl/Kconfig             | 13 ++++++
>  drivers/resctrl/mpam_devices.c      |  4 ++
>  drivers/resctrl/test_mpam_devices.c | 68 +++++++++++++++++++++++++++++
>  3 files changed, 85 insertions(+)
>  create mode 100644 drivers/resctrl/test_mpam_devices.c
> 
> diff --git a/drivers/resctrl/Kconfig b/drivers/resctrl/Kconfig
> index dff7b87280ab..f5e0609975e4 100644
> --- a/drivers/resctrl/Kconfig
> +++ b/drivers/resctrl/Kconfig
> @@ -4,8 +4,21 @@ config ARM64_MPAM_DRIVER
>  	bool "MPAM driver for System IP, e,g. caches and memory controllers"
>  	depends on ARM64_MPAM && EXPERT
>  
> +menu "ARM64 MPAM driver options"
> +
>  config ARM64_MPAM_DRIVER_DEBUG
>  	bool "Enable debug messages from the MPAM driver."
>  	depends on ARM64_MPAM_DRIVER
>  	help
>  	  Say yes here to enable debug messages from the MPAM driver.
> +
> +config MPAM_KUNIT_TEST
> +	bool "KUnit tests for MPAM driver " if !KUNIT_ALL_TESTS
> +	depends on KUNIT=y
It depends on ARM64_MPAM_DRIVER as well.

> +	default KUNIT_ALL_TESTS
> +	help
> +	  Enable this option to run tests in the MPAM driver.
> +
> +	  If unsure, say N.
> +
> +endmenu
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 65c30ebfe001..4cf5aae88c53 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -2903,3 +2903,7 @@ static int __init mpam_msc_driver_init(void)
>  }
>  /* Must occur after arm64_mpam_register_cpus() from arch_initcall() */
>  subsys_initcall(mpam_msc_driver_init);
> +
> +#ifdef CONFIG_MPAM_KUNIT_TEST
> +#include "test_mpam_devices.c"
> +#endif
> diff --git a/drivers/resctrl/test_mpam_devices.c b/drivers/resctrl/test_mpam_devices.c
> new file mode 100644
> index 000000000000..8e9d6c88171c
> --- /dev/null
> +++ b/drivers/resctrl/test_mpam_devices.c
> @@ -0,0 +1,68 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (C) 2024 Arm Ltd.
> +/* This file is intended to be included into mpam_devices.c */
> +
> +#include <kunit/test.h>
> +
> +static void test_mpam_reset_msc_bitmap(struct kunit *test)
> +{
> +	char *buf = kunit_kzalloc(test, SZ_16K, GFP_KERNEL);
> +	struct mpam_msc fake_msc;
> +	u32 *test_result;
> +
> +	if (!buf)
> +		return;
> +
> +	fake_msc.mapped_hwpage = buf;
> +	fake_msc.mapped_hwpage_sz = SZ_16K;
> +	cpumask_copy(&fake_msc.accessibility, cpu_possible_mask);
> +
> +	mutex_init(&fake_msc.part_sel_lock);
> +	mutex_lock(&fake_msc.part_sel_lock);
> +
> +	test_result = (u32 *)(buf + MPAMCFG_CPBM);
> +
> +	mpam_reset_msc_bitmap(&fake_msc, MPAMCFG_CPBM, 0);
> +	KUNIT_EXPECT_EQ(test, test_result[0], 0);
> +	KUNIT_EXPECT_EQ(test, test_result[1], 0);
> +	test_result[0] = 0;
> +	test_result[1] = 0;
> +
> +	mpam_reset_msc_bitmap(&fake_msc, MPAMCFG_CPBM, 1);
> +	KUNIT_EXPECT_EQ(test, test_result[0], 1);
> +	KUNIT_EXPECT_EQ(test, test_result[1], 0);
> +	test_result[0] = 0;
> +	test_result[1] = 0;
> +
> +	mpam_reset_msc_bitmap(&fake_msc, MPAMCFG_CPBM, 16);
> +	KUNIT_EXPECT_EQ(test, test_result[0], 0xffff);
> +	KUNIT_EXPECT_EQ(test, test_result[1], 0);
> +	test_result[0] = 0;
> +	test_result[1] = 0;
> +
> +	mpam_reset_msc_bitmap(&fake_msc, MPAMCFG_CPBM, 32);
> +	KUNIT_EXPECT_EQ(test, test_result[0], 0xffffffff);
> +	KUNIT_EXPECT_EQ(test, test_result[1], 0);
> +	test_result[0] = 0;
> +	test_result[1] = 0;
> +
> +	mpam_reset_msc_bitmap(&fake_msc, MPAMCFG_CPBM, 33);
> +	KUNIT_EXPECT_EQ(test, test_result[0], 0xffffffff);
> +	KUNIT_EXPECT_EQ(test, test_result[1], 1);
> +	test_result[0] = 0;
> +	test_result[1] = 0;
> +
> +	mutex_unlock(&fake_msc.part_sel_lock);
> +}
> +
> +static struct kunit_case mpam_devices_test_cases[] = {
> +	KUNIT_CASE(test_mpam_reset_msc_bitmap),
> +	{}
> +};
> +
> +static struct kunit_suite mpam_devices_test_suite = {
> +	.name = "mpam_devices_test_suite",
> +	.test_cases = mpam_devices_test_cases,
> +};
> +
> +kunit_test_suites(&mpam_devices_test_suite);

Thanks,

Ben


