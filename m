Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C92E0E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 19:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8Hq0kZV+DlzD8qoGvH66U3+jQ5umvo6DGWQDujH64ns=; b=ZkeaqW+U/BJEDMh1AGDWE6Gc/K
	z5sN0pXAac9U2GSiSz0jdt7uVcTGsGc/RYozLP4vDwrgKqgmN19fqnOx1C5Zi/NNrfP0OICsHazXb
	ckc9YoG2B8LTWXvTIDsHOcL6HY2UQbWzbu58vn2CPPvGx6T9ffZXTxqczC6dMByYPlLh8yC+/tVn9
	t720GzPfGnO8gw6+sQGDKl4w0vJWciJ0NXb37XakGRV4VkptMnAsypneBKN+sAr1IH1bSO+y4huvL
	zNWA9Ckil2g490K+ZxyNuvbTbDbiAkaM6yYlfKvZYNUBAH/ARUyohDs0vaHkyRzqzzH5/+lga6+V3
	0GdPO3HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXmKT-00000009V4J-3lE9;
	Tue, 14 Jan 2025 19:11:57 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXmJD-00000009Usl-01DA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 19:10:40 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4361aa6e517so7400395e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 11:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736881837; x=1737486637; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8Hq0kZV+DlzD8qoGvH66U3+jQ5umvo6DGWQDujH64ns=;
        b=HMSVHr5CcYgHeFwq8qjJNzlH/wyqziAnOyJPuTxUIT3mKYrUBMGJb+EkkaKxW6ldLk
         hWW55zOATdd9+I3+UDTq+2PBtIaKmxJ3+EFTzHPlTY2JNn8FhgqsX5t5tSjbX6OBjgIW
         8a171j5Nqf18tRVNlY15mt+zFhGYWJEyJY/udMizWZKmhzMXM833BafvMISAgEgR85iU
         Y3A1+qtELjvSGnkPn1/wPkvICfpb9/bXEfBAf6Uo6yLu/zOxLTxf0gdhPREdZfAX5/wD
         7NyXLnkIWXcN7NxeX7Cgi5ZJ60AIjR5lxiWe9/SSJG6Qj1QdPjc0LX3sVD3vAUv6psJa
         eqVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736881837; x=1737486637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Hq0kZV+DlzD8qoGvH66U3+jQ5umvo6DGWQDujH64ns=;
        b=PHsmkpPi8L5p887R/qW7q5m15qAemrav8JPY+gaXhgiED5DnxYpXfhzGj5VdEa06v4
         jxHM5LkbKo/c8ZqPo2nzTALR+cfg6R0q76Da0zom5iventIiI05fNHWk/TYPgP40kt9t
         5GW2YZHICKbbOzyzhwdMRigJejW/8c39FqRK7ofxkXfToSsIbHeTtKD10c90Ik0SrxfK
         IlNNVxw9x8HtsdB9MNeE6r6SFmbTrM8kdbkuvJLsxp0XslkC5WnAnBRED/5ZZwH/5PZ1
         0k+uHvh7K5KQ+LYPU2X7SeSy8k0PwceA0aKLX9tqstbmrqDOv5Vw16R/Wn3aU5XoNeL6
         IpKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLrG2Tcz77GaUpHoT6eg31n8+hpboeReGDVRT9y1+Ts7XUv4kMhkhMyGsU11jX4uwAgA/XcaA+VTuyC4Cq85/N@lists.infradead.org
X-Gm-Message-State: AOJu0YyqKy3Ptx0WdldNUrLubvBNrq7BEGUVV0cFQHPTufw/F228e2oI
	l6jK+aWmbO9e6FixdZSntluyM2/7ID/xcNszpUeg56lx2zzZabmztHT7MDKWLaI=
