Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79067CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 16:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZiHgZYrYakPft+tYrKF5J5VAvrvdJh5B+TmWpq6VrZk=; b=sdQTTcLZhf6LO0/w1n13zISdX0
	okJBvIsvp+rGlMP6WiCvDLsvUorbMmThbRaRODs9r6UghICoyHYNlugybI+/SypfmV1rI+2vbJykB
	QsFsXSCvrFLIamFpnMf+CRabRrO0HfKutXUo1qYRIyq7VCc/yj7xIUt55Ocmy2Nxo2yAF0F+MNGqZ
	++/1yEk77OWxBERa6qJIDHxQYh16Iy8CfLQp8q+45BkRjT8k3zVE/9gN65eBBgjpl1JzJeOLChusG
	0yyMSM7nnezsDzYVatXnsXHNrgAJTxVxV/ubyg9xz2wIZxjveX/tmadVOb3xo/SIK2/mK2E5+Jkv6
	c+iYdN1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxkg-0000000AIjg-0q2C;
	Mon, 03 Nov 2025 16:49:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxkd-0000000AIgE-3LwH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 16:49:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 980132BCB;
	Mon,  3 Nov 2025 08:49:43 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AA3EA3F694;
	Mon,  3 Nov 2025 08:49:49 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 03 Nov 2025 16:49:30 +0000
Subject: [PATCH v5 09/11] coresight: etm4x: Add flag to control single-shot
 restart
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-arm_coresight_power_management_fix-v5-9-f803c19aa153@arm.com>
References: <20251103-arm_coresight_power_management_fix-v5-0-f803c19aa153@arm.com>
In-Reply-To: <20251103-arm_coresight_power_management_fix-v5-0-f803c19aa153@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762188572; l=2785;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=3Vn2zUgj2j4Gmb77jj+wLIicgqRHVhgnsohwDUvj2qk=;
 b=u6LsS/6x+s9bZDRS6uqZzuhdBU2xDZnh81N7hfZ1NZzyH3l1OpAnbY2BW19Akhzt4huZJfSRs
 23HM7prCg1uDrm6CgoAw45+wKzBbRWxvKSQwgyD75W1o35dscCJyawj
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_084951_959278_669F946C 
X-CRM114-Status: GOOD (  11.90  )
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
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 560975b70474c3449aa6799fc1a8e05d5ea93495..5101ac3885c7dec6aed397668a866b7cfe907d10 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -490,7 +490,7 @@ static int etm4_enable_trace_unit(struct etmv4_drvdata *drvdata)
 	return 0;
 }
 
-static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
+static int etm4_enable_hw(struct etmv4_drvdata *drvdata, bool restart_ss)
 {
 	int i, rc;
 	struct etmv4_config *config = &drvdata->config;
@@ -565,9 +565,11 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
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
@@ -624,7 +626,7 @@ static void etm4_enable_sysfs_smp_call(void *info)
 		return;
 	}
 
-	arg->rc = etm4_enable_hw(arg->drvdata);
+	arg->rc = etm4_enable_hw(arg->drvdata, true);
 
 	/* The tracer didn't start */
 	if (arg->rc)
@@ -861,7 +863,7 @@ static int etm4_enable_perf(struct coresight_device *csdev,
 	drvdata->paused = !!READ_ONCE(event->hw.aux_paused);
 
 	/* And enable it */
-	ret = etm4_enable_hw(drvdata);
+	ret = etm4_enable_hw(drvdata, true);
 
 out:
 	/* Failed to start tracer; roll back to DISABLED mode */
@@ -1820,7 +1822,7 @@ static int etm4_starting_cpu(unsigned int cpu)
 		etm4_os_unlock(etmdrvdata[cpu]);
 
 	if (coresight_get_mode(etmdrvdata[cpu]->csdev))
-		etm4_enable_hw(etmdrvdata[cpu]);
+		etm4_enable_hw(etmdrvdata[cpu], true);
 	raw_spin_unlock(&etmdrvdata[cpu]->spinlock);
 	return 0;
 }

-- 
2.34.1


