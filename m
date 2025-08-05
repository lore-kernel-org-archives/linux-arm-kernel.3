Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D713C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 13:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7rwdEYUVlByJHPIkkgUSD/l/Bx2xS797H5pUKRApluM=; b=Lj3B0yGjs+DIs9gCZmkVCMcAOP
	9JmtL8rbhPc0z0nTpxN2tl1rykQZlNFZO+882izW0yfWnmgz7Y4t2W5rtAHyZs5hl/y4yQvtlQmNS
	W8glVm/UjB8XeaZi4RRpsRvHQw7CiC/lRZ4zkd/TYmi2Nw4f75EdroKyUJ3Z4Ro2+oDK+bGavsX6E
	Mx+iYLjdWQ+d+KvMzfLkSCzicn4YPB8a0fmij6xJYvUpzv2rvjfzYlAIVKLMRivYLBF6OHlxprqN4
	Ndm1iddjr0s54LWZ4NWAbOSaOOcYiOzIV97otljDMOvyez7jdUz/fX5BUsDP4jNGgDI53+5+N15j2
	BLXnL2pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujHiB-0000000CqM0-32vI;
	Tue, 05 Aug 2025 13:28:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujHSG-0000000CnkA-0ngX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 13:11:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B0D7D60204;
	Tue,  5 Aug 2025 13:11:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEEA9C4CEFE;
	Tue,  5 Aug 2025 13:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754399503;
	bh=dSsKft6R8Ur2qdOcK2P58eAK0xJaJB/wuxX5XnU1Ktg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NGBm2yp/TA7x/KtUo7ySEXK8aBVficvdSnm4NxBpBV37xVQPMMvkWhm6A1BPEpQwu
	 XMGnaqW7vnpw54jxYBcMCRbQjHKwd1bnn3eoh23eT1xWMu0XHf1qQF9Dm0HGA6ltT9
	 ZtkuqRBsko5HSwdteOhChQ47X9DlL0D2tdm5ZTNaeqIvs9oB0GvIxt7RVKrd2sUk7K
	 uhD37NngEXGe9SJix2FpxeWwG4tE0gBl7GEe9B3iSQd/+Y5WTeeCcsejEAwvRSg+mq
	 1bvrv1WfWJpZGqC8R9NAs6yNsovb+cCGJEuWD/AFUlo7KPnzxnvUpLMHTjdb2RAUmJ
	 F+V7JXD/61IOw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Amelie Delaunay <amelie.delaunay@foss.st.com>,
	Vinod Koul <vkoul@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	dmaengine@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.16-6.1] dmaengine: stm32-dma: configure next sg only if there are more than 2 sgs
Date: Tue,  5 Aug 2025 09:09:27 -0400
Message-Id: <20250805130945.471732-52-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250805130945.471732-1-sashal@kernel.org>
References: <20250805130945.471732-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.16
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

From: Amelie Delaunay <amelie.delaunay@foss.st.com>

[ Upstream commit e19bdbaa31082b43dab1d936e20efcebc30aa73d ]

DMA operates in Double Buffer Mode (DBM) when the transfer is cyclic and
there are at least two periods.
When DBM is enabled, the DMA toggles between two memory targets (SxM0AR and
SxM1AR), indicated by the SxSCR.CT bit (Current Target).
There is no need to update the next memory address if two periods are
configured, as SxM0AR and SxM1AR are already properly set up before the
transfer begins in the stm32_dma_start_transfer() function.
This avoids unnecessary updates to SxM0AR/SxM1AR, thereby preventing
potential Transfer Errors. Specifically, when the channel is enabled,
SxM0AR and SxM1AR can only be written if SxSCR.CT=1 and SxSCR.CT=0,
respectively. Otherwise, a Transfer Error interrupt is triggered, and the
stream is automatically disabled.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
Link: https://lore.kernel.org/r/20250624-stm32_dma_dbm_fix-v1-1-337c40d6c93e@foss.st.com
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Based on my comprehensive analysis of the commit and the STM32 DMA
driver code, here's my assessment:

