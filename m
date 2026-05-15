Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B025DCD4F48
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 20:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5wilynbQQ/Og0z6Ocl//jy6pHWjwKbhjXBPCckmeUn0=; b=loVlj9txkUVSeAMy/+NhhN02Bd
	uXHLnw7Ck2SOaiW0EgCPfH60H+8pDkdZLrorFpf0jhK76FN9P+BOCDbwEB/g3wYwetVccrdYXMPzw
	bX1oCpQSMq9LJ+MS4M+SWcDP3WpBW6NEiqSTH90Oegg+axmPLGbrpRLOlCTErq+dRG/CbXVqciFqp
	fcryaUboaO/WZ3DzwIRq+gF8MiqQx1jWZWVoAONuHILXYAucgS8DFAt+49AbwZ3m5wDIJJxiHe1ko
	f5unG6Im+C9l8BlZBGQjUx8FViWc7fsbMR9z11hdeFNYWrAug6Yrb+54vUcHi080M4bUFJZFTMzAw
	7IcwPGzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNyqe-00000009JN6-48oH;
	Fri, 15 May 2026 20:09:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNyqR-00000009J9B-32PJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 20:09:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D6A4C35E2;
	Fri, 15 May 2026 13:09:09 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4CF923F836;
	Fri, 15 May 2026 13:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778875755; bh=TsGQzPsy4XRSouCg46vo6bpToKyNYlqvyL1sFAauMow=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Buoexm/64zyMZi/Kjyc+qDF4qLkynlwG/kwEMcwejSTsOZg+96FFchNHBFYilnSzi
	 a/IJYXJ4YkrnNgnhdBWNkYf80cQxZsYa9M0HCE+tiU96vmkudbQdP/l7ujCV/3hJkJ
	 KOXcQODBiYrp0dGupfrOm9/5gzRi7AybbvDDMAO0=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 15 May 2026 21:08:23 +0100
Subject: [PATCH v14 16/28] coresight: Control path with range
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-arm_coresight_path_power_management_improvement-v14-16-f88c4a3ecfe9@arm.com>
References: <20260515-arm_coresight_path_power_management_improvement-v14-0-f88c4a3ecfe9@arm.com>
In-Reply-To: <20260515-arm_coresight_path_power_management_improvement-v14-0-f88c4a3ecfe9@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778875700; l=6538;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=TsGQzPsy4XRSouCg46vo6bpToKyNYlqvyL1sFAauMow=;
 b=I8ZsYcpEFfKYeSiOgAf75ty3kZhNvpgIzLTkrbX2p2pB1IwnyrFU7QIgWdWgM3ikXSB7ohaam
 f618o7JPbNHDpsLIx5rWL14Tv7cD+bm1EEG1lRwLgGCc9QFBIay7kcc
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_130917_993806_2B47878E 
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


