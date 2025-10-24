Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA880CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 16:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T9KyZpsYyAKjjzfAJGO/g3Yfh1p58zW6mLfnK15pzHM=; b=TvA/aSzO48j7PoLu5okOKWqlpb
	FNTGm345+3w/7BYA4nUGuDgjSj/SjIrHUQPG2fk2Y5InhjLBYLe7a0JR9dV+ICYNGZTf49DPtVIEU
	/6u2X9JElAw0AO5asLsomZVTFPICiRcjCHYTHoZR9+WlxVTc5GkYRyi3ODKxPBr9TQrttlqPrdNeC
	2Lxk5Spit9yeL7qtZ56dnkUoPr5cuwSLh/seCv18HinDUvkhrxHJn5clnFwdegSg0gufkmF6p8oV9
	nbXMyI4XruRkY0AEEu+b5ubag/SiOF+RdzBBtYQ3dP2I9jRGTmHlLUdV6VBDHHkUA64YnpEAx8VpC
	3j05pFug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKwR-0000000A1G4-2cKm;
	Fri, 24 Oct 2025 16:47:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKw6-0000000A0wZ-21CZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 16:46:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D034B175A;
	Fri, 24 Oct 2025 09:46:32 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 194D93F66E;
	Fri, 24 Oct 2025 09:46:38 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 24 Oct 2025 17:45:57 +0100
Subject: [PATCH v4 09/11] coresight: etm4x: Add flag to control single-shot
 restart
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-arm_coresight_power_management_fix-v4-9-690e69ae6977@arm.com>
References: <20251024-arm_coresight_power_management_fix-v4-0-690e69ae6977@arm.com>
In-Reply-To: <20251024-arm_coresight_power_management_fix-v4-0-690e69ae6977@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761324381; l=2737;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=om9/Uq1SvS3vD3M0/zp6CRanXzj4LCKAllysQiXU2Yk=;
 b=pmmYlsDsWAaqd/FalIYjuh3yW5wj6vSH2bRnk94ybIecMV6GzqwHjM0aIQSJM8Hni2+VsNyGh
 SlLxGyZBv0ODfbB/gCHa9cZq7+8aMySt0G4mDgjjTets/76Wbbvqli4
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_094642_948159_111DFB81 
X-CRM114-Status: GOOD (  12.06  )
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

Add a new argument restart_ss to etm4_enable_hw(). When passed as true,
it resets the TRCSSCSRn.STATUS bit to 0 to re-enable single-shot
control.

No functional change. This is a preparation for a subsequent change.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Tested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 15f70268e5b605a6881504c0c60b001251fbbddf..4c6236ad241d1a13515160ca478fae839a891e38 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -487,7 +487,7 @@ static int etm4_enable_trace_unit(struct etmv4_drvdata *drvdata)
 	return 0;
 }
 
-static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
+static int etm4_enable_hw(struct etmv4_drvdata *drvdata, bool restart_ss)
 {
 	int i, rc;
 	struct etmv4_config *config = &drvdata->config;
@@ -562,9 +562,11 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
 		etm4x_relaxed_write32(csa, config->res_ctrl[i], TRCRSCTLRn(i));
 
 	for (i = 0; i < drvdata->nr_ss_cmp; i++) {
-		/* always clear status bit on restart if using single-shot */
-		if (config->ss_ctrl[i] || config->ss_pe_cmp[i])
-			config->ss_status[i] &= ~TRCSSCSRn_STATUS;
+		if (restart_ss) {
+			/* always clear status bit on restart if using single-shot */
+			if (config->ss_ctrl[i] || config->ss_pe_cmp[i])
+				config->ss_status[i] &= ~TRCSSCSRn_STATUS;
+		}
 		etm4x_relaxed_write32(csa, config->ss_ctrl[i], TRCSSCCRn(i));
 		etm4x_relaxed_write32(csa, config->ss_status[i], TRCSSCSRn(i));
 		if (etm4x_sspcicrn_present(drvdata, i))
@@ -628,7 +630,7 @@ static void etm4_enable_sysfs_smp_call(void *info)
 		return;
 	}
 
-	arg->rc = etm4_enable_hw(arg->drvdata);
+	arg->rc = etm4_enable_hw(arg->drvdata, true);
 
 	/* The tracer didn't start */
 	if (arg->rc)
@@ -865,7 +867,7 @@ static int etm4_enable_perf(struct coresight_device *csdev,
 	drvdata->paused = !!READ_ONCE(event->hw.aux_paused);
 
 	/* And enable it */
-	ret = etm4_enable_hw(drvdata);
+	ret = etm4_enable_hw(drvdata, true);
 
 out:
 	/* Failed to start tracer; roll back to DISABLED mode */
@@ -1831,7 +1833,7 @@ static int etm4_starting_cpu(unsigned int cpu)
 		etm4_os_unlock(etmdrvdata[cpu]);
 
 	if (coresight_get_mode(etmdrvdata[cpu]->csdev))
-		etm4_enable_hw(etmdrvdata[cpu]);
+		etm4_enable_hw(etmdrvdata[cpu], true);
 	raw_spin_unlock(&etmdrvdata[cpu]->spinlock);
 	return 0;
 }

-- 
2.34.1


