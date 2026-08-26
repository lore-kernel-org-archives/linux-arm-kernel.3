Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D735EC61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 01:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r8xxhXLXwBvZGQ89s3NtLyGdJ91KtYqy6L+FbcUge9s=; b=ZhhMYjdtao9rcmLrgTr6U3/Ek9
	IXPxbCq5Gj30/AFj7ECFAQcVWzJ9UzkEgRai5QKCwsWKe5RiJXwelgEFIOzccN/ZmILGVq+M8KpLg
	Ne3CLKUNLFLKlpOByJ0H+UNXZMveGRPY/gJoXw1xDsDYgmellPM97Y8oy2pVFNZ0rH1AXXDSbV+wt
	sqwqW1eklDp4Yl/egDL6BbGMgJ5HhaQ4sBkr+xSZEAK/dV6lK/1yoCM1pwBIhiqqWMtaWWCkEgSXd
	uMVF2SfG+irQQQ8wPz3h+WBnKvArUgwifqmYaT4JRVAfP9JQo3GIGO5qfSAuQQiXB+6QQqfH2J++u
	voGfvB2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz2TG-00000001l1X-10aQ;
	Wed, 26 Aug 2026 01:30:30 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz2TD-00000001l0I-0i9u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 01:30:28 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-93703cc9e2dso19236185a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 18:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787707826; x=1788312626; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r8xxhXLXwBvZGQ89s3NtLyGdJ91KtYqy6L+FbcUge9s=;
        b=FkSojW8QKVqZJOg/k14HeLJBWbddp6NvUg2DaQ0b0P8n4fHIqrV+/iRmLlOOaCV5XG
         8AQZ6PPJ4PbO2xmEX6n98OW5F8yI0GQLYLuJiT6gKUhtap8824XLcYKHlNlYuFU/QeNQ
         1kwqljfbNigpxJX4ET4ryp/YFnznFzX20NZmvtT9QowkFAe0fEKlEvCn+DMIxfH7E2C1
         FdnzdQ3NkLVjhtyPa+4AYEvIs3Q5QIVlqTPvTzvLPiOODtCMuZRQoEKveypfd0JnV1B4
         Y4MFbdG8Rf2+se8GS/TxPbdv/OVgR7qbsHtT1bwg7phulNEiN9MKUg1oMFzo8yvRBWe+
         kf/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787707826; x=1788312626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r8xxhXLXwBvZGQ89s3NtLyGdJ91KtYqy6L+FbcUge9s=;
        b=P9Bjku+p+2bkyf8L2zTfmiJ8N/G0b0GQ6FcE/Ldv/xzd2tBOA5dQdAGTX5FmIv+XF0
         eopG6/Vd+uh0mKHuV/BjLPoMdfsx7zevNuF+5/QkKxB8geHgLoUHURAWDSJdoqjkRx7p
         EospORtizjGO6oZYpXTpABMPYxTJYrfttnpR215sm4WNpsrdowklXTz6somtpsOrGR87
         doP0BugVHOA4OeqK8kSIJS033WK8rZbUBGosbWVjrS6khobBC0oFM/sn3LUAu6r/1tDo
         OMTWFupM0pTUPIMLkyaCawgyh5ZBEFVmeCUm8ySbDD8qH4d/Y/g/21QM1ACf8Nm6GkQc
         nt/A==
X-Forwarded-Encrypted: i=1; AHgh+Roe8g22RKGWr2DglhQPVMyz4ZreGYTS0N8SW0Ba3ZhSXp1K03BT2FvcPUp0m5JTkjINI9m4FPXsmsvFEsLeB9/x@lists.infradead.org
X-Gm-Message-State: AFuF++lm19pggwos9brvleDYjmJ/PJUeSb15G9Nz0RCLJSDys3+t5agj
	eDiH0EFduR2nh5BGGQn1a6nX7QG1BmaGo7GVb/vJmUuuFZjyffHogj16