X-Gm-Gg: ASbGncsFkV1J9e/cK9cCsSNAtxvnenWf4DKVo2O8VDNFnzRTw0+bErQuP42NnfuuQUv
	Ha132H1bRKwPRhHnT/QDQTwm1bPoLr6jX3V4+Hhc7Sc022g0upJs0gwWEl6NSMeQzTJFWpksiLy
	CMAf7oPRXEL4FsJznZC7S+4WCMuDN7GesPKWeKGTBgt4tVpNw0HzlcBvRrJTaER/55+jycTZ/2R
	YGFgaUun0P2FSuIHz9eK72iyQvXlMVmGubKkB3hO48wRxqzaIlmxufy8FNBIohMM6DMtBc=
X-Google-Smtp-Source: AGHT+IG2A8LJoFY7HSHluOf/VUgtUb7NwFTVX2MTXjdEOwZYpV2MYFuUV6Fofa8Ort5P+B1yzvLbnQ==
X-Received: by 2002:a05:6000:1ac5:b0:385:f3d8:66b9 with SMTP id ffacd0b85a97d-38a873122f8mr8267937f8f.11.1736881837369;
        Tue, 14 Jan 2025 11:10:37 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2ddcda3sm219721835e9.22.2025.01.14.11.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 11:10:35 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/2] dmaengine: Use str_enable_disable-like helpers
Date: Tue, 14 Jan 2025 20:10:20 +0100
Message-ID: <20250114191021.854080-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_111039_057412_A9657351 
X-CRM114-Status: GOOD (  14.15  )
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

Replace ternary (condition ? "enable" : "disable") syntax with helpers
from string_choices.h because:
1. Simple function call with one argument is easier to read.  Ternary
   operator has three arguments and with wrapping might lead to quite
   long code.
2. Is slightly shorter thus also easier to read.
3. It brings uniformity in the text - same string.
4. Allows deduping by the linker, which results in a smaller binary
   file.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Also drivers/dma/dw-edma/dw-edma-core.c and drivers/dma/sun6i-dma.c
---
 drivers/dma/dw-edma/dw-edma-core.c | 6 ++++--
 drivers/dma/imx-dma.c              | 3 ++-
 drivers/dma/pxa_dma.c              | 4 ++--
 drivers/dma/sun6i-dma.c            | 3 ++-
 drivers/dma/ti/edma.c              | 3 ++-
 drivers/dma/xilinx/xilinx_dma.c    | 3 ++-
 6 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 68236247059d..c2b88cc99e5d 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -15,6 +15,7 @@
 #include <linux/irq.h>
 #include <linux/dma/edma.h>
 #include <linux/dma-mapping.h>
+#include <linux/string_choices.h>
 
 #include "dw-edma-core.h"
 #include "dw-edma-v0-core.h"
@@ -746,7 +747,7 @@ static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
 		chan->ll_max -= 1;
 
 		dev_vdbg(dev, "L. List:\tChannel %s[%u] max_cnt=%u\n",
-			 chan->dir == EDMA_DIR_WRITE ? "write" : "read",
+			 str_write_read(chan->dir == EDMA_DIR_WRITE),
 			 chan->id, chan->ll_max);
 
 		if (dw->nr_irqs == 1)
@@ -767,7 +768,8 @@ static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
 		memcpy(&chan->msi, &irq->msi, sizeof(chan->msi));
 
 		dev_vdbg(dev, "MSI:\t\tChannel %s[%u] addr=0x%.8x%.8x, data=0x%.8x\n",
-			 chan->dir == EDMA_DIR_WRITE  ? "write" : "read", chan->id,
+			 str_write_read(chan->dir == EDMA_DIR_WRITE),
+			 chan->id,
 			 chan->msi.address_hi, chan->msi.address_lo,
 			 chan->msi.data);
 
diff --git a/drivers/dma/imx-dma.c b/drivers/dma/imx-dma.c
index a651e0995ce8..de8d7070904e 100644
--- a/drivers/dma/imx-dma.c
+++ b/drivers/dma/imx-dma.c
@@ -17,6 +17,7 @@
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/platform_device.h>
 #include <linux/clk.h>
 #include <linux/dmaengine.h>
