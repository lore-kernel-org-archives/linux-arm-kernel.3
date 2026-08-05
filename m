Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E5AEC55822
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 06:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m3LpU9XM1NAcrBNx9ILkY1W7rwajnCx/x7RLh3XAagk=; b=lTJS5DjlksAT5LV8DG48jd4zeO
	jyzUoiDeZrr0Odz9uQBzyPTIG9MstLCoLoa0owSTzE7Wwv3FJoE0dfZ/Bfw03YQU+q6NkrNhvAK6F
	skBuWuVtT+foV/Uj330lhPz475p9bMSL++rSiIwiaWs7MXuDPtMxYVgLHP3FFHyFWUAvfBhuVDkN7
	6c4cA+dJvaLYwdAI0hZWw7SHduaXrcvFA4TA7gIj9rLSjVlF36BV9IyXeO0Gs+IfKWWHFzsDh4GSC
	viKC3qq8Tz06DP2tSzC8BukxajI4IgaDRd9EIr6LjcyJdk3TQST+CPYjDIis/jQLXDTmKrWnVYM52
	Dt/r5ZFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrVHt-00000003KLW-293z;
	Wed, 05 Aug 2026 06:39:37 +0000
Received: from flow-a7-smtp.messagingengine.com ([103.168.172.142])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrVHp-00000003KIu-2hVk;
	Wed, 05 Aug 2026 06:39:36 +0000
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailflow.phl.internal (Postfix) with ESMTP id D10E613802B4;
	Wed,  5 Aug 2026 02:39:32 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 05 Aug 2026 02:39:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1785911972; x=
	1785915572; bh=m3LpU9XM1NAcrBNx9ILkY1W7rwajnCx/x7RLh3XAagk=; b=A
	pWXm1igmuxLAVMQYUHf26GQnS1PfnUpTqKCsgzByax6ljqhWM572CHGNf+0oaTXU
	hmlRvVtE7Bgv0EMxhHldm7IjVEWyK0nIHV2SAdqPcHx2v73mYhaIKJxuU9ecEVCZ
	GZdSryw6Wbny0Pyi/F6rjmJ8StQjzUdfW83/Iye20/2X3YLlx7dbZ8CThjpA4bn+
	mXk5CMK12nakNjzx97LGJn6m6S62uUYp0KZ1uTU66ztk3F8D6UmjuDXbRUkAtCMv
	N7N09fb4ZdYU1udHJdGM7yiqvJlpFp/znkjEmSfUNPz2CCIr4P8kLOY9aVNresF7
	hhThZizCZ//yJJtsPC6DA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1785911972; x=1785915572; bh=m
	3LpU9XM1NAcrBNx9ILkY1W7rwajnCx/x7RLh3XAagk=; b=emF9Nq/p6C3+G/Hkx
	0mCSTHUiavnMFixod8ZTAPeS6ZO/hzRX59GQQyFXxrsUdEkg1F5FpA4DZFIMCGxS
	Yy6VHxuY8lJJxJvcnh1CgH/ewgSXPPZZbG5n/0bKoqEYJSeGyVZ/gCbdG/1fqBXN
	f1TzDLt6Xvdp0cmcNVxDkSWW/+JK/uhw05kl4Zbvnr8bFAammY+fhBaAgj1ors+e
	bjEcIZnWm4FcfzlnblJWUM9x7liU6oylseJx61swHUmP2TrVR449lGbDa/0KYksa
	i/VW23Bz3swxGOhUB2McicI5qanXrc5LbCUW2RGyWBOXUZ/3QeZZiamZ56lh2sQ2
	uv43w==
X-ME-Sender: <xms:pNpyahyCedWuVgeUO_3q-OXOsPDa_HhRaZ8T7rscyeOyNdPlNkxD0A>
    <xme:pNpyalPVmxfx9toTedsFGtg__E0zscFSs8xbOr-PGwV3LqxYyU-K-0ziTa5X1H047
    EfnyC_SzUEQ_Uv3n-HoBxXmsUzsXJ42T49sFTrBZ2xxyhAyid1YKpI>
