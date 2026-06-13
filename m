Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F4D0CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 06:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O65kp4uYeS0m80wrjHhLdSErrpFdma2VMG6AHvedRp8=; b=q+mGRdaAhygW+Ho8qN+fj24o/t
	/z7KYReYghHZwpPVBbQSWkjV7afux1n/JJvCNnXn5xFu19yAVPefQsbIVOPQZad3rQSIa2oUiyjno
	7NPaiGpWukXCHC/ZwCbpTlyfZRz9HI+8WrqoD/ffBLkzwYlYCy1SYRZbySudOKB8qVRCgxYs2I8Ci
	4yJkwyqNzojDqXA5buKsEiIszkSgwrgudmoBEClZFkyhOAzz74sD2l67M9wsB0cVsx8prWivdz2p7
	TbhLLT8zUE54ivcjf2sWhNNe6dNyaNlgy9IhABz3eWgaCuH0wqtTTN9w/jyhuMeWMVgfjjBEX1/zZ
	Iv9zxs/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYIKJ-0000000C0zl-2o3w;
	Sat, 13 Jun 2026 06:58:43 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYIKF-0000000C0sI-2YbR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 06:58:41 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-49222fb062bso3059675e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 23:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781333918; x=1781938718; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O65kp4uYeS0m80wrjHhLdSErrpFdma2VMG6AHvedRp8=;
        b=fmmqQ6FGtgl27LhZULua35jJ2u99uG01HQroSWgWpeVl96mrZU7hKZInl2AT3+EsrL
         VCso7H1cJpkA4g9IwL7VEBYkyfWGL+AQqLEKTWO6Jly3bBqa31UoGxoweak/RvUyBA2V
         k6h3LfKvdGDIEpJpLinqZW2qhsF5CQxXkH2yR7ngjyw6ztnLXMcmxtPdCRx02AGaOmV/
         Cpv+nnu18l2Dmz5iSdHg5bLRPDffZLZkqHNe3Cdmg7iAXtnhj3xKYgCLZdG9xW1zlL5I
         3NPe/105ZiAXS8cZ+RqyIgq2xTliglHjPAnXJkcn92J2WocQgVEVTys3FYsKaXaWqcbq
         me4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781333918; x=1781938718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O65kp4uYeS0m80wrjHhLdSErrpFdma2VMG6AHvedRp8=;
        b=IGGTQ013ArYy40eB49ZZQMXbXpaXETb/yLcdD4740TtpoP36G0qLX6M6o+/CscbW4G
         WZiebYaArpTSRX8gYCfEOQtgjgpSvo4BTw9IonsvFdFkBSdWxfD1BFgpyv6RaBAd1D0+
         qNdqz92Zkz/+bYM0RDYgu3FZL2RaJjci/+KjwMdZPj4DECRSVendnguWTiyrg1kgeykQ
         vjfZRLuI4r9xaHXIGbok/uY1mB/kLc4KgvSXKbWmGl9V+xPY72maU5IY6GQocUu5wOVf
         +uFH9A9lfTlJKQ4onFIEAC/ACLA6xwQB5un4DT11q7cfW1602rQ7BuCJiV8zstjYWd+j
         Znhg==
X-Forwarded-Encrypted: i=1; AFNElJ+W0H1sxG4fyhSCi2F0B4ZeHvNc/kly+36YTclI0cY2QynYU8hnMRHVVl/IXJ9ZupWijlTo8MtlbKY5VOfh4rvY@lists.infradead.org
X-Gm-Message-State: AOJu0YwsXcQdvZHbXRJ7IS5BzVQ+Naf5adD+TPfWaSeQ9ohQpUwU03ZJ
	K7Giv3M2bsvNaARjHTX+70cblk0a8NmK6WZ7AnHZKP0khTJ8TKJuad7w
