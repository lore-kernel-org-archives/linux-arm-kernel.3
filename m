Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43ACEC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Jun 2025 13:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FCC/Fw3A0bjzOvR3pmSV5g9rBPb9pMgCSxT629UPwpU=; b=LoQsTgZJPSycudCONG39C8x3+B
	onKsOHBK1APmNphSFrHWp+JYsLvadc5FCazm3AA5F58mCPzk6Sgcr2kbibnfxJ1xtKwDj1PsYSgN4
	dipFaC+D1tZx6m9guyyHmYVBh8b7CvFLPDHNGFOiTHazd/sc5qpJ7P7Fa1ct0YJA6mmTvZ7ddL9c1
	OSNWDwKjzErr0P2qFQKAIFJT9HQUxugdKtYso5YY/gkNTmAVLoE5Hbt8BQCvq9UGdqA8mtV+w4Rqm
	1OQMFHSmbuVfz5W+E1W2FKuoiqY77mf5XySbBaUII7E39ZX+b0J3RGyloHOrlnLYj4aKZljM6AfF8
	TAwJrfJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOFji-00000002dPZ-0Nya;
	Sun, 08 Jun 2025 13:06:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOFYZ-00000002cS2-12ck
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Jun 2025 12:55:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A94D6452F6;
	Sun,  8 Jun 2025 12:55:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC533C4CEEF;
	Sun,  8 Jun 2025 12:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749387321;
	bh=cYDo3Zgsd2bGnIsyKyOt0rwMKRZhqTKS87xkH6vKRP0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CfKUNNnVrV0aF6xO9W1jgdx6aFLA0lfvCJgAhxWXs3AGuuwvruOhv9bGsxjIW/9ba
	 tfKXijCUwOWCSzQdydi77dtwSwhunByQg5Vr7yri4H9PoIZRO1MR1uGcXTwmnZNQ94
	 Uk8Hd3O93+YTpc/hKNhxvzErTe682h7gxgHsg3X+PJTkxdSxSv1PmnL/RN5xTtUJny
	 rbysnpQUQXLdE3qDdEQn7iEF2qsAc86Kid6jv4B+cQ+l8YIACZICKXyyO32CEUHtCm
	 Nj26GRHB7j9DDITGhRsn/IZQ0Npqk5GnM7l818nPCiMvjBOEn+eK4M/DmRywlcfDve
	 jq/aCkB2tB/aw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Thomas Gessler <thomas.gessler@brueckmann-gmbh.de>,
	Suraj Gupta <suraj.gupta2@amd.com>,
	Folker Schwesinger <dev@folker-schwesinger.de>,
	Vinod Koul <vkoul@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	michal.simek@amd.com,
	jernej.skrabec@gmail.com,
	mani@kernel.org,
	radhey.shyam.pandey@amd.com,
	marex@denx.de,
	krzysztof.kozlowski@linaro.org,
	u.kleine-koenig@baylibre.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.12 07/10] dmaengine: xilinx_dma: Set dma_device directions
Date: Sun,  8 Jun 2025 08:55:04 -0400
Message-Id: <20250608125507.934032-7-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250608125507.934032-1-sashal@kernel.org>
References: <20250608125507.934032-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.32
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_055523_329900_21144C52 
X-CRM114-Status: GOOD (  16.23  )
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

From: Thomas Gessler <thomas.gessler@brueckmann-gmbh.de>

[ Upstream commit 7e01511443c30a55a5ae78d3debd46d4d872517e ]

Coalesce the direction bits from the enabled TX and/or RX channels into
the directions bit mask of dma_device. Without this mask set,
dma_get_slave_caps() in the DMAEngine fails, which prevents the driver
from being used with an IIO DMAEngine buffer.

Signed-off-by: Thomas Gessler <thomas.gessler@brueckmann-gmbh.de>
Reviewed-by: Suraj Gupta <suraj.gupta2@amd.com>
Tested-by: Folker Schwesinger <dev@folker-schwesinger.de>
Link: https://lore.kernel.org/r/20250507182101.909010-1-thomas.gessler@brueckmann-gmbh.de
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES**

## Analysis

This commit should be backported to stable kernel trees because it fixes
a critical functionality bug that prevents the Xilinx DMA driver from
working with important subsystems.

### The Problem
The commit addresses a fundamental issue where `dma_get_slave_caps()`
fails when called on Xilinx DMA channels. The code change shows that the
driver was not setting the `directions` field in the `dma_device`
structure:

```c
+       xdev->common.directions |= chan->direction;
```

This single line fix accumulates the direction capabilities from
individual channels (either `DMA_MEM_TO_DEV` or `DMA_DEV_TO_MEM`) into
the device-level `directions` bitmask.

### Why This Qualifies for Backporting

1. **Fixes Important User-Facing Bug**: The commit message explicitly
   states this prevents the driver from being used with IIO DMAEngine
   buffers, which is a significant functional regression affecting real
   users.

2. **Small and Contained Fix**: The change is minimal - just one line of
   code that sets a required field during channel probe. This has
   extremely low risk of introducing regressions.

3. **Critical Subsystem Integration**: Without this fix,
   `dma_get_slave_caps()` calls fail with `-ENXIO`, breaking integration
   with any subsystem that queries DMA capabilities (like IIO).

4. **Clear Root Cause**: The fix directly addresses the root cause - the
   missing `directions` field that the DMAEngine core requires to be
   set.

5. **No Architectural Changes**: This doesn't introduce new features or
   change driver architecture; it simply provides required capability
   information that was missing.

### Comparison to Reference Commits
This closely matches **Similar Commit #1** (marked YES) which also fixed
a missing capability flag (`DMA_CYCLIC cap_mask bit`) that prevented
proper DMA channel allocation. Both commits:
- Fix missing capability declarations
- Are small, single-line changes
- Address integration failures with other subsystems
- Have minimal regression risk

The commit also mirrors **Similar Commit #2** (marked YES) which fixed
incorrect struct usage in the same driver - both address functional
correctness issues in the Xilinx DMA driver.

### Risk Assessment
The risk is minimal because:
- The change only affects the capability reporting mechanism
- It doesn't modify any data paths or transfer logic
- The direction values being OR'd together are already correctly set
  per-channel
- Failure mode is obvious (capability queries will work instead of
  failing)

This is a textbook example of a stable tree candidate: it fixes an
important bug affecting real users with a minimal, low-risk change that
doesn't introduce new functionality.

 drivers/dma/xilinx/xilinx_dma.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index 5eb51ae93e89d..aa59b62cd83fb 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -2906,6 +2906,8 @@ static int xilinx_dma_chan_probe(struct xilinx_dma_device *xdev,
 		return -EINVAL;
 	}
 
+	xdev->common.directions |= chan->direction;
+
 	/* Request the interrupt */
 	chan->irq = of_irq_get(node, chan->tdest);
 	if (chan->irq < 0)
-- 
2.39.5


