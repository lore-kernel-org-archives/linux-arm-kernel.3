Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C8ECCD4F49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 03:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RwoYW3TpVbjpnbuDSYglQbGQzGJdKy4yKIu8+Puv/Yk=; b=nh0z+G43JLfaVlRPuAq/sKQjcH
	/INKaEYmZDD3yROGfD92TVqpEaORJKOzT1LJSbYus2fVWHoG7GfC1Iy8nbhKYWrgUOrftSuS65Epo
	ASGZ7AjOkat7lLGITU8zj/r9iqoxFTG78mz8rgq7o/2QQgg+3yGU2gFfC8dqaLgC8e44wftkiY0nW
	DmKymhuSUIDnBWkfx5F9iXi6c9Y5DXCb4JJBjm5/TPP1ZeNw3Z47AXBSCupgJ/VI3NH4gVSEHVo8B
	9IuVmGQ8rbxDUNVjo0r9/wmSDeCkH/s9irmQ4kvDRerftdwYIWuBIabAY3mDxIblD7MA/hELTLXdI
	UWgRPrsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJkYl-0000000BU3X-2vmM;
	Fri, 14 Nov 2025 03:33:15 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJkYi-0000000BU1w-2slb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 03:33:14 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-29845b06dd2so16118405ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 19:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1763091192; x=1763695992; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RwoYW3TpVbjpnbuDSYglQbGQzGJdKy4yKIu8+Puv/Yk=;
        b=ZN18dc8tCEcEo5/eBIggG2kcydMoz6DW63WFjn4yYTjvV8X8FZu72+Hf8Gv2BX2hAw
         NlblcVHbgUzIWS9TX4BYJz0N+VppZBg54HkQvCddzecft0saLfUNMAh3uv0nXV9ckJy6
         cuLr8mLSgaDm3cRCEwq/+jhyOsG7xBdhfH1Lp/6/xLklfw+9oOz9MLrDdletOaXBqIxI
         UM6exCTqVVvRmUa42l3gddDqMEzrDvMFNTmLykHmVd8kHom4ctTaiBFjE4M7z+TWF0zX
         uHyTBCwHP4VlEUObqtNmaFKfEybGsM4oXhMsf06gR2d4CwE+AM1NrvcW0vCgrDjuXaG/
         aCXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763091192; x=1763695992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RwoYW3TpVbjpnbuDSYglQbGQzGJdKy4yKIu8+Puv/Yk=;
        b=dLnla55MV1EePybqlGpzgE0OTxIOnZVo91yfPNerTEVIsS7NeJw3getZ27qvHRfwRr
         w7uveXqjh0yyV1u2eWm48Yzk2Nx+avaK8ryNONQzzIJNzANqjHFD/AZUYYcQf3vMuO70
         6f1yZyUHff/f+jaVeFmnkCckBZYmRa/9s+LQMV1C9Dig7wiS9CS9nUndl0YlEfccecEJ
         QrNRwf7u+VeO8YS/5JaSBCzmcs1rMydCSGaxqB+fpdkNxFI1dIAEXlZJmW5vzjUWYhyC
         CpWO0WEMBeE5SFZOVzK4+5Y4JAPgDrm0QUPKC8AF3DFoYhiMfSw1hwBZFt7bTD6sLREs
         3vGw==
X-Forwarded-Encrypted: i=1; AJvYcCW+MfJg5dw+dcz0kf3ssXB+AiuRZ1D84uCg3V+HByg8+URl7h9u2yivskg47BKaQkq6aT9/V9XsVD8xeTa4m/fK@lists.infradead.org
X-Gm-Message-State: AOJu0YyM57rGClt57/FwwP4nOVt4SXk2oXhulCG7aIaipg207U1y+cMV
	1QoqVnxHcYktRBqsSwXA9T6mB+IMDON7QsJ6XznqFwRhxp/pu7tKwseN846wSVASSB4=
X-Gm-Gg: ASbGncvUJnOOxv2J0oghebh2Y4rQA0cBZsWSTgxE3mJWLHy6H+uUhBW7N2R6VRG9Y4/
	ffE1idkWfTeqq6bhNw86+6mbheDSzOvPBXMW+vAbKssPRgiRIJYiSTR5/jmtRmWuz/Tf9t4vVN7
	SXTY4EHdSn8+VlaGSn3I1rwFojc8wLvKZi9cySZQiGJLE7OFXa49eTMfYT7t8nYOgYT0y4e8mfu
	NI6WlErxHi6mAIIUv5FBvWznwnMZjT5LttXTjcevL2FVYXtqo6kkTsrGg+SPTs6/wCH/rqB4V7N
	mNug056G5vUGfSb1f3IcNi0j7qqeNR/TXlBhZ8UO/OfjNCPb7Kke8w+EI79QSDmPDPaFoRM4CPz
	as37N0lm/yCSByb5lioZ/0XzEagV0bC6cZWIJ++3vCFdg11wWSdjtBdYUMfRPfnF/9DDY3RuPeG
	wkb2QUJo2MuTOR1MkCkFM0p3oTaDPgTQ==
X-Google-Smtp-Source: AGHT+IHfXjnRp3cTFGa+8Qanqxwy10UGsb/fLvaOOKkhNjGlyR2g6kaDXFitMh3x5rYeK43UijaMTw==
X-Received: by 2002:a17:903:247:b0:252:a80c:3cc5 with SMTP id d9443c01a7336-2986a6beeb4mr15742395ad.22.1763091191709;
        Thu, 13 Nov 2025 19:33:11 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b0bf0sm40334405ad.71.2025.11.13.19.33.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 13 Nov 2025 19:33:11 -0800 (PST)
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
Subject: [PATCH v6 2/2] riscv: add HARDLOCKUP_DETECTOR_PERF support
Date: Fri, 14 Nov 2025 11:32:43 +0800
Message-Id: <20251114033243.76509-3-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20251114033243.76509-1-cuiyunhui@bytedance.com>
References: <20251114033243.76509-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_193312_730605_37E5DFB9 
X-CRM114-Status: GOOD (  11.04  )
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
index fadec20b87a8e..46ccd33732fa8 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -186,6 +186,9 @@ config RISCV
 	select HAVE_PAGE_SIZE_4KB
 	select HAVE_PCI
 	select HAVE_PERF_EVENTS
+	select HAVE_PERF_EVENTS_NMI if RISCV_PMU_SBI_SSE
+	select HAVE_HARDLOCKUP_DETECTOR_PERF if PERF_EVENTS && HAVE_PERF_EVENTS_NMI
+	select WATCHDOG_PERF_ADJUST_PERIOD if HARDLOCKUP_DETECTOR_PERF
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


