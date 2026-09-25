Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA2FC98328
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 08:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+PV1z3B6tHwI77KKAjdigcHKMHGU+Cgsl/y2z7ABHuc=; b=fJ3r9n/nWPte4eSI4pUHhdyRlc
	uj+ybI3cJsgmQDH78DEfLFgjwBL8TFyykDmXHFLXQ8BSUTUQx2rfoA829VDxjQQwjIX202ejwAl0T
	CO+QDL0i6Ygum+1KNwMwPOZA2qzSinMvF8gnYe1WkRSthPkD3vPJmDBf4r7lHpsou/myHJlAEtxLC
	n93rRA3FL0TILTNyB394WDDoM5X1Shmdls/C8qJ3OWMUeEu0YJ+g83JvdOdAqjPRjiQUra/rLl90s
	GVT0R++DmodW7hM4WEduV1Ym355luEET3rNHafZCcfqK3Oha4P3DeSzvP1vblj+c6b6P4NHBiqu9o
	6beFnusQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA1f5-0000000CwLT-2poj;
	Fri, 25 Sep 2026 08:52:07 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA1f0-0000000CwHo-1wQD;
	Fri, 25 Sep 2026 08:52:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790326319;
	bh=ZuPNXX1+qsZvk0iXEuJy1uQgtAKbJEJY89mQB5qbWx4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C5IBom2Y0kfp1WZ/DVyK+oiY9Nxi9oAwok6aU0MB8ZP64JKQy1swbBOp82BPe4NeI
	 yqOCGZ62a2E8nToK8USJ8A1E4N5r5FcRAwWHFgFHijp5riUL27utzhrtce0MeCMnOP
	 5g69/ZMc/osXM/gsMqek5ejtDOaiXhM9Xtx0GEWudKF6KNsfRbBPqteo+ASxt7B2Tw
	 TbSRB8poZKfiV3L4kvVmAzeU7vdt4hMLmb7pR/HJFkI7GMMLFLpfnlMjU+nuBW7Q7u
	 XeJvfSeFxOdZcCDoSTm0DjTJ16rJcpejp+ICWeVdCTcy9bbjVmtNsK7vMyZ+wIfI9N
	 Cultti6EWu/Zg==
Received: from benjamin-XPS-13-9310 (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3DA5917E0B59;
	Fri, 25 Sep 2026 10:51:59 +0200 (CEST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	benjamin.gaignard@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	conor@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v4 3/3] media: verisilicon: Remove useless internal fields
Date: Fri, 25 Sep 2026 10:51:52 +0200
Message-ID: <20260925085152.41852-4-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925085152.41852-1-benjamin.gaignard@collabora.com>
References: <20260925085152.41852-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_015202_655423_33A074B5 
X-CRM114-Status: GOOD (  14.79  )
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

No more variants are using multiple registers regions so rename
reg_bases to reg_base.
Remove the useless fields and simplify driver code.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
changes in v4:
- rework commits messages
- add r-b tag

 drivers/media/platform/verisilicon/hantro.h   |  9 ++-------
 .../media/platform/verisilicon/hantro_drv.c   | 20 +++++--------------
 2 files changed, 7 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
index 0353de154a1e..ca03bc690fbf 100644
--- a/drivers/media/platform/verisilicon/hantro.h
+++ b/drivers/media/platform/verisilicon/hantro.h
@@ -72,8 +72,6 @@ struct hantro_irq {
  * @num_irqs:			number of irqs in the array
  * @clk_names:			array of clock names
  * @num_clocks:			number of clocks in the array
- * @reg_names:			array of register range names
- * @num_regs:			number of register range names in the array
  * @double_buffer:		core needs double buffering
  * @legacy_regs:		core uses legacy register set
  * @late_postproc:		postproc must be set up at the end of the job
@@ -97,8 +95,6 @@ struct hantro_variant {
 	int num_irqs;
 	const char * const *clk_names;
 	int num_clocks;
-	const char * const *reg_names;
-	int num_regs;
 	unsigned int double_buffer : 1;
 	unsigned int legacy_regs : 1;
 	unsigned int late_postproc : 1;
@@ -184,7 +180,7 @@ hantro_vdev_to_func(struct video_device *vdev)
  *			dev_ macros.
  * @clocks:		Array of clock handles.
  * @resets:		Array of reset handles.
- * @reg_bases:		Mapped addresses of VPU registers.
+ * @reg_base:		Mapped address of VPU registers.
  * @enc_base:		Mapped address of VPU encoder register for convenience.
  * @dec_base:		Mapped address of VPU decoder register for convenience.
  * @ctrl_base:		Mapped address of VPU control block.
@@ -204,10 +200,9 @@ struct hantro_dev {
 	struct device *dev;
 	struct clk_bulk_data *clocks;
 	struct reset_control *resets;
-	void __iomem **reg_bases;
+	void __iomem *reg_base;
 	void __iomem *enc_base;
 	void __iomem *dec_base;
-	void __iomem *ctrl_base;
 
 	struct mutex vpu_mutex;	/* video_device lock */
 	spinlock_t irqlock;
diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 12c804dcc669..6e3a24156a69 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -1080,7 +1080,6 @@ static int hantro_probe(struct platform_device *pdev)
 {
 	const struct of_device_id *match;
 	struct hantro_dev *vpu;
-	int num_bases;
 	int i, ret;
 
 	vpu = devm_kzalloc(&pdev->dev, sizeof(*vpu), GFP_KERNEL);
@@ -1128,21 +1127,12 @@ static int hantro_probe(struct platform_device *pdev)
 	if (IS_ERR(vpu->resets))
 		return PTR_ERR(vpu->resets);
 
-	num_bases = vpu->variant->num_regs ?: 1;
-	vpu->reg_bases = devm_kcalloc(&pdev->dev, num_bases,
-				      sizeof(*vpu->reg_bases), GFP_KERNEL);
-	if (!vpu->reg_bases)
-		return -ENOMEM;
+	vpu->reg_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(vpu->reg_base))
+		return PTR_ERR(vpu->reg_base);
 
-	for (i = 0; i < num_bases; i++) {
-		vpu->reg_bases[i] = vpu->variant->reg_names ?
-		      devm_platform_ioremap_resource_byname(pdev, vpu->variant->reg_names[i]) :
-		      devm_platform_ioremap_resource(pdev, 0);
-		if (IS_ERR(vpu->reg_bases[i]))
-			return PTR_ERR(vpu->reg_bases[i]);
-	}
-	vpu->enc_base = vpu->reg_bases[0] + vpu->variant->enc_offset;
-	vpu->dec_base = vpu->reg_bases[0] + vpu->variant->dec_offset;
+	vpu->enc_base = vpu->reg_base + vpu->variant->enc_offset;
+	vpu->dec_base = vpu->reg_base + vpu->variant->dec_offset;
 
 	/**
 	 * TODO: Eventually allow taking advantage of full 64-bit address space.
-- 
2.53.0


