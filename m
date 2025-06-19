Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B4ECC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6/glTBB9LztOOuhFCyQ9VH1qELlRdSCaOqV6UVfgJwQ=; b=GNzsb3EHh2YEbadM2gHx6dBATz
	a5Quv12Gf63ZO/tsKrnZRAeEk/hX6Ilbt7+oFhr0eBk89YICLbXfPNYWuaQBgOh8TKqI1ULRbfe7Q
	lWQ4deUhmmaqG7ARGpt3/nT+DqviOX5g+yvsUytzApGZxqoySxgv08Hrcii5bAV3jG/uXp4EGPClV
	+NmnH7SaMWRA9JFfOj0eRyI3FbvKPe35UHIZwxx2uN8i/42rmnU03sNyntL5TRWSFpNgU1SlMYqnJ
	3S9OW5ZK3w/ZOUukv0TQ2rz7Zi/XKpcb3VgCOZAj7Mmj6Cy90ifZf4D0dKXVIpVvlbyafY3+MBELw
	hdkZD4/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHTg-0000000DV2H-0mai;
	Thu, 19 Jun 2025 15:47:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSEFn-0000000D1km-3JNF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 12:20:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62A85106F;
	Thu, 19 Jun 2025 05:20:07 -0700 (PDT)
Received: from oss-apollo7005.oss.cambridge.arm.com (oss-apollo7005.oss.lab.cambridge.arm.com [10.7.15.171])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2D4BD3F66E;
	Thu, 19 Jun 2025 05:20:26 -0700 (PDT)
From: Philip Radford <philip.radford@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com,
	cristian.marussi@arm.com,
	luke.parkin@arm.com,
	philip.radford@arm.com
Subject: [PATCH 2/4] firmware: arm_scmi: Add xfer_inflight counter
Date: Thu, 19 Jun 2025 12:20:02 +0000
Message-Id: <20250619122004.3705976-3-philip.radford@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250619122004.3705976-1-philip.radford@arm.com>
References: <20250619122004.3705976-1-philip.radford@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_052027_873042_8EFB9A9B 
X-CRM114-Status: GOOD (  10.22  )
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

Added an xfer_inflight counter to the debug_counters struct
to record the current number of inflight xfers

Signed-off-by: Philip Radford <philip.radford@arm.com>
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
index 395fe9289035..5a4dac27afdf 100644
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
@@ -2912,6 +2922,7 @@ static const char * const dbg_counter_strs[] = {
 	"err_msg_invalid",
 	"err_msg_nomem",
 	"err_protocol",
+	"xfers_inflight",
 };
 
 static ssize_t reset_all_on_write(struct file *filp, const char __user *buf,
-- 
2.25.1