X-Gm-Gg: Acq92OFwSybZAq9QHg5HGymYI3hWilXvK8uYvE7g81ILbIo/rT0HWB+lZz7aRaCQ5ic
	gwpSxJhNuWDNpLcfjk23OVQ9rF4wLTWSwxVEWJxh5bCmtOLXgPd/Fj9A6xVi6kg0PE5mF9N/K4L
	VbkvZ5bA/cRG2Dou3ZUNkjqgYN1kHszGwc739Hvnsl8fV0KBWmlD4FVj7ftxBxisVlmKLG1Mn/L
	NHxVEbePYT5XM2wgjZBwN2py2BK9Xuyr3uB5koOoKdwgsUKGhRsaIYVGUy1u7Ypq5KenRWtuZxi
	I1nVFerFJKJH4WwEjalGxw0I+S28fsbl0LdDu699WHBJRh/bdtf85p9mjJK29uISw9PcD77HjB+
	foeDEdChMPlaogGaARn7bqi+T/Zz/v5JqKFStrcE1GIiA8Bl9Bda+tT0SzyZJXLyrG1XorkSQzJ
	YzwNtGxGyM0yPwJqq3jii0Ch15dJjJkiSn0ms7bg94NvlghZxGsTy5
X-Received: by 2002:a05:600c:5296:b0:492:1e7f:d426 with SMTP id 5b1f17b1804b1-4921e7fd54bmr38722125e9.2.1781333917619;
        Fri, 12 Jun 2026 23:58:37 -0700 (PDT)
