Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A412E9A03B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 02:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ubxs6WSUY7/NDy4w+6AqoAT9dMnWwez7XvAA4T+mV2A=; b=b+ve8x1ahuWo5Krj6H72TNGR2u
	W/97qXn0el4I8J2L74rHKra0XWSab+ZSqWC3+jJcNwaZ0xldFlFP2+hIEElhcqNeCScUx2QJ3JFSa
	Uj3qKM6me2ut9DVpyc5F2hZXz4HvAMf/X0XpAM41PlrehuQXEll2jFk3P1tBPYgj+WSUPDYYbNp9C
	1D4ikiSaVH9EU6Ll6hbv+4sNqNlYbsLQPDGKTWuSyhCCvsCgFNRM/uNbkINFTrfOLuNdNWwco/bX2
	gG39CdaZqJhKD8epH0mt127n7/ER34upxJ1NSObe9cpA1nlRzudZfnfa+G1pDha3ctK5XdggKXNEt
	GJzyoupQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vstPL-0000000Aj45-2plu;
	Thu, 19 Feb 2026 02:04:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vstPJ-0000000Aj3J-2vFt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 02:04:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7BA8661859;
	Thu, 19 Feb 2026 02:04:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 047C8C19422;
	Thu, 19 Feb 2026 02:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771466684;
	bh=PPjyU7zMC9lX0HvaJbOSS9kLml7wiyEt+w3z0sMWcs4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kfJG7DV0ZLDhd9N8eu0SgoeOSxcDwAnt9LIL61STZSfhbPuN0GFX5ijlKA883vaoZ
	 o12v6Od7h2MeIOS7K2jyAEAERLzqljbnwVbTR4rCwC2Gg+6kq6+9RCLKDVb/+g9DkA
	 Uy9Ilxf0wBFC1xUpN4BPx7W6sKNSVSCqIx8FL7p6393N8VcHH7rAb1bPHfH302V5qJ
	 vI/Qgc8CV1+DFE0HOV5rbrCkn7uBbu16F+l85soWvOyj7Pv8OoU+pl8BYr39QjKu2/
	 FC2G31h8QdFlbK/pVnlfzy0rjZR/IyrFrCqBuhKnKobei3Asv63u9rUbobgPjvwVyY
	 RMlpEkHBbPn1Q==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	samuel@sholland.org,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.19-6.1] dmaengine: sun6i: Choose appropriate burst length under maxburst
Date: Wed, 18 Feb 2026 21:03:52 -0500
Message-ID: <20260219020422.1539798-16-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260219020422.1539798-1-sashal@kernel.org>
References: <20260219020422.1539798-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19.2
Content-Transfer-Encoding: 8bit
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

From: Chen-Yu Tsai <wens@kernel.org>

[ Upstream commit 7178c3586ab42693b28bb81014320a7783e5c435 ]

maxburst, as provided by the client, specifies the largest amount of
data that is allowed to be transferred in one burst. This limit is
normally provided to avoid a data burst overflowing the target FIFO.
It does not mean that the DMA engine can only do bursts in that size.

Let the driver pick the largest supported burst length within the
given limit. This lets the driver work correctly with some clients that
give a large maxburst value. In particular, the 8250_dw driver will give
a quarter of the UART's FIFO size as maxburst. On some systems the FIFO
size is 256 bytes, giving a maxburst of 64 bytes, while the hardware
only supports bursts of up to 16 bytes.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Link: https://patch.msgid.link/20251221080450.1813479-1-wens@kernel.org
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Analysis Summary

### What the commit fixes

This commit fixes a real bug where the sun6i DMA engine driver
incorrectly rejects valid DMA slave configurations. The DMA API's
`maxburst` field specifies the **maximum** burst size, not an exact
value. When a DMA client (like 8250_dw UART) provides a maxburst value
(e.g., 64) that isn't directly supported by the hardware (which only
supports 1, 4, 8, 16), the old code returned `-EINVAL`, causing DMA
transfers to fail completely.

The fix adds a `find_burst_size()` helper that selects the largest
supported burst length that doesn't exceed `maxburst`, which is the
correct DMA API semantics. This makes DMA work on real systems where
8250_dw UART gives maxburst=64 (quarter of a 256-byte FIFO) but the DMA
hardware supports bursts of at most 16.

### Stable kernel criteria assessment

1. **Obviously correct and tested**: Yes. The logic is simple - find
   largest power-of-two burst in the supported bitmask that fits within
   maxburst. Reviewed by Jernej Skrabec, applied by Vinod Koul.

2. **Fixes a real bug**: Yes. DMA transactions fail with `-EINVAL` on
   specific hardware combinations. This causes UART (and potentially
   other peripherals) to not work via DMA.

