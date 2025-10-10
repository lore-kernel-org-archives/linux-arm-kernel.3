Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF2ECCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 16:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VS/Dr0r/1p0bZzBEpIQMeQTi+b0Z3/SO9OIyIqiLriw=; b=ZH3yhqmP7S6X0DiKU0X0LW82n8
	c9saB/efgX9sK4Aueo1ltAUMrOl5oFfKFmugPeSEcjuygdJwiQGqBHzpNRKnbT1aIBkebuHdp2pPx
	R+eRMmg2HR84gCsgNDeeNHUfQE3XW8RTSdq7M7ntpcQZYvEkwrjUS+bB71lVtmDXPX2qhZGuiSRuO
	WXAe/oc1Krr48kH9WFlDjCMh5DSa3FndzKe0d+9UQX+GfbtqFHhahardwVfIDydzE4VnMIzaFkxRp
	eUBEFp5lTMn3GRdS0uQM9FCzBctt5Qo89KCaiQrLTXxjv6Dt8RFimnr6uA5TNoV9ToX4JlRPKyLCt
	KQnEAW/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7GNR-0000000905Z-3yER;
	Fri, 10 Oct 2025 16:53:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7GNQ-0000000904v-2mmw
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Oct 2025 16:53:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=VS/Dr0r/1p0bZzBEpIQMeQTi+b0Z3/SO9OIyIqiLriw=; b=QZMUxlshCxg+xSsbiO30MrJ04J
	hB3i9QjfiC8ks+fvm4eza9VjaBttjF7MFFpM2/HeQqfZ0sf3/mAzwmJQnTAvl4JmqvJprNrkRH/+s
	8qLbutSzIs2WQTV/0ij+8FjVS9k8GTyt8AYkkL+lIUA3GewUQxccUOjp5bXrqg0uG9AHl4aO8gRCu
	iwqy2y11tYJiPYRnyNOyC5Mw8ZquYSrke0MqzpDVZV6Ti7Nfd8dyKbPLV2J5kkGV7UWvVwp4qNR5X
	5L3ANTCHr3lYzSH0LyF9+M2z+dHcO+Zntlbx9zoM5ou/6TTnrjFpTxGOq0r+vu28PMTwOdRVdBfhZ
	6M0633JQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7GNN-00000002J4V-1reM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 16:53:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 86652153B;
	Fri, 10 Oct 2025 09:53:44 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D82983F66E;
	Fri, 10 Oct 2025 09:53:46 -0700 (PDT)
Message-ID: <73967f49-f276-404e-afd2-259f3319dfdb@arm.com>
Date: Fri, 10 Oct 2025 17:53:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 28/29] arm_mpam: Add kunit test for bitmap reset
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-acpi@vger.kernel.org,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com, Rob Herring <robh@kernel.org>,
 Rohit Mathew <rohit.mathew@arm.com>, Rafael Wysocki <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250910204309.20751-1-james.morse@arm.com>
 <20250910204309.20751-29-james.morse@arm.com>
 <20250912143704.00001ae8@huawei.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20250912143704.00001ae8@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_175353_877277_F99EC4AD 
X-CRM114-Status: GOOD (  24.36  )
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

Hi Jonathan,

On 12/09/2025 14:37, Jonathan Cameron wrote:
> On Wed, 10 Sep 2025 20:43:08 +0000
> James Morse <james.morse@arm.com> wrote:
> 
>> The bitmap reset code has been a source of bugs. Add a unit test.
>>
>> This currently has to be built in, as the rest of the driver is
>> builtin.
>>
>> Suggested-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>> Signed-off-by: James Morse <james.morse@arm.com>


> Few trivial comments inline.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

Thanks!


>> diff --git a/drivers/resctrl/Kconfig b/drivers/resctrl/Kconfig
>> index c30532a3a3a4..ef59b3057d5d 100644
>> --- a/drivers/resctrl/Kconfig
>> +++ b/drivers/resctrl/Kconfig
>> @@ -5,10 +5,20 @@ menuconfig ARM64_MPAM_DRIVER
>>  	  MPAM driver for System IP, e,g. caches and memory controllers.
>>  
>>  if ARM64_MPAM_DRIVER
>> +
>>  config ARM64_MPAM_DRIVER_DEBUG
>>  	bool "Enable debug messages from the MPAM driver"
>>  	depends on ARM64_MPAM_DRIVER
> 
> Doing this under an if for the same isn't useful. So if you want to do this
> style I'd do it before adding this earlier config option.

Yup, you pointed at the this same shape of bug earlier in the series.


>>  	help
>>  	  Say yes here to enable debug messages from the MPAM driver.
>>  
>> +config MPAM_KUNIT_TEST
>> +	bool "KUnit tests for MPAM driver " if !KUNIT_ALL_TESTS
>> +	depends on KUNIT=y
>> +	default KUNIT_ALL_TESTS
>> +	help
>> +	  Enable this option to run tests in the MPAM driver.
>> +
>> +	  If unsure, say N.
>> +
>>  endif
> 
>> diff --git a/drivers/resctrl/test_mpam_devices.c b/drivers/resctrl/test_mpam_devices.c
>> new file mode 100644
>> index 000000000000..3e7058f7601c
>> --- /dev/null
>> +++ b/drivers/resctrl/test_mpam_devices.c
>> @@ -0,0 +1,68 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +// Copyright (C) 2024 Arm Ltd.
>> +/* This file is intended to be included into mpam_devices.c */
>> +
>> +#include <kunit/test.h>
>> +
>> +static void test_mpam_reset_msc_bitmap(struct kunit *test)
>> +{
>> +	char __iomem *buf = kunit_kzalloc(test, SZ_16K, GFP_KERNEL);
>> +	struct mpam_msc fake_msc = {0};
> 
> = { }; is sufficient and what newer c specs have adopted to mean
> fill everything including holes in structures with 0.  There are some
> tests that ensure that behavior applies with older compilers + the options
> we use for building the kernel.

Muscle memory is difficult to overcome ... I've fixed this one, and will keep an eye out
for more.


>> +	u32 *test_result;
>> +
>> +	if (!buf)
>> +		return;
>> +
>> +	fake_msc.mapped_hwpage = buf;
>> +	fake_msc.mapped_hwpage_sz = SZ_16K;
>> +	cpumask_copy(&fake_msc.accessibility, cpu_possible_mask);
>> +
>> +	mutex_init(&fake_msc.part_sel_lock);
>> +	mutex_lock(&fake_msc.part_sel_lock);

> Perhaps add a comment to say this is to satisfy lock markings?
> Otherwise someone might wonder why mutex_init() immediately followed
> by taking the lock maskes sense.

Makes sense, Done.

>> +
>> +	test_result = (u32 *)(buf + MPAMCFG_CPBM);


Thanks,

James

