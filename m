Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0263BC56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 06:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=98XGhqMmW9qcPjWTh5AzdFLwhLYnD/EGsefy8Lilht8=; b=VkBe/vrPMR98nX0LRuveTXLxxM
	JbLuOKQcOjd4oXbO/Sl+rxApFxgZfeXwkJi6YH2Y0i2Ki50tyFwMTMB2o5bMPHFHXiBY7jdVAjUZa
	XLoYz0FffXV6ztLxklRqRDRpjDRN904S+DVD2sdxDhDBGxDfzTnDri4L/9Jyal3mhx4F/x/bZMDR4
	wZh2hfbeWFBNaDqJR/SBEzyZyBNqk+KUvj+tHOje2nJZy3Xv3BVHf8/npRC6SangV+cuGeYtSQd6E
	U6rGVcs88MMI0t4K9NMghTdEmGcyT7L5iXTaiW2ZG/BPKNiwf5+eynbr9jrPV9SXQG/Ny4H0JaKk2
	eZ8smohw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrrhX-000000053oF-2KGI;
	Thu, 06 Aug 2026 06:35:35 +0000
Received: from flow-b6-smtp.messagingengine.com ([202.12.124.141])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrrhU-000000053lR-3UyQ;
	Thu, 06 Aug 2026 06:35:34 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.stl.internal (Postfix) with ESMTP id 6A6BF13000EE;
	Thu,  6 Aug 2026 02:35:31 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 06 Aug 2026 02:35:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1785998131; x=
	1786001731; bh=98XGhqMmW9qcPjWTh5AzdFLwhLYnD/EGsefy8Lilht8=; b=t
	b34z1i/t69W4hsWw799fFhSYp3YqJNAQ0VHH5xaDdo4B74DVf2QrllE7IwMwlMF+
	Obtgt1SveSGOPGjd0FY9/oyi8pAOElW4milsZMDD9sKyfjNS+3PfYNse8oqZi9yr
	vpXnZdyuvrPH12eD0FN6S4nxp3vjrfF+u+Lw+HPYmlPEe9o0dgbKvt1DaI6Pp/Nh
	I/TAuyIIkNqHxwtaTzVsT2vPBrRYTrejVE3/SUh50GXUWfxxm6pMlglc3Y6PyQMt
	yciLB0XCl1zBZbzYn+SNWALb8WBFBXN/tgHBFp7G/wi0QYJC4Uz1vbPYNeZzeVJf
	GA7ctapNvS5gRrmeK9BGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1785998131; x=1786001731; bh=9
	8XGhqMmW9qcPjWTh5AzdFLwhLYnD/EGsefy8Lilht8=; b=k2b1BPNZCqHuRnPgY
	+5mLW6L90V5oSZcbzkF4R5/EX+5SOb7bvpnL8X17Wan01A1V/62hLzhEtXHMTsOG
	1OVjtbwvAxeY3ywqYydnDfS9LGvhRtoLwAmgxgn3CIOZgA6XasJSA4cvDsHvIcII
	zaeb3tYMBd2DJcPJLnoXMHQMNxReuurTVO/WWphS1RdvUSNWFsfBgPOTiY3qVA0O
	c7cGgr3Rs/UW7iFD7TE+rmWx0mdAuBPRZeND5zWEBiyYzRMemuoapeYT39tv/vR8
	5guQiD5+C8iNjlI163MomRSQ6WwDSrb91u/G8fXR/PYiYC3IAe+pT7BW1LbZ+VGg
	LKJmg==
X-ME-Sender: <xms:Mit0aiKK0O4idBV33bsjVDYDADbRa8Nu314DchCq7x1EnCF2_o-zUQ>
    <xme:Mit0amSL3zbu1tiKeMiRmp7NgG7nXJgaG0wfIaCY4XB1QPMuM8EGvi_--cx_SVpQs
    KeWZQfp2tqdhUk723Pm2xn0mO1-8zkyBQKCuYelUo5BvMZgb4jZkrFG>
