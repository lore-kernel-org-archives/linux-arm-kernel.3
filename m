Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2CF6CF3941
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sOC9AoLN1RiVAOUSjX1X9TVp+SwMDujYKWK3foOCJ5o=; b=ghkm6CWrWvcNrcCYlkfMl8RQT1
	1NhX070/9Uj9qdGt9l4QboVnHuNdRMrWJNozIY6H+bIln0Nzg4Kp8/t3KY0//bgGHgigNtvxCQH/R
	/JPfYKt9FVFk5Hg3gC4Mw5YrP0gKNmA4MTr9X8QEJFNUxwT9zNnMaM6svglmU8EgzYsewrRtNfH9g
	jypXWEGvMTwKUThstEpNIBQSs9uOkjIvYW/XfRI+lAKnVL2KQKhZW8EYi7ao/avDkNPYLNG+9Bk0z
	LojSjRd0WKjAm7ieFQWOl7Q07+mX6Ysfl+vqkkZqrXXY+AZlnYL/ztLbU/2XkIT9asQyrKrFl6njb
	PGELKPUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkRi-00000003ZVc-0PTg;
	Wed, 19 Nov 2025 15:50:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkRO-00000003Z42-3JKs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 15:49:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5BF92FEC;
	Wed, 19 Nov 2025 07:49:46 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 57E9C3F66E;
	Wed, 19 Nov 2025 07:49:52 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 19 Nov 2025 15:49:13 +0000
Subject: [PATCH v5 15/19] coresight: Add PM callbacks for sink device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-arm_coresight_path_power_management_improvement-v5-15-f615a301ad0b@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763567363; l=2305;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=l/sS9gIg0+3b+XjiKbhoFmdQadDre634YU6B+xqlEyE=;
 b=riz28/SX1nrT5rvcvx2ozn8XmNtJc6ino2GeDND57CA3aM+g7Np2LuU5KUwIAdjvk23APcJtL
 V4V1jr2dkT/B4fBh8DtzsrHrP/5xqyqHvhH0H3kaDyIWZwXziUnQNVd
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_074954_973138_47968E0B 
X-CRM114-Status: GOOD (  10.82  )
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

Unlike a system level's sink, the per-CPU sink may lose power during CPU
idle states. Currently, this refers specifically to TRBE as the sink.

This commit registers save and restore callbacks for the sink via the PM
notifier.

Tested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 7a9f2c1b105d097cee846ba7ff54475483a0c8e0..ee97e4adbc395d4a4aa88846df91b0b53ae0bd8d 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1647,6 +1647,22 @@ static bool coresight_pm_is_needed(struct coresight_device *csdev)
 	return coresight_ops(csdev)->pm_is_needed(csdev);
 }
 
+static int coresight_pm_sink_save(struct coresight_device *sink)
+{
+	if (!sink || !coresight_ops(sink)->pm_save_disable)
+		return 0;
+
+	return coresight_ops(sink)->pm_save_disable(sink);
+}
+
+static void coresight_pm_sink_restore(struct coresight_device *sink)
+{
+	if (!sink || !coresight_ops(sink)->pm_restore_enable)
+		return;
+
+	coresight_ops(sink)->pm_restore_enable(sink);
+}
+
 static int coresight_pm_save(struct coresight_device *csdev)
 {
 	int ret;
@@ -1665,7 +1681,18 @@ static int coresight_pm_save(struct coresight_device *csdev)
 
 	coresight_disable_helpers(csdev, csdev->path);
 	coresight_disable_path(csdev->path);
+
+	ret = coresight_pm_sink_save(coresight_get_sink(csdev->path));
+	if (ret)
+		goto failed_out;
+
 	return 0;
+
+failed_out:
+	coresight_enable_path(csdev->path, coresight_get_mode(csdev));
+	coresight_ops(csdev)->pm_restore_enable(csdev);
+	csdev->path->in_idle = false;
+	return ret;
 }
 
 static void coresight_pm_restore(struct coresight_device *csdev)
@@ -1673,6 +1700,7 @@ static void coresight_pm_restore(struct coresight_device *csdev)
 	if (WARN_ON(!csdev->path))
 		return;
 
+	coresight_pm_sink_restore(coresight_get_sink(csdev->path));
 	coresight_enable_path(csdev->path, coresight_get_mode(csdev));
 	coresight_ops(csdev)->pm_restore_enable(csdev);
 	csdev->path->in_idle = false;

-- 
2.34.1


