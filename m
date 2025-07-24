Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED62C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 17:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xJ9BEVHH+d5Ht6+qAZ42pfLENmcG/mkRLb7gV5ij6Wg=; b=hwlZpHkRcTSflKUx+a6Qx8pY5U
	sM0+O2Z9uYIq2t39TaVQ3DqbcO6okakpQfnoTFPO/DzpuJMmqNmOsHHVkRfRjeuOVUhHuAmA5ctnM
	uKlcj+kQfL7++en0s2YjocgCoEvfGYqPgVZbCkUmv6JnIlfa9wp2VneZX/Ih935fM0y7U3uh1YLd4
	AVX4FlxRIAVxtkIJdxlhVL8y6HoRF1v7sOJhZqaKYyo0m013AAQPrU12ZtVoGfSce80mV1w58o8L5
	V790r2FllVS6Je0ZbHsKYAc9FGaraGX5bzUcQQRaOVA0V3xSi0Ipsws88OrHew3AFSnvWVm9NqOq8
	x3+PXwjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uezNR-000000082qv-0e8V;
	Thu, 24 Jul 2025 17:05:05 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueweY-00000007hdj-17U5;
	Thu, 24 Jul 2025 14:10:35 +0000
Received: from [192.168.1.76] (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 050DE1A04;
	Thu, 24 Jul 2025 16:09:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753366194;
	bh=DnyByKVCK9e8LIByMHqQ/KRM1C+sAIkgyijuQbTd5Yw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=b3tuXXYXuouWggunl8jcymqaOR1B8NNCf+TDzx7vIbdx8usDXYLag6kpoGR1DI2/O
	 MKw0rlv0Aqn4FWSol7jr6Kp9JvhbD32uSU3SSZs8QY45KiLbn5yCM1vX1g2aEA1OSP
	 llox/f/LkxVOG/Wkp/OzaIP04E0AU1X1bKWvJS9Y=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 24 Jul 2025 16:10:12 +0200
Subject: [PATCH v2 05/27] media: v4l2-dev: Introduce video device context
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-multicontext-mainline-2025-v2-5-c9b316773486@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9358;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=DnyByKVCK9e8LIByMHqQ/KRM1C+sAIkgyijuQbTd5Yw=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBogj7Oi7DOv+2oMd6oHfFjIY+DwIpJibKZ0VUDA
 n5elJfwmGGJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaII+zgAKCRByNAaPFqFW
 PIKeEACaBYId/cKMoKVepnHcF6swvItlIcef/GgpDlqeARlJvt/FrCHAFlWhJoLeuykGKDzokfh
 Ne15kWRuKWrXwlIp0jq49AUGspJzxuhzIzMyWeSmVB+uyLrq1C9h/9k6SCoVnQssfM+0IF1f6rQ
 lanV6nm66JE3FH+5ZRhyDs/EFKJv4yPs/cp9BP2GnGdK//TUc3ANqFPBlSR+si7MpuGN1J9szBL
 /RVhahVfEyxuspnZO/SVFjMn41RkzwCKnVhFvAM20Raceb4a6Km2PAPUX/w7b9K8+5uBGcI5DbA
 maWK5VoWo3NfQoS6tsXrsuBJROQCHVU9l1ohocJWnCJEETHHg+lUbP7SwEqr2W/q+znrEexUNDS
 4YUsG2c9nck3HkswcWhiQl/KLvOoja3QhOVkjGMQDyY8T+puT7kEpmqmmY9oFj5Cb+RKXGqrqrf
 ci4aXN/LsW47SATVSGGUgwAAO4ppJ6ikvfizP0638jO97ztK9pdzUqcfCu4OZbn+KItQTNo61eE
 NwusXrIxK5V+Rv+NAwC/DZwr73L65NOsZC86vFOHYCmFZIICS41lIrr8bLTCVK1CYbQAVSaXgFl
 MuQhVqcs3MgxYMroNortb9ibtqtCYASuNHmO3Sz0ZNO9MteqiX90OHNPMyedNE42bzxnExMG+Ub
 roQ2H3QBLjEI+1A==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_071034_478940_D52F9AEA 
X-CRM114-Status: GOOD (  25.65  )
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

Introduce a new type in video-device that represents a video device
context. It extends 'struct media_entity_context' to include
video-device specific data and configuration. The new type is intended
to be extended by drivers that can store driver-specific information
in their video device derived types.

The next patch will introduce the VIDIOC_BIND_CONTEXT ioctl that allows
to create a video device context and uniquely associate it with a media
context.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-dev.c |  43 +++++++++++++
 include/media/v4l2-dev.h           | 126 +++++++++++++++++++++++++++++++++++++
 include/media/v4l2-fh.h            |   3 +
 3 files changed, 172 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index c369235113d98ae26c30a1aa386e7d60d541a66e..c83c37843c9e7beb899a4b2bd176273c3dec381b 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -1200,6 +1200,49 @@ struct media_pipeline *video_device_pipeline(struct video_device *vdev)
 }
 EXPORT_SYMBOL_GPL(video_device_pipeline);
 
