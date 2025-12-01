Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E166DD116F3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 15:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wE2L0F1qqDTs/54YDX8hKplMeTjbIJ9CHswBP1kiMkA=; b=JzMF09SDWmekSdhwQS86TZxsVv
	H0ZEnYhfwdlSue/VhkhO1trsxpJK3Jk57zMxy6Rea0QelY2ueWUykP4GWcnOk1ShyKL+ZcjQso1Bk
	I2QZDQhnNFF2Ev5bkh/biNu+AxE3ay1IGIbiDIAy7JQqZyOWswdVDaOPhx+rYukz9mgMvL8wMI+S/
	R4wwA+XQfzmfEb4GYrVicqRVRc8WleP/KCx8s6uJeA6uMGUdpbr8sEM1MrtM8MqW+7VqDwbZkwhWE
	2C8GgxW8Jrmq7JyhB+i/zPxl+VJcZjE32lj5RLqiyZrotn89IYLFE9hDAJV09DkKaoQoepHzUTC6Z
	zV4rdOLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ5oF-00000004BKY-0Ndk;
	Mon, 01 Dec 2025 15:27:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ5oC-00000004BJV-1Jfg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 15:27:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F280153B;
	Mon,  1 Dec 2025 07:27:13 -0800 (PST)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C054F3F836;
	Mon,  1 Dec 2025 07:27:14 -0800 (PST)
Date: Mon, 1 Dec 2025 16:27:12 +0100
From: Beata Michalska <beata.michalska@arm.com>
To: Lifeng Zheng <zhenglifeng1@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, rafael@kernel.org,
	viresh.kumar@linaro.org, sudeep.holla@arm.com,
	gregkh@linuxfoundation.org, dakr@kernel.org,
	ionela.voinescu@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, linuxarm@huawei.com,
	jonathan.cameron@huawei.com, vincent.guittot@linaro.org,
	zhanjie9@hisilicon.com, lihuisong@huawei.com, yubowen8@huawei.com,
	zhangpengjie2@huawei.com, wangzhi12@huawei.com,
	linhongye@h-partners.com
Subject: Re: [PATCH v6 0/3] arm64: topology: Handle AMU FIE setup on CPU
 hotplug
Message-ID: <aS2z0EURwHbbGZab@arm.com>
References: <20251119081356.2495290-1-zhenglifeng1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119081356.2495290-1-zhenglifeng1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_072724_471862_8DA1A1FB 
X-CRM114-Status: GOOD (  26.48  )
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

Hi,

Apologies for the delay in reviewing this - currently in progress....
Out of curiosity: what's the cpufreq driver used for testing this series ?

---
BR
Beata
On Wed, Nov 19, 2025 at 04:13:53PM +0800, Lifeng Zheng wrote:
> Solve a problem that causes CPUs Setup AMU FIE failed in a corner case,
> even though they're eligible.
> 
> Changelog:
> 
> v6:
> 
>  - discard the modifications in cpufreq.c, and instead, make
>    supports_scale_freq_counters() checks that at least one CPU in the
>    policy supports AMU FIE, instead of all
>  - based on Beata's feedback, optimize cpuhp_topology_online() to make it
>    more readable
>  - use pr_warn instead of WARN_ON to show warning message when the
>    freq_counters_valid() check fails in cpuhp_topology_online()
>  - modify commit message as Beata and Rafael suggested
> 
> v5:
> 
>  - add a default implementation for cpufreq_cpu_policy() when
>    CONFIG_CPU_FREQ is not defined
> 
> v4:
> 
>  - change the function's name in patch 2 from
>    'cpufreq_cpu_get_raw_no_check' to 'cpufreq_cpu_policy'
>  - use only one line in the function body of cpufreq_cpu_policy()
>  - use cpus mask instead of related_cpus when calling arch_set_freq_scale()
>    in cpufreq.c
>  - add a warning when the freq_counters_valid() check fails in
>    cpuhp_topology_online()
> 
> v3:
> 
>  - add a patch to optimize amu_fie_setup()
>  - add a patch to add a function to get cpufreq policy without checking if
>    the CPU is online
>  - discard the reuse of amu_fie_setup() in cpuhp_topology_online() and keep
>    all the new logic in cpuhp_topology_online()
>  - test only the CPU which is going online in cpuhp_topology_online()
>  - when the freq_counters_valid() check fails, not only clear the scale
>    freq source but also clear all the related CPUs from amu_fie_cpus mask
>  - add some comments
> 
> v2:
> 
>  - keep init_amu_fie_notifier for setting up AMU FIE when the cpufreq
>    policy is being created
>  - set up AMU FIE only for online CPUs instead of related_cpus in
>    init_amu_fie_callback()
>  - check and set all the online CPUs in the same policy when hotplug one
>  - clear scale freq source for all the online CPUs in the same policy to
>    avoid using different source of the freq scale
> 
> ---
> Discussions of previous version:
> v1: https://lore.kernel.org/all/20250607094533.416368-1-zhenglifeng1@huawei.com/
> v2: https://lore.kernel.org/all/20250725102813.1404322-1-zhenglifeng1@huawei.com/
> v3: https://lore.kernel.org/all/20250805093330.3715444-1-zhenglifeng1@huawei.com/
> v4: https://lore.kernel.org/all/20250814072853.3426386-1-zhenglifeng1@huawei.com/
> v5: https://lore.kernel.org/all/20250819072931.1647431-1-zhenglifeng1@huawei.com/
> 
> Lifeng Zheng (3):
>   arm64: topology: Skip already covered CPUs when setting freq source
>   cpufreq: Add new helper function returning cpufreq policy
>   arm64: topology: Handle AMU FIE setup on CPU hotplug
> 
>  arch/arm64/kernel/topology.c | 67 ++++++++++++++++++++++++++++++++++--
>  drivers/base/arch_topology.c |  9 ++++-
>  drivers/cpufreq/cpufreq.c    |  6 ++++
>  include/linux/cpufreq.h      |  5 +++
>  4 files changed, 83 insertions(+), 4 deletions(-)
> 
> -- 
> 2.33.0
> 