@@ -942,7 +943,7 @@ static struct dma_async_tx_descriptor *imxdma_prep_dma_interleaved(
 		"   src_sgl=%s dst_sgl=%s numf=%zu frame_size=%zu\n", __func__,
 		imxdmac->channel, (unsigned long long)xt->src_start,
 		(unsigned long long) xt->dst_start,
-		xt->src_sgl ? "true" : "false", xt->dst_sgl ? "true" : "false",
+		str_true_false(xt->src_sgl), str_true_false(xt->dst_sgl),
 		xt->numf, xt->frame_size);
 
 	if (list_empty(&imxdmac->ld_free) ||
diff --git a/drivers/dma/pxa_dma.c b/drivers/dma/pxa_dma.c
index e50cf3357e5e..249296389771 100644
--- a/drivers/dma/pxa_dma.c
+++ b/drivers/dma/pxa_dma.c
@@ -10,6 +10,7 @@
 #include <linux/interrupt.h>
 #include <linux/dma-mapping.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/dmaengine.h>
 #include <linux/platform_device.h>
 #include <linux/device.h>
@@ -277,8 +278,7 @@ static int chan_state_show(struct seq_file *s, void *p)
 	seq_printf(s, "\tPriority : %s\n",
 			  str_prio[(phy->idx & 0xf) / 4]);
 	seq_printf(s, "\tUnaligned transfer bit: %s\n",
-			  _phy_readl_relaxed(phy, DALGN) & BIT(phy->idx) ?
-			  "yes" : "no");
+			  str_yes_no(_phy_readl_relaxed(phy, DALGN) & BIT(phy->idx)));
 	seq_printf(s, "\tDCSR  = %08x (%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s)\n",
 		   dcsr, PXA_DCSR_STR(RUN), PXA_DCSR_STR(NODESC),
 		   PXA_DCSR_STR(STOPIRQEN), PXA_DCSR_STR(EORIRQEN),
diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 95ecb12caaa5..2215ff877bf7 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -19,6 +19,7 @@
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/types.h>
 
 #include "virt-dma.h"
@@ -553,7 +554,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 			continue;
 
 		dev_dbg(sdev->slave.dev, "DMA irq status %s: 0x%x\n",
-			i ? "high" : "low", status);
+			str_high_low(i), status);
 
 		writel(status, sdev->base + DMA_IRQ_STAT(i));
 
diff --git a/drivers/dma/ti/edma.c b/drivers/dma/ti/edma.c
index 4ece125b2ae7..b1a54655e6ce 100644
--- a/drivers/dma/ti/edma.c
+++ b/drivers/dma/ti/edma.c
@@ -16,6 +16,7 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+#include <linux/string_choices.h>
 #include <linux/of.h>
 #include <linux/of_dma.h>
 #include <linux/of_irq.h>
@@ -2047,7 +2048,7 @@ static int edma_setup_from_hw(struct device *dev, struct edma_soc_info *pdata,
 	dev_dbg(dev, "num_qchannels: %u\n", ecc->num_qchannels);
 	dev_dbg(dev, "num_slots: %u\n", ecc->num_slots);
 	dev_dbg(dev, "num_tc: %u\n", ecc->num_tc);
-	dev_dbg(dev, "chmap_exist: %s\n", ecc->chmap_exist ? "yes" : "no");
+	dev_dbg(dev, "chmap_exist: %s\n", str_yes_no(ecc->chmap_exist));
 
 	/* Nothing need to be done if queue priority is provided */
 	if (pdata->queue_priority_mapping)
diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index 108a7287f4cd..3ad44afd0e74 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -46,6 +46,7 @@
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/clk.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
 
@@ -2940,7 +2941,7 @@ static int xilinx_dma_chan_probe(struct xilinx_dma_device *xdev,
 			    XILINX_DMA_DMASR_SG_MASK)
 			chan->has_sg = true;
 		dev_dbg(chan->dev, "ch %d: SG %s\n", chan->id,
-			chan->has_sg ? "enabled" : "disabled");
+			str_enabled_disabled(chan->has_sg));
 	}
 
 	/* Initialize the tasklet */
-- 
2.43.0


