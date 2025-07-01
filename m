Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 029F7C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 16:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DSFkWqScjKxehn98gn7fp9IlfvqDAcfwOCQBtnYQ8K8=; b=Tx7tbeucOhPgAWF2lUuIIfTUAN
	neXai02GiTFI3emNek1hBKWnkealS7yP5gSHLKz4Vtf4XSNJ4NiitW9xycPMyE9lj/6mTNGl+qDsh
	tw7zmcF2+gy9S498O3ELMeAuKpmDcerY3vQO1Y5JcZcgh5phbZBsIamcapvXq+oAanVFoiwCND38k
	tBcNtqs0xiWjs4H1ZgSSii1SmzZqznsm+v+0NfQlkr9OsVMIax4y5F7NFp0UPQZ9VeOesTgWZB8jJ
	6h86T/Fai/N0nAHL5Y2kGwj1cxZbCTNjF098ho6ewZFTGaCjOZD88Il2oQxh/On25lPyet+asS38G
	b2OqXgDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWe7G-000000065n9-3ApW;
	Tue, 01 Jul 2025 16:45:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWcN6-00000005mk0-48Tq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 14:54:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B3D012FC;
	Tue,  1 Jul 2025 07:53:53 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 90BFB3F66E;
	Tue,  1 Jul 2025 07:54:06 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 01 Jul 2025 15:53:33 +0100
Subject: [PATCH v2 08/28] coresight: etm4x: Remove the state_needs_restore
 flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-arm_cs_pm_fix_v3-v2-8-23ebb864fcc1@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751381627; l=3440;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=O1pI0iF9hTryWdOQgp3cU1VgAjwnoi8ZWBPkrrj4lyQ=;
 b=dYOZvCM3nvqRLI36PKBsdDWkTy0rDNrp6alwsu3pxbeJTHsUs2gX2QTCQ7ygC+VbaD91lFLMp
 EZGEldNbONWDk050LHG9bQ78FZepIz3RZbVWMq76LbKlM1+XRBaCC5i
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_075409_147359_8255AAB0 
X-CRM114-Status: GOOD (  18.15  )
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

When the restore flow is invoked, it means no error occurred during the
save phase. Otherwise, if any errors happened while saving the context,
the function would return an error and abort the suspend sequence.

Therefore, the state_needs_restore flag is unnecessary. The save and
restore functions are changed to check two conditions:

1) The global flag pm_save_enable is SELF_HOSTED mode;
2) The device is in active mode (non DISABLED).

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 14 ++++++++------
 drivers/hwtracing/coresight/coresight-etm4x.h      |  2 --
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 6cd76a2527cf11752963a7cb1b3b0e9a8be241f0..1faf8614366f38eea4909152558fe8e69730bde4 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1981,8 +1981,6 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
 		goto out;
 	}
 
-	drvdata->state_needs_restore = true;
-
 	/*
 	 * Power can be removed from the trace unit now. We do this to
 	 * potentially save power on systems that respect the TRCPDCR_PU
@@ -2000,11 +1998,14 @@ static int etm4_cpu_save(struct etmv4_drvdata *drvdata)
 {
 	int ret = 0;
 
+	if (pm_save_enable != PARAM_PM_SAVE_SELF_HOSTED)
+		return 0;
+
 	/*
 	 * Save and restore the ETM Trace registers only if
 	 * the ETM is active.
 	 */
-	if (coresight_get_mode(drvdata->csdev) && drvdata->save_state)
+	if (coresight_get_mode(drvdata->csdev))
 		ret = __etm4_cpu_save(drvdata);
 	return ret;
 }
@@ -2093,8 +2094,6 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
 	if (!drvdata->skip_power_up)
 		etm4x_relaxed_write32(csa, state->trcpdcr, TRCPDCR);
 
-	drvdata->state_needs_restore = false;
-
 	/*
 	 * As recommended by section 4.3.7 ("Synchronization when using the
 	 * memory-mapped interface") of ARM IHI 0064D
@@ -2120,7 +2119,10 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
 
 static void etm4_cpu_restore(struct etmv4_drvdata *drvdata)
 {
-	if (drvdata->state_needs_restore)
+	if (pm_save_enable != PARAM_PM_SAVE_SELF_HOSTED)
+		return;
+
+	if (coresight_get_mode(drvdata->csdev))
 		__etm4_cpu_restore(drvdata);
 }
 
diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index 4d32605a84ce91eae2101cd83cad5f5317e2638a..06438ed1071478cd5c1a143c6ef58a926d6992fb 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -978,7 +978,6 @@ struct etmv4_save_state {
  *		in EL2. Otherwise, 0.
  * @config:	structure holding configuration parameters.
  * @save_state:	State to be preserved across power loss
- * @state_needs_restore: True when there is context to restore after PM exit
  * @skip_power_up: Indicates if an implementation can skip powering up
  *		   the trace unit.
  * @paused:	Indicates if the trace unit is paused.
@@ -1032,7 +1031,6 @@ struct etmv4_drvdata {
 	u64				trfcr;
 	struct etmv4_config		config;
 	struct etmv4_save_state		*save_state;
-	bool				state_needs_restore;
 	bool				skip_power_up;
 	bool				paused;
 	DECLARE_BITMAP(arch_features, ETM4_IMPDEF_FEATURE_MAX);

-- 
2.34.1


