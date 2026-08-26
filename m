Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DABFC61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 02:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w469z7Q5/aaHi8aSt2+jyQ5LFi1CuQ46eioWVHjW3cs=; b=V4L9wO0l0JzkyVLKWiQDIDzW7O
	GncUaWH5eohaVP4ablYMSjl7ADwrfwtFDKNLMSEAFFxiTlLKWjqAAEKGLcughpD7L6yLHYu5KJ4p6
	qkQS7h140SvM410IsBVtMW53NcFaRgUSw3mKAoFPrScbiDqZekKdaGG+kyE4BQnfnwM+ZXXkHr0DE
	jrCaQFtT9whaiFJADZccBVeoqCYkKoPW7CbyDDV5/LpDCLf/b/w69D0xuHk/RkKcx6j/mhTvmTVuu
	4qLyJJcIwkAOs7mEbYVnWfgceTq/6NOVnZuIsNXSP+5tM8/aJ/0Y1uzhY8AYUyifV5BYy00K/X6YL
	9/pv4+yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz3Zh-00000001o79-01HM;
	Wed, 26 Aug 2026 02:41:13 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz3ZD-00000001o0p-01bB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 02:40:45 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-7ff05e5d009so5320427b3.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 19:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787712042; x=1788316842; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w469z7Q5/aaHi8aSt2+jyQ5LFi1CuQ46eioWVHjW3cs=;
        b=WbdWRKxIKRruF3jKXLixU/bwapoA3Q01WTY7/8QZJ9Kmz62vgTOKE1++s0c0/A0Ibp
         itGIhxKgJ5ME+cw9jxvIyjW1a7+hx8Z6ozZXXwLZx6CKH/U7YtMCcTSXM+gHsrkiJft/
         9Hxd62YjEN9tBXe6x/iXj8uLL5zVAkYF1aMPqhSvXwyJ/wcSAb9p5DbSww6XeGXy+zTY
         xfUH4k2yL0OxD5fLOy66LhxbBzkmjwWexFUZA9tbF1qhSsJFdz+xtKVQMnp2k5B5q+9M
         m+RLfmfyuST01XX0E2A2VrEsQC7TMqfq2hOd9k8UDdHj8fQT+3zkmgOw1VekSSeyoTvx
         rSow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787712042; x=1788316842;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w469z7Q5/aaHi8aSt2+jyQ5LFi1CuQ46eioWVHjW3cs=;
        b=lu8YoXSOvgCM6qTZLYhGtkZ4SG4vPoVEZ6abmCLONzAwZuwOFcGg7sK4+5jVe4jgkT
         AEezM5XzT7y3J70LSysw7cM3vGFeJIddj2o5ySkuSipVJ9/oP2DevNRySS39HNqG39pd
         MAs1vr2pVPWm8X6fSCEEGdj3IO291MGXdOmapuNk2GTHvIXJJWeXZ6zkQFEQap5D3JB1
         2bgT/yq62L20AAe57rjfX8DSQVO9THWU43wNpM5dbFX8MUtp+WQi4CfA8nMpDy9zLr+Y
         tDfeu8s/hduZFfM/sW4Bnnesqweees4HvLIYf/KIpWW2nvG6Ow8EExrRgBnRBvp+738c
         ixng==
X-Forwarded-Encrypted: i=1; AHgh+RraZomv6FubLMqbUUIXo+ai6qg42HTKXK19MI9d600BE5+MDdtnbrQ9XbzfRpK5DuGsVlEZ+ATCReZdcRFD32Xn@lists.infradead.org
X-Gm-Message-State: AFuF++my+5l/qP0jpA96JoIV62Xc84SLSd5WFtHNqbbpzaF2ZBgNie5P
	BASusXd5baiC3hKGYYDfDV2vP99zb1sFAiVQHLAJbK3nkww7nv+cwhrk
