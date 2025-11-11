Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB2CCCCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 07:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dOOlaVy/20CIon+tjXLAyji+6ZbQKD+NsElw/LVQ6M4=; b=HeY175p+iFOUV6xqExZ9vS9+pA
	Tikxoiyby4JTisP4qiJtYxz3Ayokn0R1FhBqYlw1nqBzfICNpHflYe+XSNUUxKlK35RaUU/4bO0B2
	Plrs7XLx4TUJIY8JlRg4ooAYuAT3VRm8RdPGPUV0n24xESLlo923xnaZYQldj7p6ioSHhjiRcGjVJ
	N0HTefFVCaOw9sfQdSAmiNRbF4nX7T4cxUdN0u4+QzecK7P7lwK3hZAW5Kloxv88ZrGMxGptht34t
	rsFgfxWxezMEgayOLO+wsJ31JxYpV8Sv0BC3vqVcqewkRyECLAgULuQBO1jN9Bip9jrH0YIXdOOfW
	FFo6x7sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIiul-00000006hBg-1qCD;
	Tue, 11 Nov 2025 07:35:43 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIiui-00000006h9U-0Y3c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 07:35:41 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3436a97f092so3711736a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 23:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1762846539; x=1763451339; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dOOlaVy/20CIon+tjXLAyji+6ZbQKD+NsElw/LVQ6M4=;
        b=UJQArEHbMd6lTMRc2GFYyodNFEKkp8UUqHzCg72/X8ntyKTYEfCx03zmz75MXBGhMq
         QsIZ04RpooLR9MQVnviulpPjw6Q3CtRrnAc5Ry1jlFFHPV0VFo9h4EFyZ6sKzRTGzsA3
         JL29eO9fyGRgSC5aDjbNs/TDT/bupgrTOWZDBu8CBz9yQO/CQn8/0EawKO23J/8q6NKo
         3Gs6cGEYH8TPpHNc1Rzib1jqMDQP0xrh19+rRdDQxe+102quElE8op94+eaFdYJRj61K
         5uopPwBpYta2O0J1oGRHYUHZKV9OGJ/7sOMf1rQehhXJjDDGLvnV/PErFW2S00ftb5eH
         blDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762846539; x=1763451339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dOOlaVy/20CIon+tjXLAyji+6ZbQKD+NsElw/LVQ6M4=;
        b=ibBbZ1iUTB1G1MwzDqAOQ96urakN+754j+wkHfGN/9Q7w1jlrwygm56S3KGsxfYWqj
         ish19oekhBsgK+av6XdFAVQskr12e/SSkTlAovrcq86s1WuMtuzmyRvnq9ku/y2gLf/7
         2Ej5wC6t4SugtZMGUhNcbFfONJKc8dAtLSecMr02rPcEt8gBYlT0gB3AgES6HqwL3XAl
         DM/4859uLHqqUMRGYliR+ml3oZBQluzMbe2xFfOcsX0mHzqaQCEydrNGBoQUQnjMXwUy
         qpUKMfC1gbQ4WnXJhmGTHtjBfTJedSt6xXiqnIghcHJfoeigmhTZUIAWCjQj6oEEDVDG
         5cOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZNPBZDOYA9b1eEj+eym3zz022bsIR8jol65aEi3RGO/kVEdaQwq6BhD8YcXhNkEvMJHi2Ixy09y9BY9OlQ3sr@lists.infradead.org
X-Gm-Message-State: AOJu0YxDBaRZ7dCxvRtEKHourpoeZPMQcbzIvOKH6w603YdwsBwAMr7q
	1yTdJvlb4xhEW1Zk4Ed59w8Ut/RJ2uYR8qJwJclc9sYsAPRB0/ciGmyxOsrZbm1Gldk=
X-Gm-Gg: ASbGnct2mxCr7jiPRp0RL4FyXbJLI/HifnpQ4yUL8D67kIh+M1pNKmngJYvVau+I3rD
	opqDjyLAIboien7jWzJlI0bhF628+13f560N41R1cYCscacdb9g5pp3yfGklKlp3LrG9aLsROXv
	Rqc16bKw64dCBDz3/UPDlmt1I41MrhQVlTfKDB324IKecrVf1kVSZ2Bo56P3ZRl8Z2QqBJZ1hmY
	w0Swo4DT/b/1NAUqGlsgASqHRa2AKCLDM+w643BBNy76Z+AXPfMSCAKQPQTX31hp8D7TZbJS8vi
	ltkm0dd6sjDy372RGW7eWC1zYFhbiu6+zU2099PepBm+mSNxgbEPgCCIIEJ82M7INkgabJpdVEH
	hx3QSRFp0hKfgaFX5RnWI/Q2/m3ikfh3w1ZzJE6hgX4O/MIn6dyQ8n2UDKQws5CbdyWEGaAtXfv
	vMBwC1O+oJJtuhGyuK6Aum1mehv1CZmojlN374W+/Uww==
X-Google-Smtp-Source: AGHT+IEUw+72YJMnHDr6LbdwL+uWXqhzBDVKr1Hy8+90WDm/+ZatB8gHaR6Ah1I0Nw0KhXzjZnlq6Q==
X-Received: by 2002:a17:902:e545:b0:26a:8171:dafa with SMTP id d9443c01a7336-297e564cef9mr165530405ad.21.1762846539211;
        Mon, 10 Nov 2025 23:35:39 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.12])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c94abasm172928885ad.82.2025.11.10.23.35.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 10 Nov 2025 23:35:38 -0800 (PST)
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
Cc: Paul Walmsley <pjw@kernel.org>
Subject: [PATCH v5 2/2] riscv: add HARDLOCKUP_DETECTOR_PERF support
Date: Tue, 11 Nov 2025 15:34:59 +0800
Message-Id: <20251111073459.44030-3-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20251111073459.44030-1-cuiyunhui@bytedance.com>
References: <20251111073459.44030-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_233540_169965_C107528D 
X-CRM114-Status: GOOD (  11.57  )
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
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Acked-by: Paul Walmsley <pjw@kernel.org>
---
 arch/riscv/Kconfig           |  3 +++
 drivers/perf/riscv_pmu_sbi.c | 10 ++++++++++
 2 files changed, 13 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index fadec20b87a8e..74835cdc89ddf 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -186,6 +186,9 @@ config RISCV
 	select HAVE_PAGE_SIZE_4KB
 	select HAVE_PCI
 	select HAVE_PERF_EVENTS
+	select HAVE_PERF_EVENTS_NMI if RISCV_PMU_SBI_SSE
+	select HAVE_HARDLOCKUP_DETECTOR_PERF if PERF_EVENTS && HAVE_PERF_EVENTS_NMI
+	select WATCHDOG_PERF_ADJUST_PERIOD if HARDLOCKUP_DETECTOR_PERF && CPU_FREQ
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