X-Gm-Gg: AR+sD11ZzQroDS8SSxi4Cy2jdthddXsS71ISV+AX2Xq/GGkbEnhsLAbuk5wgBboc+nX
	u0cSXOfVk7Fkfzr0ba+zKiSZTHeSp/f29Kb7Hw4ycdBIFMNfGxT7GEXph376MnvA0LTcjChGph1
	WnsPDTXD8TFP2jO/WDjpI+hJCQJ2lr8YgoIKle2keqDM/BLZmEm8XN0fhuivs9Jr5Yr4Wy42Ne2
	xONmKsTalJEeSbvlY6WJlmLy3d6EAymqRPQhvsobV492+MjNkvGmtWXSM+bZo+KofB5MtfjMSz2
	WG/D5aj0s5tasF5LswTMFW4zgEfVLr+JPKntd2JM95Lrjn/vdVjndqAQLIT2CjCMSUzbpWzoegI
	xTI5bWwcBTPVoR9RQvuUdh+BpbTHWa4tNOMe0YqAowuOzYhePiaOyn/xPgxaYGFWKURyBFxddfr
	6RxCpI3x0JGSeC89224HiBfhmlNMcZ+BVbX/U/IDTFs+iBzEHBdYwcXgO54jKt6g==
X-Received: by 2002:a05:620a:72c1:10b0:936:e71a:db90 with SMTP id af79cd13be357-937803e0e3dmr234920985a.29.1787707825690;
        Tue, 25 Aug 2026 18:30:25 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9377e67c52csm102398585a.38.2026.08.25.18.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 18:30:25 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Wed, 26 Aug 2026 01:30:04 +0000
Subject: [PATCH v4 2/5] dmaengine: sun6i-dma: Support variable address
 widths using masks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-sun60i-a733-dma-v4-2-dc2f745f40dc@gmail.com>
References: <20260826-sun60i-a733-dma-v4-0-dc2f745f40dc@gmail.com>
In-Reply-To: <20260826-sun60i-a733-dma-v4-0-dc2f745f40dc@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: Yuanshen Cao <alex.caoys@gmail.com>, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_183027_224721_551253F2 
X-CRM114-Status: GOOD (  14.53  )
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
 drivers/dma/sun6i-dma.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index f305fbfb3545..53c54161e32a 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -24,6 +24,10 @@
 
 #include "virt-dma.h"
 
+/* Non-constant mask variant of FIELD_GET() and FIELD_PREP() */
+#define field_get(_mask, _reg)	(((_reg) & (_mask)) >> (ffs(_mask) - 1))
+#define field_prep(_mask, _val)	(((_val) << (ffs(_mask) - 1)) & (_mask))
+
 /*
  * Common registers
  */
@@ -103,8 +107,8 @@
  * The LLI link physical address is also mangled, but we avoid dealing
  * with that by allocating LLIs from the DMA32 zone.
  */
-#define SRC_HIGH_ADDR(x)		(((x) & 0x3U) << 16)
-#define DST_HIGH_ADDR(x)		(((x) & 0x3U) << 18)
+#define SRC_HIGH_ADDR_MASK	GENMASK(17, 16)
+#define DST_HIGH_ADDR_MASK	GENMASK(19, 18)
 
 /*
  * Various hardware related defines
@@ -147,7 +151,8 @@ struct sun6i_dma_config {
 	u32 dst_burst_lengths;
 	u32 src_addr_widths;
 	u32 dst_addr_widths;
-	bool has_high_addr;
+	u32 src_high_addr_mask;
+	u32 dst_high_addr_mask;
 	bool has_mbus_clk;
 	u32 irq_stride;
 	u32 irq_en_offset;
@@ -687,9 +692,10 @@ static inline void sun6i_dma_set_addr(struct sun6i_dma_dev *sdev,
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
@@ -1283,7 +1289,8 @@ static struct sun6i_dma_config sun50i_a100_dma_cfg = {
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


