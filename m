Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50072CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 17:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ugIY/qVgpkkLlkfjzSuqpB+8HViaaZoetvVfEa1JFIw=; b=NgzXMgOcNNt7JstE7cgCr+BoPo
	a2m3XEY/uyrpLCgcdwMR83UJOQd5qZep3Z6gk43hh2Dx4+on8mapso743364r7m0wXkO3DeaiR8cc
	qR/JrUOsCP0ERzcIOyEg41jG3aNxALfzCvsE59243scgiQokbWxdMJZ+worEgGBPyoUQH8ztUyMZO
	bVX9BGApJv7OP7CaOL+k0Ry6mhmZyJNjmDkxGidt7z7YNqjxxW581VywcgYT1qv13xFRSvzcSN5Dq
	Zk/oyNo9Ko/ieEifZTZY2qGxkw18DGKXDlHvIQU9LGT3tAoOzMx+JwRU13oul4h4gKcqvNaarBS9r
	nXqv6PRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgLR-00000002PiY-1Gxp;
	Thu, 28 Aug 2025 17:23:29 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uraVr-00000001IFI-1M2k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 11:09:52 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4cCJZS1hDJz14MRB;
	Thu, 28 Aug 2025 19:09:36 +0800 (CST)
Received: from kwepemo100006.china.huawei.com (unknown [7.202.195.47])
	by mail.maildlp.com (Postfix) with ESMTPS id 9B7C81800B1;
	Thu, 28 Aug 2025 19:09:43 +0800 (CST)
Received: from localhost.localdomain (10.90.31.46) by
 kwepemo100006.china.huawei.com (7.202.195.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 28 Aug 2025 19:09:42 +0800
From: Jie Zhan <zhanjie9@hisilicon.com>
To: <viresh.kumar@linaro.org>, <rafael@kernel.org>, <ionela.voinescu@arm.com>,
	<beata.michalska@arm.com>, <zhenglifeng1@huawei.com>
CC: <linux-pm@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linuxarm@huawei.com>,
	<zhanjie9@hisilicon.com>, <jonathan.cameron@huawei.com>
Subject: [PATCH v2 1/2] cpufreq: CPPC: Don't warn if FIE init fails to read counters
Date: Thu, 28 Aug 2025 19:02:11 +0800
Message-ID: <20250828110212.2108653-2-zhanjie9@hisilicon.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20250828110212.2108653-1-zhanjie9@hisilicon.com>
References: <20250828110212.2108653-1-zhanjie9@hisilicon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemo100006.china.huawei.com (7.202.195.47)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_040951_523255_A414645E 
X-CRM114-Status: GOOD (  13.10  )
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

During the CPPC FIE initialization, reading perf counters on offline cpus
should be expected to fail.  Don't warn on this case.

Also, change the error log level to debug since FIE is optional.

Co-developed-by: Bowen Yu <yubowen8@huawei.com>
Signed-off-by: Bowen Yu <yubowen8@huawei.com> # Changing loglevel to debug
Signed-off-by: Jie Zhan <zhanjie9@hisilicon.com>
---
 drivers/cpufreq/cppc_cpufreq.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/cpufreq/cppc_cpufreq.c b/drivers/cpufreq/cppc_cpufreq.c
index 4a17162a392d..7724318b3415 100644
--- a/drivers/cpufreq/cppc_cpufreq.c
+++ b/drivers/cpufreq/cppc_cpufreq.c
@@ -144,16 +144,10 @@ static void cppc_cpufreq_cpu_fie_init(struct cpufreq_policy *policy)
 		init_irq_work(&cppc_fi->irq_work, cppc_irq_work);
 
 		ret = cppc_get_perf_ctrs(cpu, &cppc_fi->prev_perf_fb_ctrs);
-		if (ret) {
-			pr_warn("%s: failed to read perf counters for cpu:%d: %d\n",
+		if (ret && cpu_online(cpu)) {
+			pr_debug("%s: failed to read perf counters for cpu:%d: %d\n",
 				__func__, cpu, ret);
-
-			/*
-			 * Don't abort if the CPU was offline while the driver
-			 * was getting registered.
-			 */
-			if (cpu_online(cpu))
-				return;
+			return;
 		}
 	}
 
-- 
2.33.0


