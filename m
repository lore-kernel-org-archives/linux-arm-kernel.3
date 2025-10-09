Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D9FACAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 03:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jnXMECOikkNGPVLHGk2/W+70TGvv+oQ3PJ6DV32z1EM=; b=xLamleNETEwsPXawDszzLldOJ/
	lwOdjjd0xYqD+IhLLBPnVZTLHBcJg/4dh9gXEiIuIBEwmcvMAcd7wG3k20uMGsQ4XYiikE/Llr9ot
	/DEzxeaP3s/6I/T0d2yDyUAunJIDx+s6CpbJA9sPsptPZHAdS5xIp4H8d5NhovAVEEzss8iZeSKRp
	D6dHBYli5rQSv4AKl4WxxvRe89YZtszjBokK03eiMB6KEORPw6mna4XyN97YxYhJhR/9iDBNDqdtd
	+gNJsX/uZMkFnLLhu3lQVZ3QobugdtpTkJj6/u1LTCcYbIVAYZ39u5IH2t+dOG8SEkG7zSKRHKXi6
	GH6IXptg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6hLe-0000000568W-0JyF;
	Thu, 09 Oct 2025 03:29:46 +0000
Received: from mail-pf1-f177.google.com ([209.85.210.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6hLb-0000000567H-1aVz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 03:29:44 +0000
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-781001e3846so472857b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 20:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1759980582; x=1760585382; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jnXMECOikkNGPVLHGk2/W+70TGvv+oQ3PJ6DV32z1EM=;
        b=I5H0tXhb/hDmxE/YHhD2DjHmz+lPfVKqA/NSWC0Ot7XLiuOP/i5p0AoMBqex8MU9Vs
         wnOg/d4+ByBKeWZofzkQQ4KrkUZbsFXJ57iGvav9ld2nEhW0AJd0zZUeOwxh0vVk1hmw
         T4U7TGJ/fNbuzpxlevLiyB6R0FtDW+LYJQvASXIle2aUG7pkgx0SScuP3YyAWF25LKKR
         JeHHpXKs1NSCclysmsk/LFValNMh2O05IskHT4gtB7FOjkU+qyekeb2ASPiYxPErTaK8
         fcm3q8q7BsEPnqlAJWG5TtnaJrbEF7hDOPFWYW5m6OuibQCreFvj+NmESBF1Z6/1uPcU
         X0wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759980582; x=1760585382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jnXMECOikkNGPVLHGk2/W+70TGvv+oQ3PJ6DV32z1EM=;
        b=eUAYhGqcjriQUPHD8gxhPFlwW8i0JfhzW8UCtOdTUdjZj81sAZbjdN705BGy+FN6Tk
         YxYZbhsAii6XIlW04XsClMWYY2yGjFW4/286eCNEiYf2O+rfJraQZSZTaRN3Z8RYXsD3
         h5RVA5d/NeJXMU9D5frZJGQTtKKG/2N6qS6h1+hsUHZ/x5+S6ajHyL2X4DEu0SRL4bwp
         iuy9RtJ/amAP0imzF/3gbU01oPx7hgzipDPCHZKpwN+U/jPt+Hu0Q5muRm/7kyALdZwS
         XuUW56VlrZdCxlVoAgFgA2AC7Tn0gwIRDivEQ1nP91PCLqH4WPQMgglw0HEMDVK7J96k
         8wLg==
X-Forwarded-Encrypted: i=1; AJvYcCVeKPyx/Dh8NcNtg6GG+tmXJfFcvWks8JL4g2pRXg8P5qWr2VfXoatzdxLE+NzcNxHBWGxF3b99TJSob7ruwdS0@lists.infradead.org
X-Gm-Message-State: AOJu0Yxn2MvO58cx4ucnwuFDKhpLMatoHwga/USXXVVlWz3i7M17xRZ9
	+Swi33DkVrjMOhUIlr9kax+phbB1KjfXKuXG+xqiC3skxFgfzPEjr2uxEhfFSihPEY0=
X-Gm-Gg: ASbGnctGLXJ2PhcogfsSnuCywtEa5ZwuT7Zu5LCmxyXjUaRdQCjyYJw5A2iUBsu/zuy
	55xU6LGetpL1yJbX4TWxXkV7LLd0z28gG1NoogIjouPlV2KzBcd5LApkeRIyw2J8Mb1T3ujw37V
	zLpnc5Eyr2vPxFVa/nJUxWSPl9/N4Ju40s1WDRr24cHFH9jr9f9ai2pXiFN1K5Z+P3I1RDjOdYX
	FqiPt91QdI6vmLLcCJMG8bG7C6C74IehOc/w5Vx0mqnObkY7Xh6Pche0epTkutKD+BzaXPd1kFX
	1mMheBntPaZmK4UvenNByANnACB8sCUJR5cj5ONqloNk05SbEkEisD0sZ0r6TgQRKpHOI0x5jDO
	2VsqlaMkmWHu4IgL6TpMWNq1+ITBiH7gThlczO2x3MYSlu79CquXrZIeDEgumeeqGGqw04YhIJS
	2cu4BlvGLbJwQ=
X-Google-Smtp-Source: AGHT+IHbZEm5frc8fvTXu54yWtTCugs4CwZJHmN7TKBRMpR5Iwopkp0MBjhRhFZXa74I0jkchu8wVA==
X-Received: by 2002:a05:6a00:3cca:b0:77e:9ae8:c7d0 with SMTP id d2e1a72fcca58-79384f48886mr7305182b3a.1.1759980582231;
        Wed, 08 Oct 2025 20:29:42 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.226])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-794d4b39400sm1271306b3a.15.2025.10.08.20.29.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 08 Oct 2025 20:29:41 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: akpm@linux-foundation.org,
	alex@ghiti.fr,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	catalin.marinas@arm.com,
	cuiyunhui@bytedance.com,
	dianders@chromium.org,
	johannes@sipsolutions.net,
	lihuafei1@huawei.com,
	mark.rutland@arm.com,
	masahiroy@kernel.org,
	maz@kernel.org,
	mingo@kernel.org,
	nicolas.schier@linux.dev,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	suzuki.poulose@arm.com,
	thorsten.blum@linux.dev,
	wangjinchao600@gmail.com,
	will@kernel.org,
	yangyicong@hisilicon.com,
	zhanjie9@hisilicon.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 2/2] riscv: add HARDLOCKUP_DETECTOR_PERF support
