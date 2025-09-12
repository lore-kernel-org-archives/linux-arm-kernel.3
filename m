Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2654ACAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 13:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f9BhNTZby5kk8CcgndSiekMPKWBy4slQJsI63HuPpVs=; b=thnchqKl/BiskiGsc7eJRcv9d1
	f9bsoH6pbGYOpwwHCrloi8tHw1edqMTSLkaeUn3RcE+1My3UU+qsjVtNpYu3U80bL4eh+Lj1wwpM2
	9BR1m6swr/9QDIuGBLr9XTwZyvjzOvdZSIAqp9CCMhF73Ls8rTqRobcFR+Leql4qyWAFjPP7TmDi2
	/B0I9hTq4DlWmBAfFET+o28wp2bNHL8ZjhgCcUBruTqpgxlMPX/a9pQaR6/Ai2Mcn27+wPB1VM/2o
	MHWrVS0RrF21Qf7ErvSzRP+PRgFY/f2knW0HqPsR2w1+ecCRqjaK6LJqNWYbr+Y04PmnmE+UlhHOd
	RgUPRgfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux3xk-00000009bUB-0mgF;
	Fri, 12 Sep 2025 13:37:16 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux3xi-00000009bTJ-0G7U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 13:37:15 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cNb4f50qdz6M535;
	Fri, 12 Sep 2025 21:34:26 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 211D11402A4;
	Fri, 12 Sep 2025 21:37:08 +0800 (CST)
Received: from localhost (10.203.177.15) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 12 Sep
 2025 15:37:05 +0200
Date: Fri, 12 Sep 2025 14:37:04 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: James Morse <james.morse@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-acpi@vger.kernel.org>, D Scott Phillips OS
	<scott@os.amperecomputing.com>, <carl@os.amperecomputing.com>,
	<lcherian@marvell.com>, <bobo.shaobowang@huawei.com>,
	<tan.shaopeng@fujitsu.com>, <baolin.wang@linux.alibaba.com>, Jamie Iles
	<quic_jiles@quicinc.com>, Xin Hao <xhao@linux.alibaba.com>,
	<peternewman@google.com>, <dfustini@baylibre.com>, <amitsinght@marvell.com>,
	David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>, Koba
 Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
	<fenghuay@nvidia.com>, <baisheng.gao@unisoc.com>, Rob Herring
	<robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>, "Rafael Wysocki"
	<rafael@kernel.org>, Len Brown <lenb@kernel.org>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla
	<sudeep.holla@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v2 28/29] arm_mpam: Add kunit test for bitmap reset
Message-ID: <20250912143704.00001ae8@huawei.com>
In-Reply-To: <20250910204309.20751-29-james.morse@arm.com>
References: <20250910204309.20751-1-james.morse@arm.com>
	<20250910204309.20751-29-james.morse@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_063714_387977_FB535943 
X-CRM114-Status: GOOD (  25.45  )
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

On Wed, 10 Sep 2025 20:43:08 +0000
James Morse <james.morse@arm.com> wrote:

> The bitmap reset code has been a source of bugs. Add a unit test.
> 
> This currently has to be built in, as the rest of the driver is
> builtin.
> 
> Suggested-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: James Morse <james.morse@arm.com>
Few trivial comments inline.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> ---
>  drivers/resctrl/Kconfig             | 10 +++++
>  drivers/resctrl/mpam_devices.c      |  4 ++
>  drivers/resctrl/test_mpam_devices.c | 68 +++++++++++++++++++++++++++++
>  3 files changed, 82 insertions(+)
>  create mode 100644 drivers/resctrl/test_mpam_devices.c
> 
> diff --git a/drivers/resctrl/Kconfig b/drivers/resctrl/Kconfig
> index c30532a3a3a4..ef59b3057d5d 100644
> --- a/drivers/resctrl/Kconfig
> +++ b/drivers/resctrl/Kconfig
> @@ -5,10 +5,20 @@ menuconfig ARM64_MPAM_DRIVER
>  	  MPAM driver for System IP, e,g. caches and memory controllers.
>  
>  if ARM64_MPAM_DRIVER
> +
>  config ARM64_MPAM_DRIVER_DEBUG
>  	bool "Enable debug messages from the MPAM driver"
>  	depends on ARM64_MPAM_DRIVER

Doing this under an if for the same isn't useful. So if you want to do this
style I'd do it before adding this earlier config option.

>  	help
>  	  Say yes here to enable debug messages from the MPAM driver.
>  
> +config MPAM_KUNIT_TEST
> +	bool "KUnit tests for MPAM driver " if !KUNIT_ALL_TESTS
> +	depends on KUNIT=y
> +	default KUNIT_ALL_TESTS
> +	help
> +	  Enable this option to run tests in the MPAM driver.
> +
> +	  If unsure, say N.
> +
>  endif

> diff --git a/drivers/resctrl/test_mpam_devices.c b/drivers/resctrl/test_mpam_devices.c
> new file mode 100644
> index 000000000000..3e7058f7601c
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
> +	char __iomem *buf = kunit_kzalloc(test, SZ_16K, GFP_KERNEL);
> +	struct mpam_msc fake_msc = {0};

= { }; is sufficient and what newer c specs have adopted to mean
fill everything including holes in structures with 0.  There are some
tests that ensure that behavior applies with older compilers + the options
we use for building the kernel.

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

Perhaps add a comment to say this is to satisfy lock markings?
Otherwise someone might wonder why mutex_init() immediately followed
by taking the lock maskes sense.

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