Received: from debian.tailb81abf.ts.net ([2a01:e0a:104a:4d80:14c0:9448:1c38:77df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202e5cbasm42917705e9.2.2026.06.12.23.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 23:58:37 -0700 (PDT)
From: MidG971 <midgy971@gmail.com>
To: tomeu@tomeuvizoso.net,
	ogabbay@kernel.org,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ulf.hansson@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	xxm@rock-chips.com,
	chaoyi.chen@rock-chips.com,
	finley.xiao@rock-chips.com,
	diederik@cknow-tech.com,
	jonas@kwiboo.se,
	Midgy BALON <midgy971@gmail.com>
Subject: [RFC PATCH v4 5/9] accel: rocket: Keep the IOMMU domain attached across jobs
Date: Sat, 13 Jun 2026 09:01:12 +0200
Message-Id: <20260613070116.438906-6-midgy971@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260613070116.438906-1-midgy971@gmail.com>
References: <20260613070116.438906-1-midgy971@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_235839_668552_8672E697 
X-CRM114-Status: GOOD (  20.80  )
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

From: Midgy BALON <midgy971@gmail.com>

rocket attached the job's IOMMU domain in rocket_job_run() and
detached it again on every completion and reset. Each attach/detach
toggles the rk_iommu stall/force-reset/paging handshake, and on
RK3568 the NPU MMU is idle between jobs, so that handshake times out
and logs a burst of "stall/paging request timed out" errors for
every job.

Attach the per-context domain once and keep it: track the attached
domain in the core, swap it only when a job from a different context
runs, and detach it at core teardown. A reference on the attached
domain is held so it outlives the job that first attached it and is
released on swap/teardown.

Because a hardware reset (on job timeout) wipes the IOMMU page-table
base register, drop the attached domain after rocket_core_reset() so
the next job re-attaches and reprograms it. Also tear down the
scheduler before detaching the IOMMU in rocket_core_fini(), so an
in-flight job can no longer reach the domain being detached.

Signed-off-by: Midgy BALON <midgy971@gmail.com>
---
 drivers/accel/rocket/rocket_core.c | 14 +++++++++++-
 drivers/accel/rocket/rocket_core.h |  3 +++
 drivers/accel/rocket/rocket_job.c  | 35 +++++++++++++++++++++++++-----
 3 files changed, 46 insertions(+), 6 deletions(-)

diff --git a/drivers/accel/rocket/rocket_core.c b/drivers/accel/rocket/rocket_core.c
index 779e951596a15..6c128f585cff4 100644
--- a/drivers/accel/rocket/rocket_core.c
+++ b/drivers/accel/rocket/rocket_core.c
@@ -13,6 +13,7 @@
 #include <linux/reset.h>
 
 #include "rocket_core.h"
+#include "rocket_drv.h"
 #include "rocket_job.h"
 
 int rocket_core_init(struct rocket_core *core)
@@ -112,9 +113,20 @@ void rocket_core_fini(struct rocket_core *core)
 {
 	pm_runtime_dont_use_autosuspend(core->dev);
 	pm_runtime_disable(core->dev);
+
+	/*
+	 * Stop the scheduler before tearing down the IOMMU so an in-flight
+	 * job can no longer touch the (about to be detached) domain.
+	 */
+	rocket_job_fini(core);
+
+	if (core->attached_domain) {
+		iommu_detach_group(NULL, core->iommu_group);
+		rocket_iommu_domain_put(core->attached_domain);
+		core->attached_domain = NULL;
+	}
 	iommu_group_put(core->iommu_group);
 	core->iommu_group = NULL;
-	rocket_job_fini(core);
 }
 
 void rocket_core_reset(struct rocket_core *core)
diff --git a/drivers/accel/rocket/rocket_core.h b/drivers/accel/rocket/rocket_core.h
index 5a145ba8c5a92..78791ecb32e75 100644
--- a/drivers/accel/rocket/rocket_core.h
+++ b/drivers/accel/rocket/rocket_core.h
@@ -42,6 +42,8 @@ struct rocket_soc_data {
 #define rocket_core_writel(core, reg, value) \
 	writel(value, (core)->core_iomem + (REG_CORE_##reg) - REG_CORE_S_STATUS)
 
+struct rocket_iommu_domain;
+
 struct rocket_core {
 	struct device *dev;
 	struct rocket_device *rdev;
@@ -56,6 +58,7 @@ struct rocket_core {
 	struct reset_control_bulk_data resets[2];
 
 	struct iommu_group *iommu_group;
+	struct rocket_iommu_domain *attached_domain;
 
 	struct mutex job_lock;
 	struct rocket_job *in_flight_job;
diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
index e25234261536b..368b2ebead1b3 100644
--- a/drivers/accel/rocket/rocket_job.c
+++ b/drivers/accel/rocket/rocket_job.c
@@ -9,6 +9,7 @@
 #include <drm/rocket_accel.h>
 #include <linux/interrupt.h>
 #include <linux/iommu.h>
+#include <linux/kref.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 
@@ -314,9 +315,26 @@ static struct dma_fence *rocket_job_run(struct drm_sched_job *sched_job)
 	if (ret < 0)
 		return fence;
 
-	ret = iommu_attach_group(job->domain->domain, core->iommu_group);
-	if (ret < 0)
-		return fence;
+	/*
+	 * Attach the job's IOMMU domain only when it differs from the one
+	 * already attached. Re-attaching per job toggles the rk_iommu
+	 * stall/reset handshake on an idle NPU MMU, which is slow and
+	 * noisy; keep the domain attached across jobs instead.
+	 */
+	if (core->attached_domain != job->domain) {
+		if (core->attached_domain) {
+			iommu_detach_group(NULL, core->iommu_group);
+			rocket_iommu_domain_put(core->attached_domain);
+			core->attached_domain = NULL;
+		}
+
+		ret = iommu_attach_group(job->domain->domain, core->iommu_group);
+		if (ret < 0)
+			return fence;
+
+		kref_get(&job->domain->kref);
+		core->attached_domain = job->domain;
+	}
 
 	scoped_guard(mutex, &core->job_lock) {
 		core->in_flight_job = job;
@@ -340,7 +358,6 @@ static void rocket_job_handle_irq(struct rocket_core *core)
 				return;
 			}
 
-			iommu_detach_group(NULL, iommu_group_get(core->dev));
 			dma_fence_signal(core->in_flight_job->done_fence);
 			pm_runtime_put_autosuspend(core->dev);
 			core->in_flight_job = NULL;
@@ -376,7 +393,15 @@ rocket_reset(struct rocket_core *core, struct drm_sched_job *bad)
 	 */
 	rocket_core_reset(core);
 
-	iommu_detach_group(NULL, core->iommu_group);
+	/*
+	 * The reset wipes the IOMMU page-table base, so drop the attached
+	 * domain to force the next job to re-attach and reprogram it.
+	 */
+	if (core->attached_domain) {
+		iommu_detach_group(NULL, core->iommu_group);
+		rocket_iommu_domain_put(core->attached_domain);
+		core->attached_domain = NULL;
+	}
 
 	/* NPU has been reset, we can clear the reset pending bit. */
 	atomic_set(&core->reset.pending, 0);
-- 
2.39.5


