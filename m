Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC87C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 16:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=58o15MTt9o6e3SHZ374YkfKfn+AkFctVPIweex+20zQ=; b=woCnGR9IbZ6PGw8w4WZRBTy3Wh
	WzKE+EHV+u1WKYBCy6zHG/AhvChwQi0S0CIHtDrKifXlmWrIviDj5LGW/ipBQ4TtMMeorxRK30uA4
	6Bffk3mRhiraOPqExf+t4KwA49zTsLi9YzJ+9V+1J1dZdJ1WzansLHsuffTH8AslQ1QS5yDUxqLKN
	9qFppkEuUBpUgiTs3OgZn222/4aLl/SpoP7bUBu/aq/e1LtoQNLsTNaF3r1o4qHRIKlEoB2WIdCck
	kDCTqMKTwOWP2o2ZWevcEtTruvzZEc+D0d8uCRMvZIrn+VJpSxQT7AnZsPLiS0s9yW27mQToI9wyP
	7Kajq2KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEVaf-00000009xvG-3bAc;
	Mon, 12 May 2025 16:01:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEVHN-00000009uam-3uoB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 15:41:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22D811F60;
	Mon, 12 May 2025 08:41:09 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B8B443F63F;
	Mon, 12 May 2025 08:41:18 -0700 (PDT)
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
Subject: [PATCH v1 1/5] coresight: Correct sink ID map allocation failure handling
Date: Mon, 12 May 2025 16:41:04 +0100
Message-Id: <20250512154108.23920-2-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250512154108.23920-1-leo.yan@arm.com>
References: <20250512154108.23920-1-leo.yan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_084122_016824_02C27180 
X-CRM114-Status: GOOD (  13.85  )
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

When registering a CoreSight device, it first increase the reference
counter for the associated device and then allocates sink ID map.  The
problem happens when the sink ID map allocation fails - the flow misses
decreasing the device's reference counter.  As a result, the device can
never be properly cleaned up after the memory allocation failure.

To fix the issue, the allocation of the sink ID map is moved before
increasing the reference counter.  With this change, if sink ID map
allocation fails, the function can exit without holding a reference to
the device.  Afterwords, any subsequent failures will invoke
coresight_device_release() to release the device's resource, including
decrementing the reference counter.

Fixes: 5ad628a76176 ("coresight: Use per-sink trace ID maps for Perf sessions")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 5632bcb8feb6..3e3823d9f991 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1318,12 +1318,6 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 	csdev->dev.parent = desc->dev;
 	csdev->dev.release = coresight_device_release;
 	csdev->dev.bus = &coresight_bustype;
-	/*
-	 * Hold the reference to our parent device. This will be
-	 * dropped only in coresight_device_release().
-	 */
-	csdev->dev.fwnode = fwnode_handle_get(dev_fwnode(desc->dev));
-	dev_set_name(&csdev->dev, "%s", desc->name);
 
 	if (csdev->type == CORESIGHT_DEV_TYPE_SINK ||
 	    csdev->type == CORESIGHT_DEV_TYPE_LINKSINK) {
@@ -1335,6 +1329,14 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 			goto err_out;
 		}
 	}
+
+	/*
+	 * Hold the reference to our parent device. This will be
+	 * dropped only in coresight_device_release().
+	 */
+	csdev->dev.fwnode = fwnode_handle_get(dev_fwnode(desc->dev));
+	dev_set_name(&csdev->dev, "%s", desc->name);
+
 	/*
 	 * Make sure the device registration and the connection fixup
 	 * are synchronised, so that we don't see uninitialised devices
-- 
2.34.1