+struct video_device_context *
+video_device_context_get(struct media_device_context *mdev_context,
+			 struct video_device *vdev)
+{
+	struct media_entity *entity = &vdev->entity;
+	struct media_entity_context *ctx =
+		media_device_get_entity_context(mdev_context, entity);
+
+	if (!ctx)
+		return NULL;
+
+	return container_of(ctx, struct video_device_context, base);
+}
+EXPORT_SYMBOL_GPL(video_device_context_get);
+
+void video_device_context_put(struct video_device_context *ctx)
+{
+	if (!ctx)
+		return;
+
+	media_entity_context_put(&ctx->base);
+}
+EXPORT_SYMBOL_GPL(video_device_context_put);
+
+int video_device_init_context(struct video_device *vdev,
+			      struct video_device_context *ctx)
+{
+	media_entity_init_context(&vdev->entity, &ctx->base);
+
+	ctx->vdev = vdev;
+	mutex_init(&ctx->queue_lock);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(video_device_init_context);
+
+void video_device_cleanup_context(struct video_device_context *ctx)
+{
+	mutex_destroy(&ctx->queue_lock);
+	media_entity_cleanup_context(&ctx->base);
+}
+EXPORT_SYMBOL_GPL(video_device_cleanup_context);
+
 #endif /* CONFIG_MEDIA_CONTROLLER */
 
 /*
diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
index a69801274800f4f9add723b51fe0a31331e88f97..9276e095fb17414a9eb7845db0aa81572c42ca45 100644
--- a/include/media/v4l2-dev.h
+++ b/include/media/v4l2-dev.h
@@ -18,6 +18,7 @@
 #include <linux/videodev2.h>
 
 #include <media/media-entity.h>
+#include <media/videobuf2-core.h>
 
 #define VIDEO_MAJOR	81
 
@@ -660,6 +661,131 @@ __must_check int video_device_pipeline_alloc_start(struct video_device *vdev);
  */
 struct media_pipeline *video_device_pipeline(struct video_device *vdev);
 
+/**
+ * struct video_device_context - The video device context
+ * @base: The media entity context base class member
+ * @vdev: The video device this context belongs to
+ * @queue_lock: Protects the vb2 queue
+ * @queue: The vb2 queue
+ *
+ * This structure represents an isolated execution context of a video device.
+ * This type 'derives' the base 'struct media_entity_context' type which
+ * implements refcounting on our behalf and allows instances of this type to be
+ * linked in the media_device_context contexts list.
+ *
+ * By storing the data and the configuration of a video device in a per-file
+ * handle context, userspace is allowed to multiplex the usage of a single video
+ * device devnode by opening it multiple times and by associating it with a
+ * media device context. This operation is called 'bounding' and is performed
+ * using the VIDIOC_BIND_CONTEXT ioctl.
+ *
+ * A video device context is created and stored in the v4l2-fh file handle
+ * associated with an open file descriptor when a video device is 'bound' to a
+ * media device context. The 'bounding' operation realizes a permanent
+ * association valid until the video device context is released.
+ *
+ * A video device can be bound to the same media device context once only.
+ * Trying to bind the same video device to the same media device context a
+ * second time, without releasing the already established context by closing the
+ * bound file descriptor first, will result in an error.
+ *
+ * To create a video device context userspace shall use the VIDIOC_BIND_CONTEXT
+ * ioctl that creates the video device context and uniquely associates it with a
+ * media device file descriptor.
+ *
+ * Once a video device file descriptor has been bound to a media device context,
+ * all the operations performed on the video device file descriptor will be
+ * directed on the just created video device context. This means, in example,
+ * that the video device format and the buffer queue are isolated from the ones
+ * associated with a different file descriptor obtained by opening again the
+ * same video device devnode but bound to a different media device context.
+ *
+ * Drivers that implement multiplexing support have to provide a valid
+ * implementation of the context-related operations in the
+ * media entity operations.
+ *
+ * Drivers are allowed to sub-class the video_device_context structure by
+ * defining a driver-specific type which embeds a struct video_device_context
+ * instance as first member, and allocate the driver-specific structure size in
+ * their implementation of the `alloc_context` operation.
+ *
+ * Video device contexts are ref-counted by embedding an instance of 'struct
+ * media_entity_context' and are freed once all the references to it are
+ * released.
+ *
+ * A video device context ref-count is increased when:
+ * - The context is created by bounding a video device to a media device context
+ * - The media pipeline starts streaming
+ * A video device context ref-count is decreased when:
+ * - The associated file handle is closed
+ * - The media pipeline stops streaming
+ *
+ * The ref-count is increased by a call to video_device_context_get() and is
+ * reponsibility of the caller to decrease the reference count with a call to
+ * video_device_context_put().
+ */
+struct video_device_context {
+	struct media_entity_context base;
+
+	struct video_device *vdev;
+	/* Protects the vb2 queue. */
+	struct mutex queue_lock;
+	struct vb2_queue queue;
+};
+
+/**
+ * video_device_context_get - Helper to get a video device context from a
+ *			      media device context
+ *
+ * @mdev_context: The media device context
+ * @vdev: The video device the context refers to
+ *
+ * Helper function that wraps media_device_get_entity_context() and returns
+ * the video device context associated with a video device in a media device
+ * context.
+ *
+ * The reference count of the returned video device context is increased.
+ * Callers of this function are required to decrease the reference count of
+ * the context reference with a call to video_device_context_put().
+ */
+struct video_device_context *
+video_device_context_get(struct media_device_context *mdev_context,
+			 struct video_device *vdev);
+
+/**
+ * video_device_context_put - Helper to decrease a video context reference
+ *			      count
+ *
+ * @ctx: The video context to release
+ */
+void video_device_context_put(struct video_device_context *ctx);
+
+/**
+ * video_device_init_context - Initialize the video device context
+ *
+ * @vdev: The video device this context belongs to
+ * @ctx: The context to initialize
+ *
+ * Initialize the video device context. The intended callers of this function
+ * are driver-specific implementations of the media_entity_ops.alloc_context()
+ * function that allocates their driver specific types that derive from
+ * struct video_device_context.
+ */
+int video_device_init_context(struct video_device *vdev,
+			      struct video_device_context *ctx);
+
+/**
+ * video_device_cleanup_context - Cleanup the video device context
+ *
+ * @ctx: The context to cleanup.
+ *
+ * Cleanup the video device context. The intended callers of this function are
+ * driver specific implementation of the media_entity_ops.destroy_context()
+ * function before releasing the memory previously allocated by
+ * media_entity_ops.alloc_context().
+ */
+void video_device_cleanup_context(struct video_device_context *ctx);
+
 #endif /* CONFIG_MEDIA_CONTROLLER */
 
 #endif /* _V4L2_DEV_H */
diff --git a/include/media/v4l2-fh.h b/include/media/v4l2-fh.h
index b5b3e00c8e6a0b082d9cd8a0c972a5094adcb6f2..a8de8613a026589ede94dc3e70c8a49ae08f4582 100644
--- a/include/media/v4l2-fh.h
+++ b/include/media/v4l2-fh.h
@@ -20,6 +20,7 @@
 
 struct video_device;
 struct v4l2_ctrl_handler;
+struct video_device_context;
 
 /**
  * struct v4l2_fh - Describes a V4L2 file handler
@@ -38,6 +39,7 @@ struct v4l2_ctrl_handler;
  * @sequence: event sequence number
  *
  * @m2m_ctx: pointer to &struct v4l2_m2m_ctx
+ * @context: The video device context
  */
 struct v4l2_fh {
 	struct list_head	list;
@@ -54,6 +56,7 @@ struct v4l2_fh {
 	u32			sequence;
 
 	struct v4l2_m2m_ctx	*m2m_ctx;
+	struct video_device_context *context;
 };
 
 /**

-- 
2.49.0


