Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C72ACA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 16:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KcCpnBLU5SW4Qcwjb69jiEIVlUGumwXne/sA34CSyLE=; b=u4q46VUbMiINOC0jS7/eB76tDU
	KRA03QtB+1vqAXJsmzb7JpfkF0ZnZXZ4jIP5RMfquBHRgv0xMEUP3h8hBIptBjQwqjvis99WaIRQ0
	eMJhGLN9et+XvOcpwCXQVRaqXnq60fL75StsqFduXGUX53n2/CBeu5oPZULBoxtx9RJBIuGHpUXcX
	tXQfXLf01ImaaH7jNVCdn/rsUXQKoNQfJbSxmCzDcC1U6DpQbb/CaLvKfFQ2hapTNPa4vBMjS5xrB
	dZv9UxG7dS/qTzG6cW8wyZuLyAqfMxURWLQ7HSKinh4/xbrGnYsFoaOdAVB0ICUwSbvYVPjQPiT0S
	OutgbKfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upqfA-00000004xTY-0LDl;
	Sat, 23 Aug 2025 16:00:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upqcV-00000004wsr-3K6M
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 15:57:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A34DC5C4D22;
	Sat, 23 Aug 2025 15:57:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32D1FC4CEE7;
	Sat, 23 Aug 2025 15:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755964650;
	bh=0XuIgGw0B2/H3cOMG5TY7c8D1m3XnC9XDsKnG2GChy8=;
	h=From:To:Cc:Subject:Date:From;
	b=d+eMjV70Mk0uZnsqOzD2NOWsm7XUzl02UNnvcJIZi1lBB+/+6we7LqsOzXAWMI/sD
	 NYEuKrT+DCb30sVv4a6fBv+9V1wdpbAW/c6MMXCwNXuKX6usZVTQTCYK42RH3DJjwM
	 FbQ3rpcfDTzfTQFIWQz5N6QrjTYgsbIM0kNFxDsUozcYBpm08MqOF0ik+I7v3hyFT1
	 MhNRomCend1nsP3UXJ40dtY5tV2/5esbwidDrBtHZMWaT959ikcOKVMl69vg/eS4S+
	 /p0F7+o+S/oMm/WvH2fTAl6+XVbYiSarWUkLMnt7OASCIJ4IbYNJ0CcxGVPyv9zrJd
	 ymTk14LPL7moA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/14] dmaengine: dma350: Support slave_sg, cyclic and DMA-250
Date: Sat, 23 Aug 2025 23:39:55 +0800
Message-ID: <20250823154009.25992-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_085731_875496_F711F3BD 
X-CRM114-Status: UNSURE (   6.56  )
X-CRM114-Notice: Please train this message.
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

This series firstly does some cleanups, then add support of
device_prep_slave_sg and device_prep_dma_cyclic to DMA-350. 

Lastly, add support for ARM DMA-250 IP. Compared with DMA-350, DMA-250
is a simplified version. They share many common parts, but they do
have difference. Add DMA-250 support by handling their difference by
using different device_prep_slave_sg, device_prep_dma_cyclic and
device_prep_dma_memcpy. DMA-250 doesn't support device_prep_dma_memset.


Jisheng Zhang (14):
  dmaengine: dma350: Fix CH_CTRL_USESRCTRIGIN definition
  dmaengine: dma350: Add missing dch->coherent setting
  dmaengine: dma350: Check vchan_next_desc() return value
  dmaengine: dma350: Check dma_cookie_status() ret code and txstate
  dmaengine: dma350: Register the DMA controller to DT DMA helpers
  dmaengine: dma350: Use dmaenginem_async_device_register
  dmaengine: dma350: Remove redundant err msg if platform_get_irq()
    fails
  dt-bindings: dma: dma350: Document interrupt-names
  dmaengine: dma350: Support dma-channel-mask
  dmaengine: dma350: Alloc command[] from dma pool
  dmaengine: dma350: Support device_prep_slave_sg
  dmaengine: dma350: Support device_prep_dma_cyclic
  dt-bindings: dma: dma350: Support ARM DMA-250
  dmaengine: dma350: Support ARM DMA-250

 .../devicetree/bindings/dma/arm,dma-350.yaml  |   6 +
 drivers/dma/arm-dma350.c                      | 909 ++++++++++++++++--
 2 files changed, 852 insertions(+), 63 deletions(-)

-- 
2.50.0


