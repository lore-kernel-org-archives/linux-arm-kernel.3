Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3ED3D33A23
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 18:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TrNQ3LJeAMesAmpKUJ7N1Al9kS1bwIA8hsz/KHf4MgU=; b=cBaUdPA7SuvRWE2V8iT/vwPYGj
	9KPDnf4Bhb5A33LuDdBEe61aDXeVlq1pA6mf+7pDFzmd020fZjFIVc2CGFvQgVCI82cLu6WJIZJQl
	0xvOs2u9WTWNn9c4jvpjQS6aSpb/oTAoZgTmcebgzD7m8UV6ugBZ1WG/kmJAabUjZSmz5iSgDtq5K
	h2h+Gzm6dWLFZslHSOVVpRvh5gyH9lstvNEoW0knmTNt/o7u3IYCku1u7pSbwWEImqa+DUFDLUQD/
	kgf23GCf9dNkDMn7bBdswwsZuyR6JLLE+hLUlZ30VoiXoAZB35HAL+ck3ks8AYCh7OS6RHXfsjfkQ
	+ty5w3Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8OV7-00000000Plb-08JZ;
	Tue, 05 Nov 2024 18:42:01 +0000
Received: from smtp-fw-2101.amazon.com ([72.21.196.25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8OM7-00000000Ngw-1ONS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 18:32:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1730831563; x=1762367563;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TrNQ3LJeAMesAmpKUJ7N1Al9kS1bwIA8hsz/KHf4MgU=;
  b=ddfYjFa7MUuOxQ8QeYde8QDpUhi4qbsRHpdPsao8CgU5mYvSvyDMm0Z5
   yG58tJ8aABdkg+Ez6Jb6TQdK97Ujygc+JumhmqtN//DUedfULm0vIiP6T
   bYIf86WQ2GeRTdBAiCZKpJ5RsgwA4IdR5xE26U5NqDEyvCOsKyQIksc7P
   E=;
X-IronPort-AV: E=Sophos;i="6.11,260,1725321600"; 
   d="scan'208";a="440503091"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.6])
  by smtp-border-fw-2101.iad2.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 18:32:39 +0000
Received: from EX19MTAUWA002.ant.amazon.com [10.0.7.35:4506]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.17.170:2525] with esmtp (Farcaster)
 id 3e5bd2bb-9e63-4844-b995-362add075696; Tue, 5 Nov 2024 18:32:39 +0000 (UTC)
X-Farcaster-Flow-ID: 3e5bd2bb-9e63-4844-b995-362add075696
Received: from EX19D001UWA003.ant.amazon.com (10.13.138.211) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Tue, 5 Nov 2024 18:32:37 +0000
Received: from u34cccd802f2d52.amazon.com (10.106.239.17) by
 EX19D001UWA003.ant.amazon.com (10.13.138.211) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.35;
 Tue, 5 Nov 2024 18:32:32 +0000
From: Haris Okanovic <harisokn@amazon.com>
To: <ankur.a.arora@oracle.com>, <catalin.marinas@arm.com>
CC: <linux-pm@vger.kernel.org>, <kvm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<will@kernel.org>, <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, <hpa@zytor.com>,
	<pbonzini@redhat.com>, <wanpengli@tencent.com>, <vkuznets@redhat.com>,
	<rafael@kernel.org>, <daniel.lezcano@linaro.org>, <peterz@infradead.org>,
	<arnd@arndb.de>, <lenb@kernel.org>, <mark.rutland@arm.com>,
	<harisokn@amazon.com>, <mtosatti@redhat.com>, <sudeep.holla@arm.com>,
	<cl@gentwo.org>, <misono.tomohiro@fujitsu.com>, <maobibo@loongson.cn>,
	<joao.m.martins@oracle.com>, <boris.ostrovsky@oracle.com>,
	<konrad.wilk@oracle.com>
Subject: [PATCH 5/5] cpuidle: implement poll_idle() using smp_vcond_load_relaxed()
Date: Tue, 5 Nov 2024 12:30:41 -0600
Message-ID: <20241105183041.1531976-6-harisokn@amazon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241105183041.1531976-1-harisokn@amazon.com>
References: <20240925232425.2763385-1-ankur.a.arora@oracle.com>
 <20241105183041.1531976-1-harisokn@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.106.239.17]
X-ClientProxiedBy: EX19D033UWA004.ant.amazon.com (10.13.139.85) To
 EX19D001UWA003.ant.amazon.com (10.13.138.211)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_103243_561890_08A29204 
X-CRM114-Status: GOOD (  10.98  )
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

Implement poll_idle() using smp_vcond_load_relaxed() function.

Signed-off-by: Haris Okanovic <harisokn@amazon.com>
---
 drivers/cpuidle/poll_state.c | 36 +++++-------------------------------
 1 file changed, 5 insertions(+), 31 deletions(-)

diff --git a/drivers/cpuidle/poll_state.c b/drivers/cpuidle/poll_state.c
index 61df2395585e..5553e6f31702 100644
--- a/drivers/cpuidle/poll_state.c
+++ b/drivers/cpuidle/poll_state.c
@@ -7,46 +7,20 @@
 #include <linux/sched.h>
 #include <linux/sched/clock.h>
 #include <linux/sched/idle.h>
-
-#ifdef CONFIG_ARM64
-/*
- * POLL_IDLE_RELAX_COUNT determines how often we check for timeout
- * while polling for TIF_NEED_RESCHED in thread_info->flags.
- *
- * Set this to a low value since arm64, instead of polling, uses a
- * event based mechanism.
- */
-#define POLL_IDLE_RELAX_COUNT	1
-#else
-#define POLL_IDLE_RELAX_COUNT	200
-#endif
+#include <asm/barrier.h>
 
 static int __cpuidle poll_idle(struct cpuidle_device *dev,
 			       struct cpuidle_driver *drv, int index)
 {
-	u64 time_start;
-
-	time_start = local_clock_noinstr();
+	unsigned long flags;
 
 	dev->poll_time_limit = false;
 
 	raw_local_irq_enable();
 	if (!current_set_polling_and_test()) {
-		u64 limit;
-
-		limit = cpuidle_poll_time(drv, dev);
-
-		while (!need_resched()) {
-			unsigned int loop_count = 0;
-			if (local_clock_noinstr() - time_start > limit) {
-				dev->poll_time_limit = true;
-				break;
-			}
-
-			smp_cond_load_relaxed(&current_thread_info()->flags,
-					      VAL & _TIF_NEED_RESCHED ||
-					      loop_count++ >= POLL_IDLE_RELAX_COUNT);
-		}
+		u64 limit = cpuidle_poll_time(drv, dev);
+		flags = smp_vcond_load_relaxed(limit, &current_thread_info()->flags, _TIF_NEED_RESCHED, _TIF_NEED_RESCHED);
+		dev->poll_time_limit = !(flags & _TIF_NEED_RESCHED);
 	}
 	raw_local_irq_disable();
 
-- 
2.34.1


