Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D5BCFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 12:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6gRHgAms/qw186HwaqxgpMtPx5WpCFvQohfxW5cnU8g=; b=vOqBaQH3mp7jvaYhb6rQsfKW6P
	g3YHtteXLrMB2xaLSSIcyKiDJcuK8kmY/O42Oa+ylgZtz+rzJEtVl3AmLG1r1EMPNKRm6yWG7YwNl
	LSPOAvBgPy5/L3UypGzK/MT/1f0qc/RrH0BAnFCc8R1YCIo7C6Hn2YE0V44I3lm37F/3Mm4zT6f0m
	mSlhHSCoHWoFkLG9ryBWJm4T64VVRSx6vU/BKHE0VmMziTVChRfV8YIYBn/s6J9x6rrHeiaZOukhi
	g/m0czGpknWhOBFUAXT5/uVvfBLzdY0vNlwB4glMAXMyLorOAyxKHg5QBVyAl2pTPPcild1dI+QLm
	3MSCRJxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vObV4-0000000GbG2-3QWR;
	Thu, 27 Nov 2025 12:53:30 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vObV2-0000000GbEd-196t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 12:53:29 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2984dfae043so7341165ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 04:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1764248007; x=1764852807; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6gRHgAms/qw186HwaqxgpMtPx5WpCFvQohfxW5cnU8g=;
        b=QH8C7Q+R1Qb6XbXOx3A9TIn+k7cXmg3WnaZFdzXLeLgzEg14qcqkLS5xdaVmgkuU6/
         uqNn7IljVy9ZOhXdf7j0h//C1fU2nJhcASGO3Srd8xn+ckdIw5XQ8jN+OncMfN3RCkIV
         eO3UdMfXc7T1xovicvF4T9y6kba48CYXjJwx1UUgz5BhSkpuUoPJhS0A+9Xx6tjUAbGL
         /9dWG1YYLE/d5Yf8OVnsqfdupnjJ/rhtoKT4atD4yBjRf+okmsfvqEu+Fwt8DzqAsk7Z
         Cjsbx3vfx1SpiHWs8Xg88AZVZYEj5kChaAPnIEbQwJYd8NMdjg5evaWTFyXmzb8RJZqJ
         nFzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764248007; x=1764852807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6gRHgAms/qw186HwaqxgpMtPx5WpCFvQohfxW5cnU8g=;
        b=lcQqnqpkpkVjNbNHH3ZD1m0AMkDRXNvGpx0kHC3zjAcR+HpkqEcKNeYyZmqaXlPI8e
         fLatNJTcpRH10i45HrQ7HZ5c9UzdxYXsyfn1pfoHTLA8HNfjN74xzpYDZxPL9uTQKzwl
         3Tj2tPJg7Bf97Wn8ZoSlmWGEUzDW/rF0i9xCXlIZeqovai4yuPYAEl25abwU1Rzt9c5a
         IlCLsAFSRkmtjnc/uCsA3XM452wpey8/cBfpOPoYAOavjA5WXvCUAnYNZArJUq7Ttr/B
         RVjdanZfcOuC6pH5jZXUjJxJmnWQKrQPkEqgedc5eugEO6/yekSZGRPlCeazL/vbj4EZ
         zXbg==
X-Forwarded-Encrypted: i=1; AJvYcCUdwHfOj09IOQYkFodS7fybcssd5XEuwwAGA643UMFuK49zeCNpnvTfAOEH9QBo0yUZoTNXlXdOgPeSfMHm+Q2/@lists.infradead.org
X-Gm-Message-State: AOJu0YwSyJeoWAm8uTNIuqYhjH/thbE4et0x8EwlEgyJe8oRTABVDrP1
	z3myy52s7joNfzqnPgYjtuxvxbiGaJC9jlQuo8sl+C+toDFOnPFtsQBbhn8yHu1/JcA=
X-Gm-Gg: ASbGncti8gZCSD+BNec7QHoHmudFh5WTrbDVfKlcaiHjYML5LR2ZHClmhN2tBvnUnzq
	eLctz5APMZTYzwWziBYzp+i7dieEQ99l7VIPNlflf8u/IpqsoeaEaVs6c+Mq0hn7b587rgpdwTH
	CTLhFPmYDqUgSmwLTgHqRodeDxDkWc/FDpsAlXg2aKIAOAc4ZE0tNTQYRIzX0kqvjTQAkwC0Gd0
	b20mVri4rt/qt/9O65UDG2KoAp/gbNWqLYiEpTnCvH/FUMePm86mLjVrdIhPAexH+t77a56Y/S1
	BzQrpKVix3EI0ll2zqcd3y/w9FaAhAhH8Hm1grfORA+vDeC62iZzqq2mD4OTQVnXLmmt6edpgqH
	ZH7adzpNGE4tt+axj3vLLDabxu7/+3CuAmvh+xAN2ziPFiHHrHe1kPdlqpq9c7v2hr+BqK9sWwl
	z0FjB5UnInSrjn5IM1585AGDEzh784zBMSY5uCEXm1zCP3
