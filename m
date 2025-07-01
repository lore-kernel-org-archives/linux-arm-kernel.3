Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68218C83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 17:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jKzbdVWqeiGBUjBBes9ErZLuSZPtHGKjBCispVr3BJ0=; b=b2kEoSw0qvPmfhi2BL7OBJ1FXZ
	k2Sku+TCe717985CPX/9epS5XMoT9fzBTrwqhC+7MvenPGTiRzQvhC6JTeEYWKjSS1JFbPPzIXDFt
	da7NnjgO+MXqAFG4W8pH5ADdUyPZhO17Rjuct3TklAOjnt1kJTvYApew/L8gyAb0+flDTwzqS/2pI
	1t9+F+Awj7yB4XLnZHdY8On81WXJYwiXJWuwj2BP61jMhLHC+pg/fjpg538mXpinOtOyxnGU4y4gf
	lOxd/qBRY3R9xEkp/fhsrTsDWDxKivLMlOW/T5sbw6KIFyPPmKSwQ2gIFsDcS4fm8xx35glCrQKy5
	1VDlZHDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWefw-00000006D3O-3FEl;
	Tue, 01 Jul 2025 17:21:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWcNg-00000005n46-1Azu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 14:54:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 908B112FC;
	Tue,  1 Jul 2025 07:54:28 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D5ADB3F66E;
	Tue,  1 Jul 2025 07:54:41 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 01 Jul 2025 15:53:48 +0100
Subject: [PATCH v2 23/28] coresight: Control path during CPU idle
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-arm_cs_pm_fix_v3-v2-23-23ebb864fcc1@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751381627; l=2166;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=9L1EiYgvY38bCT1qDmDUnheuGD4I8DQDte2Ndag5pCw=;
 b=Fgy6ikEzF+BfBZfN+rwxGhriIHc/dM/seJY8qlKEnJjto30WIMD8LgrB4oby5liMO/lgMuODb
 rkY14JfnHEvA8R8apdo5v6gES1n7DL1ub3DoJXb9Pwxxp7DtihUQBBY
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_075444_376097_FE7E5B04 
X-CRM114-Status: GOOD (  13.11  )
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

Control links and helpers on an activated path during CPU idle. Since
coresight_disable_path_from() does not handle a source device's
helpers, explicitly disable them alongside the source device.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index b1c122d1c4164e3ca6f1aaad0bd24917032626be..7693a0eade1a8de6d0960d66f6de682b5d5aff17 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -458,8 +458,15 @@ static bool coresight_need_save_restore_source(struct coresight_device *csdev)
 
 static int coresight_save_source(struct coresight_device *csdev)
 {
-	if (csdev && source_ops(csdev)->save)
-		return source_ops(csdev)->save(csdev);
+	int ret;
+
+	if (csdev && source_ops(csdev)->save) {
+		ret = source_ops(csdev)->save(csdev);
+		if (ret)
+			return ret;
+
+		coresight_disable_helpers(csdev, NULL);
+	}
 
 	/* Return success if callback is not supported */
 	return 0;
@@ -1662,17 +1669,33 @@ static int coresight_cpu_pm_notify(struct notifier_block *nb, unsigned long cmd,
 {
 	unsigned int cpu = smp_processor_id();
 	struct coresight_device *source = per_cpu(csdev_source, cpu);
+	struct coresight_path *path;
 
 	if (!coresight_need_save_restore_source(source))
 		return NOTIFY_OK;
 
+	/*
+	 * When run at here, the source device mode is enabled.
+	 * The activated path pointer must not be NULL.
+	 */
+	path = per_cpu(csdev_cpu_path, source->cpu);
+	if (WARN_ON(!path))
+		return NOTIFY_BAD;
+
 	switch (cmd) {
 	case CPU_PM_ENTER:
 		if (coresight_save_source(source))
 			return NOTIFY_BAD;
+
+		coresight_disable_path_from(path, NULL, true);
 		break;
 	case CPU_PM_EXIT:
 	case CPU_PM_ENTER_FAILED:
+		if (_coresight_enable_path(path,
+					   coresight_get_mode(source),
+					   NULL, true))
+			return NOTIFY_BAD;
+
 		coresight_restore_source(source);
 		break;
 	default:

-- 
2.34.1


