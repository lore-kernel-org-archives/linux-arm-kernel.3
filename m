Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C8CC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 02:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ON6xK4tUoplLsWJ2JnviQP/r6hQ62Z7pTsiZtrYdS08=; b=stEZjPdp4vzWF/QJ0AYYKha1QZ
	DS79SAzhlxZSNJ2Ojhf2xQNodoieAOygOW65dMdnuGB/d7F6cQrZYufMOZ8738fdKxvkOGBKxCNNN
	t6iNzFr2Guc/H2KICr1kox/V61EalPgAFkC1GPIszceedE8eIs2nJDXL2N1ye5pQKBsl0IcC2RdPo
	aZvZW/unkFXIKlTvoVAPcpWXrdL2PODca2lY3tKzHjdfDYX0osNux1kHMpgKL9nrTfZcXZ2Er9ipf
	wF0hh8sQcf6uZvacJcsD+fJFfSNNqHpFs+nTnKv37wo/bAWu9Nxq90lCg4cp9n8wXvo45rKcyALta
	cF56BJoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqNN0-0000000Cttc-2jHE;
	Fri, 07 Mar 2025 02:23:26 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqNID-0000000Ct5S-1sHf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 02:18:31 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Z892G647zz17LVC;
	Fri,  7 Mar 2025 10:18:46 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id D92241402C4;
	Fri,  7 Mar 2025 10:18:12 +0800 (CST)
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
Subject: [PATCH 1/2] watchdog/perf: Provide function for adjusting the event period
Date: Fri, 7 Mar 2025 10:18:10 +0800
Message-ID: <20250307021811.46981-2-yangyicong@huawei.com>
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
X-CRM114-CacheID: sfid-20250306_181829_796384_655C627B 
X-CRM114-Status: GOOD (  12.28  )
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
a function dhardlockup_detector_perf_adjust_period() to allowing
adjust the event period. Then architecture can update with more
accurate period if cpufreq is initialized.

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 include/linux/nmi.h    |  2 ++
 kernel/watchdog_perf.c | 21 +++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index a8dfb38c9bb6..2200ce481439 100644
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -106,11 +106,13 @@ extern void hardlockup_detector_perf_stop(void);
 extern void hardlockup_detector_perf_restart(void);
 extern void hardlockup_detector_perf_cleanup(void);
 extern void hardlockup_config_perf_event(const char *str);
+extern void hardlockup_detector_perf_adjust_period(int cpu, u64 period);
 #else
 static inline void hardlockup_detector_perf_stop(void) { }
 static inline void hardlockup_detector_perf_restart(void) { }
 static inline void hardlockup_detector_perf_cleanup(void) { }
 static inline void hardlockup_config_perf_event(const char *str) { }
+static inline void hardlockup_detector_perf_adjust_period(int cpu, u64 period) { }
 #endif
 
 void watchdog_hardlockup_stop(void);
diff --git a/kernel/watchdog_perf.c b/kernel/watchdog_perf.c
index 59c1d86a73a2..bc00985d1f69 100644
--- a/kernel/watchdog_perf.c
+++ b/kernel/watchdog_perf.c
@@ -211,6 +211,27 @@ void hardlockup_detector_perf_cleanup(void)
 	cpumask_clear(&dead_events_mask);
 }
 
+/**
+ * hardlockup_detector_perf_adjust_period - Adjust the events period due
+ *                                          to cpu frequency change
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