X-ME-Received: <xmr:pNpyaj2mQ_r69bWDIXzWjT-7OQsnNR-jObT4RDurzmR7MYItmVg79Cti1JUvGy186c1UZEPbyQ>
X-ME-Proxy-Cause: dmFkZTGXEDL04vcK2sDnKk1CmvKU/eZmnC/t9ja4KZoFmKHOCdBsKmXq25MbtfK3Z/feDx
    gqOrpGCep9R5Bgz3tQcnjrsQirYkze8tJuxPPRflm80YpbZ++jUZBCUs57zIffUj729f63
    dEDMo6xiiT/i5snVuBBlJb94jfjddPiipleSLEI67lNed4EM//QTtnrIVHxOn/PTf7Up+X
    PkSN+hf7QV5xXvQ0GMs3tfCYbfm3jHsaVNFu2CE/bROOE4H2ZAOEXcZbCLVXYkR/+oe++q
    siB2fOwbnTG33hR+OcfE0MUb9cavFe+MBMC+/N1A1Y9zwgQwsPopanh88MXFGqyMXaC8Nz
    ChfUao/VoTczLnVLOhx2o2i1u6jFYddQxZjF+7r347bE1SBxF9OlT+CINB8fLmkA10c5ni
    UV/fzbWPY1OEmcKSeQ2NOmhCB2E2loP66voeTN6tXjrlcm06UfoH1sUJzj01FeQoOvnBvd
    EblL00HnGUV1ilNxBryjuQ0+Oi2UswR3GtRpAdYsrxNxDAaGV+rASQia0BcH6yi5Whwpgu
    by63OJoZPZMnd3W2VRWQ1wMSTn4PN17Ym/ygAmurUXZojZGkYui3Gj7WziIv2AABTbw6pi
    t/QoO1qo9ljo4WzqT+ZO4QP28edAsUJ+eLXnLhSqo5CHlmaHKw72ejhag9xA
X-ME-Proxy: <xmx:pNpyatGmQO7N2WbJAHIcozlCRs4DKY3D5tJuDVUrAyIpJyiXIQ8JSw>
    <xmx:pNpyaqgf21x0Apjkkm37T6NiTBz4cBZYcmUsvKozA3eSZJp8Dn2CCg>
    <xmx:pNpyamd85kXgBVA6dyWCpVhr7CJYb46mTcOz2lF_RKEnexCVbeHJdw>
    <xmx:pNpyagyozCcJpezn-brv8Fv0tSL5rarQ-t5FKWa9xiytMIUEJwJheA>
    <xmx:pNpyavrZzpWbKAAXd5anST6HWwXGzX6zAVTou8lstU61yBA5VtoVUQn7>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Aug 2026 02:39:26 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	ulfh@kernel.org,
	p.zabel@pengutronix.de,
	ogabbay@kernel.org,
	zhangqing@rock-chips.com
Cc: royalnet026@gmail.com,
	alchark@flipper.net,
	chaoyi.chen@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>
Subject: [RFC PATCH v5 v5 6/8] accel/rocket: add RK3576 NPU (RKNN) support
Date: Wed,  5 Aug 2026 18:38:24 +1200
Message-ID: <20260805063826.95682-7-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805063826.95682-1-gahing@gahingwoo.com>
References: <20260805063826.95682-1-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_233933_833656_57043F4B 
X-CRM114-Status: GOOD (  29.88  )
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

The RK3576 carries the same RKNN block as the RK3588, with two cores
instead of three and a few platform differences:

 - the CBUF (convolution buffer) has its own clock domain, so the core
   needs six clocks rather than four;
 - the BIU reset moved into the power domain, leaving one reset here;
 - the NPU spans two power domains, and a device with more than one is
   skipped by the driver-core single-domain auto-attach, so the list has
   to be attached explicitly;
 - the DPU completion interrupt is armed exactly as on RK3588 but never
   reaches the GIC. The completion is visible in INTERRUPT_RAW_STATUS,
   so sample that from an hrtimer rather than wait for an interrupt that
   does not come. The interrupt stays armed, so if it ever does arrive
   the normal handler finalises the job first.

