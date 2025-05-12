Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 965CCC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 13:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8MiKRKwV6GD72E2G0mY4Wnu3PX7wqYIAIiXYF7IZ6Hg=; b=33VXZO6pEkkc06HQv/ogJDbQ1V
	K3qsqmZ/7KN+YSpWXlt8d0QXgNlPoixA1jIgJNigfe7WKzHJV5TxORCB+D2Enf7wFg6JexNP1wIyx
	v7RLwb2pWmkzYbatSG/VzRw+oc3F10/SSOrUv8wIf/ERjCdq/Pdohg1TV5ae9XpyI3qlGuBk9bmw4
	lkcypgZoy+nswEgo7MA8yQCUiWeBUm6x4STveZ51hVHcXEda0UQeQ3e3cyN5mfhUKho8XYbiXArGX
	tZ0JxBjDA8A2BqTR1ItZFg/55ORSMULLbjUihpTke/I4QICqT1T+SWmng1N1UQEaSY4hUBglDM/tQ
	Z9x0gRVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uETT5-00000009bX7-0DBX;
	Mon, 12 May 2025 13:45:19 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uESue-00000009UU9-3TIR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 13:09:46 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Zx0KB1bkCz1d1FW;
	Mon, 12 May 2025 21:08:14 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id DB693140132;
	Mon, 12 May 2025 21:09:37 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 12 May 2025 21:09:37 +0800
Received: from localhost.localdomain (10.50.165.33) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 12 May 2025 21:09:36 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <akpm@linux-foundation.org>,
	<dianders@chromium.org>, <sumit.garg@linaro.org>, <kernelfans@gmail.com>,
	<lecopzer.chen@mediatek.com>, <tglx@linutronix.de>, <song@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <jonathan.cameron@huawei.com>, <zhanjie9@hisilicon.com>,
	<prime.zeng@hisilicon.com>, <yangyicong@hisilicon.com>, <linuxarm@huawei.com>
Subject: [PATCH v2 1/2] watchdog/perf: Provide function for adjusting the event period
Date: Mon, 12 May 2025 21:09:18 +0800
Message-ID: <20250512130919.23915-2-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20250512130919.23915-1-yangyicong@huawei.com>
References: <20250512130919.23915-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_060945_177791_5A05EA42 
X-CRM114-Status: GOOD (  12.15  )
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


