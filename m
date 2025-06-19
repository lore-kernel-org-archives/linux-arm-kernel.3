Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0141C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 17:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pVLMIJhjlTjOr5OmUixiPIVgwMt4xjtoZRsdhKe8fWE=; b=i3+843DY02Sbvjm4yrHAjB8KAO
	sBpEjpp3/RjEWrt4ieeKPt8QinXd/hcv+tiKUNgyQj3HiJ0RpPgTdsSaX5uuMb112oWjWI8795xT9
	qqtHceEPOnD5Av5fA/e9OuF6JzkQslNTXwdXOfJar8BLNPYxXmupijSHsRIzqQyR8gAGWqqEdxbox
	LskgXLComxpReSNi41hrnx+BRWsSwVv/O2lEgVLqV1fRmcrflJWh7oc7+xQ5tChvBy03c4hn2SwXh
	0b029HHvPAxNlz1j14Xa4GNcJih3yvQ4tSPzPZ9nEGR2a8eHDm2MxHqbOsPcv0YYYQCYOkQ5XpS4/
	Aw5hOOkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSIea-0000000Dehz-0yO4;
	Thu, 19 Jun 2025 17:02:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSEFs-0000000D1mc-3QYm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 12:20:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27F61106F;
	Thu, 19 Jun 2025 05:20:12 -0700 (PDT)
Received: from oss-apollo7005.oss.cambridge.arm.com (oss-apollo7005.oss.lab.cambridge.arm.com [10.7.15.171])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DFE263F66E;
	Thu, 19 Jun 2025 05:20:30 -0700 (PDT)
From: Philip Radford <philip.radford@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com,
	cristian.marussi@arm.com,
	luke.parkin@arm.com,
	philip.radford@arm.com
Subject: [PATCH 4/4] firmware: arm_scmi: Add new inflight tracing functionality
Date: Thu, 19 Jun 2025 12:20:04 +0000
Message-Id: <20250619122004.3705976-5-philip.radford@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250619122004.3705976-1-philip.radford@arm.com>
References: <20250619122004.3705976-1-philip.radford@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_052032_980316_FA08D21C 
X-CRM114-Status: GOOD (  13.58  )
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

Adds scmi_inflight_count function to fetch the current xfer
inflight count to use in trace

Signed-off-by: Philip Radford <philip.radford@arm.com>
---
 drivers/firmware/arm_scmi/common.h   |  1 +
 drivers/firmware/arm_scmi/driver.c   | 17 +++++++++++++++--
 drivers/firmware/arm_scmi/raw_mode.c |  5 +++--
 3 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index ad9232c982ce..07b9e629276d 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -505,4 +505,5 @@ static struct platform_driver __drv = {					       \
 void scmi_notification_instance_data_set(const struct scmi_handle *handle,
 					 void *priv);
 void *scmi_notification_instance_data_get(const struct scmi_handle *handle);
+int scmi_inflight_count(const struct scmi_handle *handle);
 #endif /* _SCMI_COMMON_H */
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index c6657582c9ab..d128d497f96e 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -1443,7 +1443,8 @@ static int do_xfer(const struct scmi_protocol_handle *ph,
 
 	trace_scmi_xfer_begin(xfer->transfer_id, xfer->hdr.id,
 			      xfer->hdr.protocol_id, xfer->hdr.seq,
-			      xfer->hdr.poll_completion, 0);
+			      xfer->hdr.poll_completion,
+				  scmi_inflight_count(&info->handle));
 
 	/* Clear any stale status */
 	xfer->hdr.status = SCMI_SUCCESS;
@@ -1479,7 +1480,8 @@ static int do_xfer(const struct scmi_protocol_handle *ph,
 		info->desc->ops->mark_txdone(cinfo, ret, xfer);
 
 	trace_scmi_xfer_end(xfer->transfer_id, xfer->hdr.id,
-			    xfer->hdr.protocol_id, xfer->hdr.seq, ret, 0);
+			    xfer->hdr.protocol_id, xfer->hdr.seq, ret,
+				scmi_inflight_count(&info->handle));
 
 	return ret;
 }
@@ -3416,6 +3418,17 @@ static struct dentry *scmi_debugfs_init(void)
 	return d;
 }
 
+int scmi_inflight_count(const struct scmi_handle *handle)
+{
+	if (IS_ENABLED(CONFIG_ARM_SCMI_DEBUG_COUNTERS)) {
+		struct scmi_info *info = handle_to_scmi_info(handle);
+
+		return atomic_read(&info->dbg->counters[XFERS_INFLIGHT]);
+	} else {
+		return 0;
+	}
+}
+
 static int __init scmi_driver_init(void)
 {
 	scmi_quirks_initialize();
diff --git a/drivers/firmware/arm_scmi/raw_mode.c b/drivers/firmware/arm_scmi/raw_mode.c
index 2ccb6b3f0e64..eebe1a5297ef 100644
--- a/drivers/firmware/arm_scmi/raw_mode.c
+++ b/drivers/firmware/arm_scmi/raw_mode.c
@@ -476,7 +476,7 @@ static void scmi_xfer_raw_worker(struct work_struct *work)
 
 		trace_scmi_xfer_end(xfer->transfer_id, xfer->hdr.id,
 				    xfer->hdr.protocol_id, xfer->hdr.seq,
-				    ret, 0);
+				    ret, scmi_inflight_count(raw->handle));
 
 		/* Wait also for an async delayed response if needed */
 		if (!ret && xfer->async_done) {
@@ -643,7 +643,8 @@ static int scmi_do_xfer_raw_start(struct scmi_raw_mode_info *raw,
 
 	trace_scmi_xfer_begin(xfer->transfer_id, xfer->hdr.id,
 			      xfer->hdr.protocol_id, xfer->hdr.seq,
-			      xfer->hdr.poll_completion, 0);
+			      xfer->hdr.poll_completion,
+				  scmi_inflight_count(raw->handle));
 
 	ret = raw->desc->ops->send_message(rw->cinfo, xfer);
 	if (ret) {
-- 
2.25.1


