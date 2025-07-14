Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC06C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 16:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C88dgF4iuMYxS3JDmOM2QG/KP2lcpHLGU4Lqlel+zqA=; b=2J26c701hitQ5Zf++qwtLEMSGG
	078lGLpdkRTTUQJGJKAijBSpigWyx013x+lSIKe/u3BsK3fAl1O3x3KsPWf1Tou1lvVNicyv4LE/T
	W/ts+UBXzh9avLFyIyswK2vj5TYwnBXqLqfps7MWoQROcP8npyqnl+h/WvlunE7kCdfY6WaPAqlze
	r8t839O+xNZq3vQvNSuWYL6U3SYNpa9QhnfOP+ai2gOxSKngUVfI64lI7rRnmNwYN9DwuyOLxUvUN
	8juqq6LQwfEqSXSvlQI8BHgMIKztbXNDSYdj5KhFAC4VAXhou18nP7uMOgkst23uNNjJP22zW1y06
	ttZH+OpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubMNU-00000002sst-44iU;
	Mon, 14 Jul 2025 16:50:08 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubKlT-00000002Yqv-0y6e
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 15:06:48 +0000
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6F3D45304;
	Mon, 14 Jul 2025 17:06:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752505573;
	bh=wQF+bIPsZldlAp2gEc1uS1XJHaDZCWa5P/OTC8o+RG0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fbzBaB5PipkCMIodWN8ALJbb/dLuj9vxYlF22E3hEYjhWV1D1luVNHvdiSflFXGl4
	 1K+KklcqYvBW0c/dH2Bre4ZOQV7zQpN6822aoYwz6ekSJsqpmjR+lGKFeUTF/V7I0j
	 d2+D/nRLt21Hcidr7/s9Pd8rB3ugI92BCbpA5q4A=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Mon, 14 Jul 2025 16:06:27 +0100
Subject: [PATCH v11 01/19] media: mc: entity: Add pipeline_started/stopped
 ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250714-c55-v11-1-bc20e460e42a@ideasonboard.com>
References: <20250714-c55-v11-0-bc20e460e42a@ideasonboard.com>
In-Reply-To: <20250714-c55-v11-0-bc20e460e42a@ideasonboard.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
Cc: Anthony.McGivern@arm.com, jacopo.mondi@ideasonboard.com, 
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5233;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=wQF+bIPsZldlAp2gEc1uS1XJHaDZCWa5P/OTC8o+RG0=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBodRz+gGtxck41EbwH+q25Ha98xQJqLw8G3gGqr
 MnMLhIbb1GJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaHUc/gAKCRDISVd6bEV1
 Mi+8D/0fcoeXNEBK3B/YCvCIU/FjX51xbA9OhnZyjitZfnk+3qrP6qz9Ho7xNayGk64Mk4SIYSK
 HdbceQk8rbRt8+tawtasUQZXb7efIhS7unBsBDIoSnMkciRgLcwr5LooONRylYDj5jTAasjpH6y
 GTWRqF62E/1ebKbEDv2o1TUeDohMJfoJ52mlvM2ChDoCJdxHdIUMnlvdxfqx9wiKSJGKXuUp6Pr
 8a5x5yes11+fcyZNoaWrrYAlUOQAweusX6UxzWyDnls4ZOJyfS1yAnQJg3FsswaCuz8WiOqEyHc
 t1b+PFR37Sfn5CDBHhF/PTx3kjmXgRM3Ezo3Xt7zKmgNC6jBpKuhvIwHlM37hSmVCeQB051rnRc
 ngxJVyhGqu/TobLBcbCnKs6K9gjocc3SizrBF8EtzgYn7weR/YHYnXPwFb9k/bB8dxx5SSjfin/
 8nGd/7O6jxyy82Oqw82CLbMGpci/ZfCbGxiALLdapOrJ4/HQ4jx0fusCq3snoh0w4fm0JFyRfn5
 exc5wNAQz+qjDaJ/QZqr/Jy0hlsG4tOZpRXj/LsioEvFdHcFLIK88Y3HiLljdbaPGCoyXeVNkp3
 ItS3pMxjaQye8fuJhR1ErdC+xHQ5GLropZPNe7Ftb69x9nxLP9mwcdUqCMFdSqnBv4WK14WJxE2
 h7qj5wkRliFxvqA==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_080647_420229_007A2E7E 
X-CRM114-Status: GOOD (  14.57  )
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

Add two new members to struct media_entity_operations, along with new
functions in media-entity.c to traverse a media pipeline and call the
new operations. The new functions are intended to be used to signal
to a media pipeline that it has fully started, with the entity ops
allowing drivers to define some action to be taken when those
conditions are met.

