Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5084DCD3423
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 16:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mdUxTh/46w5GzKN2nd/hxBu6VQliYPso74wXq07OM3U=; b=nd1Vt7SRcQfFiGZYe4sdxfhBpU
	8xFrNF8HlWYFQV7CcMV3T45MYoA673NLnxdOAKYVyaAJPUqZNkwcHx5kBw4NIL1p4a826H9/NLp1a
	yF2Rq360F1bLdKu6IL3212HJjf0KjSq9MVlyzwVahe4HeaPLvPyhrdtuKJz8F+IFBcy9e1e4a/GVZ
	+effP1UG4GZQsKRNpg3zB9IJ6DTvTzU2+iV8zTCmgvWv/irwnwMCCYvkhOXfqJu87uJiI1vkUr4oq
	TZDyzXzK0lpY4qDHzIM7b+pDjcpeKAfjWmoqhxK2d3l+d6WBirAg8z/QufV/LuaX4uxBIPTYrH+j6
	87nQ5wsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr34-00000007Ror-1ozL;
	Fri, 01 May 2026 16:49:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr32-00000007Rl1-0b6B
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 01 May 2026 16:49:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=mdUxTh/46w5GzKN2nd/hxBu6VQliYPso74wXq07OM3U=; b=meY2qQY4yZ1aRbgvia1bLmUH7s
	MyePaqHV40mR7Zlb9ZknlzVb9iY8gR0U/FqEHfBztKL8F8JbGsb34pMslT0vv2yxUn4zRNRDyHYs1
	Auqg+N3hc3exuynz7BWs47LczCeBOvR9zQT4WxvD3A90M+hdJBPgQxuMUu7IxV3IOmcOq7lfrWOmT
	6VNIeKsRHAJ8n/akWby8Bo0K/36KIT/sGamX1MwH2G2VJNBAzTkaO035kDZwiMeQlpHTGN6LTgY1H
	cgd+xWTTGn8iplDb/7B3RK1XsgkikVi9RB+j/kwSlY+j7IZnClRjfs4TVToi7gMgnIsDQf4XPqZ+v
	zSu1LX/g==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr2y-00000009B7n-2Ld3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 16:49:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41EFE176A;
	Fri,  1 May 2026 09:48:54 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2D9873F7B4;
	Fri,  1 May 2026 09:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777654139; bh=jF9yUjujlHw3fCoQA+Xj6j+lHa6R8Glsun1uK/fOt4c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=vISKlTottQQ5rqF9rNwzFa3YjuXwt22VdSx4yQ/lB/yAr48oBkVZWVmYqMzKYYWQ1
	 EUUyQzGh0uhsB/lJsMBO6fXVY6JfeXpisj2NcseDdoq+4+IR9r8tNK0LDV8Qxh2O34
	 ELgCZ1oWE4yZxVfPXJT8WCcyfCd5fQZjZwA6Ttv0=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 01 May 2026 17:47:59 +0100
Subject: [PATCH v11 18/27] coresight: Save active path for system tracers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-arm_coresight_path_power_management_improvement-v11-18-fc7fb9d5af1c@arm.com>
References: <20260501-arm_coresight_path_power_management_improvement-v11-0-fc7fb9d5af1c@arm.com>
In-Reply-To: <20260501-arm_coresight_path_power_management_improvement-v11-0-fc7fb9d5af1c@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777654086; l=3125;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=jF9yUjujlHw3fCoQA+Xj6j+lHa6R8Glsun1uK/fOt4c=;
 b=jFAUF3yXhzqnCA66NuZ6kPEOSfuTSbqdg5xHwswJD3B8+PD+nUJFSMLmo1VgFdr+DJxvmkI52
 1TFGeERHJmeBHMDteWkWv2PMWcMnsCelGbM7eT9/kT6FolbgfD3InKv
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_174900_958171_175647AA 
X-CRM114-Status: GOOD (  18.22  )
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

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 23 ++++++++++++++++++++++-
 include/linux/coresight.h                    |  2 ++
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 308282d2d4611997834bd39dc2de271bfa568ee0..b45fb38eb9d652e44802c23ea4ee3b051d635207 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -478,10 +478,28 @@ int coresight_enable_source(struct coresight_device *csdev,
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
@@ -489,6 +507,9 @@ void coresight_disable_source(struct coresight_device *csdev, void *data)
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


