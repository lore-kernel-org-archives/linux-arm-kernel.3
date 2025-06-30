Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E44C8302D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 11:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BLMOl5Z1dHtgN627jQEuWkjboMpwmlw0WhVs4tIsbCs=; b=TGY1W6dPfs3zZopeqNIyZxr72/
	s0EfhVoYvsjUWi8kDWeb0POuR+XFkPTzhsk6kTGjvmHjQRkzczvwIxpXfHGlpt51kBj72Yt7wgSfk
	p13z/mN86B1jWeCLw2R+em7dwDfOaRTEyJr5D0Yody2mIT4l9PBphshEqxDK3JrEcs1uiuBLciSBI
	pmBTh+LVeYQ+aeTcHHBflJGCAvjRUkYSudeZvR5YhJhGe/CNqS1NQFtYOPwuJW6XI3h2oLXtHH5Qu
	NqE2sHRX7t9rtJPuQrb7MJKwK62bbCg8Kq3qrWklhfqG4xS8eVfnkZEVg0v6fjAPtVwnR9mYLzO7v
	Dx5tLa9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWCg4-000000021jZ-19M1;
	Mon, 30 Jun 2025 11:28:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWCBB-00000001xDb-3XJr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 10:56:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B6C31FCD;
	Mon, 30 Jun 2025 03:55:49 -0700 (PDT)
Received: from oss-apollo7005.oss.cambridge.arm.com (oss-apollo7005.oss.lab.cambridge.arm.com [10.7.15.171])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 320183F6A8;
	Mon, 30 Jun 2025 03:56:04 -0700 (PDT)
From: Philip Radford <philip.radford@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com,
	cristian.marussi@arm.com,
	luke.parkin@arm.com,
	philip.radford@arm.com
Subject: [PATCH v2 2/3] firmware: arm_scmi: Add xfer_inflight counter
Date: Mon, 30 Jun 2025 10:55:42 +0000
Message-Id: <20250630105544.531723-3-philip.radford@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250630105544.531723-1-philip.radford@arm.com>
References: <20250630105544.531723-1-philip.radford@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_035605_917955_1900DC4C 
X-CRM114-Status: GOOD (  10.51  )
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

Add a counter to the debug_counters struct to record the current
number of outstanding inflight xfers.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Philip Radford <philip.radford@arm.com>
---
V1->V2
- Amended commit message
---
 drivers/firmware/arm_scmi/common.h |  1 +
 drivers/firmware/arm_scmi/driver.c | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index c6495c4a0e8a..ad9232c982ce 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -305,6 +305,7 @@ enum debug_counters {
 	ERR_MSG_INVALID,
 	ERR_MSG_NOMEM,
 	ERR_PROTOCOL,
+	XFERS_INFLIGHT,
 	SCMI_DEBUG_COUNTERS_LAST
 };
 
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 2699c8efef0a..46f15c5b4998 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -190,6 +190,7 @@ struct scmi_info {
 };
 
 #define handle_to_scmi_info(h)	container_of(h, struct scmi_info, handle)
+#define tx_minfo_to_scmi_info(h) container_of(h, struct scmi_info, tx_minfo)
 #define bus_nb_to_scmi_info(nb)	container_of(nb, struct scmi_info, bus_nb)
 #define req_nb_to_scmi_info(nb)	container_of(nb, struct scmi_info, dev_req_nb)
 
@@ -603,9 +604,14 @@ static inline void
 scmi_xfer_inflight_register_unlocked(struct scmi_xfer *xfer,
 				     struct scmi_xfers_info *minfo)
 {
+	/* In this context minfo will be tx_minfo due to the xfer pending */
+	struct scmi_info *info = tx_minfo_to_scmi_info(minfo);
+
 	/* Set in-flight */
 	set_bit(xfer->hdr.seq, minfo->xfer_alloc_table);
 	hash_add(minfo->pending_xfers, &xfer->node, xfer->hdr.seq);
+	scmi_inc_count(info->dbg->counters, XFERS_INFLIGHT);
+
 	xfer->pending = true;
 }
 
@@ -807,9 +813,13 @@ __scmi_xfer_put(struct scmi_xfers_info *minfo, struct scmi_xfer *xfer)
 	spin_lock_irqsave(&minfo->xfer_lock, flags);
 	if (refcount_dec_and_test(&xfer->users)) {
 		if (xfer->pending) {
+			struct scmi_info *info = tx_minfo_to_scmi_info(minfo);
+
 			scmi_xfer_token_clear(minfo, xfer);
 			hash_del(&xfer->node);
 			xfer->pending = false;
+
+			scmi_dec_count(info->dbg->counters, XFERS_INFLIGHT);
 		}
 		hlist_add_head(&xfer->node, &minfo->free_xfers);
 	}
@@ -2909,6 +2919,7 @@ static const char * const dbg_counter_strs[] = {
 	"err_msg_invalid",
 	"err_msg_nomem",
 	"err_protocol",
+	"xfers_inflight",
 };
 
 static ssize_t reset_all_on_write(struct file *filp, const char __user *buf,
-- 
2.25.1


