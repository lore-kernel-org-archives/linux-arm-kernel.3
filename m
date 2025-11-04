Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0396ACCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 15:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BztGPxKR7ut1hm1Y4NimJlzH1TqQzuhjU+I7f8G39nQ=; b=HN6kfMUnKcmrlF4s8+8DhNRdxw
	QnT0AgIwdFQNbPP+TP04hUqnSorKXKMeITkQQOBl+cne2Z07/5/m2AsjaqlbEfzLoN3ut2hMUu3eM
	B9myPJ4ilwGQeGm9afj2KrmAiqVeN3xSjWnaEEYFkkioVTCQj+0GxMR+jKWXDp5F8lPwiGnOj4XzI
	FaXQTDBqJYISfkJsRm/C3NH0XwVUAU0CrHZBMTt+aTgvpypcjHU23et1nupr7LKFt8aAbhF513hhk
	K7so5o2fuDWLJqpKuXiXh8WraMIcUW6L5zxH1XmEoq/IqiPtVqQelb6+Iq9Qmdv0vysZQn3WQq3//
	T+MM7+EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIs5-0000000C4KG-0wVF;
	Tue, 04 Nov 2025 15:22:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIs2-0000000C4FD-1jtV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 15:22:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ACBDD1CE0;
	Tue,  4 Nov 2025 07:22:45 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D18E63F66E;
	Tue,  4 Nov 2025 07:22:51 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 04 Nov 2025 15:21:55 +0000
Subject: [PATCH v4 11/15] coresight: Control path during CPU idle
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-arm_coresight_path_power_management_improvement-v4-11-3d4bba674709@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762269750; l=1606;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=dVa6aZvY7VuJY/qFM8AqpXDSYFdnMo/n1Oc9dtd2lDs=;
 b=aBzGFcEMTxuolM1GZcdf8Gx3dhtYVoxQsE5yY6+u5DQGBMAN9IYm+lQHaKqrPq+/h0QXl2G1y
 O/lccc08LoUBu/B37vFc7wzPuGi7kDQR4SoRZoPbWAiywjTAPyUAk/C
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_072254_509272_B56521BC 
X-CRM114-Status: GOOD (  12.00  )
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
 drivers/hwtracing/coresight/coresight-core.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 6c12692efb51c63f3aa9da6f65a349eae1926f4d..73be22c8f315525111f2dafd692e61bc6db85c25 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1661,11 +1661,31 @@ static bool coresight_pm_is_needed(struct coresight_device *csdev)
 
 static int coresight_pm_save(struct coresight_device *csdev)
 {
-	return coresight_ops(csdev)->pm_save_disable(csdev);
+	int ret;
+
+	if (WARN_ON(!csdev->path))
+		return -EINVAL;
+
+	ret = coresight_ops(csdev)->pm_save_disable(csdev);
+	if (ret)
+		return ret;
+
+	coresight_disable_helpers(csdev, NULL);
+	coresight_disable_path_from(csdev->path, NULL, true);
+	return 0;
 }
 
 static void coresight_pm_restore(struct coresight_device *csdev)
 {
+	if (WARN_ON(!csdev->path))
+		return;
+
+	/*
+	 * During CPU idle, the sink device is not accessed, so it is okay to
+	 * pass a NULL pointer for the 'sink_data' parameter.
+	 */
+	coresight_enable_path_internal(csdev->path, coresight_get_mode(csdev),
+				       NULL, true);
 	coresight_ops(csdev)->pm_restore_enable(csdev);
 }
 

-- 
2.34.1


