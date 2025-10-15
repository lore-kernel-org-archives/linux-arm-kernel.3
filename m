Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A03B8CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 18:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wjcJ38Q7QlBCb42desheCijSJlWiudzve42WEdCNTGE=; b=0gcZ5gR+d91qAv4F9TXLKtomkw
	Tu2XrT/VCFfznJ/LECK2+7pFRRE+kau/zrNVudvFGd+hi9PzaCjxeZHDuzna03kX8BYqmWNmBL2eG
	JmzsJlUQ41g7mD745tMOYX1WTSpeOus9RMQc0y7NC6/hXQpss3spCiBXggX5lnUUf81x+7NCa1F2y
	pcByJlMvsx4X77eTTu2o46gMVCPKieQVg/qdNrvgnpcYUFvL6lik5YFyNOgvxtBgjEacRzH3PuTMl
	UQywNL9fDa42q3oIGCHp6zqXui94VvlMEGoj4l2MIPqqQ/OWq9Da39WHPQXPT2f53J11Gk5NN+dUJ
	ALEJw1hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v96AK-00000002bN5-08DU;
	Wed, 15 Oct 2025 18:24:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v96AH-00000002bMD-1Suc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 18:23:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 40C241688;
	Wed, 15 Oct 2025 11:23:48 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 024083F66E;
	Wed, 15 Oct 2025 11:23:54 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 15 Oct 2025 19:23:37 +0100
Subject: [PATCH] perf: arm_spe: Ensure trace is disabled when TRUNCATED
 flag is set
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-arm_spe_fix_truncated_flag-v1-1-555e328cba05@arm.com>
X-B4-Tracking: v=1; b=H4sIAKjm72gC/x3MQQqAIBBA0avErBPUsEVXiZCxphooi7EiiO6et
 Hzw+Q8kEqYETfGA0MWJt5hhygL6GeNEiodssNo6o41TKKtPO/mRb3/IGXs8aPDjgpMy6EJVW40
 VBsiDXShX/7zt3vcD6uwxF2wAAAA=
X-Change-ID: 20251015-arm_spe_fix_truncated_flag-1a5b3620a3ab
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexandru Elisei <alexandru.elisei@arm.com>, 
 James Clark <james.clark@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760552634; l=1992;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=hobg/DGsST/n4PHeoRQSc4GShXGVL6XzTZGQU8Mhvt8=;
 b=5Ia7UVEN++q+1LfrKDFKIJROBP5XWebRE+b9jgrDT+esrW89DjFTQCwQZX3URbk6tVUAjN1h3
 vAAGHyUEVfaBzs1Y1ClAKHn85pKjW+H4VEmLft4Z/TtmWEJ8TDFUIM3
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_112357_449982_57F49E77 
X-CRM114-Status: GOOD (  14.02  )
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

The TRUNCATED flag can be set in the following cases:

 1. When data loss is detected (PMBSR_EL1.DL == 0b1).
 2. When arm_spe_perf_aux_output_begin() fails to find a valid limit
    because it runs out of free space.

Currently, only the first case invokes irq_work_run() to execute the
event disable callback, while the second case does not.

Move the call to irq_work_run() later with checking the TRUNCATED flag,
so that both cases are handled and redundant calls are avoided.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/perf/arm_spe_pmu.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index fa50645feddadbea5dc1e404f80f62cf5aa96fd4..05ba977f75d607a1d524f68694db9ea18a6ef20c 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -731,12 +731,6 @@ static irqreturn_t arm_spe_pmu_irq_handler(int irq, void *dev)
 	if (act == SPE_PMU_BUF_FAULT_ACT_SPURIOUS)
 		return IRQ_NONE;
 
-	/*
-	 * Ensure perf callbacks have completed, which may disable the
-	 * profiling buffer in response to a TRUNCATION flag.
-	 */
-	irq_work_run();
-
 	switch (act) {
 	case SPE_PMU_BUF_FAULT_ACT_FATAL:
 		/*
@@ -765,6 +759,15 @@ static irqreturn_t arm_spe_pmu_irq_handler(int irq, void *dev)
 		break;
 	}
 
+	/*
+	 * The TRUNCATED flag is set when data loss is detected by PMBSR_EL1.DL,
+	 * or arm_spe_perf_aux_output_begin() sets the flag if runs out of free
+	 * space. Ensure that all perf callbacks have completed for disabling
+	 * the profiling buffer.
+	 */
+	if (handle->aux_flags & PERF_AUX_FLAG_TRUNCATED)
+		irq_work_run();
+
 	/* The buffer pointers are now sane, so resume profiling. */
 	write_sysreg_s(0, SYS_PMBSR_EL1);
 	return IRQ_HANDLED;

---
base-commit: 1f4a222b0e334540343fbb5d3eac4584a6bfe180
change-id: 20251015-arm_spe_fix_truncated_flag-1a5b3620a3ab

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


