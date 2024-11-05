Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 439CCD328A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 18:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jU1idzmOqOXlXb1t2IMpZrPTuLA9eFztDBmS3LLVVOw=; b=kbkanbIwqKRScOgI8A8zy8piKB
	/VaRBmEzUURDf5kR7wEj3KmQXfbMsVhPtJ3N0dI7EKMz1+LxBq87p2f1zq0VFWJeLGBTu0ZQ7s9Fv
	78TFHfFXRa3+K/qrIoc5uDLmlz/Nz5RzUCc+NSDXqGBObFAcPV29gUnsVSUgktlkQ+23GB0vgdUDf
	EiaB56a5RJ5hiqqCmnnJ7KcrEBZKhbLFukhlc3KByYBHZjPBqtAz66pfSyBiC2VZ/IgtaWBR+iAzM
	oyFAAwHGGj5emJ/HCYNOyWcbKScfryH1panV44peyO0BGxqyIWBil24WRgpgmHc/lcC6yB6hFf9v+
	ZnDKsP6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8ORd-00000000Oic-1A3e;
	Tue, 05 Nov 2024 18:38:25 +0000
Received: from smtp-fw-9106.amazon.com ([207.171.188.206])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8OLg-00000000NYm-1DDP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 18:32:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1730831536; x=1762367536;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jU1idzmOqOXlXb1t2IMpZrPTuLA9eFztDBmS3LLVVOw=;
  b=W2WNybKHNiaqe0fI03wsDQSkjpM3gn76FGWkycZNpaJA5eLt1UGteJvp
   R2t9t6rbgZFX+PkaKSvXOIIuGdI/D3A0BdS4DhwExTS7JSfUBNBwXjTL6
   ntNwKxS0DzzSG/AuaQVuIQlvlvYkXZk/bwuRxww1a+pMKzUzyLcVO0qLB
   Y=;
X-IronPort-AV: E=Sophos;i="6.11,260,1725321600"; 
   d="scan'208";a="773030717"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-9106.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 18:32:13 +0000
Received: from EX19MTAUWA001.ant.amazon.com [10.0.21.151:34625]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.28.125:2525] with esmtp (Farcaster)
 id f9c0b0d1-8be1-4e25-ab5f-c68efeaab89c; Tue, 5 Nov 2024 18:32:12 +0000 (UTC)
X-Farcaster-Flow-ID: f9c0b0d1-8be1-4e25-ab5f-c68efeaab89c
Received: from EX19D001UWA003.ant.amazon.com (10.13.138.211) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Tue, 5 Nov 2024 18:32:12 +0000
Received: from u34cccd802f2d52.amazon.com (10.106.239.17) by
 EX19D001UWA003.ant.amazon.com (10.13.138.211) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.35;
 Tue, 5 Nov 2024 18:32:06 +0000
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
Subject: [PATCH 3/5] arm64: refactor delay() to enable polling for value
Date: Tue, 5 Nov 2024 12:30:39 -0600
Message-ID: <20241105183041.1531976-4-harisokn@amazon.com>
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
X-CRM114-CacheID: sfid-20241105_103216_486432_B6602B4A 
X-CRM114-Status: GOOD (  13.28  )
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

Refactor arm64's delay() to poll for a mask/value condition (vcond) in
it's wfet(), wfe(), and relaxed polling loops.

Signed-off-by: Haris Okanovic <harisokn@amazon.com>
---
 arch/arm64/lib/delay.c | 70 ++++++++++++++++++++++++++++++------------
 1 file changed, 50 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/lib/delay.c b/arch/arm64/lib/delay.c
index cb2062e7e234..a7c3040af316 100644
--- a/arch/arm64/lib/delay.c
+++ b/arch/arm64/lib/delay.c
@@ -14,43 +14,73 @@
 #include <linux/timex.h>
 
 #include <clocksource/arm_arch_timer.h>
