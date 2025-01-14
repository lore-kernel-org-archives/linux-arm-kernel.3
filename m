Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC07AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 10:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w20vK13nhMzbjHJZSCggje7+hpPlrM9z3S//rlxScS4=; b=cfDKk9cNZNQuhx0+RTMGIgUuhc
	1q9fulNqkegixN4yjbYlkMVBzjEY9iTWz9cAbzR0WnIPwKE8V7eG0S4Mi+CeO2v2vJdEx830UJG1i
	6ikYlqMUF4l8hoWz34Uz/1+FHgp2qhixO5ERz5xRJVEDjTpHNVOrtFthw9alJyVOCBfjZRvhU1aED
	D+3yIXWyjxXcPjHwpw8Vz5VRP7TFJ8tZJt9VcgCkGHDhSri6cfODLWI2r9dA/Ue9CuDPvsfHLerXb
	frJkJdgAZWuPnxGXtf1P+eXXGOzuk7r5KWKmdfKtS5hlpib/pzRmG7i2fgtqAsu47oj9hu0Gh+8aY
	XSz6FwBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXebW-00000008Ata-2p4e;
	Tue, 14 Jan 2025 10:57:02 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXeaG-00000008AZ4-1LIV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 10:55:45 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5d3ce64e7e5so789810a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 02:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736852143; x=1737456943; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w20vK13nhMzbjHJZSCggje7+hpPlrM9z3S//rlxScS4=;
        b=nkciBBjCa2d2Db1divcVcl3X8QqEQke/YIOyn5EOeBy5MuC7mQTjLUetHMEwWLGT/D
         JKQzOfD3Na544gtwVsKT1jvdOnE6IlKR1q3YPA3JUaaob0wYGgv73Rk2s0v0+8J1ykTK
         Svo6LgFbFuM3zVF6MdPkji1l33nEhAlNJXKlPhxMQEw5NcmwkytPOo48FmvfA/sod2bB
         DlaFCyK1LG88OljXl20MniPqtsyxGpXBWd2pI+ZoA05Q0jvRhzQLrQt4iFqpoE9CjE7C
         op82Q9LI8KyQeEZ99WXU6ISkK0cEw+tXNejKWNm4MSL26TaW5WPKFvOX9znABJamog9C
         M7bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736852143; x=1737456943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w20vK13nhMzbjHJZSCggje7+hpPlrM9z3S//rlxScS4=;
        b=Mh6znw26gQguzOK07RHenAGk/Y0uv/hfw4tGCOSoZT0HesPd1vm+1fXCJOjYld6SDI
         OFeQQBg9hryCcLszcrXftelOkA3ktYRX6r6Zc3yl/bxVvp1NXyokhO0ZS1w5IyC0o1ly
         rzjqUC+aH6L1sYiloJ9N0/pGSCeb4GcyS2+J5ePPdPx0fr/aaJavwOP/Uq04tJ1X4+Ch
         /wb3Wg0or26qQ5aBbIzBU81Ma7IJrJcFKzGOO5PFGvc5q9T7pTnESiY+Y7cP2bO/hJ6r
         t+z5rMd3hZxu/6OwgncfAw7XSkYA/Gn6dnh0QJcZCm18iJH19ZeZNX222JsSQcoyzNGN
         fRnA==
X-Forwarded-Encrypted: i=1; AJvYcCVN4msDNbgCqdAzo3uqAPz1AQW00jG/XlFRnmnTqkbQoFTLDptDx16+TYAGvaaecUUYFEbKuZBPgPEZPF4s8YGH@lists.infradead.org
X-Gm-Message-State: AOJu0Yy33870j4p5rLgURacT3liW2XJ5sB8IzO/duraizDnLTqRmMeZl
	xCrIJAxlCHCNJ+NjiD3jdN5NaBwHtjy5KbJfvd4fBFJFMYYk2AZJFM3f0AYlA10=
X-Gm-Gg: ASbGncuraC402tZuhA1cvH569XLB0bRX0TKlSZw0tIxhyYhXNQyBjYpQuJiBAvrJ5Na
	b8vO8cqTWVS/0fIx8sldmybpQ1UAcI3E3wdoFeDWMrM4aifyAeczcZ8xFbapTMSRMnt2ybkdaun
	VdJvZGO+l0OWwxOxCIMKRBn+qL1svKerHsHH5XtIDAd8Gc+oPsS3woUbwYqzvcV5i3xl9eg50fJ
	3Gg5S/NtkYZeT9tpz/BRT8XGs1AFFNH0qieHIzj7Gv5zXGdwhk9OkAMnfDp3mrPIPoHKxg=
X-Google-Smtp-Source: AGHT+IG+VYqAZEZjAkkDupQTvwlvu2SSq7a2Lp6yZVkX5waA19et6Qvi69lKI25WLQ+J8Hn9t77VNw==
X-Received: by 2002:a17:906:c14b:b0:aac:619:6411 with SMTP id a640c23a62f3a-ab2abc6fd33mr825598566b.11.1736852142566;
        Tue, 14 Jan 2025 02:55:42 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c95624e8sm611169266b.127.2025.01.14.02.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 02:55:42 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] dmaengine: Use str_enable_disable-like helpers
Date: Tue, 14 Jan 2025 11:55:37 +0100
Message-ID: <20250114105538.272963-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_025544_359436_6FC8CF64 
X-CRM114-Status: GOOD (  13.10  )
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
 drivers/dma/imx-dma.c           | 3 ++-
 drivers/dma/pxa_dma.c           | 4 ++--
 drivers/dma/ti/edma.c           | 3 ++-
 drivers/dma/xilinx/xilinx_dma.c | 3 ++-
 4 files changed, 8 insertions(+), 5 deletions(-)

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


