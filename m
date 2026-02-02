Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE946E73152
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 09:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zagKUNuOgvsNMyNx+8mudGrQvhOh/KefdKPzNIgKo/k=; b=Fbp/RPsiH/59Wa+CGcfofEqDHE
	uSI1ohTWMUfUbgtOAKX5Y3ovuRflbf5V+SG62kyLkFljBouKR1KXbAdfr85LK12J31DHLfdPGdsQh
	jVS9M25jLHLFLLTZKQQUmdnWpci2p5nHrlF7nwQJ7lXAhVTJg/wElF045lgFtNfs6+ge665vb6bN1
	/P703LJDW9lHqiO3uliHHc5BhRTnsjWGPeKQMJ8o6qnPo8uX6rkb3y3GPFhINSezwS+vacF1N5Q9M
	Aff+nU50zqoN/VF4g5PuMtlzXretS6F5cH6i//YbmD93je0OKrN3XDHZy3LiIMGJyo7J1FSizglZ2
	mAthPZvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmqKL-00000004iGl-2Muj;
	Mon, 02 Feb 2026 09:34:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmqKJ-00000004iF5-0vg9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 09:34:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 58AAC497;
	Mon,  2 Feb 2026 01:34:28 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0C3DD3F740;
	Mon,  2 Feb 2026 01:34:32 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 02 Feb 2026 09:34:01 +0000
Subject: [PATCH v3 5/8] coresight: Refactor sysfs connection group cleanup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-arm_coresight_refactor_dev_register-v3-5-03292470c48c@arm.com>
References: <20260202-arm_coresight_refactor_dev_register-v3-0-03292470c48c@arm.com>
In-Reply-To: <20260202-arm_coresight_refactor_dev_register-v3-0-03292470c48c@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770024862; l=4026;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=fSg16ws2zAtTWy/dti9Wz1xbYIicONDk9nbLxtI65YU=;
 b=sYeDflm5Ygwq0cbLdUZepCJ/8FIi+oN3HHVLnvRFvvyguKd+U1f3XQFBpFHrkAe8GFTM+JdfB
 94Fw2ckBX9CBFm3sPbW7dexAcjFBMq8Ih+oPZmeRz8/a3lLDrgdnB9d
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_013435_407621_F47550F1 
X-CRM114-Status: GOOD (  13.04  )
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

Move the sysfs connection group cleanup into coresight_remove_conns(),
so that the driver removes connections and related sysfs resources in
one go.

As side effect, the csdev argument to coresight_release_platform_data()
is no longer needed; adjust the code for this.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c     | 11 +++++------
 drivers/hwtracing/coresight/coresight-platform.c |  2 +-
 drivers/hwtracing/coresight/coresight-priv.h     |  3 +--
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 4b2cc1806c4f9cdd8a22dbce930973aef41f00c6..b3119832725c08a8375a3a55a11b3bda14b8a3e0 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1200,6 +1200,8 @@ static void coresight_remove_conns(struct coresight_device *csdev)
 		coresight_remove_links(conn->src_dev, conn);
 		conn->dest_dev = NULL;
 	}
+
+	coresight_remove_conns_sysfs_group(csdev);
 }
 
 /**
@@ -1300,8 +1302,7 @@ void coresight_write64(struct coresight_device *csdev, u64 val, u32 offset)
  * coresight_release_platform_data: Release references to the devices connected
  * to the output port of this device.
  */
-void coresight_release_platform_data(struct coresight_device *csdev,
-				     struct device *dev,
+void coresight_release_platform_data(struct device *dev,
 				     struct coresight_platform_data *pdata)
 {
 	int i;
@@ -1319,8 +1320,6 @@ void coresight_release_platform_data(struct coresight_device *csdev,
 	devm_kfree(dev, pdata->out_conns);
 	devm_kfree(dev, pdata->in_conns);
 	devm_kfree(dev, pdata);
-	if (csdev)
-		coresight_remove_conns_sysfs_group(csdev);
 }
 
 struct coresight_device *coresight_register(struct coresight_desc *desc)
@@ -1423,7 +1422,7 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 	}
 
 err_out:
-	coresight_release_platform_data(NULL, desc->dev, desc->pdata);
+	coresight_release_platform_data(desc->dev, desc->pdata);
 	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL_GPL(coresight_register);
@@ -1438,7 +1437,7 @@ void coresight_unregister(struct coresight_device *csdev)
 	etm_perf_del_symlink_sink(csdev);
 	coresight_remove_conns(csdev);
 	coresight_clear_default_sink(csdev);
-	coresight_release_platform_data(csdev, csdev->dev.parent, csdev->pdata);
+	coresight_release_platform_data(csdev->dev.parent, csdev->pdata);
 	device_unregister(&csdev->dev);
 	mutex_unlock(&coresight_mutex);
 }
diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
index 0db64c5f499592e1985141161b4f90fa1f0410b4..0ca3bd762454350d33b5630244d0cfe638ee03fb 100644
--- a/drivers/hwtracing/coresight/coresight-platform.c
+++ b/drivers/hwtracing/coresight/coresight-platform.c
@@ -849,7 +849,7 @@ coresight_get_platform_data(struct device *dev)
 error:
 	if (!IS_ERR_OR_NULL(pdata))
 		/* Cleanup the connection information */
-		coresight_release_platform_data(NULL, dev, pdata);
+		coresight_release_platform_data(dev, pdata);
 	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL_GPL(coresight_get_platform_data);
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index fd896ac07942ec0a4c7acff9f32421352c1efef2..1ea882dffd703b2873e41b4ce0c2564d2ce9bbad 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -239,8 +239,7 @@ static inline void *coresight_get_uci_data_from_amba(const struct amba_id *table
 	return NULL;
 }
 
-void coresight_release_platform_data(struct coresight_device *csdev,
-				     struct device *dev,
+void coresight_release_platform_data(struct device *dev,
 				     struct coresight_platform_data *pdata);
 struct coresight_device *
 coresight_find_csdev_by_fwnode(struct fwnode_handle *r_fwnode);

-- 
2.34.1


