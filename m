Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D687CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 18:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5wilynbQQ/Og0z6Ocl//jy6pHWjwKbhjXBPCckmeUn0=; b=0bATYUcXsuDr/PttswEwdsdSUU
	5OH6zpbTdVu18C+lGlUDMjG3BsFI7vg6jm5/7IqqccpbmA4+R0QfZANjSGmZMacBKNiwxxr8RqOnP
	4lGfYxEeLqMK/FBxLhVV3WBL1Q70aCjDIjvJjK8fdXp+L6kFvgoPXBAzVs7OQtK9vzaT7khNnyd5Q
	GFRq8zSPbDmhsxBHttkjMuGyILRPEdalhrBEKbGt5DAkIW30Fo/lFZYMPclYPGSBjejLkb5FnIK8b
	sdaGzoReTd2xoPI6RDardq4tP9g5cJJR1mHQ/KDu4GubMvSEh67qXrgV0yosY7yRXwIxice4wY9YM
	IdajiG/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNxeO-000000098bO-0Hxq;
	Fri, 15 May 2026 18:52:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNxeB-000000098JI-3rHy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 18:52:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3EDA427D3;
	Fri, 15 May 2026 11:52:26 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A07393F836;
	Fri, 15 May 2026 11:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778871151; bh=TsGQzPsy4XRSouCg46vo6bpToKyNYlqvyL1sFAauMow=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rvuvCYOyE6nnelWbMFndDab6j+YX2HhyAdNBH2dlHxu4p0+2qCiAoZimCoLAKtgA0
	 8cQJzyAwriEwe90M2NDgoRQz3bpIdLXMbRH+CtoU5bIWrDWZn1fD1iyPZF5s/bbrks
	 DCfO+/LUtWjcnUrxQOyn9ai+obuUQ9zLXxutJVwc=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 15 May 2026 19:51:39 +0100
Subject: [PATCH v13 16/28] coresight: Control path with range
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-arm_coresight_path_power_management_improvement-v13-16-9dfc558ed65e@arm.com>
References: <20260515-arm_coresight_path_power_management_improvement-v13-0-9dfc558ed65e@arm.com>
In-Reply-To: <20260515-arm_coresight_path_power_management_improvement-v13-0-9dfc558ed65e@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, Jie Gan <jie.gan@oss.qualcomm.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778871097; l=6538;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=TsGQzPsy4XRSouCg46vo6bpToKyNYlqvyL1sFAauMow=;
 b=auJ3CtMRN9QYaw+h+Bhtagj89Tp9QiMyqAqzgk7wWZR8shcdIxVfbIg3GUZh42PJGuyE8zr3H
 d/W/LG6aCGhBu5+0Po+GbIjXQ4ymlV8boKPdd2xl9U7aK50M1lIqaiF
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_115232_069818_EFF24948 
X-CRM114-Status: GOOD (  19.20  )
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

CPU PM notifiers need to control only part of a path instead of always
operating on the full path.

Add internal enable and disable helpers that take an inclusive node
range [from, to], validate that the requested nodes are ordered before
using them.

Update the existed coresight_{enable|disable}_path() interfaces as
full-path wrappers by passing the first and last path nodes. The helpers
coresight_path_{first|last}_node() are provided for conveniently
fetching the first and last nodes on the path.

In coresight_enable_path_from_to(), if a failure occurs at the last node
in the range, no device is actually enabled in this case, bail out
directly.

Tested-by: Jie Gan <jie.gan@oss.qualcomm.com>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Tested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 95 ++++++++++++++++++++++++----
 1 file changed, 81 insertions(+), 14 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index d65cdce1dfef9bb1df40eb7df67274d2f6b30750..62a12a90988949ccc8c181c8edde7939e4f986ab 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -62,6 +62,24 @@ static LIST_HEAD(coresight_dev_idx_list);
 
 static const struct cti_assoc_op *cti_assoc_ops;
 
