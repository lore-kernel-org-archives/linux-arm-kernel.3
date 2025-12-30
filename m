Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 776FAE94123
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 08:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l8AOMXLBKTR+COJZGGsbi068vIs7ru6iSzu/sWMLBAM=; b=0ACDDj9qOhSafHbNGY4L35LR9e
	ZGzkJk7d+VYr9otwU6a1obIkggo4f/1mkSeDPaZ9AVwFKQ+gT+XlIYKM8kK8u0lxGaueEOV7WitqL
	pWoxe9lnEdZk7VSlxfnX+FzIMm6YYiEDyvR374T8NiYmYIVxseUMdD6rwy2KROlbq2eDberpoyjdx
	4XW/4Wk1+zF3c77IRumvPSE3gSr8CR51ZQrrGd6pa/wgB4+9J2WJM+lDc+jmu4XZt9aW1urYqvU4D
	bXKjlDoDT16wR3iQXN38o7ggHnDzC6REUdrbDyyuNQEMoF4C7b420D/w/OPd54qnzjOHutT45QvZ2
	4F0aK25Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaUg3-00000004XxM-3oAj;
	Tue, 30 Dec 2025 08:01:59 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaUfu-00000004Xtk-3qa6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 08:01:54 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=l8AOMXLBKTR+COJZGGsbi068vIs7ru6iSzu/sWMLBAM=;
	b=CrIFgpa+jZ0jIeP69CPkifAfsmzI+9wp6Jki8ODy827ojLDvhnC82FmYGkLydb2oM6Oumhx94
	jQflhr/gAWUPgL5arVy+I0F4xp41jlM+OuxKFdCcLGuyHND1L0tpr00uDY7P8TIHZpcUs3yagD9
	GeTjOPsOKq3EBxq2bNGQYkc=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4dgQTT5rbjz1T4FZ;
	Tue, 30 Dec 2025 15:59:09 +0800 (CST)
Received: from kwepemf200001.china.huawei.com (unknown [7.202.181.227])
	by mail.maildlp.com (Postfix) with ESMTPS id 267F040363;
	Tue, 30 Dec 2025 16:01:40 +0800 (CST)
Received: from localhost.localdomain (10.50.163.32) by
 kwepemf200001.china.huawei.com (7.202.181.227) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 30 Dec 2025 16:01:39 +0800
From: Lifeng Zheng <zhenglifeng1@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <rafael@kernel.org>,
	<viresh.kumar@linaro.org>, <sudeep.holla@arm.com>,
	<gregkh@linuxfoundation.org>, <dakr@kernel.org>, <beata.michalska@arm.com>,
	<ionela.voinescu@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<linuxarm@huawei.com>, <jonathan.cameron@huawei.com>,
	<vincent.guittot@linaro.org>, <zhanjie9@hisilicon.com>,
	<lihuisong@huawei.com>, <yubowen8@huawei.com>, <zhangpengjie2@huawei.com>,
	<wangzhi12@huawei.com>, <linhongye@h-partners.com>, <zhenglifeng1@huawei.com>
Subject: [REPOST PATCH v6 0/3] arm64: topology: Handle AMU FIE setup on CPU hotplug
Date: Tue, 30 Dec 2025 16:01:12 +0800
Message-ID: <20251230080115.2120612-1-zhenglifeng1@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemf200001.china.huawei.com (7.202.181.227)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_000151_574871_EBE24B72 
X-CRM114-Status: GOOD (  15.84  )
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

Solve a problem that causes CPUs Setup AMU FIE failed in a corner case,
even though they're eligible.

Changelog:

v6:

 - discard the modifications in cpufreq.c, and instead, make
   supports_scale_freq_counters() checks that at least one CPU in the
   policy supports AMU FIE, instead of all
 - based on Beata's feedback, optimize cpuhp_topology_online() to make it
   more readable
 - use pr_warn instead of WARN_ON to show warning message when the
   freq_counters_valid() check fails in cpuhp_topology_online()
 - modify commit message as Beata and Rafael suggested

v5:

 - add a default implementation for cpufreq_cpu_policy() when
   CONFIG_CPU_FREQ is not defined

v4:

 - change the function's name in patch 2 from
   'cpufreq_cpu_get_raw_no_check' to 'cpufreq_cpu_policy'
 - use only one line in the function body of cpufreq_cpu_policy()
 - use cpus mask instead of related_cpus when calling arch_set_freq_scale()
   in cpufreq.c
 - add a warning when the freq_counters_valid() check fails in
   cpuhp_topology_online()

v3:

 - add a patch to optimize amu_fie_setup()
 - add a patch to add a function to get cpufreq policy without checking if
   the CPU is online
 - discard the reuse of amu_fie_setup() in cpuhp_topology_online() and keep
   all the new logic in cpuhp_topology_online()
 - test only the CPU which is going online in cpuhp_topology_online()
 - when the freq_counters_valid() check fails, not only clear the scale
   freq source but also clear all the related CPUs from amu_fie_cpus mask
 - add some comments

v2:

 - keep init_amu_fie_notifier for setting up AMU FIE when the cpufreq
   policy is being created
 - set up AMU FIE only for online CPUs instead of related_cpus in
   init_amu_fie_callback()
 - check and set all the online CPUs in the same policy when hotplug one
 - clear scale freq source for all the online CPUs in the same policy to
   avoid using different source of the freq scale

---
Discussions of previous version:
v1: https://lore.kernel.org/all/20250607094533.416368-1-zhenglifeng1@huawei.com/
v2: https://lore.kernel.org/all/20250725102813.1404322-1-zhenglifeng1@huawei.com/
v3: https://lore.kernel.org/all/20250805093330.3715444-1-zhenglifeng1@huawei.com/
v4: https://lore.kernel.org/all/20250814072853.3426386-1-zhenglifeng1@huawei.com/
v5: https://lore.kernel.org/all/20250819072931.1647431-1-zhenglifeng1@huawei.com/

Lifeng Zheng (3):
  arm64: topology: Skip already covered CPUs when setting freq source
  cpufreq: Add new helper function returning cpufreq policy
  arm64: topology: Handle AMU FIE setup on CPU hotplug

 arch/arm64/kernel/topology.c | 67 ++++++++++++++++++++++++++++++++++--
 drivers/base/arch_topology.c |  9 ++++-
 drivers/cpufreq/cpufreq.c    |  6 ++++
 include/linux/cpufreq.h      |  5 +++
 4 files changed, 83 insertions(+), 4 deletions(-)

-- 
2.33.0


