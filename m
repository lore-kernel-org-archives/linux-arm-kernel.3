Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F3F1CF3941
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rj82a0JpTnghQfYrTJU+YAkmWBQmmcZfDyIsAFbEnzI=; b=ccendTQBQ+2TiJheZGor5i0W74
	2hcUfIOb52yaPOKbsQjx1MZ+4bIaViKNM53DB0OW9xiyYcugieaf1QQCtcb4V4wJy+sR6qYHpCELO
	D1rEFbPOFDBcAqOsrOWwj+0gbSXV/K2Y6j2aaCREh7MCzbESlUEmoDv7vQcYs2GnOJTOTq8zsnQe7
	vTRcYNue+g5IDX/AOgZ0aB90LUyfnBLnLgqEbFkdjUopuH7P5a9VZ4wIpflXqNfevUHv5elQkEmf3
	5W6R952mQtKNk2kOX8yVni+bSTCgGzStnf5Uf/EelUCps7LlZYiTrSnPhHKqna34StYBCXRvQ6NyX
	Wb2Odopg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkRP-00000003Z50-1KHS;
	Wed, 19 Nov 2025 15:49:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkR6-00000003YnG-07tG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 15:49:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E4F612FC;
	Wed, 19 Nov 2025 07:49:27 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4B1E63F66E;
	Wed, 19 Nov 2025 07:49:33 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 19 Nov 2025 15:49:03 +0000
Subject: [PATCH v5 05/19] coresight: Add callback to determine if PM is
 needed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-arm_coresight_path_power_management_improvement-v5-5-f615a301ad0b@arm.com>
References: <20251119-arm_coresight_path_power_management_improvement-v5-0-f615a301ad0b@arm.com>
In-Reply-To: <20251119-arm_coresight_path_power_management_improvement-v5-0-f615a301ad0b@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763567363; l=3209;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=Ludj3fU8LnQ79g/nCqIeKM+WC/bi6sh/vgngGbCCmuE=;
 b=8FssLJrR2hs/iwIgv/6I20YuQ+Vcc1OgNn1ZYqoYFKnsE/PCljEJ/gUaE3IIjt0YISLKvU+XH
 LC1hbfpkromAAPyVznlHnb2szjHJMVcXF2+gdwpk5yWL0RO9emULTEH
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_074936_273288_BE20F940 
X-CRM114-Status: GOOD (  15.83  )
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

Add a callback in the source device that returns a boolean indicating
whether power management operations are required. The save and restore
flow is skipped if the callback returns false.

The ETMv4 driver implements its own version's callback.

Reviewed-by: James Clark <james.clark@linaro.org>
Tested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c       |  9 ++++++++-
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 16 ++++++++++++++++
 include/linux/coresight.h                          |  1 +
 3 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 2aa1bbc53731637cccbf82ff83702ddc5ff80069..b2118a49ee688e194930de888b5283c4a6c33e2f 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1601,7 +1601,14 @@ static bool coresight_pm_is_needed(struct coresight_device *csdev)
 	    !coresight_ops(csdev)->pm_restore_enable)
 		return false;
 
-	return true;
+	/*
+	 * PM callbacks are provided but pm_is_neended() is absent, it means
+	 * no extra check is needed.
+	 */
+	if (!coresight_ops(csdev)->pm_is_needed)
+		return true;
+
+	return coresight_ops(csdev)->pm_is_needed(csdev);
 }
 
 static int coresight_pm_save(struct coresight_device *csdev)
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 5d308afe737e9061ab75ee1c59c2b84a4a66e349..1c95484d7e2de2d0980e897f7f615b86ddd89f55 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1832,6 +1832,21 @@ static int etm4_dying_cpu(unsigned int cpu)
 	return 0;
 }
 
+static bool etm4_need_save_restore_context(struct coresight_device *csdev)
+{
+	if (pm_save_enable != PARAM_PM_SAVE_SELF_HOSTED)
+		return false;
+
+	/*
+	 * Save and restore the ETM Trace registers only if
+	 * the ETM is active.
+	 */
+	if (coresight_get_mode(csdev))
+		return true;
+
+	return false;
+}
+
 static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
 {
 	int i, ret = 0;
@@ -2107,6 +2122,7 @@ static const struct coresight_ops etm4_cs_ops = {
 	.trace_id		= coresight_etm_get_trace_id,
 	.pm_save_disable	= etm4_cpu_save,
 	.pm_restore_enable	= etm4_cpu_restore,
+	.pm_is_needed		= etm4_need_save_restore_context,
 	.source_ops		= &etm4_source_ops,
 };
 
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 25a31a4dd1486cefe6b442ad127954f8411ce949..e5ce9b956deeac1a303a7250b48a4083d580f55a 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -444,6 +444,7 @@ struct coresight_ops {
 			struct coresight_device *sink);
 	int (*pm_save_disable)(struct coresight_device *csdev);
 	void (*pm_restore_enable)(struct coresight_device *csdev);
+	bool (*pm_is_needed)(struct coresight_device *csdev);
 	const struct coresight_ops_sink *sink_ops;
 	const struct coresight_ops_link *link_ops;
 	const struct coresight_ops_source *source_ops;

-- 
2.34.1


