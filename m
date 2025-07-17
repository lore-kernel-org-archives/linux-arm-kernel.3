Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B4BC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 11:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F6Qr5wDSTK8e3Q/I1bsRlleQmenNsH0aWO4lCkj0NyE=; b=Ln8stN27EdN3nDbpjH7HM87tRr
	u6IeavX8kbJ8ZGMenzhFZwg2fKtOdcfkBvELh98/NDMfv5Lt1eSlAXzPRJGRTAI58LlONGxaLqzE0
	y9emBeLeMKZXSAqc6uIAXdd8h1bw9QYwn47ydJ7N5ff4FD4pPUOq7tNe7JdRszZ6HgHOXPGTk8ZVe
	2gdL16YkZd0LelwFl9yytm7kZlEHugCVi5aSdkW/CWOPw8mWSthfcpDWQc+VhBj/5MSsQijJ6T9Fr
	MBLc/uFAzovx+oUOW8m2cOWLscrM30PHybKmFKMxESBg8OEHdfFkoig2rOpEwp4p314jzozlMSmKU
	zA0RA+Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucNC2-0000000A25f-0poC;
	Thu, 17 Jul 2025 11:54:30 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucM7x-00000009svK-1Ogz;
	Thu, 17 Jul 2025 10:46:14 +0000
Received: from [192.168.0.172] (mob-5-90-140-254.net.vodafone.it [5.90.140.254])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3DFD71AE2;
	Thu, 17 Jul 2025 12:45:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752749138;
	bh=Vmfy9P6HgOvkJ1o2D9ktCyX+PB0ofnZcx1ytCaFVfCs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DABlrK2a88A3r8J+z6KrObawZ6hDRn+XgUPs6DOolXJBUpaQReEFGJrSKwsBmUYMb
	 pA0aR02ddyUOK3QAbnifhFNJ+NdGsrWGWfjbcoKFAUQ0/tO6xEkQ9SfrT3XuyMv4h5
	 ZWCWArDZcBlgLr48GxuYfzDBnGbmmERUGvYyr2Qk=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 17 Jul 2025 12:45:45 +0200
Subject: [PATCH 19/26] media: mc-entity: Add link_validate_context
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-multicontext-mainline-2025-v1-19-81ac18979c03@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3666;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=Vmfy9P6HgOvkJ1o2D9ktCyX+PB0ofnZcx1ytCaFVfCs=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoeNRRQX0z9nktE5CicUsI35GLyrxFYdwvWu01o
 DbQVnGZFZmJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaHjUUQAKCRByNAaPFqFW
 PLSyEACEMz3OzJzaHE7EGoRK0sBcANROBQuYYp7GHepcJ/nUiptjHw6rgsK41gGAoCbT/xnTP1s
 BMornojg9rzbreAVIJzUwEvOoEXg6O9lY+chAy1gcx32ZqW/l1BUtBtxRzDOb/ghXJ7WHaj0Cc/
 Wg1Ub/whqUwrpm2kvuRsUoT6WgQAxvs7KqaUNXyfThxEeiu8bVgjUUMTSTkWCljGuzuASQFA4q2
 tX2D3kMo7pMRc+gsTJGFeJqWSPFRwAUKl2f1zCVH9WubuIeu93G/7OVZ2CV3lXPHn5HdiEia0KY
 X4EOWGEoZt1DO2AuTY67kZj6SEOETWqImcTKGi13BALMPCjsMzlPpinSYQ7lZ9UYAjvrmFgmA+d
 igXtW2xOWHbiMNXJNCkCooqG3VPV4SIdtYqchrn/P4b71vkOgye0YG7Jaw8/IaHip/EloiAblA6
 ywriQzyhd6EoaeJLWEWhZnvQjCA4v4bBgeZcmSYb5IeowEiZ8HwqyQKMROifa+N4qJOf4FUmCg3
 VOnZ8M/30upNjPEK7nU0Amvcbj/Snw2ZSlPFMGMb/OGsVGN5068Tb40oa+bn4212ThCCtHSNSF5
 ueysf/7Gz9j80UKcs5L+fSMFJKTXCRx3zugNHzqN6gEisRT4X8sn3Tz+ktaIt7tJsoy5xwF98tU
 5MtaPun5X8+POGQ==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_034613_519101_7DE770E5 
X-CRM114-Status: GOOD (  11.88  )
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


