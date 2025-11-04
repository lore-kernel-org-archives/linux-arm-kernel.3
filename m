Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74FFECCFA0C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 15:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DstpmKuTVP54uZMuG1FUeFbYrjX29vmj2rPLrqtgi1A=; b=h3GjmCZ6T+GqUqJawdLys4A+eQ
	Ew2eI8+7l8UcwlC0JouPkiQoVt+OBaaZ/2e0hsU8O2W3cL/jdoqZybP9bN1wpIpgm/BXmMEosYz5d
	LvlJlYqM5DTQi3582+P085QcqFx0UPIV/zxzweb61K9Fxx6wlviwQOU71suVylrUmbXqxIZ+fFAX1
	ik2/coL0rTBWxvFQ7aXPOubQmlZguwJAmh0boYiI3vQeqIlelYqecrHl/G4dzbs47KVZndNHH/ISu
	SU5+GuojdUTp4opbPT/QnyUAwB0j6hJ0e5kcGdB6gB0E1oco7KDMjrDVftokkR2VIQ9ou4t64IvgT
	MK4Gpy3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIrt-0000000C43R-1zA0;
	Tue, 04 Nov 2025 15:22:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIrq-0000000C40X-3NWW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 15:22:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C26D2C41;
	Tue,  4 Nov 2025 07:22:34 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6363A3F66E;
	Tue,  4 Nov 2025 07:22:40 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 04 Nov 2025 15:21:49 +0000
Subject: [PATCH v4 05/15] coresight: Add callback to determine if PM is
 needed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-arm_coresight_path_power_management_improvement-v4-5-3d4bba674709@arm.com>
References: <20251104-arm_coresight_path_power_management_improvement-v4-0-3d4bba674709@arm.com>
In-Reply-To: <20251104-arm_coresight_path_power_management_improvement-v4-0-3d4bba674709@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762269750; l=3106;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=K06J/pLGdgB7jLHbv3GdLGG5zi4DCxP0vERiAg2G4A4=;
 b=+Ffoybtb053Rrw3W/aL5nLCbudSEgg3rQhUvuk//ea3JLWXzX5DajS+MBWDs1Xk8Agbiw7QNg
 AuoBaWLtLN0DQ1UUhbjLDB65gi9j+2omYxU8uidmSdFf48i92uCa4wc
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_072242_987531_F119DAE0 
X-CRM114-Status: GOOD (  15.91  )
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

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c       |  9 ++++++++-
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 16 ++++++++++++++++
 include/linux/coresight.h                          |  1 +
 3 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index f642190740b93555084584abbc1d9426cc87ec7c..0d4e935094297023b8a7786ff4b1b3783164016b 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1586,7 +1586,14 @@ static bool coresight_pm_is_needed(struct coresight_device *csdev)
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
index adb5c6b12c6f3113747f1f455087b1ab497a53f6..da135849c70833366aa1089a0752bc7844c0d96d 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1838,6 +1838,21 @@ static int etm4_dying_cpu(unsigned int cpu)
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
 	int ret = 0;
@@ -1929,6 +1944,7 @@ static const struct coresight_ops etm4_cs_ops = {
 	.trace_id		= coresight_etm_get_trace_id,
 	.pm_save_disable	= etm4_cpu_save,
 	.pm_restore_enable	= etm4_cpu_restore,
+	.pm_is_needed		= etm4_need_save_restore_context,
 	.source_ops		= &etm4_source_ops,
 };
 
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index b10ef4fa17a76b4d11223cc8fd43e5544b6ea8b9..3d59be214dd25dfa7ad9148a6688628e0d1a98dd 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -441,6 +441,7 @@ struct coresight_ops {
 			struct coresight_device *sink);
 	int (*pm_save_disable)(struct coresight_device *csdev);
 	void (*pm_restore_enable)(struct coresight_device *csdev);
+	bool (*pm_is_needed)(struct coresight_device *csdev);
 	const struct coresight_ops_sink *sink_ops;
 	const struct coresight_ops_link *link_ops;
 	const struct coresight_ops_source *source_ops;

-- 
2.34.1


