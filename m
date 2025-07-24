Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE8DC87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 17:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1wfZiqyoMIkdNVGwHZy+CMiRdJypJbrqsshvmZY5qss=; b=JYVf1SzIhUrrvl+hE+YXUXNM4Q
	bzCerjs2y4zGixf+BKWO9kLJRkdbBUrnLOFoUz34KlSFmlMNDlYzdIc3kcrne1p8Z6v43TRtrKp8f
	DAWT5JU8CtccqqljNyTSkHSf6hiU9QGMbVMfpfQRvVTz/l97syhA4KVIlrREkfL2syyyU4AwSQIBf
	XKcifqGH3P+1p0ORKRbsrydGsvW5b2sv5tP+AXApRnYp2GFCZL5l9t0boE6GRqVroYwAj1WPEV6QY
	xNFhGBP/6tlfl6T4gUIQNrmOQpux5YbnlXXVKPt0/VZU3xCsJbSsNvENLCPDSQAwMbHT5gCrljnhD
	gdwcT2qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uezNP-000000082q2-26Gj;
	Thu, 24 Jul 2025 17:05:03 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueweV-00000007hc9-49eN;
	Thu, 24 Jul 2025 14:10:33 +0000
Received: from [192.168.1.76] (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A6D0619E7;
	Thu, 24 Jul 2025 16:09:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753366191;
	bh=MQRwA7fqy++hrn9wDtM90iaXfefqzRiYRYRIsmH0eBo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tS4ldUt26FugC4awS6WUaNpJW+zPQ3v7VVZYkN1Dp9g3s1ijuJrQdZPRah7y4BHul
	 KxeumX7UTLx1vXstmFoMAga+FbhZH94WqKs/kCd1Vrr49FRw9f6msA1Z8MwdLYbO1V
	 2cq2m+PsAk2z0KkQ2EelXuknxDZVvzSfpkPCcj8o=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 24 Jul 2025 16:10:10 +0200
Subject: [PATCH v2 03/27] media: media-entity: Introduce
 media_entity_context
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-multicontext-mainline-2025-v2-3-c9b316773486@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7515;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=MQRwA7fqy++hrn9wDtM90iaXfefqzRiYRYRIsmH0eBo=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBogj7On0HmBG/yLewcQmpRACQsBQzuVlsMjyZo/
 CXVZ6zICjmJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaII+zgAKCRByNAaPFqFW
 PEuKD/4nrOfR5EUSGoAbVCcqjsRgd8stMiAo2Gw9Terar4dLAlL8CKGQemfPiePHDk8GZyKvxit
 WzrKSz6vljkJ57GsWQZ43pNedu45i+jrnB+ZBWkU82Nw0NmQ7o40LwqfnyT9FcLV/ewhgaG3YT5
 QG3mwzAtGX623qzCqfit4fwTatvOqIAs6gwOHmAdJYTUTcOgtTwuK8ElV7GAvDmRr5QoBWid9Le
 Qs3Yq1q3hVD0bt1VMUFTtXrUuYeDXDfiVGVWJiAyR+4lZhalK/2sUyzxQRRW7aMJOqkf4sbA33t
 +GNjSujZg9TpJKY4Tl8c2tGv5Rk497B58ehR5Y3/94Cu1YXA8lIWG4isFgO87EbyXhUHMygpOPR
 I1n9Vf02ETbIYLH7dScvsK3+fmLYDEszfpPERZ3pDbTa4V3El1ZSx01bmyhVuLAJXtOXf+YH8ow
 Vjg/f8mBXoMrD2F8memdd08yQ+xdRbz3JRMmDSZRM+2wIEjJUkDtMQ2z7r4D/BYNzgjPYjokRxd
 mJZRYgn9tQmI+9oXuZDNYOiYI0kZ7buBCONJz2kofTWZjXbzD+oMqI/wF8qmY/9dY9kRye8FOqC
 ulcscKizbMciqoLWBSLAbDDQMAe0Uxzn27e1CnP9eOOkYaSNelgwkWKzllbr89qMYP0BY3VbdxE
 MBED2pdSb089hlw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_071032_188965_130C1862 
X-CRM114-Status: GOOD (  18.36  )
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

Introduce the 'struct media_entity_context' type, which serves for
reference counting and introduce two new media entity operations to
allow drivers to allocate and free a media entity context.

The newly introduced type will be used as a base type for the
device context types (video_device_context and v4l2_subdevice_context)
that will be introduced in the next patches.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/mc/mc-entity.c |  46 ++++++++++++++++++++
 include/media/media-entity.h | 101 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 147 insertions(+)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 045590905582054c46656e20463271b1f93fa6b4..b4a9f0a0aa7353d7a3333f20903980956b3df4a7 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -1673,3 +1673,49 @@ struct media_link *__media_entity_next_link(struct media_entity *entity,
 	return NULL;
 }
 EXPORT_SYMBOL_GPL(__media_entity_next_link);
+
+static void media_entity_release_context(struct kref *refcount)
+{
+	struct media_entity_context *ctx =
+		container_of(refcount, struct media_entity_context, refcount);
+
+	ctx->entity->ops->destroy_context(ctx);
+}
+
+struct media_entity_context *
+media_entity_context_get(struct media_entity_context *ctx)
+{
+	if (!ctx)
+		return ERR_PTR(-EINVAL);
+
+	kref_get(&ctx->refcount);
+
+	return ctx;
+}
+EXPORT_SYMBOL_GPL(media_entity_context_get);
+
+void media_entity_context_put(struct media_entity_context *ctx)
+{
+	if (!ctx)
+		return;
+
+	kref_put(&ctx->refcount, media_entity_release_context);
+}
+EXPORT_SYMBOL_GPL(media_entity_context_put);
+
+void media_entity_init_context(struct media_entity *entity,
+			       struct media_entity_context *ctx)
+{
+	if (!ctx)
+		return;
+
+	ctx->entity = entity;
+	kref_init(&ctx->refcount);
+	INIT_LIST_HEAD(&ctx->list);
+}
+EXPORT_SYMBOL_GPL(media_entity_init_context);
+
+void media_entity_cleanup_context(struct media_entity_context *ctx)
+{
+}
+EXPORT_SYMBOL_GPL(media_entity_cleanup_context);
diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index 64cf590b11343f68a456c5870ca2f32917c122f9..32298fe8a18c6ee3c1dbcff9ef869548904417a7 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -15,6 +15,7 @@
 #include <linux/bug.h>
 #include <linux/container_of.h>
 #include <linux/fwnode.h>
+#include <linux/kref.h>
 #include <linux/list.h>
 #include <linux/media.h>
 #include <linux/minmax.h>
@@ -248,6 +249,37 @@ struct media_pad {
 	struct media_pipeline *pipe;
 };
 
+/**
+ * struct media_entity_context - A media entity execution context
+ * @mdev_context: The media device context this media entity is bound to.
+ *		  The field is initialized when the entity is bound to a media
+ *		  device context.
+ * @entity: The media entity this context belongs to
+ * @refcount: The kref reference counter
+ * list: The list entry to link the entity context in the media device context
+ *
+ * This type represent the 'base class' used to implement execution context for
+ * video device contexts and subdevice contexts. Those types embedds an instance
+ * of 'struct media_entity_context' as their first member, allowing the MC core
+ * to implement type polymorphism and handle video device and subdevice contexts
+ * transparently.
+ *
+ * The main function of this type is to provide reference counting for the
+ * 'dervived' device context types. The video device and subdevice core
+ * populates the 'context_release' function pointer that implement specific
+ * clean-up operations, similar to what a 'virtual destructor' would do in C++.
+ *
+ * Drivers are not expected to use this type directly, but only the MC core
+ * will.
+ */
+struct media_device_context;
+struct media_entity_context {
+	struct media_device_context *mdev_context;
+	struct media_entity *entity;
+	struct kref refcount;
+	struct list_head list;
+};
+
 /**
  * struct media_entity_operations - Media entity operations
  * @get_fwnode_pad:	Return the pad number based on a fwnode endpoint or
@@ -269,6 +301,15 @@ struct media_pad {
  *			media_entity_has_pad_interdep().
  *			Optional: If the operation isn't implemented all pads
  *			will be considered as interdependent.
+ * @alloc_context:	Allocate a media entity context. Drivers are allowed to
+ *			sub-class the entity context type by defining a driver
+ *			specific type that embeds an instance of either a
+ *			video_device_context or subdevice_context as first
+ *			member, and allocate the size of a driver-specific type
+ *			in the implementation of this operation. Returns 0 for
+ *			success, or an error code < 0 otherwise.
+ * @destroy_context:	Release a media entity context previously allocated by
+ *			the driver.
  *
  * .. note::
  *
@@ -284,6 +325,9 @@ struct media_entity_operations {
 	int (*link_validate)(struct media_link *link);
 	bool (*has_pad_interdep)(struct media_entity *entity, unsigned int pad0,
 				 unsigned int pad1);
+	int (*alloc_context)(struct media_entity *entity,
+			     struct media_entity_context **context);
+	void (*destroy_context)(struct media_entity_context *context);
 };
 
 /**
@@ -1448,3 +1492,60 @@ struct media_link *__media_entity_next_link(struct media_entity *entity,
 					     MEDIA_LNK_FL_DATA_LINK))
 
 #endif
+
+/**
+ * media_entity_context_get - Increase the media entity context reference count
+ *			      and return a reference to it
+ *
+ * @ctx: the media entity context
+ *
+ * Increase the media entity context reference count. The reference count
+ * is increased by the V4L2 core when:
+ *
+ * * a new context is allocated when bounding a media entity to a media device
+ *   context (by kref_init())
+ * * the media pipeline the context is part of starts streaming
+ *
+ * The entity context gets automatically decreased by the V4L2 core when:
+ *
+ * * a context is unbound
+ * * the pipeline stops streaming
+ */
+struct media_entity_context *
+media_entity_context_get(struct media_entity_context *ctx);
+
+/**
+ * media_entity_context_put - Decrease the media entity context reference count
+ *
+ * @ctx: the media entity context
+ *
+ * Decrease the media entity context reference count. The reference count
+ * is decreased by the V4L2 core when:
+ *
+ * * the file handle the context is associated with is closed
+ * * the media pipeline the context is part of is stopped
+ */
+void media_entity_context_put(struct media_entity_context *ctx);
+
+/**
+ * media_entity_init_context - Initialize the media entity context
+ *
+ * @entity: the media entity this context belongs to
+ * @ctx: the media entity context
+ *
+ * Initialize the media entity context by initializing the kref reference
+ * counter. The intended caller of this function are the video device context
+ * and subdevic context initialize functions.
+ */
+void media_entity_init_context(struct media_entity *entity,
+			       struct media_entity_context *ctx);
+
+/**
+ * media_entity_cleanup_context - Cleanup the media entity context
+ *
+ * @ctx: the media entity context
+ *
+ * Cleanup the media entity context. The intended caller of this function are
+ * the video device and subdevice context cleanup functions.
+ */
+void media_entity_cleanup_context(struct media_entity_context *ctx);

-- 
2.49.0


