Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BBF6CF2597
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 08:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G2Tew672xzwmHmfuBDCTrLoPGEDsWVGzCnadqS/wQeM=; b=YbcwCFedpmc2PjZXWkpbAGxMLR
	mOSzeoWnC/jFAUVZYcsf9KCkj4kdUjhZ5RjQsE6eyu6cvEgoZt9zhJwTwSGPLO8+wFu1EcICFfFqN
	12KuSW3UqCG2RKQuvunTCjL/Hi6T5j9Of4OR6CM+QSant3J7D0Nsa9Z+vcm+US7y+4YTt01MZcCaf
	TvWdZfxsTlhKm5cbUINCoko7gpWrDTghHFIexooaxz8SZl73sTG+zQi/L4RLjCZzjl3FL8AkcwmJv
	qH8haQM0GFpsYNyb3y/3VSI86M5PuR44S7hVwqIEl84/u5aTQEHFUWkMPBGxm2JP30N0H4N0G1jCN
	WTJM+HQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLdKY-00000002m5g-3g6W;
	Wed, 19 Nov 2025 08:14:22 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLdKQ-00000002m2T-405A
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 08:14:17 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=G2Tew672xzwmHmfuBDCTrLoPGEDsWVGzCnadqS/wQeM=;
	b=GRliNU/U/UYogEXhJthx6dgNE4xwNCKqgkvK8p6/CN2ygN/mMV2FxOuYmQ6bjLFf96voDiqqS
	GH935jo/GYezWwKFadaRziFizOlYKXDHmhI0csviBNR0cEaPmMRiJvnl8X6XCyPT3cB+GFZ4Z6K
	MmMtw4a5KwT7VJhe0oalaSg=
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4dBDjh2WXHzRhSq;
	Wed, 19 Nov 2025 16:12:24 +0800 (CST)
Received: from kwepemf200001.china.huawei.com (unknown [7.202.181.227])
	by mail.maildlp.com (Postfix) with ESMTPS id B20471402CD;
	Wed, 19 Nov 2025 16:14:07 +0800 (CST)
Received: from localhost.localdomain (10.50.163.32) by
 kwepemf200001.china.huawei.com (7.202.181.227) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 19 Nov 2025 16:14:06 +0800
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
Subject: [PATCH v6 2/3] cpufreq: Add new helper function returning cpufreq policy
Date: Wed, 19 Nov 2025 16:13:55 +0800
Message-ID: <20251119081356.2495290-3-zhenglifeng1@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20251119081356.2495290-1-zhenglifeng1@huawei.com>
References: <20251119081356.2495290-1-zhenglifeng1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemf200001.china.huawei.com (7.202.181.227)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_001415_505623_DDCB3CCD 
X-CRM114-Status: GOOD (  12.51  )
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
Reviewed-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
Reviewed-by: Jie Zhan <zhanjie9@hisilicon.com>
---
 drivers/cpufreq/cpufreq.c | 6 ++++++
 include/linux/cpufreq.h   | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 852e024facc3..e8d7544b77b8 100644
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
index 0465d1e6f72a..cc894fc38971 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -203,6 +203,7 @@ struct cpufreq_freqs {
 
 #ifdef CONFIG_CPU_FREQ
 struct cpufreq_policy *cpufreq_cpu_get_raw(unsigned int cpu);
+struct cpufreq_policy *cpufreq_cpu_policy(unsigned int cpu);
 struct cpufreq_policy *cpufreq_cpu_get(unsigned int cpu);
 void cpufreq_cpu_put(struct cpufreq_policy *policy);
 #else
@@ -210,6 +211,10 @@ static inline struct cpufreq_policy *cpufreq_cpu_get_raw(unsigned int cpu)
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


