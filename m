Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC5F2C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 15:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G1qX3B3nHNOXsqNUalFkvM5w6I4jRhFh7qMVhYbCdZc=; b=O5ks3oKV1fozCKcWk7VI7h1FL4
	qLvplnu87PMYx4drneUSrK0YgxJsxZNGTJrLpwqcg7VG/zPFSaN8/KpT0vFTFHOPnqtcWL3ZNgHBx
	8EIWWAld1y6NLvw3Sh/O8cuIzW2F35I4PcTjLdsTAzdwUnsq9AbQBnmNtGs3QjNq5EoT54us6NwQo
	6+oZdT+QnVkOmJjRz4fr+wljaTTb0ToXZVNZS9DeabutiGKedBovYQK4GkWDaBXBPUazsvi+4TjFr
	HU3DktFVJW2+B09qNkOSNqZnH2FUO8zGgdB77YTQXIE51citsugcsJ6YpoVVoInYOoxzcbKYXPlO6
	uhkGOkow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uey1I-00000007u0m-21X8;
	Thu, 24 Jul 2025 15:38:08 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewel-00000007hmK-44s9;
	Thu, 24 Jul 2025 14:10:49 +0000
Received: from [192.168.1.76] (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B44A2C79;
	Thu, 24 Jul 2025 16:10:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753366208;
	bh=LTlCiL6fmmVVuL8bKDmzSBOA/E25dmRY67EoUr9sHTM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eflzKinzcge3uNK6Yy71BC8PHhXpTWj2kEbEr9oWIREWTg6irW8FYgaC8MAM9wHa8
	 Fv2O5M4BMsi9kI2Hp9ykUzS5Fc91KKj0H34h6eBNQqJlh1diou9IcNRavRj7lmYEx4
	 Eb6gbVOBjx4V9dpNE6cHImYyeS7ISuURAZdD6+Ko=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 24 Jul 2025 16:10:23 +0200
Subject: [PATCH v2 16/27] media: v4l2-subdev: Add subdev state accessor
 helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-multicontext-mainline-2025-v2-16-c9b316773486@ideasonboard.com>
References: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
In-Reply-To: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10156;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=LTlCiL6fmmVVuL8bKDmzSBOA/E25dmRY67EoUr9sHTM=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBogj7QjdzL4huWoPQWt9hdYUH28WTHaaCsqpjeU
 qna2kZzuD6JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaII+0AAKCRByNAaPFqFW
 PGOyD/0SmIsZq5YVWnS8yOYo+Js9CALdRiBwlS1FU+yS7Wah+l/YMy5QZ1c+pvSGbDEexB1IRLB
 Pke0D0N6TmmHG1aXW5ATpJoruhITQ18ZqTGAmguMPvSaJewWfi6nFQ1mt1fDPm4Vnk60cdW+xWI
 GCNb/jqBiJbjAnILhpEN2peDig8jSSM3WPtAeFCaD5y9Jr/oK4Tb7Kgs/itZdwvlZqwXHWJhURw
 QXtWM6PF42A+J3vM3zwcwvMQ4KSL07YfFQDyjP9ai8Xg7d2pLNKx5EvdeH1fqopHM6ZCDt4Cz81
 U1RA9W8W/Lwq2d8ICw6yrn5GUfsh0ySeSlrejapD/96zV+1VW6jenjf04IN4V83N4CHWOJKGL8z
 RJpSloDiHE+8o9+rU3dwWA2AzoslILnPdWyoutRp00T3y32tHYy/yni9c/s+ASoT740dq7enqVl
 geoUDi+v8Qz7uRoh3MJHeW+FvfOtxO6tK+utrj9GpStNIuGcEVYUe7p4C+5KZHGODMPaNHq4ufc
 GIMHQCsdvvE7hm86iaV0nwI6PBD9d6E6vPjdW9Z169PSDrk88wNOEoiOoG9ku1G580l2KFnL08A
 C5wHL6XTGz+NEGuYQwJZC3EGtI0O+20m5RvdBiCFDEpTMvYD3YqnOng4gOY+lz3mCG24zbSfqS+
 u4yXvcT7CyDuhtQ==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_071048_296875_7CFE8E03 
X-CRM114-Status: GOOD (  20.33  )
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

The v4l2-subdev.c file offers three helpers to access the subdevice
active state from a v4l2_subdev pointer:

- v4l2_subdev_get_unlocked_active_state(sd)
- v4l2_subdev_get_locked_active_state(sd)
- v4l2_subdev_lock_and_get_active_state(sd)

With the introduction of struct v4l2_subdev_context which contains a
subdev_state as well, the actual "active" state is stored in three
possible places:
- A context associated with a v4l2_subdev_fh for context aware drivers
  operated by context aware userspace
- The default subdevice context for context aware drivers operated by
  non-context aware userspace
- The subdevice active state for non-context aware drivers

Provide helpers similar in spirit the existing ones but accept as
argument either a subdevice the context itself and retrieve the active
state from the correct place.

Helpers will be used in following patches for link validation.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 101 +++++++++++++++++++++++++++++++++
 include/media/v4l2-subdev.h           | 104 +++++++++++++++++++---------------
 2 files changed, 159 insertions(+), 46 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 438f51980e5ac0f092ba6b0a979a376133968ddf..7372f61127c871cec44a3d1900e2b8bef34632b9 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -20,6 +20,7 @@
 #include <linux/version.h>
 #include <linux/videodev2.h>
 
+#include <media/media-device.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
@@ -189,6 +190,106 @@ static inline int check_pad(struct v4l2_subdev *sd, u32 pad)
 	return 0;
 }
 
