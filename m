Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 387F6CD3440
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 14:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V7xF8YRYAbFMiQVrguWOeSanHPO82c1Lh8BR0//EsK8=; b=YRqIU60w44qHniNuSoOOj+dhI+
	Is/myGyZ9PQ12bjX8iiavDyOV893b1ZgLfKPvD5aTgyEtDFoGKE8Wl8T1DLRH0Rtnf6foHmlNZrLm
	r5RHEyd1n1OsZGqrIWbVok5Q75C6okL6RrOhK3V06pkwl6ZN5PkaW6FbI9nK/HGETUuhjPoY0F2Pl
	xUlv67a9AkAGa0I5tXmsO9VRasqkIY7nqmVtGaWUlFWselaDzVy0gIHe4ZM6GbdWJ86nsJGlM1OKO
	/dzOQECmZT/GOKuovpe3RgXXTkYt+ojbBCN4oW6pEASBG7+sJlDO34sN2IThqUqUVCtrlMqRa1kz/
	5Bs0sNKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGPO-0000000GRPu-0s4S;
	Tue, 05 May 2026 14:05:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGPJ-0000000GRKG-1miN;
	Tue, 05 May 2026 14:05:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B95B3027;
	Tue,  5 May 2026 07:05:46 -0700 (PDT)
Received: from e120398-lin.trondheim.arm.com (e120398-lin.trondheim.arm.com [10.42.46.160])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 24CA13F905;
	Tue,  5 May 2026 07:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777989951; bh=zdJqmzSnp5+/bhjrJp/EGOi5xHyCf1RHTudbn1wRpjY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nLmzr7T/TXYtOkfV3AGfj2YRmwWby8LeyYgsM8YDQVWSa2wp/XUbW/QeY6ikcJKL9
	 qYz1xBcxllN6WxUxw1fzHLoGg6DS9vnBO56bIOtt2aOsX87MZO1miHt/u09MPq2FCi
	 90nWbncH1wDLxkAvKwb5VB4+nJ99BUgO+VoHeRAo=
From: Ketil Johnsen <ketil.johnsen@arm.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Florent Tomasin <florent.tomasin@arm.com>,
	Ketil Johnsen <ketil.johnsen@arm.com>
Subject: [PATCH 5/8] drm/panthor: Minor scheduler refactoring
Date: Tue,  5 May 2026 16:05:11 +0200
Message-ID: <20260505140516.1372388-6-ketil.johnsen@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260505140516.1372388-1-ketil.johnsen@arm.com>
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_070553_570815_D132A082 
X-CRM114-Status: GOOD (  13.82  )
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

From: Florent Tomasin <florent.tomasin@arm.com>

Refactor parts of the group scheduling logic into new helper functions.
This will simplify addition of the protected mode feature.

Remove redundant assignments of csg_slot.

Signed-off-by: Florent Tomasin <florent.tomasin@arm.com>
Co-developed-by: Ketil Johnsen <ketil.johnsen@arm.com>
Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 135 +++++++++++++++---------
 1 file changed, 86 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 5ee386338005c..987072bd867c4 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -1934,6 +1934,12 @@ static void csgs_upd_ctx_init(struct panthor_csg_slots_upd_ctx *ctx)
 	memset(ctx, 0, sizeof(*ctx));
 }
 
+static void csgs_upd_ctx_ring_doorbell(struct panthor_csg_slots_upd_ctx *ctx,
+				       u32 csg_id)
+{
+	ctx->update_mask |= BIT(csg_id);
+}
+
 static void csgs_upd_ctx_queue_reqs(struct panthor_device *ptdev,
 				    struct panthor_csg_slots_upd_ctx *ctx,
 				    u32 csg_id, u32 value, u32 mask)
