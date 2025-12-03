Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF0BD12694
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 03:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8YjpO+5i0DNjenuXAf+0P8fnvPmHh9//Ux2KgtrwVsY=; b=Vafce2dwSYTPX74HW0sKGf8q2B
	UA13UgFw84Dp7WFTd5dnuDn8wW45P8h6ZibjGvZ93YUaKKuB2NXYk95x5bzHggEzgBPAukREHqIao
	25l9Noll4jSB9aaWgpE1R5aqDR+C8/w8ZPyts5LkGbrVQUMN9kw1KCViKsLJlt3e+yCxwOyaGMKF6
	1Ne92mEigkyAxX1teSPTzLpl0WJDVCVeGZnpvMQEjUmk7GzmeITe620Qxy0G8QwluQ8cuwt+hUdhR
	05MgjRrjmPVjpYlkVP1ExR4mij/GLsrL5a0qR0MqQehgrEKXMZbeAMiUkqLC8Kxk0hUJyunepEolF
	DvY4zBRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQdUs-000000064ep-1MNf;
	Wed, 03 Dec 2025 03:25:42 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQdUl-000000064bl-3ycy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 03:25:37 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4dLjdv3zRSzKmB0;
	Wed,  3 Dec 2025 11:23:31 +0800 (CST)
Received: from kwepemf200017.china.huawei.com (unknown [7.202.181.10])
	by mail.maildlp.com (Postfix) with ESMTPS id 31A1C140278;
	Wed,  3 Dec 2025 11:25:24 +0800 (CST)
Received: from localhost.localdomain (10.90.31.46) by
 kwepemf200017.china.huawei.com (7.202.181.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 3 Dec 2025 11:25:23 +0800
From: Jie Zhan <zhanjie9@hisilicon.com>
To: <viresh.kumar@linaro.org>, <rafael@kernel.org>, <ionela.voinescu@arm.com>,
	<beata.michalska@arm.com>, <pierre.gondois@arm.com>,
	<zhenglifeng1@huawei.com>
CC: <linux-pm@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linuxarm@huawei.com>,
	<zhanjie9@hisilicon.com>, <jonathan.cameron@huawei.com>,
	<prime.zeng@hisilicon.com>, <yubowen8@huawei.com>, <lihuisong@huawei.com>,
	<zhangpengjie2@huawei.com>, <wangzhi12@huawei.com>
Subject: [PATCH v4 2/3] cpufreq: CPPC: Factor out cppc_fie_kworker_init()
Date: Wed, 3 Dec 2025 11:24:21 +0800
Message-ID: <20251203032422.3232957-3-zhanjie9@hisilicon.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20251203032422.3232957-1-zhanjie9@hisilicon.com>
References: <20251203032422.3232957-1-zhanjie9@hisilicon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemf200017.china.huawei.com (7.202.181.10)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_192536_181333_A2C41032 
X-CRM114-Status: GOOD (  11.84  )
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

Factor out the CPPC FIE kworker init in cppc_freq_invariance_init() because
it's a standalone procedure for use when the CPC regs are in PCC channels.

Signed-off-by: Jie Zhan <zhanjie9@hisilicon.com>
---
 drivers/cpufreq/cppc_cpufreq.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/cpufreq/cppc_cpufreq.c b/drivers/cpufreq/cppc_cpufreq.c
index 9eac77c4f294..947b4e2e1d4e 100644
--- a/drivers/cpufreq/cppc_cpufreq.c
+++ b/drivers/cpufreq/cppc_cpufreq.c
@@ -184,7 +184,7 @@ static void cppc_cpufreq_cpu_fie_exit(struct cpufreq_policy *policy)
 	}
 }
 
-static void __init cppc_freq_invariance_init(void)
+static void cppc_fie_kworker_init(void)
 {
 	struct sched_attr attr = {
 		.size		= sizeof(struct sched_attr),
@@ -201,17 +201,6 @@ static void __init cppc_freq_invariance_init(void)
 	};
 	int ret;
 
-	if (fie_disabled != FIE_ENABLED && fie_disabled != FIE_DISABLED) {
-		fie_disabled = FIE_ENABLED;
-		if (cppc_perf_ctrs_in_pcc()) {
-			pr_info("FIE not enabled on systems with registers in PCC\n");
-			fie_disabled = FIE_DISABLED;
-		}
-	}
-
-	if (fie_disabled)
-		return;
-
 	kworker_fie = kthread_run_worker(0, "cppc_fie");
 	if (IS_ERR(kworker_fie)) {
 		pr_warn("%s: failed to create kworker_fie: %ld\n", __func__,
@@ -229,6 +218,22 @@ static void __init cppc_freq_invariance_init(void)
 	}
 }
 
+static void __init cppc_freq_invariance_init(void)
+{
+	if (fie_disabled != FIE_ENABLED && fie_disabled != FIE_DISABLED) {
+		fie_disabled = FIE_ENABLED;
+		if (cppc_perf_ctrs_in_pcc()) {
+			pr_info("FIE not enabled on systems with registers in PCC\n");
+			fie_disabled = FIE_DISABLED;
+		}
+	}
+
+	if (fie_disabled)
+		return;
+
+	cppc_fie_kworker_init();
+}
+
 static void cppc_freq_invariance_exit(void)
 {
 	if (fie_disabled)
-- 
2.33.0


