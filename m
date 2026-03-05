Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E32CCF3092B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 10:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g7mVQdYYecSLheyWeqc6J1yyQZG7khNJ5LZEH8sPxAg=; b=DfubSI3Y3HPJa+KUcchzvagJza
	+5QMx1HzT4XGVdJnuZCs8Inw848cKiQjoqh9vsWn5CA9Kkw6O1VoKKTcSSaMhVKTUGsMg9ERCEsYO
	KTWj0eLZAnJ8fkLTZFfV8BYYS3eU5Rd2mpykj6mrN/uvtCQxbHWUqobSiiWdPnLEqgH7MX5uhIk7r
	W8qCvb/bcFP5clGbBr6sRnalv/FDokddCdn1CXt3NnbEuGRSc6nYxTCtQGyREMMXWN6y0W0yfsST3
	FRMxFDXB/JkiQMjapwXIT+tdk/ShTRtrn1hhF3MjoFhQd9krIiHLmNKBPheUvEd587IO2PD3LZMDd
	CBMlwl1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5mM-00000001XoS-06Yo;
	Thu, 05 Mar 2026 10:18:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5mJ-00000001Xm2-0Jco
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 10:18:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E303339;
	Thu,  5 Mar 2026 02:17:51 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 684EE3F694;
	Thu,  5 Mar 2026 02:17:55 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Thu, 05 Mar 2026 10:17:36 +0000
Subject: [PATCH v6 05/19] coresight: Add callback to determine if PM is
 needed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-arm_coresight_path_power_management_improvement-v6-5-eff765d211a9@arm.com>
References: <20260305-arm_coresight_path_power_management_improvement-v6-0-eff765d211a9@arm.com>
In-Reply-To: <20260305-arm_coresight_path_power_management_improvement-v6-0-eff765d211a9@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772705864; l=3209;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=V3kIrIfdNYiXZYncUmKXGP6ak6F22of11QgD1CJDhVk=;
 b=IEqLNn1lfxQ+NOt+4m1P2S4+M++FPVUttOtbuNmOCKjdf1jdYtCSOFPKn7iS2nGFTeylwsnWF
 OwY3Wuui7xAA3rtVb7hrWSwTLvvG0EtkTxbiqudxUQyF9BVzoGKrw8t
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_021759_283590_2D88BE0E 
X-CRM114-Status: GOOD (  15.92  )
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
index 5f7930ef537e2877649c404858d9fe6f593af037..6956429ca507d850c8b8c62c65de4b6fe1a1740c 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1681,7 +1681,14 @@ static bool coresight_pm_is_needed(struct coresight_device *csdev)
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
index ab2031647616111d0689442149bcfdb0accbb218..d005983ee1e595f4ddc0b1f87596b1fbe4a0e41a 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1861,6 +1861,21 @@ static int etm4_dying_cpu(unsigned int cpu)
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
@@ -2136,6 +2151,7 @@ static const struct coresight_ops etm4_cs_ops = {
 	.trace_id		= coresight_etm_get_trace_id,
 	.pm_save_disable	= etm4_cpu_save,
 	.pm_restore_enable	= etm4_cpu_restore,
+	.pm_is_needed		= etm4_need_save_restore_context,
 	.source_ops		= &etm4_source_ops,
 };
 
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 63d77a064d9431d512b6407946c403f5c331d086..2de2ef94d2e046effb264cc97e5cd1a61e609249 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -439,6 +439,7 @@ struct coresight_ops {
 			struct coresight_device *sink);
 	int (*pm_save_disable)(struct coresight_device *csdev);
 	void (*pm_restore_enable)(struct coresight_device *csdev);
+	bool (*pm_is_needed)(struct coresight_device *csdev);
 	const struct coresight_ops_sink *sink_ops;
 	const struct coresight_ops_link *link_ops;
 	const struct coresight_ops_source *source_ops;

-- 
2.34.1


