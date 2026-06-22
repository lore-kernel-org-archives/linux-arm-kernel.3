Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0450DCDB46B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 08:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v62h5jXmmPgvQdyVU89RGQkLc6ReYrJW9QcdYlcnl1s=; b=bMJMJ6bsmKhk6GZK0+BaJS1cbP
	1rp7FyfUcal6j24GFkbjZJKXivXbwwhoEKrdN/E7we/VASGzB1WMbOhs1zuy0tO8W/JoC8Vc2AZN5
	8tP2uAvkRf7oYD85hanAxPA3Ug8bdEfsgL/rzRnmbekfa63VuVm3gK7pE/aIJbudvOaMxWXwfFHQp
	J91fyDauN9gVlHAVbIfT200wYj+h7F0GI0iHDoPAcmFqxEFUjRyw3lLwg6hnJpLocKLfi9Tq9Zp4/
	dQzv+o1pTnzlyhXcsV+Ibbh8oLvaUgPQ5rEuWdN1nmtNVmmppiM0amhymvooh7ObsqUyM27Q0i57o
	eHlY4ZcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbZdw-00000004anY-017G;
	Mon, 22 Jun 2026 08:04:32 +0000
Received: from out-183.mta0.migadu.com ([91.218.175.183])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbZds-00000004amJ-1x7r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 08:04:29 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782115466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v62h5jXmmPgvQdyVU89RGQkLc6ReYrJW9QcdYlcnl1s=;
	b=oIPacT9Lz4/fnsnqclJUcIdL5JYt78goTvHHcxVnY3JyTxFwB6WIVcRgxLZdgrEVuKOcjK
	EIKKZXitc5H1EtSSz37N+7DkT86VZTFd93gzatYrtTDplcBLU27t9V5AchyTisc+3M50Dw
	zo4lBUuX/HyZ3BRKFGdssr0SZeN81eo=
From: Atish Patra <atish.patra@linux.dev>
Date: Mon, 22 Jun 2026 01:04:13 -0700
Subject: [PATCH v7 01/22] RISC-V: perf: fix resource cleanup on driver
 probe failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-counter_delegation-v7-1-0ba2fd34614e@meta.com>
References: <20260622-counter_delegation-v7-0-0ba2fd34614e@meta.com>
In-Reply-To: <20260622-counter_delegation-v7-0-0ba2fd34614e@meta.com>
To: Jiri Olsa <jolsa@kernel.org>, James Clark <james.clark@linaro.org>, 
 Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, Rob Herring <robh@kernel.org>, 
 Ian Rogers <irogers@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
 Atish Patra <atish.patra@linux.dev>, Namhyung Kim <namhyung@kernel.org>
Cc: devicetree@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 Conor Dooley <conor@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_010428_658990_EAA800E1 
X-CRM114-Status: GOOD (  13.89  )
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

From: Atish Patra <atishp@meta.com>

Sashiko pointed out various UAF and memory leak issues around
pmu_sbi_device_probe() error paths.

If the probe fails, here are list of cleanups needed.
a. Already registered pmu must be freed
b. per cpu IRQ must be released
c. pmu_ctr_list data structure must be freed
d. cpu hotplug state must be cleaned up only if added.

Fix the resource cleanup by reorganizing the code around probe failure.

Reported-by: Sashiko AI <sashiko-bot@kernel.org>
Signed-off-by: Atish Patra <atishp@meta.com>
---
 drivers/perf/riscv_pmu_sbi.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 385af5e6e6d0..8753007cc57e 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -1302,7 +1302,8 @@ static void riscv_pmu_destroy(struct riscv_pmu *pmu)
 		}
 	}
 	riscv_pm_pmu_unregister(pmu);
-	cpuhp_state_remove_instance(CPUHP_AP_PERF_RISCV_STARTING, &pmu->node);
+	if (!hlist_unhashed(&pmu->node))
+		cpuhp_state_remove_instance(CPUHP_AP_PERF_RISCV_STARTING, &pmu->node);
 }
 
 static void pmu_sbi_event_init(struct perf_event *event)
@@ -1424,6 +1425,7 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 	struct riscv_pmu *pmu = NULL;
 	int ret = -ENODEV;
 	int num_counters;
+	bool irq_requested = false;
 
 	pr_info("SBI PMU extension is available\n");
 	pmu = riscv_pmu_alloc();
@@ -1452,6 +1454,7 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 		pmu->pmu.capabilities |= PERF_PMU_CAP_NO_INTERRUPT;
 		pmu->pmu.capabilities |= PERF_PMU_CAP_NO_EXCLUDE;
 	}
+	irq_requested = (ret == 0);
 
 	pmu->pmu.attr_groups = riscv_pmu_attr_groups;
 	pmu->pmu.parent = &pdev->dev;
@@ -1470,11 +1473,11 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 
 	ret = riscv_pm_pmu_register(pmu);
 	if (ret)
-		goto out_unregister;
+		goto out_destroy;
 
 	ret = perf_pmu_register(&pmu->pmu, "cpu", PERF_TYPE_RAW);
 	if (ret)
-		goto out_unregister;
+		goto out_destroy;
 
 	/* SBI PMU Snapsphot is only available in SBI v2.0 */
 	if (sbi_v2_available) {
@@ -1515,9 +1518,17 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 	return 0;
 
 out_unregister:
+	perf_pmu_unregister(&pmu->pmu);
+
+out_destroy:
 	riscv_pmu_destroy(pmu);
+	if (irq_requested)
+		free_percpu_irq(riscv_pmu_irq, pmu->hw_events);
 
 out_free:
+	free_percpu(pmu->hw_events);
+	kfree(pmu_ctr_list);
+	pmu_ctr_list = NULL;
 	kfree(pmu);
 	return ret;
 }

-- 
2.53.0-Meta


