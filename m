Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F1A3D3177E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 18:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bT6rRx7a7sWccvBSdvoPKKTuXoItJoU+EpMvF26uVsc=; b=ih2vggD4uYdWQ3YwwrP4O3HUMB
	UAHMd6BXrvOINrAQk92xNh1f59mxiTe6CCNF+lxYeLeSNozLLlCzm6SCpn5mRZCOwZWuBUVqHpvvw
	HoP3VwTT/O/Yvl6th8nlO3Pwl97i3Qog9RBYEDOMF8hopQgoKcuuE778mQl22LZSgRrtqYzmUnbYg
	BdkJonlvhMXu8frVCddbY3Y4foinBoNHCBO9aQF3HEkx5XiPVP3vCyXe7T96sgSRPsrW8YI6uS/qP
	eCQ9dPHeb9lVUgbCJDnR0RV/+RU59Qq7uDS3XrD4MvCDOxtMUASsL+P+m8G4c7mD5RkHO0IqmE4to
	dAPrWKtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8OOE-00000000O0O-0amd;
	Tue, 05 Nov 2024 18:34:54 +0000
Received: from smtp-fw-52004.amazon.com ([52.119.213.154])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8OLB-00000000NP3-0Zpt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 18:31:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1730831505; x=1762367505;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bT6rRx7a7sWccvBSdvoPKKTuXoItJoU+EpMvF26uVsc=;
  b=Gf6Y1sCTSF+raYdgerjfLmYouQlnqi4wur4jY1778cWqoApI95HGDdWX
   7hQH5ydEmdrT7PqnNGyMJGmF9wIErUS3/CzY+CPCegybMH4epu3oElsPG
   WIUPIOUVDLydGTuz27dhKjm4oQGbjyTjf3K38+706UkJc+Pb1qoO46VVf
   M=;
X-IronPort-AV: E=Sophos;i="6.11,260,1725321600"; 
   d="scan'208";a="245128567"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.2])
  by smtp-border-fw-52004.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 18:31:40 +0000
Received: from EX19MTAUWA001.ant.amazon.com [10.0.21.151:50603]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.28.125:2525] with esmtp (Farcaster)
 id 39bb5814-4f48-4caf-ba41-fae750bfbae2; Tue, 5 Nov 2024 18:31:40 +0000 (UTC)
X-Farcaster-Flow-ID: 39bb5814-4f48-4caf-ba41-fae750bfbae2
Received: from EX19D001UWA003.ant.amazon.com (10.13.138.211) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Tue, 5 Nov 2024 18:31:39 +0000
Received: from u34cccd802f2d52.amazon.com (10.106.239.17) by
 EX19D001UWA003.ant.amazon.com (10.13.138.211) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.35;
 Tue, 5 Nov 2024 18:31:34 +0000
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
Subject: [PATCH 1/5] asm-generic: add smp_vcond_load_relaxed()
Date: Tue, 5 Nov 2024 12:30:37 -0600
Message-ID: <20241105183041.1531976-2-harisokn@amazon.com>
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
X-CRM114-CacheID: sfid-20241105_103145_386828_C9410833 
X-CRM114-Status: GOOD (  10.68  )
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

Relaxed poll until desired mask/value is observed at the specified
address or timeout.

This macro is a specialization of the generic smp_cond_load_relaxed(),
which takes a simple mask/value condition (vcond) instead of an
arbitrary expression. It allows architectures to better specialize the
implementation, e.g. to enable wfe() polling of the address on arm.

Signed-off-by: Haris Okanovic <harisokn@amazon.com>
---
 include/asm-generic/barrier.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/include/asm-generic/barrier.h b/include/asm-generic/barrier.h
index d4f581c1e21d..112027eabbfc 100644
--- a/include/asm-generic/barrier.h
+++ b/include/asm-generic/barrier.h
@@ -256,6 +256,31 @@ do {									\
 })
 #endif
 
+/**
+ * smp_vcond_load_relaxed() - (Spin) wait until an expected value at address
+ * with no ordering guarantees. Spins until `(*addr & mask) == val` or
+ * `nsecs` elapse, and returns the last observed `*addr` value.
+ *
+ * @nsecs: timeout in nanoseconds
+ * @addr: pointer to an integer
+ * @mask: a bit mask applied to read values
+ * @val: Expected value with mask
+ */
+#ifndef smp_vcond_load_relaxed
+#define smp_vcond_load_relaxed(nsecs, addr, mask, val) ({	\
+	const u64 __start = local_clock_noinstr();		\
+	u64 __nsecs = (nsecs);					\
+	typeof(addr) __addr = (addr);				\
+	typeof(*__addr) __mask = (mask);			\
+	typeof(*__addr) __val = (val);				\
+	typeof(*__addr) __cur;					\
+	smp_cond_load_relaxed(__addr, (				\
+		(VAL & __mask) == __val ||			\
+		local_clock_noinstr() - __start > __nsecs	\
+	));							\
+})
+#endif
+
 /**
  * smp_cond_load_acquire() - (Spin) wait for cond with ACQUIRE ordering
  * @ptr: pointer to the variable to wait on
-- 
2.34.1


