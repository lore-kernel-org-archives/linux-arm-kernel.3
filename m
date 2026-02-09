Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF8CE81BAF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 12:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jKkhIwXUQTa83M9BDhWci2BokCrua1Gv3DEabiCBka8=; b=YTaIiFxIh8dLtWbNYTPBV28pdV
	ONJqKQjyIPS73dPglwfGG/gK5y7zR6MXo3h+pTqpq5n8vqboR+0cGghLWorF/+jtHkZeW3F2cDrOs
	ejIo5U5fGZiOJkkYEASnPE/EiwHaih+gRjX2RGE3Df6P6T96gCs/Niwt/Angl1c2r2yEJGm25nq4U
	r4ja7/M2kl3BtjrFc7iSx4f9lwxY04l4fO+TQpyE8hHqMQSpraGwfOlhw/y0w/44rJpbCxDvD3Deb
	7TLKEuUVwP3mv1/JvpadFyx+/hDJayw8Ai/2DzUuwaGKGvs4eynWk/jNeHE3ccIRgy79j6SfkaBww
	Fo49NICw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpQdS-0000000FNMp-0I8d;
	Mon, 09 Feb 2026 12:45:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpQdP-0000000FNKj-2d6w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 12:45:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 328891063;
	Mon,  9 Feb 2026 04:44:52 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C97793F63F;
	Mon,  9 Feb 2026 04:44:56 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 09 Feb 2026 12:44:35 +0000
Subject: [PATCH v4 3/8] coresight: Protect unregistration with mutex
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-arm_coresight_refactor_dev_register-v4-3-62d6042f76f7@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770641090; l=1652;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=nrt2ZS0UrGrkdlIXQ4O1c0Y7/8zYrmAeVRWVzD3tCpY=;
 b=HXJlDqDlNayFLDSU3MBGNUqAUK0yqzFwgtXTzZAm70RxvOBPA0MwvnRi5iulMP2ZUdZZkV46m
 o7+zlM93nHmB1F4eRTsDVr3/MDWYdd3TMSIDqSxVpSZLzU45LR7LeV6
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_044459_723519_82074905 
X-CRM114-Status: GOOD (  10.34  )
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

The device registration is protected by CoreSight mutex to ensure the
atomic operations when adding a device onto bus.  One the other hand,
the locking is absent when unregister a device.

Use mutex to ensure atomicity on device unregistration.  During
unregistration, unbinding the associated CTI device is not included in
the locking region, as CTI has its own locking mechanism.

Fixes: 8c1d3f79d9ca ("coresight: core: Fix coresight device probe failure issue")
Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 26e7ab4005413ab5c59f3ca663b92a681263b488..5aa178b4def336770ae2b7647372174345564776 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1432,14 +1432,17 @@ EXPORT_SYMBOL_GPL(coresight_register);
 
 void coresight_unregister(struct coresight_device *csdev)
 {
-	etm_perf_del_symlink_sink(csdev);
 	/* Remove references of that device in the topology */
 	if (cti_assoc_ops && cti_assoc_ops->remove)
 		cti_assoc_ops->remove(csdev);
+
+	mutex_lock(&coresight_mutex);
+	etm_perf_del_symlink_sink(csdev);
 	coresight_remove_conns(csdev);
 	coresight_clear_default_sink(csdev);
 	coresight_release_platform_data(csdev, csdev->dev.parent, csdev->pdata);
 	device_unregister(&csdev->dev);
+	mutex_unlock(&coresight_mutex);
 }
 EXPORT_SYMBOL_GPL(coresight_unregister);
 

-- 
2.34.1


