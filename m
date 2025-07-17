Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1DAC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 11:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dhQNBwDYjT5VF6v7m+e/PD65QuZr4t8niE48gQTispM=; b=XEfclTKJb10N7ZNx2jWy9eQxa+
	1C1LJkj4qxJozqswB+9/d5yUZVNMX3HdFkXKUUU/0zeRyVz+5tAng+F39bu3dNi4/FHVZ8j5trl4R
	d7eszApelih5IfU9BIszPIYOPxfMv7ODPfEAM9qMCLB92u0RB+sqqMd634ZgHEgfVpkpoaZsizHJ4
	Shkhxu5YB6WslZFj7D7hEWfE0jyJhIKDHpL9qwDvmIgiB2jV9dMgFCvTQ4SBejwCTOIAyrLkVpTNS
	KWJg8+/56XbLqXAD1lxaBuJIkawQmv8tedyuSYwM5MToMSgpovpfptr5Da1pVrw9S70lxBJpRbZkI
	dZ++RKvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucMzX-0000000A039-1kaX;
	Thu, 17 Jul 2025 11:41:35 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucM7l-00000009snr-2XSm;
	Thu, 17 Jul 2025 10:46:02 +0000
Received: from [192.168.0.172] (mob-5-90-140-254.net.vodafone.it [5.90.140.254])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4F1C8198D;
	Thu, 17 Jul 2025 12:45:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752749126;
	bh=V4Bd2SEp0ALBPlJWG8EsVuj29YkOY/732hyVjUTvCTo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=je+6kEeinJv8XEGNRkmbD17Kk5mbjzKPp0lVm1E+10+pjnpBe8/YW0a0djHMgCN7a
	 F7uXduJsjt2pwC42fT7utji23CB+VzcwWnHi02yAfzlzmIaka8rrqz81Urj2pOORIE
	 1tryJq4y01oXnCivQQr68c4NJCsZ8CQ7E9K4RmoQ=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 17 Jul 2025 12:45:39 +0200
Subject: [PATCH 13/26] media: v4l2-subdev: Introduce
 VIDIOC_SUBDEV_BIND_CONTEXT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-multicontext-mainline-2025-v1-13-81ac18979c03@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4492;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=V4Bd2SEp0ALBPlJWG8EsVuj29YkOY/732hyVjUTvCTo=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoeNRQ3HpHt0cfK1Rw4QO76tsSk1mTlN3701wEW
 iXhvqtbpiuJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaHjUUAAKCRByNAaPFqFW
 PFj2D/4lp8scJ2lbnr5pqbCOmJlJsoRtCUiKZjKW3aMvNUle89R342VeULHVHgfVXxzRGAWWxOK
 FsKCQz7RHzHAhKam0BiMPQWzEOSD6ZwwEPl8O5yAEANgxDJ2JVX/ino8+Jpol/frwRhPqshCx45
 X3isORwRd/+DwK9qf9MwlUa3A0k8YDP2wgMibMf6imvD2Xnr7KNQxlAh+mbWeg0JO2GvNpU4Enm
 V6DfKRgXyuCUL/JXuzDXQ6RpsW6E3PhhK1D4NFdFUYVVNxV7oR7dG2CWpHGbA4bvQrzHNKZR/yw
 rD4oLiwkQ0ueLlE4NOc3QjCQvzh/FUW1ts70dGDnH8bzX8tFqMaEjtltcEVhJdUiAL4UtXn+BjX
 /Xk0PUgM/IgYs4bhOCIpkMj2WgvQncpmfG0f+05r6bIhKm3Czunzl2cYHiCM8BWw9AMVnsi7gU1
 OkvJJa3y2Y9Xj7YpOahY5WZJdY7j6tSGGtA1q1YgxPGIk1/lkRzfvKSrjJXh6JUfe0XAVYuLzht
 vjz/uePhW1ID+SCx9VujYlD25AtS8H2B5ema9vG/4d493Mlfa2eEKRoBlYreQZ2yIaLhkBCim0H
 DL5x/PuzNmvKAWtulT0v3dX15MxOf4WL53AjSdbxLwTY0BhL7qzUAuJfTmwU8pOVzfZXoA8Oicf
 HQaJu+s7wBbsGWw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_034601_792851_00A63AEC 
X-CRM114-Status: GOOD (  16.32  )
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

Introduce a new ioctl in V4L2 subdev to allocate a subdevice context
and associate it with a media device context.

The ioctl handler calls the entity ops to let the driver allocate a
new context and initialize the subdev state there contained.