Date: Thu,  9 Oct 2025 11:28:38 +0800
Message-Id: <20251009032838.63060-3-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20251009032838.63060-1-cuiyunhui@bytedance.com>
References: <20251009032838.63060-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_202943_416716_FCA38B50 
X-CRM114-Status: GOOD (  11.64  )
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

Enable the HARDLOCKUP_DETECTOR_PERF function based on RISC-V SSE.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/Kconfig           |  4 ++++
 drivers/perf/riscv_pmu_sbi.c | 10 ++++++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index badbb2b366946..6a7b4d2517c4b 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -186,6 +186,10 @@ config RISCV
 	select HAVE_PAGE_SIZE_4KB
 	select HAVE_PCI
 	select HAVE_PERF_EVENTS
+	select HAVE_PERF_EVENTS_NMI if RISCV_PMU_SBI_SSE
+	select HAVE_HARDLOCKUP_DETECTOR_PERF if PERF_EVENTS && HAVE_PERF_EVENTS_NMI
+	select WATCHDOG_PERF_ADJUST_PERIOD if HARDLOCKUP_DETECTOR_PERF && \
+	CPU_FREQ
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
 	select HAVE_POSIX_CPU_TIMERS_TASK_WORK
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index c852f64a50221..0c7c5924687c9 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -22,6 +22,7 @@
 #include <linux/sched/clock.h>
 #include <linux/soc/andes/irq.h>
 #include <linux/workqueue.h>
+#include <linux/nmi.h>
 
 #include <asm/errata_list.h>
 #include <asm/sbi.h>
@@ -1192,6 +1193,13 @@ static int pmu_sbi_setup_sse(struct riscv_pmu *pmu)
 }
 #endif
 
+#ifdef CONFIG_HARDLOCKUP_DETECTOR_PERF
+bool arch_perf_nmi_is_available(void)
+{
+	return IS_ENABLED(CONFIG_RISCV_PMU_SBI_SSE);
+}
+#endif
+
 static int pmu_sbi_starting_cpu(unsigned int cpu, struct hlist_node *node)
 {
 	struct riscv_pmu *pmu = hlist_entry_safe(node, struct riscv_pmu, node);
@@ -1618,6 +1626,8 @@ static int __init pmu_sbi_devinit(void)
 	/* Notify legacy implementation that SBI pmu is available*/
 	riscv_pmu_legacy_skip_init();
 
+	lockup_detector_retry_init();
+
 	return ret;
 }
 device_initcall(pmu_sbi_devinit)
-- 
2.39.5


