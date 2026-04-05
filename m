Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977BDE9D805
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Apr 2026 15:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oPeNVTq/PdCgrJSFVo3hFssDxfUBmeXhpsp8l1ug8pA=; b=qyX1oShgzv24tVa0weUj9lGsDo
	GqDuU82PnfbPb31GrwbGYg59PK0WLYFP7x1qrrSV6tSDBiMSbn1W+AdTLYv93mRIHMSuycMnDxo0e
	tTFmxzgLLrtDrRGxSAFRFBiQWUotacazWRW8gqLJ0Kkb4S4Ai1ZaSaQgVA6ADYSi7MmYvX1uvRGrp
	GiI+sA4a05aZVpKvbe3yxDFtBQX+yq86/RALcnXPhUl72vTrFUvq1/uAVoFYIE0Qc/YQG9P3rAAxt
	wzrjuUZlEHd/bcb8fk8b0ql+HcJSGmYc1n7rRlz8sD237NDswOBVtNghjoFATJTvt+89xeM2asxkR
	yr7hwRhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9P0q-00000004Hgk-3IHf;
	Sun, 05 Apr 2026 15:03:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9P0l-00000004Ha6-3WFF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Apr 2026 15:03:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D47E41758;
	Sun,  5 Apr 2026 08:03:32 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E1AE23F62B;
	Sun,  5 Apr 2026 08:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775401418; bh=wgIcHeALHe3owBsH4hbY33EkqZxT/fr9zuX02NfoabA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=crJFCnhgfvJ4RmpI3/YluG6k2+dRXtPP5Vi9GFQHS7edqFH8gK8lb/6yYuK38o134
	 UFFEsIcdTu66Js7DCAzoIr/e0WCa+0qBG2MxRm1zS+Cnqg0R3U/6BDXxJ1dMdTBOhc
	 e+Gi8J2nv3JGdmwWUAwjo1gDn08xDh8J61AL2H9E=
From: Leo Yan <leo.yan@arm.com>
Date: Sun, 05 Apr 2026 16:02:48 +0100
Subject: [PATCH v10 12/20] coresight: Control path with range
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260405-arm_coresight_path_power_management_improvement-v10-12-13e94754a8be@arm.com>
References: <20260405-arm_coresight_path_power_management_improvement-v10-0-13e94754a8be@arm.com>
In-Reply-To: <20260405-arm_coresight_path_power_management_improvement-v10-0-13e94754a8be@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775401378; l=6159;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=wgIcHeALHe3owBsH4hbY33EkqZxT/fr9zuX02NfoabA=;
 b=OvujQvMbjbS7ytmnlef43Xqbl2s4tbrBqLuZVvKX1zQuR8agjqcKZ3Wss/zXdL9znco7GctH6
 yr/CQQZq3cUC2xHGi7OLKSbEzbf/2tXkCVmybZYvV2dH+WfgrSRuw23
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_080340_047563_B9ACE662 
X-CRM114-Status: GOOD (  19.41  )
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

Add parameters @from and @to for path enabling and disabling, allowing
finer-grained control of a path.  The range is [@from..@to], where both
@from and @to are inclusive, introduce coresight_path_nodes_in_order()
to validate the given range if is ordered.

The helpers coresight_path_{first|last}_node() are provided for
conveniently fetching the first and last nodes on the path.

A minor refactoring removes the local variable "source" from
coresight_enable_path_from_to(), deferring reading the source until it
is needed.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 95 ++++++++++++++++++++++------
 1 file changed, 77 insertions(+), 18 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 348eb16a23ad7606ede9f26ae6820ea102ddb8cd..752fe3b4b90fce34c4d245ff994a8afdb8ece463 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -61,6 +61,24 @@ static LIST_HEAD(coresight_dev_idx_list);
 
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
@@ -431,19 +449,41 @@ static struct coresight_path *coresight_get_percpu_local_path(void)
 }
 
 /*
- * coresight_disable_path_from : Disable components in the given path beyond
- * @nd in the list. If @nd is NULL, all the components, except the SOURCE are
- * disabled.
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
@@ -477,12 +517,18 @@ static void coresight_disable_path_from(struct coresight_path *path,
 
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
 
@@ -506,19 +552,20 @@ static int coresight_enable_helpers(struct coresight_device *csdev,
 	return 0;
 }
 
-int coresight_enable_path(struct coresight_path *path, enum cs_mode mode)
+static int coresight_enable_path_from_to(struct coresight_path *path,
+					 enum cs_mode mode,
+					 struct coresight_node *from,
+					 struct coresight_node *to)
 {
 	int ret = 0;
 	u32 type;
-	struct coresight_node *nd, *last;
+	struct coresight_node *nd;
 	struct coresight_device *csdev, *parent, *child;
-	struct coresight_device *source;
 
-	source = coresight_get_source(path);
-
-	last = list_last_entry(&path->path_list, struct coresight_node, link);
+	if (!coresight_path_nodes_in_order(path, from, to))
+		return -EINVAL;
 
-	nd = last;
+	nd = to;
 	list_for_each_entry_from_reverse(nd, &path->path_list, link) {
 		csdev = nd->csdev;
 		type = csdev->type;
@@ -558,7 +605,8 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode)
 		case CORESIGHT_DEV_TYPE_LINK:
 			parent = list_prev_entry(nd, link)->csdev;
 			child = list_next_entry(nd, link)->csdev;
-			ret = coresight_enable_link(csdev, parent, child, source);
+			ret = coresight_enable_link(csdev, parent, child,
+						    coresight_get_source(path));
 			if (ret)
 				goto err_disable_helpers;
 			break;
@@ -566,6 +614,10 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode)
 			ret = -EINVAL;
 			goto err_disable_helpers;
 		}
+
+		/* Iterate down to and including @from */
+		if (nd == from)
+			break;
 	}
 
 out:
@@ -574,14 +626,21 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode)
 	coresight_disable_helpers(csdev, path);
 err_disable_path:
 	/* No device is actually enabled */
-	if (nd == last)
+	if (nd == to)
 		goto out;
 
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


