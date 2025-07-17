Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24959C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 12:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LuAXE/VLTLh34y/e1/BOyxTieWjl9VXSxZxUGfpXhMY=; b=fgqsfM7cdgk68aI80RKD5auunl
	SVtmvV8tx9x690Vc3Wh+/VyvIlyGUCmsNKdtMCQ7Y3NK2GF30XAdK9gTOJvd9Da/V9ZJxcKAAdIN1
	QTQ6p10W/VWHTcgsPNNdJAMFQ0QtqxXPIzRHbgrXnfw/W+/i8UGOZiZsDJ3QjTnwGMuPEpcvQzDN1
	jxVPcE6kOFow0ZmYWjQtaJ5wTaBBIWLxlAZSQyVecHSotILipfwx1/7iTwwStRs6JsXppb46yngoB
	y50XlZAStN2op7o6/x4bj+PsCBO2qli1LFqMuvJbUvrc7B4ywygKjqcKB3p8ah82xdZKH+RQZ7CJW
	sLGNaYeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucNts-0000000A8zA-1OBx;
	Thu, 17 Jul 2025 12:39:48 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucM7Z-00000009sgy-3tM9;
	Thu, 17 Jul 2025 10:45:51 +0000
Received: from [192.168.0.172] (mob-5-90-140-254.net.vodafone.it [5.90.140.254])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C93F3198D;
	Thu, 17 Jul 2025 12:45:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752749115;
	bh=8R73HPaz5pGFoxscWZIYsH9YWq0Ywb87x5bejY/EFeM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SOiHuxq8bdNt7SUOg01x5EwIA3zPLzESlFTgWYrVGjEHsxAno2JVpff/lYDXyYxvn
	 WCggyMJgoWJlyzBLV1qU7pt3DxqyFpOP9ZJoF8o9RwzG+mcQIuu9WkLjtfNN2wZeLC
	 oIBVD8zOmfZjdx9WqMGJG5648ji+ca0iXpNxNG5k=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 17 Jul 2025 12:45:32 +0200
Subject: [PATCH 06/26] media: v4l2-ioctl: Introduce VIDIOC_BIND_CONTEXT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-multicontext-mainline-2025-v1-6-81ac18979c03@ideasonboard.com>
References: <20250717-multicontext-mainline-2025-v1-0-81ac18979c03@ideasonboard.com>
In-Reply-To: <20250717-multicontext-mainline-2025-v1-0-81ac18979c03@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8477;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=8R73HPaz5pGFoxscWZIYsH9YWq0Ywb87x5bejY/EFeM=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoeNRPuxlgrQbLEhBMUC26EnJg5sMetl7FSM+mi
 8Q1kKPMoYqJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaHjUTwAKCRByNAaPFqFW
 PNIjD/0fEqn9SDhgeerqLoTAs2HwXZnGao1NsXkGYyUmaguuhhDcaMETK1sZeSWBDURKkRGij0X
 WXrWQpEbohjIBjGAObAiOae4/zPpcHEvZCq1P3knfpKdDleAyOMCRkpXgkN9Zbrm/22PMa+zqv8
 jj+g+jdoqDnyOt2f7WqVMiDzlJRTq6KucXNeio3Rwk9QPA+Perj1a5U6niBrZqUPe0Y0SEFzRty
 zxrmQQCaVJXcRy9pMIyqofajGgIrMrXDhrRmGn5nMc9QAu4+oTQwX6zJxgAxlekt08KD9L6Ioqc
 5HkpMu/QtEF1RkZmLbvsV7E7M5qHxGeDd6et4W4wW35Ciw1LNjDWsD/xMHmZ9Kf+thPEZzdIGVV
 j2S3fIJunNWw9nYffnWXm9Q3Su+++kv19zSWanLxPw0zHG7d/xvYSX2BhSbAwQzD/LJnNptXcny
 Y4rs5Ls77K3DuVoybPh9FYdak+5m7uU6AjrBPnnH3ugsztxXkRRXwaG73oK3RjY3PHiuJO28L0e
 ouc9VzJspHZ32CXbyPDzGHYMQvDdmlZCaO8/QS9q+L/cvqu6a9PrJCvRfiFPF6+gB+DkCSkHvc9
 6tTshdadZ/WX6c9BF0XLpWfj2SGOV+vLD1AlAjTcbwd8CZ8mpTRzifPz4nJv+KFt9KV0QKN+KPh
 mZKXBqwSo2SPv2A==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_034550_152943_0912F20A 
X-CRM114-Status: GOOD (  21.90  )
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

Introduce a new ioctl in V4L2 to allocate a video device context and
associate it with a media device context.

The ioctl is valid only if support for MEDIA_CONTROLLER is compiled in
as it calls into the entity ops to let driver allocate a new context and
binds the newly created context with the media context associated
with the file descriptor provided by userspace as the new ioctl
argument.

