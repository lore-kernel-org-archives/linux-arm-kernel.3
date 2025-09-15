Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6594CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 10:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K3vyql+ddBtSK8t1jPrzFOWoUPgfMUN581Cdm9JOHNQ=; b=kTUoCHDCKTAZTZS/7VvoGAZLvE
	s0QJOnz5GbLGuUaacGizYoG8/HbYja3whcnVviaao3sBgCEB/2WTMsp9V9rtpZe428zgvv3qVpzVd
	5tDkoSNxkUzhD6psRzQ7oKuvcYO2nUElOGtCTbwhwOhxEkZPf1MnAY8HAAVpDdip99zggj92z2sU3
	l2CEXXHxh+dKqeVRiIwXXBO3tCE2qzK1mJxuf1B26IbeF95u8Bo3blgzG3lvOG95xdhfKpC68O7Y9
	yR2+QEauBUGEfqwr6mvTY9YKLof6wANpkfzCY77FtuPA66P06IL7rT9oSf/kth5O9LUza2/0Gw58Y
	PTYsLT1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6Xm-00000003gSW-03zR;
	Mon, 15 Sep 2025 10:34:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6XI-00000003fnQ-0uyG
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 15 Sep 2025 10:34:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=K3vyql+ddBtSK8t1jPrzFOWoUPgfMUN581Cdm9JOHNQ=; b=fh/QuVlrrsLy95sIwnMyvBrvlt
	FXZzRXuxAqj09bsRrziow4u2VjNP7i4ayLPoJBXlDk4N6sPi2a2sWBNWBkrBUAnEjTS4cy0HooeT/
	m6iw3YrYvbhOSBpZRQhkdC4UoOeBpE4JKOz6VeMhVek8zwjaEWr0mnweBdt7cOBAqFPZijqaepvri
	O3etfNOk7kiOtax9okVACOhUuLJYX/EV35/TRbgegHXgUPIxq4t+E/Kl+MIPYH1qErgVM9b85JuFV
	9xHpy8dA21gscHf3vVJSuEcTa1O4zVFDjEEzjd4BtdAPOEmv55mYZx/jSYBRywYhBdEr+VMSQOtxB
	lRJqO6xw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6XF-00000006vXt-11fb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 10:34:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5ACF11424;
	Mon, 15 Sep 2025 03:34:04 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F02FC3F66E;
	Mon, 15 Sep 2025 03:34:10 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 15 Sep 2025 11:33:39 +0100
Subject: [PATCH v3 16/31] coresight: Add callback to determine if context
 save/restore is needed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-arm_coresight_power_management_fix-v3-16-ea49e91124ec@arm.com>
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
In-Reply-To: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757932420; l=4323;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=4mZxF9jL9BoGzLjrRY9QNzVs9A0GjlSO8YJXZIZUttc=;
 b=JtiSflXkiEoi/jy3BWVys+EJedp68sWmkB+QQVE71EYm/XXOt+ZWdVEvCEeE0q8J4MIZ3tU1m
 oI5q/TT9JymDpgckihDCB6ERLQAr5I3cEO3qEfFlEtkpW+p25HDdS9p
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_113413_696409_DEC64F47 
X-CRM114-Status: GOOD (  16.26  )
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
whether context save and restore operations are required. The save and
restore flow is skipped if the callback returns false.

The ETMv4 driver implements its own version's callback.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c       | 16 +++++++++++-
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 30 +++++++++++++++++-----
 include/linux/coresight.h                          |  2 ++
 3 files changed, 40 insertions(+), 8 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index f944a610c85e9e3fce43497543ccc48ab7c2c0d9..94803cacf1a374ae8a3b9513d7d029d5c77d5925 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -423,6 +423,20 @@ int coresight_resume_source(struct coresight_device *csdev)
 }
 EXPORT_SYMBOL_GPL(coresight_resume_source);
 
+static bool coresight_need_save_restore_source(struct coresight_device *csdev)
+{
+	if (!csdev)
+		return false;
+
+	if (source_ops(csdev)->need_context_save_restore)
+		return source_ops(csdev)->need_context_save_restore(csdev);
+
+	if (coresight_get_mode(csdev))
+		return true;
+
+	return false;
+}
+
 static int coresight_save_source(struct coresight_device *csdev)
 {
 	if (csdev && source_ops(csdev)->save)
@@ -1597,7 +1611,7 @@ static int coresight_cpu_pm_notify(struct notifier_block *nb, unsigned long cmd,
 	unsigned int cpu = smp_processor_id();
 	struct coresight_device *source = per_cpu(csdev_source, cpu);
 
-	if (!source)
+	if (!coresight_need_save_restore_source(source))
 		return NOTIFY_OK;
 
 	switch (cmd) {
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index ec7e8d09ce58d62dac826fba9edafc967504a1a5..66aefdb002f075446572df9c4eed9093da19a066 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1839,6 +1839,21 @@ static int etm4_dying_cpu(unsigned int cpu)
 	return 0;
 }
 
+static bool etm4_need_context_save_restore(struct coresight_device *csdev)
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
@@ -1927,13 +1942,14 @@ static void etm4_cpu_restore(struct coresight_device *csdev)
 }
 
 static const struct coresight_ops_source etm4_source_ops = {
-	.cpu_id		= etm4_cpu_id,
-	.enable		= etm4_enable,
-	.disable	= etm4_disable,
-	.resume_perf	= etm4_resume_perf,
-	.pause_perf	= etm4_pause_perf,
-	.save		= etm4_cpu_save,
-	.restore	= etm4_cpu_restore,
+	.cpu_id			   = etm4_cpu_id,
+	.enable			   = etm4_enable,
+	.disable		   = etm4_disable,
+	.resume_perf		   = etm4_resume_perf,
+	.pause_perf		   = etm4_pause_perf,
+	.save			   = etm4_cpu_save,
+	.restore		   = etm4_cpu_restore,
+	.need_context_save_restore = etm4_need_context_save_restore,
 };
 
 static const struct coresight_ops etm4_cs_ops = {
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index d0764a9c7692181d2619c277acb83701c6b0115e..39781ba24ee2ad9f3065770409aafb0e5af57fa8 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -400,6 +400,7 @@ struct coresight_ops_link {
  * @disable:	disables tracing for a source.
  * @resume_perf: resumes tracing for a source in perf session.
  * @pause_perf:	pauses tracing for a source in perf session.
+ * @need_context_save_restore: if need to save and restore context.
  * @save:	save context for a source.
  * @restore:	restore context for a source.
  */
@@ -411,6 +412,7 @@ struct coresight_ops_source {
 			struct perf_event *event);
 	int (*resume_perf)(struct coresight_device *csdev);
 	void (*pause_perf)(struct coresight_device *csdev);
+	bool (*need_context_save_restore)(struct coresight_device *csdev);
 	int (*save)(struct coresight_device *csdev);
 	void (*restore)(struct coresight_device *csdev);
 };

-- 
2.34.1