@@ -1944,7 +1950,8 @@ static void csgs_upd_ctx_queue_reqs(struct panthor_device *ptdev,
 
 	ctx->requests[csg_id].value = (ctx->requests[csg_id].value & ~mask) | (value & mask);
 	ctx->requests[csg_id].mask |= mask;
-	ctx->update_mask |= BIT(csg_id);
+
+	csgs_upd_ctx_ring_doorbell(ctx, csg_id);
 }
 
 static int csgs_upd_ctx_apply_locked(struct panthor_device *ptdev,
@@ -1961,8 +1968,12 @@ static int csgs_upd_ctx_apply_locked(struct panthor_device *ptdev,
 	while (update_slots) {
 		struct panthor_fw_csg_iface *csg_iface;
 		u32 csg_id = ffs(update_slots) - 1;
+		u32 req_mask = ctx->requests[csg_id].mask;
 
 		update_slots &= ~BIT(csg_id);
+		if (!req_mask)
+			continue;
+
 		csg_iface = panthor_fw_get_csg_iface(ptdev, csg_id);
 		panthor_fw_update_reqs(csg_iface, req,
 				       ctx->requests[csg_id].value,
@@ -1979,6 +1990,9 @@ static int csgs_upd_ctx_apply_locked(struct panthor_device *ptdev,
 		int ret;
 
 		update_slots &= ~BIT(csg_id);
+		if (!req_mask)
+			continue;
+
 		csg_iface = panthor_fw_get_csg_iface(ptdev, csg_id);
 
 		ret = panthor_fw_csg_wait_acks(ptdev, csg_id, req_mask, &acked, 100);
@@ -2266,12 +2280,76 @@ tick_ctx_cleanup(struct panthor_scheduler *sched,
 	}
 }
 
+static void
+tick_ctx_evict_group(struct panthor_scheduler *sched,
+		     struct panthor_csg_slots_upd_ctx *upd_ctx,
+		     struct panthor_group *group)
+{
+	struct panthor_device *ptdev = sched->ptdev;
+
+	if (drm_WARN_ON(&ptdev->base, group->csg_id < 0))
+		return;
+
+	csgs_upd_ctx_queue_reqs(ptdev, upd_ctx, group->csg_id,
+				group_can_run(group) ?
+				CSG_STATE_SUSPEND : CSG_STATE_TERMINATE,
+				CSG_STATE_MASK);
+}
+
+
+static void
+tick_ctx_reschedule_group(struct panthor_scheduler *sched,
+			  struct panthor_csg_slots_upd_ctx *upd_ctx,
+			  struct panthor_group *group,
+			  int new_csg_prio)
+{
+	struct panthor_device *ptdev = sched->ptdev;
+	struct panthor_fw_csg_iface *csg_iface;
+	struct panthor_csg_slot *csg_slot;
+
+	if (group->csg_id < 0)
+		return;
+
+	csg_iface = panthor_fw_get_csg_iface(ptdev, group->csg_id);
+	csg_slot = &sched->csg_slots[group->csg_id];
+
+	if (csg_slot->priority != new_csg_prio) {
+		panthor_fw_update_reqs(csg_iface, endpoint_req,
+				       CSG_EP_REQ_PRIORITY(new_csg_prio),
+				       CSG_EP_REQ_PRIORITY_MASK);
+		csgs_upd_ctx_queue_reqs(ptdev, upd_ctx, group->csg_id,
+					csg_iface->output->ack ^ CSG_ENDPOINT_CONFIG,
+					CSG_ENDPOINT_CONFIG);
+	}
+}
+
+static void
+tick_ctx_schedule_group(struct panthor_scheduler *sched,
+			struct panthor_sched_tick_ctx *ctx,
+			struct panthor_csg_slots_upd_ctx *upd_ctx,
+			struct panthor_group *group,
+			int csg_id, int csg_prio)
+{
+	struct panthor_device *ptdev = sched->ptdev;
+	struct panthor_fw_csg_iface *csg_iface = panthor_fw_get_csg_iface(ptdev, csg_id);
+
+	group_bind_locked(group, csg_id);
+	csg_slot_prog_locked(ptdev, csg_id, csg_prio);
+
+	csgs_upd_ctx_queue_reqs(ptdev, upd_ctx, csg_id,
+				group->state == PANTHOR_CS_GROUP_SUSPENDED ?
+				CSG_STATE_RESUME : CSG_STATE_START,
+				CSG_STATE_MASK);
+	csgs_upd_ctx_queue_reqs(ptdev, upd_ctx, csg_id,
+				csg_iface->output->ack ^ CSG_ENDPOINT_CONFIG,
+				CSG_ENDPOINT_CONFIG);
+}
+
 static void
 tick_ctx_apply(struct panthor_scheduler *sched, struct panthor_sched_tick_ctx *ctx)
 {
 	struct panthor_group *group, *tmp;
 	struct panthor_device *ptdev = sched->ptdev;
-	struct panthor_csg_slot *csg_slot;
 	int prio, new_csg_prio = MAX_CSG_PRIO, i;
 	u32 free_csg_slots = 0;
 	struct panthor_csg_slots_upd_ctx upd_ctx;
@@ -2282,42 +2360,12 @@ tick_ctx_apply(struct panthor_scheduler *sched, struct panthor_sched_tick_ctx *c
 	for (prio = PANTHOR_CSG_PRIORITY_COUNT - 1; prio >= 0; prio--) {
 		/* Suspend or terminate evicted groups. */
 		list_for_each_entry(group, &ctx->old_groups[prio], run_node) {
-			bool term = !group_can_run(group);
-			int csg_id = group->csg_id;
-
-			if (drm_WARN_ON(&ptdev->base, csg_id < 0))
-				continue;
-
-			csg_slot = &sched->csg_slots[csg_id];
-			csgs_upd_ctx_queue_reqs(ptdev, &upd_ctx, csg_id,
-						term ? CSG_STATE_TERMINATE : CSG_STATE_SUSPEND,
-						CSG_STATE_MASK);
+			tick_ctx_evict_group(sched, &upd_ctx, group);
 		}
 
 		/* Update priorities on already running groups. */
 		list_for_each_entry(group, &ctx->groups[prio], run_node) {
-			struct panthor_fw_csg_iface *csg_iface;
-			int csg_id = group->csg_id;
-
-			if (csg_id < 0) {
-				new_csg_prio--;
-				continue;
-			}
-
-			csg_slot = &sched->csg_slots[csg_id];
-			csg_iface = panthor_fw_get_csg_iface(ptdev, csg_id);
-			if (csg_slot->priority == new_csg_prio) {
-				new_csg_prio--;
-				continue;
-			}
-
-			panthor_fw_csg_endpoint_req_update(ptdev, csg_iface,
-							   CSG_EP_REQ_PRIORITY(new_csg_prio),
-							   CSG_EP_REQ_PRIORITY_MASK);
-			csgs_upd_ctx_queue_reqs(ptdev, &upd_ctx, csg_id,
-						csg_iface->output->ack ^ CSG_ENDPOINT_CONFIG,
-						CSG_ENDPOINT_CONFIG);
-			new_csg_prio--;
+			tick_ctx_reschedule_group(sched, &upd_ctx, group, new_csg_prio--);
 		}
 	}
 
@@ -2354,28 +2402,17 @@ tick_ctx_apply(struct panthor_scheduler *sched, struct panthor_sched_tick_ctx *c
 	for (prio = PANTHOR_CSG_PRIORITY_COUNT - 1; prio >= 0; prio--) {
 		list_for_each_entry(group, &ctx->groups[prio], run_node) {
 			int csg_id = group->csg_id;
-			struct panthor_fw_csg_iface *csg_iface;
+			int csg_prio = new_csg_prio--;
 
-			if (csg_id >= 0) {
-				new_csg_prio--;
+			if (csg_id >= 0)
 				continue;
-			}
 
 			csg_id = ffs(free_csg_slots) - 1;
 			if (drm_WARN_ON(&ptdev->base, csg_id < 0))
 				break;
 
-			csg_iface = panthor_fw_get_csg_iface(ptdev, csg_id);
-			csg_slot = &sched->csg_slots[csg_id];
-			group_bind_locked(group, csg_id);
-			csg_slot_prog_locked(ptdev, csg_id, new_csg_prio--);
-			csgs_upd_ctx_queue_reqs(ptdev, &upd_ctx, csg_id,
-						group->state == PANTHOR_CS_GROUP_SUSPENDED ?
-						CSG_STATE_RESUME : CSG_STATE_START,
-						CSG_STATE_MASK);
-			csgs_upd_ctx_queue_reqs(ptdev, &upd_ctx, csg_id,
-						csg_iface->output->ack ^ CSG_ENDPOINT_CONFIG,
-						CSG_ENDPOINT_CONFIG);
+			tick_ctx_schedule_group(sched, ctx, &upd_ctx, group, csg_id, csg_prio);
+
 			free_csg_slots &= ~BIT(csg_id);
 		}
 	}
-- 
2.43.0


