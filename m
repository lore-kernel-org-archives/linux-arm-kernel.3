Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F8B8F3092E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 10:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3P6P2c4Iw5+YWDw9L+/slOeHIlnZYc3nfNUWz3ea7n0=; b=hBnbfh/qGm8j4mS+D5oEQWarcR
	OT4DYvUAd08dlI1OdRcwfN/e8FEjIcAVcp6FaI4YF0vAGk8Dx3Qa4Hm0pVwNf+E1BHG46WR4ZwJtB
	yNV9liwOi3FMwa4YJiPaayAhVXeSL0bCViU3j/aNSrniaiKOMnH8slFqssotHcAdQnNtVBdGzq5tN
	tPdvJgj9/5UgxZUH43taEowFXZQU7hzYyh58+Y8ozwUveOFO1ToMh9pnLkmMJdRqnJJWdDKxv+OvS
	LvU+OPCXv3HhJ3rbrT2Fcc1TIX696B50hUOcKM88MlGmLdFzfz0PRJND7tXHz2N9UInOwoCJoDkEL
	H0Lg3HJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5mW-00000001Xzx-497b;
	Thu, 05 Mar 2026 10:18:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5mU-00000001Xx6-2m8s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 10:18:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF956339;
	Thu,  5 Mar 2026 02:18:03 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 583D93F694;
	Thu,  5 Mar 2026 02:18:08 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Thu, 05 Mar 2026 10:17:42 +0000
Subject: [PATCH v6 11/19] coresight: etm3x: Set active path on target CPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-arm_coresight_path_power_management_improvement-v6-11-eff765d211a9@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772705864; l=1992;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=sK2XqFxwBGA+OXACqy65yRPL2fBvFDt5FO8ei3MP8sE=;
 b=sAqm33zBqSIlxPNU7jlI1ctHUh6ao1fHV8/mfK0q6uCKtg35EnXYwuFYQo44AdgefleRlTluz
 UXaJKl+/SQbDeqwlnhntRmb9Kzl1bX7e3J7ElS7NY2lGCXXgjzzvB8f
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_021811_526634_48CB3AFE 
X-CRM114-Status: GOOD (  12.46  )
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

Set and clear the path pointer on the target CPU during ETM enable
and disable operations.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm3x-core.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index 2e9e824309bdab5c2983ed1a3e61b27c9d822278..ebbebdf65b774893038e640ac5a75f5195834743 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -441,6 +441,7 @@ static int etm_enable_hw(struct etm_drvdata *drvdata)
 
 struct etm_enable_arg {
 	struct etm_drvdata *drvdata;
+	struct coresight_path *path;
 	int rc;
 };
 
@@ -462,8 +463,12 @@ static void etm_enable_sysfs_smp_call(void *info)
 	arg->rc = etm_enable_hw(arg->drvdata);
 
 	/* The tracer didn't start */
-	if (arg->rc)
+	if (arg->rc) {
 		coresight_set_mode(csdev, CS_MODE_DISABLED);
+		return;
+	}
+
+	csdev->path = arg->path;
 }
 
 static int etm_cpu_id(struct coresight_device *csdev)
@@ -499,10 +504,13 @@ static int etm_enable_perf(struct coresight_device *csdev,
 	ret = etm_enable_hw(drvdata);
 
 	/* Failed to start tracer; roll back to DISABLED mode */
-	if (ret)
+	if (ret) {
 		coresight_set_mode(csdev, CS_MODE_DISABLED);
+		return ret;
+	}
 
-	return ret;
+	csdev->path = path;
+	return 0;
 }
 
 static int etm_enable_sysfs(struct coresight_device *csdev, struct coresight_path *path)
@@ -590,6 +598,7 @@ static void etm_disable_sysfs_smp_call(void *info)
 
 	etm_disable_hw(drvdata);
 
+	drvdata->csdev->path = NULL;
 	coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
 }
 
@@ -614,6 +623,7 @@ static void etm_disable_perf(struct coresight_device *csdev)
 
 	CS_LOCK(drvdata->csa.base);
 
+	drvdata->csdev->path = NULL;
 	coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
 
 	/*

-- 
2.34.1