The new subdevice context is bound to the media device context
associated with the file descriptor provided by userspace as the new
ioctl argument.

The newly allocated context is stored in the v4l2_subdev_fh handle
that represent the open file handle on which the ioctl has been called.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 59 +++++++++++++++++++++++++++++++++++
 include/uapi/linux/v4l2-subdev.h      | 11 +++++++
 2 files changed, 70 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 7307f57439499c8d5360c89f492944828ac23973..300f84317623dd082a4cd2caec97057f972e82a3 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -607,6 +607,46 @@ subdev_ioctl_get_state(struct v4l2_subdev *sd, struct v4l2_subdev_fh *subdev_fh,
 			     v4l2_subdev_get_unlocked_active_state(sd);
 }
 
+static int subdev_do_bind_context(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_context **context,
+				  struct media_device_context *mdev_context)
+{
+	static struct lock_class_key key;
+	struct v4l2_subdev_state *state;
+	int ret;
+
+	ret = sd->entity.ops->alloc_context(&sd->entity,
+					    (struct media_entity_context **)
+					    context);
+	if (ret)
+		return ret;
+
+	state = __v4l2_subdev_state_alloc(sd, "context->state->lock", &key);
+	if (IS_ERR(state)) {
+		ret = PTR_ERR(state);
+		goto err_put_context;
+	}
+	(*context)->state = state;
+
+	/*
+	 * Bind the newly created video device context to the media device
+	 * context identified by the file descriptor.
+	 */
+	ret = media_device_bind_context(mdev_context,
+					(struct media_entity_context *)
+					*context);
+	if (ret)
+		goto err_free_state;
+
+	return 0;
+
+err_free_state:
+	__v4l2_subdev_state_free((*context)->state);
+err_put_context:
+	v4l2_subdev_context_put(*context);
+	return ret;
+}
+
 static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 			    struct v4l2_subdev_state *state)
 {
@@ -1089,6 +1129,25 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		return 0;
 	}
 
+	case VIDIOC_SUBDEV_BIND_CONTEXT: {
+		struct v4l2_subdev_bind_context *c = arg;
+		struct media_device_context *mdev_context;
+		int ret;
+
+		if (!sd->entity.ops || !sd->entity.ops->alloc_context ||
+		    !sd->entity.ops->destroy_context)
+			return -ENOTTY;
+
+		mdev_context = media_device_context_get_from_fd(c->context_fd);
+		if (!mdev_context)
+			return -EINVAL;
+
+		ret = subdev_do_bind_context(sd, &subdev_fh->context,
+					     mdev_context);
+		media_device_context_put(mdev_context);
+		return ret;
+	}
+
 	case VIDIOC_SUBDEV_G_CLIENT_CAP: {
 		struct v4l2_subdev_client_capability *client_cap = arg;
 
diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
index 2347e266cf7516b4073c1edd43b97a3ddddb183b..6184cc0153a9dd9fbfa6729e1b6127ba4a961395 100644
--- a/include/uapi/linux/v4l2-subdev.h
+++ b/include/uapi/linux/v4l2-subdev.h
@@ -243,6 +243,16 @@ struct v4l2_subdev_routing {
 	__u32 reserved[11];
 };
 
+/**
+ * struct v4l2_subdev_bind_context - Subdev context information
+ *
+ * @context_fd: The file descriptor of the media_device instance the subdevice
+ *		has to be bound to
+ */
+struct v4l2_subdev_bind_context {
+	__u32 context_fd;
+};
+
 /*
  * The client is aware of streams. Setting this flag enables the use of 'stream'
  * fields (referring to the stream number) with various ioctls. If this is not
@@ -285,6 +295,7 @@ struct v4l2_subdev_client_capability {
 #define VIDIOC_SUBDEV_S_SELECTION		_IOWR('V', 62, struct v4l2_subdev_selection)
 #define VIDIOC_SUBDEV_G_ROUTING			_IOWR('V', 38, struct v4l2_subdev_routing)
 #define VIDIOC_SUBDEV_S_ROUTING			_IOWR('V', 39, struct v4l2_subdev_routing)
+#define VIDIOC_SUBDEV_BIND_CONTEXT		_IOWR('V', 50, struct v4l2_subdev_bind_context)
 #define VIDIOC_SUBDEV_G_CLIENT_CAP		_IOR('V',  101, struct v4l2_subdev_client_capability)
 #define VIDIOC_SUBDEV_S_CLIENT_CAP		_IOWR('V',  102, struct v4l2_subdev_client_capability)
 

-- 
2.49.0


