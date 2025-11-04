Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F60CCFA0C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 15:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zW6knlq4MYYfbtj8UbiFJACNmyKYLIe3evx2Qbk3acw=; b=tCJokMPz2l9fmauMo2/tlPNfM7
	L4o8fLqgfUM1fRS2d0YTwFGFj1mOc9mHkoHc6wfylPab5ufwPF3RjfLvF8+ACMMeHPZEGfnioq3mw
	05B64a8B/i/N1xPoMbsBMjhNQzAOePLuSkuDFToVreBaxtBofqw6wY9CuJCYLI+vQkfjwrRw6CDxj
	bRV8rAU1NGJTDTxotLomAlmYRM3VLfZ0FFoaem8T+C221IJnMZfG/Ue7pvmTTfrK09x+DbzKW72Xj
	lNXv0JbXODSmr8ItfBEc2SfccSHB3rdZeX8o77QRMf8D1b3wvD1EWqEQGR0HOezNFu0D7d5/sHdSh
	08zeIOKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIrz-0000000C4Aq-0wx0;
	Tue, 04 Nov 2025 15:22:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIrw-0000000C46S-0Y5K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 15:22:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ECCF32E99;
	Tue,  4 Nov 2025 07:22:39 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1FF623F66E;
	Tue,  4 Nov 2025 07:22:46 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 04 Nov 2025 15:21:52 +0000
Subject: [PATCH v4 08/15] coresight: Introduce coresight_enable_source()
 helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-arm_coresight_path_power_management_improvement-v4-8-3d4bba674709@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762269750; l=4282;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=hqg3ZyMjG7+H9Ow/PetRq0+lgzZmUndlcI1rJtK/85Q=;
 b=EPFMP2qnGbxzZ7H/IYMAX6OMx+I3OBrKoRKMlBLaNkecZqlcYRIaSFgtJ4FPIuWiRNP5iDRKj
 UUlZJsRHQwFAfFd5SVJBiLHmkPe901hfQqy0V7S4RLSYE4HZYcUoWMX
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_072248_253819_3BA3BD81 
X-CRM114-Status: GOOD (  16.08  )
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

Introduce the coresight_enable_source() helper for enabling source
device, refine the comment for the imbalance between enable and disable
pair functions.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c     | 15 ++++++++++++---
 drivers/hwtracing/coresight/coresight-etm-perf.c |  2 +-
 drivers/hwtracing/coresight/coresight-priv.h     |  3 +++
 drivers/hwtracing/coresight/coresight-sysfs.c    |  2 +-
 4 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 0d4e935094297023b8a7786ff4b1b3783164016b..c28f3d255b0e19b3d982de95b8e34d0fc2954b95 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -385,15 +385,24 @@ static void coresight_disable_helpers(struct coresight_device *csdev, void *data
 }
 
 /*
- * Helper function to call source_ops(csdev)->disable and also disable the
- * helpers.
+ * coresight_enable_source() only enables the source but does nothing for the
+ * associated helpers. In contrast, coresight_disable_source() calls
+ * source_ops(csdev)->disable() and also disables the helpers.
  *
  * There is an imbalance between coresight_enable_path() and
  * coresight_disable_path(). Enabling also enables the source's helpers as part
  * of the path, but disabling always skips the first item in the path (which is
  * the source), so sources and their helpers don't get disabled as part of that
- * function and we need the extra step here.
+ * function and we need the extra step in coresight_disable_source().
  */
+int coresight_enable_source(struct coresight_device *csdev,
+			    struct perf_event *event, enum cs_mode mode,
+			    struct coresight_path *path)
+{
+	return source_ops(csdev)->enable(csdev, event, mode, path);
+}
+EXPORT_SYMBOL_GPL(coresight_enable_source);
+
 void coresight_disable_source(struct coresight_device *csdev, void *data)
 {
 	source_ops(csdev)->disable(csdev, data);
diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index f677c08233ba1a28b277674662c6e6db904873dd..dd1968dd173d608fb72835343cd647818c0bad1a 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -530,7 +530,7 @@ static void etm_event_start(struct perf_event *event, int flags)
 		goto fail_end_stop;
 
 	/* Finally enable the tracer */
-	if (source_ops(csdev)->enable(csdev, event, CS_MODE_PERF, path))
+	if (coresight_enable_source(csdev, event, CS_MODE_PERF, path))
 		goto fail_disable_path;
 
 	/*
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 33e22b1ba043264ad50acac69ece1ea6de25893b..8b978528cb49af43ef56d034f7ecc520f80f60df 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -250,6 +250,9 @@ void coresight_add_helper(struct coresight_device *csdev,
 
 void coresight_set_percpu_sink(int cpu, struct coresight_device *csdev);
 struct coresight_device *coresight_get_percpu_sink(int cpu);
+int coresight_enable_source(struct coresight_device *csdev,
+			    struct perf_event *event, enum cs_mode mode,
+			    struct coresight_path *path);
 void coresight_disable_source(struct coresight_device *csdev, void *data);
 void coresight_pause_source(struct coresight_device *csdev);
 int coresight_resume_source(struct coresight_device *csdev);
diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index cb02f1bfaf068ec3f50f997bcb94f7d5215ccea8..72e9607fc6aea4663abf7d1f7f03f247ea060b83 100644
--- a/drivers/hwtracing/coresight/coresight-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-sysfs.c
@@ -66,7 +66,7 @@ static int coresight_enable_source_sysfs(struct coresight_device *csdev,
 	 */
 	lockdep_assert_held(&coresight_mutex);
 	if (coresight_get_mode(csdev) != CS_MODE_SYSFS) {
-		ret = source_ops(csdev)->enable(csdev, NULL, mode, path);
+		ret = coresight_enable_source(csdev, NULL, mode, path);
 		if (ret)
 			return ret;
 	}

-- 
2.34.1


