Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA152D3177E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 18:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aZOVkbd/aqSS6wL2tHU2ZYavLfm4wZ7pJZkt2CDBd7U=; b=WzPR9FJIK6YMyS2jbv+cNWHrrN
	Ni3wdwKxSlx3eFYkSqE/8Sv7e2pVNQmKgI9g/SBcBtzFGiwG6EAtcepx7bmKHyyPRWfYq0agNsrFq
	AaqYE1sIjnAxcs7SV/pqhTeQcfoGo32QDIG6g99cGLOL1YmVvp9yEMUm8Jgpg4Vbz4dVVH0rnoE0Q
	QG8o6R1f00/1WeXE68m3AAuy08xzJdDLZTceUJ/iq5NpUvXgrjuIehrMB9DRIWF7onpYZU+BOtl/C
	WDNuNaiDIAzfvx/xrVzteFgakBIuZ6+EtV43lzbcikVMgRGFuNfu7INH23YAGBy0F2uObFgtVQz8V
	l6nZxzYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8OPu-00000000OFl-0JC8;
	Tue, 05 Nov 2024 18:36:38 +0000
Received: from smtp-fw-33001.amazon.com ([207.171.190.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8OLM-00000000NSQ-34xX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 18:31:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1730831517; x=1762367517;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aZOVkbd/aqSS6wL2tHU2ZYavLfm4wZ7pJZkt2CDBd7U=;
  b=lgahfxVR8Rr5NjZ0abKtetzZwqeJURjgg3Hv4o01q7EFbRgrC7j5nFfC
   R3DLEpPdkRzEg45t9i70KDfuaxB9L6zgLPTpk0VA/cwNURlwxNp+eXAPq
   HNDVRVsASJ6xIvcOAiQFr95WTXZnTCmnIIDoFS6oGOqaa7F3xVP9cTmUk
   A=;
X-IronPort-AV: E=Sophos;i="6.11,260,1725321600"; 
   d="scan'208";a="382672781"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-33001.sea14.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 18:31:56 +0000
Received: from EX19MTAUWB001.ant.amazon.com [10.0.38.20:51046]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.10.37:2525] with esmtp (Farcaster)
 id 3cfefb00-6800-4172-8693-375f47215f5a; Tue, 5 Nov 2024 18:31:55 +0000 (UTC)
X-Farcaster-Flow-ID: 3cfefb00-6800-4172-8693-375f47215f5a
Received: from EX19D001UWA003.ant.amazon.com (10.13.138.211) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Tue, 5 Nov 2024 18:31:55 +0000
Received: from u34cccd802f2d52.amazon.com (10.106.239.17) by
 EX19D001UWA003.ant.amazon.com (10.13.138.211) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.35;
 Tue, 5 Nov 2024 18:31:50 +0000
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
Subject: [PATCH 2/5] arm64: add __READ_ONCE_EX()
Date: Tue, 5 Nov 2024 12:30:38 -0600
Message-ID: <20241105183041.1531976-3-harisokn@amazon.com>
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
X-CRM114-CacheID: sfid-20241105_103156_873191_3963411F 
X-CRM114-Status: GOOD (  11.95  )
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

Perform an exclusive load, which atomically loads a word and arms the
exclusive monitor to enable wfet()/wfe() accelerated polling.

https://developer.arm.com/documentation/dht0008/a/arm-synchronization-primitives/exclusive-accesses/exclusive-monitors

Signed-off-by: Haris Okanovic <harisokn@amazon.com>
---
 arch/arm64/include/asm/readex.h | 46 +++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 arch/arm64/include/asm/readex.h

diff --git a/arch/arm64/include/asm/readex.h b/arch/arm64/include/asm/readex.h
new file mode 100644
index 000000000000..51963c3107e1
--- /dev/null
+++ b/arch/arm64/include/asm/readex.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Based on arch/arm64/include/asm/rwonce.h
+ *
+ * Copyright (C) 2020 Google LLC.
+ * Copyright (C) 2024 Amazon.com, Inc. or its affiliates.
+ */
+
+#ifndef __ASM_READEX_H
+#define __ASM_READEX_H
+
+#define __LOAD_EX(sfx, regs...) "ldaxr" #sfx "\t" #regs
+
+#define __READ_ONCE_EX(x)						\
+({									\
+	typeof(&(x)) __x = &(x);					\
+	int atomic = 1;							\
+	union { __unqual_scalar_typeof(*__x) __val; char __c[1]; } __u;	\
+	switch (sizeof(x)) {						\
+	case 1:								\
+		asm volatile(__LOAD_EX(b, %w0, %1)			\
+			: "=r" (*(__u8 *)__u.__c)			\
+			: "Q" (*__x) : "memory");			\
+		break;							\
+	case 2:								\
+		asm volatile(__LOAD_EX(h, %w0, %1)			\
+			: "=r" (*(__u16 *)__u.__c)			\
+			: "Q" (*__x) : "memory");			\
+		break;							\
+	case 4:								\
+		asm volatile(__LOAD_EX(, %w0, %1)			\
+			: "=r" (*(__u32 *)__u.__c)			\
+			: "Q" (*__x) : "memory");			\
+		break;							\
+	case 8:								\
+		asm volatile(__LOAD_EX(, %0, %1)			\
+			: "=r" (*(__u64 *)__u.__c)			\
+			: "Q" (*__x) : "memory");			\
+		break;							\
+	default:							\
+		atomic = 0;						\
+	}								\
+	atomic ? (typeof(*__x))__u.__val : (*(volatile typeof(__x))__x);\
+})
+
+#endif
-- 
2.34.1


