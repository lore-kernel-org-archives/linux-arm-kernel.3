Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B92CDCD3423
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 16:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u5hQYIsof95U1/8EKJ51Wg2ReBlJxkWoC+hPPDudiFU=; b=X0kbfa0PoxslB7wcDPCakJfs5P
	yiTa0woxGqAOICyiMtcpFX0+nT/fMfaR55dDO7rAHtMDWLiD/OwuTfRWNhePMAqh4RhpfI9KV5suI
	0ed2Cv3GMTmYfiWDreA3CkUTL+b9GGMxymRJHe8EgbHLpm/2xaNa5tZQFTNpMMT86tncAHbkhNU9L
	jgj1BBMP5DVzj81SonYm+tmjXLhzE+Uxgwe6Sukudrep3TdqQtqEv6iZ/iHo4aEG21CT1IpZ8HrDL
	NbwY7PzDm6ggjGCjfZbCf6AHVD21oiwC0L/Nv3LbsSP4PVrh9uhQp35SOuL3ePZxIGNbPanykGiz0
	pMP2gnbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr2t-00000007RZp-2fL6;
	Fri, 01 May 2026 16:48:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr2t-00000007RYI-0fPm
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 01 May 2026 16:48:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=u5hQYIsof95U1/8EKJ51Wg2ReBlJxkWoC+hPPDudiFU=; b=Us2RK+DrhsMgrbs8ZHP7WaOIkr
	BM11Rr7BEfRHYNCZE3JrUq+FJJTJmpvgbvXnOvKnBGbaJGipapuAHU54BnHBKCUziApAaUn5RO84T
	6CaEM3pMM0ywP0L2v9qYeaskD46KyEUJN7jTKplyIsC+ZAvlhdYmDpdpY6HLWfkqYeQmtbxz+xoos
	G4n9XLBr3SrII+pcwZzfPNhMIY7PgfuOO8uG5t8chaEqvoQ/o/bQWkqCoALjmXTGoFraEAIrR/Qbw
	3rkHGAGsyzS9ccslz0vpRice8IZpgc2ErxKXVgcWASMZ/H5/Mqqhm5GeXx2HUjvLY5Wbq2lvd0TU2
	uKTy94og==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr2q-00000009B42-07YM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 16:48:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB5F61692;
	Fri,  1 May 2026 09:48:45 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC00F3F7B4;
	Fri,  1 May 2026 09:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777654131; bh=jhitwVE/pW/KJ30XXLGYTDQXzKRSaVYPJxOB99o4Zfk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UHrDmWNrOhYBPDxUp0poXHhzLtjaDUuGH1GnjjzIg8+mKZn1ef4nf87se1zS7QdRe
	 jloK6qShyIBOiGd+A0sUIy6DAR6Hk/5SF1/SfRLsquGIG0DEdQ7bSQgXTFUE39aOup
	 bexUbJBEC37nD0tO+RQaNwm2a19Yq8sK9wOuKZGs=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 01 May 2026 17:47:56 +0100
Subject: [PATCH v11 15/27] coresight: Control path with range
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-arm_coresight_path_power_management_improvement-v11-15-fc7fb9d5af1c@arm.com>
References: <20260501-arm_coresight_path_power_management_improvement-v11-0-fc7fb9d5af1c@arm.com>
In-Reply-To: <20260501-arm_coresight_path_power_management_improvement-v11-0-fc7fb9d5af1c@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777654085; l=6619;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=jhitwVE/pW/KJ30XXLGYTDQXzKRSaVYPJxOB99o4Zfk=;
 b=grMKdemjceRDCE+m2V9v3rJrB211QXENzPHgbagH3BaIrRLdY/PoF1gcK/s6G1gX2L3lbekrI
 oYDR09IRyJ4D2n4ACl8/AwvBAFbQA5tbSCLUww9AdoovFg21yAUNrEG
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_174852_375823_BCBC9D15 
X-CRM114-Status: GOOD (  19.95  )
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

Tested-by: Jie Gan <jie.gan@oss.qualcomm.com>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Tested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 100 ++++++++++++++++++++++-----
 1 file changed, 82 insertions(+), 18 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 6ab80ae7c389e9031d4ab065d83bb676fd12160b..46b6447ce527b4c30d3f0d57801257f90580cc12 100644
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
@@ -479,19 +497,46 @@ int coresight_resume_source(struct coresight_device *csdev)
 EXPORT_SYMBOL_GPL(coresight_resume_source);
 
 /*
- * coresight_disable_path_from : Disable components in the given path starting
- * from @nd in the list. If @nd is NULL, all the components, except the SOURCE
- * are disabled.
+ * Callers must fetch nodes from the path and pass @from and @to to the path
+ * enable/disable functions. Walk the path from @from to locate @to. If @to
+ * is found, it indicates @from and @to are in order. Otherwise, they are out
+ * of order.
+ */
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
+/*
+ * coresight_disable_path_from_to: Disable components in the given path from
+ * @from to @to (inclusive) in the list. If both @from and @to are NULL, all
+ * the components, except the SOURCE are disabled.
  */
-static void coresight_disable_path_from(struct coresight_path *path,
-					struct coresight_node *nd)
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
@@ -525,12 +570,18 @@ static void coresight_disable_path_from(struct coresight_path *path,
 
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
 
@@ -563,19 +614,20 @@ static int coresight_enable_helpers(struct coresight_device *csdev,
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
-	struct coresight_node *nd, *last;
+	struct coresight_node *nd;
 	struct coresight_device *csdev, *parent, *child;
-	struct coresight_device *source;
-
-	source = coresight_get_source(path);
 
-	last = list_last_entry(&path->path_list, struct coresight_node, link);
+	if (!coresight_path_nodes_in_order(path, from, to))
+		return -EINVAL;
 
-	nd = last;
+	nd = to;
 	list_for_each_entry_from_reverse(nd, &path->path_list, link) {
 		csdev = nd->csdev;
 		type = csdev->type;
@@ -615,7 +667,8 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode)
 		case CORESIGHT_DEV_TYPE_LINK:
 			parent = list_prev_entry(nd, link)->csdev;
 			child = list_next_entry(nd, link)->csdev;
-			ret = coresight_enable_link(csdev, parent, child, source);
+			ret = coresight_enable_link(csdev, parent, child,
+						    coresight_get_source(path));
 			if (ret)
 				goto err_disable_helpers;
 			break;
@@ -623,6 +676,10 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode)
 			ret = -EINVAL;
 			goto err_disable_helpers;
 		}
+
+		/* Iterate down to and including @from */
+		if (nd == from)
+			break;
 	}
 
 out:
@@ -631,14 +688,21 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode)
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


