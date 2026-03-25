Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B775E109C027
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 14:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VV1iSUEY53m3cmh+3I433cThaqToW6XDP07VwA7WBpU=; b=h+sH0YsAtYdhVA7ZGHlbAJ6uKf
	jdHptCfUyS81Gl5GYGytED2Tvk8XuU5nnDlFZDIMylXIUwAK5UpAaIm8Dzo25J03EEXLy1xt3hamf
	d3ey8/saj9mZim7HkZLAQ1UL6GNsJ8fwiIMLaKqGRJnZrl3u7HiJX8Bbap6C/Preeeo75XbdEzyll
	4b1mil1GDLUbr9d1yeoXRw/QvVmDdI2sLYKMgHDHUHSReksgE7fKyuTFcoNrahii+VQdEvamm7VkT
	mZdrXYQIomfeR0KBw3gAAWEvsnSPIKwjJoIQx9Pio2Gp669OcIlIULvlz/DlYEg+p6dyat3jSGlTm
	i8Hxf0uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PCq-00000003Zx2-0ef4;
	Wed, 25 Mar 2026 14:27:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PCb-00000003Zm5-3RHQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 14:27:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23B4D1F02;
	Wed, 25 Mar 2026 07:27:15 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 320F03F836;
	Wed, 25 Mar 2026 07:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774448841; bh=HNtv6jcXfpustEDEg20oTbb/50VhgHLFqLTx/rfUaco=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=E9iBd8O0yXxOmFPkqbnp1tTWnN2gNOGFo/9fsRnvMllWeAlAnabpmn2sAKidzRTRZ
	 dzcEuKBh3SkwckDweLl8FVvxAyD9P4+M504iNHdiO9sHgPeLwvZKcX0k4wqent6HlZ
	 mXwhAmQBg4mzcvuYieN6qAL2wANVRqijQ1cnpcXI=
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 25 Mar 2026 14:26:47 +0000
Subject: [PATCH v8 10/23] coresight: Move source helper disabling to
 coresight_disable_path()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-arm_coresight_path_power_management_improvement-v8-10-7b1902e18041@arm.com>
References: <20260325-arm_coresight_path_power_management_improvement-v8-0-7b1902e18041@arm.com>
In-Reply-To: <20260325-arm_coresight_path_power_management_improvement-v8-0-7b1902e18041@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774448817; l=3756;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=HNtv6jcXfpustEDEg20oTbb/50VhgHLFqLTx/rfUaco=;
 b=CqouAvC/gbuoP/id6CKP5tqu1b/rdltTK3pfFuuweyiYM13EUv9WFJdXonLMF2d9CzQEo0vDB
 lhpqmL1373qBuFf4xumtF+zoj6F2WQv72oLvW6kuIAHYZV88SihZgPW
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_072721_974498_96943FB6 
X-CRM114-Status: GOOD (  19.60  )
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
index c14a1d1b4d8c3d742dcbfb07e0cd8d7a905cca22..1d6a4c5b3b97b13d06356b01b5acd161c8d607de 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -416,19 +416,12 @@ static void coresight_disable_helpers(struct coresight_device *csdev,
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
 
@@ -468,7 +461,7 @@ static void coresight_disable_path_from(struct coresight_path *path,
 	if (!nd)
 		nd = list_first_entry(&path->path_list, struct coresight_node, link);
 
-	list_for_each_entry_continue(nd, &path->path_list, link) {
+	list_for_each_entry_from(nd, &path->path_list, link) {
 		csdev = nd->csdev;
 		type = csdev->type;
 
@@ -488,12 +481,6 @@ static void coresight_disable_path_from(struct coresight_path *path,
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
@@ -540,12 +527,16 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode)
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
 
@@ -599,6 +590,11 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode)
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


