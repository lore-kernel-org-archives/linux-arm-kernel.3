Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6B3CCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 07:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h0Cz8r26uiUEfgHyGdbGpMReEJmd9fW3ZKjrNjIlhTI=; b=V8ZCyQKoQ3PJzxVHmG4NGS0ek1
	HCY5ukJNMXyyEXQk3rqhy1ZdcU8JVoi95ZLly4vOg+3GKFJbMiGRfse8NTIyzBd6uG997tZMbFbCI
	Z1Si/R1SEYq9DObVYoTrKBRsAqT+r//HWt2f1eFCxgyVeNEz59+UpNMdTz+HdhK7WT05MlLO02kjr
	7A1rgJ8YISLo9XBHDtiUM4ZucuQ/GRFICAixTXRC8/z6eaNKR0OAin2Mnwpsej5Z9k8vKKSS9snDk
	hVlCO/I2MjtYbjhoH6HFVmaDo/dZcQqwwZw7DJUSiaTk1msfCKfil5TMMOYvHJwy/8wfSQtvuor0h
	qvkhoOtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGBtX-0000000BMab-31Do;
	Tue, 04 Nov 2025 07:55:59 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGBtT-0000000BMYS-42Mk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 07:55:57 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=h0Cz8r26uiUEfgHyGdbGpMReEJmd9fW3ZKjrNjIlhTI=;
	b=xw+/AePoCAV2kjUx8a71rOuNkh59Pv1Ifc+IRZntxldEiRKLR8neCRtojLlPKyMKkGYl1CBa7
	2IRwRD5wnA4eJGozEH6oxY7gmAQ5ZkRbGWzEl3WSOHF9ERF77hfbS2zpPL0dZFRn55pBSyVk96V
	un6Tsfk7a1WcLmtirwq0L7o=
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4d111c0MTSz1cyV7;
	Tue,  4 Nov 2025 15:54:12 +0800 (CST)
Received: from kwepemk500012.china.huawei.com (unknown [7.202.194.97])
	by mail.maildlp.com (Postfix) with ESMTPS id EE1211402C3;
	Tue,  4 Nov 2025 15:55:46 +0800 (CST)
Received: from localhost.localdomain (10.50.163.32) by
 kwepemk500012.china.huawei.com (7.202.194.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 4 Nov 2025 15:55:46 +0800
From: Bowen Yu <yubowen8@huawei.com>
To: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <beata.michalska@arm.com>,
	<ptsm@linux.microsoft.com>, <linuxarm@huawei.com>,
	<jonathan.cameron@huawei.com>
CC: <zhanjie9@hisilicon.com>, <prime.zeng@hisilicon.com>,
	<wanghuiqiang@huawei.com>, <xuwei5@huawei.com>, <zhenglifeng1@huawei.com>,
	<yubowen8@huawei.com>, <zhangpengjie2@huawei.com>
Subject: [PATCH 2/3] arm64: topology: Use current freq in governor for idle cpus in cpuinfo_avg_freq
Date: Tue, 4 Nov 2025 15:55:43 +0800
Message-ID: <20251104075544.3243606-3-yubowen8@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20251104075544.3243606-1-yubowen8@huawei.com>
References: <20251104075544.3243606-1-yubowen8@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk500012.china.huawei.com (7.202.194.97)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_235556_161441_A601B2AA 
X-CRM114-Status: GOOD (  14.52  )
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

The current cpuinfo_avg_freq interface returns an error when all CPUs
under a policy are idle, which is relatively common. To address this, it
is better to use the current frequency stored in the governor. This
implementation is also used on x86 architecture.

Since the current frequency in the governor is the last known frequency,
it should be more user-friendly.

This patch also removes redundant !housekeeping_cpu() check since it is
inherently done when checking jiffies.

Original output when all cpus under a policy are idle:
[root@localhost home]# cat /sys/devices/system/cpu/cpufreq/policy0/
cpuinfo_avg_freq
cat: /sys/devices/system/cpu/cpufreq/policy0/cpuinfo_avg_freq: Resource
 temporarily unavailable

Output after changes:
[root@localhost home]# cat /sys/devices/system/cpu/cpufreq/policy0
/cpuinfo_avg_freq
1200000

Signed-off-by: Bowen Yu <yubowen8@huawei.com>
---
 arch/arm64/kernel/topology.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index c0dbc27289ea..f1370a4a4df9 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -333,14 +333,13 @@ int arch_freq_get_on_cpu(int cpu)
 				if (!idle_cpu(ref_cpu))
 					break;
 			}
+
+			if (ref_cpu >= nr_cpu_ids) {
+				cpufreq_cpu_put(policy);
+				return cpufreq_quick_get(start_cpu);
+			}
 
 			cpufreq_cpu_put(policy);
-
-			if (ref_cpu >= nr_cpu_ids)
-				/* No alternative to pull info from */
-				return -EAGAIN;
-
-			cpu = ref_cpu;
 		} else {
 			break;
 		}
-- 
2.33.0

