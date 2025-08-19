Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D1D1CA0EF5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 07:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g3Rk2PjjVUx7A5Of8FVvAzsw2idXr8bQrer0fXRcH0M=; b=j/O9JYCi8Hcn8QRMXbFf1ejanX
	liEAw+IxNKpjwpngAIe/5FN1eiG8JDEui1bevKEs7cjOxgykF1mLrHpZEqbZT0TMF3+aj2xqZfVz1
	ZYAUutjeGAiAAccSgVv5wPWzabtx85E298sHQrU5sxGIJUU4Xw4S5P+Q/+ZbS7/9ayYi3eLYk3CDL
	aZrA9CPgoe8Ue78Az3BFtI68KnqfFa+Z4i4hzdp8jeywxX4QbmW17558fpJtwrerg1WdvGrvpbQoE
	0l4RX/oDm4dUuLkRVUu9IWojDFZvzR0uOBl9yJylQWayVcYZ/2KL1GLmbCYL59NldojkXc4BkLljS
	Y8YUnkOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoHDy-00000009k8I-3YGA;
	Tue, 19 Aug 2025 07:57:42 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoGnI-00000009g8T-36vR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 07:30:10 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4c5h2C0TtbzdcPD;
	Tue, 19 Aug 2025 15:25:39 +0800 (CST)
Received: from kwepemh100008.china.huawei.com (unknown [7.202.181.93])
	by mail.maildlp.com (Postfix) with ESMTPS id 8E515140275;
	Tue, 19 Aug 2025 15:30:01 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemh100008.china.huawei.com (7.202.181.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 19 Aug 2025 15:30:00 +0800
From: Lifeng Zheng <zhenglifeng1@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <rafael@kernel.org>,
	<viresh.kumar@linaro.org>, <beata.michalska@arm.com>, <sudeep.holla@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linuxarm@huawei.com>,
	<jonathan.cameron@huawei.com>, <vincent.guittot@linaro.org>,
	<yangyicong@hisilicon.com>, <zhanjie9@hisilicon.com>, <lihuisong@huawei.com>,
	<yubowen8@huawei.com>, <zhangpengjie2@huawei.com>,
	<linhongye@h-partners.com>, <zhenglifeng1@huawei.com>
Subject: [PATCH v5 3/3] arm64: topology: Setup AMU FIE for online CPUs only
Date: Tue, 19 Aug 2025 15:29:31 +0800
Message-ID: <20250819072931.1647431-4-zhenglifeng1@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250819072931.1647431-1-zhenglifeng1@huawei.com>
References: <20250819072931.1647431-1-zhenglifeng1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemh100008.china.huawei.com (7.202.181.93)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_003009_082286_B71E2EEE 
X-CRM114-Status: GOOD (  22.65  )
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

When boot with maxcpu=1 restrict, and LPI(Low Power Idle States) is on,
only CPU0 will go online. The support AMU flag of CPU0 will be set but the
flags of other CPUs will not. This will cause AMU FIE set up fail for CPU0
when it shares a cpufreq policy with other CPU(s). After that, when other
CPUs are finally online and the support AMU flags of them are set, they'll
never have a chance to set up AMU FIE, even though they're eligible.

To solve this problem, the process of setting up AMU FIE needs to be
modified as follows:

1. Set up AMU FIE only for the online CPUs.

2. Try to set up AMU FIE each time a CPU goes online and do the
freq_counters_valid() check. If this check fails, clear scale freq source
of all the CPUs related to the same policy, in case they use different
source of the freq scale.

At the same time, this change also be applied to cpufreq when calling
arch_set_freq_scale.

Signed-off-by: Lifeng Zheng <zhenglifeng1@huawei.com>
---
 arch/arm64/kernel/topology.c | 54 ++++++++++++++++++++++++++++++++++--
 drivers/cpufreq/cpufreq.c    |  4 +--
 2 files changed, 54 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index 9317a618bb87..a9d9e9969cea 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -385,7 +385,7 @@ static int init_amu_fie_callback(struct notifier_block *nb, unsigned long val,
 	struct cpufreq_policy *policy = data;
 
 	if (val == CPUFREQ_CREATE_POLICY)
-		amu_fie_setup(policy->related_cpus);
+		amu_fie_setup(policy->cpus);
 
 	/*
 	 * We don't need to handle CPUFREQ_REMOVE_POLICY event as the AMU
@@ -404,10 +404,60 @@ static struct notifier_block init_amu_fie_notifier = {
 	.notifier_call = init_amu_fie_callback,
 };
 
+static int cpuhp_topology_online(unsigned int cpu)
+{
+	struct cpufreq_policy *policy = cpufreq_cpu_policy(cpu);
+
+	/*
+	 * If the online CPUs are not all AMU FIE CPUs or the new one is already
+	 * an AMU FIE one, no need to set it.
+	 */
+	if (!policy || !cpumask_available(amu_fie_cpus) ||
+	    !cpumask_subset(policy->cpus, amu_fie_cpus) ||
+	    cpumask_test_cpu(cpu, amu_fie_cpus))
+		return 0;
+
+	/*
+	 * If the new online CPU cannot pass this check, all the CPUs related to
+	 * the same policy should be clear from amu_fie_cpus mask, otherwise they
+	 * may use different source of the freq scale.
+	 */
+	if (WARN_ON(!freq_counters_valid(cpu))) {
+		topology_clear_scale_freq_source(SCALE_FREQ_SOURCE_ARCH,
+						 policy->related_cpus);
+		cpumask_andnot(amu_fie_cpus, amu_fie_cpus, policy->related_cpus);
+		return 0;
+	}
+
+	cpumask_set_cpu(cpu, amu_fie_cpus);
+
+	topology_set_scale_freq_source(&amu_sfd, cpumask_of(cpu));
+
+	pr_debug("CPU[%u]: counter will be used for FIE.", cpu);
+
+	return 0;
+}
+
 static int __init init_amu_fie(void)
 {
-	return cpufreq_register_notifier(&init_amu_fie_notifier,
+	int ret;
+
+	ret = cpufreq_register_notifier(&init_amu_fie_notifier,
 					CPUFREQ_POLICY_NOTIFIER);
+	if (ret)
+		return ret;
+
+	ret = cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN,
+					"arm64/topology:online",
+					cpuhp_topology_online,
+					NULL);
+	if (ret < 0) {
+		cpufreq_unregister_notifier(&init_amu_fie_notifier,
+					    CPUFREQ_POLICY_NOTIFIER);
+		return ret;
+	}
+
+	return 0;
 }
 core_initcall(init_amu_fie);
 
diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 78ca68ea754d..d1890a2af1af 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -417,7 +417,7 @@ void cpufreq_freq_transition_end(struct cpufreq_policy *policy,
 
 	cpufreq_notify_post_transition(policy, freqs, transition_failed);
 
-	arch_set_freq_scale(policy->related_cpus,
+	arch_set_freq_scale(policy->cpus,
 			    policy->cur,
 			    arch_scale_freq_ref(policy->cpu));
 
@@ -2219,7 +2219,7 @@ unsigned int cpufreq_driver_fast_switch(struct cpufreq_policy *policy,
 		return 0;
 
 	policy->cur = freq;
-	arch_set_freq_scale(policy->related_cpus, freq,
+	arch_set_freq_scale(policy->cpus, freq,
 			    arch_scale_freq_ref(policy->cpu));
 	cpufreq_stats_record_transition(policy, freq);
 
-- 
2.33.0


