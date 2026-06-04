Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38DE4CD6E7B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 13:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=peByEg9qkw/NuaYmCEAUEFnpiWasS3prWUS+hf7e7ys=; b=UuAdFHkGdbBMHR6sl2oOMngEVt
	rgR/KQpnKoGsvV0od8qAxzRQk9JqpUHV1Wtj+4+qu4YGto1556sHBlLGTFWSW32Em5u8L4kGbSiaK
	diAbo9igZVT1PHeQd76h5zEq0zzB6j0zcepDWmW3B5gUKeF4TLyF6OIgUseZd1ZRDYcWjDycVOEQN
	wu+z7yaGMkMgJGcJbJ3LoU+uW431Auca6KAxQ+uAf4Tq4v3CEEDsxQnLrcaz6UVp27XYa8Iar0akh
	zBNutyBdopUBYRVFXabulMAtVYnMSLltkdY4kAkMvGrQLuEaHuc4KLuQQ0hKI9EftWBlvMXbp0kJ2
	aH3w+vaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV8VP-0000000GpoQ-3fQu;
	Thu, 04 Jun 2026 13:53:07 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV8VL-0000000Gpia-1ZWq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 13:53:04 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-45ef372c58aso457949f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 06:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780581181; x=1781185981; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=peByEg9qkw/NuaYmCEAUEFnpiWasS3prWUS+hf7e7ys=;
        b=RYrr0ULX1/Nh8lBb1DyM0bNfsYr6ovXBpJb5QmJf+QQoHRwY3mSJDJCPl7OHUvidNO
         YrJZltwtgLrf6CgvcQyplfYj77ZQqvAC+nXoOSahSYkX7Ug2oXGmb3U7/7Wa809wx4Y5
         kEYRzbZr2gSI4OWYg/WxmFIaW8NbKnt2doILeULhVu9bSR4ZYe4QSptnXJrV1dET9wOF
         G0nNf9LV4Nmi2MHj61PDolssK/1whoBnizI45Oy3y+ZKQ6gKXGDbEunTU8SSObO/vMmw
         rtwpH1JFADBN3Ba6fOdMaBdi3uLG9UT0ZkdVbrNkLmqM/8+08C4SIvwzyE4UvIHtTYib
         u1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780581181; x=1781185981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=peByEg9qkw/NuaYmCEAUEFnpiWasS3prWUS+hf7e7ys=;
        b=LiQr/8ThL4DUFiLlgzqQUP52/wJP1ud/CyvACWKv4KT2Ycp/Y837msdTQ71RvlAhKL
         P0wHIV/ldrBjXAGd6cBvz6ZqmsDrXkXDEVHHcv2nOkfUCDsTWVfePYU94QYIudggaHv2
         n3Nxe42OlZeed/aJ7+fX3YH2r5yu+UYHxCRo3TLEjt4is11MoPA7TfK9XAB0+ZNO8cEJ
         aB6IXs5XoFXieM0+nczhF82Iu6A6zZgFdhUOcmA8KhVWe2C7VKc0UXSBpo+vFxaqYsVI
         hnSWyrxuAO/RpxRivFYRhPjwnvnWxT9IiK88lx+Y8nTlwPXMCaLQ1L7zEmzyN3NkZra3
         336g==
X-Forwarded-Encrypted: i=1; AFNElJ+4m4ikPNF3MKBVTYbFPo3aSsca9/Fxsn1gKsaOHbstXjkz9ThW+98Vbx8r9trBwA1nuckNqkspgZfAEeQEdJD6@lists.infradead.org
X-Gm-Message-State: AOJu0YxyfF9NbTvAYz1hgo7kEESj92YdFLg4JcTp2paRkA6oVmYF2Lik
	68P9N4z/ZXPqmDBgAgfM4gmuX7tJrskmM4b8vTOs6GclCVVdLEp5vgq/
