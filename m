Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72DBAC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 17:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c4wsOYmD9kWmu5Ibl3/zK+7bJDiTsRsMWA7tFeUK4v4=; b=eUnUsbjcCEQG7vG8VDtIcFuO0a
	9dGbZSo3F8ExR6LqG/QtyeEyGVk96FoXmqr3HGW/m9NEAjiSvVKW6KFLah+bARra6z5CT3V7GZBPS
	U4PoGgC3XsbcVS+Lbms67tjUwl2EspMcCCCcOgnjJyF0ArE2Bsy6VtZSkRx/BeV+roaUYWZdIAM0O
	vG+vfBpTAiG4VF4SJUPbDyEwIak4zoFk+Fq9wQ2nEmyjAKFqgOPLJcW3mu3UFe8+A4s15EfWCAszT
	iwCynDbAr45WGUiCpYKvcXKdC6GJL1tkkCPNgUjtQz/C/m8PgaiESwdFFAxaINtt3Gdyfx6tBNoQG
	USGixoTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWeWj-00000006Bp7-2KIj;
	Tue, 01 Jul 2025 17:12:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWcNW-00000005mxn-3mC1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 14:54:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2BFAA236D;
	Tue,  1 Jul 2025 07:54:19 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 71F123F66E;
	Tue,  1 Jul 2025 07:54:32 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 01 Jul 2025 15:53:44 +0100
Subject: [PATCH v2 19/28] coresight: cti: Introduce CS_MODE_DEBUG mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-arm_cs_pm_fix_v3-v2-19-23ebb864fcc1@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751381627; l=3360;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=dUVCxCleBxxUB4v4KfgM+Nv1nRicpaEXJZrToKUmeQM=;
 b=T2iLltm5cFDcWtdXXfS9QOJVQ2mwIUR8E3K5IUI2RH2hkrfGxC0c23ZuOmX8h7/vShKaCNZ+J
 Y/pjxM+5bb7D5+HUVswH4FuLrUq4gCvEAVlaDkOOG1a5TDSR7baCDI8
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_075435_024824_F1C33D65 
X-CRM114-Status: GOOD (  14.92  )
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

Introduce a new CS_MODE_DEBUG mode to indicate that a device is being
used for debugging purposes, e.g, if a system enables CTI for debugging
but not for hardware trace

Update ETM4x driver to mute compiler warnings for the newly added mode.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-cti-sysfs.c  | 2 +-
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 2 ++
 include/linux/coresight.h                          | 9 +++++----
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
index 572b80ee96fbf18ec8cf9abc30d109a676dfbc5d..3e0039f75f5aad104cb86561bf37971c7dc4e408 100644
--- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
@@ -112,7 +112,7 @@ static ssize_t enable_store(struct device *dev,
 		ret = pm_runtime_resume_and_get(dev->parent);
 		if (ret)
 			return ret;
-		ret = cti_enable(drvdata->csdev, CS_MODE_SYSFS, NULL);
+		ret = cti_enable(drvdata->csdev, CS_MODE_DEBUG, NULL);
 		if (ret)
 			pm_runtime_put(dev->parent);
 	} else {
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index d71ac055c3d0b74053279a86ede7e5592f2b2909..93ae8590ae2459db317f6367b6cffbf658b0e2f2 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -932,6 +932,7 @@ static int etm4_enable(struct coresight_device *csdev, struct perf_event *event,
 	case CS_MODE_PERF:
 		ret = etm4_enable_perf(csdev, event, path);
 		break;
+	case CS_MODE_DEBUG:
 	default:
 		ret = -EINVAL;
 	}
@@ -1130,6 +1131,7 @@ static void etm4_disable(struct coresight_device *csdev,
 	mode = coresight_get_mode(csdev);
 
 	switch (mode) {
+	case CS_MODE_DEBUG:
 	case CS_MODE_DISABLED:
 		break;
 	case CS_MODE_SYSFS:
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 4d5c07b7ddc67991a3871851fe45463f92bd32c8..f52e834640b72534ea83ab223aae7544b195bbaa 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -253,10 +253,10 @@ struct coresight_trace_id_map {
  *		by @coresight_ops.
  * @access:	Device i/o access abstraction for this device.
  * @dev:	The device entity associated to this component.
- * @mode:	The device mode, i.e sysFS, Perf or disabled. This is actually
- *		an 'enum cs_mode' but stored in an atomic type. Access is always
- *		through atomic APIs, ensuring SMP-safe synchronisation between
- *		racing from sysFS and Perf mode. A compare-and-exchange
+ * @mode:	The device mode, i.e sysFS, Perf, debug or disabled. This is
+ *		actually an 'enum cs_mode' but stored in an atomic type. Access
+ *		is always through atomic APIs, ensuring SMP-safe synchronisation
+ *		between racing from sysFS and Perf mode. A compare-and-exchange
  *		operation is done to atomically claim one mode or the other.
  * @refcnt:	keep track of what is in use. Only access this outside of the
  *		device's spinlock when the coresight_mutex held and mode ==
@@ -344,6 +344,7 @@ enum cs_mode {
 	CS_MODE_DISABLED,
 	CS_MODE_SYSFS,
 	CS_MODE_PERF,
+	CS_MODE_DEBUG,
 };
 
 #define coresight_ops(csdev)	csdev->ops

-- 
2.34.1


