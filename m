Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 914CAD13C17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 13:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JxQcNX1mLYuZfZqa9ZEGWnBZ9SIdEgr0oMxGQt7HXyA=; b=MGE0KCYZ//bfRUXdL7Pk4JZUDi
	2IctQgi7tcirKFI9uMBTFlvqjG4DRrFJtG4eFkOHTotfkOHy4x5i22hIIN8BeAvSfWXO0JxGAT2d/
	CirhaV4ZTSH2w+G3gdqtbF2F9g68zKOhcC9AIs8oymo3/14eaCIYk/anz30fhF6CKrIGxlDWbPxv7
	Ih/4B4q4F2+m9r46sCgI4cLiAPy++pp7xAlYTBTAiMdtRq0PCdTv7EvfbamMHNR1guVMOkVYlhcsa
	bpafDogOPBcmR9d3jf7Y/ZxNTm2YmX1PrddehWTvFZuZEKkpcWisd/o2+7R94rCoHyqj2pWoO/V45
	dX6yuIHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkN1U-0000000CeFG-0qWH;
	Mon, 26 Jan 2026 13:52:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkN1Q-0000000CeCM-2QLW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 13:52:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F067F339;
	Mon, 26 Jan 2026 05:52:44 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BBDD63F632;
	Mon, 26 Jan 2026 05:52:49 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 26 Jan 2026 13:52:06 +0000
Subject: [PATCH v2 6/8] coresight: Move sink validation into
 etm_perf_add_symlink_sink()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-arm_coresight_refactor_dev_register-v2-6-b5a3c0441c15@arm.com>
References: <20260126-arm_coresight_refactor_dev_register-v2-0-b5a3c0441c15@arm.com>
In-Reply-To: <20260126-arm_coresight_refactor_dev_register-v2-0-b5a3c0441c15@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769435557; l=2473;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=27wpsOgNfNhKBm7GTiE/SuFAA6NmwCB9exJiRjeVwXE=;
 b=J9c/DLlyQSFdVfFEFXO2Ihr7zuPb4RJxlyg2tFRmjVBon1SzloDJYZonMRyTL/+YfVeEcAaUs
 lmD9aJlLQw5BHlYOEmJGAEERG09jzyu28Cb7Sm+hnEVfJ/+Ur1cCK3S
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_055252_742439_FA7C20B7 
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

Move the sink device type checks into etm_perf_add_symlink_sink(), and
return -EOPNOTSUPP for unsupported devices.  This simplifies the
registration flow to invoke etm_perf_add_symlink_sink() unconditionally.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c     | 23 +++++++++--------------
 drivers/hwtracing/coresight/coresight-etm-perf.c |  5 ++++-
 2 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 74fdaf3f445d139b493c2d3041884550931291b3..5c29f78de7f115d61f550dea62b6538940ec9182 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1380,21 +1380,16 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
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


