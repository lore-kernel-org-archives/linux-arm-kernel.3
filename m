Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF751E81BB2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 12:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eyavmj2qzvI7OoNmsQU9xLvqciYsK65cOziTZ9uq5IY=; b=xr0deeFFji5P1+Jngun2sy0X8J
	2x4hAQNPYdfiJWL825/BEL8sEPXYLZzI2Vha07r85vW54XR0tBpwkA2m2gTyKQ1Fv6M+wPzycDNTa
	f7lAyok39ifq6J1504UUkV44/oWLR6apWYmh4BEVmKcDa6qlkp6cFFaQ9wEE0uoktKO6GHK900lpb
	pYjT2XUpURNYQ3DQcPT68Hw7QFuVMGetpi+fX/DDVCvdZnjyqvRQDZ0X0kti4NCkw2zYMUejNU8BQ
	yTUTTwoEVTl/DMeg7gRTMUVk+vvnGrzFZPuYPIseef4dV7ZnJkvuDDeOdD5RoIlIy2EogWK9Tk9g1
	MZC33pgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpQdY-0000000FNQp-0EuQ;
	Mon, 09 Feb 2026 12:45:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpQdW-0000000FNP5-0T7o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 12:45:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6079D1063;
	Mon,  9 Feb 2026 04:44:58 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 01CF23F63F;
	Mon,  9 Feb 2026 04:45:02 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 09 Feb 2026 12:44:38 +0000
Subject: [PATCH v4 6/8] coresight: Move sink validation into
 etm_perf_add_symlink_sink()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-arm_coresight_refactor_dev_register-v4-6-62d6042f76f7@arm.com>
References: <20260209-arm_coresight_refactor_dev_register-v4-0-62d6042f76f7@arm.com>
In-Reply-To: <20260209-arm_coresight_refactor_dev_register-v4-0-62d6042f76f7@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770641090; l=2524;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=coABnqyq1oTINu8iCGvzQoykcHtAiqRud0urihj1xFs=;
 b=5/ZlWN0eE9H+zol8YRoUgXvuR9NYSbRmiMCXaIyn0bARvu4MCq/A2wyAZQNDZ+o25J3kIatUi
 jdpgi8bbeKQDbnnDJsCJaEnrNzUuM3/VwEM1It9MuZchmtlA6d9mfMS
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_044506_339540_5A2F91F0 
X-CRM114-Status: GOOD (  12.17  )
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

Move the sink device type checks into etm_perf_add_symlink_sink(), and
return -EOPNOTSUPP for unsupported devices.  This simplifies the
registration flow to invoke etm_perf_add_symlink_sink() unconditionally.

Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c     | 23 +++++++++--------------
 drivers/hwtracing/coresight/coresight-etm-perf.c |  5 ++++-
 2 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index b3119832725c08a8375a3a55a11b3bda14b8a3e0..c694b4bea3d724464e97a4932ead584d59d8a69a 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1383,21 +1383,16 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 		goto out_unlock;
 	}
 
-	if ((csdev->type == CORESIGHT_DEV_TYPE_SINK ||
-	     csdev->type == CORESIGHT_DEV_TYPE_LINKSINK) &&
-	    sink_ops(csdev)->alloc_buffer) {
-		ret = etm_perf_add_symlink_sink(csdev);
+	ret = etm_perf_add_symlink_sink(csdev);
 
-		if (ret) {
-			device_unregister(&csdev->dev);
-			/*
-			 * As with the above, all resources are free'd
-			 * explicitly via coresight_device_release() triggered
-			 * from put_device(), which is in turn called from
-			 * function device_unregister().
-			 */
-			goto out_unlock;
-		}
+	/*
+	 * As with the above, all resources are free'd explicitly via
+	 * coresight_device_release() triggered from put_device(), which is in
+	 * turn called from function device_unregister().
+	 */
+	if (ret && ret != -EOPNOTSUPP) {
+		device_unregister(&csdev->dev);
+		goto out_unlock;
 	}
 	/* Device is now registered */
 	registered = true;
diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 3c8a6f795094bc1da9d8b1d0fda8d58640c87489..3b2a62521396dda819011d336982e960a5bd3d0e 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -902,7 +902,10 @@ int etm_perf_add_symlink_sink(struct coresight_device *csdev)
 
 	if (csdev->type != CORESIGHT_DEV_TYPE_SINK &&
 	    csdev->type != CORESIGHT_DEV_TYPE_LINKSINK)
-		return -EINVAL;
+		return -EOPNOTSUPP;
+
+	if (!sink_ops(csdev)->alloc_buffer)
+		return -EOPNOTSUPP;
 
 	if (csdev->ea != NULL)
 		return -EINVAL;

-- 
2.34.1


