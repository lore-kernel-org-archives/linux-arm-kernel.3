Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF20ACF34D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MSLDXf5x5rEqtbJrXD5qufx6JZ8vo+3hAM+ilvc5QYM=; b=HW4Mzz9gdLXppnNFsgt2XtrLvl
	hVSe1xSOEVeU7iJzlbOmWk4heY+EM+dKc2ZpQ0Bl/JQiXPny2qRGnfQHnXskCe3aG44G2jxfCWgt+
	c2vYNVB/V4whfTV+Q+bjXnw2p5cU38CXMmLh5TXnD5Aa1qc4ACoSGAM8euEwnxyKNbmgsgz7dC9VS
	yofiJ3Y23msJ2umx4R46cRlbRTTpItkx6ybq5RYdRm8SfvgB8Vy0XRkUs5XiQmfzJdwYD7Z8e0flR
	GdZrXpjMoYFI4u34OO8m6ftwBx1qTt4BOpgITYka9nSBcn3m/FsaTvkxP6gHQfzVkoAsZEq3dNjdi
	iuy363tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkRZ-00000003ZJq-19Z6;
	Wed, 19 Nov 2025 15:50:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkRK-00000003Z02-3BAX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 15:49:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CCF6153B;
	Wed, 19 Nov 2025 07:49:42 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 858F83F66E;
	Wed, 19 Nov 2025 07:49:48 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 19 Nov 2025 15:49:11 +0000
Subject: [PATCH v5 13/19] coresight: Add 'in_idle' argument to path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-arm_coresight_path_power_management_improvement-v5-13-f615a301ad0b@arm.com>
References: <20251119-arm_coresight_path_power_management_improvement-v5-0-f615a301ad0b@arm.com>
In-Reply-To: <20251119-arm_coresight_path_power_management_improvement-v5-0-f615a301ad0b@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763567363; l=2873;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=jwLmUgyBCkpm/PS5XEy9tFOefRfDOWe+BJzPhyb2PQU=;
 b=upJWJSpNjuXzfbfyb5eYnc0nOphRjaRH4+Dl7r7yy5UTeh05G4iH2qmJ9RSVt5C5cwANoj4yM
 ZobWY2tWTy4AH+fRoHAy3IliWYA+bX5/wyn4ctCCdjizwhlItXOEfbm
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_074950_930799_C4AE75DA 
X-CRM114-Status: GOOD (  15.71  )
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

Introduce an 'in_idle' argument to the path.  When set to true for idle
flow, it skips to touch the sink device to avoid long latency caused by
the sink operations.

This is a preparation for managing the path during CPU idle.

Tested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 17 +++++++++++++----
 include/linux/coresight.h                    |  2 ++
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index e8efb09dd8fc5d94d7a07ddd86f3270bab424f54..e3efa7c9ef9fa1bf7b2f727205abe577bfc493e3 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -494,6 +494,10 @@ static void coresight_disable_path_from(struct coresight_path *path,
 						CORESIGHT_DEV_TYPE_SINK :
 						CORESIGHT_DEV_TYPE_LINK;
 
+		/* To reduce latency, CPU idle does not touch the sink */
+		if (path->in_idle && type == CORESIGHT_DEV_TYPE_SINK)
+			continue;
+
 		switch (type) {
 		case CORESIGHT_DEV_TYPE_SINK:
 			coresight_disable_sink(csdev);
@@ -560,10 +564,6 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode)
 		csdev = nd->csdev;
 		type = csdev->type;
 
-		/* Enable all helpers adjacent to the path first */
-		ret = coresight_enable_helpers(csdev, mode, path);
-		if (ret)
-			goto err_disable_path;
 		/*
 		 * ETF devices are tricky... They can be a link or a sink,
 		 * depending on how they are configured.  If an ETF has been
@@ -575,6 +575,15 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode)
 						CORESIGHT_DEV_TYPE_SINK :
 						CORESIGHT_DEV_TYPE_LINK;
 
+		/* To reduce latency, CPU idle does not touch the sink */
+		if (path->in_idle && type == CORESIGHT_DEV_TYPE_SINK)
+			continue;
+
+		/* Enable all helpers adjacent to the path first */
+		ret = coresight_enable_helpers(csdev, mode, path);
+		if (ret)
+			goto err_disable_path;
+
 		switch (type) {
 		case CORESIGHT_DEV_TYPE_SINK:
 			ret = coresight_enable_sink(csdev, mode, path);
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 9e1edff3ace951146f1801a732105d8560fa2356..ba1bd6479230d660eaaf3cf76ab531f6dc2a6f4a 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -337,11 +337,13 @@ static struct coresight_dev_list (var) = {				\
  * @path_list:		path from source to sink.
  * @trace_id:		trace_id of the whole path.
  * @handle:		handle of the aux_event.
+ * @in_idle:		A flag to indicate if it is in CPU idle.
  */
 struct coresight_path {
 	struct list_head		path_list;
 	u8				trace_id;
 	struct perf_output_handle	*handle;
+	bool				in_idle;
 };
 
 enum cs_mode {

-- 
2.34.1