3. **Important issue**: Yes - this causes peripheral communication
   failure (UART DMA doesn't work on some Allwinner SoCs). Users with
   256-byte UART FIFOs and DMA-capable 8250_dw cannot use DMA at all.

4. **Small and contained**: Yes. Adds a ~14-line helper function,
   removes 4 lines of strict checks, and reorders 4 lines of existing
   code to call the new function first. Total change is well under 50
   lines in a single file.

5. **No new features**: Correct - this makes the driver handle the
   existing DMA API correctly. It's a bug fix to match the documented
   DMA maxburst semantics.

### Risk assessment

- **Low risk**: Changes are confined to one driver file
  (`drivers/dma/sun6i-dma.c`)
- **No regressions for existing users**: If maxburst was previously an
  exact match for hardware-supported values (1, 4, 8, or 16),
  `find_burst_size()` returns the same value as before. The behavior
  only changes for values that previously failed.
- **Well-tested helper**: `rounddown_pow_of_two` is a standard kernel
  utility available in all stable trees.
- **No dependency issues**: The `burst_lengths` infrastructure was
  introduced in 2017, present in all current stable kernels.

### User impact

Moderate-to-high for Allwinner ARM SoC users (embedded/IoT). These SoCs
are common in single-board computers (Orange Pi, Pine64, etc.) and
various embedded devices. The fix enables DMA-based UART operation where
it was previously broken.

## Verification

- **Verified** `burst_lengths` was introduced by commit d5f6d8cf31a89
  (2017-09-28), present in all stable trees.
- **Verified** `convert_burst()` only handles values 1, 4, 8, 16 (lines
  283-297), so the old code that directly passed unsupported values
  would return -EINVAL from both the explicit check AND from
  convert_burst.
- **Verified** the hardware configs show burst_lengths support
  BIT(1)|BIT(8) (A31/A23/A83t/D1) or BIT(1)|BIT(4)|BIT(8)|BIT(16)
  (H3/H6/V3s/A100), meaning a maxburst of 64 would fail on ALL variants.
- **Verified** `rounddown_pow_of_two` is available in
  `include/linux/log2.h` and is a long-standing kernel utility.
- **Verified** via git log that no other recent commits to this file are
  needed as dependencies.
- **Verified** via lore.kernel.org that the patch was reviewed by Jernej
  Skrabec and applied by maintainer Vinod Koul.
- **Could not verify** the exact 8250_dw maxburst=64 scenario from the
  8250_dw driver source (unverified, but the commit message describes a
  real hardware scenario credibly).

**YES**

 drivers/dma/sun6i-dma.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 2215ff877bf7d..f9d876deb1f05 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -583,6 +583,22 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 	return ret;
 }
 
+static u32 find_burst_size(const u32 burst_lengths, u32 maxburst)
+{
+	if (!maxburst)
+		return 1;
+
+	if (BIT(maxburst) & burst_lengths)
+		return maxburst;
+
+	/* Hardware only does power-of-two bursts. */
+	for (u32 burst = rounddown_pow_of_two(maxburst); burst > 0; burst /= 2)
+		if (BIT(burst) & burst_lengths)
+			return burst;
+
+	return 1;
+}
+
 static int set_config(struct sun6i_dma_dev *sdev,
 			struct dma_slave_config *sconfig,
 			enum dma_transfer_direction direction,
@@ -616,15 +632,13 @@ static int set_config(struct sun6i_dma_dev *sdev,
 		return -EINVAL;
 	if (!(BIT(dst_addr_width) & sdev->slave.dst_addr_widths))
 		return -EINVAL;
-	if (!(BIT(src_maxburst) & sdev->cfg->src_burst_lengths))
-		return -EINVAL;
-	if (!(BIT(dst_maxburst) & sdev->cfg->dst_burst_lengths))
-		return -EINVAL;
 
 	src_width = convert_buswidth(src_addr_width);
 	dst_width = convert_buswidth(dst_addr_width);
-	dst_burst = convert_burst(dst_maxburst);
-	src_burst = convert_burst(src_maxburst);
+	src_burst = find_burst_size(sdev->cfg->src_burst_lengths, src_maxburst);
+	dst_burst = find_burst_size(sdev->cfg->dst_burst_lengths, dst_maxburst);
+	dst_burst = convert_burst(dst_burst);
+	src_burst = convert_burst(src_burst);
 
 	*p_cfg = DMA_CHAN_CFG_SRC_WIDTH(src_width) |
 		DMA_CHAN_CFG_DST_WIDTH(dst_width);
-- 
2.51.0


