Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7860AD13C15
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 13:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cLlW2VIp+ZvEBk3pH6QTitSDe4YN5rWXBRIWpTHtyRM=; b=c/fpr1nL7LU+WmW4B/AsDcBZVE
	BD0HP1mokOHfK6rqeEkhIdTWouOinIirwLucPwSy/mk2P8WNlqdRpAU3Dh1ckVXnIa2H3g/HoNbMJ
	qqtrl8/hEdrnhDAJNWus9NQsPSRwvEOJkxSocpRQZH4jx0dzysq2TP2opAz2oyaAWNOXO9uJ301zy
	2vHbvYOXT8z2NsZt0VU1pRopSudjgwSxuRczNBu9VJCfJU340hJDZcVub68FaITemlP+evL/2KtvP
	Q2g5ZfffTh2+oEsIMcCXvmY95jZl/O7KmIE+iiHtWir7DeEtKYjFhHqOsdxqDL5ENsud57AuYVrcA
	fquMu/mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkN1T-0000000CeEW-3Lnr;
	Mon, 26 Jan 2026 13:52:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkN1O-0000000CeAn-0x0T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 13:52:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E18AC1515;
	Mon, 26 Jan 2026 05:52:42 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ACE6B3F632;
	Mon, 26 Jan 2026 05:52:47 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 26 Jan 2026 13:52:05 +0000
Subject: [PATCH v2 5/8] coresight: Refactor sysfs connection group cleanup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-arm_coresight_refactor_dev_register-v2-5-b5a3c0441c15@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769435557; l=4026;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=uxbdugfzF5j/ZRWTDpkTaPtvtlpVlyNyjUAkq+eRg0g=;
 b=SmFtJuI9WQW/3MZqxcEgZ4pzrXa4y33DOhUiDXktIJ4QlNa0wt5sTX5uVluf5LTs9w6BkEci9
 u4QJxuAV+c9Dfo5j4+cEkLz545WYLt7HDGHYJG9Jtrby/LGojMDYinN
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_055250_367784_DF8427BA 
X-CRM114-Status: GOOD (  12.99  )
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
index b4b87b3e0a608a1df19d81ba796d4db7d01290f5..74fdaf3f445d139b493c2d3041884550931291b3 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1197,6 +1197,8 @@ static void coresight_remove_conns(struct coresight_device *csdev)
 		coresight_remove_links(conn->src_dev, conn);
 		conn->dest_dev = NULL;
 	}
+
+	coresight_remove_conns_sysfs_group(csdev);
 }
 
 /**
@@ -1297,8 +1299,7 @@ void coresight_write64(struct coresight_device *csdev, u64 val, u32 offset)
  * coresight_release_platform_data: Release references to the devices connected
  * to the output port of this device.
  */
-void coresight_release_platform_data(struct coresight_device *csdev,
-				     struct device *dev,
+void coresight_release_platform_data(struct device *dev,
 				     struct coresight_platform_data *pdata)
 {
 	int i;
@@ -1316,8 +1317,6 @@ void coresight_release_platform_data(struct coresight_device *csdev,
 	devm_kfree(dev, pdata->out_conns);
 	devm_kfree(dev, pdata->in_conns);
 	devm_kfree(dev, pdata);
-	if (csdev)
-		coresight_remove_conns_sysfs_group(csdev);
 }
 
 struct coresight_device *coresight_register(struct coresight_desc *desc)
@@ -1420,7 +1419,7 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 	}
 
 err_out:
-	coresight_release_platform_data(NULL, desc->dev, desc->pdata);
+	coresight_release_platform_data(desc->dev, desc->pdata);
 	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL_GPL(coresight_register);
@@ -1435,7 +1434,7 @@ void coresight_unregister(struct coresight_device *csdev)
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


