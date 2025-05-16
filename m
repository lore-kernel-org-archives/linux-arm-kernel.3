Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C649DC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 16:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lbn9wgikneSwCnjNo/tkQhqk4Bto8LThD8HffKsnRc8=; b=lYuf4WHi6aiBjPLze7HN5W0dbT
	S9qCZd2ursfjpkYq5NTpUDdnM3Kk7zpw5EORxvOdsjNcquaUi0wu9Sh17KCDgW3m53KMDeJD1WXTE
	ZSKAnnupfLpdopPzQTdeGGOtznwnQlBqB6ehx8mUcdJxPwgUisZfHP69JnYR6zHLyOg0/VQ8QGKF+
	6LvL6sdu8VCPGvjFwdXC3SC/j04ivK6KZXQSCBHL/5dfJin/yi9T3OFofmhS129AbSFaOv5RWZHka
	NIww/qG8GB5FkrUTfV48qrEAHJAMy7XlQ3em9uGWGZAPXndJHitwslWjjh9Yz8u3c/OQjCnFXdFUG
	daCcmoIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFy4E-0000000423Y-0uQd;
	Fri, 16 May 2025 16:37:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFxbJ-00000003yQD-3Hp1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 16:07:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 63477169C;
	Fri, 16 May 2025 09:07:45 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 475A43F63F;
	Fri, 16 May 2025 09:07:56 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Yabin Cui <yabinc@google.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v1 06/11] coresight: Control path during CPU PM
Date: Fri, 16 May 2025 17:07:37 +0100
Message-Id: <20250516160742.1200904-7-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250516160742.1200904-1-leo.yan@arm.com>
References: <20250516160742.1200904-1-leo.yan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_090757_924918_86767E47 
X-CRM114-Status: GOOD (  13.16  )
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

This commit extends control over CoreSight components on an activated path
during CPU PM.

An activated path is recorded in the 'path' field of coresight_device
structure.  The patch pointer is cleared when the path is disabled.
Traverses the links on the path to disable and re-enable components during
CPU low-power modes.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 94 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 8f565bb3c535..075d485dcea5 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -596,6 +596,94 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
 	goto out;
 }
 
+static int coresight_save_path(struct coresight_path *path)
+{
+	u32 type;
+	struct coresight_node *nd;
+	struct coresight_device *source, *sink;
+
+	if (!path)
+		return 0;
+
+	source = coresight_get_source(path);
+
+	/*
+	 * Do a sanity check as the source device must have been enabled when
+	 * run at here.
+	 */
+	if (coresight_get_mode(source) == CS_MODE_DISABLED)
+		return -EINVAL;
+
+	sink = coresight_get_sink(path);
+
+	/*
+	 * Disable links. Deliberately to skip disabling the sink to avoid
+	 * latency.
+	 */
+	nd = list_first_entry(&path->path_list, struct coresight_node, link);
+	list_for_each_entry_continue(nd, &path->path_list, link) {
+		struct coresight_device *csdev, *parent, *child;
+
+		csdev = nd->csdev;
+		type = csdev->type;
+
+		/* Adjust type for LINKSINK */
+		if (type == CORESIGHT_DEV_TYPE_LINKSINK)
+			type = (csdev == sink) ? CORESIGHT_DEV_TYPE_SINK :
+						 CORESIGHT_DEV_TYPE_LINK;
+
+		if (type != CORESIGHT_DEV_TYPE_LINK)
+			continue;
+
+		parent = list_prev_entry(nd, link)->csdev;
+		child = list_next_entry(nd, link)->csdev;
+		coresight_disable_link(csdev, parent, child, source);
+	}
+
+	return 0;
+}
+
+static void coresight_restore_path(struct coresight_path *path)
+{
+	int ret;
+	u32 type;
+	struct coresight_device *source, *sink;
+	struct coresight_node *nd;
+
+	if (!path)
+		return;
+
+	source = coresight_get_source(path);
+	if (coresight_get_mode(source) == CS_MODE_DISABLED)
+		return;
+
+	sink = coresight_get_sink(path);
+
+	list_for_each_entry_reverse(nd, &path->path_list, link) {
+		struct coresight_device *csdev, *parent, *child;
+
+		csdev = nd->csdev;
+		type = csdev->type;
+
+		if (type == CORESIGHT_DEV_TYPE_LINKSINK)
+			type = (csdev == sink) ? CORESIGHT_DEV_TYPE_SINK :
+						 CORESIGHT_DEV_TYPE_LINK;
+
+		if (type != CORESIGHT_DEV_TYPE_LINK)
+			continue;
+
+		parent = list_prev_entry(nd, link)->csdev;
+		child = list_next_entry(nd, link)->csdev;
+		ret = coresight_enable_link(csdev, parent, child,
+					    coresight_get_source(path));
+		if (ret) {
+			dev_err(&csdev->dev, "Failed to restore\n");
+			coresight_disable_path_from(path, nd);
+			return;
+		}
+	}
+}
+
 struct coresight_device *coresight_get_sink(struct coresight_path *path)
 {
 	struct coresight_device *csdev;
@@ -1605,9 +1693,15 @@ static int coresight_cpu_pm_notify(struct notifier_block *nb, unsigned long cmd,
 	case CPU_PM_ENTER:
 		if (coresight_save_source(source))
 			return NOTIFY_BAD;
+
+		if (coresight_save_path(source->path)) {
+			coresight_restore_source(source);
+			return NOTIFY_BAD;
+		}
 		break;
 	case CPU_PM_EXIT:
 	case CPU_PM_ENTER_FAILED:
+		coresight_restore_path(source->path);
 		coresight_restore_source(source);
 		break;
 	default:
-- 
2.34.1