X-Gm-Gg: Acq92OGndlh1YZywYlgBj/UYGonyRHbp4yI2ZPZA+MKN8jSQC/A+d8W+No+JWwrUJDp
	RIDDDitQfEQxoCq3Tg4m8ii2H/zjQbrDgv6Ety3ozNyZQVPtDsXlwStR4zFzu2yKOXPc4dscJ/a
	tHZ8mkEscQ1hiLt8umrBit2x3CIvtIcChxNUnNbGtG4ZbvRUhZKGMhk+84gPmMEpqAtxuuiGK37
	l5e/SBQxa9wifFKPCMz+AWBARaZ+ys7G2QPt05zvibFXaLXSl2IRHNEMgx6//V3cBRHPzm+m1Ns
	qTGkfrgFTBaM4uP1++aY3EceynxIgD4TMOWsdNkyFhwLzfoweqnM99yYkDsaipatN0Z6+u8cT0M
	VIV7Y5ogbC2oBLM6NRF653KFR+oOfm+Ys5nXrFzi0j7+OzLaYoZtB83hQRTnZjjt4SQC6jh1yOo
	GPzYDPf3PdI6uR4PB4DoDTx1/IFsbKIq23KjKd1e2y8KCDewh6xjZjfLnu8d1bpGA=
X-Received: by 2002:a5d:44d2:0:b0:45e:9431:ee3c with SMTP id ffacd0b85a97d-46021792538mr9334388f8f.10.1780581181471;
        Thu, 04 Jun 2026 06:53:01 -0700 (PDT)
Received: from compiler-rock3b.tailb81abf.ts.net ([2a01:e0a:104a:4d80:be24:11ff:fe12:2776])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f0a43e9sm16661068f8f.0.2026.06.04.06.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 06:53:01 -0700 (PDT)
From: Midgy BALON <midgy971@gmail.com>
To: tomeu@tomeuvizoso.net,
	ogabbay@kernel.org,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org
Cc: robin.murphy@arm.com,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3 5/9] accel: rocket: Keep the IOMMU domain attached across jobs
Date: Thu,  4 Jun 2026 13:52:51 +0000
Message-Id: <20260604135255.62682-6-midgy971@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260604135255.62682-1-midgy971@gmail.com>
References: <20260604135255.62682-1-midgy971@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_065303_439657_5EE1361C 
X-CRM114-Status: GOOD (  19.54  )
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

Signed-off-by: Midgy BALON <midgy971@gmail.com>
---
 drivers/accel/rocket/rocket_core.c |  6 ++++++
 drivers/accel/rocket/rocket_core.h |  3 +++
 drivers/accel/rocket/rocket_job.c  | 27 +++++++++++++++++++++------
 3 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/drivers/accel/rocket/rocket_core.c b/drivers/accel/rocket/rocket_core.c
index a8de876365873..634f78dfe2887 100644
--- a/drivers/accel/rocket/rocket_core.c
+++ b/drivers/accel/rocket/rocket_core.c
@@ -13,6 +13,7 @@
 #include <linux/reset.h>
 
 #include "rocket_core.h"
+#include "rocket_drv.h"
 #include "rocket_job.h"
 
 int rocket_core_init(struct rocket_core *core)
@@ -112,6 +113,11 @@ void rocket_core_fini(struct rocket_core *core)
 {
 	pm_runtime_dont_use_autosuspend(core->dev);
 	pm_runtime_disable(core->dev);
+	if (core->attached_domain) {
+		iommu_detach_group(NULL, core->iommu_group);
+		rocket_iommu_domain_put(core->attached_domain);
+		core->attached_domain = NULL;
+	}
 	iommu_group_put(core->iommu_group);
 	core->iommu_group = NULL;
 	rocket_job_fini(core);
diff --git a/drivers/accel/rocket/rocket_core.h b/drivers/accel/rocket/rocket_core.h
index 66d138a8ed773..05a197a9c0113 100644
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
index e25234261536b..b248371be8a1e 100644
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
@@ -376,8 +393,6 @@ rocket_reset(struct rocket_core *core, struct drm_sched_job *bad)
 	 */
 	rocket_core_reset(core);
 
-	iommu_detach_group(NULL, core->iommu_group);
-
 	/* NPU has been reset, we can clear the reset pending bit. */
 	atomic_set(&core->reset.pending, 0);
 
-- 
2.39.5