+static struct coresight_node *
+coresight_path_first_node(struct coresight_path *path)
+{
+	if (list_empty(&path->path_list))
+		return NULL;
+
+	return list_first_entry(&path->path_list, struct coresight_node, link);
+}
+
+static struct coresight_node *
+coresight_path_last_node(struct coresight_path *path)
+{
+	if (list_empty(&path->path_list))
+		return NULL;
+
+	return list_last_entry(&path->path_list, struct coresight_node, link);
+}
+
 void coresight_set_cti_ops(const struct cti_assoc_op *cti_op)
 {
 	cti_assoc_ops = cti_op;
@@ -488,19 +506,41 @@ int coresight_resume_source(struct coresight_device *csdev)
 EXPORT_SYMBOL_GPL(coresight_resume_source);
 
 /*
- * coresight_disable_path_from : Disable components in the given path starting
- * from @nd in the list. If @nd is NULL, all the components, except the SOURCE
- * are disabled.
+ * Callers must fetch nodes from the path and pass @from and @to to the path
+ * enable/disable functions. Walk the path from @from to locate @to. If @to
+ * is found, it indicates @from and @to are in order. Otherwise, they are out
+ * of order.
  */
-static void coresight_disable_path_from(struct coresight_path *path,
-					struct coresight_node *nd)
+static bool coresight_path_nodes_in_order(struct coresight_path *path,
+					  struct coresight_node *from,
+					  struct coresight_node *to)
+{
+	struct coresight_node *nd;
+
+	if (WARN_ON_ONCE(!from || !to))
+		return false;
+
+	nd = from;
+	list_for_each_entry_from(nd, &path->path_list, link) {
+		if (nd == to)
+			return true;
+	}
+
+	return false;
+}
+
+static void coresight_disable_path_from_to(struct coresight_path *path,
+					   struct coresight_node *from,
+					   struct coresight_node *to)
 {
 	u32 type;
 	struct coresight_device *csdev, *parent, *child;
+	struct coresight_node *nd;
 
-	if (!nd)
-		nd = list_first_entry(&path->path_list, struct coresight_node, link);
+	if (!coresight_path_nodes_in_order(path, from, to))
+		return;
 
+	nd = from;
 	list_for_each_entry_from(nd, &path->path_list, link) {
 		csdev = nd->csdev;
 		type = csdev->type;
@@ -534,12 +574,18 @@ static void coresight_disable_path_from(struct coresight_path *path,
 
 		/* Disable all helpers adjacent along the path last */
 		coresight_disable_helpers(csdev, path);
+
+		/* Iterate up to and including @to */
+		if (nd == to)
+			break;
 	}
 }
 
 void coresight_disable_path(struct coresight_path *path)
 {
-	coresight_disable_path_from(path, NULL);
+	coresight_disable_path_from_to(path,
+				       coresight_path_first_node(path),
+				       coresight_path_last_node(path));
 }
 EXPORT_SYMBOL_GPL(coresight_disable_path);
 
@@ -572,16 +618,21 @@ static int coresight_enable_helpers(struct coresight_device *csdev,
 	return ret;
 }
 
-int coresight_enable_path(struct coresight_path *path, enum cs_mode mode)
+static int coresight_enable_path_from_to(struct coresight_path *path,
+					 enum cs_mode mode,
+					 struct coresight_node *from,
+					 struct coresight_node *to)
 {
 	int ret = 0;
 	u32 type;
 	struct coresight_node *nd;
 	struct coresight_device *csdev, *parent, *child;
-	struct coresight_device *source;
 
-	source = coresight_get_source(path);
-	list_for_each_entry_reverse(nd, &path->path_list, link) {
+	if (!coresight_path_nodes_in_order(path, from, to))
+		return -EINVAL;
+
+	nd = to;
+	list_for_each_entry_from_reverse(nd, &path->path_list, link) {
 		csdev = nd->csdev;
 		type = csdev->type;
 
@@ -620,7 +671,8 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode)
 		case CORESIGHT_DEV_TYPE_LINK:
 			parent = list_prev_entry(nd, link)->csdev;
 			child = list_next_entry(nd, link)->csdev;
-			ret = coresight_enable_link(csdev, parent, child, source);
+			ret = coresight_enable_link(csdev, parent, child,
+						    coresight_get_source(path));
 			if (ret)
 				goto err_disable_helpers;
 			break;
@@ -628,6 +680,10 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode)
 			ret = -EINVAL;
 			goto err_disable_helpers;
 		}
+
+		/* Iterate down to and including @from */
+		if (nd == from)
+			break;
 	}
 
 out:
@@ -635,12 +691,23 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode)
 err_disable_helpers:
 	coresight_disable_helpers(csdev, path);
 err_disable_path:
+	/* No device is actually enabled */
+	if (nd == to)
+		goto out;
+
 	/* Fetch the previous node, the last successfully enabled one */
 	nd = list_next_entry(nd, link);
-	coresight_disable_path_from(path, nd);
+	coresight_disable_path_from_to(path, nd, to);
 	goto out;
 }
 
+int coresight_enable_path(struct coresight_path *path, enum cs_mode mode)
+{
+	return coresight_enable_path_from_to(path, mode,
+					     coresight_path_first_node(path),
+					     coresight_path_last_node(path));
+}
+
 struct coresight_device *coresight_get_sink(struct coresight_path *path)
 {
 	struct coresight_device *csdev;

-- 
2.34.1


