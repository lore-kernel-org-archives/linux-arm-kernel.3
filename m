Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81193E81BB2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 12:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GFCkcPWtfIu65VMrqGwj2YlTMPZNhV/6rXBXrMB5xnw=; b=BV1QspOhqaRNc5yTntr8OzyHDg
	bJutgj05ZZy6ob0hhOj+RWCsw1AWUiHOh7PzDOnY2KtbyuYBCMtZDEfSbEb2OqiY8PD2TziYd7P9p
	B/6jw0BnfJB03aTGXU1dbwBBdSYx5yFYtual7WFcE/ZepTcNfLj2NLaEYl+sWV9gl3PtRsPHEcwvy
	aKoeA3hpIIdJzEpY90jo3a77nBZcFF9pC2aACiPOiYl2czzSJdmAjtSZtrjE+BNxjoPFPPxfADE4I
	gzBMM0vjMRRoQO8zhJXQuZNQWdR+Dc101l2G1ITkzyz7PPyt5drV3iDpQTeyyHiZPCm/2u1tBkqDs
	HTuGe0Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpQdd-0000000FNWO-1twV;
	Mon, 09 Feb 2026 12:45:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpQdZ-0000000FNSC-1JO2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 12:45:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7DFB41063;
	Mon,  9 Feb 2026 04:45:02 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1EFF73F63F;
	Mon,  9 Feb 2026 04:45:06 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 09 Feb 2026 12:44:40 +0000
Subject: [PATCH v4 8/8] coresight: Unify bus unregistration via
 coresight_unregister()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-arm_coresight_refactor_dev_register-v4-8-62d6042f76f7@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770641090; l=1542;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=ozvu735fRRCrA88oOmpcg0vHpswFzERK4w+1qWbR9AE=;
 b=L7ZdoDbBLYGSJC9rCOxkQFjvVOYYApROpsvNLpnKCJ3lzQzVe7ytJ5moeZCcGIDZYmgsa418f
 +M75VOAydXKBCr4rEb5ZA/HsdceVdkpTjBmNTTQv8znyXaZnb1Mh1yq
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_044509_431609_80EE3C6E 
X-CRM114-Status: GOOD (  12.85  )
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

Once a device is successfully registered, set the "registered" flag to
true.  After that point, all failures jump to the out_unlock label to
unwind the flow via coresight_unregister().

Since failure handling is unified, the comment about resource release
for the etm_perf_add_symlink_sink() failure is no need, remove it.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 955af43010446803030973c72f07315492b2fcf3..56320ce49cb23bf7168f69b7f1ad820ca83b8365 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1383,20 +1383,13 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 		goto out_unlock;
 	}
 
-	ret = etm_perf_add_symlink_sink(csdev);
-
-	/*
-	 * As with the above, all resources are free'd explicitly via
-	 * coresight_device_release() triggered from put_device(), which is in
-	 * turn called from function device_unregister().
-	 */
-	if (ret && ret != -EOPNOTSUPP) {
-		device_unregister(&csdev->dev);
-		goto out_unlock;
-	}
 	/* Device is now registered */
 	registered = true;
 
+	ret = etm_perf_add_symlink_sink(csdev);
+	if (ret && ret != -EOPNOTSUPP)
+		goto out_unlock;
+
 	ret = coresight_create_conns_sysfs_group(csdev);
 	if (ret)
 		goto out_unlock;

-- 
2.34.1


