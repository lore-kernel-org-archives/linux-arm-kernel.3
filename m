Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6962CC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 16:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hJ8rGIDIH45zFMNHI6bgPgZQukxo8i6TSoKz+OBQU5A=; b=QCxLYToU4HKRyf2WmcPWvIT0L0
	KwRU5r1C3qQ/ocFWnX70TGp1ogR8HtMiEjk8a2PBpeQ0yhqbNcvpHIX7N5tUyXYaEbt8sqxfqr0HJ
	COGtcxXvQbQy0jwOVhQmA9Bw1OhWVknhOUbXryg5QovER+LkSsuSSkZxWN+68aXLoLBba4QGzdneJ
	rjyvgk/3kKqE19P4UnKldazhwc0jA9OtulUbZEvhLrFLzBCnbg/AO90bztDosz9fcLz1FyB5/Iqe6
	Au8Vkhr7ANgfbv0vN4UCyyXdjs/dDkvXSMh0nVsSqDVzbFz3YVyLjXuU0otvqqad3+zuf4dWDKs5F
	YbyBDiHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFy2E-000000041sp-2JuZ;
	Fri, 16 May 2025 16:35:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFxbJ-00000003yPd-0YcJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 16:07:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 016481BF7;
	Fri, 16 May 2025 09:07:44 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D9B3A3F63F;
	Fri, 16 May 2025 09:07:54 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Yabin Cui <yabinc@google.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v1 05/11] coresight: Save activated path into source device
Date: Fri, 16 May 2025 17:07:36 +0100
Message-Id: <20250516160742.1200904-6-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250516160742.1200904-1-leo.yan@arm.com>
References: <20250516160742.1200904-1-leo.yan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_090757_214259_DF3DA708 
X-CRM114-Status: GOOD (  11.75  )
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

For a source device, save activated path into the coresight_device
structure.

This will be used by sequential changes for controlling the path during
CPU idle.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 10 ++++++++++
 include/linux/coresight.h                    |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 7ab7321ca8d5..8f565bb3c535 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -495,6 +495,12 @@ static void coresight_disable_path_from(struct coresight_path *path,
 
 void coresight_disable_path(struct coresight_path *path)
 {
+	struct coresight_device *source;
+
+	source = coresight_get_source(path);
+	if (coresight_is_percpu_source(source))
+		source->path = NULL;
+
 	coresight_disable_path_from(path, NULL);
 }
 EXPORT_SYMBOL_GPL(coresight_disable_path);
@@ -577,6 +583,10 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
 		}
 	}
 
+	source = coresight_get_source(path);
+	if (coresight_is_percpu_source(source))
+		source->path = path;
+
 out:
 	return ret;
 err_disable_helpers:
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 64cee4040daa..cd9709a36b9c 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -265,6 +265,7 @@ struct coresight_trace_id_map {
  *		CS_MODE_SYSFS. Otherwise it must be accessed from inside the
  *		spinlock.
  * @orphan:	true if the component has connections that haven't been linked.
+ * @path:	activated path pointer (only used for source device).
  * @sysfs_sink_activated: 'true' when a sink has been selected for use via sysfs
  *		by writing a 1 to the 'enable_sink' file.  A sink can be
  *		activated but not yet enabled.  Enabling for a _sink_ happens
@@ -291,6 +292,8 @@ struct coresight_device {
 	local_t	mode;
 	int refcnt;
 	bool orphan;
+	/* activated path (for source only) */
+	struct coresight_path *path;
 	/* sink specific fields */
 	bool sysfs_sink_activated;
 	struct dev_ext_attribute *ea;
-- 
2.34.1


