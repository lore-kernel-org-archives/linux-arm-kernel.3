Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E6D2E94109
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 08:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rSSgS4Owu7apQQ6F3BIp5jGRa84w3hOg76VfO/jrTmw=; b=vg/q8FEfGS9WaVU/A6mgp0Oe6k
	Rlz3urJnUpD+J41v2yLtUAAlZ100tDoTHKWwtGmSEYIJKv/oJqy/D+EBTQMhc8+OVYYNCvqVhkGiI
	UHQsYOpWmSwIrJ9wdkf8NkiP1S8nkVhUkJ4oRsjEaUraJiFjM1hdU6nK19amiGVt1oIm+m+a7kzqm
	nbUOTYkDiV5yhqBiH6eIq5SwNWfR0p+makvKSYfrSptfsU6sIXmWu98kHPEp79isdPHHM2m9iy/XT
	ZYL48Wa3VdM2L9mBrn10wPDh0EPVI0BQBozRNlBLrSvXNUIFfUjrynx1yoTq5JYwbvfamtQ3yxjX0
	GJ8bJ2zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaUg4-00000004Xxn-11IL;
	Tue, 30 Dec 2025 08:02:00 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaUfw-00000004Xtj-3Zy0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 08:01:54 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=rSSgS4Owu7apQQ6F3BIp5jGRa84w3hOg76VfO/jrTmw=;
	b=n8SuKZUhk8irlpoy7u+eoWhElMiDgO6/PbR0Z22LKXRi/+4eI/vglekMkORpqxAndxcX6Asv4
	kcquYVAypwDR5xu5iTJ932y8InLeW7jfAcsE/+mDyZZ9Dn5r0///7zkcKj0kKazy89cGqBFLgyq
	rj8UkrN2JqvmpzEVV+T4ryM=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4dgQTW653bz1T4H8;
	Tue, 30 Dec 2025 15:59:11 +0800 (CST)
Received: from kwepemf200001.china.huawei.com (unknown [7.202.181.227])
	by mail.maildlp.com (Postfix) with ESMTPS id 30EE52016A;
	Tue, 30 Dec 2025 16:01:42 +0800 (CST)
Received: from localhost.localdomain (10.50.163.32) by
 kwepemf200001.china.huawei.com (7.202.181.227) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 30 Dec 2025 16:01:41 +0800
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
Subject: [REPOST PATCH v6 3/3] arm64: topology: Handle AMU FIE setup on CPU hotplug
Date: Tue, 30 Dec 2025 16:01:15 +0800
Message-ID: <20251230080115.2120612-4-zhenglifeng1@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20251230080115.2120612-1-zhenglifeng1@huawei.com>
References: <20251230080115.2120612-1-zhenglifeng1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemf200001.china.huawei.com (7.202.181.227)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_000153_213068_D3D6A575 
X-CRM114-Status: GOOD (  19.80  )
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

Currently, when a cpufreq policy is created, the AMU FIE setup process
checks all CPUs in the policy -- including those that are offline. If any
of these CPUs are offline at that time, their AMU capability flag hasn't
been verified yet, leading the check fail. As a result, AMU FIE is not
enabled, even if the CPUs that are online do support it.

Later, when the previously offline CPUs come online and report AMU support,
there's no mechanism in place to re-enable AMU FIE for the policy. This
leaves the entire frequency domain without AMU FIE, despite being eligible.

Restrict the initial AMU FIE check to only those CPUs that are online at
the time the policy is created, and allow CPUs that come online later to
join the policy with AMU FIE enabled.

Signed-off-by: Lifeng Zheng <zhenglifeng1@huawei.com>
Acked-by: Beata Michalska <beata.michalska@arm.com>
---
 arch/arm64/kernel/topology.c | 65 ++++++++++++++++++++++++++++++++++--
 drivers/base/arch_topology.c |  9 ++++-
 2 files changed, 71 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index cf9bb761af3a..539b38935182 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -284,7 +284,7 @@ static int init_amu_fie_callback(struct notifier_block *nb, unsigned long val,
 	struct cpufreq_policy *policy = data;
 
 	if (val == CPUFREQ_CREATE_POLICY)
-		amu_fie_setup(policy->related_cpus);
+		amu_fie_setup(policy->cpus);
 
 	/*
 	 * We don't need to handle CPUFREQ_REMOVE_POLICY event as the AMU
@@ -303,10 +303,71 @@ static struct notifier_block init_amu_fie_notifier = {
 	.notifier_call = init_amu_fie_callback,
 };
 
+static int cpuhp_topology_online(unsigned int cpu)
+{
+	struct cpufreq_policy *policy = cpufreq_cpu_policy(cpu);
+
+	/* Those are cheap checks */
+
+	/*
+	 * Skip this CPU if:
+	 *  - it has no cpufreq policy assigned yet,
+	 *  - no policy exists that spans CPUs with AMU counters, or
+	 *  - it was already handled.
+	 */
+	if (unlikely(!policy) || !cpumask_available(amu_fie_cpus) ||
+	    cpumask_test_cpu(cpu, amu_fie_cpus))
+		return 0;
+
+	/*
+	 * Only proceed if all already-online CPUs in this policy
+	 * support AMU counters.
+	 */
+	if (unlikely(!cpumask_subset(policy->cpus, amu_fie_cpus)))
+		return 0;
+
+	/*
+	 * If the new online CPU cannot pass this check, all the CPUs related to
+	 * the same policy should be clear from amu_fie_cpus mask, otherwise they
+	 * may use different source of the freq scale.
+	 */
+	if (!freq_counters_valid(cpu)) {
+		pr_warn("CPU[%u] doesn't support AMU counters\n", cpu);
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
 
diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 84ec92bff642..c0ef6ea9c111 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -34,7 +34,14 @@ EXPORT_PER_CPU_SYMBOL_GPL(capacity_freq_ref);
 
 static bool supports_scale_freq_counters(const struct cpumask *cpus)
 {
-	return cpumask_subset(cpus, &scale_freq_counters_mask);
+	int i;
+
+	for_each_cpu(i, cpus) {
+		if (cpumask_test_cpu(i, &scale_freq_counters_mask))
+			return true;
+	}
+
+	return false;
 }
 
 bool topology_scale_freq_invariant(void)
-- 
2.33.0


