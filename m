Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D377C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 11:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BTReZi6n7jjY7XRs1kpQBmbH/pvn0v/nz7o6qs/1w20=; b=uGKEtO0zSMGzYu3A4FAtk5++qw
	g2Gw72MNRkl72LGVkb/vjyTxgcI+xksMkSGfljNEwx8TaDsSK+1S6BtJ/BIAN5JTEryBj+KL3wD8Y
	je6U1kVQYAkCOG5dbpW7al21FbHRqk6Hm0Dw53aAP5egwyL9nWBnkMsbCRGMOvr5xKsd0omSpniXD
	5l6BG8ErxzC0wiAgLLA/8R/oOpvzLTr1lt5I55atfQRyJKpX6qSLE4e8P57o+BmPJG2F7iUawblCy
	doXRW2vthHd1VTTeAXURaeiqN5nIRQNdk8lOchx0nzpCeD9DUEgFzoUPbRLsiThZTVbW4kdFIfYTz
	388ChWXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucMsI-00000009zNy-0utE;
	Thu, 17 Jul 2025 11:34:06 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucM7g-00000009sl6-0WeN;
	Thu, 17 Jul 2025 10:45:57 +0000
Received: from [192.168.0.172] (mob-5-90-140-254.net.vodafone.it [5.90.140.254])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1E872245A;
	Thu, 17 Jul 2025 12:45:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752749121;
	bh=mLUIKlRtGcg7V5Vy0wqmsYRGL64MqtvU55q1oBc3ZZs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YYiuPOeprmFLaNJmzOXHBcYHGT8fBlsFW4+sj1s+N64Tw+55Rw/PTCnB94yCebWYN
	 VEZOlOSWEcgJJ2pJG5nm3fPkBnUUYETbkiemAh9Qkj9CAOwlk8dwwbsLCuqBjo/484
	 R9u+juYMLuvIoUHww25r+AOojgmci9b8bpoHw2+k=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 17 Jul 2025 12:45:36 +0200
Subject: [PATCH 10/26] media: v4l2-dev: Add
 video_device_context_from_queue()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-multicontext-mainline-2025-v1-10-81ac18979c03@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3081;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=mLUIKlRtGcg7V5Vy0wqmsYRGL64MqtvU55q1oBc3ZZs=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoeNRPd2EOVo7NzC+9Tgxe4bjIIOEosUfZWrH3d
 jZq5MccBbCJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaHjUTwAKCRByNAaPFqFW
 PPLwD/9GLnCoGIVQv4Jy8/8f0VN/n8yLhbkFFqZOcYTdZThOGrK5bXosdH7Ef9dwIY9kNLXxth8
 3/OR92mYXXtLciXPDGfd4GfPBWFO0XT1Af6bbIbT8fJCnntcJiiaPZhDPa6MKa4nCRi37F7579D
 IXJCAWZABJ9eeUdkaXtOTRcNt4s4qfB1erA/O/fveLJhp4P2NAVkFG9RE2Bc3Q/H35w7lM70H2f
 ckFJlH3LsiclEi+alz9FcT+wjCoXuIDB+fewxdTCD7HXun9nQExxapYiSmz7ZqZVVb/lZ8FP9L9
 PY1gagHJfGbGFv7iF/huAHRF7UMC8TSWUQAjOno6ZZOswchTKH0Z4OASVrQkMW0DJgWTVx7V+rx
 Yw42g2rTfYzPRLkq/Os0aZl8dss1ma6j2lhh0gC9l7Ths/nsgblQhylZfHOcapKiQXCeiFsDZYr
 Ds+9dFlLoxrG5+rFS9EIqr5lE7gTAX8irvmUhB43r8I5ayc7kr7RGZ/CpwPg/bWxh4aECyLNwqQ
 kdFR8PLFg6+nrIamxPHqKhR2If85q6GvPDyjoV7Dy14HLGQVmtmCUrTGIXfFcmY98rw8j751K+G
 TmpjgzkS/f8oP6STb+jqmhRfuQ8MNU39QkPDqC+Nqa+/KzhqoqfrAu0uM1VfFjHT7ElY9MoA7Ms
 Tr2NADj0jvjubow==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_034556_330471_47930B59 
X-CRM114-Status: GOOD (  14.00  )
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

Introduce an helper function to get a video_device_context from
a videobuf2 queue.

Device drivers that support multi-context operations will receive in
their vb2_ops callbacks implementation a vb2_queue argument that is
embedded in a video device context, either a context created by binding
the video device to a media device context or the video device default
context. This helper allows those drivers to retrieve the context
the vb2_queue is embedded with.

As the intended callers of this helpers are vb2_ops callbacks
implementation, called by the videobuf2 core in response to an operation
on a file handle, the returned context is guaranteed to be valid for
the whole duration of the callback.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 include/media/v4l2-dev.h | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
index a41afb81663bc9cb3bfc06dcf9b11ceeaf7c3415..bab4b13b109362bec84d8d16440b6ea895206b60 100644
--- a/include/media/v4l2-dev.h
+++ b/include/media/v4l2-dev.h
@@ -819,6 +819,42 @@ void video_device_cleanup_context(struct video_device_context *ctx);
 struct video_device_context *
 video_device_context_from_file(struct file *filp, struct video_device *vdev);
 
+/**
+ * video_device_context_from_queue - Get a video device context associated with
+ *				     a vb2 queue
+ *
+ * @q: the videobuf2 queue
+ *
+ * Return the video device context this videobuf2 queue belongs to.
+ *
+ * Device drivers that support multi-context operations will always be provided
+ * with a device context to work with, either a context created by userspace
+ * by binding the video device to a media device context or the video device
+ * default context. The videobuf2 queue that context-aware drivers operates will
+ * always be contained in either one of those contexts.
+ *
+ * This function should be used by driver-specific callbacks implementation of
+ * the vb2_ops which receive a videobuf2 as argument. Being the vb2_ops callback
+ * called by the videobuf2 core in response to a userspace operation on an open
+ * file handle, callers of this function are guaranteed to always receive a
+ * valid context reference by this function. The reference will remain valid for
+ * the whole function scope of the vb2_ops callback that has received the
+ * videobuf2 queue as argument. Likewise, accessing the media device context
+ * from the video device context returned by this function is always safe within
+ * the same function scope.
+ *
+ * Drivers that do not support multi-context operations shall never use
+ * this function.
+ *
+ * This function does not increase the reference count of the returned video
+ * device context.
+ */
+static inline struct video_device_context *
+video_device_context_from_queue(struct vb2_queue *q)
+{
+	return container_of(q, struct video_device_context, queue);
+}
+
 #endif /* CONFIG_MEDIA_CONTROLLER */
 
 #endif /* _V4L2_DEV_H */

-- 
2.49.0


