Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C2401099B32
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 17:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mDFMoH6+YSal5yfzcQVo6SmGbMh0dc88RPcXddQ61Uc=; b=cgRCDocUl3O81yxQ62jhqvH97J
	IFigXilbYt4mYPPbVO3puWxnctBUgJiKpITdnRjlo3Nkp+Vwluo//Liw2nzgpazFtSyKzno+1XUAa
	7m0+MH7pUJ30DXP3FcRZuMk1rBR2W/5t03eMrdeMDNzyYYPUbH9GJVu2ARshFcT8EPYiMUFULzcvw
	gKPtI7buBoe7mWkOSBiaCDcC3FjtmziJ0PR3AFS4XdM9gTV77F8o7Pm5lENH6RTdeJjjlzPjOAyeN
	kqPzSTwcQHyqeWO9cFoY9bRfw+fNN7l7hLQ7emV0lwUl5N2Lrz6OTDxu7CDDq5+JK/T3DBqGZl0XG
	dFLo7epA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dt6-0000000DIOo-2KwJ;
	Fri, 20 Mar 2026 17:43:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dsn-0000000DI63-1EDW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 17:43:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88085165C;
	Fri, 20 Mar 2026 10:43:29 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B192E3FA1F;
	Fri, 20 Mar 2026 10:43:33 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 20 Mar 2026 17:42:56 +0000
Subject: [PATCH v7 14/20] coresight: Control path with range
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-arm_coresight_path_power_management_improvement-v7-14-327ddd36b58b@arm.com>
References: <20260320-arm_coresight_path_power_management_improvement-v7-0-327ddd36b58b@arm.com>
In-Reply-To: <20260320-arm_coresight_path_power_management_improvement-v7-0-327ddd36b58b@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774028583; l=5986;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=QASIIZuihpwkvwU7Lrv1aZtKi1TRop91bqyJuyF+YYk=;
 b=23K1jSUvNZgH8cY6imSy6i2nAOK05X2K2Piye1K61cyUWtAh/o97xEqlDkBBRUSfHts9eG/77
 HSunzfI6vlcDaVesYKcFTNd2uow9TwT/T4wFMZ0EmTIJOCfwcFs4PQl
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_104337_708303_E5E5DCEA 
X-CRM114-Status: GOOD (  20.56  )
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
finer-grained control of a path.

Disabling a path uses the range (@from..@to].  @from is exclusive to
handle the case where the source is passed as the start node: the first
node is skipped, as the source has its own disable function.

Enabling a path uses the range [@from..@to], where both @from and @to
are inclusive.  The enable path still needs to enable the source's
helpers, though the source has its own enable function.

Introduce coresight_path_nodes_in_order() to validate the given range if
is ordered.  Update callers accordingly.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 96 ++++++++++++++++++++++++----
 1 file changed, 85 insertions(+), 11 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 81bf4637f788f99844e839fd9dad8802ee78eb60..874bd87da2270fdbe6b32c2fa29292d7a26b8dc7 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -492,20 +492,62 @@ int coresight_resume_source(struct coresight_device *csdev)
 }
 EXPORT_SYMBOL_GPL(coresight_resume_source);
 
+static struct coresight_node *
+coresight_path_first_node(struct coresight_path *path)
+{
+	return list_first_entry(&path->path_list, struct coresight_node, link);
+}
+
+static struct coresight_node *
+coresight_path_last_node(struct coresight_path *path)
+{
+	return list_last_entry(&path->path_list, struct coresight_node, link);
+}
+
+static bool coresight_path_nodes_in_order(struct coresight_path *path,
+					  struct coresight_node *from,
+					  struct coresight_node *to)
+{
+	struct coresight_node *nd;
+
+	/* Callers must fetch nodes from the path */
+	if (WARN_ON_ONCE(!from || !to))
+		return false;
+
+	list_for_each_entry(nd, &path->path_list, link) {
+		if (nd == from)
+			return true;
+		if (nd == to)
+			return false;
+	}
+
+	return false;
+}
+
 /*
- * coresight_disable_path_from : Disable components in the given path beyond
- * @nd in the list. If @nd is NULL, all the components, except the SOURCE are
- * disabled.
+ * coresight_disable_path_from_to : Disable components in the given @path
+ * between @from and @to.
+ *
+ * The range excludes @from but includes @to.  @from is exclusive to handle the
+ * case where it is the source (the first node in the path), as the source has
+ * its own disable function.
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
 
+	/* @from is exclusive; nothing to do if @from == @to */
+	if (from == to)
+		return;
+
+	nd = from;
 	list_for_each_entry_continue(nd, &path->path_list, link) {
 		csdev = nd->csdev;
 		type = csdev->type;
@@ -545,12 +587,18 @@ static void coresight_disable_path_from(struct coresight_path *path,
 
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
 
@@ -574,7 +622,18 @@ static int coresight_enable_helpers(struct coresight_device *csdev,
 	return 0;
 }
 
-int coresight_enable_path(struct coresight_path *path, enum cs_mode mode)
+/*
+ * coresight_enable_path_from_to : Enable components in the given @path
+ * between @from and @to with the specified mode.
+ *
+ * The range includes both @from and @to. If @from is the source (the first
+ * node in the path), its helper is enabled here but the source is enabled
+ * in a separate function.
+ */
+static int coresight_enable_path_from_to(struct coresight_path *path,
+					 enum cs_mode mode,
+					 struct coresight_node *from,
+					 struct coresight_node *to)
 {
 	int ret = 0;
 	u32 type;
@@ -582,8 +641,12 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode)
 	struct coresight_device *csdev, *parent, *child;
 	struct coresight_device *source;
 
+	if (!coresight_path_nodes_in_order(path, from, to))
+		return -EINVAL;
+
+	nd = to;
 	source = coresight_get_source(path);
-	list_for_each_entry_reverse(nd, &path->path_list, link) {
+	list_for_each_entry_from_reverse(nd, &path->path_list, link) {
 		csdev = nd->csdev;
 		type = csdev->type;
 
@@ -630,6 +693,10 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode)
 			ret = -EINVAL;
 			goto err_disable_helpers;
 		}
+
+		/* Iterate down to and including @from */
+		if (nd == from)
+			break;
 	}
 
 out:
@@ -637,10 +704,17 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode)
 err_disable_helpers:
 	coresight_disable_helpers(csdev, path);
 err_disable_path:
-	coresight_disable_path_from(path, nd);
+	coresight_disable_path_from_to(path, nd, coresight_path_last_node(path));
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


