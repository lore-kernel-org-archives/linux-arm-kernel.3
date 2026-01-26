Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 491FBD1950F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 17:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LoiVdrsXj6/LhXbV24voKR3YFPwf3cZOmM4MkDJ5OHU=; b=0a7EkOYqiuXS3QJKx/TFOMy9Ip
	YhIXd4KWaFosdZhwp91s90EIC5BRdyNtbaojGKA4dx9We47C+BCOjiAZ35yNewTlBHbvIsXf8Wnhp
	XTYW8ir8yRIwCQfXZKqbbeRBT0wTcqadVBORzyst2buFzeXGAwCMkpdSrQe53mKyelLWOmlTOXaZX
	bsmhwUfuvbzwg5Zd9zrceFZ2MYA1UQ1aIU4d0F9uAzQvDpBlCldYO4TBNfHNiBC0LsCBKJhDnJnJ6
	eIoeOFQY7UKPOOHLNxzzZrxCPaWfmsKwyIG9b2y2JCICDtL1HR8XnvCisvWwHCABT5GQF/0L+qb5h
	sg2qYNPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQNH-0000000CyPX-0Xac;
	Mon, 26 Jan 2026 17:27:39 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQNE-0000000CyMP-3OBx;
	Mon, 26 Jan 2026 17:27:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LoiVdrsXj6/LhXbV24voKR3YFPwf3cZOmM4MkDJ5OHU=; b=HDTtH3jhKyYJlGG+4Kb1EKwy7G
	bDGfTSgTqJvN7wbeUelZNHng+GQEGsYhPLQhzG9ovr/L3Tya8OOUnpKYsxPJ1+WysVck/zWiNVSta
	e7O1AxOorJMOV8kRfZjPYoKHKOVhka+v/RA8xHXV7zaycX2IHnL1iDngdvZ770dWUBpnKKicwOoDl
	pNTxtwlf5/zLpID2SFv6sXGt9m6c5YLzuU0+tjarpWWTn+FO1UBCzX94hKl8qjGHko3C5whm0vTVY
	Ei7vfsoB8VR0ov6OXNnX5nEw9FxcuXDKa9wDrLV7gDMtVeLrSoQIRbY2PYj9kxgZEmeuqHiAQeEfG
	f9riuehg==;
