Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF0DC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 17:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+YZLenI0YgsyMdw/dKFXSG7/eje3107P2de1xWqmr5g=; b=GEcsmrhztA8rT5xWueJNyoSdj5
	2AcWGF87pXyi2Q+FcHQeqef9OFpe8YRFK1MAHh2eoUlygfFlXdM2UFxwkBCGx+QkKXJ9/mXgWLPen
	SS7f7+PMw3Lz2xICLXLfIEnH9CkdaBLo1gOHdRhLc3son++3Spo9yGwk2Oc8QSQozjUZ33EQnBBY9
	hcjwmByYpU7dzwo+C/rXTI2BmF1/fAqrBtSh0/0KbzuP4+AxJzI/NEhw3VQOIaqaFPbaDarWAjWlI
	zlsh2hlnDoq/XHJZ8PCptxqYFf9dDBjz4k8Ua5zs8pr+buPgb+F/jp6PAXu88G8AOcTRoIzmFVbwg
	iHdiBopg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uezNS-000000082sh-3oTY;
	Thu, 24 Jul 2025 17:05:06 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueweb-00000007hgS-29oo;
	Thu, 24 Jul 2025 14:10:38 +0000
Received: from [192.168.1.76] (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9004511E6;
	Thu, 24 Jul 2025 16:09:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753366197;
	bh=EonmGcn1CUXqn+CIokljWT6wYvOQxvsBhcP+HctWnYE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AjF3sWSq68zt55kJCCUOopuuNLaJDase9nep7waIbMpdT9bKqbLp73uRP+EyHGiz/
	 XJ9TEzdr5eTl5Q0sTjNMB2AJPlBfWeHXonAkLD5atf2mdeHVA0HO3JWTYZ/oFLmif0
	 wSnGIPipdA31TvGohJgyx3kLEWwpETnc8loppMOc=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 24 Jul 2025 16:10:15 +0200
Subject: [PATCH v2 08/27] media: v4l2-dev: Introduce default contexts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-multicontext-mainline-2025-v2-8-c9b316773486@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6550;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=EonmGcn1CUXqn+CIokljWT6wYvOQxvsBhcP+HctWnYE=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBogj7PjcILge5KUnOifnWuZ7nZx7uQeQKECHpY2
 G+SWA6TyKyJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaII+zwAKCRByNAaPFqFW
 PMX0EAC/huwTM3l8S09cYRp9M8if3pLVvCeVwHz/66atuq4vFNHvn9xZ+ko+6dIYvnruFRcScOn
 T9S8xd42vHSA3QJhfiMarHLXTSU5pETGAA0mwSarBKa3WfdjuoQ3h6XdC0n6IaOITsswQm9sjJU
 +XJvyn69hmZkfIBKKFvysvc8LdcJEsi7hJbUaCxIagliVLS17+LgAW+uClTt2DAS4/CftGDxRkF
 ePdUcDKqQsIwgimJ6dQnFkdj0zjQPPNlWpOHumZ3YQyMmL/8Kk7uI/1f/0hunPmbm/VN1pd4vSq
 32SCmQ9pqKLwcZtAr8bWiDl7MTNxv34lEj6hJikTarDlOC8BSTs2Zhly6eBuM3N7s6om1jxc8QM
 PFBIQ2ZZHRG7oNqV7ruLHpdw09faHKrHELVEsGox7VLj4k6P3el3S77woBDjeWtDdKqCGLd90O0
 mUQJvU+9ropfcDfwbM/s4voDWc5rmS0/UHwsVKo7KF2PhnN+hiX1L0FNVk5QSS6ziri36MA64lK
 QYIaUqqdXPdy6TE8bkDqvsJErM4AqQO0fZR0hDoKr5trTpSVrd2r+6cjEtCzUZFgUL8gAA5dOuL
 YOUZgYGdz5KLpryryVHAxvdsw8eUDHzMgjNPs69K0SjPjDkg31uymZPZ+qge3Zg7Qur4w8Iod5U
 krnA9TT+YTKLRKw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_071037_703100_84E23D53 
X-CRM114-Status: GOOD (  19.46  )
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

Introduce the media device and video device default contexts.

Drivers ported to use multi-context support that used to work with a
non-context aware userspace (which doesn't call VIDIOC_BIND_CONTEXT)
shall continue to work even if they are context aware.

Provide a default context in the media device and in the video device
structures and let drivers allocate and release them with the newly
introduced operations.

Bind the video device default context to the default context of the
media device associated with the v4l2_dev.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/mc/mc-device.c       | 11 +++++++++
 drivers/media/v4l2-core/v4l2-dev.c | 46 +++++++++++++++++++++++++++++++++++---
 include/media/media-device.h       |  5 +++++
 include/media/v4l2-dev.h           |  3 +++
 4 files changed, 62 insertions(+), 3 deletions(-)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index d8f12db933d22ae7466051698d853f4bdc599400..e1f34f884fee2e8c3750f9c1e85142ff2f6b7bf0 100644
--- a/drivers/media/mc/mc-device.c
+++ b/drivers/media/mc/mc-device.c
@@ -746,12 +746,23 @@ void media_device_init(struct media_device *mdev)
 		media_set_bus_info(mdev->bus_info, sizeof(mdev->bus_info),
 				   mdev->dev);
 
+	mdev->default_context = NULL;
+	if (mdev->ops &&
+	    mdev->ops->alloc_context && mdev->ops->destroy_context) {
+		if (mdev->ops->alloc_context(mdev, &mdev->default_context)) {
+			dev_err(mdev->dev,
+				"Failed to initialize media device default context\n");
+			return;
+		}
+	}
+
 	dev_dbg(mdev->dev, "Media device initialized\n");
 }
 EXPORT_SYMBOL_GPL(media_device_init);
 
 void media_device_cleanup(struct media_device *mdev)
 {
+	media_device_context_put(mdev->default_context);
 	ida_destroy(&mdev->entity_internal_idx);
 	mdev->entity_internal_idx_max = 0;
 	media_graph_walk_cleanup(&mdev->pm_count_walk);
diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index bc6502b4ce21cc0ad53136e1637d1c926e31dd89..2d78096931efd88215bc847b105e198a54035546 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -31,6 +31,8 @@
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-event.h>
 
+#include <media/media-device.h>
+
 #define VIDEO_NUM_DEVICES	256
 #define VIDEO_NAME              "video4linux"
 
@@ -220,8 +222,13 @@ static void v4l2_device_release(struct device *cd)
 	if (v4l2_dev->release == NULL)
 		v4l2_dev = NULL;
 
-	/* Release video_device and perform other
-	   cleanups as needed. */
+	/* Release default context. */
+#ifdef CONFIG_MEDIA_CONTROLLER
+	video_device_context_put(vdev->default_context);
+#endif
+	vdev->default_context = NULL;
+
+	/* Release video_device and perform other cleanups as needed. */
 	vdev->release(vdev);
 
 	/* Decrease v4l2_device refcount */
@@ -1086,7 +1093,36 @@ int __video_register_device(struct video_device *vdev,
 	/* Part 5: Register the entity. */
 	ret = video_register_media_controller(vdev);
 
-	/* Part 6: Activate this minor. The char device can now be used. */
+	/*
+	 * Part 6: Complete the video device registration by initializing the
+	 * default context. The defaul context serves for context-aware driver
+	 * to operate with a non-context-aware userspace that never creates
+	 * new contexts. If the video device driver is not context aware, it
+	 * will never implement 'context_ops' and will never use the default
+	 * context.
+	 */
+	vdev->default_context = NULL;
+#ifdef CONFIG_MEDIA_CONTROLLER
+	if (vdev->entity.ops && vdev->entity.ops->alloc_context &&
+	    vdev->entity.ops->destroy_context) {
+		ret = vdev->entity.ops->alloc_context(&vdev->entity,
+					(struct media_entity_context **)
+					&vdev->default_context);
+		if (ret) {
+			pr_err("%s: default context alloc failed\n", __func__);
+			goto cleanup;
+		}
+
+		ret = media_device_bind_context(vdev->v4l2_dev->mdev->default_context,
+						&vdev->default_context->base);
+		if (ret) {
+			pr_err("%s: default context bind failed\n", __func__);
+			goto cleanup;
+		}
+	}
+#endif
+
+	/* Part 7: Activate this minor. The char device can now be used. */
 	set_bit(V4L2_FL_REGISTERED, &vdev->flags);
 	mutex_unlock(&videodev_lock);
 
@@ -1094,6 +1130,10 @@ int __video_register_device(struct video_device *vdev,
 
 cleanup:
 	mutex_lock(&videodev_lock);
+#ifdef CONFIG_MEDIA_CONTROLLER
+	video_device_context_put(vdev->default_context);
+#endif
+	vdev->default_context = NULL;
 	if (vdev->cdev)
 		cdev_del(vdev->cdev);
 	video_devices[vdev->minor] = NULL;
diff --git a/include/media/media-device.h b/include/media/media-device.h
index 2ea8fce9ba75700286961f1622584372a954cb8a..b3cc6793a8b5eff4c26e57b01e1a62ab71e8195b 100644
--- a/include/media/media-device.h
+++ b/include/media/media-device.h
@@ -184,6 +184,9 @@ struct media_device_ops {
  * @fh_list:	List of file handles in the media device
  *		(struct media_device_fh.mdev_list).
  * @fh_list_lock: Serialise access to fh_list list.
+ * @default_context: The default video device context. Used by drivers that
+ *		     support multi-context operation when operated by a
+ *		     non-context aware userspace.
  *
  * This structure represents an abstract high-level media device. It allows easy
  * access to entities and provides basic media device-level support. The
@@ -260,6 +263,8 @@ struct media_device {
 
 	struct list_head fh_list;
 	spinlock_t fh_list_lock;
+
+	struct media_device_context *default_context;
 };
 
 /* We don't need to include usb.h here */
diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
index 9276e095fb17414a9eb7845db0aa81572c42ca45..9e1cf58623acc4ab5f503a9663fd999b38130226 100644
--- a/include/media/v4l2-dev.h
+++ b/include/media/v4l2-dev.h
@@ -237,6 +237,8 @@ struct v4l2_file_operations {
  * @ctrl_handler: Control handler associated with this device node.
  *	 May be NULL.
  * @queue: &struct vb2_queue associated with this device node. May be NULL.
+ * @default_context: &struct video_device_context associated with this device
+ *		     node
  * @prio: pointer to &struct v4l2_prio_state with device's Priority state.
  *	 If NULL, then v4l2_dev->prio will be used.
  * @name: video device name
@@ -283,6 +285,7 @@ struct video_device {
 
 	struct vb2_queue *queue;
 
+	struct video_device_context *default_context;
 	struct v4l2_prio_state *prio;
 
 	/* device info */

-- 
2.49.0


