Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9626F3092B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 10:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t6wVfBKgkxOLH9rNPArf1qXuzdaa97UpyiPvaMO83So=; b=Qc6OgNdJgJIYDZ190JAOwfqj0p
	VGzPEPPPeMs9V7jhw/ELXkgAeO2NSy7WfqueQdGPrk2iewOqF+ntdz3KwgfKlRaVcLNlyySwDCp1F
	IjX2zv81o4VQbHZkCayqBlU0ywOqn+SuUTSkTMtGGqdcivwjQvaO7QmGhgDXaTh1gIV2mBAnNJwaY
	uN6ZxGV9LdlRzVnh8aQHtMt0L59xfCteCuWQ5mWs/iyZr5ZGgcYFvkeHcWqdvZctR5jCmlDX4QPrq
	lWBsrrZGZklHrxDz4TCoq2y4UxV4fUYjI1tQgxEVIzaq9q/6DIn2mfHVfI2JwtEwoLx8dr7qm4wYp
	Z38ZkfNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5mc-00000001Y73-18hD;
	Thu, 05 Mar 2026 10:18:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5mZ-00000001Y3N-3n0Z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 10:18:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 418A3339;
	Thu,  5 Mar 2026 02:18:08 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A38983F694;
	Thu,  5 Mar 2026 02:18:12 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Thu, 05 Mar 2026 10:17:44 +0000
Subject: [PATCH v6 13/19] coresight: Add 'in_idle' argument to path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-arm_coresight_path_power_management_improvement-v6-13-eff765d211a9@arm.com>
References: <20260305-arm_coresight_path_power_management_improvement-v6-0-eff765d211a9@arm.com>
In-Reply-To: <20260305-arm_coresight_path_power_management_improvement-v6-0-eff765d211a9@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772705864; l=2853;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=pkH4V6z9ybZnvynADtmxM5Z1sBejyDy/3R3N1lQqRZk=;
 b=uAPDux3gixddLVvw7/7mvshIIBzK6c10rokbPss9QYQ2T1KuLhHmxqrw/HVdQhP4xKaJPZaz+
 PTA4G1oqxwKCJ1+sljWPIo0cgPwE1YgurGKsz/dW0Jxgatqkx6Jv+y0
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_021816_077206_24A61188 
X-CRM114-Status: GOOD (  15.46  )
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
index 80489d38f690e0139c8712161c663ee63a8a7fb3..420e5a9cf38e64f133aa6780987d2d7c2804feb4 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -531,6 +531,10 @@ static void coresight_disable_path_from(struct coresight_path *path,
 						CORESIGHT_DEV_TYPE_SINK :
 						CORESIGHT_DEV_TYPE_LINK;
 
+		/* To reduce latency, CPU idle does not touch the sink */
+		if (path->in_idle && type == CORESIGHT_DEV_TYPE_SINK)
+			continue;
+
 		switch (type) {
 		case CORESIGHT_DEV_TYPE_SINK:
 			coresight_disable_sink(csdev);
@@ -597,10 +601,6 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode)
 		csdev = nd->csdev;
 		type = csdev->type;
 
-		/* Enable all helpers adjacent to the path first */
-		ret = coresight_enable_helpers(csdev, mode, path);
-		if (ret)
-			goto err_disable_path;
 		/*
 		 * ETF devices are tricky... They can be a link or a sink,
 		 * depending on how they are configured.  If an ETF has been
@@ -612,6 +612,15 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode)
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
index 96a1af3425a5d588fccb185a428cef5c88febdbd..5f778cd41e6bbb58393278f72feeaedabb0094d2 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -332,11 +332,13 @@ struct coresight_dev_list {
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


