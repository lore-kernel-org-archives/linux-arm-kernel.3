Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 812A9C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 09:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K3TVGvBvu8Bs3GXwqrCW2MKXdH7U3MumAQSoP3rvwxE=; b=iwu+wCpGSe6OKd9ZGoPgpMfkBJ
	JwMGZjPN9vCy6dUy8zaCTyeOUtB1qzpbKPNYXcs/UnfxWTjqAE73xWmB0uuiJ0RlT/j92XQhRbM1j
	1M6gUf1bfdIILPNRnkeLUcUAqSQt5YIrCg7Qv1oc/mC2NWcxirkRWEVYbFvkHnWXFv6eV+tS0IPxF
	JqmVRnOC0MAue17oyoK+PSoTIhpcE8yoVx2bAYsbIbm/GKbF+Zq1zfW1tKlCRMISgJVHpc3qGGUsW
	WJZjWDO7Yl5mSiLiQMZqZkbgfK9ay8OSB6Hb0ZBjPnERaJQoQbvIL5KSkvX9WqhUfppoiks8GH4wg
	tqLirZYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Isw-00000007emo-2znJ;
	Wed, 23 Sep 2026 09:03:26 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ism-00000007ehh-0MSY;
	Wed, 23 Sep 2026 09:03:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790154194;
	bh=lwOsIlMSIMMhxLqlYday9G0StXwsB4a3fRxpMnydcCQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R1EC5uSHoYqOk5zNTXJ8bxduiHuBK+/d4+xOGnoy8giM/8T4YjSj+ZHNkRkUNC9HK
	 ZY/QHa9itCoVDvxd5K2SDyMC6KdGDYPzb36xsj7zFtmHViX3PzTE6qUQQjeWdtxrT4
	 Pzc1lXa4W/7e0URmfbAmywtR/EY+pfc7zmeJy3/OmjloSxEfy1/2XbmlpXJKr2ndKl
	 TPCFC5LvjezZc4rflRxUEQWST+dBdRhbJvCGqEjCTWUToeYABmohLg4aLudOVmuWL8
	 mYtQvQbT+g6uLSedXwhu2DK0iGQSJ9ao1rcjHP3QBTnzI+suSaG5zeUWmZ0CHgcgc7
	 1yTD4y2YzKGUw==
Received: from benjamin-XPS-13-9310 (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A73CC17E09ED;
	Wed, 23 Sep 2026 11:03:13 +0200 (CEST)
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
	festevam@gmail.com
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 2/2] media: verisilicon: Remove useless internal fields
Date: Wed, 23 Sep 2026 11:03:07 +0200
Message-ID: <20260923090307.49959-3-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923090307.49959-1-benjamin.gaignard@collabora.com>
References: <20260923090307.49959-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_020316_276942_8CD045BE 
X-CRM114-Status: GOOD (  14.31  )
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

No more variants are using multiple registers regions.
Remove the useless fields and simplify driver code.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/platform/verisilicon/hantro.h   |  8 ++------
 .../media/platform/verisilicon/hantro_drv.c   | 20 +++++--------------
 2 files changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
index ffc214ff3438b..fc4eb2ae01430 100644
--- a/drivers/media/platform/verisilicon/hantro.h
+++ b/drivers/media/platform/verisilicon/hantro.h
@@ -75,8 +75,6 @@ struct hantro_irq {
  * @num_irqs:			number of irqs in the array
  * @clk_names:			array of clock names
  * @num_clocks:			number of clocks in the array
- * @reg_names:			array of register range names
- * @num_regs:			number of register range names in the array
  * @double_buffer:		core needs double buffering
  * @legacy_regs:		core uses legacy register set
  * @late_postproc:		postproc must be set up at the end of the job
@@ -100,8 +98,6 @@ struct hantro_variant {
 	int num_irqs;
 	const char * const *clk_names;
 	int num_clocks;
-	const char * const *reg_names;
-	int num_regs;
 	unsigned int double_buffer : 1;
 	unsigned int legacy_regs : 1;
 	unsigned int late_postproc : 1;
@@ -187,7 +183,7 @@ hantro_vdev_to_func(struct video_device *vdev)
  *			dev_ macros.
  * @clocks:		Array of clock handles.
  * @resets:		Array of reset handles.
- * @reg_bases:		Mapped addresses of VPU registers.
+ * @reg_base:		Mapped address of VPU registers.
  * @enc_base:		Mapped address of VPU encoder register for convenience.
  * @dec_base:		Mapped address of VPU decoder register for convenience.
  * @ctrl_base:		Mapped address of VPU control block.
@@ -207,7 +203,7 @@ struct hantro_dev {
 	struct device *dev;
 	struct clk_bulk_data *clocks;
 	struct reset_control *resets;
-	void __iomem **reg_bases;
+	void __iomem *reg_base;
 	void __iomem *enc_base;
 	void __iomem *dec_base;
 	void __iomem *ctrl_base;
diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 70de47ddb023b..f418b04279856 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -1080,7 +1080,6 @@ static int hantro_probe(struct platform_device *pdev)
 {
 	const struct of_device_id *match;
 	struct hantro_dev *vpu;
-	int num_bases;
 	int i, ret;
 
 	vpu = devm_kzalloc(&pdev->dev, sizeof(*vpu), GFP_KERNEL);
@@ -1137,21 +1136,12 @@ static int hantro_probe(struct platform_device *pdev)
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


