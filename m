Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 853A7C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 08:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OeUih3fq78i2HkbmlN4KvVKujJ5HzmiUWAXiQDApboQ=; b=zz+S/a2TuU7GUFYbNpmzBzqp8b
	3/Px/rnX/u67czpbpXhyxKT3okdYaqXhO5D8MQAwx0N2hU/8yNv7FojTs2XQVwjy5faAQaS4myTA+
	2uxETBs8qKzFHixnIgC1/LPuj10V+17jcF3H4gV+ki3N9NBxyBTFFP/YTqbkmzN5iRK2aYbbIk8MW
	g/2WY7uIsUhlNJGvSvO4nZOsht6llH2YGZoxihbHTZroeNhvLumLG7rRzmDQyUmCo/4l1Nf2A3pXq
	sDWNRO8PsnG7ws3TsmOJOHnjesZXcy3YIWFsvsbfnDoPb9MHUD+V4yct6hm5473dm7+Ysg8xPPZFx
	Da11TNMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta9vA-00000007Iqj-1fG2;
	Tue, 21 Jan 2025 08:47:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta9sf-00000007INn-20Og
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 08:45:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 715A31516;
	Tue, 21 Jan 2025 00:45:33 -0800 (PST)
Received: from e125905.cambridge.arm.com (e125905.cambridge.arm.com [10.1.194.73])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A53293F66E;
	Tue, 21 Jan 2025 00:45:02 -0800 (PST)
From: Beata Michalska <beata.michalska@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	ionela.voinescu@arm.com,
	sudeep.holla@arm.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	rafael@kernel.org,
	viresh.kumar@linaro.org
Cc: sumitg@nvidia.com,
	yang@os.amperecomputing.com,
	vanshikonda@os.amperecomputing.com,
	lihuisong@huawei.com,
	zhanjie9@hisilicon.com
Subject: [PATCH v9 1/5] cpufreq: Allow arch_freq_get_on_cpu to return an error
Date: Tue, 21 Jan 2025 08:44:31 +0000
Message-Id: <20250121084435.2839280-2-beata.michalska@arm.com>
In-Reply-To: <20250121084435.2839280-1-beata.michalska@arm.com>
References: <20250121084435.2839280-1-beata.michalska@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_004505_607834_E3AEE603 
X-CRM114-Status: GOOD (  12.79  )
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

Allow arch_freq_get_on_cpu to return an error for cases when retrieving
current CPU frequency is not possible, whether that being due to lack of
required arch support or due to other circumstances when the current
frequency cannot be determined at given point of time.

Signed-off-by: Beata Michalska <beata.michalska@arm.com>
---
 arch/x86/kernel/cpu/aperfmperf.c | 2 +-
 arch/x86/kernel/cpu/proc.c       | 7 +++++--
 drivers/cpufreq/cpufreq.c        | 8 ++++----
 include/linux/cpufreq.h          | 2 +-
 4 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kernel/cpu/aperfmperf.c b/arch/x86/kernel/cpu/aperfmperf.c
index f642de2ebdac..6cf31a1649c4 100644
--- a/arch/x86/kernel/cpu/aperfmperf.c
+++ b/arch/x86/kernel/cpu/aperfmperf.c
@@ -498,7 +498,7 @@ void arch_scale_freq_tick(void)
  */
 #define MAX_SAMPLE_AGE	((unsigned long)HZ / 50)
 
-unsigned int arch_freq_get_on_cpu(int cpu)
+int arch_freq_get_on_cpu(int cpu)
 {
 	struct aperfmperf *s = per_cpu_ptr(&cpu_samples, cpu);
 	unsigned int seq, freq;
diff --git a/arch/x86/kernel/cpu/proc.c b/arch/x86/kernel/cpu/proc.c
index 41ed01f46bd9..d79f5845a463 100644
--- a/arch/x86/kernel/cpu/proc.c
+++ b/arch/x86/kernel/cpu/proc.c
@@ -86,9 +86,12 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 		seq_printf(m, "microcode\t: 0x%x\n", c->microcode);
 
 	if (cpu_has(c, X86_FEATURE_TSC)) {
-		unsigned int freq = arch_freq_get_on_cpu(cpu);
+		int freq = arch_freq_get_on_cpu(cpu);
 
-		seq_printf(m, "cpu MHz\t\t: %u.%03u\n", freq / 1000, (freq % 1000));
+		if (freq <= 0)
+			seq_puts(m, "cpu MHz\t\t: Unknown\n");
+		else
+			seq_printf(m, "cpu MHz\t\t: %u.%03u\n", freq / 1000, (freq % 1000));
 	}
 
 	/* Cache size */
diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 418236fef172..6f45684483c4 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -728,18 +728,18 @@ show_one(cpuinfo_transition_latency, cpuinfo.transition_latency);
 show_one(scaling_min_freq, min);
 show_one(scaling_max_freq, max);
 
-__weak unsigned int arch_freq_get_on_cpu(int cpu)
+__weak int arch_freq_get_on_cpu(int cpu)
 {
-	return 0;
+	return -EOPNOTSUPP;
 }
 
 static ssize_t show_scaling_cur_freq(struct cpufreq_policy *policy, char *buf)
 {
 	ssize_t ret;
-	unsigned int freq;
+	int freq;
 
 	freq = arch_freq_get_on_cpu(policy->cpu);
-	if (freq)
+	if (freq > 0)
 		ret = sysfs_emit(buf, "%u\n", freq);
 	else if (cpufreq_driver->setpolicy && cpufreq_driver->get)
 		ret = sysfs_emit(buf, "%u\n", cpufreq_driver->get(policy->cpu));
diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
index 7fe0981a7e46..02fd4746231d 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -1184,7 +1184,7 @@ static inline int of_perf_domain_get_sharing_cpumask(int pcpu, const char *list_
 }
 #endif
 
-extern unsigned int arch_freq_get_on_cpu(int cpu);
+extern int arch_freq_get_on_cpu(int cpu);
 
 #ifndef arch_set_freq_scale
 static __always_inline
-- 
2.25.1


