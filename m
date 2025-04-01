Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE019C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 18:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mJEXaqD8G9zjn2PJP7C9S+22rgpr2OpVjI6VVMHgAaI=; b=CfNLwKbGWD0sEn9yaR8FWisWpZ
	Dr5FzI+ZUpA7mT+75mpjzj24TYPIs1oTeee/Rhp2StiMIjWK7GcJpoDvAxjvmIanZ4rTGr1yE0K2I
	NqRllg3qhpZVfd2/68mB6P/Ni5uHTnPFAqVR2A4xj2QFTYUyBXDb6jJR8fb9qvWdahPZE5itkzQRc
	Q1Uqub8CnNoBnIf8n2CtbYmsUbQrhoTlbVhSg5fFjZ9y4vQlsVh2X82SX7tJx/c1cwoEM36sJv6EC
	v2iv8TIZE935TbnnRSprP89H2lUiDd0C6ABHGFNhrGyaN2b8dbZZIOOs3n0XKw3WgKL3EWZTpQBlr
	MXHPJk0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzg7f-000000045cv-1aBg;
	Tue, 01 Apr 2025 18:14:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzg1B-000000044bL-2p8A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 18:07:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2FB3E1655;
	Tue,  1 Apr 2025 11:07:24 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 653BC3F59E;
	Tue,  1 Apr 2025 11:07:19 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v4 2/7] coresight: Introduce pause and resume APIs for source
Date: Tue,  1 Apr 2025 19:07:03 +0100
Message-Id: <20250401180708.385396-3-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250401180708.385396-1-leo.yan@arm.com>
References: <20250401180708.385396-1-leo.yan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_110721_840724_1102DD22 
X-CRM114-Status: GOOD (  11.34  )
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

Introduce APIs for pausing and resuming trace source and export as GPL
symbols.

Signed-off-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c | 22 ++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-priv.h |  2 ++
 include/linux/coresight.h                    |  4 ++++
 3 files changed, 28 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index fb43ef6a3b1f..d4c3000608f2 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -367,6 +367,28 @@ void coresight_disable_source(struct coresight_device *csdev, void *data)
 }
 EXPORT_SYMBOL_GPL(coresight_disable_source);
 
+void coresight_pause_source(struct coresight_device *csdev)
+{
+	if (!coresight_is_percpu_source(csdev))
+		return;
+
+	if (source_ops(csdev)->pause_perf)
+		source_ops(csdev)->pause_perf(csdev);
+}
+EXPORT_SYMBOL_GPL(coresight_pause_source);
+
+int coresight_resume_source(struct coresight_device *csdev)
+{
+	if (!coresight_is_percpu_source(csdev))
+		return -EOPNOTSUPP;
+
+	if (!source_ops(csdev)->resume_perf)
+		return -EOPNOTSUPP;
+
+	return source_ops(csdev)->resume_perf(csdev);
+}
+EXPORT_SYMBOL_GPL(coresight_resume_source);
+
 /*
  * coresight_disable_path_from : Disable components in the given path beyond
  * @nd in the list. If @nd is NULL, all the components, except the SOURCE are
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 82644aff8d2b..2d9baa9d8228 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -249,5 +249,7 @@ void coresight_add_helper(struct coresight_device *csdev,
 void coresight_set_percpu_sink(int cpu, struct coresight_device *csdev);
 struct coresight_device *coresight_get_percpu_sink(int cpu);
 void coresight_disable_source(struct coresight_device *csdev, void *data);
+void coresight_pause_source(struct coresight_device *csdev);
+int coresight_resume_source(struct coresight_device *csdev);
 
 #endif
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index d79a242b271d..c95c72e07e02 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -398,6 +398,8 @@ struct coresight_ops_link {
  *		is associated to.
  * @enable:	enables tracing for a source.
  * @disable:	disables tracing for a source.
+ * @resume_perf: resumes tracing for a source in perf session.
+ * @pause_perf:	pauses tracing for a source in perf session.
  */
 struct coresight_ops_source {
 	int (*cpu_id)(struct coresight_device *csdev);
@@ -405,6 +407,8 @@ struct coresight_ops_source {
 		      enum cs_mode mode, struct coresight_path *path);
 	void (*disable)(struct coresight_device *csdev,
 			struct perf_event *event);
+	int (*resume_perf)(struct coresight_device *csdev);
+	void (*pause_perf)(struct coresight_device *csdev);
 };
 
 /**
-- 
2.34.1


