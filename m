Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFCF4D13C13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 13:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mxScxCV+amIZFr4/a6NkgfjUMGzPoeBb8O3haN9Emww=; b=cmBJ6tTCxu9sut+jFaXC/ovgAO
	1INJ2f/tQEMulT2bvrUvS9uhBKL8E5dCRw9nzz1+sPDaiuri2nMAHB9VsD6EvkOhflfZb8kJcVPGG
	MrPh+swlGnkV0MCMiyN8WJQbLRS2vIwcqWJ+C98oQdhskIwXtCPle/0HFx2aeHVeAU29Ko9QlYC9V
	PNzHUfYNPf3ma3R+pl0J5ATvapAR7JUiUped7CblA968N5W+0FD/5CifwKkZaUCjqCcPhKzd7R4Rv
	3DqZDNXdEnexoiDYlR6w3MrJO5p8c4htYXxMIpyokZYy48LVDZu7ZcjWFG3sFtZJooKzr2rqCU48H
	aNkuKVhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkN1q-0000000CeVr-3gm9;
	Mon, 26 Jan 2026 13:53:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkN1Z-0000000CeK1-2fAl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 13:53:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 19C77497;
	Mon, 26 Jan 2026 05:52:49 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D97963F632;
	Mon, 26 Jan 2026 05:52:53 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 26 Jan 2026 13:52:08 +0000
Subject: [PATCH v2 8/8] coresight: Unify error handling in
 coresight_register()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-arm_coresight_refactor_dev_register-v2-8-b5a3c0441c15@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769435557; l=2294;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=DTF22SZMe66CIYK4lzqxzWYf/sXtAO+3p0iCWw5x/m4=;
 b=EEbd/ybBNWTr2Z3VfrBCyH9ZM/rDxeLQ7++72xI76/+xEIBMEpyxYXcZwB/68Yx6FItImmKAn
 H0cU//t0Aa4C6VEVX9TSapPYa41e9Euu0PSc1FIn78JropPLmc6pIsr
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_055302_018184_373E6B60 
X-CRM114-Status: GOOD (  11.84  )
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

Unify error handling during registration:

1) Failures before device registration are handled by err_out, which
   releases platform data.

2) Jump to the out_unlock label on failures after device registration
   to unwind the flow via coresight_unregister().

The "registered" variable is no longer used, remove it.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index c2b5a6efd1c01b0fbfbc289cf27232ccc731ba34..0aa64ee36dd06f86d3f6be1cab3067bf91467686 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1323,7 +1323,6 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 {
 	int ret;
 	struct coresight_device *csdev;
-	bool registered = false;
 
 	csdev = kzalloc(sizeof(*csdev), GFP_KERNEL);
 	if (!csdev) {
@@ -1377,7 +1376,8 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 		 * All resources are free'd explicitly via
 		 * coresight_device_release(), triggered from put_device().
 		 */
-		goto out_unlock;
+		mutex_unlock(&coresight_mutex);
+		goto err_out;
 	}
 
 	ret = etm_perf_add_symlink_sink(csdev);
@@ -1387,12 +1387,8 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 	 * coresight_device_release() triggered from put_device(), which is in
 	 * turn called from function device_unregister().
 	 */
-	if (ret && ret != -EOPNOTSUPP) {
-		device_unregister(&csdev->dev);
+	if (ret && ret != -EOPNOTSUPP)
 		goto out_unlock;
-	}
-	/* Device is now registered */
-	registered = true;
 
 	ret = coresight_create_conns_sysfs_group(csdev);
 	if (ret)
@@ -1412,11 +1408,8 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 out_unlock:
 	mutex_unlock(&coresight_mutex);
 
-	/* Unregister the device if needed */
-	if (registered) {
-		coresight_unregister(csdev);
-		return ERR_PTR(ret);
-	}
+	coresight_unregister(csdev);
+	return ERR_PTR(ret);
 
 err_out:
 	coresight_release_platform_data(desc->dev, desc->pdata);

-- 
2.34.1


