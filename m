Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC20C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 16:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8S+YRQ6puW/UgfTctAV6x4xXkK80nr7C4dT+mSF7dmA=; b=dOmrNJQaud8235AYBfrRzvkQDW
	4ymnexx0Q25jPDzl4nbutujypC+0XzgXAZzT/RogQ2VwscF0mU5U71HQylU6s73oZGc7lNPuZLxvF
	3DwUyOHb45q7syWSfy/p0rhPCSGWGcXlXdb7k4u8AXRzCTZhupidwDJq6OV3nMDTJwvA/jAIUGZwx
	xSWtU2+O5u+QTOlctDDmo0n944ILPGDrwC223DsAV9SzPFFnGMh1V58OvuUvCSPBMf4fgqwwB5rU4
	vq7l5fs5ym/P7RT2z+ZlVDoRWj+FgIIY4oy6FWpSEVLieiswzljW69Dae3rsGg83upj+t8B1+7yTM
	9cXEa76Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWe9Z-000000066GI-3r4a;
	Tue, 01 Jul 2025 16:48:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWcN9-00000005mla-1WTK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 14:54:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A0AD612FC;
	Tue,  1 Jul 2025 07:53:55 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E6B5C3F66E;
	Tue,  1 Jul 2025 07:54:08 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 01 Jul 2025 15:53:34 +0100
Subject: [PATCH v2 09/28] coresight: etm4x: Add flag to control single-shot
 restart
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-arm_cs_pm_fix_v3-v2-9-23ebb864fcc1@arm.com>
References: <20250701-arm_cs_pm_fix_v3-v2-0-23ebb864fcc1@arm.com>
In-Reply-To: <20250701-arm_cs_pm_fix_v3-v2-0-23ebb864fcc1@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Levi Yun <yeoreum.yun@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751381627; l=2609;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=3FzsJ294Km5DXl6Zl0XTZsLcfLP+hKqykLaREdcqh7Q=;
 b=vnizEWirvSP9CyTgezy74SOV99JSU/ZlgmUOyQufbb5U5UqvIEa7NIfNqmAgzXzvO9NPGguK6
 ou9l5Af1n21AIsxHQq4FP1vmJ4YQ7K1yRZF8kHOBn9oJe07ccPdLAwi
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_075411_528303_2742B376 
X-CRM114-Status: GOOD (  13.06  )
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

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 1faf8614366f38eea4909152558fe8e69730bde4..7bbdee92859cd227fd4077df6ff25470b9d76950 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -486,7 +486,7 @@ static int etm4_enable_trace_unit(struct etmv4_drvdata *drvdata)
 	return 0;
 }
 
-static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
+static int etm4_enable_hw(struct etmv4_drvdata *drvdata, bool restart_ss)
 {
 	int i, rc;
 	struct etmv4_config *config = &drvdata->config;
@@ -560,9 +560,11 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
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
@@ -626,7 +628,7 @@ static void etm4_enable_hw_smp_call(void *info)
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
 	/* The tracer didn't start */
@@ -1830,7 +1832,7 @@ static int etm4_starting_cpu(unsigned int cpu)
 		etm4_os_unlock(etmdrvdata[cpu]);
 
 	if (coresight_get_mode(etmdrvdata[cpu]->csdev))
-		etm4_enable_hw(etmdrvdata[cpu]);
+		etm4_enable_hw(etmdrvdata[cpu], true);
 	raw_spin_unlock(&etmdrvdata[cpu]->spinlock);
 	return 0;
 }

-- 
2.34.1


