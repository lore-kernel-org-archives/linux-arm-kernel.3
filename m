Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E84CD11183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 12:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ekEUQQGglKUm+pQmuNFUFd1vkJX+rIRh1mBD2DC3QW8=; b=V0BBliSDWiM+i1mYOXVUXqbFGm
	02vRD9YK6Ttvs3JOrFTcAtXe+au+MIEuuIaNHePdApWcRGEyfqX4NkAiAWcjqaj3oBcMxF/EL7HhA
	ZMlpfVnVMJDsC0BBrYnLW/ttlET8o/AKR3HkE6Yd6vrdFB2ySYAfbRmvzGeirV4KDwAFFr/rpRUlx
	N6FUz5yjBlrUP/sHGvyWkxslH8oG1HI5RjIBErkktqZq39TyK8oEeg/EG0PattT3qn0KBB2KBZYal
	PEbdCfDBscm0qQ1XcOTXfFkzhVmJu3+DjHGLBAdw0mgzSa1T5mhPsTEtBuoaTY3oboiNScxIeSbzk
	t4xStMjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vObVU-0000000GbZ0-0ptm;
	Thu, 27 Nov 2025 12:53:56 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vObVQ-0000000GbVq-45s5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 12:53:55 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-298145fe27eso13687625ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 04:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1764248032; x=1764852832; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ekEUQQGglKUm+pQmuNFUFd1vkJX+rIRh1mBD2DC3QW8=;
        b=J7yuUJ7QQSVO8DnWZwLFGtDTpWoUXLbL+kD+aEPVnJQiyHkkvc0KIESMHP3PzwTE1b
         X4a6v8pF6AZCKxmJd8TkGZXmnEZ5k/x5FkWtKZmo+6Ck9G+tRfgdR32ZvEYUAm6dN8my
         HqUqsxIK8gfOidH2XhtC8zG2/pNl8sRQve8+p6ZOgf4gB+yNgD62SPybIGiMapQ+0HjH
         SZqMdioGMCig2EIUG+RHU2Kij/JHGf9lBJH7ywQE4Zhgl4D63Vx5RX6nuG92zy9b9hZp
         jjlagMeBwpAja8angAgsgEYGJaDRu76uoVchW2ZsnZBnmkckcHUB8oQy1sbNx84wUgbU
         kbsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764248032; x=1764852832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ekEUQQGglKUm+pQmuNFUFd1vkJX+rIRh1mBD2DC3QW8=;
        b=m3XJqJbBAYdL2tZo7YNNfHVzZDFGuXTZRFstl5l5YcJQr67dgCnIqPAKi59QicK47y
         euYDblcijyRfRT2EesLHil+4yp+GpOQ0pzI/gr9PcEFu5hWdplFQGXFLH+TmR3n0Nt8g
         qs91ZeGPJPOyAFBuzIFrfhfIqCdX+v8fDNadwS9H+v2/OIP7TxCB4becf/3cD+mBAw6I
         176ZRaMY6j5LunRPPFbyfbZuH9F6r5H6XKqWjc9+N92l8+Nr7c1AgSrR4b5cmCTt9ERM
         tfw7kK/fSXOXIEQykDV5IMBUyNuW180TXE+X0xdjrrEWCfIpcDsMpKT2eL+u/WbXEy7k
         tPnA==
X-Forwarded-Encrypted: i=1; AJvYcCUINnDaPOwTj6am5Es/UibPFf9cS3Gbd1tkIZ3wu4T2VPW/KO0blr1DDWC9Gr6wKk9jo7T9EKfGy7iHMorljP45@lists.infradead.org
X-Gm-Message-State: AOJu0YzoJZBZVpzNtBf5ZfIUyle+XBooSiv6RABkfMa42s21bcicEY1H
	h6KDsUdQiCbTsPRlL56vFO4xVx3KH1VcDHlxa5/ZD62CcAkOeO1OwhILOklAXUWxDGk=
