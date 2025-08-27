Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B754ECA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 11:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JM7gSlpkCi+0kyKyklIFOqWTnKhlvxmA1qdlwzNde30=; b=z6k7qgCdRegRH40BXDfsyUUIAU
	aFFp7Z5LH1F6OplL4n3dv07b49tj55xtUphW1NcKpMStWL2LPUNk+M/UbymPXzKNhSRFx4gMU0fcM
	jOisyWLo9gTZ6U/2378EGVp9Wq3U+rsmKT0f+0Irg1eKUSUQibvRyni232U5Jsr2Vee9InOwqukYG
	wemc0aYuUO3jAsRxgPvSLaWFYddhEni2aTUhUs2WBMZEckMB0vilxzwHNF5Wbyc+cGOei8hfrV9H8
	w4rDEMATH4KX2aY3DEaMHO3hBtQKT7cfKOXbQiKxOogLX8QaRYNioZk50cKXsfJ7f8j8Q/B0vJ7gI
	LFx/bPxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urE0o-0000000FBYb-1Ip6;
	Wed, 27 Aug 2025 11:08:18 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urD72-0000000EzzI-0YZJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 10:10:41 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so657689b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 03:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1756289439; x=1756894239; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JM7gSlpkCi+0kyKyklIFOqWTnKhlvxmA1qdlwzNde30=;
        b=Xb/KHsgQf4s8x4NrV9LYKIQqwAO2CQ4890nSB7tLcw/hMqywlq9/7CwVFhLxhpYbd9
         K0RfcbPpLjIgItJr1Auwqk/O7fpD3Lacf53tvxsCo8G0EdSyhIZquStK8vcKRK82hQNN
         g7K9zhI3JOzsMB7+Y6pT1P5LR0B3D1adUHlSVmeBXuSdYlHKhoPyFN+bO1+sNKoPuTMj
         bWwfJkGtkK5zZvMrwk9QoMvruwwmEkaa9py/JX1MoXUZ8EzGPLFAa0Ig9hqWUj4rw8sf
         aW9m6S1AcUisGx8Z4DY54/0SObLJucv9OuzE5JwBv4Tzk9HizeOyppUbQQUN6ztGRS7j
         Ikfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756289439; x=1756894239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JM7gSlpkCi+0kyKyklIFOqWTnKhlvxmA1qdlwzNde30=;
        b=Fiw336dXz7yI2EyqAJsut22ARjhMu1vgQCdvuM5mIhKbUwmsB/r/RG9UPdRMyLv/P/
         un/Wk/xihZxMcL3xIYS/x9qgNBEjpFMZaoixCPy83UDynL6n6nzyj2/pJrAu7QCd3zdO
         MlpfJiTY4OoXcaIRbjC44L+PizUaPl4ejxUZj4yZHnhwXm/iNwtHc9Gkqm+PgLOjEVD7
         4V7HdMX5sIPYSGshf3JfvamwZvYIkhidV1f7QqvFNYI8XlV5GTgpmFJ6dhMPH9vgBH4O
         JFFKbFvfW4OjtQw9HLwLCZZP9qcu6SdFjSnFYZcWpfEoqWMwC0h9iEH0dIgSof+Jf5CI
         Bljw==
X-Forwarded-Encrypted: i=1; AJvYcCW4uzw3dkTTL5WN12f3LiWAwVLqBTEoinFWUmvWEDrArPF1sjYGbgVwYyqgjHrS2Tmc41JxPJlvgt5ci5pdE0t1@lists.infradead.org
X-Gm-Message-State: AOJu0YwSMhNBITt/OHq3DdlzbZb2oO62pb74OOc6sPOM0mm/zQqDPL8c
	/sRLmo9RHYdVmdqBdwNk5Itl4B4ss3arCFEuchHluUP7sQkc65KoCfjcbkgMKiw76uI=