The combination of the new functions and operations allows drivers
which are part of a multi-driver pipeline to delay actually starting
streaming until all of the conditions for streaming succcessfully are
met across all drivers.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v5:

	- Update kerneldoc comments with Optional statement in the
	  right place

Changes in v4:

	- Reverted to having the iter variable

Changes in v3:

	- Dropped the iter variable now that the pipeline entity
	  iterator functions don't need it.
	- Updated documentation to specify Optional and return
	  values

Changes in v2:

	- Refactored media_pipeline_started() such that the cleanup
	  function for media_pipeline_entity_iter is unconditionally
	  called
	- Avoided using media_entity_call() helper for operation that
	  has return type void to avoid compiler warnings
---
 drivers/media/mc/mc-entity.c | 46 ++++++++++++++++++++++++++++++++++++++++++++
 include/media/media-entity.h | 29 ++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 045590905582054c46656e20463271b1f93fa6b4..d3443537d4304e12cb015630101efba22375c011 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -1053,6 +1053,52 @@ __media_pipeline_entity_iter_next(struct media_pipeline *pipe,
 }
 EXPORT_SYMBOL_GPL(__media_pipeline_entity_iter_next);
 
+int media_pipeline_started(struct media_pipeline *pipe)
+{
+	struct media_pipeline_entity_iter iter;
+	struct media_entity *entity;
+	int ret;
+
+	ret = media_pipeline_entity_iter_init(pipe, &iter);
+	if (ret)
+		return ret;
+
+	media_pipeline_for_each_entity(pipe, &iter, entity) {
+		ret = media_entity_call(entity, pipeline_started);
+		if (ret && ret != -ENOIOCTLCMD)
+			break;
+	}
+
+	media_pipeline_entity_iter_cleanup(&iter);
+
+	ret = ret == -ENOIOCTLCMD ? 0 : ret;
+	if (ret)
+		media_pipeline_stopped(pipe);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(media_pipeline_started);
+
+int media_pipeline_stopped(struct media_pipeline *pipe)
+{
+	struct media_pipeline_entity_iter iter;
+	struct media_entity *entity;
+	int ret;
+
+	ret = media_pipeline_entity_iter_init(pipe, &iter);
+	if (ret)
+		return ret;
+
+	media_pipeline_for_each_entity(pipe, &iter, entity)
+		if (entity->ops && entity->ops->pipeline_stopped)
+			entity->ops->pipeline_stopped(entity);
+
+	media_pipeline_entity_iter_cleanup(&iter);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(media_pipeline_stopped);
+
 /* -----------------------------------------------------------------------------
  * Links management
  */
diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index 64cf590b11343f68a456c5870ca2f32917c122f9..1e1026f65f2050bb9aa39bde68794da8d2d0a669 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -269,6 +269,10 @@ struct media_pad {
  *			media_entity_has_pad_interdep().
  *			Optional: If the operation isn't implemented all pads
  *			will be considered as interdependent.
+ * @pipeline_started:	Optional: Notify this entity that the pipeline it is a
+ *			part of has been started.
+ * @pipeline_stopped:	Optional: Notify this entity that the pipeline it is a
+ *			part of has been stopped.
  *
  * .. note::
  *
@@ -284,6 +288,8 @@ struct media_entity_operations {
 	int (*link_validate)(struct media_link *link);
 	bool (*has_pad_interdep)(struct media_entity *entity, unsigned int pad0,
 				 unsigned int pad1);
+	int (*pipeline_started)(struct media_entity *entity);
+	void (*pipeline_stopped)(struct media_entity *entity);
 };
 
 /**
@@ -1261,6 +1267,29 @@ __media_pipeline_entity_iter_next(struct media_pipeline *pipe,
 	     entity != NULL;							\
 	     entity = __media_pipeline_entity_iter_next((pipe), iter, entity))
 
+/**
+ * media_pipeline_started - Inform entities in a pipeline that it has started
+ * @pipe:	The pipeline
+ *
+ * Iterate on all entities in a media pipeline and call their pipeline_started
+ * member of media_entity_operations.
+ *
+ * Return: zero on success, or a negative error code passed through from an
+ * entity's .pipeline_started() operation.
+ */
+int media_pipeline_started(struct media_pipeline *pipe);
+
+/**
+ * media_pipeline_stopped - Inform entities in a pipeline that it has stopped
+ * @pipe:	The pipeline
+ *
+ * Iterate on all entities in a media pipeline and call their pipeline_stopped
+ * member of media_entity_operations.
+ *
+ * Return: zero on success, or -ENOMEM if the iterator initialisation failed.
+ */
+int media_pipeline_stopped(struct media_pipeline *pipe);
+
 /**
  * media_pipeline_alloc_start - Mark a pipeline as streaming
  * @pad: Starting pad

-- 
2.34.1


