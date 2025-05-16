Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B48C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 16:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ymdbEIUcx1jF2VE8b8fDK8dYcpnllWFW5NsIqbq8Q2M=; b=j6aCGEFSwqiEZtUNQJsdwZCL+H
	rtlDrkHRDObg/ieBVillHPV26lXwXh57ER3KsV8r9ARozUj1kRLgsr+hGyIKHLeKC+WtH4ADZnuyq
	s92ZlLSZWIBHE45A3+UYH9Fx6/noH3I36IOYRJ8HjKFGr+jGvU1kuepzjW2nYwfKwfRIWNAtDFHa5
	Fp2al9CvzFFvG+BDQOfn9PQP9ycAr71n8hNUEiY8AEDcEgoINztNu+ZTVzzgbk/tQUGXWaz15eShF
	LkjfET2eDKs0NxdPYaFVvn2RzczZi1espceraVUoshtHFrEJ6QiV8sDFe/BbZVZx3WTjJhvuI85PT
	W+TkD0FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFy6F-000000042I4-0H5t;
	Fri, 16 May 2025 16:39:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFxbL-00000003yPd-24Vi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 16:08:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C46561BF7;
	Fri, 16 May 2025 09:07:46 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A90D53F63F;
	Fri, 16 May 2025 09:07:57 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Yabin Cui <yabinc@google.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v1 07/11] coresight: Add PM callbacks in sink operation
Date: Fri, 16 May 2025 17:07:38 +0100
Message-Id: <20250516160742.1200904-8-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250516160742.1200904-1-leo.yan@arm.com>
References: <20250516160742.1200904-1-leo.yan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_090759_658364_6AC27BDA 
X-CRM114-Status: GOOD (  14.02  )
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

Unlike a system level's sink, the per-CPU sink may lose power during CPU
idle states.  So far, this refers to the TRBE as a sink.  This commit
adds save and restore callbacks for the sink, and these callbacks are
via the PM notifier.

For not per-CPU sinks (e.g., ETR, ETB, etc), which are system level
components and should not be affected by CPU low power states.  The PM
notifier does not interact with them to avoid additional latency.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 23 +++++++++++++++++++++++
 include/linux/coresight.h                    |  4 ++++
 2 files changed, 27 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 075d485dcea5..02b80db1da3d 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -437,6 +437,21 @@ static void coresight_restore_source(struct coresight_device *csdev)
 		source_ops(csdev)->restore(csdev);
 }
 
+static int coresight_save_sink(struct coresight_device *csdev)
+{
+	if (csdev && sink_ops(csdev)->save)
+		return sink_ops(csdev)->save(csdev);
+
+	/* Return success if callback is not supported */
+	return 0;
+}
+
+static void coresight_restore_sink(struct coresight_device *csdev)
+{
+	if (csdev && sink_ops(csdev)->restore)
+		sink_ops(csdev)->restore(csdev);
+}
+
 /*
  * coresight_disable_path_from : Disable components in the given path beyond
  * @nd in the list. If @nd is NULL, all the components, except the SOURCE are
@@ -616,6 +631,10 @@ static int coresight_save_path(struct coresight_path *path)
 
 	sink = coresight_get_sink(path);
 
+	/* Save per CPU sink and directly bail out */
+	if (coresight_is_percpu_sink(sink))
+		return coresight_save_sink(sink);
+
 	/*
 	 * Disable links. Deliberately to skip disabling the sink to avoid
 	 * latency.
@@ -659,6 +678,10 @@ static void coresight_restore_path(struct coresight_path *path)
 
 	sink = coresight_get_sink(path);
 
+	/* Restore per CPU sink and directly bail out */
+	if (coresight_is_percpu_sink(sink))
+		return coresight_restore_sink(sink);
+
 	list_for_each_entry_reverse(nd, &path->path_list, link) {
 		struct coresight_device *csdev, *parent, *child;
 
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index cd9709a36b9c..bffcb2238102 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -365,6 +365,8 @@ enum cs_mode {
  * @alloc_buffer:	initialises perf's ring buffer for trace collection.
  * @free_buffer:	release memory allocated in @get_config.
  * @update_buffer:	update buffer pointers after a trace session.
+ * @save:		save context for a sink.
+ * @restore:		restore context for a sink.
  */
 struct coresight_ops_sink {
 	int (*enable)(struct coresight_device *csdev, enum cs_mode mode,
@@ -377,6 +379,8 @@ struct coresight_ops_sink {
 	unsigned long (*update_buffer)(struct coresight_device *csdev,
 			      struct perf_output_handle *handle,
 			      void *sink_config);
+	int (*save)(struct coresight_device *csdev);
+	void (*restore)(struct coresight_device *csdev);
 };
 
 /**
-- 
2.34.1


