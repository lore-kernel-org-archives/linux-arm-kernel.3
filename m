Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C6F8C88E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 03:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N9blcEeeVVkCrQCOIeYD/reFetuknNAW0ll7RH3TTDQ=; b=tFunCIH31RnsmHmpfhUVoEE2FJ
	f/1E3F+97vKantRSd1cP7TYmjP+hTa+8lDzgaM4hJZSB1Vnh7+juAPiuTTPXIDKGsfygjek9ziriS
	ie0XcWi8EBe+M76W2D/iFEi7mhbWSkuW5wJj52LeeeypOhTI0JPkXHWRDHk4j4S42BMBKeVpYIJaW
	eDj+aQvs9PccuFVj/kn6rT85E6GUWfHXQKpjqDZpHHifAP5s2seEe7kRSbFPdDmzrA7sF/VLQD1N2
	kVSYz6iZHnRHOsq4O7us8n+B61aVlwGHSa25uMVhD1NuoT63OU+17rz0S4cFVPk2tQgTuZN+4Qzny
	0/S23h9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4rwB-0000000FlOW-3lJk;
	Fri, 11 Sep 2026 03:28:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4rwA-0000000FlN6-122E;
	Fri, 11 Sep 2026 03:28:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 04FBF4032F;
	Fri, 11 Sep 2026 03:28:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA27D1F000FF;
	Fri, 11 Sep 2026 03:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789097305;
	bh=N9blcEeeVVkCrQCOIeYD/reFetuknNAW0ll7RH3TTDQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BDucrousMH47zXE7txEPhdHKMX0Z1S+7ZumDxyQpMjfxMhR3VWmQRhCVYnON635E3
	 kTXz4Kdfk5Z/qlq3W5Bd89aBCejdW8bFVYwRyOYhVHmsY5vtJVcTjh+O9lSfCb1M6H
	 ZW0DQqnqHpDTfGEOv/G/8sDYjddf8RMwabHcqrg+rz/knPuvuB9P3d9XKLNH8OJ7Ny
	 paHfHEIYVEGvBwb0XkxX1MhCGGT4rqrVRG0ghcOr+erRQ9QQzNRbaHgABOz0VIPDpU
	 Z891QUVhOryVPoWAtdd9Zr0nFSmTckFrlG89rG451g82JX8GqW4oTXBRWcFj38w/YE
	 9FRJgDp+rITOQ==
From: "GUO Ren (XuanTie)" <guoren@kernel.org>
Date: Fri, 11 Sep 2026 03:27:13 +0000
Subject: [PATCH v2 5/6] irqchip/imsic: Use IPI_MAX instead of IMSIC_NR_IPI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-ipi_max-v2-5-a77826ff189e@kernel.org>
References: <20260911-ipi_max-v2-0-a77826ff189e@kernel.org>
In-Reply-To: <20260911-ipi_max-v2-0-a77826ff189e@kernel.org>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Anup Patel <anup@brainfault.org>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
 Houlong Wei <houlong.wei@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, "GUO Ren (XuanTie)" <guoren@kernel.org>
X-Mailer: b4 0.16.0
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

IMSIC was defining its own IMSIC_NR_IPI (= 8) which happened to match
the architecture's IPI_MAX. Now that IPI_MAX is exported from riscv
asm/smp.h, use the architecture constant and drop the private define.

This keeps the number of multiplexed IPIs in sync with the rest of the
RISC-V IPI infrastructure.

Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
---
 drivers/irqchip/irq-riscv-imsic-early.c | 4 ++--
 drivers/irqchip/irq-riscv-imsic-state.h | 1 -
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
index 12efd241ce88..823f5f2ecb3d 100644
--- a/drivers/irqchip/irq-riscv-imsic-early.c
+++ b/drivers/irqchip/irq-riscv-imsic-early.c
@@ -67,12 +67,12 @@ static int __init imsic_ipi_domain_init(void)
 		return 0;
 
 	/* Create IMSIC IPI multiplexing */
-	virq = ipi_mux_create(IMSIC_NR_IPI, imsic_ipi_send);
+	virq = ipi_mux_create(IPI_MAX, imsic_ipi_send);
 	if (virq <= 0)
 		return virq < 0 ? virq : -ENOMEM;
 
 	/* Set vIRQ range */
-	riscv_ipi_set_virq_range(virq, IMSIC_NR_IPI);
+	riscv_ipi_set_virq_range(virq, IPI_MAX);
 
 	/* Announce that IMSIC is providing IPIs */
 	pr_info("%pfwP: providing IPIs using interrupt %d\n", imsic->fwnode, IMSIC_IPI_ID);
diff --git a/drivers/irqchip/irq-riscv-imsic-state.h b/drivers/irqchip/irq-riscv-imsic-state.h
index c42ee180b305..878cc192ccec 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.h
+++ b/drivers/irqchip/irq-riscv-imsic-state.h
@@ -13,7 +13,6 @@
 #include <linux/timer.h>
 
 #define IMSIC_IPI_ID				1
-#define IMSIC_NR_IPI				8
 
 struct imsic_vector {
 	/* Fixed details of the vector */

-- 
2.43.0


