Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E15C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 16:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9TloYqxN/i55VcIehv9Gi6em0fcwcZuJP0vDGeqsXbA=; b=O/uU8WAgrxaSFq83H7+hmXAYAO
	0Sq197WuH/i93OlY47EnLYK28KukR8fpHMOagz1YLygDJQG0SLbSePIdLQqYuB1WP+e3jVaUYIr59
	YcbG1d9oaPHeNDrfuRMM/6js1AU7QC0EMZ/BFqaF/gehYzwIyLXhuh1h28VnCcB9BeUT6HyJLJ0rv
	yTKXdkA3rCuzlIADptKV7wQBTL7Q9M4E6rQOvMJLypXADj85pjxOxjLJCXzLY2lMa6pBCoDUqUfST
	6QzCy58KI3thKOVUcFqWqRQsCzPGTx+3CeZrse3WhA4syCLEweOO4jif7ZM3fSRQWaKwO7crW/i5v
	HuA429FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFxuB-0000000411r-32KF;
	Fri, 16 May 2025 16:27:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFxbC-00000003yOG-2tVf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 16:07:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62F6B1BF7;
	Fri, 16 May 2025 09:07:38 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 474843F63F;
	Fri, 16 May 2025 09:07:49 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Yabin Cui <yabinc@google.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v1 01/11] coresight: etm4x: Control the trace unit in CPU suspend
Date: Fri, 16 May 2025 17:07:32 +0100
Message-Id: <20250516160742.1200904-2-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250516160742.1200904-1-leo.yan@arm.com>
References: <20250516160742.1200904-1-leo.yan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_090750_773053_585483EF 
X-CRM114-Status: GOOD (  12.02  )
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

If a trace unit has been enabled, a CPU suspend operation misses to
disable the trace unit.  After the CPU resumes, it also does not follow
the general flow for re-enabling the trace unit.  As a result, this may
lead to a wrong state machine for the ETM.

This commit stops the trace unit during the CPU suspend flow and
re-enables the trace unit in the resume flow.

Fixes: f188b5e76aae ("coresight: etm4x: Save/restore state across CPU low power states")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 6a5898355a83..b12d59b89a49 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1820,6 +1820,11 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
 	state = drvdata->save_state;
 
 	state->trcprgctlr = etm4x_read32(csa, TRCPRGCTLR);
+
+	/* Stop the trace unit if it is enabled */
+	if (state->trcprgctlr)
+		etm4_disable_trace_unit(drvdata);
+
 	if (drvdata->nr_pe)
 		state->trcprocselr = etm4x_read32(csa, TRCPROCSELR);
 	state->trcconfigr = etm4x_read32(csa, TRCCONFIGR);
@@ -1951,7 +1956,6 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
 	etm4_cs_unlock(drvdata, csa);
 	etm4x_relaxed_write32(csa, state->trcclaimset, TRCCLAIMSET);
 
-	etm4x_relaxed_write32(csa, state->trcprgctlr, TRCPRGCTLR);
 	if (drvdata->nr_pe)
 		etm4x_relaxed_write32(csa, state->trcprocselr, TRCPROCSELR);
 	etm4x_relaxed_write32(csa, state->trcconfigr, TRCCONFIGR);
@@ -2035,6 +2039,15 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
 
 	/* Unlock the OS lock to re-enable trace and external debug access */
 	etm4_os_unlock(drvdata);
+
+	/*
+	 * Re-enable the trace unit if it was enabled before suspend.
+	 * Put it after etm4_os_unlock() as unlocking the OS lock is the
+	 * prerequisite for enabling the trace unit.
+	 */
+	if (state->trcprgctlr)
+		etm4_enable_trace_unit(drvdata);
+
 	etm4_cs_lock(drvdata, csa);
 }
 
-- 
2.34.1