Select all of that from of_device_id match data so the RK3588 path keeps
its existing counts and behaviour unchanged.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
---
 drivers/accel/rocket/rocket_core.c   |  26 +++++-
 drivers/accel/rocket/rocket_core.h   |  20 ++++-
 drivers/accel/rocket/rocket_device.c |   4 +
 drivers/accel/rocket/rocket_drv.c    |  22 ++++-
 drivers/accel/rocket/rocket_job.c    | 121 ++++++++++++++++++++++++---
 5 files changed, 176 insertions(+), 17 deletions(-)

diff --git a/drivers/accel/rocket/rocket_core.c b/drivers/accel/rocket/rocket_core.c
index b3b2fa9ba..e08288c8c 100644
--- a/drivers/accel/rocket/rocket_core.c
+++ b/drivers/accel/rocket/rocket_core.c
@@ -8,6 +8,7 @@
 #include <linux/err.h>
 #include <linux/iommu.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 
@@ -21,14 +22,22 @@ int rocket_core_init(struct rocket_core *core)
 	u32 version;
 	int err = 0;
 
+	/* RK3576 moves the BIU reset into its power domain and takes only srst_a. */
 	core->resets[0].id = "srst_a";
 	core->resets[1].id = "srst_h";
-	err = devm_reset_control_bulk_get_exclusive(&pdev->dev, ARRAY_SIZE(core->resets),
+	err = devm_reset_control_bulk_get_exclusive(&pdev->dev, core->soc->num_resets,
 						    core->resets);
 	if (err)
 		return dev_err_probe(dev, err, "failed to get resets for core %d\n", core->index);
 
-	err = devm_clk_bulk_get(dev, ARRAY_SIZE(core->clks), core->clks);
+	core->clks[0].id = "aclk";
+	core->clks[1].id = "hclk";
+	core->clks[2].id = "npu";
+	core->clks[3].id = "pclk";
+	/* RK3576 clocks the CBUF separately; the compute path stalls without these. */
+	core->clks[4].id = "aclk_cbuf";
+	core->clks[5].id = "hclk_cbuf";
+	err = devm_clk_bulk_get(dev, core->soc->num_clks, core->clks);
 	if (err)
 		return dev_err_probe(dev, err, "failed to get clocks for core %d\n", core->index);
 
@@ -65,6 +74,19 @@ int rocket_core_init(struct rocket_core *core)
 		return err;
 	}
 