X-Gm-Gg: ASbGncsi7fXn3IEEz9ZGd00jfzKvGZ6x68UJcXB4WwOgrUOK3QZgwukXYAskQGcpolr
	Tbcm1D7McDfcZs0LfWsEhTlVRB5/nJ6j0f4HOy8ODQ/Fn6aCbabmDo1Gc4OpcJH/0OTs/b6rnYz
	Ldu76GpAPQJkC/ohC0gdz+hHqvGMi5kSkDHvcQa8BCqfOhsEhLXrmqYbCIxoP6HyzmXbv/+RGdu
	vtX4nAfrhLFGSHFAlN1Izuzt06k/vZ3MLO3Hx3M8JJs8I3TeJtWBqtOJvRq91ckrz8h0nwudOGE
	SwAsf/8rPr4lWkS/ykjgxxgV8NvdidFqcLc3Mca3t8huRoV8knTe/1z4CK1SdYEQ0kVifQyJa6U
	b/C/bv3EkeCJ57xxECHAH+a7rm6DeRterZb0nRrj3bObdF3YuFiNQSG7bGyBTE+Hki5er3ToNf+
	OHx5s1SuUjNulBxVqsp8qmuZq+dqkXFZNY0UVoYkzzIRYX
X-Google-Smtp-Source: AGHT+IGkFjWMbmIGHNf6UcjgbW4i6Qoh9WFvC99RcWljyWTEaWXbPXGfrJnhhVQpJadpguwolGNYMg==
X-Received: by 2002:a17:902:c44a:b0:295:34ba:7afa with SMTP id d9443c01a7336-29bab19b21emr77811615ad.43.1764248031954;
        Thu, 27 Nov 2025 04:53:51 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce470347sm17771255ad.41.2025.11.27.04.53.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 27 Nov 2025 04:53:51 -0800 (PST)
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
Subject: [PATCH v3 4/8] riscv: smp: use NMI for crash stop
Date: Thu, 27 Nov 2025 20:53:01 +0800
Message-Id: <20251127125305.89961-5-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20251127125305.89961-1-cuiyunhui@bytedance.com>
References: <20251127125305.89961-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_045353_041633_F5F5F0A3 
X-CRM114-Status: GOOD (  13.20  )
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

Use NMI instead of IPI for crash stop if RISC-V SSE NMI is supported.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/kernel/smp.c                | 11 ++++++++++-
 drivers/firmware/riscv/riscv_sse_nmi.c | 12 ++++++++++++
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 669325e68a21a..1b8cf986abbd0 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -16,6 +16,7 @@
 #include <linux/kgdb.h>
 #include <linux/percpu.h>
 #include <linux/profile.h>
+#include <linux/riscv_sse_nmi.h>
 #include <linux/smp.h>
 #include <linux/sched.h>
 #include <linux/seq_file.h>
@@ -300,7 +301,15 @@ void crash_smp_send_stop(void)
 	atomic_set(&waiting_for_crash_ipi, num_other_online_cpus());
 
 	pr_crit("SMP: stopping secondary CPUs\n");
-	send_ipi_mask(&mask, IPI_CPU_CRASH_STOP);
+
+	/*
+	 * Not a high frequency operation and is in final state, directly use
+	 * NMI instead of IPI to ensure reliability.
+	 */
+	if (!nmi_support())
+		send_ipi_mask(&mask, IPI_CPU_CRASH_STOP);
+	else
+		send_nmi_mask(&mask, LOCAL_NMI_CRASH);
 
 	/* Wait up to one second for other CPUs to stop */
 	timeout = USEC_PER_SEC;
diff --git a/drivers/firmware/riscv/riscv_sse_nmi.c b/drivers/firmware/riscv/riscv_sse_nmi.c
index 752ee88b230da..add028efd25a0 100644
--- a/drivers/firmware/riscv/riscv_sse_nmi.c
+++ b/drivers/firmware/riscv/riscv_sse_nmi.c
@@ -10,6 +10,9 @@
 #include <asm/sbi.h>
 #include <asm/smp.h>
 
+#define NMI_HANDLE(mask, func, ...) \
+	do { if (type & (mask)) func(__VA_ARGS__); } while (0)
+
 static bool nmi_available;
 static struct sse_event *local_nmi_evt;
 static DEFINE_PER_CPU(atomic_t, local_nmi) = ATOMIC_INIT(LOCAL_NMI_NONE);
@@ -49,6 +52,15 @@ void send_nmi_mask(cpumask_t *mask, enum local_nmi_type type)
 
 static int local_nmi_handler(u32 evt, void *arg, struct pt_regs *regs)
 {
+	enum local_nmi_type type;
+	unsigned int cpu = smp_processor_id();
+
+	type = atomic_read(this_cpu_ptr(&local_nmi));
+
+	NMI_HANDLE(LOCAL_NMI_CRASH, cpu_crash_stop, cpu, regs);
+
+	atomic_andnot(type, this_cpu_ptr(&local_nmi));
+
 	return 0;
 }
 
-- 
2.39.5