+#include <asm/readex.h>
 
-#define USECS_TO_CYCLES(time_usecs)			\
-	xloops_to_cycles((time_usecs) * 0x10C7UL)
-
-static inline unsigned long xloops_to_cycles(unsigned long xloops)
+static inline u64 xloops_to_cycles(u64 xloops)
 {
 	return (xloops * loops_per_jiffy * HZ) >> 32;
 }
 
-void __delay(unsigned long cycles)
+#define USECS_TO_XLOOPS(time_usecs) \
+	((time_usecs) * 0x10C7UL)
+
+#define USECS_TO_CYCLES(time_usecs) \
+	xloops_to_cycles(USECS_TO_XLOOPS(time_usecs))
+
+#define NSECS_TO_XLOOPS(time_nsecs) \
+	((time_nsecs) * 0x10C7UL)
+
+#define NSECS_TO_CYCLES(time_nsecs) \
+	xloops_to_cycles(NSECS_TO_XLOOPS(time_nsecs))
+
+static unsigned long __delay_until_ul(u64 cycles, unsigned long* addr, unsigned long mask, unsigned long val)
 {
-	cycles_t start = get_cycles();
+	u64 start = get_cycles();
+	unsigned long cur;
 
 	if (alternative_has_cap_unlikely(ARM64_HAS_WFXT)) {
 		u64 end = start + cycles;
 
-		/*
-		 * Start with WFIT. If an interrupt makes us resume
-		 * early, use a WFET loop to complete the delay.
-		 */
-		wfit(end);
-		while ((get_cycles() - start) < cycles)
+		do {
+			cur = __READ_ONCE_EX(*addr);
+			if ((cur & mask) == val) {
+				break;
+			}
 			wfet(end);
-	} else 	if (arch_timer_evtstrm_available()) {
-		const cycles_t timer_evt_period =
+		} while ((get_cycles() - start) < cycles);
+	} else if (arch_timer_evtstrm_available()) {
+		const u64 timer_evt_period =
 			USECS_TO_CYCLES(ARCH_TIMER_EVT_STREAM_PERIOD_US);
 
-		while ((get_cycles() - start + timer_evt_period) < cycles)
+		do {
+			cur = __READ_ONCE_EX(*addr);
+			if ((cur & mask) == val) {
+				break;
+			}
 			wfe();
+		} while ((get_cycles() - start + timer_evt_period) < cycles);
+	} else {
+		do {
+			cur = __READ_ONCE_EX(*addr);
+			if ((cur & mask) == val) {
+				break;
+			}
+			cpu_relax();
+		} while ((get_cycles() - start) < cycles);
 	}
 
-	while ((get_cycles() - start) < cycles)
-		cpu_relax();
+	return cur;
+}
+
+void __delay(unsigned long cycles)
+{
+	/* constant word for wfet()/wfe() to poll */
+	unsigned long dummy ____cacheline_aligned = 0;
+	__delay_until_ul(cycles, &dummy, 0, 1);
 }
 EXPORT_SYMBOL(__delay);
 
-inline void __const_udelay(unsigned long xloops)
+void __const_udelay(unsigned long xloops)
 {
 	__delay(xloops_to_cycles(xloops));
 }
@@ -58,12 +88,12 @@ EXPORT_SYMBOL(__const_udelay);
 
 void __udelay(unsigned long usecs)
 {
-	__const_udelay(usecs * 0x10C7UL); /* 2**32 / 1000000 (rounded up) */
+	__delay(USECS_TO_CYCLES(usecs));
 }
 EXPORT_SYMBOL(__udelay);
 
 void __ndelay(unsigned long nsecs)
 {
-	__const_udelay(nsecs * 0x5UL); /* 2**32 / 1000000000 (rounded up) */
+	__delay(NSECS_TO_CYCLES(nsecs));
 }
 EXPORT_SYMBOL(__ndelay);
-- 
2.34.1