+	/*
+	 * RK3576 spans two power domains, and a multi-domain device is skipped
+	 * by the driver-core single-domain auto-attach, so attach the list here.
+	 */
+	if (core->soc->multi_power_domain) {
+		struct dev_pm_domain_list *pd_list;
+
+		err = devm_pm_domain_attach_list(dev, NULL, &pd_list);
+		if (err < 0)
+			return dev_err_probe(dev, err,
+					     "failed to attach NPU power domains\n");
+	}
+
 	pm_runtime_use_autosuspend(dev);
 
 	/*
diff --git a/drivers/accel/rocket/rocket_core.h b/drivers/accel/rocket/rocket_core.h
index f6d738285..205ff070d 100644
--- a/drivers/accel/rocket/rocket_core.h
+++ b/drivers/accel/rocket/rocket_core.h
@@ -6,6 +6,7 @@
 
 #include <drm/gpu_scheduler.h>
 #include <linux/clk.h>
+#include <linux/hrtimer.h>
 #include <linux/io.h>
 #include <linux/mutex_types.h>
 #include <linux/reset.h>
@@ -27,16 +28,25 @@
 #define rocket_core_writel(core, reg, value) \
 	writel(value, (core)->core_iomem + (REG_CORE_##reg) - REG_CORE_S_STATUS)
 
+/* Per-SoC differences, selected by the of_device_id match data. */
+struct rocket_soc_data {
+	unsigned int num_clks;		/* clk_bulk count: 4 base, 6 with CBUF */
+	unsigned int num_resets;	/* reset_bulk count: 2 base, 1 on RK3576 */
+	bool multi_power_domain;	/* device spans more than one PM domain */
+	bool poll_completion;		/* completion IRQ never reaches the GIC */
+};
+
 struct rocket_core {
 	struct device *dev;
 	struct rocket_device *rdev;
+	const struct rocket_soc_data *soc;
 	unsigned int index;
 
 	int irq;
 	void __iomem *pc_iomem;
 	void __iomem *cna_iomem;
 	void __iomem *core_iomem;
-	struct clk_bulk_data clks[4];
+	struct clk_bulk_data clks[6];
 	struct reset_control_bulk_data resets[2];
 
 	struct iommu_group *iommu_group;
@@ -52,6 +62,14 @@ struct rocket_core {
 		atomic_t pending;
 	} reset;
 
+	struct hrtimer poll_timer;
+	struct work_struct poll_work;
+	atomic_t poll_active;
+	unsigned int poll_ticks;
+	unsigned int poll_seq;
+	unsigned int poll_work_seq;
+	bool poll_dying;
+
 	struct drm_gpu_scheduler sched;
 	u64 fence_context;
 	u64 emit_seqno;
diff --git a/drivers/accel/rocket/rocket_device.c b/drivers/accel/rocket/rocket_device.c
index 46e6ee1e7..bfb00f967 100644
--- a/drivers/accel/rocket/rocket_device.c
+++ b/drivers/accel/rocket/rocket_device.c
@@ -31,6 +31,10 @@ struct rocket_device *rocket_device_init(struct platform_device *pdev,
 		if (of_device_is_available(core_node))
 			num_cores++;
 
+	for_each_compatible_node(core_node, NULL, "rockchip,rk3576-rknn-core")
+		if (of_device_is_available(core_node))
+			num_cores++;
+
 	rdev->cores = devm_kcalloc(dev, num_cores, sizeof(*rdev->cores), GFP_KERNEL);
 	if (!rdev->cores)
 		return ERR_PTR(-ENOMEM);
diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
index 8bbbce594..7f7dfa374 100644
--- a/drivers/accel/rocket/rocket_drv.c
+++ b/drivers/accel/rocket/rocket_drv.c
@@ -176,6 +176,7 @@ static int rocket_probe(struct platform_device *pdev)
 
 	rdev->cores[core].rdev = rdev;
 	rdev->cores[core].dev = &pdev->dev;
+	rdev->cores[core].soc = of_device_get_match_data(&pdev->dev);
 	rdev->cores[core].index = core;
 
 	rdev->num_cores++;
@@ -213,8 +214,23 @@ static void rocket_remove(struct platform_device *pdev)
 	}
 }
 
