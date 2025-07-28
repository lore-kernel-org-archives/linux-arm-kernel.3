Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 488BCC87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 12:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3bjj3j9LZsSx6BhTYTPzGlkMZRi54ZlBdvSB/1VPiZ0=; b=GywJdgVJLzr2co0vE5ySpjbW6d
	mYY3jeq/fwegtOUCDTsiT87ipt4e0PPQ2BjUEmf/olYboc5hIODcbZT3n6SLxcVtAtAm6aBghJo4j
	4phmEnA59lUdh4ZizEXfRvNwuOirtINbXY4nPhfprcFHmZJ5Q4XSavM/elqASKk4PUvvlrDhQjzlT
	JLygWJnLorgdmX2DJGmy/TIf5qdmyix5rQL5XpZi4wY9UxFlSEHkBBzOysxkVo3FiFx/aWx5+Nlqz
	P8IFYMy0o9yzmJ8ymjURmMJYmS/bRxXQYkA3idIuoeH1jghi1WbJu3ywG9vgGacegNZIEUd6b00f3
	9Ksfd2wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugNFd-0000000ESH5-3jAd;
	Mon, 28 Jul 2025 12:46:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugN69-0000000ERX5-2Epf;
	Mon, 28 Jul 2025 12:36:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=3bjj3j9LZsSx6BhTYTPzGlkMZRi54ZlBdvSB/1VPiZ0=; b=GIPw8Nazn1RpvxvT5FDroRpCAh
	TxQpeO73IwFyU5Tjv3QVcjNN+M0yZRostMl0wjpn+GCGY70DNh7gr6coADcJbn7lHOhQzxTa8RT5k
	zUwHuuhk/FLqUBbMEKeruvefV2xt61HNQkcP3q6Y5Tp0iiOKMGM7q0NvJquYbEIH5HYRatu2ghaV0
	jXfcIfSU67r/I1m+/L4S3CC25Lukp6zXMgdR7LSlUB085lGSrS9qWhhpd/pzUCshMYz3uwvxGOZaM
	vCPPFTotAD8AxvmiRqLO/m9PGTZggmrXsLEaUW9Pwk1NU0yZpQkpXzdaCmTGfiFHg5Sif6HUqps2s
	xAIyQ6XQ==;
Received: from fanzine2.igalia.com ([213.97.179.56])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugN66-0000000CTZi-2Dep;
	Mon, 28 Jul 2025 12:36:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3bjj3j9LZsSx6BhTYTPzGlkMZRi54ZlBdvSB/1VPiZ0=; b=qL7VI4Bx++MI8FXF8obznziIj9
	lfEqCuIRhQsiJELQghWuXFQCXNW8NX2n9BFC59yO1lJRMTarAWwONhl65ikXWlX+S4qhRrGernvSm
	b6zsi7VmTqVOB1YyDOopI76GOAROOBRGOGy3TooH2BcMhPwf1386KWcjupwxlpNQPjnblyqDKC1iH
	gUkXzEotw4ZJQdulUqUBL8V/8f8jUHKXTVDUEfbEymG/8PNdOL0Zpl3Byw8qGeDYnAnCkUpW00zc3
	KK3HsNCfRsIwCzHvKIzZuiSfPwaOm0C+02gTAYAg70UpZfbajxrZl09/nKDGWjdQqEH+R47aHKCqY
	ZRtwu04A==;
