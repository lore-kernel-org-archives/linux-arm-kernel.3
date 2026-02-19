Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53EE9E9A03B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 02:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CIikpPtHt/ZZ/kIbtNDThVM6mn2njpm15YiIrdURroA=; b=0pGGx0xxyA7Zx4RGKwreUNRfxp
	KQ5JUZZsZrqSFzgPqXfw4lWvy4+Z2o1fv7K4TshvRAp78/td7ysE1DQEWvQa3J70myPyVBhqO7G73
	BhMAlKsFE3gTu3MTx4jSaB2IMEskqhjfVHzkuGq6Z9YmECZvnZFQ0Cotl2USiQfxBpvp3sSLcJpXu
	5iSvnKf2e2oUboHTDPbp2nuCRlOx8eJAIxbfEXG+J4RUTPebX1F8akebToFc9bNPAHnLp5ZccSaLa
	aAeGM7DSLAz8jpAfrp4+Bk3cPsEa2hJos3FpxyMMnM05/Yx++bCuDTZPVPRoV//KpmICuATWsHjMD
	ZMk/E7VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vstQJ-0000000AjVU-0ibi;
	Thu, 19 Feb 2026 02:05:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vstQI-0000000AjV3-133r
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 02:05:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9076D61855;
	Thu, 19 Feb 2026 02:05:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00B13C19425;
	Thu, 19 Feb 2026 02:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771466715;
	bh=CJhzGH3sAa0J4fOkP0CpNIISd/xcJc3TRjy4YycFwTY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n74SW63m3g2vdXmFe3PM5znz6KRPmNRYMfgHOkvKjEl98qnQTDDxvmylU6XbUbAXg
	 lUdFncUSLM1ksgLt6Odpy0PbmiQaHrtGuGmuh89xzmS9EORRxSz2MMKLf7ZmbxGGuc
	 NloIThis473MS7v/DH5MkWbffUHpZNHXIJt4gVg6neLGGxKIhmPpYEBAdmfX9cb5Tv
	 /mAD+Hx9iaJvTjlGHOtnbrHRxbiXJj+RU54z2Ih3MwFJ7QRGq0NXCN1YBN7XV6jA72
	 kDGj6YPpYX5EfuWm7cHJDIahKfDHgHIeZkhjKffXO/9aa9wa5aozGF0UEn16vFabmX
	 QfO3OysVSxRRg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <clement.legoffic@foss.st.com>,
	=?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <legoffic.clement@gmail.com>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	Vinod Koul <vkoul@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	dmaengine@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.19-6.1] dmaengine: stm32-mdma: initialize m2m_hw_period and ccr to fix warnings
Date: Wed, 18 Feb 2026 21:04:16 -0500
Message-ID: <20260219020422.1539798-40-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260219020422.1539798-1-sashal@kernel.org>
References: <20260219020422.1539798-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Clément Le Goffic <clement.legoffic@foss.st.com>

[ Upstream commit aaf3bc0265744adbc2d364964ef409cf118d193d ]

m2m_hw_period is initialized only when chan_config->m2m_hw is true. This
triggers a warning:
‘m2m_hw_period’ may be used uninitialized [-Wmaybe-uninitialized]
Although m2m_hw_period is only used when chan_config->m2m_hw is true and
ignored otherwise, initialize it unconditionally to 0.

ccr is initialized by stm32_mdma_set_xfer_param() when the sg list is not
empty. This triggers a warning:
‘ccr’ may be used uninitialized [-Wmaybe-uninitialized]
Indeed, it could be used uninitialized if the sg list is empty. Initialize
it to 0.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Reviewed-by: Clément Le Goffic <legoffic.clement@gmail.com>
Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
Link: https://patch.msgid.link/20251217-mdma_warnings_fix-v2-1-340200e0bb55@foss.st.com
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

I can see `sg_len` is passed from the DMA framework's `prep_slave_sg`
callback. While the DMA framework generally doesn't call this with
`sg_len == 0`, there's no explicit guard against it in this function.
The `stm32_mdma_alloc_desc` with `sg_len == 0` might succeed (allocating
a descriptor with 0 nodes), allowing execution to reach
`stm32_mdma_setup_xfer` with an empty list.

### Verification

- **Read the actual code**: Confirmed `ccr` is used at lines 777-779
  after the for_each_sg loop, and if `sg_len == 0`, `ccr` is never
  initialized by `stm32_mdma_set_xfer_param()`.
- **Caller analysis**: `stm32_mdma_setup_xfer` is called from
  `stm32_mdma_prep_slave_sg` at line 809 with `sg_len` from the DMA
  framework - no explicit guard for `sg_len == 0`.
- **m2m_hw_period**: Confirmed at lines 737-738 and 749-750/758-759 that
  it's only used when `chan_config->m2m_hw` is true (false positive
  warning).
- **Risk assessment**: The change is a trivial initialization, zero
  regression risk.
- **Could NOT verify**: Whether any real-world code path actually passes
  `sg_len == 0` to `prep_slave_sg` (unverified, but defensive
  initialization is correct practice).

### Conclusion

This is a very low-risk fix that:
1. Silences compiler warnings (useful for clean builds)
2. Fixes a real (if potentially rare) uninitialized variable bug for
   `ccr`

The fix is trivially correct, one line, zero regression risk, and fixes
a genuine code correctness issue. While it's borderline because the
primary framing is "fix warnings" and the affected driver is
STM32-specific, the `ccr` uninitialized variable is a real bug that
could cause DMA hardware misconfiguration, and the fix has absolutely no
downside.

**YES**

 drivers/dma/stm32/stm32-mdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/stm32/stm32-mdma.c b/drivers/dma/stm32/stm32-mdma.c
index 080c1c725216c..b87d41b234df1 100644
--- a/drivers/dma/stm32/stm32-mdma.c
+++ b/drivers/dma/stm32/stm32-mdma.c
@@ -731,7 +731,7 @@ static int stm32_mdma_setup_xfer(struct stm32_mdma_chan *chan,
 	struct stm32_mdma_chan_config *chan_config = &chan->chan_config;
 	struct scatterlist *sg;
 	dma_addr_t src_addr, dst_addr;
-	u32 m2m_hw_period, ccr, ctcr, ctbr;
+	u32 m2m_hw_period = 0, ccr = 0, ctcr, ctbr;
 	int i, ret = 0;
 
 	if (chan_config->m2m_hw)
-- 
2.51.0


