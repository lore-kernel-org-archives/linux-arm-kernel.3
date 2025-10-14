Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12222CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 11:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xj2HrinRWLbPUs09ELs/QzC1m6nqJVLgGKSvJltJOuo=; b=OVfAf6QwnJ1pTvpK0sW2V7YgEh
	vevcEYUZdc6aX9QuKPT5R+krQdQgvMFlHXArHs0r4zgbjmf25iRJFbtMPn7JNz+OaKFBVR26r1ULN
	8lPhjfMFCbzfrHOCT4ClRkc8N3A7pBRYgmkhbRDRnBTKAdnP3jK5ZLf3OqJ8MTshfpZlCDYpyHTuE
	eCHNA6+roufg02QfDWgW+mD42JwVbR+JdHxT+d8c0oDXnNQvGcdYXmG8Hax0+y8Q50+ArOdgZwxAL
	DFUgRJEfz5JSEMDETt2yvwo2l4Pl3wFAyVWQfI1QdAKGrMdQigGybHfw3GCFhBQdckbMUHveuZxzJ
	LGnWG52g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8dcs-0000000GAcF-0jzd;
	Tue, 14 Oct 2025 11:55:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8dcq-0000000GAak-0swp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 11:55:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D8E531BB2;
	Tue, 14 Oct 2025 04:55:21 -0700 (PDT)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8FC733F6A8;
	Tue, 14 Oct 2025 04:55:28 -0700 (PDT)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com,
	philip.radford@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH 2/3] include: trace: Fix inflight count helper on failed initialization
Date: Tue, 14 Oct 2025 12:53:45 +0100
Message-ID: <20251014115346.2391418-2-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014115346.2391418-1-cristian.marussi@arm.com>
References: <20251014115346.2391418-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_045532_292695_58E336B2 
X-CRM114-Status: GOOD (  11.69  )
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

Add a check to the scmi_inflight_count() helper to catch the condition
when the SCMI debug subsystem as a whole failed initialization.

Fixes: f8e656382b4a ("include: trace:  Add tracepoint support for inflight xfer count")
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/common.h | 8 +++++---
 drivers/firmware/arm_scmi/driver.c | 7 +++++--
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index 21c0b95027c6..7c35c95fddba 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -333,10 +333,12 @@ static inline void scmi_inc_count(struct scmi_debug_info *dbg, int stat)
 	}
 }
 
-static inline void scmi_dec_count(atomic_t *arr, int stat)
+static inline void scmi_dec_count(struct scmi_debug_info *dbg, int stat)
 {
-	if (IS_ENABLED(CONFIG_ARM_SCMI_DEBUG_COUNTERS))
-		atomic_dec(&arr[stat]);
+	if (IS_ENABLED(CONFIG_ARM_SCMI_DEBUG_COUNTERS)) {
+		if (dbg)
+			atomic_dec(&dbg->counters[stat]);
+	}
 }
 
 enum scmi_bad_msg {
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 56419285c0bf..1cd15412024c 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -594,7 +594,7 @@ scmi_xfer_inflight_register_unlocked(struct scmi_xfer *xfer,
 	/* Set in-flight */
 	set_bit(xfer->hdr.seq, minfo->xfer_alloc_table);
 	hash_add(minfo->pending_xfers, &xfer->node, xfer->hdr.seq);
-	scmi_inc_count(info->dbg->counters, XFERS_INFLIGHT);
+	scmi_inc_count(info->dbg, XFERS_INFLIGHT);
 
 	xfer->pending = true;
 }
@@ -803,7 +803,7 @@ __scmi_xfer_put(struct scmi_xfers_info *minfo, struct scmi_xfer *xfer)
 			hash_del(&xfer->node);
 			xfer->pending = false;
 
-			scmi_dec_count(info->dbg->counters, XFERS_INFLIGHT);
+			scmi_dec_count(info->dbg, XFERS_INFLIGHT);
 		}
 		hlist_add_head(&xfer->node, &minfo->free_xfers);
 	}
@@ -3407,6 +3407,9 @@ int scmi_inflight_count(const struct scmi_handle *handle)
 	if (IS_ENABLED(CONFIG_ARM_SCMI_DEBUG_COUNTERS)) {
 		struct scmi_info *info = handle_to_scmi_info(handle);
 
+		if (!info->dbg)
+			return 0;
+
 		return atomic_read(&info->dbg->counters[XFERS_INFLIGHT]);
 	} else {
 		return 0;
-- 
2.51.0


