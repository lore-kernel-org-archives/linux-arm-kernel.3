Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 005DEC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 11:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vzyQwMmHFKPU0J5ipXol3BAgeI6HdrbHdrTx6lUyXBY=; b=v1T8/dfbq4OXUglmpcJa9g0n+o
	WDhZi3RBxagS7xhtdeOx4HTShthPyCYyoB7LMjwFsZahrA0Pyd3kh3KkypQD7nbsyQkWi0XEiizvB
	nFzNbAe8O35swQeqC2bSQHrQc9js1A+DiGYqvaNrvCRJaJJZcbVph0CttsKH6c2/0EeF1/WR+C4cY
	gF1pXbx/GPaaYitUAbJBDuogi4OY/dl6kTDHvCxv+MKgorzW7J0Z18w+Um+DPiGLLQRkK8v3eU/sj
	qJSBLco287dVL4YIvTwRRmiiiJ6ZaBiiSlpk0H4Edu9EiTon1PWyM+eF4kz/vbjkvcrRRYwO/EEvd
	UAy4LDJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWYtb-00000004qDl-31EV;
	Tue, 01 Jul 2025 11:11:27 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWYl3-00000004p3y-15ts
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 11:02:39 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4bWgB64WFlz27hYr;
	Tue,  1 Jul 2025 19:03:26 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 5E5A218001B;
	Tue,  1 Jul 2025 19:02:30 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 1 Jul 2025 19:02:30 +0800
Received: from localhost.localdomain (10.50.165.33) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 1 Jul 2025 19:02:29 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <akpm@linux-foundation.org>,
	<dianders@chromium.org>, <kernelfans@gmail.com>, <tglx@linutronix.de>,
	<song@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <jonathan.cameron@huawei.com>, <zhanjie9@hisilicon.com>,
	<prime.zeng@hisilicon.com>, <yangyicong@hisilicon.com>, <linuxarm@huawei.com>
Subject: [PATCH v3 2/2] arm64/watchdog_hld: Add a cpufreq notifier for update watchdog thresh
Date: Tue, 1 Jul 2025 19:02:14 +0800
Message-ID: <20250701110214.27242-3-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20250701110214.27242-1-yangyicong@huawei.com>
References: <20250701110214.27242-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_040237_602724_FBE351C1 
X-CRM114-Status: GOOD (  13.24  )
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

From: Yicong Yang <yangyicong@hisilicon.com>

arm64 depends on the cpufreq driver to gain the maximum cpu frequency
to convert the watchdog_thresh to perf event period. cpufreq drivers
like cppc_cpufreq will be initialized lately after the initializing of
the hard lockup detector so just use a safe cpufreq which will be
inaccurency. Use a cpufreq notifier to adjust the event's period to
a more accurate one.

Reviewed-by: Jie Zhan <zhanjie9@hisilicon.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 arch/arm64/kernel/watchdog_hld.c | 58 ++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/kernel/watchdog_hld.c b/arch/arm64/kernel/watchdog_hld.c
index dcd25322127c..3093037dcb7b 100644
--- a/arch/arm64/kernel/watchdog_hld.c
+++ b/arch/arm64/kernel/watchdog_hld.c
@@ -34,3 +34,61 @@ bool __init arch_perf_nmi_is_available(void)
 	 */
 	return arm_pmu_irq_is_nmi();
 }
+
+static int watchdog_perf_update_period(void *data)
+{
+	int cpu = smp_processor_id();
+	u64 max_cpu_freq, new_period;
+
+	max_cpu_freq = cpufreq_get_hw_max_freq(cpu) * 1000UL;
+	if (!max_cpu_freq)
+		return 0;
+
+	new_period = watchdog_thresh * max_cpu_freq;
+	hardlockup_detector_perf_adjust_period(new_period);
+
+	return 0;
+}
+
+static int watchdog_freq_notifier_callback(struct notifier_block *nb,
+					   unsigned long val, void *data)
+{
+	struct cpufreq_policy *policy = data;
+	int cpu;
+
+	if (val != CPUFREQ_CREATE_POLICY)
+		return NOTIFY_DONE;
+
+	/*
+	 * Let each online CPU related to the policy update the period by their
+	 * own. This will serialize with the framework on start/stop the lockup
+	 * detector (softlockup_{start,stop}_all) and avoid potential race
+	 * condition. Otherwise we may have below theoretical race condition:
+	 * (core 0/1 share the same policy)
+	 * [core 0]                      [core 1]
+	 *                               hardlockup_detector_event_create()
+	 *                                 hw_nmi_get_sample_period()
+	 * (cpufreq registered, notifier callback invoked)
+	 * watchdog_freq_notifier_callback()
+	 *   watchdog_perf_update_period()
+	 *   (since core 1's event's not yet created,
+	 *    the period is not set)
+	 *                                 perf_event_create_kernel_counter()
+	 *                                 (event's period is SAFE_MAX_CPU_FREQ)
+	 */
+	for_each_cpu(cpu, policy->cpus)
+		smp_call_on_cpu(cpu, watchdog_perf_update_period, NULL, false);
+
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block watchdog_freq_notifier = {
+	.notifier_call = watchdog_freq_notifier_callback,
+};
+
+static int __init init_watchdog_freq_notifier(void)
+{
+	return cpufreq_register_notifier(&watchdog_freq_notifier,
+					 CPUFREQ_POLICY_NOTIFIER);
+}
+core_initcall(init_watchdog_freq_notifier);
-- 
2.24.0


