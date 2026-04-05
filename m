Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE0A6E9D800
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Apr 2026 15:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LIoOafIoL3e+J2/r7ikC708YJbSNG05GZAH/9N3bix4=; b=xP9thP0+AM6mgmh52a1qZLtyoL
	333Nt4zOSAIFUPKPQQ1x30uOXqXVFwUTub+KziTLQYiZWnUlgvnVzOEo4NnBZLM3/leVnBrooWswy
	pfzKPVS/qnclHm+iRKdQGXq/WIBFoXJMLrzzI0T73whx3EaT9wyk691JO73decdX1FUeWB4l+HCuw
	jAoAuL5W7kSxyf5kGjq79WSCfm/h+XC8Swbo7cvYSDuxfApjycbb1BsEZP+pMMqo0Odn5rXx5S4IX
	ITkvqQl/Rd62qQjzg8xGaFNW3TwRA/Bveid6oyMOb5lPNjw1BZoMHvfmKCN0kiF0m75n9nvCEBBcW
	0m1jB0gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9P0m-00000004Hbh-3peJ;
	Sun, 05 Apr 2026 15:03:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9P0i-00000004HUq-2MDQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Apr 2026 15:03:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD77426BE;
	Sun,  5 Apr 2026 08:03:29 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C754B3F62B;
	Sun,  5 Apr 2026 08:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775401415; bh=P8xmTDj+qM0WaKODPtY0PC6wYjEelSJC8mKqDL2dqz4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OnQYq3WYDagKzcI8POSwEoUdM0GKGWxx8nm/9VmN5uF5AtwIcJu9HPcAhwtY15j9A
	 k9EQt48hyTFVFRLrS3w57K0tH3XVKWfKOVeQ2kzzlpvtKgN6x10QeChAdQ4BFHZXNM
	 1HN4rkb8WjheVviejiL0CyKeIk+JETYosbZKIfU4=
From: Leo Yan <leo.yan@arm.com>
Date: Sun, 05 Apr 2026 16:02:47 +0100
Subject: [PATCH v10 11/20] coresight: Move source helper disabling to
 coresight_disable_path()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260405-arm_coresight_path_power_management_improvement-v10-11-13e94754a8be@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775401378; l=3756;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=P8xmTDj+qM0WaKODPtY0PC6wYjEelSJC8mKqDL2dqz4=;
 b=nIq55bMzdYQs2T+qUsUUkjdwQG/q1f1OvQZWeZi/r8zW+6pR6qBBEnibW/BQw6jDq1dV87vvy
 jF2V2S+LcQIA/Zu9jzVBLsdDTHYEfY8UkAoWHf81zOTWFZzaNmPiQwu
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_080336_723989_530EC18C 
X-CRM114-Status: GOOD (  19.33  )
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

Move source helper disabling to coresight_disable_path() to pair it with
coresight_enable_path().

In coresight_enable_path(), if enabling a node fails, iterate to the
next node (which is the last successfully enabled node) and pass it to
coresight_disable_path() for rollback.  If the failed node is the last
node on the path, no device is actually enabled, so bail out directly.

As a result, coresight_disable_source() only controls the source,
leaving the associated helpers to be managed as part of path.  Update
the comment to reflect this change.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 32 ++++++++++++----------------
 1 file changed, 14 insertions(+), 18 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 967eac5027a1f02cde29fb3a7be36304c90320b2..348eb16a23ad7606ede9f26ae6820ea102ddb8cd 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -388,19 +388,12 @@ static void coresight_disable_helpers(struct coresight_device *csdev,
 }
 
 /*
- * Helper function to call source_ops(csdev)->disable and also disable the
- * helpers.
- *
- * There is an imbalance between coresight_enable_path() and
- * coresight_disable_path(). Enabling also enables the source's helpers as part
- * of the path, but disabling always skips the first item in the path (which is
- * the source), so sources and their helpers don't get disabled as part of that
- * function and we need the extra step here.
+ * coresight_disable_source() only disables the source, but do nothing for
+ * the associated helpers, which are controlled as part of the path.
  */
 void coresight_disable_source(struct coresight_device *csdev, void *data)
 {
 	source_ops(csdev)->disable(csdev, data);
-	coresight_disable_helpers(csdev, NULL);
 }
 EXPORT_SYMBOL_GPL(coresight_disable_source);
 
@@ -451,7 +444,7 @@ static void coresight_disable_path_from(struct coresight_path *path,
 	if (!nd)
 		nd = list_first_entry(&path->path_list, struct coresight_node, link);
 
-	list_for_each_entry_continue(nd, &path->path_list, link) {
+	list_for_each_entry_from(nd, &path->path_list, link) {
 		csdev = nd->csdev;
 		type = csdev->type;
 
@@ -471,12 +464,6 @@ static void coresight_disable_path_from(struct coresight_path *path,
 			coresight_disable_sink(csdev);
 			break;
 		case CORESIGHT_DEV_TYPE_SOURCE:
-			/*
-			 * We skip the first node in the path assuming that it
-			 * is the source. So we don't expect a source device in
-			 * the middle of a path.
-			 */
-			WARN_ON(1);
 			break;
 		case CORESIGHT_DEV_TYPE_LINK:
 			parent = list_prev_entry(nd, link)->csdev;
@@ -523,12 +510,16 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode)
 {
 	int ret = 0;
 	u32 type;
-	struct coresight_node *nd;
+	struct coresight_node *nd, *last;
 	struct coresight_device *csdev, *parent, *child;
 	struct coresight_device *source;
 
 	source = coresight_get_source(path);
-	list_for_each_entry_reverse(nd, &path->path_list, link) {
+
+	last = list_last_entry(&path->path_list, struct coresight_node, link);
+
+	nd = last;
+	list_for_each_entry_from_reverse(nd, &path->path_list, link) {
 		csdev = nd->csdev;
 		type = csdev->type;
 
@@ -582,6 +573,11 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode)
 err_disable_helpers:
 	coresight_disable_helpers(csdev, path);
 err_disable_path:
+	/* No device is actually enabled */
+	if (nd == last)
+		goto out;
+
+	nd = list_next_entry(nd, link);
 	coresight_disable_path_from(path, nd);
 	goto out;
 }

-- 
2.34.1