X-Google-Smtp-Source: AGHT+IElrZeX9ue0soNAe3UvXw/hxq6Df/QcKBQE4mLLMStE8fECsay5d0GzZrwvfFYo76l7k0B4dQ==
X-Received: by 2002:a17:903:3c68:b0:295:7806:1d64 with SMTP id d9443c01a7336-29b6c50afa1mr268547755ad.25.1764248007302;
        Thu, 27 Nov 2025 04:53:27 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce470347sm17771255ad.41.2025.11.27.04.53.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 27 Nov 2025 04:53:26 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: conor@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	cuiyunhui@bytedance.com,
	luxu.kernel@bytedance.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	jassisinghbrar@gmail.com,
	conor.dooley@microchip.com,
	valentina.fernandezalanis@microchip.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	maz@kernel.org,
	timothy.hayes@arm.com,
	lpieralisi@kernel.org,
	arnd@arndb.de,
	kees@kernel.org,
	tglx@linutronix.de,
	viresh.kumar@linaro.org,
	boqun.feng@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	cleger@rivosinc.com,
	atishp@rivosinc.com,
	ajones@ventanamicro.com
Subject: [PATCH v3 1/8] drivers: firmware: riscv: add SSE NMI support
Date: Thu, 27 Nov 2025 20:52:58 +0800
Message-Id: <20251127125305.89961-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20251127125305.89961-1-cuiyunhui@bytedance.com>
References: <20251127125305.89961-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_045328_397120_05CFD903 
X-CRM114-Status: GOOD (  18.88  )
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

Add support for handling Non-Maskable Interrupts (NMIs) through the
RISC-V Supervisor Software Events (SSE) framework. Add basic NMI
functionality via SBI_SSE_EVENT_LOCAL_SOFTWARE_INJECTED registration
and enabling.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 MAINTAINERS                            |  8 +++
 drivers/firmware/riscv/Kconfig         | 10 +++
 drivers/firmware/riscv/Makefile        |  1 +
 drivers/firmware/riscv/riscv_sse_nmi.c | 90 ++++++++++++++++++++++++++
 include/linux/riscv_sse_nmi.h          | 26 ++++++++
 5 files changed, 135 insertions(+)
 create mode 100644 drivers/firmware/riscv/riscv_sse_nmi.c
 create mode 100644 include/linux/riscv_sse_nmi.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 8bf5416953f45..c06658da8af96 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22057,6 +22057,14 @@ S:	Maintained
 F:	drivers/firmware/riscv/riscv_sse.c
 F:	include/linux/riscv_sse.h
 
+RISC-V SSE NMI SUPPORT
+M:	Yunhui Cui <cuiyunhui@bytedance.com>
+R:	Xu Lu <luxu.kernel@bytedance.com>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	drivers/firmware/riscv/riscv_sse_nmi.c
+F:	include/linux/riscv_sse_nmi.h
+
 RISC-V THEAD SoC SUPPORT
 M:	Drew Fustini <fustini@kernel.org>
 M:	Guo Ren <guoren@kernel.org>
diff --git a/drivers/firmware/riscv/Kconfig b/drivers/firmware/riscv/Kconfig
index ed5b663ac5f91..6c77c7823571a 100644
--- a/drivers/firmware/riscv/Kconfig
+++ b/drivers/firmware/riscv/Kconfig
@@ -12,4 +12,14 @@ config RISCV_SBI_SSE
 	  this option provides support to register callbacks on specific SSE
 	  events.
 
+config RISCV_SSE_NMI
+	bool "Enable SBI Supervisor Software Events NMI support"
+	depends on RISCV_SBI_SSE && SMP
+	default y
+	help
+	  This option enables support for delivering Non-Maskable Interrupt
+	  (NMI) notifications through the Supervisor Software Events (SSE)
+	  framework. When enabled, the system can deliver local, unknown and
+	  other types of NMIs.
+
 endmenu
