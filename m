Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11EFBC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 15:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F6Qr5wDSTK8e3Q/I1bsRlleQmenNsH0aWO4lCkj0NyE=; b=TE9AdpsGLqi82u7OT6qpcjvxLZ
	UdYQgP4yYt2sDSDh4fLUL5xZKuxiI0RpDz9CkP09jRJAhuKnmTfGFl+6YsM0sjU2Hxf00OEGS845E
	5+lv8fcdcueIr+486laOYmZCR6igS9lwypwcsPnhQ9qghKtRSS5bbK/b9AHxKcO4CvURWsx3Ew5wA
	TsPAtQgV4orS7FvqHWym0V4fM3a6qrNmDYCnNbQz4h3ZeWkLbDDo45IdQH29sbTUkxrTVhVbzwgqG
	Fw07/Gp0ZtDP1KOJLvZNxSZrtARQYkNB+TQFeaPnWcAa1QjZIZyWeWw3YDdT1zZetvLif8bW4eW9g
	rfQtXObw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uey8f-00000007ur9-0DPS;
	Thu, 24 Jul 2025 15:45:45 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewep-00000007hov-3KYx;
	Thu, 24 Jul 2025 14:10:53 +0000
Received: from [192.168.1.76] (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CBD5F1A37;
	Thu, 24 Jul 2025 16:10:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753366211;
	bh=Vmfy9P6HgOvkJ1o2D9ktCyX+PB0ofnZcx1ytCaFVfCs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=e5FWXca7LlbJwCYMKZqouJ8vJW5NxXfPpEgJZqAPDd0bOIoz4Ic3Fn0iVaBckzNQT
	 R8w0DSh6jiiDF8uz82213695+XnlVBOWmojdIYYLYFMhxqIoyZXITz1yGWtCjivgaM
	 XXGqqpkPngpRtajtlfud5inEW5oSSc0d8FTVaIzs=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 24 Jul 2025 16:10:26 +0200
Subject: [PATCH v2 19/27] media: mc-entity: Add link_validate_context
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-multicontext-mainline-2025-v2-19-c9b316773486@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3666;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=Vmfy9P6HgOvkJ1o2D9ktCyX+PB0ofnZcx1ytCaFVfCs=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBogj7QICvUpwUUHAHWbWnmWUel95FZ9qcwgzNxS
 0oqDL1ZzTiJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaII+0AAKCRByNAaPFqFW
 PHzjD/4xp+EwWa2WUaG5sW/TrEB0qMmWUkUDgbPEZc1cnQIHrW7C1xs8etc89pD+u/M+Fp0Lt18
 k1WIMI5r4IBbeFG0XAG3I2AZlGevhedWPrS4/CE6v+b8N0mIslNcTH6jKlIw+i+Zx1y74JDADNw
 /9dsneu6kjWuYpbI7KbzYEe64DJ50I6t93u5F8zVPGxlPL1M8uPMikcnHGclhIjOI7F3Tl6AXAR
 CldHHZALbqUsiRPbggI5q0QZxljQLeNl362AZzC1SL6p2WX5NQ/TTxfrx4YE/hlk4WyrwjbbG7g
 WYCWMMLg6A4i/u1XR4/wcdIJNl9yXrQ4k16UrzJGhq1t2wF+5+TtMsYjo1fDgoogqsGHOUPU1I5
 NR7PsDoHb8cd4WFjHlCZNoG+Ph0gKXlqTRMkbFgJbbWrMYuxNFtx0qYCtVfryKBwJcwpq6AbZp/
 SVGCJlfnyq1WqK0g3yQcbC+NwrjFKolBaayYC1R0RXTOlYi3WeWDUy4G8NVOSSg/05pSY6t9OW4
 1qC5IxvCIajRpSYQk8TuuXxBPmPQB8g2OQ2Yk1LT4WMh9Uk7MHPaMn1W7E0mHb2ohSsniAZv+Hd
 CT8ei06YXGtiGhnshIcDM+bkDwcEdlpQAw+lNm2SSkcpKrXBCCMd0qiFJfobjspBAqQp2Fn4iE3
 sLKOnx+KopjACjg==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_071051_976575_0155251B 
X-CRM114-Status: GOOD (  12.37  )
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

Add an 'override' of the link_validate() media entity operation that
accepts a media_device_context as second argument to allow entities
to validate the link state in the provided media_device context.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/mc/mc-entity.c | 23 +++++++++++++++++++----
 include/media/media-entity.h |  6 ++++++
 2 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index f421d6d74630bb96400d39d805c5db5d3d1ff913..675ceaede0d10a2420b8ea6a89e5963dcfde5ffe 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -884,6 +884,8 @@ __media_pipeline_start_context(struct media_pad *origin,
 		 * the connected sink pad to avoid duplicating checks.
 		 */
 		for_each_media_entity_data_link(entity, link) {
+			const struct media_entity_operations *ops;
+
 			/* Skip links unrelated to the current pad. */
 			if (link->sink != pad && link->source != pad)
 				continue;
@@ -902,13 +904,23 @@ __media_pipeline_start_context(struct media_pad *origin,
 			if (link->sink != pad)
 				continue;
 
-			if (!entity->ops || !entity->ops->link_validate)
+			ops = entity->ops;
+			if (!ops || (!ops->link_validate &&
+				     !ops->link_validate_context))
 				continue;
 
-			ret = entity->ops->link_validate(link);
+			if (mdev_context && ops->link_validate_context)
+				ret = ops->link_validate_context(link,
+								 mdev_context);
+			else
+				ret = entity->ops->link_validate(link);
+
 			if (ret) {
 				dev_dbg(mdev->dev,
-					"Link '%s':%u -> '%s':%u failed validation: %d\n",
+					"%sink '%s':%u -> '%s':%u failed validation: %d\n",
+					(mdev_context &&
+					 ops->link_validate_context) ?
+					"Context l" : "L",
 					link->source->entity->name,
 					link->source->index,
 					link->sink->entity->name,
@@ -917,7 +929,10 @@ __media_pipeline_start_context(struct media_pad *origin,
 			}
 
 			dev_dbg(mdev->dev,
-				"Link '%s':%u -> '%s':%u is valid\n",
+				"%sink '%s':%u -> '%s':%u is valid\n",
+				(mdev_context &&
+				 ops->link_validate_context) ?
+				"Context l" : "L",
 				link->source->entity->name,
 				link->source->index,
 				link->sink->entity->name,
diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index b60c311ab390beb6931fe8f2bbe8939e11cda452..b053a0baee4031a464edf506d3d131bacb810f81 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -295,6 +295,10 @@ struct media_entity_context {
  * @link_validate:	Return whether a link is valid from the entity point of
  *			view. The media_pipeline_start() function
  *			validates all links by calling this operation. Optional.
+ * @link_validate_context: Return whether a link is valid from the entity
+ *			context point of view. The
+ *			media_pipeline_start_context() function validates all
+ *			links calling this operation. Optional.
  * @has_pad_interdep:	Return whether two pads of the entity are
  *			interdependent. If two pads are interdependent they are
  *			part of the same pipeline and enabling one of the pads
@@ -327,6 +331,8 @@ struct media_entity_operations {
 			  const struct media_pad *local,
 			  const struct media_pad *remote, u32 flags);
 	int (*link_validate)(struct media_link *link);
+	int (*link_validate_context)(struct media_link *link,
+				     struct media_device_context *mdev_context);
 	bool (*has_pad_interdep)(struct media_entity *entity, unsigned int pad0,
 				 unsigned int pad1);
 	int (*alloc_context)(struct media_entity *entity,

-- 
2.49.0


