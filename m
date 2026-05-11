Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B74E9CD37B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 11:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r58PifJ+YkfL5Im2AVWKaoNoOzTZzDOWfPzCP2YVjBU=; b=FnJu/reuUZgJlXKUsb7yPZ6zuw
	b2RagZ2O+/tcDVDy7CzW7Z6c4TJ78d3XEhIirabtbhwkylfTWq+i61pQPRUPyCXdNNWV7tY6q6jfy
	QAPSj2W2ZL12yjvGmUSb5jCxsPigzTRA04P4w7xKN7sjBA133XWw+f3ZGnWQ2gcvsEzU5dl+p2kna
	YirBzjAxglrB5NLbsC57hNRXdIxHNkD8pt156T1+sIA/EiUfxtCFltn4smBVBBgDx/S8Pct1PBM+W
	KBnMxJQU/Qdgig5WxAKtP4ZEjuE0ealNXkaqzXPoBE831t53yVabb2Gn2nXA32nm7LAtNrjrCGE20
	rgwDRccw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOXf-0000000DEoa-1MOc;
	Mon, 11 May 2026 11:11:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOXZ-0000000DElQ-3qV2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 11:11:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7207F22C8;
	Mon, 11 May 2026 04:11:07 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2156E3F85F;
	Mon, 11 May 2026 04:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778497872; bh=G34i7Yc69gRZN4Tqzu1iY8qu2CzYPW3lOWWICcWvd7M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YPvsqI8zeKTW9JhL1BiFIcS5AzPSVl9LG4uiOQycTPorGTOf0ubKnmWAovV6g5bUm
	 3vJ5901uEskFe1PWCZtlg2Lgr53fpUAc6aA1N+aLTfigX31IM1lA0aXaXhhzH8pZWB
	 rWXRJKKWMJdNYWm1Vq9Gz7aQ2TdV+W3Cax8Ad4FA=
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 11 May 2026 12:10:47 +0100
Subject: [PATCH v12 03/28] coresight: Extract device init into
 coresight_init_device()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-arm_coresight_path_power_management_improvement-v12-3-1c9dcb1de8c9@arm.com>
References: <20260511-arm_coresight_path_power_management_improvement-v12-0-1c9dcb1de8c9@arm.com>
In-Reply-To: <20260511-arm_coresight_path_power_management_improvement-v12-0-1c9dcb1de8c9@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, Jie Gan <jie.gan@oss.qualcomm.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778497860; l=2118;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=G34i7Yc69gRZN4Tqzu1iY8qu2CzYPW3lOWWICcWvd7M=;
 b=L2eUA1XxbUR2+Vr0R4g7tV+lbQ9gjZV+HG45ax4LgOjrH5eKh2mkHU5l25VwN3cHovt/tAMuS
 3rJa7R7QA0pDdQ6Ep/mr2dFfooREPuxX0w4pU6nw+4OG9xdpFpsJIts
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_041114_041838_2D9DC90B 
X-CRM114-Status: GOOD (  12.45  )
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

This commit extracts the allocation and initialization of the coresight
device structure into a separate function to make future extensions
easier.

Tested-by: Jie Gan <jie.gan@oss.qualcomm.com>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Tested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index ed17c36ad46ac4270abdfdf2a1a742faa6273097..48ea882bd10870a6be253ecf0b58860d7a4a0bb0 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1331,20 +1331,16 @@ void coresight_release_platform_data(struct device *dev,
 	devm_kfree(dev, pdata);
 }
 
-struct coresight_device *coresight_register(struct coresight_desc *desc)
+static struct coresight_device *
+coresight_init_device(struct coresight_desc *desc)
 {
-	int ret;
 	struct coresight_device *csdev;
-	bool registered = false;
 
 	csdev = kzalloc_obj(*csdev);
-	if (!csdev) {
-		ret = -ENOMEM;
-		goto err_out;
-	}
+	if (!csdev)
+		return ERR_PTR(-ENOMEM);
 
 	csdev->pdata = desc->pdata;
-
 	csdev->type = desc->type;
 	csdev->subtype = desc->subtype;
 	csdev->ops = desc->ops;
@@ -1357,6 +1353,21 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 	csdev->dev.release = coresight_device_release;
 	csdev->dev.bus = &coresight_bustype;
 
+	return csdev;
+}
+
+struct coresight_device *coresight_register(struct coresight_desc *desc)
+{
+	int ret;
+	struct coresight_device *csdev;
+	bool registered = false;
+
+	csdev = coresight_init_device(desc);
+	if (IS_ERR(csdev)) {
+		ret = PTR_ERR(csdev);
+		goto err_out;
+	}
+
 	if (csdev->type == CORESIGHT_DEV_TYPE_SINK ||
 	    csdev->type == CORESIGHT_DEV_TYPE_LINKSINK) {
 		raw_spin_lock_init(&csdev->perf_sink_id_map.lock);

-- 
2.34.1


