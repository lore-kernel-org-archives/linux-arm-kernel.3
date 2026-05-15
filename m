Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D2BCD4F48
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 20:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lbp1RX/8OxXnvi3/Vh1xknV+NXrwdr7W8i8tnXbcE9w=; b=BiNl4Wf6kzWGm9yMks3Vd8zTvU
	9YK5My+Lo4rkk0ewa7tBXjKQsu5m6WrFahJVNalNtENdwvlRNFd6S82K3+gdAomKiQiOg/mBVh/xv
	yDG695DE28wFOZzTX0DeXrKoB+htzIRw8K8gTTXFzRXkLU3R6cGaE+qDFre8Re2tJZS4PKZSd9VF7
	P2t6Im2v5I8HMPpaXnzrRAzSaqonSKgWbiy2qH1cXdiw5pSt6LYjT5XNBhp+O+GxhonS6QyeBfHm4
	YWl+zXAsrEogEDY6Hodo698KD8y6TFIwhPyZkdtR4cdE34uCiKEXijkYmVKfGWMVTNgFH/8IuUr9v
	UwovvCRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNyr1-00000009Jnb-0bsj;
	Fri, 15 May 2026 20:09:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNyqx-00000009JhE-0oLk
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 15 May 2026 20:09:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Lbp1RX/8OxXnvi3/Vh1xknV+NXrwdr7W8i8tnXbcE9w=; b=k4X8YmrA4MtR3V0Gz6xvhWYsWG
	nf8G6z/hs+k5R815N+Sg8th5mEB3wvNwYUkXQ25JnDhhF6whzcHFvFXi8gVL79q8i7JWof7jmf2Ls
	eCRjJq/J0PgzmWD/qynv48wmkOKMGpHz+nk12sQuPjRSoaTilHXUCxOdYCzYL3Y4O1DmWjeYX05i8
	zubjoQjKtVAlDHsIEAw8494OFbTO3qkRMmWtyjaQeUd+8N7Nz7ItDCsOIQuywGw15L0inMmbhcDpH
	APfnCCHHDq1KChYtZf51XnORZJ2kMCWK3RlE1lZz5XWUcUiq0gDWzWq7bjw9umajLPnQPutzIwJwl
	HhYOFAtg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNyqb-00000006A2B-0XMv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 20:09:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 582C435E2;
	Fri, 15 May 2026 13:09:19 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C046A3F836;
	Fri, 15 May 2026 13:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778875764; bh=jUZ8Tr1F0203ducrkWCT6lapHJyBV8sURYBrHuw5MOE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=j/S/9NIleE4qyZAb94nd8Bwe6ZO4xP1uiPuQMGKOjqfsIkJWnb1S2lMkBdpSrHMo1
	 RTEyFydq/OXjPn2GO7CpSF5ieQYY9Jg5mDmFq/TeYZGRZwpwVwQeATyvi1bHuZi5rB
	 xF+YpCT/5ROMGhI0OEX0IP+sd7TOvrA3DEgwReVs=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 15 May 2026 21:08:26 +0100
Subject: [PATCH v14 19/28] coresight: Save active path for system tracers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-arm_coresight_path_power_management_improvement-v14-19-f88c4a3ecfe9@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778875700; l=3320;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=jUZ8Tr1F0203ducrkWCT6lapHJyBV8sURYBrHuw5MOE=;
 b=Bfvd3vYlGNXZh6XgLog7OLjOtPDAQ7f+ZYk108phjVoXcAq5P7CnAXloGirXURIsv0EPtkLEd
 ZDZ+WMm4uUvCc1hbqKk1ZYceRUzrl0jV0mtn/tYhb66Is+ASYFDcEl5
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
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

This commit only set the path pointer for system tracers (e.g. STM) in
coresight_{enable|disable}_source().

Later changes will set the path pointer locally for per-CPU sources.
This is because the mode and path pointer must be set together, so that
they are observed atomically by the CPU PM notifier.

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Tested-by: James Clark <james.clark@linaro.org>
Tested-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 23 ++++++++++++++++++++++-
 include/linux/coresight.h                    |  2 ++
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index f833b73ebc168b2b039e5f0900594d0bde5ff916..7f6febd20faa64bc99336b368d0193221706fc2d 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -487,10 +487,28 @@ int coresight_enable_source(struct coresight_device *csdev,
 			    struct perf_event *event, enum cs_mode mode,
 			    struct coresight_path *path)
 {
+	int ret;
+
 	if (!coresight_is_device_source(csdev))
 		return -EINVAL;
 
-	return source_ops(csdev)->enable(csdev, event, mode, path);
+	ret = source_ops(csdev)->enable(csdev, event, mode, path);
+	if (ret)
+		return ret;
+
+	/*
+	 * Update the path pointer until after the source is enabled to avoid
+	 * races where multiple paths attempt to enable the same source.
+	 *
+	 * Do not set the path pointer here for per-CPU sources; set it locally
+	 * on the CPU instead. Otherwise, there is a window where the path is
+	 * enabled but the pointer is not yet set, causing CPU PM notifiers to
+	 * miss PM operations due to reading a NULL pointer.
+	 */
+	if (!coresight_is_percpu_source(csdev))
+		csdev->path = path;
+
+	return 0;
 }
 
 void coresight_disable_source(struct coresight_device *csdev, void *data)
@@ -498,6 +516,9 @@ void coresight_disable_source(struct coresight_device *csdev, void *data)
 	if (!coresight_is_device_source(csdev))
 		return;
 
+	if (!coresight_is_percpu_source(csdev))
+		csdev->path = NULL;
+
 	source_ops(csdev)->disable(csdev, data);
 }
 EXPORT_SYMBOL_GPL(coresight_disable_source);
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 5f9d7ea9f5941ab01eb6a084ca558a9417c7727f..58d474b269806d32cad6ed87da96550b06f1f30f 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -257,6 +257,7 @@ struct coresight_trace_id_map {
  *		by @coresight_ops.
  * @access:	Device i/o access abstraction for this device.
  * @dev:	The device entity associated to this component.
+ * @path:	Activated path pointer (only used for source device).
  * @mode:	The device mode, i.e sysFS, Perf or disabled. This is actually
  *		an 'enum cs_mode' but stored in an atomic type. Access is always
  *		through atomic APIs, ensuring SMP-safe synchronisation between
@@ -291,6 +292,7 @@ struct coresight_device {
 	const struct coresight_ops *ops;
 	struct csdev_access access;
 	struct device dev;
+	struct coresight_path *path;
 	atomic_t mode;
 	int refcnt;
 	int cpu;

-- 
2.34.1


