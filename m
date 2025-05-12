Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFAA8C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 16:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z8aNxhPCyC86suPEEBWsn5Vq8NVKcSSCktf0eV6nOpA=; b=cg+Ea/dhlkrfTUZ8Hc/qPSiJJ9
	z/uHt4EtAs2vfJ1yTl/IGsVWAnZY7BIygCjOrj6365vIsTUVE+N3umgD7DuEbhsYqVt+xXka8cnHQ
	+N+RBDa/CO1JHxqLHDdcLevUjSCwBmfs6uMfYGKcXQS3ZPRA6FgveAFFGNusNsG/olf7yor5wH0GU
	I4+jamwCiUAPmLcfD15xJgR7gns5eTBnIyMSb6irnURBYOdFd4Rw6tOY+T0gZjZu5zdJcJWl+tEJM
	IDQiw3+QElrdsU30Iwq2v4CKtiZpeVdzWNpr0zCbop8AShKX+FWw02VwUGolmSO5teL8lIajRUcQz
	caXgHtxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEViz-00000009yiG-3zed;
	Mon, 12 May 2025 16:09:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEVHS-00000009ucr-3qM6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 15:41:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A30641F60;
	Mon, 12 May 2025 08:41:15 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 620A93F63F;
	Mon, 12 May 2025 08:41:25 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mao Jinlong <quic_jinlmao@quicinc.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v1 5/5] coresight: Refine error handling for device registration
Date: Mon, 12 May 2025 16:41:08 +0100
Message-Id: <20250512154108.23920-6-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250512154108.23920-1-leo.yan@arm.com>
References: <20250512154108.23920-1-leo.yan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_084126_997915_368B466E 
X-CRM114-Status: GOOD (  12.73  )
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

When error happens in a device registration, the coresight_unregister()
function is invoked for cleanup.  coresight_unregister() includes the
complete flow for unregisteration a CoreSight device, it causes
redundant operations for some errors.

This commit changes to invoke more specific functions for cleanup
resources for each error.  This can allow the cleanup flow in better
granularity.

As a result, the local "registered" variable is not used anymore, remove
it.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 26 ++++++++------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 4fc82206b326..1eb4f6f0fe40 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1297,7 +1297,6 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 {
 	int ret;
 	struct coresight_device *csdev;
-	bool registered = false;
 
 	csdev = kzalloc(sizeof(*csdev), GFP_KERNEL);
 	if (!csdev) {
@@ -1362,27 +1361,23 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 	    csdev->type == CORESIGHT_DEV_TYPE_LINKSINK) {
 		ret = etm_perf_add_symlink_sink(csdev);
 
-		if (ret) {
-			device_unregister(&csdev->dev);
+		if (ret)
 			/*
 			 * As with the above, all resources are free'd
 			 * explicitly via coresight_device_release() triggered
 			 * from put_device(), which is in turn called from
 			 * function device_unregister().
 			 */
-			goto out_unlock;
-		}
+			goto out_unregister_device;
 	}
-	/* Device is now registered */
-	registered = true;
 
 	ret = coresight_create_conns_sysfs_group(csdev);
 	if (ret)
-		goto out_unlock;
+		goto out_del_symlink_sink;
 
 	ret = coresight_fixup_orphan_conns(csdev);
 	if (ret)
-		goto out_unlock;
+		goto out_remove_conns;
 
 	mutex_unlock(&coresight_mutex);
 
@@ -1390,15 +1385,14 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 		cti_assoc_ops->add(csdev);
 	return csdev;
 
+out_remove_conns:
+	coresight_remove_conns_sysfs_group(csdev);
+out_del_symlink_sink:
+	etm_perf_del_symlink_sink(csdev);
+out_unregister_device:
+	device_unregister(&csdev->dev);
 out_unlock:
 	mutex_unlock(&coresight_mutex);
-
-	/* Unregister the device if needed */
-	if (registered) {
-		coresight_unregister(csdev);
-		return ERR_PTR(ret);
-	}
-
 err_out:
 	/* Cleanup the connection information */
 	coresight_release_platform_data(NULL, csdev->dev.parent, desc->pdata);
-- 
2.34.1