diff --git a/drivers/firmware/riscv/Makefile b/drivers/firmware/riscv/Makefile
index c8795d4bbb2ea..fbc182b53ae53 100644
--- a/drivers/firmware/riscv/Makefile
+++ b/drivers/firmware/riscv/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_RISCV_SBI_SSE)		+= riscv_sbi_sse.o
+obj-$(CONFIG_RISCV_SSE_NMI)		+= riscv_sse_nmi.o
diff --git a/drivers/firmware/riscv/riscv_sse_nmi.c b/drivers/firmware/riscv/riscv_sse_nmi.c
new file mode 100644
index 0000000000000..752ee88b230da
--- /dev/null
+++ b/drivers/firmware/riscv/riscv_sse_nmi.c
@@ -0,0 +1,90 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#define pr_fmt(fmt) "SSE NMI: " fmt
+
+#include <linux/atomic.h>
+#include <linux/riscv_sbi_sse.h>
+#include <linux/riscv_sse_nmi.h>
+
+#include <asm/irq_regs.h>
+#include <asm/sbi.h>
+#include <asm/smp.h>
+
+static bool nmi_available;
+static struct sse_event *local_nmi_evt;
+static DEFINE_PER_CPU(atomic_t, local_nmi) = ATOMIC_INIT(LOCAL_NMI_NONE);
+
+bool nmi_support(void)
+{
+	return READ_ONCE(nmi_available);
+}
+
+static inline struct sbiret sbi_sse_ecall(int fid, unsigned long arg0,
+					  unsigned long arg1)
+{
+	return sbi_ecall(SBI_EXT_SSE, fid, arg0, arg1, 0, 0, 0, 0);
+}
+
+void send_nmi_single(unsigned int cpu, enum local_nmi_type type)
+{
+	unsigned int hart_id = cpuid_to_hartid_map(cpu);
+	u32 evt = SBI_SSE_EVENT_LOCAL_SOFTWARE_INJECTED;
+	struct sbiret ret;
+
+	atomic_or(type, per_cpu_ptr(&local_nmi, cpu));
+
+	ret = sbi_sse_ecall(SBI_SSE_EVENT_INJECT, evt, hart_id);
+	if (ret.error)
+		pr_err("Failed to signal event %x to hartid %d, error %ld\n",
+		       evt, hart_id, ret.error);
+}
+
+void send_nmi_mask(cpumask_t *mask, enum local_nmi_type type)
+{
+	unsigned int cpu;
+
+	for_each_cpu(cpu, mask)
+		send_nmi_single(cpu, type);
+}
+
+static int local_nmi_handler(u32 evt, void *arg, struct pt_regs *regs)
+{
+	return 0;
+}
+
+static int __init local_nmi_init(void)
+{
+	int ret;
+
+	local_nmi_evt = sse_event_register(SBI_SSE_EVENT_LOCAL_SOFTWARE_INJECTED, 0,
+					   local_nmi_handler, NULL);
+	if (IS_ERR(local_nmi_evt))
+		return PTR_ERR(local_nmi_evt);
+
+	ret = sse_event_enable(local_nmi_evt);
+	if (ret) {
+		sse_event_unregister(local_nmi_evt);
+		return ret;
+	}
+
+	pr_info("Using SSE for Local NMI event delivery\n");
+
+	return 0;
+}
+
+static int __init sse_nmi_init(void)
+{
+	int ret;
+
+	ret = local_nmi_init();
+	if (ret) {
+		pr_err("Local_nmi_init failed with error %d\n", ret);
+		return ret;
+	}
+
+	WRITE_ONCE(nmi_available, true);
+
+	return 0;
+}
+
+late_initcall(sse_nmi_init);
diff --git a/include/linux/riscv_sse_nmi.h b/include/linux/riscv_sse_nmi.h
new file mode 100644
index 0000000000000..16db85c5162f5
--- /dev/null
+++ b/include/linux/riscv_sse_nmi.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#ifndef __LINUX_RISCV_SSE_NMI_H
+#define __LINUX_RISCV_SSE_NMI_H
+
+#include <linux/cpumask.h>
+
+enum local_nmi_type {
+	LOCAL_NMI_NONE		= 0U,
+	LOCAL_NMI_STOP		= BIT(0),
+	LOCAL_NMI_CRASH		= BIT(1),
+	LOCAL_NMI_BACKTRACE	= BIT(2),
+	LOCAL_NMI_KGDB		= BIT(3),
+};
+
+#ifdef CONFIG_RISCV_SSE_NMI
+bool nmi_support(void);
+void send_nmi_mask(cpumask_t *mask, enum local_nmi_type type);
+void send_nmi_single(unsigned int cpu, enum local_nmi_type type);
+#else
+static inline bool nmi_support(void) { return false; }
+static inline void send_nmi_mask(cpumask_t *mask) { };
+static inline void send_nmi_single(unsigned int cpu) { };
+#endif
+
+#endif
-- 
2.39.5