Received: from [189.7.87.79] (helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1ugN5k-004u0J-Fb; Mon, 28 Jul 2025 14:36:32 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Mon, 28 Jul 2025 09:35:39 -0300
Subject: [PATCH 2/3] drm/v3d: Allocate all resources before enabling the
 clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250728-v3d-power-management-v1-2-780f922b1048@igalia.com>
References: <20250728-v3d-power-management-v1-0-780f922b1048@igalia.com>
In-Reply-To: <20250728-v3d-power-management-v1-0-780f922b1048@igalia.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Stefan Wahren <wahrenst@gmx.net>, Maxime Ripard <mripard@kernel.org>, 
 Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Dom Cobley <popcornmix@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 kernel-dev@igalia.com, =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6902; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=SZmQf4FE52jk4Z+ZXZaw18uDI+BDh6k7S1DD5fih1X4=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBoh26+vUTDJUcFw9hr4dpDYrd3vjkQCXa3sb/oS
 eaJhWLZ1ymJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaIduvgAKCRA/8w6Kdoj6
 qsC+B/0RPOeHm1u5sgSUBkcxc9a+pPjNFFp6To4SGBziUHFki/a5NpAENFVf5k6p+j9y/XuJqam
 PP0KFQ5m92ZS6Qg7VHJXuG0ZKgdDeRqKzNcV7FxQjPJ1cZPD1uIFrhy29d3RS9Z+mJWrt/r+Enj
 QZt7V5VgYc8ow+e7K5JFkKlwcFSOOpYDvJ7Vpw9tO8PccUkVx9m40ouFnxisKp4S8xUkZpYwq9+
 RopqhxaiJq1Y/mpbHTWG2bdwt5AGxMjthLs02rkTOZ5JTYaeZ2Yt2qBFHh17eQRw/eHhn2grPvS
 +7RQS6phg3oymwuXjNDTcNWepaBaBBgWIVm4Ykx+PlTo8vGN
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_133654_819031_1EF7BC4E 
X-CRM114-Status: GOOD (  14.12  )
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
clock, as those operation don't require the GPU to be powered on.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.c | 92 ++++++++++++++++++++++---------------------
 drivers/gpu/drm/v3d/v3d_drv.h |  3 +-
 drivers/gpu/drm/v3d/v3d_gem.c | 14 +++++--
 drivers/gpu/drm/v3d/v3d_irq.c | 15 +++----
 4 files changed, 66 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index 2def155ce496ec5f159f6bda9929aeaae141d1a6..6e6b830bee6587e4170fd64d354916766e59d2e5 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -347,14 +347,55 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+	if (v3d->ver < V3D_GEN_41) {
+		ret = map_regs(v3d, &v3d->gca_regs, "gca");
+		if (ret)
+			return ret;
+	}
+
+	v3d->reset = devm_reset_control_get_exclusive(dev, NULL);
+	if (IS_ERR(v3d->reset)) {
+		ret = PTR_ERR(v3d->reset);
+
+		if (ret == -EPROBE_DEFER)
+			return ret;
+
+		v3d->reset = NULL;
+		ret = map_regs(v3d, &v3d->bridge_regs, "bridge");
+		if (ret) {
+			dev_err(dev,
+				"Failed to get reset control or bridge regs\n");
+			return ret;
+		}
+	}
+
+	v3d->mmu_scratch = dma_alloc_wc(dev, 4096, &v3d->mmu_scratch_paddr,
+					GFP_KERNEL | __GFP_NOWARN | __GFP_ZERO);
+	if (!v3d->mmu_scratch) {
+		dev_err(dev, "Failed to allocate MMU scratch page\n");
+		return -ENOMEM;
+	}
+
+	ret = v3d_gem_allocate(drm);
+	if (ret)
+		goto dma_free;
+
+	ret = v3d_irq_init(v3d);
+	if (ret)
+		goto gem_destroy;
+
+	v3d_perfmon_init(v3d);
+
 	v3d->clk = devm_clk_get_optional(dev, NULL);
-	if (IS_ERR(v3d->clk))
-		return dev_err_probe(dev, PTR_ERR(v3d->clk), "Failed to get V3D clock\n");
+	if (IS_ERR(v3d->clk)) {
+		ret = dev_err_probe(dev, PTR_ERR(v3d->clk), "Failed to get V3D clock\n");
+		goto gem_destroy;
+	}
 
 	ret = clk_prepare_enable(v3d->clk);
 	if (ret) {
 		dev_err(&pdev->dev, "Couldn't enable the V3D clock\n");
-		return ret;
+		goto gem_destroy;
 	}
 
 	v3d_idle_sms(v3d);
@@ -381,45 +422,8 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 	ident3 = V3D_READ(V3D_HUB_IDENT3);
 	v3d->rev = V3D_GET_FIELD(ident3, V3D_HUB_IDENT3_IPREV);
 
-	v3d_perfmon_init(v3d);
-
-	v3d->reset = devm_reset_control_get_exclusive(dev, NULL);
-	if (IS_ERR(v3d->reset)) {
-		ret = PTR_ERR(v3d->reset);
-
-		if (ret == -EPROBE_DEFER)
-			goto clk_disable;
-
-		v3d->reset = NULL;
-		ret = map_regs(v3d, &v3d->bridge_regs, "bridge");
-		if (ret) {
-			dev_err(dev,
-				"Failed to get reset control or bridge regs\n");
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
+	v3d_gem_init(drm);
+	v3d_irq_enable(v3d);
 
 	ret = drm_dev_register(drm, 0);
 	if (ret)
@@ -435,12 +439,12 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 	drm_dev_unregister(drm);
 irq_disable:
 	v3d_irq_disable(v3d);
+clk_disable:
+	clk_disable_unprepare(v3d->clk);
 gem_destroy:
 	v3d_gem_destroy(drm);
 dma_free:
 	dma_free_wc(dev, 4096, v3d->mmu_scratch, v3d->mmu_scratch_paddr);
-clk_disable:
-	clk_disable_unprepare(v3d->clk);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index dabda7aaf00074d8de42dcdb345d5f3331ac13b2..aa33dcdc6a371393576dd8c20ab1dae920039a0c 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -565,7 +565,8 @@ extern const struct dma_fence_ops v3d_fence_ops;
 struct dma_fence *v3d_fence_create(struct v3d_dev *v3d, enum v3d_queue queue);
 
 /* v3d_gem.c */
-int v3d_gem_init(struct drm_device *dev);
+int v3d_gem_allocate(struct drm_device *dev);
+void v3d_gem_init(struct drm_device *dev);
 void v3d_gem_destroy(struct drm_device *dev);
 void v3d_reset_sms(struct v3d_dev *v3d);
 void v3d_reset(struct v3d_dev *v3d);
diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index d7d16da78db328f004d1d702731d1a1b5437a394..4626ee6e4ac4412c293a87e8a8cc5ec84376cf24 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -257,7 +257,7 @@ v3d_invalidate_caches(struct v3d_dev *v3d)
 }
 
 int
-v3d_gem_init(struct drm_device *dev)
+v3d_gem_allocate(struct drm_device *dev)
 {
 	struct v3d_dev *v3d = to_v3d_dev(dev);
 	u32 pt_size = 4096 * 1024;
@@ -302,9 +302,6 @@ v3d_gem_init(struct drm_device *dev)
 		return -ENOMEM;
 	}
 
-	v3d_init_hw_state(v3d);
-	v3d_mmu_set_page_table(v3d);
-
 	v3d_gemfs_init(v3d);
 
 	ret = v3d_sched_init(v3d);
@@ -318,6 +315,15 @@ v3d_gem_init(struct drm_device *dev)
 	return 0;
 }
 
+void
+v3d_gem_init(struct drm_device *dev)
+{
+	struct v3d_dev *v3d = to_v3d_dev(dev);
+
+	v3d_init_hw_state(v3d);
+	v3d_mmu_set_page_table(v3d);
+}
+
 void
 v3d_gem_destroy(struct drm_device *dev)
 {
diff --git a/drivers/gpu/drm/v3d/v3d_irq.c b/drivers/gpu/drm/v3d/v3d_irq.c
index 2cca5d3a26a22cf03d2c4e9ae0688ab57e0eedcd..89eb3034db4bddf878a88f17793b2ea08f4c37d5 100644
--- a/drivers/gpu/drm/v3d/v3d_irq.c
+++ b/drivers/gpu/drm/v3d/v3d_irq.c
@@ -260,17 +260,10 @@ v3d_hub_irq(int irq, void *arg)
 int
 v3d_irq_init(struct v3d_dev *v3d)
 {
-	int irq1, ret, core;
+	int irq1, ret;
 
 	INIT_WORK(&v3d->overflow_mem_work, v3d_overflow_mem_work);
 
-	/* Clear any pending interrupts someone might have left around
-	 * for us.
-	 */
-	for (core = 0; core < v3d->cores; core++)
-		V3D_CORE_WRITE(core, V3D_CTL_INT_CLR, V3D_CORE_IRQS(v3d->ver));
-	V3D_WRITE(V3D_HUB_INT_CLR, V3D_HUB_IRQS(v3d->ver));
-
 	irq1 = platform_get_irq_optional(v3d_to_pdev(v3d), 1);
 	if (irq1 == -EPROBE_DEFER)
 		return irq1;
@@ -297,7 +290,6 @@ v3d_irq_init(struct v3d_dev *v3d)
 			goto fail;
 	}
 
-	v3d_irq_enable(v3d);
 	return 0;
 
 fail:
@@ -311,6 +303,11 @@ v3d_irq_enable(struct v3d_dev *v3d)
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
2.50.0


