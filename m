Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F72D33A20
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 18:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XT81pCaCySeLSnjYgvTXLKqn2CWQcbY+GGEiD2145i8=; b=WYpYSmRErQj3WmSjnU+EzZxABy
	oBS+RfplcVrGUn0iVgZPEGaakER7cVU+5RztmXJniX8B1MLfr8bQeeFGFrWU67gz+XeRm4zdV4z7m
	PWy3i/WD81KdDVu53wCdsNGLeKqzSB/PBeyEZgLemenNU33YlYS8fwUCYVFHe7JiId4fLtV83yA2Z
	gDGW/fSWcarTxiaKhBnzqT5/kgF6eqn2UlA94ILFLdvAxTTRQhbhbq9NjaB7QJV1wUETbzupzAzFz
	1a6ALl9etWDasQOhBmZN/9KKvIc+q9oxJejUflwU2+YEAL90msyXQR1EktS44yiLYodq0hD+KPyCC
	jTNWhdJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8OTM-00000000PFI-2EhZ;
	Tue, 05 Nov 2024 18:40:12 +0000
Received: from smtp-fw-52003.amazon.com ([52.119.213.152])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8OLp-00000000NcS-2pqo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 18:32:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1730831546; x=1762367546;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XT81pCaCySeLSnjYgvTXLKqn2CWQcbY+GGEiD2145i8=;
  b=qm8lqGbr00hwgViKL07yykqvVvS7Is6gVgyheDXiVaQ+t/8Pu397Dfq8
   UxuZ3kOQDrQGthtJEFFdPh/GTkTBmZQFzUHyrWbJnFDqNsFuoHagn9RmX
   7gNrl63jpZJjeQzM0rv0AsRHHqX+RN/a84mzobuRhGz+/s/FuHaU+Pg1d
   M=;
X-IronPort-AV: E=Sophos;i="6.11,260,1725321600"; 
   d="scan'208";a="39203526"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.6])
  by smtp-border-fw-52003.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 18:32:22 +0000
Received: from EX19MTAUWC001.ant.amazon.com [10.0.7.35:25778]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.63.130:2525] with esmtp (Farcaster)
 id fb722a64-c7d9-4601-a9fb-a5752e9890eb; Tue, 5 Nov 2024 18:32:20 +0000 (UTC)
X-Farcaster-Flow-ID: fb722a64-c7d9-4601-a9fb-a5752e9890eb
Received: from EX19D001UWA003.ant.amazon.com (10.13.138.211) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Tue, 5 Nov 2024 18:32:20 +0000
Received: from u34cccd802f2d52.amazon.com (10.106.239.17) by
 EX19D001UWA003.ant.amazon.com (10.13.138.211) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.35;
 Tue, 5 Nov 2024 18:32:15 +0000
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
Subject: [PATCH 4/5] arm64: add smp_vcond_load_relaxed()
Date: Tue, 5 Nov 2024 12:30:40 -0600
Message-ID: <20241105183041.1531976-5-harisokn@amazon.com>
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
X-CRM114-CacheID: sfid-20241105_103225_904291_E56389D2 
X-CRM114-Status: GOOD (  10.54  )
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

Implement smp_vcond_load_relaxed() atop __delay_until_ul() on arm64,
to reduce number of busy loops while waiting for a value condition.

This implementation only support unsigned long words. It can be extended
via the enclosed case structure in barrier.h as needed.

Signed-off-by: Haris Okanovic <harisokn@amazon.com>
---
 arch/arm64/include/asm/barrier.h | 18 ++++++++++++++++++
 arch/arm64/lib/delay.c           | 16 ++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/arch/arm64/include/asm/barrier.h b/arch/arm64/include/asm/barrier.h
index 1ca947d5c939..188327e3ce72 100644
--- a/arch/arm64/include/asm/barrier.h
+++ b/arch/arm64/include/asm/barrier.h
@@ -203,6 +203,24 @@ do {									\
 	(typeof(*ptr))VAL;						\
 })
 
+extern unsigned long __smp_vcond_load_relaxed_ul(
+	u64 nsecs, unsigned long* addr, unsigned long mask, unsigned long val);
+
+#define smp_vcond_load_relaxed(nsecs, addr, mask, val) ({		\
+	u64 __nsecs = (nsecs);						\
+	typeof(addr) __addr = (addr);					\
+	typeof(*__addr) __mask = (mask);				\
+	typeof(*__addr) __val = (val);					\
+	typeof(*__addr) __cur;						\
+	switch (sizeof(*__addr)) {					\
+	case sizeof(unsigned long):					\
+		__cur = __smp_vcond_load_relaxed_ul(			\
+			__nsecs, __addr, __mask, __val);		\
+		break;							\
+	}								\
+	(__cur);							\
+})
+
 #define smp_cond_load_acquire(ptr, cond_expr)				\
 ({									\
 	typeof(ptr) __PTR = (ptr);					\
diff --git a/arch/arm64/lib/delay.c b/arch/arm64/lib/delay.c
index a7c3040af316..a61a13b04439 100644
--- a/arch/arm64/lib/delay.c
+++ b/arch/arm64/lib/delay.c
@@ -12,6 +12,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/timex.h>
+#include <linux/sched/clock.h>
 
 #include <clocksource/arm_arch_timer.h>
 #include <asm/readex.h>
@@ -97,3 +98,18 @@ void __ndelay(unsigned long nsecs)
 	__delay(NSECS_TO_CYCLES(nsecs));
 }
 EXPORT_SYMBOL(__ndelay);
+
+unsigned long __smp_vcond_load_relaxed_ul(
+	u64 nsecs, unsigned long* addr, unsigned long mask, unsigned long val)
+{
+	const u64 start = local_clock_noinstr();
+	const u64 cycles = NSECS_TO_CYCLES(nsecs);
+	unsigned long cur;
+
+	do {
+		cur = __delay_until_ul(cycles, addr, mask, val);
+	} while((cur & mask) != val && local_clock_noinstr() - start < nsecs);
+
+	return cur;
+}
+EXPORT_SYMBOL(__smp_vcond_load_relaxed_ul);
-- 
2.34.1


