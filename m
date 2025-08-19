Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9248CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 07:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wVThYEJToIu4KX9485LEjLvFLRQqRFMTOr3dEJjNELU=; b=Fbry3bwmfdajPMsk6MeqxFzl4k
	ShnIJmt6cQpA2ZosZjbHqsXkEeSYpWrSecDX2HvDb+mo3q6TMkQvu9MQjyuVelZg4oSBxv0HJeyap
	LJL7dRTTRJEvTteLSJ/sMQTBHSBk83Af9T/mbwBhIEuUqkp5pEK6UQBDmrcGkGM1kqawnFM0S6KS+
	5OddZcQ41SV86LNHZTcXtsB1Whrhmq3BKEhmlWVi4HAU4mg/GdVeWDCnZePv55EyNBYFwLQEZVNyO
	irqKQ0fEwm4kMbxk/YE+5o+mxHobUvQG2z7yXXi6C63DCeuMBasdODeH8qUbN+NUXN8+SEx4dtWpm
	9Af91i4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoHBN-00000009jjC-3m5K;
	Tue, 19 Aug 2025 07:55:01 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoGnH-00000009g7q-0HC1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 07:30:09 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4c5h390yk0z13NF3;
	Tue, 19 Aug 2025 15:26:29 +0800 (CST)
Received: from kwepemh100008.china.huawei.com (unknown [7.202.181.93])
	by mail.maildlp.com (Postfix) with ESMTPS id F1917140158;
	Tue, 19 Aug 2025 15:30:00 +0800 (CST)
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
Subject: [PATCH v5 2/3] cpufreq: Add a new function to get cpufreq policy without checking if the CPU is online
Date: Tue, 19 Aug 2025 15:29:30 +0800
Message-ID: <20250819072931.1647431-3-zhenglifeng1@huawei.com>
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
X-CRM114-CacheID: sfid-20250819_003007_358380_5678E266 
X-CRM114-Status: GOOD (  13.30  )
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

cpufreq_cpu_get_raw() gets cpufreq policy only if the CPU is in
policy->cpus mask, which means the CPU is already online. But in some
cases, the policy is needed before the CPU is added to cpus mask. Add a
function to get the policy in these cases.

Signed-off-by: Lifeng Zheng <zhenglifeng1@huawei.com>
---
 drivers/cpufreq/cpufreq.c | 6 ++++++
 include/linux/cpufreq.h   | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index fc7eace8b65b..78ca68ea754d 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -198,6 +198,12 @@ struct cpufreq_policy *cpufreq_cpu_get_raw(unsigned int cpu)
 }
 EXPORT_SYMBOL_GPL(cpufreq_cpu_get_raw);
 
+struct cpufreq_policy *cpufreq_cpu_policy(unsigned int cpu)
+{
+	return per_cpu(cpufreq_cpu_data, cpu);
+}
+EXPORT_SYMBOL_GPL(cpufreq_cpu_policy);
+
 unsigned int cpufreq_generic_get(unsigned int cpu)
 {
 	struct cpufreq_policy *policy = cpufreq_cpu_get_raw(cpu);
diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
index 95f3807c8c55..26b3c3310d5b 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -205,6 +205,7 @@ struct cpufreq_freqs {
 
 #ifdef CONFIG_CPU_FREQ
 struct cpufreq_policy *cpufreq_cpu_get_raw(unsigned int cpu);
+struct cpufreq_policy *cpufreq_cpu_policy(unsigned int cpu);
 struct cpufreq_policy *cpufreq_cpu_get(unsigned int cpu);
 void cpufreq_cpu_put(struct cpufreq_policy *policy);
 #else
@@ -212,6 +213,10 @@ static inline struct cpufreq_policy *cpufreq_cpu_get_raw(unsigned int cpu)
 {
 	return NULL;
 }
+static inline struct cpufreq_policy *cpufreq_cpu_policy(unsigned int cpu)
+{
+	return NULL;
+}
 static inline struct cpufreq_policy *cpufreq_cpu_get(unsigned int cpu)
 {
 	return NULL;
-- 
2.33.0


