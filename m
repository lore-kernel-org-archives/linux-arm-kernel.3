Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC4FC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 09:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6hieiODLYZ7b4CsB0REvmBzw3P//VejMyy/40SMYsPM=; b=hrA1e3as8gSMuI4ebycqkcpOr4
	lsor690HUlzJ0XiASwZWdjvOBjck+hKD3QfcvzOky0G++uaT8kLNXnrHk2pPLvKg7zoWS/mUU9HK7
	DAvSHN7vzXqtOD2sPUuTmKtUpshR9TiRxDgycmyKFqYDSz9IfcGPQKdlhs13gq19QNzZkY6Jdtz4n
	7GDEO6cZ6zEYN/PmM8m6H8wobgfFUKXtG+YPdkUxzFYHkAs56gMk6aTCpCo2+amBfIalqvFVyiD9x
	rIAq5p2TDb4aD0DZnhZmIEi8ApnRiwTv2H7aDyvl8TSb0zqBO/n91wJjNgHTRcjWP4c/WUy3oVQID
	68gf/sAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNqFW-00000001VyC-2kQN;
	Sat, 07 Jun 2025 09:54:02 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNq7f-00000001VUY-11Km
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Jun 2025 09:45:57 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4bDtcX6GHbz27hct;
	Sat,  7 Jun 2025 17:46:36 +0800 (CST)
Received: from kwepemh100008.china.huawei.com (unknown [7.202.181.93])
	by mail.maildlp.com (Postfix) with ESMTPS id 0875718005F;
	Sat,  7 Jun 2025 17:45:45 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemh100008.china.huawei.com (7.202.181.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 7 Jun 2025 17:45:44 +0800
From: Lifeng Zheng <zhenglifeng1@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, <linuxarm@huawei.com>,
	<jonathan.cameron@huawei.com>, <viresh.kumar@linaro.org>,
	<yangyicong@hisilicon.com>, <zhanjie9@hisilicon.com>, <lihuisong@huawei.com>,
	<yubowen8@huawei.com>, <zhenglifeng1@huawei.com>
Subject: [PATCH] arm64: topology: Setup amu fie when cpu hotplugging
Date: Sat, 7 Jun 2025 17:45:33 +0800
Message-ID: <20250607094533.416368-1-zhenglifeng1@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemh100008.china.huawei.com (7.202.181.93)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_024555_587794_DD5B6683 
X-CRM114-Status: GOOD (  20.02  )
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

Amu fie was set up by a cpufreq policy notifier after the policy was
created. This caused some problems:

1. The cpus related to the same policy would all fail to set up amu fie if
one of them couldn't pass the freq_counters_valid() check.

2. The cpus fail to set up amu fie would never have a chance to set up
again.

When boot with maxcpu=1 restrict, the support amu flags of the offline cpus
would never be setup. After that, when cpufreq policy was being created,
the online cpu might set up amu fie fail because the other cpus related to
the same policy couldn't pass the freq_counters_valid() check. Hotplug the
offline cpus, since the policy was already created, amu_fie_setup() would
never be called again. All cpus couldn't setup amu fie in this situation.

After commit 1f023007f5e7 ("arm64/amu: Use capacity_ref_freq() to set AMU
ratio"), the max_freq stores in policy data is never needed when setting up
amu fie.  This indicates that the setting up of amu fie does not depend on
the policy any more. So each cpu can set up amu fie separately during
hotplug and the problems above will be solved.

Signed-off-by: Lifeng Zheng <zhenglifeng1@huawei.com>
---
 arch/arm64/kernel/topology.c | 56 ++++++++++++++----------------------
 1 file changed, 21 insertions(+), 35 deletions(-)

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index 5d07ee85bdae..207eab4fa31f 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -351,63 +351,49 @@ int arch_freq_get_on_cpu(int cpu)
 	return freq;
 }
 
-static void amu_fie_setup(const struct cpumask *cpus)
+static void amu_fie_setup(unsigned int cpu)
 {
-	int cpu;
-
-	/* We are already set since the last insmod of cpufreq driver */
 	if (cpumask_available(amu_fie_cpus) &&
-	    unlikely(cpumask_subset(cpus, amu_fie_cpus)))
+	    cpumask_test_cpu(cpu, amu_fie_cpus))
 		return;
 
-	for_each_cpu(cpu, cpus)
-		if (!freq_counters_valid(cpu))
-			return;
+	if (!freq_counters_valid(cpu))
+		return;
 
 	if (!cpumask_available(amu_fie_cpus) &&
 	    !zalloc_cpumask_var(&amu_fie_cpus, GFP_KERNEL)) {
-		WARN_ONCE(1, "Failed to allocate FIE cpumask for CPUs[%*pbl]\n",
-			  cpumask_pr_args(cpus));
+		WARN_ONCE(1, "Failed to allocate FIE cpumask for CPUs[%u]\n",
+			  cpu);
 		return;
 	}
 
-	cpumask_or(amu_fie_cpus, amu_fie_cpus, cpus);
+	cpumask_set_cpu(cpu, amu_fie_cpus);
 
 	topology_set_scale_freq_source(&amu_sfd, amu_fie_cpus);
 
-	pr_debug("CPUs[%*pbl]: counters will be used for FIE.",
-		 cpumask_pr_args(cpus));
+	pr_debug("CPUs[%u]: counters will be used for FIE.", cpu);
 }
 
-static int init_amu_fie_callback(struct notifier_block *nb, unsigned long val,
-				 void *data)
+static int cpuhp_topology_online(unsigned int cpu)
 {
-	struct cpufreq_policy *policy = data;
-
-	if (val == CPUFREQ_CREATE_POLICY)
-		amu_fie_setup(policy->related_cpus);
-
-	/*
-	 * We don't need to handle CPUFREQ_REMOVE_POLICY event as the AMU
-	 * counters don't have any dependency on cpufreq driver once we have
-	 * initialized AMU support and enabled invariance. The AMU counters will
-	 * keep on working just fine in the absence of the cpufreq driver, and
-	 * for the CPUs for which there are no counters available, the last set
-	 * value of arch_freq_scale will remain valid as that is the frequency
-	 * those CPUs are running at.
-	 */
+	amu_fie_setup(cpu);
 
 	return 0;
 }
 
-static struct notifier_block init_amu_fie_notifier = {
-	.notifier_call = init_amu_fie_callback,
-};
-
 static int __init init_amu_fie(void)
 {
-	return cpufreq_register_notifier(&init_amu_fie_notifier,
-					CPUFREQ_POLICY_NOTIFIER);
+	int ret;
+
+	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
+				"arm64/topology:online",
+				cpuhp_topology_online,
+				NULL);
+
+	if (ret < 0)
+		return ret;
+
+	return 0;
 }
 core_initcall(init_amu_fie);
 
-- 
2.33.0


