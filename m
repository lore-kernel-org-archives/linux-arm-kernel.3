Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98EFC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 02:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F2z+wpsgIjye+L/TqgA2F57y2cThaXV5OWwPz6rQYxI=; b=ABLvksP9AiwJY4VsawArkHPUSt
	cnW7hnG83CVD4kUv1+xzY/gLFASes1BUGv4Gd5O9Oug10egrH8n615xUAQbRbV7FTDOSd4A/ayAQI
	6kaDA8SaJbjyicUqRTyBtOx2eyYpWXv+HjA9BJQIevR5EDU8HkfI6syNwEfQ/u6SYF14burn318vs
	MuldTeQBKlONxfWGPUNwlrhpSeL2PptUIARP/D8BdAYUk9MaeI9VFYqKSuZxtcjQV6YivNhAacPjT
	m8Nki54jr2e6elui01/9dqUEjJq1VBB+NmWU3mjP0K3gRveJyoR3voCB612yJBwPfZIzEeH+hpPzT
	rrxmVqaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqNLP-0000000Ctkf-45YH;
	Fri, 07 Mar 2025 02:21:47 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqNID-0000000Ct5T-1F1L
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 02:18:30 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Z88xF1fpwzvWrr;
	Fri,  7 Mar 2025 10:14:25 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 6DE9C140257;
	Fri,  7 Mar 2025 10:18:13 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Fri, 7 Mar 2025 10:18:12 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <akpm@linux-foundation.org>,
	<dianders@chromium.org>, <sumit.garg@linaro.org>, <kernelfans@gmail.com>,
	<lecopzer.chen@mediatek.com>, <tglx@linutronix.de>, <song@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <jonathan.cameron@huawei.com>, <zhanjie9@hisilicon.com>,
	<prime.zeng@hisilicon.com>, <yangyicong@hisilicon.com>, <linuxarm@huawei.com>
Subject: [PATCH 2/2] arm64/watchdog_hld: Add a cpufreq notifier for update watchdog thresh
Date: Fri, 7 Mar 2025 10:18:11 +0800
Message-ID: <20250307021811.46981-3-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20250307021811.46981-1-yangyicong@huawei.com>
References: <20250307021811.46981-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_181829_517252_4327B884 
X-CRM114-Status: GOOD (  12.21  )
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

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 arch/arm64/kernel/watchdog_hld.c | 34 ++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/kernel/watchdog_hld.c b/arch/arm64/kernel/watchdog_hld.c
index dcd25322127c..719ae39e8bc0 100644
--- a/arch/arm64/kernel/watchdog_hld.c
+++ b/arch/arm64/kernel/watchdog_hld.c
@@ -34,3 +34,37 @@ bool __init arch_perf_nmi_is_available(void)
 	 */
 	return arm_pmu_irq_is_nmi();
 }
+
+static int watchdog_freq_notifier_callback(struct notifier_block *nb,
+					   unsigned long val, void *data)
+{
+	struct cpufreq_policy *policy = data;
+	unsigned long max_cpu_freq;
+	u64 new_period;
+	int cpu;
+
+	if (val != CPUFREQ_CREATE_POLICY)
+		return 0;
+
+	for_each_cpu(cpu, policy->cpus) {
+		max_cpu_freq = cpufreq_get_hw_max_freq(cpu) * 1000UL;
+		if (!max_cpu_freq)
+			continue;
+
+		new_period = watchdog_thresh * max_cpu_freq;
+		hardlockup_detector_perf_adjust_period(cpu, new_period);
+	}
+
+	return 0;
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


