Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B36D0109C023
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 14:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K2bhg6pS4DfyzPd2sgUZ6s/qaxW6Q3ZOvzL4hk8NdOI=; b=2b2ge4CgIRdy16whDFgM/zH8TO
	Y2Qpml/2OLB6M+iAFdoYvlBDN2DXGe0vXMGmuBpZS17eW3D6DHvL3lgBeSj6kiaoNRMJrBw3+bvtg
	bCLR2dYgeGIZv/ZSpNG3af/eXN9PpxINrb7rA3s9meTksEzLZd7FAjdqvk0lbmOasB4d8yJQz+evA
	vPFFbyE8/nOtLWKHKOeRS5wke83pA4KZt4Xu9e4WxoiDGowSo8X598Rw+V5s9Z3pIwBG7Xbhzr9Yw
	LS3tWUe44dePNWtOTkQA9/qj+WFQ0kEorRSCupuW5jSYVibnfeieqMFeIR+Ovmv+ILAziFnY0pYC1
	oDSDsuiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PCu-00000003a3h-33hR;
	Wed, 25 Mar 2026 14:27:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PCk-00000003ZrV-21He
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 14:27:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E93ED1F02;
	Wed, 25 Mar 2026 07:27:23 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F086E3F836;
	Wed, 25 Mar 2026 07:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774448849; bh=zT3+Qm4VKJU5p/RNY7eIdSltlgH7qnuG2Szm95MX4FA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pxpfQ4dT4eSyyjIpclKSncEDL++Xnr8uWlxU0WAqHXQ3p59H+ucn0l2S3VvOBcB3u
	 bc9ZFJXYop9IE0GgZnFYSpWgJ7C6IrBo1ZrFf/iioT0goL0TTBHbHC9j1fC3sIyO3h
	 McMQy9S1jAIc/ONm36UzeJ3S/dD1Qf8UmaoxXrOo=
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 25 Mar 2026 14:26:51 +0000
Subject: [PATCH v8 14/23] coresight: Save active path for system tracers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-arm_coresight_path_power_management_improvement-v8-14-7b1902e18041@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774448817; l=2834;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=zT3+Qm4VKJU5p/RNY7eIdSltlgH7qnuG2Szm95MX4FA=;
 b=22BHoCoTybMjaMYjT74FWltiUci/exe+As2TAStLwmbaKqGxc7sQ4bEVj+YvSQL+2G5255Bb0
 e9yI06/iZ/6D9460eVmt4Vls0FwrC8GeuFydAKswnT02heH7xt/H/d7
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_072730_647233_6173FFAA 
X-CRM114-Status: GOOD (  15.21  )
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

Store the active path in the source device structure for system
tracers (e.g. STM).  Ensure the path pointer is cleared when the
source is disabled.

Tested-by: James Clark <james.clark@linaro.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 19 ++++++++++++++++++-
 include/linux/coresight.h                    |  2 ++
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index aaa525f6d5a66a974bdcca3a42447ac26ad39733..a74a595dd61f1a004ee0ebc9600127c928ee9f16 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -447,10 +447,24 @@ int coresight_enable_source(struct coresight_device *csdev,
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
+	 * The per-CPU source has updated its path pointer in the enable()
+	 * callback, ensuring synchronization on the target CPU. Set the
+	 * path pointer here for non per-CPU sources.
+	 */
+	if (!coresight_is_percpu_source(csdev))
+		csdev->path = path;
+
+	return 0;
 }
 
 void coresight_disable_source(struct coresight_device *csdev, void *data)
@@ -459,6 +473,9 @@ void coresight_disable_source(struct coresight_device *csdev, void *data)
 		return;
 
 	source_ops(csdev)->disable(csdev, data);
+
+	if (!coresight_is_percpu_source(csdev))
+		csdev->path = NULL;
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


