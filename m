Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02404CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 03:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6P8xZEQeIO5H4AzeXprUKU3oEf9nN+exJfE8nbRaRqY=; b=U98zXSVvjUCNB9kgB2hLlTgh3Y
	aKOq38eoF8UuIUgLBp9H9WO7VZY3Ju4jk51US463Ui7Dmmf4ZplWgSBreeYlhBhWJKwBw23eYskXx
	QiaXWnLbsaOJUTKNIaSxA5Q0VAruPwPy6qpzKmKeDfAMFRtrgq00hdw+bwt6CGVjR+3Ds1HItBlY8
	YGAnQakdMboVtkzWn1IEErxTF62klsI0M0qSTp7cIOYRVbfJb0lcfloiqEcK6a02ThlpL4s5jdokV
	HLtBBD7GU4XGk86bbHe70kd1l9AuwJ4jNyDiZ2PMGG2bl+u0TAK+YVrKuBvVycW2SI/0pXxnahL9e
	hmcNPY+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8VVK-0000000F2Ou-32ZO;
	Tue, 14 Oct 2025 03:15:14 +0000
Received: from mail-pl1-f170.google.com ([209.85.214.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8VVH-0000000F2M2-2hYw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 03:15:12 +0000
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-27eec33b737so73549735ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 20:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1760411711; x=1761016511; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6P8xZEQeIO5H4AzeXprUKU3oEf9nN+exJfE8nbRaRqY=;
        b=j8T6oRZ4e/EEadN2F8EaAkreA/jyJqoVuJdmlLtyoy/dgqGAWsYWjTfzz5EH8LqQ42
         183uNoi/f7YgsmShkDMkqmcEdt1tBtLtFWR2sWmnVAirVdYv4rBFsT+HMUxqKkxQNZXz
         hExacsO+pjYFybT410m9kFSLsIA1gng87V3YETyCnpJRPCu69lftB6bTqAmLTrUKOO1k
         iyw8emOnDEizEvzyKAiyt3sMWbMcuNGFW+YO5/75vjQ1j9nVWUrFWbIQSao1+iL2Xll+
         DkH0LuJdinr33UKWt5PoUiS/QBKtK7dK+S0ViB4iJH8b9su3M/cdPQmaq8zZ2W6cJC/E
         azPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760411711; x=1761016511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6P8xZEQeIO5H4AzeXprUKU3oEf9nN+exJfE8nbRaRqY=;
        b=j0cor6aeZExp9RLfES1PZxjqKYnyCdtCUrUcJzQnmXBnBFIFoaiTXWdNQMFscSCAmK
         +S6lXCP9tcECZhk9jh8sSXRc81muD/5uI6i0hK4c6Smv3m1Hxkrku3N80t2Dhf8APsKn
         C8SNIWjTSCNctYla02qKwbcaBkpsL5RFBzOKkiDzXbMRVIaAO6+vwCY6CT07gjjYV3Z3
         1JBTfHXApEb1jV+Xcjyksr3K0qzYC8fwbybo1zcdYe0dxjB1utg7pq2qCH4sEQEBYmg4
         0zPGdDkTx26i4YrgO63z36KZL2MMUhHC3KXXNpCKd6Ik4UwC/9Luf1ZG/wtWOkbqnc/8
         Z+nA==
X-Forwarded-Encrypted: i=1; AJvYcCWmFQdJH8LE+9hQoTm9CMh5/OwZmYHWFUiTRV761H4RUZ4tjydITQ1XINJaoGI+/E/7yQdjLccWhsOPaTS471a2@lists.infradead.org
X-Gm-Message-State: AOJu0Yz27EoNh6+F4zV5rNIng2I/ULBRoKpHnPsQfAsczak7CbMSOY06
	G5pLKHjBAuk9pGffZxgHVcp2cgmD9fV1Uu8S4g7Cn7zfZexAPbj2FIuiOw6Q/YrDqgA=
X-Gm-Gg: ASbGncunQ2RtTK/ykWBvM6ASLEnVyBiHdVnTxRx3bpLp3l5zx7ArY+zbBxWdnFwl/f1
	+uX/58NFnmie45NtiAje0ueCg2d3n+b/it9NMwJRMLvitm6E2N01iqlQakkOE1ISoK3sKc2A1Hp
	vVpAUMMXwdYw4CYXi1siBsone21CZ/IQ6rM50q3H+zXj0Xl++yUWwObVBs46MXYTSHhNMLiB851
	Y85y/ozEk73MC5ZR4wQPSbPXi8PsNMViRqXo0avJxfvQTD6lQvvIbjWhSWrn91c3TTQGEfKeAmv
	AIA8XTPlbUlMlgtccySXAPKPyeoRoPLlNet8pXZN/1pRzQx94k9/6+8HmGr9ReqOsnVWjmh+RnJ
	JwNY3nEOyvJiOQUy4Ed2Q7RyVlFz4RqKO5J63oNRzwbj250+opsRPsyrGABHVr//AW/oIt0QhqA
	CfT9C/aWuNrblIiwqBXv6sRi0Sv2k=
X-Google-Smtp-Source: AGHT+IEnhbhgD5wvfXgKIYQpP+Lfyce302o3Owp60kynW6BbE9VY04c0yKjSZIvlB5ornO/n4cUtAg==
X-Received: by 2002:a17:902:ef07:b0:269:82a5:fa19 with SMTP id d9443c01a7336-290272e3adcmr281603745ad.45.1760411710696;
        Mon, 13 Oct 2025 20:15:10 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f3de4asm148315845ad.92.2025.10.13.20.15.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 13 Oct 2025 20:15:10 -0700 (PDT)
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
Subject: [PATCH v4 2/2] riscv: add HARDLOCKUP_DETECTOR_PERF support
Date: Tue, 14 Oct 2025 11:14:25 +0800
Message-Id: <20251014031425.93284-3-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20251014031425.93284-1-cuiyunhui@bytedance.com>
References: <20251014031425.93284-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_201511_713250_979DF35E 
X-CRM114-Status: GOOD (  11.71  )
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
index badbb2b366946..0ae3291b303f9 100644
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


