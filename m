Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62BBACCFA0C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 15:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dkATan9DlMg2AapNdS9ABuyThq0O9Pypq4ClHLZKj7k=; b=OHowqJzb8ldWW5Ejxgv2u/GukW
	Tfc0Qw6WJQ6Z/UzRfSV46fr6FoGRiig/dqtpqBPPSVjTQuqXUUwr4sdXjPSDJ7q5P2OOAyjHYNlPu
	xkSTfP5RX8k9gd0N1MbdnVhUIKg+Yet7P51AzvnPS7kY1QYoIzpgyUF72eZFhkmHHRvVcD0rMNhcn
	qNwaVHxG+SMtBcj4/bcW1GII+pPfaLqto0VHDK4nCuNNTQMCGMHQKIAQTqDr7EThCXnVD17Lr8hrp
	4LbiyNRRlktT5wWvXP5tHVo8KQSYbnN32tJpxfvlt1VLBReOF6HMBscSHpDlYwQPeLiHwjZjghtlE
	OSStHNFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIs3-0000000C4Hj-3I4a;
	Tue, 04 Nov 2025 15:22:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIs0-0000000C4CZ-2IHu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 15:22:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C20372E99;
	Tue,  4 Nov 2025 07:22:43 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E78C03F66E;
	Tue,  4 Nov 2025 07:22:49 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 04 Nov 2025 15:21:54 +0000
Subject: [PATCH v4 10/15] coresight: Add 'in_idle' argument to
 enable/disable path functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-arm_coresight_path_power_management_improvement-v4-10-3d4bba674709@arm.com>
References: <20251104-arm_coresight_path_power_management_improvement-v4-0-3d4bba674709@arm.com>
In-Reply-To: <20251104-arm_coresight_path_power_management_improvement-v4-0-3d4bba674709@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762269750; l=3740;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=4Oq/FY7qTvhJJL0l5XumPtbaeivGHVDFGr6+IX6hG5Q=;
 b=jWyIlGwiWaAPhWN/PfZ+3L3PA2hIZNGve9etdiKPH6MkHYS/b5COKClrY945y/aU44ZXFMBLg
 bsIZ5cfGTd0BsuVOTE0uXcV+DcuXL5XLjEmlWemPSFJquHAFnHvAClp
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_072252_681110_795FD0E5 
X-CRM114-Status: GOOD (  14.92  )
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

Introduce an 'in_idle' argument to the path enable and disable
functions. When set to true for idle flow, it skips to touch the sink
device to avoid long latency caused by the sink operations.

This is a preparation for managing the path during CPU idle.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 35 +++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 3ea31ed121f7b59d7822fba4df4c43efb1c76fe7..6c12692efb51c63f3aa9da6f65a349eae1926f4d 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -475,7 +475,8 @@ EXPORT_SYMBOL_GPL(coresight_resume_source);
  * disabled.
  */
 static void coresight_disable_path_from(struct coresight_path *path,
-					struct coresight_node *nd)
+					struct coresight_node *nd,
+					bool in_idle)
 {
 	u32 type;
 	struct coresight_device *csdev, *parent, *child;
@@ -498,6 +499,10 @@ static void coresight_disable_path_from(struct coresight_path *path,
 						CORESIGHT_DEV_TYPE_SINK :
 						CORESIGHT_DEV_TYPE_LINK;
 
+		/* To reduce latency, CPU idle does not touch the sink */
+		if (in_idle && type == CORESIGHT_DEV_TYPE_SINK)
+			continue;
+
 		switch (type) {
 		case CORESIGHT_DEV_TYPE_SINK:
 			coresight_disable_sink(csdev);
@@ -527,7 +532,7 @@ static void coresight_disable_path_from(struct coresight_path *path,
 
 void coresight_disable_path(struct coresight_path *path)
 {
-	coresight_disable_path_from(path, NULL);
+	coresight_disable_path_from(path, NULL, false);
 }
 EXPORT_SYMBOL_GPL(coresight_disable_path);
 
@@ -550,8 +555,9 @@ static int coresight_enable_helpers(struct coresight_device *csdev,
 	return 0;
 }
 
-int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
-			  void *sink_data)
+static int coresight_enable_path_internal(struct coresight_path *path,
+					  enum cs_mode mode, void *sink_data,
+					  bool in_idle)
 {
 	int ret = 0;
 	u32 type;
@@ -564,10 +570,6 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
 		csdev = nd->csdev;
 		type = csdev->type;
 
-		/* Enable all helpers adjacent to the path first */
-		ret = coresight_enable_helpers(csdev, mode, path);
-		if (ret)
-			goto err_disable_path;
 		/*
 		 * ETF devices are tricky... They can be a link or a sink,
 		 * depending on how they are configured.  If an ETF has been
@@ -579,6 +581,15 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
 						CORESIGHT_DEV_TYPE_SINK :
 						CORESIGHT_DEV_TYPE_LINK;
 
+		/* To reduce latency, CPU idle does not touch the sink */
+		if (in_idle && type == CORESIGHT_DEV_TYPE_SINK)
+			continue;
+
+		/* Enable all helpers adjacent to the path first */
+		ret = coresight_enable_helpers(csdev, mode, path);
+		if (ret)
+			goto err_disable_path;
+
 		switch (type) {
 		case CORESIGHT_DEV_TYPE_SINK:
 			ret = coresight_enable_sink(csdev, mode, sink_data);
@@ -614,10 +625,16 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
 err_disable_helpers:
 	coresight_disable_helpers(csdev, path);
 err_disable_path:
-	coresight_disable_path_from(path, nd);
+	coresight_disable_path_from(path, nd, in_idle);
 	goto out;
 }
 
+int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
+			  void *sink_data)
+{
+	return coresight_enable_path_internal(path, mode, sink_data, false);
+}
+
 struct coresight_device *coresight_get_sink(struct coresight_path *path)
 {
 	struct coresight_device *csdev;

-- 
2.34.1