X-Gm-Gg: ASbGncvhglWPxAQj3XrNS9RGgQtJt4rebMAVdyB61OaRPC+j7uk9b5iGELlAPkWvnbr
	HHOc+jpyg1otBGhprXKvcYZhiu68R1HGW7Pzpj4rBjMk6Gs+3aLyIYme9YO/wa13s5AEiQThLUQ
	pNFCIbjJjtE/ex6VM2+t1Qkdqrpx1/2YoSp7/Wmxa46ObmCx3cHpnbz4gGYZWQDsHz/ON5ANk+3
	VV3flUr0fFPh+pdKoDt7XdVSxXGRbVZulb+wS0Rq0L5W5itPat6t++abwEkivbvPsKTp8ZYCyVR
	96BVt13ZPMbQGOhvvAUHVUlq5iWZfUyxcLklZ6/tzIcVZdLP4k4U6nmWm7buSk6K+Qca2UgTbQc
	HV3wkD79OMyUtPIKpClvE10n9pgzj0zoZKbqB9ylv1YoMFXvVvCYKyzmuy+hSPA4=
X-Google-Smtp-Source: AGHT+IGdtKUBscgA9xYMmV3962XLu6gCj63wXPK/4bKpP1nVTjXzqxHi4UVk2L8ckDMtXKsc3B7ldA==
X-Received: by 2002:aa7:88c2:0:b0:771:e341:ce68 with SMTP id d2e1a72fcca58-771fc292e89mr6337778b3a.5.1756289439091;
        Wed, 27 Aug 2025 03:10:39 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.229])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401eb20dsm12813462b3a.79.2025.08.27.03.10.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 27 Aug 2025 03:10:38 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	atish.patra@linux.dev,
	anup@brainfault.org,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	catalin.marinas@arm.com,
	masahiroy@kernel.org,
	suzuki.poulose@arm.com,
	cuiyunhui@bytedance.com,
	maz@kernel.org,
	zhanjie9@hisilicon.com,
	yangyicong@hisilicon.com,
	dianders@chromium.org,
	mingo@kernel.org,
	lihuafei1@huawei.com,
	akpm@linux-foundation.org,
	jpoimboe@kernel.org,
	rppt@kernel.org,
	kees@kernel.org,
	thomas.weissschuh@linutronix.de
Subject: [PATCH 2/2] riscv: add HARDLOCKUP_DETECTOR_PERF support
Date: Wed, 27 Aug 2025 18:09:59 +0800
Message-Id: <20250827100959.83023-3-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20250827100959.83023-1-cuiyunhui@bytedance.com>
References: <20250827100959.83023-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_031040_187749_5AFF4363 
X-CRM114-Status: GOOD (  11.98  )
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

Reuse watchdog_hld.c to enable HARDLOCKUP_DETECTOR_PERF and
add Kconfig selections for RISC-V.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/Kconfig           | 3 +++
 drivers/perf/riscv_pmu_sbi.c | 8 ++++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 451eb23d86c96..214b1ead5781a 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -184,6 +184,9 @@ config RISCV
 	select HAVE_PAGE_SIZE_4KB
 	select HAVE_PCI
 	select HAVE_PERF_EVENTS
+	select PERF_EVENTS
+	select HAVE_PERF_EVENTS_NMI if RISCV_SSE && RISCV_PMU_SSE
+	select HAVE_HARDLOCKUP_DETECTOR_PERF if PERF_EVENTS && HAVE_PERF_EVENTS_NMI
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
 	select HAVE_POSIX_CPU_TIMERS_TASK_WORK
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 8c1ac7985df6c..c5423a046d016 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -22,6 +22,7 @@
 #include <linux/sched/clock.h>
 #include <linux/soc/andes/irq.h>
 #include <linux/workqueue.h>
+#include <linux/nmi.h>
 
 #include <asm/errata_list.h>
 #include <asm/sbi.h>
@@ -1102,6 +1103,11 @@ static int pmu_sbi_setup_sse(struct riscv_pmu *pmu)
 }
 #endif
 
+bool arch_pmu_irq_is_nmi(void)
+{
+	return IS_ENABLED(CONFIG_RISCV_PMU_SSE);
+}
+
 static int pmu_sbi_starting_cpu(unsigned int cpu, struct hlist_node *node)
 {
 	struct riscv_pmu *pmu = hlist_entry_safe(node, struct riscv_pmu, node);
@@ -1525,6 +1531,8 @@ static int __init pmu_sbi_devinit(void)
 	/* Notify legacy implementation that SBI pmu is available*/
 	riscv_pmu_legacy_skip_init();
 
+	lockup_detector_retry_init();
+
 	return ret;
 }
 device_initcall(pmu_sbi_devinit)
-- 
2.39.5


