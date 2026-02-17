Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA09E9A037
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 18:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Date:From:To:Cc:
	Message-Id:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3XPu6FDZWTL9k9evNBDfynBLXPebQkKUMud/CTiGXZg=; b=z22/4HxKpxxkNreLuj8pF989SY
	hSmZwppkmnu4XXsVCyNxZ57O3NcDYzuy+GTdKQCQ24uxt6KBpukPKhWcZxip+K5l1410RPKgGw0lM
	dylBbszksVWgkGdI3EV84u9Pbvk7sPbAm0fcFfTSqELVpusSAZgf98rzHjeBHQkpAUApMMe7kcLVD
	vsrWTOqkj0KGirui6unWMsO6rYYozN1wAvYm/5llhhjHyxzE7Yb8Yii9VrGqIgLmjUiFRS9XuzDHk
	rrMuJOgVFa5xXf444Ur4XoQbit/C3SxzGrRI8lU/poa9aNl9sxR0JT2IIfzWyxAuUlZFQzsJZ8hc4
	gJ2fmdig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsQGP-00000008m0s-3aYc;
	Tue, 17 Feb 2026 18:57:37 +0000
Received: from www522.your-server.de ([195.201.215.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsQGN-00000008m0U-0xuH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 18:57:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=folker-schwesinger.de; s=default2212; h=Subject:Date:From:To:Cc:Message-Id:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References;
	bh=3XPu6FDZWTL9k9evNBDfynBLXPebQkKUMud/CTiGXZg=; b=JRfLUWQaY0vZHtfEND2YNrWnM8
	RsbuEPXFiphPcsv0LWCSVj87pq7/QJA2OAWom92TMdhyGzceM0hZBeIyxYf/6aF5krduSxa/hYMrf
	WJP1kLRapoRzkamvmVnALASUfHRkSjQhzrfaIKcHe9QHlVqJhny1KCSaJAzj0PlBPxvfmsO2mnYdD
	ziAvN9VAzCBpmmevxAp2El5GQrytN/OtI4SSZGrahhQ8U1z7fMLef0wSQx1SbcuDTm2TAmAyyxtUI
	y7kn32mave0+nWSanEeSsYQnYn75/wYB+romOM9N5UBrq1CryI1/ixbFXhMGBDs7lAfB+0xRxz/ps
	dt8pcHGw==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www522.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1vsQGA-0001lc-2z;
	Tue, 17 Feb 2026 19:57:22 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1vsQGA-0006Eh-0B;
	Tue, 17 Feb 2026 19:57:22 +0100
Message-Id: <DGHGTCJRRZCW.9TGXQW44V6RR@folker-schwesinger.de>
Cc: "Vinod Koul" <vkoul@kernel.org>, "Frank Li" <Frank.Li@kernel.org>,
 "Michal Simek" <michal.simek@amd.com>, "Suraj Gupta"
 <suraj.gupta2@amd.com>, "Thomas Gessler"
 <thomas.gessler@brueckmann-gmbh.de>, "Radhey Shyam Pandey"
 <radhey.shyam.pandey@amd.com>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, "Rahul Navale" <rahulnavale04@gmail.com>
To: <dmaengine@vger.kernel.org>
From: "Folker Schwesinger" <dev@folker-schwesinger.de>
Date: Tue, 17 Feb 2026 19:49:13 +0100
Subject: [RFC PATCH] dmaengine: xilinx_dma: Fix per-channel direction
 reporting via device_caps
X-Virus-Scanned: Clear (ClamAV 1.4.3/27915/Tue Feb 17 08:24:54 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_105735_610191_076E565F 
X-CRM114-Status: GOOD (  10.87  )
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

Since commit 7e01511443c3 ("dmaengine: xilinx_dma: Set dma_device
directions") all channel directions are aggregated into
dma_device.directions so that dma_get_slave_caps() works for IIO
DMAEngine buffers.

However, this caused a regression in ASoC audio on ZynqMP platforms,
that causes cyclic playback to fail after the first buffer period,
because ASoC dmaengine PCM expects fixed per-channel direction reporting
from dma_get_slave_caps().

Implement optional device_caps() callback and override caps->directions
with the channel's fixed direction. This keeps device-wide direction
reporting for IIO intact while restoring correct per-channel semantics
for ASoC.
Other dma_slave_caps fields are left unchanged from their respective
values initialized from dma_get_slave_caps(). In case there should ever
be the need to override other fields, these can be added later.

Fixes: 7e01511443c3 ("dmaengine: xilinx_dma: Set dma_device directions")
Cc: stable@vger.kernel.org
Reported-by: Rahul Navale <rahul.navale@ifm.com>
Closes: https://lore.kernel.org/dmaengine/20260211140051.8177-1-rahulnavale04@gmail.com/T/#u
Closes: https://lore.kernel.org/dmaengine/CY1PR12MB96978AEBD6072FC469DFEAF1B762A@CY1PR12MB9697.namprd12.prod.outlook.com/T/#u
Signed-off-by: Folker Schwesinger <dev@folker-schwesinger.de>

---
Posting this as RFC because I can't verify this actually fixes the
regression as I don't have a ZynqMP. So Rahul, could you test if this
fixes the issue and report back? BR F.
---
 drivers/dma/xilinx/xilinx_dma.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index 64b3fba4e44f..bdd16173d762 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -1711,6 +1711,19 @@ static void xilinx_dma_issue_pending(struct dma_chan *dchan)
 	spin_unlock_irqrestore(&chan->lock, flags);
 }
 
+/**
+ * xilinx_dma_device_caps - Write channel-specific DMA slave capabilities
+ * @dchan: DMA channel
+ * @caps: DMA slave capabilities of DMA channel
+ */
+static void xilinx_dma_device_caps(struct dma_chan *dchan,
+				   struct dma_slave_caps *caps)
+{
+	struct xilinx_dma_chan *chan = to_xilinx_chan(dchan);
+
+	caps->directions = chan->direction;
+}
+
 /**
  * xilinx_dma_device_config - Configure the DMA channel
  * @dchan: DMA channel
@@ -3292,6 +3305,7 @@ static int xilinx_dma_probe(struct platform_device *pdev)
 	xdev->common.device_tx_status = xilinx_dma_tx_status;
 	xdev->common.device_issue_pending = xilinx_dma_issue_pending;
 	xdev->common.device_config = xilinx_dma_device_config;
+	xdev->common.device_caps = xilinx_dma_device_caps;
 	if (xdev->dma_config->dmatype == XDMA_TYPE_AXIDMA) {
 		dma_cap_set(DMA_CYCLIC, xdev->common.cap_mask);
 		xdev->common.device_prep_peripheral_dma_vec = xilinx_dma_prep_peripheral_dma_vec;

base-commit: ab736ed52e3409b58a4888715e4425b6e8ac444f
-- 
2.53.0

