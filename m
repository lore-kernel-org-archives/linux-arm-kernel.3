Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608D9C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8MiKRKwV6GD72E2G0mY4Wnu3PX7wqYIAIiXYF7IZ6Hg=; b=ApkLgdwSs4wt6OH7hL+Lt1gy/I
	84c4V4lSJIWB6FwDH7cdGR4kv7E/kbWCWqUPdmGR3sgA7m1N5uVc6HE2wtrV+SmiD9e0ShKNpf/nu
	zCGw/ws/cloq7N/Hjb/1cjbAsbui8VnnjEfj+O1DonO1nCc/NGoOmQkawpeEpEn3+chE2yMZhQdCA
	3dRJst/3vloyNa9Mf29j8fWqdrEJOfpatBsucD5T3UR97rCIjOg58GhdupM3EmLezBfjYEKnDlaLp
	WLrXU3WvLAyZ5fE1kC2tf3MlX+Q9VRHTH4CUMradqmHEP2EDm2sZzMWf87vTxnpQYVrdKyYok+e86
	4akjK8aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHSl-0000000DTWx-3qGz;
	Thu, 19 Jun 2025 15:46:04 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSDkm-0000000CwUI-2OhP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 11:48:26 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4bNJhW2H6rz28fSD;
	Thu, 19 Jun 2025 19:45:47 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 8AC031800B2;
	Thu, 19 Jun 2025 19:48:12 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 19 Jun 2025 19:48:12 +0800
Received: from localhost.localdomain (10.50.165.33) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 19 Jun 2025 19:48:11 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <akpm@linux-foundation.org>,
	<dianders@chromium.org>, <sumit.garg@linaro.org>, <kernelfans@gmail.com>,
	<lecopzer.chen@mediatek.com>, <tglx@linutronix.de>, <song@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <jonathan.cameron@huawei.com>, <zhanjie9@hisilicon.com>,
	<prime.zeng@hisilicon.com>, <yangyicong@hisilicon.com>, <linuxarm@huawei.com>
Subject: [RESEND PATCH v2 1/2] watchdog/perf: Provide function for adjusting the event period
Date: Thu, 19 Jun 2025 19:48:04 +0800
Message-ID: <20250619114805.16968-2-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20250619114805.16968-1-yangyicong@huawei.com>
References: <20250619114805.16968-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_044824_929194_F48966FA 
X-CRM114-Status: GOOD (  12.23  )
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

Architecture's using perf events for hard lockup detection needs to
convert the watchdog_thresh to the event's period, some architecture
for example arm64 perform this conversion using the CPU's maximum
frequency which will be acquired by cpufreq. However by the time
the lockup detector's initialized the cpufreq driver may not be
initialized, thus launch a watchdog with inaccurate period. Provide
a function hardlockup_detector_perf_adjust_period() to allowing
adjust the event period. Then architecture can update with more
accurate period if cpufreq is initialized.

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 include/linux/nmi.h    |  2 ++
 kernel/watchdog_perf.c | 23 +++++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index e78fa535f61d..0a6d8a8d2d5b 100644
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -103,10 +103,12 @@ void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs);
 extern void hardlockup_detector_perf_stop(void);
 extern void hardlockup_detector_perf_restart(void);
 extern void hardlockup_config_perf_event(const char *str);
+extern void hardlockup_detector_perf_adjust_period(int cpu, u64 period);
 #else
 static inline void hardlockup_detector_perf_stop(void) { }
 static inline void hardlockup_detector_perf_restart(void) { }
 static inline void hardlockup_config_perf_event(const char *str) { }
+static inline void hardlockup_detector_perf_adjust_period(int cpu, u64 period) { }
 #endif
 
 void watchdog_hardlockup_stop(void);
diff --git a/kernel/watchdog_perf.c b/kernel/watchdog_perf.c
index 75af12ff774e..41c299e63fab 100644
--- a/kernel/watchdog_perf.c
+++ b/kernel/watchdog_perf.c
@@ -186,6 +186,29 @@ void watchdog_hardlockup_disable(unsigned int cpu)
 	}
 }
 
+/**
+ * hardlockup_detector_perf_adjust_period - Adjust the event period due
+ *                                          to cpu frequency change
+ * @cpu: The CPU whose event period will be adjusted
+ * @period: The target period to be set
+ */
+void hardlockup_detector_perf_adjust_period(int cpu, u64 period)
+{
+	struct perf_event *event = per_cpu(watchdog_ev, cpu);
+
+	if (!(watchdog_enabled & WATCHDOG_HARDLOCKUP_ENABLED))
+		return;
+
+	if (!event)
+		return;
+
+	if (event->attr.sample_period == period)
+		return;
+
+	if (perf_event_period(event, period))
+		pr_err("failed to change period to %llu\n", period);
+}
+
 /**
  * hardlockup_detector_perf_stop - Globally stop watchdog events
  *
-- 
2.24.0