+/* subdev state accessor helpers */
+
+/*
+ * Access the state from the subdevice.
+ *
+ * If the driver is context-aware use the state stored in the default context
+ * otherwise use the active state stored in the subdevice.
+ */
+
+struct v4l2_subdev_state *
+v4l2_subdev_get_unlocked_active_state_from_sd(struct v4l2_subdev *sd)
+{
+	if (!sd)
+		return NULL;
+
+	if (sd->default_context) {
+		lockdep_assert_not_held(sd->default_context->state->lock);
+
+		return sd->default_context->state;
+	}
+
+	if (sd->active_state)
+		lockdep_assert_not_held(sd->active_state->lock);
+	return sd->active_state;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_get_unlocked_active_state_from_sd);
+
+struct v4l2_subdev_state *
+v4l2_subdev_get_locked_active_state_from_sd(struct v4l2_subdev *sd)
+{
+	if (!sd)
+		return NULL;
+
+	if (sd->default_context) {
+		lockdep_assert_held(sd->default_context->state->lock);
+
+		return sd->default_context->state;
+	}
+
+	if (sd->active_state)
+		lockdep_assert_held(sd->active_state->lock);
+	return sd->active_state;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_get_locked_active_state_from_sd);
+
+struct v4l2_subdev_state *
+v4l2_subdev_lock_and_get_active_state_from_sd(struct v4l2_subdev *sd)
+{
+	if (!sd)
+		return NULL;
+
+	if (sd->default_context) {
+		v4l2_subdev_lock_state(sd->default_context->state);
+
+		return sd->default_context->state;
+	}
+
+	if (sd->active_state)
+		v4l2_subdev_lock_state(sd->active_state);
+	return sd->active_state;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_lock_and_get_active_state_from_sd);
+
+/* Access the subdevice state from a subdvice context. */
+struct v4l2_subdev_state *
+v4l2_subdev_get_unlocked_active_state_from_ctx(struct v4l2_subdev_context *ctx)
+{
+	if (!ctx)
+		return NULL;
+
+	if (ctx->state)
+		lockdep_assert_not_held(ctx->state->lock);
+	return ctx->state;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_get_unlocked_active_state_from_ctx);
+
+struct v4l2_subdev_state *
+v4l2_subdev_get_locked_active_state_from_ctx(struct v4l2_subdev_context *ctx)
+{
+	if (!ctx)
+		return NULL;
+
+	if (ctx->state)
+		lockdep_assert_held(ctx->state->lock);
+	return ctx->state;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_get_locked_active_state_from_ctx);
+
+struct v4l2_subdev_state *
+v4l2_subdev_lock_and_get_active_state_from_ctx(struct v4l2_subdev_context *ctx)
+{
+	if (!ctx)
+		return NULL;
+
+	if (ctx->state)
+		v4l2_subdev_lock_state(ctx->state);
+	return ctx->state;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_lock_and_get_active_state_from_ctx);
+
 static int check_state(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
 		       u32 which, u32 pad, u32 stream)
 {
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 1fa42a9f322be0be44fc9308744f4f4ae0cf1606..8087c0ae3bc0a0a95512b4b0ff5257522a104ca0 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -29,16 +29,17 @@
 
 #define	V4L2_DEVICE_NOTIFY_EVENT		_IOW('v', 2, struct v4l2_event)
 
-struct v4l2_device;
+struct led_classdev;
+struct media_device_context;
+struct tuner_setup;
 struct v4l2_ctrl_handler;
+struct v4l2_device;
 struct v4l2_event;
 struct v4l2_event_subscription;
 struct v4l2_fh;
+struct v4l2_mbus_frame_desc;
 struct v4l2_subdev;
 struct v4l2_subdev_fh;
-struct tuner_setup;
-struct v4l2_mbus_frame_desc;
-struct led_classdev;
 
 /**
  * struct v4l2_decode_vbi_line - used to decode_vbi_line
@@ -1968,64 +1969,75 @@ static inline void v4l2_subdev_unlock_states(struct v4l2_subdev_state *state1,
 		mutex_unlock(state2->lock);
 }
 
+struct v4l2_subdev_state *
+v4l2_subdev_get_unlocked_active_state_from_sd(struct v4l2_subdev *sd);
+struct v4l2_subdev_state *
+v4l2_subdev_get_locked_active_state_from_sd(struct v4l2_subdev *sd);
+struct v4l2_subdev_state *
+v4l2_subdev_lock_and_get_active_state_from_sd(struct v4l2_subdev *sd);
+
+struct v4l2_subdev_state *
+v4l2_subdev_get_unlocked_active_state_from_ctx(struct v4l2_subdev_context *ctx);
+struct v4l2_subdev_state *
+v4l2_subdev_get_locked_active_state_from_ctx(struct v4l2_subdev_context *ctx);
+struct v4l2_subdev_state *
+v4l2_subdev_lock_and_get_active_state_from_ctx(struct v4l2_subdev_context *ctx);
+
 /**
- * v4l2_subdev_get_unlocked_active_state() - Checks that the active subdev state
- *					     is unlocked and returns it
- * @sd: The subdevice
+ * v4l2_subdev_get_unlocked_active_state() - Checks that the subdev state is
+ *					     unlocked and returns it
+ * @sdctx: The subdevice, or the subdevice context
  *
- * Returns the active state for the subdevice, or NULL if the subdev does not
- * support active state. If the state is not NULL, calls
- * lockdep_assert_not_held() to issue a warning if the state is locked.
+ * Returns the subdevice state, or NULL if it is not valid. If the state is
+ * not NULL, calls lockdep_assert_not_held() to issue a warning if the state
+ * is locked.
  *
- * This function is to be used e.g. when getting the active state for the sole
- * purpose of passing it forward, without accessing the state fields.
+ * This function is to be used e.g. when getting the state for the sole purpose
+ * of passing it forward, without accessing the state fields.
  */
-static inline struct v4l2_subdev_state *
-v4l2_subdev_get_unlocked_active_state(struct v4l2_subdev *sd)
-{
-	if (sd->active_state)
-		lockdep_assert_not_held(sd->active_state->lock);
-	return sd->active_state;
-}
+#define v4l2_subdev_get_unlocked_active_state(sdctx)				\
+	_Generic((sdctx),							\
+		struct v4l2_subdev *: 						\
+			v4l2_subdev_get_unlocked_active_state_from_sd,		\
+		struct v4l2_subdev_context *:					\
+			v4l2_subdev_get_unlocked_active_state_from_ctx)		\
+	(sdctx)
 
 /**
- * v4l2_subdev_get_locked_active_state() - Checks that the active subdev state
- *					   is locked and returns it
- *
- * @sd: The subdevice
+ * v4l2_subdev_get_locked_active_state() - Checks that the subdev state is
+ *					   locked and returns it
+ * @sdctx: The subdevice, or the subdevice context
  *
- * Returns the active state for the subdevice, or NULL if the subdev does not
- * support active state. If the state is not NULL, calls lockdep_assert_held()
- * to issue a warning if the state is not locked.
+ * Returns the subdevice state, or NULL is not valid. If the state is not NULL,
+ * calls lockdep_assert_held() to issue a warning if the state is not locked.
  *
- * This function is to be used when the caller knows that the active state is
+ * This function is to be used when the caller knows that the context state is
  * already locked.
  */
-static inline struct v4l2_subdev_state *
-v4l2_subdev_get_locked_active_state(struct v4l2_subdev *sd)
-{
-	if (sd->active_state)
-		lockdep_assert_held(sd->active_state->lock);
-	return sd->active_state;
-}
+#define v4l2_subdev_get_locked_active_state(sdctx)				\
+	_Generic((sdctx),							\
+		struct v4l2_subdev *:						\
+			v4l2_subdev_get_locked_active_state_from_sd,		\
+		struct v4l2_subdev_context *:					\
+			v4l2_subdev_get_locked_active_state_from_ctx)		\
+	(sdctx)
 
 /**
- * v4l2_subdev_lock_and_get_active_state() - Locks and returns the active subdev
- *					     state for the subdevice
- * @sd: The subdevice
+ * v4l2_subdev_lock_and_get_active_state_from_ctx() - Locks and returns the
+ *						      subdevice state
+ * @sdctx: The subdevice, or the subdevice context
  *
- * Returns the locked active state for the subdevice, or NULL if the subdev
- * does not support active state.
+ * Returns the locked subdevice state, or NULL if it is not valid.
  *
  * The state must be unlocked with v4l2_subdev_unlock_state() after use.
  */
-static inline struct v4l2_subdev_state *
-v4l2_subdev_lock_and_get_active_state(struct v4l2_subdev *sd)
-{
-	if (sd->active_state)
-		v4l2_subdev_lock_state(sd->active_state);
-	return sd->active_state;
-}
+#define v4l2_subdev_lock_and_get_active_state(sdctx)				\
+	_Generic((sdctx),							\
+		struct v4l2_subdev *:						\
+			v4l2_subdev_lock_and_get_active_state_from_sd,		\
+		struct v4l2_subdev_context *:					\
+			v4l2_subdev_get_locked_active_state_from_ctx)		\
+	(sdctx)
 
 /**
  * v4l2_subdev_init - initializes the sub-device struct

-- 
2.49.0