**Backport Status: YES**

This commit should be backported to stable kernel trees. Here's an
extensive explanation based on the code analysis:

## Bug Being Fixed

The commit fixes a **Transfer Error interrupt** issue in the STM32 DMA
driver when operating in Double Buffer Mode (DBM) with exactly two
periods. The bug manifests as follows:

1. **The Problem**: When DBM is enabled with exactly 2 scatter-gather
   segments (periods), the driver was unnecessarily calling
   `stm32_dma_configure_next_sg()` in the interrupt handler (line 748 of
   stm32_dma_handle_chan_done).

2. **Hardware Constraint**: As explained in the commit message, when the
   channel is enabled, the memory address registers (SxM0AR and SxM1AR)
   can only be written when specific conditions are met:
   - SxM0AR can only be written when CT (Current Target) = 1
   - SxM1AR can only be written when CT = 0
   - Writing at the wrong time triggers a Transfer Error interrupt

3. **The Fix**: The simple addition of `&& chan->desc->num_sgs > 2`
   condition prevents unnecessary updates when there are exactly 2
   periods, as the hardware automatically toggles between the two pre-
   configured buffers.

## Why This Is a Good Backport Candidate

1. **Clear Bug Fix**: This fixes a specific hardware-related bug that
   causes Transfer Error interrupts, which can disrupt DMA operations
   and potentially cause system instability.

2. **Minimal and Safe Change**: The fix is a single-line conditional
   check that adds `&& chan->desc->num_sgs > 2` to line 747. This is:
   - Very small in scope (1 line change)
   - Low risk of regression
   - Only affects the specific case of DBM with 2 periods

3. **Hardware-Specific Fix**: The change addresses a specific STM32 DMA
   hardware behavior documented in the reference manual, making it
   necessary for proper operation on affected hardware.

4. **No Architectural Changes**: The commit doesn't introduce new
   features or change the driver's architecture - it simply prevents an
   unnecessary operation that violates hardware constraints.

5. **Production Impact**: Transfer Error interrupts can cause DMA
   streams to be automatically disabled (as mentioned in the commit
   message), leading to data transfer failures in production systems
   using cyclic DMA with 2 periods.

6. **Clear Error Path**: Looking at the interrupt handler (lines
   804-809), unhandled status bits including TEI (Transfer Error
   Interrupt) result in error messages and potential channel disabling,
   which this fix prevents.

## Code Analysis Confirms the Fix

From the code analysis:
- Line 1207 shows DBM is enabled for multi-period cyclic transfers
- Lines 593-595 show initial setup correctly configures both SM0AR and
  SM1AR
- Line 606 shows `stm32_dma_configure_next_sg()` is called during
  initial transfer setup
- The problematic line 748 (now 747) was updating memory addresses
  unnecessarily for 2-period DBM transfers

The fix ensures that for 2-period DBM transfers, the hardware's
automatic toggling mechanism is used without software intervention,
preventing Transfer Error interrupts while maintaining correct operation
for transfers with more than 2 periods.

 drivers/dma/stm32/stm32-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/stm32/stm32-dma.c b/drivers/dma/stm32/stm32-dma.c
index 917f8e922373..0e39f99bce8b 100644
--- a/drivers/dma/stm32/stm32-dma.c
+++ b/drivers/dma/stm32/stm32-dma.c
@@ -744,7 +744,7 @@ static void stm32_dma_handle_chan_done(struct stm32_dma_chan *chan, u32 scr)
 		/* cyclic while CIRC/DBM disable => post resume reconfiguration needed */
 		if (!(scr & (STM32_DMA_SCR_CIRC | STM32_DMA_SCR_DBM)))
 			stm32_dma_post_resume_reconfigure(chan);
-		else if (scr & STM32_DMA_SCR_DBM)
+		else if (scr & STM32_DMA_SCR_DBM && chan->desc->num_sgs > 2)
 			stm32_dma_configure_next_sg(chan);
 	} else {
 		chan->busy = false;
-- 
2.39.5