X-ME-Received: <xmr:Mit0auh95JRfoBzFr_-uMfHegZqoDp6_SjY_2O-88oRMZw5HZUNtqR_XhvtfhMuZNpHeukUmsQ>
X-ME-Proxy-Cause: dmFkZTGFJBmuMX6/OoMIUUbGTsyRPYhG/uy10uEHxPhEMy1PtqR444ErfelFkEd6NaLDUC
    EBUCOHXp08/9Un39jJxgI9b2esIOnp5rWanlB4YhinnucbzSevlRBcSlxqBRgtJmJAytlr
    8jytKxWFTXZF+UV2dS5D5bsKb56ES/qfa3QMJcUD0Qb7oa6fVNmmcPyHheuE9wg/2fDzZ7
    r6RjRj3Ca3Q7rZqID3DpbLJDs+lnzwJj3q0SM27msM26I/izlHpq2QekLfMQvsbdpgH44l
    1K9VPvcjZ1lkCA5hd6bzp0gHNELw7gmJmQS1Sr9fNc+XDlEyKd2OlO/Vi3aDTcob1YIXdi
    EyRVTpxvX89sCAscER/2IPXvIYS0e3W4Ov1A9UKT0Z7RC4c2vmF1fZGZUelgyh1PP+MFjX
    MdHwycRN6/zNXEGnti9oQU/jSTayJ0gfCvW7RY+TiExyP1WUtQeNIh0VTm7duD+Gp/7AjC
    FNvQ5qdNSv5bRtQEk8o+ttxOex0NeBibcYLfsOiwed2VFt1mwJXIFjdvSfokHMVOQaGcLn
    SlLcSO2/zJUHy0atLMsc+wB+7U4TQHLBVu3xvIm086H2kj7GoTQBbwjJxuxmchsR6pCVkr
    LW1MGUybizMnbKA8EAPvdjq7h1veRhmo9LuG4acBelmJDo5bsMHXW24Qq0HQ
X-ME-Proxy: <xmx:Mit0agunpINI9jgwAV8n5fww8JuzZKRNzVEmohRxiEgpwwVLJ8SyTg>
    <xmx:Mit0apiyUYAeHYu8gGQHdFMLetae1b6mdxHhppZN5lma0Bqy0EXVYA>
    <xmx:Mit0anGQzNaR7kxrfkSVkZ9vqtKT-XMZeJJ4uj0luvONNdkkucMdAQ>
    <xmx:Mit0aiJjd2kv-lCNUn7O1q8B36nRKRTjstQXJZYvmK3IfBBLcfI4Cg>
    <xmx:Myt0al9lrMG1VdsAzvirRZgXAp3AjUw3bum0bSEka67GJDj-GlXUNsAO>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Aug 2026 02:35:24 -0400 (EDT)
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
	diederik@cknow-tech.com,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>
Subject: [RFC PATCH v6 6/9] accel/rocket: select the per-core clock and reset counts from match data
Date: Thu,  6 Aug 2026 18:34:10 +1200
Message-ID: <20260806063413.350184-7-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806063413.350184-1-gahing@gahingwoo.com>
References: <20260806063413.350184-1-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_233532_914335_C685B648 
X-CRM114-Status: GOOD (  21.29  )
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

The RK3576 carries the same RKNN block with a different set of clocks and
resets, so the counts cannot stay compile-time constants. Add a soc_data
struct to the of_device_id match data and take the bulk counts from it.
RK3588 keeps four clocks and two resets, so nothing changes for it.

rocket_core_reset() is switched over as well. It is the same array, and
leaving it on ARRAY_SIZE() would walk entries that were never acquired
once a SoC asks for fewer.

While moving through this path, take the two register writes in
rocket_job_handle_irq() under job_lock. rocket_job_hw_submit() writes
OPERATION_ENABLE from inside the lock, so a completion handled outside it
can write the zero after that one and stop a task that has just started.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
---
 drivers/accel/rocket/rocket_core.c |  8 ++++----
 drivers/accel/rocket/rocket_core.h |  9 ++++++++-
 drivers/accel/rocket/rocket_drv.c  | 12 +++++++++---
 drivers/accel/rocket/rocket_job.c  | 12 +++++++++---
 4 files changed, 30 insertions(+), 11 deletions(-)

diff --git a/drivers/accel/rocket/rocket_core.c b/drivers/accel/rocket/rocket_core.c
index 5dd260bac..b202d1581 100644
--- a/drivers/accel/rocket/rocket_core.c
+++ b/drivers/accel/rocket/rocket_core.c
@@ -23,7 +23,7 @@ int rocket_core_init(struct rocket_core *core)
 
 	core->resets[0].id = "srst_a";
 	core->resets[1].id = "srst_h";