+static const struct rocket_soc_data rk3588_soc_data = {
+	.num_clks = 4,
+	.num_resets = 2,
+	.multi_power_domain = false,
+	.poll_completion = false,
+};
+
+static const struct rocket_soc_data rk3576_soc_data = {
+	.num_clks = 6,
+	.num_resets = 1,
+	.multi_power_domain = true,
+	.poll_completion = true,
+};
+
 static const struct of_device_id dt_match[] = {
-	{ .compatible = "rockchip,rk3588-rknn-core" },
+	{ .compatible = "rockchip,rk3588-rknn-core", .data = &rk3588_soc_data },
+	{ .compatible = "rockchip,rk3576-rknn-core", .data = &rk3576_soc_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dt_match);
@@ -240,7 +256,7 @@ static int rocket_device_runtime_resume(struct device *dev)
 	if (core < 0)
 		return -ENODEV;
 
-	err = clk_bulk_prepare_enable(ARRAY_SIZE(rdev->cores[core].clks), rdev->cores[core].clks);
+	err = clk_bulk_prepare_enable(rdev->cores[core].soc->num_clks, rdev->cores[core].clks);
 	if (err) {
 		dev_err(dev, "failed to enable (%d) clocks for core %d\n", err, core);
 		return err;
@@ -260,7 +276,7 @@ static int rocket_device_runtime_suspend(struct device *dev)
 	if (!rocket_job_is_idle(&rdev->cores[core]))
 		return -EBUSY;
 
-	clk_bulk_disable_unprepare(ARRAY_SIZE(rdev->cores[core].clks), rdev->cores[core].clks);
+	clk_bulk_disable_unprepare(rdev->cores[core].soc->num_clks, rdev->cores[core].clks);
 
 	return 0;
 }
diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
index bb77b6bf0..28845ac4e 100644
--- a/drivers/accel/rocket/rocket_job.c
+++ b/drivers/accel/rocket/rocket_job.c
@@ -7,6 +7,7 @@
 #include <drm/drm_file.h>
 #include <drm/drm_gem.h>
 #include <drm/rocket_accel.h>
+#include <linux/hrtimer.h>
 #include <linux/interrupt.h>
 #include <linux/overflow.h>
 #include <linux/iommu.h>
@@ -21,6 +22,15 @@
 
 #define JOB_TIMEOUT_MS 500
 
+/*
+ * RK3576 arms the same DPU completion as RK3588, but the interrupt never
+ * reaches the GIC. The completion itself is visible in INTERRUPT_RAW_STATUS,
+ * so sample that instead. The tick cap bounds jobs that never raise it at all,
+ * which is the same open problem as the wrong inference results.
+ */
+#define RK3576_POLL_INTERVAL_NS	1000000LL	/* 1 ms */
+#define RK3576_POLL_MAX_TICKS	8
+
 static struct rocket_job *
 to_rocket_job(struct drm_sched_job *sched_job)
 {
@@ -151,6 +161,14 @@ static void rocket_job_hw_submit(struct rocket_core *core, struct rocket_job *jo
 
 	rocket_pc_writel(core, OPERATION_ENABLE, PC_OPERATION_ENABLE_OP_EN(1));
 
+	if (core->soc->poll_completion) {
+		core->poll_ticks = 0;
+		core->poll_seq++;
+		atomic_set(&core->poll_active, 1);
+		hrtimer_start(&core->poll_timer, ns_to_ktime(RK3576_POLL_INTERVAL_NS),
+			      HRTIMER_MODE_REL);
+	}
+
 	dev_dbg(core->dev, "Submitted regcmd at 0x%llx to core %d", task->regcmd, core->index);
 }
 
@@ -341,25 +359,87 @@ static struct dma_fence *rocket_job_run(struct drm_sched_job *sched_job)
 	return ERR_PTR(ret);
 }
 
+static void rocket_job_handle_irq(struct rocket_core *core);
+
+static enum hrtimer_restart rocket_poll_timer_fn(struct hrtimer *timer)
+{
+	struct rocket_core *core = container_of(timer, struct rocket_core, poll_timer);
+	u32 raw;
+
+	if (!atomic_read(&core->poll_active))
+		return HRTIMER_NORESTART;
+
+	core->poll_work_seq = core->poll_seq;
+
+	raw = rocket_pc_readl(core, INTERRUPT_RAW_STATUS);
+	if ((raw & (PC_INTERRUPT_RAW_STATUS_DPU_0 | PC_INTERRUPT_RAW_STATUS_DPU_1)) ||
+	    ++core->poll_ticks >= RK3576_POLL_MAX_TICKS) {
+		atomic_set(&core->poll_active, 0);
+		schedule_work(&core->poll_work);
+		return HRTIMER_NORESTART;
+	}
+
+	hrtimer_forward_now(timer, ns_to_ktime(RK3576_POLL_INTERVAL_NS));
+	return HRTIMER_RESTART;
+}
+
+/* Start the job's next task, or retire it. Caller holds job_lock. */
+static void rocket_job_next_locked(struct rocket_core *core)
+{
+	lockdep_assert_held(&core->job_lock);
+
+	if (!core->in_flight_job)
+		return;
+
+	if (core->in_flight_job->next_task_idx < core->in_flight_job->task_count) {
+		rocket_job_hw_submit(core, core->in_flight_job);
+		return;
+	}
+
+	iommu_detach_group(NULL, iommu_group_get(core->dev));
+	dma_fence_signal(core->in_flight_job->done_fence);
+	pm_runtime_put_autosuspend(core->dev);
+	core->in_flight_job = NULL;
+}
+
+static void rocket_poll_work_fn(struct work_struct *work)
+{
+	struct rocket_core *core = container_of(work, struct rocket_core, poll_work);
+
+	pm_runtime_mark_last_busy(core->dev);
+
+	scoped_guard(mutex, &core->job_lock) {
+		/*
+		 * The interrupt can land while this work is queued, retire the job
+		 * and start the next task. poll_seq only moves under job_lock, in
+		 * hw_submit, so comparing it here says whether that happened. Doing
+		 * it outside the lock would leave the window open rather than close
+		 * it, and this work would then submit a task on top of a live one.
+		 */
+		if (READ_ONCE(core->poll_dying) || core->poll_work_seq != core->poll_seq)
+			return;
+
+		rocket_pc_writel(core, OPERATION_ENABLE, 0x0);
+		rocket_pc_writel(core, INTERRUPT_CLEAR, 0x1ffff);
+
+		rocket_job_next_locked(core);
+	}
+}
+
 static void rocket_job_handle_irq(struct rocket_core *core)
 {
+	if (core->soc->poll_completion) {
+		atomic_set(&core->poll_active, 0);
+		hrtimer_cancel(&core->poll_timer);
+	}
+
 	pm_runtime_mark_last_busy(core->dev);
 
 	rocket_pc_writel(core, OPERATION_ENABLE, 0x0);
 	rocket_pc_writel(core, INTERRUPT_CLEAR, 0x1ffff);
 
 	scoped_guard(mutex, &core->job_lock)
-		if (core->in_flight_job) {
-			if (core->in_flight_job->next_task_idx < core->in_flight_job->task_count) {
-				rocket_job_hw_submit(core, core->in_flight_job);
-				return;
-			}
-
-			iommu_detach_group(NULL, iommu_group_get(core->dev));
-			dma_fence_signal(core->in_flight_job->done_fence);
-			pm_runtime_put_autosuspend(core->dev);
-			core->in_flight_job = NULL;
-		}
+		rocket_job_next_locked(core);
 }
 
 static void
@@ -460,6 +540,10 @@ int rocket_job_init(struct rocket_core *core)
 	int ret;
 
 	INIT_WORK(&core->reset.work, rocket_reset_work);
+	INIT_WORK(&core->poll_work, rocket_poll_work_fn);
+	hrtimer_setup(&core->poll_timer, rocket_poll_timer_fn, CLOCK_MONOTONIC,
+		      HRTIMER_MODE_REL);
+	atomic_set(&core->poll_active, 0);
 	spin_lock_init(&core->fence_lock);
 	mutex_init(&core->job_lock);
 
@@ -501,8 +585,23 @@ int rocket_job_init(struct rocket_core *core)
 
 void rocket_job_fini(struct rocket_core *core)
 {
+	/*
+	 * Stop the poll from starting hardware work before tearing anything
+	 * down: it submits the next task, and drm_sched_fini() does not wait
+	 * for work already queued. Cancel after the scheduler is gone, so a
+	 * job running now cannot re-arm the timer behind the cancel.
+	 */
+	if (core->soc->poll_completion)
+		WRITE_ONCE(core->poll_dying, true);
+
 	drm_sched_fini(&core->sched);
 
+	if (core->soc->poll_completion) {
+		atomic_set(&core->poll_active, 0);
+		hrtimer_cancel(&core->poll_timer);
+		cancel_work_sync(&core->poll_work);
+	}
+
 	cancel_work_sync(&core->reset.work);
 	destroy_workqueue(core->reset.wq);
 }
-- 
2.43.0


