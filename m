Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CAFBCAC598
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 10:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=khH2DsG4RBkobNQ0LZhno6yvOYxRyFWKdf75r1eaMp4=; b=jhZGwUE3xcFNLHQWrpFIb90Rxs
	OaOuNHuRNR04gIixiYCTGjm70F4UwEsCZ054lX3J6GR3PMpFSYPTcW+K8PTe4rPopHx96b1BpvAia
	2bNDjxFiRmF6dWPV3DOkhqvxzZr5HH9kFa230A1BLtkiaX1+gWDFX3ICb7spd9TQ1KFTr8Wi/rlrd
	uiBAlezP6TJ1EO9ymAJ8RRCbXT7FoFb89R8ay0HCjWSdXIY4l5lwkflzaZevSi7ebSA+YOD8qQIth
	rZFRtAKHxS1j+TMPBMVQ8ECK0KPYMSvZl50+eS8p59N9i0P1KY+WLgvgGTCmxd9cSEpdhki47p217
	tQ1eF8OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6Xs-00000003gdD-3QUm;
	Mon, 15 Sep 2025 10:34:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6XY-00000003gAu-0E5g
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 15 Sep 2025 10:34:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=khH2DsG4RBkobNQ0LZhno6yvOYxRyFWKdf75r1eaMp4=; b=cprRsgb1mMw7L2dbwpTPeOzblO
	NG2BhmOOFJtaDtiXqGxz39Lbty2rPMw6p/nT3i9Al2/u09wzjITA3AM7q5dzhpNC2kSTi9G4FkQz8
	G5JBQOCeOkhh13pQlgRBI0BelrXYRs8U0jOoZ1d4ECA5uu0hlrrNlr8W5UjKHlQyYgLKhtleN0D4M
	UK3ROgb6sY2HigSaib1euiRFG4yUZEBrdK5pE8NCTEcrGDuWSJywIJIM0V4l5bQF1tCyYCynC4N60
	CGP2CLZa5HFSfU/N1T/Gofh0zyGM0v+QGNm5D1uoduowG2rJ6MYMiy2r1YWsPHGd8OdgJgnuAYTMa
	jCekOtOQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6XU-00000006vb2-38SS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 10:34:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 986071424;
	Mon, 15 Sep 2025 03:34:19 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3BCA03F66E;
	Mon, 15 Sep 2025 03:34:26 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 15 Sep 2025 11:33:47 +0100
Subject: [PATCH v3 24/31] coresight: Add per-CPU path pointer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-arm_coresight_power_management_fix-v3-24-ea49e91124ec@arm.com>
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
In-Reply-To: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757932420; l=3722;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=POuBCwaeZ54zh4lDjl69RTtASWP0DhxKRVu6v9OXJWo=;
 b=0JAXIe4GCpa5y4tTqMA2U/ataxImurQiZ2Qm4asXCgN11K3vi9zxehL71tXuxZ0HA/072EsFs
 s16ePr4Bgi8A8Bcuu76LJlnxNp3TmlLWuuzZRK2E1zZLMQa+tFXmlAa
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_113429_435503_9BA3332B 
X-CRM114-Status: GOOD (  19.11  )
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

Introduce per-CPU path pointers, save activated paths into the
structure. This will be used by later changes for controlling the path
during CPU idle.

The path pointer is assigned before setting the source device mode to
active, and it is cleared after the device is changed to an inactive
mode. So safe access to path pointers is guaranteed when the device is
in an active mode.

The path enabling has been refactored: a new _coresight_enable_path()
function is introduced to enable components in the path. The existing
coresight_enable_path() function now calls this new helper and updates
the per-CPU pointers accordingly.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 48 ++++++++++++++++++++++++++--
 1 file changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 94803cacf1a374ae8a3b9513d7d029d5c77d5925..904123279ee70531787feea98e5f9fc502470f88 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -37,6 +37,27 @@ DEFINE_MUTEX(coresight_mutex);
 static DEFINE_PER_CPU(struct coresight_device *, csdev_sink);
 static DEFINE_PER_CPU(struct coresight_device *, csdev_source);
 
+/*
+ * Activated path pointer for a per-CPU source device. When enabling a path,
+ * the path pointer is first assigned, followed by a synchronous SMP call on
+ * the target CPU to transition the device mode from DISABLED to an enabled
+ * state. Conversely, during the disable flow, an SMP call on the target CPU
+ * transitions the device mode to DISABLED, after which the path pointer is
+ * cleared.
+ *
+ *  per_cpu(csdev_cpu_path, csdev->cpu) = path
+ *  coresight_take_mode(csdev, CS_MODE_SYSFS or CS_MODE_PERF)
+ *
+ *  // Safe to access per_cpu(csdev_cpu_path, cpu);
+ *
+ *  coresight_set_mode(csdev, CS_MODE_DISABLED)
+ *  per_cpu(csdev_cpu_path, csdev->cpu) = NULL
+ *
+ * As a result, the device mode is used to determine whether it is safe
+ * to access the path pointer.
+ */
+static DEFINE_PER_CPU(struct coresight_path *, csdev_cpu_path);
+
 /**
  * struct coresight_node - elements of a path, from source to sink
  * @csdev:	Address of an element.
@@ -510,6 +531,12 @@ static void coresight_disable_path_from(struct coresight_path *path,
 
 void coresight_disable_path(struct coresight_path *path)
 {
+	struct coresight_device *source;
+
+	source = coresight_get_source(path);
+	if (coresight_is_percpu_source(source))
+		per_cpu(csdev_cpu_path, source->cpu) = NULL;
+
 	coresight_disable_path_from(path, NULL);
 }
 EXPORT_SYMBOL_GPL(coresight_disable_path);
@@ -533,8 +560,8 @@ static int coresight_enable_helpers(struct coresight_device *csdev,
 	return 0;
 }
 
-int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
-			  void *sink_data)
+static int _coresight_enable_path(struct coresight_path *path,
+				  enum cs_mode mode, void *sink_data)
 {
 	int ret = 0;
 	u32 type;
@@ -601,6 +628,23 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
 	goto out;
 }
 
+int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
+			  void *sink_data)
+{
+	int ret;
+	struct coresight_device *source;
+
+	ret = _coresight_enable_path(path, mode, sink_data);
+	if (ret)
+		return ret;
+
+	source = coresight_get_source(path);
+	if (coresight_is_percpu_source(source))
+		per_cpu(csdev_cpu_path, source->cpu) = path;
+
+	return 0;
+}
+
 struct coresight_device *coresight_get_sink(struct coresight_path *path)
 {
 	struct coresight_device *csdev;

-- 
2.34.1