The newly allocated video context is then stored in the v4l2-fh that
represent the open file handle on which the ioctl has been called.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-dev.c   | 10 ++++++
 drivers/media/v4l2-core/v4l2-fh.c    |  1 +
 drivers/media/v4l2-core/v4l2-ioctl.c | 64 ++++++++++++++++++++++++++++++++++++
 include/media/v4l2-ioctl.h           |  7 ++++
 include/uapi/linux/videodev2.h       | 11 +++++++
 5 files changed, 93 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index c83c37843c9e7beb899a4b2bd176273c3dec381b..bc6502b4ce21cc0ad53136e1637d1c926e31dd89 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -606,6 +606,10 @@ static void determine_valid_ioctls(struct video_device *vdev)
 		__set_bit(_IOC_NR(VIDIOC_ENUM_FREQ_BANDS), valid_ioctls);
 
 	if (is_vid) {
+#ifdef CONFIG_MEDIA_CONTROLLER
+		__set_bit(_IOC_NR(VIDIOC_BIND_CONTEXT), valid_ioctls);
+#endif
+
 		/* video specific ioctls */
 		if ((is_rx && (ops->vidioc_enum_fmt_vid_cap ||
 			       ops->vidioc_enum_fmt_vid_overlay)) ||
@@ -661,12 +665,18 @@ static void determine_valid_ioctls(struct video_device *vdev)
 		SET_VALID_IOCTL(ops, VIDIOC_G_FMT, vidioc_g_fmt_meta_cap);
 		SET_VALID_IOCTL(ops, VIDIOC_S_FMT, vidioc_s_fmt_meta_cap);
 		SET_VALID_IOCTL(ops, VIDIOC_TRY_FMT, vidioc_try_fmt_meta_cap);
+#ifdef CONFIG_MEDIA_CONTROLLER
+		__set_bit(_IOC_NR(VIDIOC_BIND_CONTEXT), valid_ioctls);
+#endif
 	} else if (is_meta && is_tx) {
 		/* metadata output specific ioctls */
 		SET_VALID_IOCTL(ops, VIDIOC_ENUM_FMT, vidioc_enum_fmt_meta_out);
 		SET_VALID_IOCTL(ops, VIDIOC_G_FMT, vidioc_g_fmt_meta_out);
 		SET_VALID_IOCTL(ops, VIDIOC_S_FMT, vidioc_s_fmt_meta_out);
 		SET_VALID_IOCTL(ops, VIDIOC_TRY_FMT, vidioc_try_fmt_meta_out);
+#ifdef CONFIG_MEDIA_CONTROLLER
+		__set_bit(_IOC_NR(VIDIOC_BIND_CONTEXT), valid_ioctls);
+#endif
 	}
 	if (is_vbi) {
 		/* vbi specific ioctls */
diff --git a/drivers/media/v4l2-core/v4l2-fh.c b/drivers/media/v4l2-core/v4l2-fh.c
index 90eec79ee995a2d214590beeacc91b9f8f33236d..f7af444d2344541ccae1eae230b39d4cbc47f6bd 100644
--- a/drivers/media/v4l2-core/v4l2-fh.c
+++ b/drivers/media/v4l2-core/v4l2-fh.c
@@ -93,6 +93,7 @@ int v4l2_fh_release(struct file *filp)
 	struct v4l2_fh *fh = filp->private_data;
 
 	if (fh) {
+		video_device_context_put(fh->context);
 		v4l2_fh_del(fh);
 		v4l2_fh_exit(fh);
 		kfree(fh);
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 46da373066f4ec786b87ef18b8372abee621332f..bade64cc62b66dd6237ccd5338aa6dd8ab00ef8c 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/compat.h>
+#include <linux/file.h>
 #include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/slab.h>
@@ -350,6 +351,13 @@ static void v4l_print_format(const void *arg, bool write_only)
 	}
 }
 
+static void v4l_print_context(const void *arg, bool write_only)
+{
+	const struct v4l2_context *c = arg;
+
+	pr_cont("context=%u\n", c->context_fd);
+}
+
 static void v4l_print_framebuffer(const void *arg, bool write_only)
 {
 	const struct v4l2_framebuffer *p = arg;
@@ -2151,6 +2159,61 @@ static int v4l_overlay(const struct v4l2_ioctl_ops *ops,
 	return ops->vidioc_overlay(file, fh, *(unsigned int *)arg);
 }
 
+static int v4l_bind_context(const struct v4l2_ioctl_ops *ops,
+			    struct file *file, void *fh, void *arg)
+{
+	struct video_device *vdev = video_devdata(file);
+	struct media_device_context *mdev_context;
+	struct v4l2_fh *vfh =
+		test_bit(V4L2_FL_USES_V4L2_FH, &vdev->flags) ? fh : NULL;
+	struct v4l2_context *c = arg;
+	int ret;
+
+	/*
+	 * TODO: do not __set_bit(_IOC_NR(VIDIOC_BIND_CONTEXT), valid_ioctls)
+	 * if V4L2_FL_USES_V4L2_FH isn't set or the driver does not implement
+	 * alloc_context and destroy_context.
+	 */
+	if (!vfh)
+		return -ENOTTY;
+
+	if (!vdev->entity.ops || !vdev->entity.ops->alloc_context ||
+	    !vdev->entity.ops->destroy_context)
+		return -ENOTTY;
+
+	mdev_context = media_device_context_get_from_fd(c->context_fd);
+	if (!mdev_context)
+		return -EINVAL;
+
+	/* Let the driver allocate the per-file handle context. */
+	ret = vdev->entity.ops->alloc_context(&vdev->entity,
+					      (struct media_entity_context **)
+					      &vfh->context);
+	if (ret)
+		goto err_put_mdev_context;
+
+	/*
+	 * Bind the newly created video device context to the media device
+	 * context identified by the file descriptor.
+	 */
+	ret = media_device_bind_context(mdev_context,
+					(struct media_entity_context *)
+					vfh->context);
+	if (ret)
+		goto err_put_context;
+
+	media_device_context_put(mdev_context);
+
+	return 0;
+
+err_put_context:
+	video_device_context_put(vfh->context);
+err_put_mdev_context:
+	media_device_context_put(mdev_context);
+
+	return ret;
+}
+
 static int v4l_reqbufs(const struct v4l2_ioctl_ops *ops,
 				struct file *file, void *fh, void *arg)
 {
@@ -2998,6 +3061,7 @@ static const struct v4l2_ioctl_info v4l2_ioctls[] = {
 	IOCTL_INFO(VIDIOC_DBG_G_CHIP_INFO, v4l_dbg_g_chip_info, v4l_print_dbg_chip_info, INFO_FL_CLEAR(v4l2_dbg_chip_info, match)),
 	IOCTL_INFO(VIDIOC_QUERY_EXT_CTRL, v4l_query_ext_ctrl, v4l_print_query_ext_ctrl, INFO_FL_CTRL | INFO_FL_CLEAR(v4l2_query_ext_ctrl, id)),
 	IOCTL_INFO(VIDIOC_REMOVE_BUFS, v4l_remove_bufs, v4l_print_remove_buffers, INFO_FL_PRIO | INFO_FL_QUEUE | INFO_FL_CLEAR(v4l2_remove_buffers, type)),
+	IOCTL_INFO(VIDIOC_BIND_CONTEXT, v4l_bind_context, v4l_print_context, 0),
 };
 #define V4L2_IOCTLS ARRAY_SIZE(v4l2_ioctls)
 
diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
index 82695c3a300a73219f262fb556ed61a8f09d273e..6d9edfd9ca912972ad15acdc07014dee1ed36ab6 100644
--- a/include/media/v4l2-ioctl.h
+++ b/include/media/v4l2-ioctl.h
@@ -18,6 +18,7 @@
 #include <linux/videodev2.h>
 
 struct v4l2_fh;
+struct video_device_context;
 
 /**
  * struct v4l2_ioctl_ops - describe operations for each V4L2 ioctl
@@ -149,6 +150,8 @@ struct v4l2_fh;
  *	:ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for metadata capture
  * @vidioc_try_fmt_meta_out: pointer to the function that implements
  *	:ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for metadata output
+ * @vidioc_bind_context: pointer to the function that implements
+ *	:ref:`VIDIOC_BIND_CONTEXT <vidioc_bind_context>` ioctl
  * @vidioc_reqbufs: pointer to the function that implements
  *	:ref:`VIDIOC_REQBUFS <vidioc_reqbufs>` ioctl
  * @vidioc_querybuf: pointer to the function that implements
@@ -402,6 +405,10 @@ struct v4l2_ioctl_ops {
 	int (*vidioc_try_fmt_meta_out)(struct file *file, void *fh,
 				       struct v4l2_format *f);
 
+	/* Context handlers */
+	int (*vidioc_bind_context)(struct file *file, void *fh,
+				   struct video_device_context *c);
+
 	/* Buffer handlers */
 	int (*vidioc_reqbufs)(struct file *file, void *fh,
 			      struct v4l2_requestbuffers *b);
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 3dd9fa45dde1066d52a68581625a39e7ec92c9b7..0b9aa89e2479620dbbaa54f1aadff7aaa7a3d0f7 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1057,6 +1057,14 @@ struct v4l2_jpegcompression {
 					* always use APP0 */
 };
 
+/*
+ *     V I D E O   D E V I C E   C O N T E X T
+ */
+
+struct v4l2_context {
+	__u32 context_fd;
+};
+
 /*
  *	M E M O R Y - M A P P I N G   B U F F E R S
  */
@@ -2818,6 +2826,9 @@ struct v4l2_remove_buffers {
 #define VIDIOC_REMOVE_BUFS	_IOWR('V', 104, struct v4l2_remove_buffers)
 
 
+/* Context handling */
+#define VIDIOC_BIND_CONTEXT	_IOW('V', 105, struct v4l2_context)
+
 /* Reminder: when adding new ioctls please add support for them to
    drivers/media/v4l2-core/v4l2-compat-ioctl32.c as well! */
 

-- 
2.49.0


