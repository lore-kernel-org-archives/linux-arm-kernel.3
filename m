Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67DC9C55162
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 02:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fAPBCp9FR778ZTuSpihUmMNNr9+4b13ll3YQNWIHQmU=; b=k2sU4VpCtAwRtsVxNYCJzbusHZ
	Ain6h0IeacuzLNZcwm8Ar3PHggH5CUA3XNDkvYWAb1dcpnGg/7ql2zvoT1cDWmkYyNr1f9EMVk0zG
	JLd8LVtSJV2SNlC7bofC/T8JpHE9ol/VH7ZKdix17AF6alTXeTMWRsYCMG6/JlvYy0wRqsIqG7cBt
	ZO67ddjtsBb8KITO4rJRGuGPwp9AbVbEq+HnR6InpTGyW92BU7A7zQ5Xmd75jgYpPrdAa/xGNPqrb
	zRWhjIHNG6l1EYDbLrUGxMAUzsq9HKi4qygwg70+E1dt5IPPzLt4PMSeAk4XQHzEehgFdHpnUr2Hc
	F6wpGPfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpdOY-0000000BeMS-3VCO;
	Fri, 31 Jul 2026 02:54:46 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpdOS-0000000BeM1-19wj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 02:54:44 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=fAPBCp9FR778ZTuSpihUmMNNr9+4b13ll3YQNWIHQmU=;
	b=mJ7JrHNLj1X0pIlbHgb1iKInwiz6CXFUCdv/Rs46fwijRaWEx769YicaFiEfg6PLFITGJLcV3
	ZR3SvTNZE0haDj93xmUbZcgNs3+wUmqzl4aUGhUvnxyUwbotes3mPXk3eBQZtJCixS7NKArwT/N
	n5+xlnBz+2D/NUfVXJ5XU0Y=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4hB9QT3WHSzcb0T;
	Fri, 31 Jul 2026 10:44:49 +0800 (CST)
Received: from whupemo500002.china.huawei.com (unknown [7.152.185.250])
	by mail.maildlp.com (Postfix) with ESMTPS id 367124057D;
	Fri, 31 Jul 2026 10:54:34 +0800 (CST)
Received: from [10.67.120.139] (10.67.120.139) by
 whupemo500002.china.huawei.com (7.152.185.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 31 Jul 2026 10:54:32 +0800
Message-ID: <76a26d68-436c-4fe1-a29c-287e35bb504f@huawei.com>
Date: Fri, 31 Jul 2026 10:54:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drivers/perf: hisi: Consolidate uncore PMU cpuhp
 states
To: Robin Murphy <robin.murphy@arm.com>
CC: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<u.kleine-koenig@baylibre.com>, <linuxarm@huawei.com>,
	<liuyonglong@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangzhou1@hisilicon.com>, <wuyifan50@huawei.com>
References: <20260724025238.3411328-1-wangyushan12@huawei.com>
 <20260724025238.3411328-2-wangyushan12@huawei.com>
 <18bd7977-c0d2-47c0-aaa4-a787ef935597@arm.com>
Content-Language: en-US
From: Yushan Wang <wangyushan12@huawei.com>
In-Reply-To: <18bd7977-c0d2-47c0-aaa4-a787ef935597@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.120.139]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 whupemo500002.china.huawei.com (7.152.185.250)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_195441_945104_05CB88DF 
X-CRM114-Status: GOOD (  10.10  )
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



On 7/27/2026 8:41 PM, Robin Murphy wrote:
> On 24/07/2026 3:52 am, Yushan Wang wrote:
>> Every HiSilicon uncore PMU driver allocates its own static cpuhp state
>> even though they all register identical online/offline callbacks. This
>> wastes slots in the cpuhp state enum and needlessly fragments the
>> hotplug state space.
>>
>> Move the cpuhp state setup into the shared hisi_uncore_pmu framework:
>> register a single dynamic state (CPUHP_AP_ONLINE_DYN) at framework
>> module init and export it for all HiSilicon uncore PMU drivers to use.
>> Drop the now-unused static CPUHP_AP_PERF_ARM_HISI_* entries from
>> include/linux/cpuhotplug.h.
>>
>> The L3C PMU driver keeps a private dynamic state because it has its own
>> hotplug callbacks for migrating multiple per-CPU interrupt affinities,
>> but switches from its former static slot to CPUHP_AP_ONLINE_DYN for
>> consistency.
>>
>> No intended functional changes.
>>
>> Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
>> ---
>>   drivers/perf/hisilicon/hisi_uncore_cpa_pmu.c  | 34 +++---------------
>>   drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c | 34 +++---------------
>>   drivers/perf/hisilicon/hisi_uncore_hha_pmu.c  | 34 +++---------------
>>   drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c  | 21 +++++------
>>   drivers/perf/hisilicon/hisi_uncore_mn_pmu.c   | 35 ++----------------
>>   drivers/perf/hisilicon/hisi_uncore_noc_pmu.c  | 35 ++----------------
>>   drivers/perf/hisilicon/hisi_uncore_pa_pmu.c   | 34 +++---------------
>>   drivers/perf/hisilicon/hisi_uncore_pmu.c      | 25 +++++++++++++
>>   drivers/perf/hisilicon/hisi_uncore_pmu.h      |  2 ++
>>   drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c | 34 +++---------------
>>   drivers/perf/hisilicon/hisi_uncore_uc_pmu.c   | 36 ++-----------------
>>   include/linux/cpuhotplug.h                    |  6 ----
>>   12 files changed, 67 insertions(+), 263 deletions(-)
>
> Neat! Seems like a pretty nice win already, plus it only makes a conversion easier if my generic hotplug idea takes off :)
>
> Reviewed-by: Robin Murphy <robin.murphy@arm.com> 
>
Thanks for review, hisi pmu drivers can be the first users for it ;)