Received: from [187.36.210.68] (helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1vkQN8-00A8mi-IL; Mon, 26 Jan 2026 18:27:30 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Mon, 26 Jan 2026 14:26:41 -0300
Subject: [PATCH v4 5/6] drm/v3d: Allocate all resources before enabling the
 clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260126-v3d-power-management-v4-5-caf2df16d4e2@igalia.com>
References: <20260126-v3d-power-management-v4-0-caf2df16d4e2@igalia.com>
In-Reply-To: <20260126-v3d-power-management-v4-0-caf2df16d4e2@igalia.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Stefan Wahren <wahrenst@gmx.net>, Maxime Ripard <mripard@kernel.org>, 
 Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Chema Casanova <jmcasanova@igalia.com>, Dom Cobley <popcornmix@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 kernel-dev@igalia.com, =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7515; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=L0XkPQdA78dfk8/GF2rlP8n6s+xJxXgKoUH0yfVpgug=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBpd6Pec02Gh/fFGJGxkh/aF1MRRFaQiZAWJwLP2
 73XtrsB3MyJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaXej3gAKCRA/8w6Kdoj6
 qvsRB/wNgR6riJhApi7tFXdwwp2F4rNgX3/r81h4wISp67a/5qRMuGAy+4t6z9viQ1Bb7jZA+Hl
 MwY36QR16rOmj1ZssTzocrXZrsG1a9912rx7+tkvdmDzFiSRvALTINY98RKTSBds1B4SbQ9VENX
 5ZS9U+TaDbyx5VKutv2uY9qR65nDSUF7hLFPnckXDS+GdPgzEoJYMCrVAPX709VDaoiumgmJoUK
 vIiAUE0mKyIZDrWD7k0Q95GkkpkCTXMqP+DrC1AuXZ6KclepPvEKGM8SXzbZ7nuPR6zsBQCopCu
 CDnxF3gTumIvHlJY93x7vtXKFA+2UKWFFy8Z31NmrAbK3aLa
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_092737_025444_5BB87221 
X-CRM114-Status: GOOD (  16.13  )
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

Move all resource allocation operations before actually enabling the
clock, as those operations don't require the GPU to be powered on.

This is a preparation for runtime PM support. The next commit will
move all code related to powering on and initiating the GPU into the
runtime PM resume callback and all resource allocation will happen
before resume().

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.c | 93 ++++++++++++++++++++++---------------------
 drivers/gpu/drm/v3d/v3d_drv.h |  1 +
 drivers/gpu/drm/v3d/v3d_gem.c | 18 ++++-----
 drivers/gpu/drm/v3d/v3d_irq.c | 15 +++----
 4 files changed, 62 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index 257f2fefbdb6f8736411de8965919f1728844a6a..592ef610d6a4bb7dfe64acf6f7283c947e9d2921 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -360,14 +360,50 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+	if (v3d->ver < V3D_GEN_41) {
+		ret = map_regs(v3d, &v3d->gca_regs, "gca");
+		if (ret)
+			return ret;
+	}
+
+	v3d->reset = devm_reset_control_get_optional_exclusive(dev, NULL);
+	if (IS_ERR(v3d->reset))
+		return dev_err_probe(dev, PTR_ERR(v3d->reset),
+				     "Failed to get reset control\n");
+
+	if (!v3d->reset) {
+		ret = map_regs(v3d, &v3d->bridge_regs, "bridge");
+		if (ret) {
+			dev_err(dev, "Failed to get bridge registers\n");
+			return ret;
+		}
+	}
+
 	v3d->clk = devm_clk_get_optional(dev, NULL);
 	if (IS_ERR(v3d->clk))
 		return dev_err_probe(dev, PTR_ERR(v3d->clk), "Failed to get V3D clock\n");
 
+	ret = v3d_irq_init(v3d);
+	if (ret)
+		return ret;
+
+	v3d_perfmon_init(v3d);
+
+	v3d->mmu_scratch = dma_alloc_wc(dev, 4096, &v3d->mmu_scratch_paddr,
+					GFP_KERNEL | __GFP_NOWARN | __GFP_ZERO);
+	if (!v3d->mmu_scratch) {
+		dev_err(dev, "Failed to allocate MMU scratch page\n");
+		return -ENOMEM;
+	}
+
+	ret = v3d_gem_init(drm);
+	if (ret)
+		goto dma_free;
+
 	ret = clk_prepare_enable(v3d->clk);
 	if (ret) {
 		dev_err(&pdev->dev, "Couldn't enable the V3D clock\n");
-		return ret;
+		goto gem_destroy;
 	}
 
 	v3d_idle_sms(v3d);
@@ -396,44 +432,9 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 	ident3 = V3D_READ(V3D_HUB_IDENT3);
 	v3d->rev = V3D_GET_FIELD(ident3, V3D_HUB_IDENT3_IPREV);
 
-	v3d_perfmon_init(v3d);
-
-	v3d->reset = devm_reset_control_get_optional_exclusive(dev, NULL);
-	if (IS_ERR(v3d->reset)) {
-		ret = dev_err_probe(dev, PTR_ERR(v3d->reset),
-				    "Failed to get reset control\n");
-		goto clk_disable;
-	}
-
-	if (!v3d->reset) {
-		ret = map_regs(v3d, &v3d->bridge_regs, "bridge");
-		if (ret) {
-			dev_err(dev, "Failed to get bridge registers\n");
-			goto clk_disable;
-		}
-	}
-
-	if (v3d->ver < V3D_GEN_41) {
-		ret = map_regs(v3d, &v3d->gca_regs, "gca");
-		if (ret)
-			goto clk_disable;
-	}
-
-	v3d->mmu_scratch = dma_alloc_wc(dev, 4096, &v3d->mmu_scratch_paddr,
-					GFP_KERNEL | __GFP_NOWARN | __GFP_ZERO);
-	if (!v3d->mmu_scratch) {
-		dev_err(dev, "Failed to allocate MMU scratch page\n");
-		ret = -ENOMEM;
-		goto clk_disable;
-	}
-
-	ret = v3d_gem_init(drm);
-	if (ret)
-		goto dma_free;
-
-	ret = v3d_irq_init(v3d);
-	if (ret)
-		goto gem_destroy;
+	v3d_init_hw_state(v3d);
+	v3d_mmu_set_page_table(v3d);
+	v3d_irq_enable(v3d);
 
 	ret = drm_dev_register(drm, 0);
 	if (ret)
@@ -449,12 +450,13 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 	drm_dev_unregister(drm);
 irq_disable:
 	v3d_irq_disable(v3d);
+clk_disable:
+	v3d_power_off_sms(v3d);
+	clk_disable_unprepare(v3d->clk);
 gem_destroy:
 	v3d_gem_destroy(drm);
 dma_free:
 	dma_free_wc(dev, 4096, v3d->mmu_scratch, v3d->mmu_scratch_paddr);
-clk_disable:
-	clk_disable_unprepare(v3d->clk);
 	return ret;
 }
 
@@ -468,14 +470,13 @@ static void v3d_platform_drm_remove(struct platform_device *pdev)
 
 	drm_dev_unregister(drm);
 
