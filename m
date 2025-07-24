Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDF1C87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 17:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VbGLO/UQA9CRORbYWgQ+PhPBI8HqvQP6uAX446SudMc=; b=G06UaZgXDDqQHZPw6bl25h1Eir
	25XB1lPzXINx47nlWghZA1tRtN93cHjamwLmg5dME7QR5DwEvNI0Dd4Z8ydaJ9tut/AQHzNDxO1yr
	jhs+vr6ZcJnzAH7AlPu2jwbhu6U8RVwZSafAztPBAhQEdfiOUgMCICc/MzMGoPT8t0PaIfHwZRB3N
	VYq6Gdi5Xs2GvJ8WuVB1ytVWo4PQvH3pKwSuUdv8RvQ+BgLdxGslg2wgIB7bNj1lWSue4eLUBm++U
	g0kuZJ6y5auFyfFqO/AEb2Yl08i9JsG8YFVzBgx0iA8vPfvejqN4l+qqH6WabgEnkXk/nu6LLCyew
	fPhZjyLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uezNT-000000082tA-205w;
	Thu, 24 Jul 2025 17:05:07 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewec-00000007hhA-36Nw;
	Thu, 24 Jul 2025 14:10:39 +0000
Received: from [192.168.1.76] (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B42C11A37;
	Thu, 24 Jul 2025 16:09:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753366198;
	bh=7vOckOlOxZhw2fbL9SA65DEYxitygggpkHW/wn4/+ec=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Nz6s0cpM9/owWJkU8pyOHVjwVQjPh0byz4D193b8Po+R3FJYUKasDdPI99zkVnWaB
	 kmj28EHDAPTMV2DrzPC+kcF+abMhnpivuTycy0mIrpIjTGr3GmOZ7D3j40fql4c2VV
	 sQLxaukkKtPE5pGKe3hGW6LJ4fNVJ/ZKnA+9kZ3U=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 24 Jul 2025 16:10:16 +0200
Subject: [PATCH v2 09/27] media: v4l2-dev: Add
 video_device_context_from_file()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-multicontext-mainline-2025-v2-9-c9b316773486@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3662;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=7vOckOlOxZhw2fbL9SA65DEYxitygggpkHW/wn4/+ec=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBogj7PkjaY/ZSj7vHkANoqvzVbGnB7c0FYtuyIL
 cMLSnSwBamJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaII+zwAKCRByNAaPFqFW
 PDfrD/9RfoA8wg5LkT2LdivtZ5m0NdRIiPj4RwTBL6/pslI7Ll7rDQjbzGLU7acWDOXTBkuNwfn
 7Gqay0BSwp0TrsjdKjGsrtfN7TNEFyEIyYfrTui+QxxOV1HpWQBcqjKKNytoxQwNvy2wxL53vSB
 7z/xn2xR22OGQZGCJXuzfljWG1S6d7aZqPnPMwIpnS8tXGHgNntryf+kWX/lQUvQCXRMl21qqL8
 82EMJ2Pfi0kJl6PWpplbm6llPl6GRQbzoDKcHSPFCwgD+F6GrXm73sKQ6DBv+XcsD2AkljP0zXb
 0512SNrU3YwOHDk/uWsCAggM8jR+3tQodn0KZuh2Gkw94NzMiQ2b0tUy6DWnGSVtKJxSaf8mUMj
 sb5wh8HNBDIVFDNtXQ5OEeDEIZf6WIWii/YwD78BKdLnfWGA9LhRJRFqYLSMwom0E+EvIP61A3j
 FGEuc2IyaVqn1KKPskVJ/pLtrXFvcsAau90vhWFy5csPf0cyz8ELPaARNXWzkP6udOx3qB0+7qp
 Lrp7WsdApMEJmRE1j4HzgAIHcnRm64rs2ggnlDmlVLkPpFGRJ2sRUpFPksY+AgI/aiAQSY0wwF5
 M1rYaIvCCN0e893e99zX133miFLLHSydgckK3ASbP/mOHS2SuJjtN6XcdFuBcCMz1TlGBqqewdd
 tNonoFUvhDkDc1Q==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_071038_924602_AA7057B3 
X-CRM114-Status: GOOD (  16.47  )
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

Introduce an helper function to get a video_device_context from file.
If no context has been bound to the file, return the video device
default context.

As a video device context lifetime is bound to the one of the file
handle it is associated with, and the intended user of this helper are
the v4l2_ioctl_ops handlers that operates on an open file handle, the
context returned by this function is guaranteed to be valid for the
whole function scope of the caller.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-dev.c | 15 +++++++++++++++
 include/media/v4l2-dev.h           | 30 ++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 2d78096931efd88215bc847b105e198a54035546..fafd4209e2cab320a6e164d33e9a0f73784d22db 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -1182,6 +1182,21 @@ EXPORT_SYMBOL_GPL(v4l2_debugfs_root);
 
 #if defined(CONFIG_MEDIA_CONTROLLER)
 
+struct video_device_context *
+video_device_context_from_file(struct file *filp, struct video_device *vfd)
+{
+	struct v4l2_fh *vfh =
+		test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? filp->private_data
+							    : NULL;
+
+	/* If the file handle has been bound to a context return it. */
+	if (vfh && vfh->context)
+		return vfh->context;
+
+	return vfd->default_context;
+}
+EXPORT_SYMBOL_GPL(video_device_context_from_file);
+
 __must_check int video_device_pipeline_start(struct video_device *vdev,
 					     struct media_pipeline *pipe)
 {
diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
index 9e1cf58623acc4ab5f503a9663fd999b38130226..a41afb81663bc9cb3bfc06dcf9b11ceeaf7c3415 100644
--- a/include/media/v4l2-dev.h
+++ b/include/media/v4l2-dev.h
@@ -789,6 +789,36 @@ int video_device_init_context(struct video_device *vdev,
  */
 void video_device_cleanup_context(struct video_device_context *ctx);
 
+/**
+ * video_device_context_from_file - Get the video device context associated with
+ *				    an open file handle
+ * @filp: The file handle
+ * @vdev: The video device
+ *
+ * If a video device context has been bound to an open file handle by a call
+ * to the VIDIOC_BIND_CONTEXT ioctl this function returns it, otherwise returns
+ * the default video device context.
+ *
+ * The intended callers of this helper are the driver-specific v4l2_ioctl_ops
+ * handlers, which receive as first argument a file pointer. By using this
+ * helper drivers can get the context associated with such file, if any.
+ * Otherwise, if the video device  has not been bound to any media device
+ * context, the default video device context is returned.
+ *
+ * As video device contexts are reference counted and their lifetime is
+ * guaranteed to be at least the one of the file handle they are associated
+ * with, callers of this function are guaranteed to always receive a valid
+ * context reference by this function. The reference will remain valid for the
+ * whole function scope of the caller that has received the open file handle as
+ * argument. Likewise, accessing the media context from the video device context
+ * returned by this function is always safe within the same function scope.
+ *
+ * This function does not increase the reference count of the returned video
+ * device context.
+ */
+struct video_device_context *
+video_device_context_from_file(struct file *filp, struct video_device *vdev);
+
 #endif /* CONFIG_MEDIA_CONTROLLER */
 
 #endif /* _V4L2_DEV_H */

-- 
2.49.0