-	err = devm_reset_control_bulk_get_exclusive(&pdev->dev, ARRAY_SIZE(core->resets),
+	err = devm_reset_control_bulk_get_exclusive(&pdev->dev, core->soc->num_resets,
 						    core->resets);
 	if (err)
 		return dev_err_probe(dev, err, "failed to get resets for core %d\n", core->index);
@@ -32,7 +32,7 @@ int rocket_core_init(struct rocket_core *core)
 	core->clks[1].id = "hclk";
 	core->clks[2].id = "npu";
 	core->clks[3].id = "pclk";
-	err = devm_clk_bulk_get(dev, ARRAY_SIZE(core->clks), core->clks);
+	err = devm_clk_bulk_get(dev, core->soc->num_clks, core->clks);
 	if (err)
 		return dev_err_probe(dev, err, "failed to get clocks for core %d\n", core->index);
 
@@ -109,9 +109,9 @@ void rocket_core_fini(struct rocket_core *core)
 
 void rocket_core_reset(struct rocket_core *core)
 {
-	reset_control_bulk_assert(ARRAY_SIZE(core->resets), core->resets);
+	reset_control_bulk_assert(core->soc->num_resets, core->resets);
 
 	udelay(10);
 
-	reset_control_bulk_deassert(ARRAY_SIZE(core->resets), core->resets);
+	reset_control_bulk_deassert(core->soc->num_resets, core->resets);
 }
diff --git a/drivers/accel/rocket/rocket_core.h b/drivers/accel/rocket/rocket_core.h
index f6d738285..0f424bb86 100644
--- a/drivers/accel/rocket/rocket_core.h
+++ b/drivers/accel/rocket/rocket_core.h
@@ -27,16 +27,23 @@
 #define rocket_core_writel(core, reg, value) \
 	writel(value, (core)->core_iomem + (REG_CORE_##reg) - REG_CORE_S_STATUS)
 
+/* Per-SoC differences, selected by the of_device_id match data. */
+struct rocket_soc_data {
+	unsigned int num_clks;		/* clk_bulk count */
+	unsigned int num_resets;	/* reset_bulk count */
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
diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
index 8bbbce594..6e7dc91c5 100644
--- a/drivers/accel/rocket/rocket_drv.c
+++ b/drivers/accel/rocket/rocket_drv.c
@@ -176,6 +176,7 @@ static int rocket_probe(struct platform_device *pdev)
 
 	rdev->cores[core].rdev = rdev;
 	rdev->cores[core].dev = &pdev->dev;
+	rdev->cores[core].soc = of_device_get_match_data(&pdev->dev);
 	rdev->cores[core].index = core;
 
 	rdev->num_cores++;
@@ -213,8 +214,13 @@ static void rocket_remove(struct platform_device *pdev)
 	}
 }
 
+static const struct rocket_soc_data rk3588_soc_data = {
+	.num_clks = 4,
+	.num_resets = 2,
+};
+
 static const struct of_device_id dt_match[] = {
-	{ .compatible = "rockchip,rk3588-rknn-core" },
+	{ .compatible = "rockchip,rk3588-rknn-core", .data = &rk3588_soc_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dt_match);
@@ -240,7 +246,7 @@ static int rocket_device_runtime_resume(struct device *dev)
 	if (core < 0)
 		return -ENODEV;
 
-	err = clk_bulk_prepare_enable(ARRAY_SIZE(rdev->cores[core].clks), rdev->cores[core].clks);
+	err = clk_bulk_prepare_enable(rdev->cores[core].soc->num_clks, rdev->cores[core].clks);
 	if (err) {
 		dev_err(dev, "failed to enable (%d) clocks for core %d\n", err, core);
 		return err;
@@ -260,7 +266,7 @@ static int rocket_device_runtime_suspend(struct device *dev)
 	if (!rocket_job_is_idle(&rdev->cores[core]))
 		return -EBUSY;
 
-	clk_bulk_disable_unprepare(ARRAY_SIZE(rdev->cores[core].clks), rdev->cores[core].clks);
+	clk_bulk_disable_unprepare(rdev->cores[core].soc->num_clks, rdev->cores[core].clks);
 
 	return 0;
 }
diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
index bb77b6bf0..aa26e2977 100644
--- a/drivers/accel/rocket/rocket_job.c
+++ b/drivers/accel/rocket/rocket_job.c
@@ -345,10 +345,15 @@ static void rocket_job_handle_irq(struct rocket_core *core)
 {
 	pm_runtime_mark_last_busy(core->dev);
 
-	rocket_pc_writel(core, OPERATION_ENABLE, 0x0);
-	rocket_pc_writel(core, INTERRUPT_CLEAR, 0x1ffff);
+	scoped_guard(mutex, &core->job_lock) {
+		/*
+		 * Stopping the block belongs under the lock. hw_submit() writes
+		 * OPERATION_ENABLE too, and outside the lock this zero can land
+		 * after that one and kill a task that has only just started.
+		 */
+		rocket_pc_writel(core, OPERATION_ENABLE, 0x0);
+		rocket_pc_writel(core, INTERRUPT_CLEAR, 0x1ffff);
 
-	scoped_guard(mutex, &core->job_lock)
 		if (core->in_flight_job) {
 			if (core->in_flight_job->next_task_idx < core->in_flight_job->task_count) {
 				rocket_job_hw_submit(core, core->in_flight_job);
@@ -360,6 +365,7 @@ static void rocket_job_handle_irq(struct rocket_core *core)
 			pm_runtime_put_autosuspend(core->dev);
 			core->in_flight_job = NULL;
 		}
+	}
 }
 
 static void
-- 
2.43.0