-	v3d_gem_destroy(drm);
-
-	dma_free_wc(v3d->drm.dev, 4096, v3d->mmu_scratch,
-		    v3d->mmu_scratch_paddr);
-
 	v3d_power_off_sms(v3d);
 
 	clk_disable_unprepare(v3d->clk);
+
+	v3d_gem_destroy(drm);
+
+	dma_free_wc(dev, 4096, v3d->mmu_scratch, v3d->mmu_scratch_paddr);
 }
 
 static struct platform_driver v3d_platform_driver = {
diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index 99a39329bb85b10aec990ea1c7ad2a780a6dad07..785d2e7e97fc579b0b85f4ff255b5e73c25aad4f 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -565,6 +565,7 @@ struct dma_fence *v3d_fence_create(struct v3d_dev *v3d, enum v3d_queue q);
 
 /* v3d_gem.c */
 extern bool super_pages;
+void v3d_init_hw_state(struct v3d_dev *v3d);
 int v3d_gem_init(struct drm_device *dev);
 void v3d_gem_destroy(struct drm_device *dev);
 void v3d_reset_sms(struct v3d_dev *v3d);
diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index 57965c0d6f6efea0019fb0b1a47addf2f586d138..dd4ac899a489fb7341815592114cc4f1652f35e8 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -36,13 +36,6 @@ v3d_init_core(struct v3d_dev *v3d, int core)
 	V3D_CORE_WRITE(core, V3D_CTL_L2TFLEND, ~0);
 }
 
-/* Sets invariant state for the HW. */
-static void
-v3d_init_hw_state(struct v3d_dev *v3d)
-{
-	v3d_init_core(v3d, 0);
-}
-
 static void
 v3d_idle_axi(struct v3d_dev *v3d, int core)
 {
@@ -259,6 +252,14 @@ v3d_invalidate_caches(struct v3d_dev *v3d)
 	v3d_invalidate_slices(v3d, 0);
 }
 
+/* Sets invariant state for the HW. */
+void
+v3d_init_hw_state(struct v3d_dev *v3d)
+{
+	v3d_init_core(v3d, 0);
+}
+
+
 static void
 v3d_huge_mnt_init(struct v3d_dev *v3d)
 {
@@ -325,9 +326,6 @@ v3d_gem_init(struct drm_device *dev)
 		return -ENOMEM;
 	}
 
-	v3d_init_hw_state(v3d);
-	v3d_mmu_set_page_table(v3d);
-
 	v3d_huge_mnt_init(v3d);
 
 	ret = v3d_sched_init(v3d);
diff --git a/drivers/gpu/drm/v3d/v3d_irq.c b/drivers/gpu/drm/v3d/v3d_irq.c
index 1249f6e64b979fe29cf2b9bfc43b39aa755f71ce..e33cdede7c746ef1e1d6b2a7922f4ced35164649 100644
--- a/drivers/gpu/drm/v3d/v3d_irq.c
+++ b/drivers/gpu/drm/v3d/v3d_irq.c
@@ -248,17 +248,10 @@ v3d_hub_irq(int irq, void *arg)
 int
 v3d_irq_init(struct v3d_dev *v3d)
 {
-	int irq, ret, core;
+	int irq, ret;
 
 	INIT_WORK(&v3d->overflow_mem_work, v3d_overflow_mem_work);
 
-	/* Clear any pending interrupts someone might have left around
-	 * for us.
-	 */
-	for (core = 0; core < v3d->cores; core++)
-		V3D_CORE_WRITE(core, V3D_CTL_INT_CLR, V3D_CORE_IRQS(v3d->ver));
-	V3D_WRITE(V3D_HUB_INT_CLR, V3D_HUB_IRQS(v3d->ver));
-
 	irq = platform_get_irq_optional(v3d_to_pdev(v3d), 1);
 	if (irq == -EPROBE_DEFER)
 		return irq;
@@ -296,7 +289,6 @@ v3d_irq_init(struct v3d_dev *v3d)
 			goto fail;
 	}
 
-	v3d_irq_enable(v3d);
 	return 0;
 
 fail:
@@ -310,6 +302,11 @@ v3d_irq_enable(struct v3d_dev *v3d)
 {
 	int core;
 
+	/* Clear any pending interrupts someone might have left around for us. */
+	for (core = 0; core < v3d->cores; core++)
+		V3D_CORE_WRITE(core, V3D_CTL_INT_CLR, V3D_CORE_IRQS(v3d->ver));
+	V3D_WRITE(V3D_HUB_INT_CLR, V3D_HUB_IRQS(v3d->ver));
+
 	/* Enable our set of interrupts, masking out any others. */
 	for (core = 0; core < v3d->cores; core++) {
 		V3D_CORE_WRITE(core, V3D_CTL_INT_MSK_SET, ~V3D_CORE_IRQS(v3d->ver));

-- 
2.52.0