X-Gm-Gg: AR+sD13Azhmu8AivpFkIi1zQEiUUtfh11yQ5C5DHCvxGH//sKXirzwBE6EWLIarkiWz
	3+pDQHvjaeECZZxApxNbJiNdyR3HH1WRZrWnznOhQoxQX6Z2RrvoitFTboK2WU/l9PyrFORyrSw
	CYUf+NhqZKOct7PFZKXQDh04nWde+ozsJqvcDTwKQR7D1c1OkRXmgL1aYvxuxNloffRDGjuUmBW
	ZJXLYRrR74/kLgCpJM6MttZ2gJqEiPWiAgaPn41oefOr+gxVU2TPWvVblLE4m0t5Yu23kuLy3pS
	VUwT4c8R+Lm9Gx0L/kZxT1RpnscCDr3ruwn2y1ko+mUuqgbZq+2sA/iUQbUd7bgM+B1OVm/nnos
	xgi4Ec4QPLO99HaWooqyT28jfdmhZkZiiO87MxLquMTH9/eYVxkq8kHBGt9rzZDrADy4N5LVGMt
	qGGJBARUp303wlTMFjdAnvu5JGIc5eEBgUui2bOHsJSKTZkDxaPE2qI13ry7hAlw==
X-Received: by 2002:a05:690c:4004:b0:81e:eb11:6e5f with SMTP id 00721157ae682-8574172735emr13449597b3.34.1787712041685;
        Tue, 25 Aug 2026 19:40:41 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-857053839fdsm9976087b3.10.2026.08.25.19.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 19:40:41 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Wed, 26 Aug 2026 02:40:28 +0000
Subject: [PATCH v5 2/5] dmaengine: sun6i-dma: Support variable address
 widths using masks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-sun60i-a733-dma-v5-2-abc5229b441e@gmail.com>
References: <20260826-sun60i-a733-dma-v5-0-abc5229b441e@gmail.com>
In-Reply-To: <20260826-sun60i-a733-dma-v5-0-abc5229b441e@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Yuanshen Cao <alex.caoys@gmail.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_194044_402377_3D31F626 
X-CRM114-Status: GOOD (  14.96  )
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

The Allwinner A733 DMA controller supports higher addresses (up to
32G) compared to previous generations. The existing `sun6i_dma_set_addr`
function uses hardcoded logic for setting the high-address bits in the
LLI parameters.

Add `src_high_addr_mask` and `dst_high_addr_mask` to `struct
sun6i_dma_config` to handle different high-address bitfield mappings.
Update `sun6i_dma_set_addr` to use these masks via `field_prep()`,
allowing the driver to support variable address widths.

Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
 drivers/dma/sun6i-dma.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index f305fbfb3545..1ffd870d9594 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -7,6 +7,7 @@
  * Maxime Ripard <maxime.ripard@free-electrons.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/dma-mapping.h>
@@ -103,8 +104,8 @@
  * The LLI link physical address is also mangled, but we avoid dealing
  * with that by allocating LLIs from the DMA32 zone.
  */
-#define SRC_HIGH_ADDR(x)		(((x) & 0x3U) << 16)
-#define DST_HIGH_ADDR(x)		(((x) & 0x3U) << 18)
+#define SRC_HIGH_ADDR_MASK	GENMASK(17, 16)
+#define DST_HIGH_ADDR_MASK	GENMASK(19, 18)
 
 /*
  * Various hardware related defines
@@ -147,7 +148,8 @@ struct sun6i_dma_config {
 	u32 dst_burst_lengths;
 	u32 src_addr_widths;
 	u32 dst_addr_widths;
-	bool has_high_addr;
+	u32 src_high_addr_mask;
+	u32 dst_high_addr_mask;
 	bool has_mbus_clk;
 	u32 irq_stride;
 	u32 irq_en_offset;
@@ -687,9 +689,10 @@ static inline void sun6i_dma_set_addr(struct sun6i_dma_dev *sdev,
 	v_lli->src = lower_32_bits(src);
 	v_lli->dst = lower_32_bits(dst);
 
-	if (sdev->cfg->has_high_addr)
-		v_lli->para |= SRC_HIGH_ADDR(upper_32_bits(src)) |
-			       DST_HIGH_ADDR(upper_32_bits(dst));
+	if (sdev->cfg->src_high_addr_mask)
+		v_lli->para |=
+			field_prep(sdev->cfg->src_high_addr_mask, upper_32_bits(src)) |
+			field_prep(sdev->cfg->dst_high_addr_mask, upper_32_bits(dst));
 }
 
 static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_memcpy(
@@ -1283,7 +1286,8 @@ static struct sun6i_dma_config sun50i_a100_dma_cfg = {
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_8_BYTES),
-	.has_high_addr = true,
+	.src_high_addr_mask = SRC_HIGH_ADDR_MASK,
+	.dst_high_addr_mask = DST_HIGH_ADDR_MASK,
 	.has_mbus_clk = true,
 	SUN6I_DMA_IRQ_A31_COMMON_CFG
 };

-- 
2.55.0


