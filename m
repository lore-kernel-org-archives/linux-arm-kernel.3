Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23E7CD4842
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 11:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X/gvGHxIlZ1lJ4To8BKNCpyXXZFsllazmMpmf3D26QU=; b=BNwxbVOA0eCY4Wi+Xol28P6GIn
	JhnRJut+8X8F5oogzd/kLtutILEEY7jOANoS/dmb1veWp261rNC6ajvlKm8b8EnVejX8bfSqpcHd/
	MRd87lmCigyrKah6IWN6ioKJjYf8x7G8U1tZlZ2UiQNu/BWfUxxbTYv1D6IT8QXgvmLj/heYfsyRq
	qWNC8YGV7RycGj2cOUyaDoe40y+Bq/VIKO6Fb/YRHB4oXzUMMmC1W6cV/7jQ3a5p8wBzT7dkUkYN3
	nvQ9QKJCcnsmxojlUOMrWnX9HiaFmSTzm0a+c/TgoxpMerZGA/HAEYkjUVVapmIp/Hs7+mpyYpnHF
	qWTkmAyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOYU-0000000DFyw-3bvT;
	Mon, 11 May 2026 11:12:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOYM-0000000DFhf-0sDc
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 11 May 2026 11:12:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=X/gvGHxIlZ1lJ4To8BKNCpyXXZFsllazmMpmf3D26QU=; b=ogp0f9JT8vgfSYREuDHpYVJA39
	/lcBCcVN24RpbfasQjoVCnqyG0/F3mpPv/AELvsbTXjePhesgU9mHyp9NVKwrR59wgXVVIdOryRCX
	WzkCVOvM6NvwUlK0bZB9r0HdaJsvx9JWUiJLU8FfCe7TLoEdsFabVG1AYsU4wtPcOnzwsTdJVJkg0
	WL5sO8dztPwQBIPOGLfZUaZpERmlTlTBj0Aq8ziEYuWlPiRBDDNr3GJQN0M5Ge2n3JXqZengT2lBx
	k4eRBIllAhekRIkSCkV9QjrvpPhl8eXzaIElkwRTTbCjgRTE7CWImFISng5UmMToOAT99wsM/mump
	a/ln6vPQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOYI-0000000BQtG-2X3E
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 11:12:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 949C616F8;
	Mon, 11 May 2026 04:11:52 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A3B353F85F;
	Mon, 11 May 2026 04:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778497917; bh=Ap/uykVyPNyiT0no4JlJE438x10eE48J98wYmRr2vOY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RGcqRBg51ocxYsWyak2fE4WozarL6cLGFVIwWi1cnMxfMGj1CvEB6IyuLQH0St3FW
	 68gF4PMzei0iPAVewPsP3vd8TDW3SPjkwqiPWDV23P7hRNn8vXTrM7vAylfCQ5IR4I
	 Lbe2hGRk28kKhkVt1FRp14W/q7dG1m1LPlEa5yJA=
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 11 May 2026 12:11:03 +0100
Subject: [PATCH v12 19/28] coresight: Save active path for system tracers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-arm_coresight_path_power_management_improvement-v12-19-1c9dcb1de8c9@arm.com>
References: <20260511-arm_coresight_path_power_management_improvement-v12-0-1c9dcb1de8c9@arm.com>
In-Reply-To: <20260511-arm_coresight_path_power_management_improvement-v12-0-1c9dcb1de8c9@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778497860; l=3320;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=Ap/uykVyPNyiT0no4JlJE438x10eE48J98wYmRr2vOY=;
 b=hrvbDPG7khTTzEYpMIp6ebubMQZzVqP2HX5UGHc1JXGLsDZADx+EN0wf1v7FequXZRA4dC6D2
 +eTL0IXALBOAwjYwvYuWcHt4QEOAX3OnY7RVGaRUhvMsR17HmQKAFh2
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_121159_443800_7F34FDDA 
X-CRM114-Status: GOOD (  17.89  )
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
index ff882769cab2bb20bc2cb768e86f111f8a09cc8d..f07f6f28b9162911cdc673a454702f3ac4dc29ad 100644
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


