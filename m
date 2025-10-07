Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04619CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 08:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OVvE3/Cr0ezAo6Og+AUjB6eYSmD6CY3zv7ThtIZhpUg=; b=HUOSnpdAWIx+dZx2qm6sqZHEAV
	Fv9heGA6k/k65warKzTmco7LSRdmECMuSF5Ib9BFUfel6xlYhnCdaJpzyXGuosO/GdDomw7oEE7Ws
	sNHXhI+XZHkvtphqOcLanWRnlaAWBOjzVPGT0BRiT/vsvOCVP/PWXI7btjEv6wpU9IxWtjtwryPcs
	HcAwg6OC+GpTJ7rk7Vx80m0NPtqksF7cla3Vi0KmbGiJI0VtgcLJuiAxGkNrEfIhUe9T6dcWSyJRi
	31Koo9fLqvtDoVhwrMgAnEBntlpl8gViaGYdE9Mnfa/GbTRxEOlox/Rwj2vvAZLlU5Z3T41IgLJ+J
	q2tcHa7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v638J-00000001Yrx-02L9;
	Tue, 07 Oct 2025 08:33:19 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v637y-00000001YQd-2XBw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 08:33:00 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1v637w-0002Hb-U9; Tue, 07 Oct 2025 10:32:57 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Tue, 07 Oct 2025 10:32:04 +0200
Subject: [PATCH 11/16] media: rockchip: rga: add iommu restore function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251007-spu-rga3-v1-11-36ad85570402@pengutronix.de>
References: <20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de>
In-Reply-To: <20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_013258_719113_223AD588 
X-CRM114-Status: GOOD (  15.89  )
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

Add an iommu restore function in preparation for the rga3 addition.
This is necessary for a soft reset, as the rga3 will also reset
it's iommu paging table to 0 and disable paging.

The empty domain attach/detach to restore the iommu is copied
from the rkvdec driver.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga.c | 24 ++++++++++++++++++++++++
 drivers/media/platform/rockchip/rga/rga.h |  7 +++++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index cd4da01645611e5fb51ed94e09b5f1463dad72c5..0a725841b0cfa41bbc5b861b8f5ceac2452fc2b5 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -9,6 +9,7 @@
 #include <linux/delay.h>
 #include <linux/fs.h>
 #include <linux/interrupt.h>
+#include <linux/iommu.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/pm_runtime.h>
@@ -560,6 +561,19 @@ static const struct video_device rga_videodev = {
 	.device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING,
 };
 
+void rga_iommu_restore(struct rockchip_rga *rga)
+{
+	if (rga->empty_domain) {
+		/*
+		 * To rewrite mapping into the attached IOMMU core, attach a new empty domain that
+		 * will program an empty table, then detach it to restore the default domain and
+		 * all cached mappings.
+		 */
+		iommu_attach_device(rga->empty_domain, rga->dev);
+		iommu_detach_device(rga->empty_domain, rga->dev);
+	}
+}
+
 static int rga_parse_dt(struct rockchip_rga *rga)
 {
 	struct reset_control *core_rst, *axi_rst, *ahb_rst;
@@ -657,6 +671,13 @@ static int rga_probe(struct platform_device *pdev)
 		goto err_put_clk;
 	}
 
+	if (iommu_get_domain_for_dev(rga->dev)) {
+		rga->empty_domain = iommu_paging_domain_alloc(rga->dev);
+
+		if (!rga->empty_domain)
+			dev_warn(rga->dev, "cannot alloc new empty domain\n");
+	}
+
 	ret = v4l2_device_register(&pdev->dev, &rga->v4l2_dev);
 	if (ret)
 		goto err_put_clk;
@@ -741,6 +762,9 @@ static void rga_remove(struct platform_device *pdev)
 	v4l2_device_unregister(&rga->v4l2_dev);
 
 	pm_runtime_disable(rga->dev);
+
+	if (rga->empty_domain)
+		iommu_domain_free(rga->empty_domain);
 }
 
 static int __maybe_unused rga_runtime_suspend(struct device *dev)
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index fc4805ba4e8ef7fb311f780a198ba6ba4d3aff17..e19c4c82aca5ae2056f52d525138093fbbb81af8 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -75,6 +75,7 @@ struct rockchip_rga {
 	void __iomem *regs;
 	struct clk_bulk_data clks[3];
 	struct rockchip_rga_version version;
+	struct iommu_domain *empty_domain;
 
 	/* vfd lock */
 	struct mutex mutex;
@@ -114,6 +115,12 @@ static inline struct rga_vb_buffer *vb_to_rga(struct vb2_v4l2_buffer *vb)
 
 struct rga_frame *rga_get_frame(struct rga_ctx *ctx, enum v4l2_buf_type type);
 
+/*
+ * This should be called in an interrupt handler to make sure no memory
+ * is mapped through the IOMMU while the empty domain is attached.
+ */
+void rga_iommu_restore(struct rockchip_rga *rga);
+
 /* RGA Buffers Manage */
 extern const struct vb2_ops rga_qops;
 

-- 
2.51.0


