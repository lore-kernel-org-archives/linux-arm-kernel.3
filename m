Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52357C87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 15:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dhQNBwDYjT5VF6v7m+e/PD65QuZr4t8niE48gQTispM=; b=CR3hVmP+rSYVyWHJblrd88TiNm
	YDStPjynmp7d483I4yqU7Wk0iBYeK1Dw6oAPHgIPLt/+vIbeziTRlSDtCQx7KVltJvE02vTdaTq/J
	jdRlGOHXk3CSXx8ymtclIgrEjp56iW6Uofc1B/6g33wdDkjcCK/OKkqu+oqwj0iB6pY9aI84NXGZA
	9jhUwzvmWM4aG/g6Q3TBLHvCbcUpjSF8c4PEhZ6Sv4qjO6Ba9tnpt+IVTNv4tE0N99G1NfmgW5Dob
	zJodrfS3ffdUnVuCYO8vymUy71QpPeYnvNi7kJwbz2xdwPUwNQdHFUDBPFgM/uFqvjwZWHG8CwD1z
	n45+eRlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uexwA-00000007tYt-1QD5;
	Thu, 24 Jul 2025 15:32:50 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewei-00000007hkD-0udd;
	Thu, 24 Jul 2025 14:10:45 +0000
Received: from [192.168.1.76] (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 39D35C64;
	Thu, 24 Jul 2025 16:10:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753366204;
	bh=V4Bd2SEp0ALBPlJWG8EsVuj29YkOY/732hyVjUTvCTo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XRjXhEEn13H6aY3oZsxLJY55/L9Tw65ogbxXhwI8kEvn9K4oZ1Re0eOFtrTRAbZH5
	 kTHHgh06nTrI2tB/Zh8lEqR+YGZj6NLUTes5ev8kZ34Qpa7Ukj5XUbQ6HAvMBdQnDF
	 aBk57paYgPL80JZd2zKCgWkJTo5Vu0czYxv7Vx9c=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 24 Jul 2025 16:10:20 +0200
Subject: [PATCH v2 13/27] media: v4l2-subdev: Introduce
 VIDIOC_SUBDEV_BIND_CONTEXT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-multicontext-mainline-2025-v2-13-c9b316773486@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4492;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=V4Bd2SEp0ALBPlJWG8EsVuj29YkOY/732hyVjUTvCTo=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBogj7PdCfw+hprkRoPY/A7yYedTP/OgpDEkO/va
 XN9lVbNkHyJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaII+zwAKCRByNAaPFqFW
 PPgdD/4lyAybO0SI0vYiBbeWcj1BoSkTxEhslUbbePT7t3GYV30NNOF33+zC1FvxXCBrZVWheIv
 ExXotbLPGo+5ylE27Ds1z+iwCN8WitxhBphcGk/XU/9B/Q4unN8yWhl7spTmQWjsAydN+nvmIlm
 /ucxxvAiMCMk4atU0f2mOheMaZomAOp5aUbtihQ5tOhyUyzvQmADlhdz26CDjou9xO1eIzJQRu1
 1ElveqRlXNyJEpQyQn/O1EGsLyC0ZorJMK2EQokUU/TBtJPUN5gcd2FYE31+7mGHSUrlbJwmJX4
 g/zQenllabIdoXMY0R8FKmh9are6EsXij64oDTi0lFzcWJoePUnyqagTaPYFdM6x2RzD4UGmbl0
 ho4N1l2MVqhCw4zIPu4lVWNRo5WThc1M+mrcK3ZMH2J2aJlckYz09UUxlLoM4NLS3j8AUQQnIeg
 KNnJmwvpJOeYsG8yCoy4idIYa06BbjizQRPw9OtVvgtyNrXWTKo2LTVeU6dEEKsxqxbNlMSNIqd
 URXJBoLhqi44hpsVUDun+2tPCY4LDd5pOBwvZhGti6pScMH7CtdR/4r2lFelG0XD+HysKdrQj+W
 ZzbipuLEVmacO1Y9BCxM3ZRfVCR84yDkoUTMT/+5iv+3/1QsY8W701xPrEdFTedp00QCvyJvMQA
 h4XBGzu5r5fOU2Q==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_071044_417744_4B48C390 
X-CRM114-Status: GOOD (  16.91  )
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


