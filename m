Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FDCBD4922E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 14:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=orMLRxEgPaCVt+DUcYSRwYW0pCq8JjJqS0YZ0bC7OiQ=; b=3yJiMTLc/vOxbqN7Se/TzME+VY
	reJ+QG3DzR350COblHNK28aQcKe/KYB4SX3ocK3JSvr1B5C1dRFh4pGeB0p8WDI3E8rCPlW8RwTYy
	7ZqntYEOJ67m08/2PT1K9ODNHGRmI2NG/20tdmHPcVuUTCE26OPo7IzbtSLEJeJX4EQ3zfnmST14P
	NjnoAzwApXTKLw2e7wVsCsxWbQxdaIbJC9AILDJ+CZOb76CJJ4rRNMmEDGhWDKDcpDAMWXikACGFX
	bxRXClDTPhry0pGS0WfJFrAz407/ebzZxmfxeg/R4QNUSWq9T54n0kHK56inWBU4KhvyOs5xg7K+2
	W8/Se/fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD3CU-00000009pyV-2bPw;
	Mon, 18 Nov 2024 14:58:02 +0000
Received: from mail-m121150.qiye.163.com ([115.236.121.150])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD3BX-00000009pnA-2IUi;
	Mon, 18 Nov 2024 14:57:05 +0000
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 317a7f35;
	Mon, 18 Nov 2024 22:56:48 +0800 (GMT+08:00)
From: Jon Lin <jon.lin@rock-chips.com>
To: broonie@kernel.org
Cc: linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	heiko@sntech.de,
	jon.lin@rock-chips.com,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org
Subject: [PATCH] spi: rockchip-sfc: Embedded DMA only support 4B aligned address
Date: Mon, 18 Nov 2024 22:56:46 +0800
Message-Id: <20241118145646.2609039-1-jon.lin@rock-chips.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhoaTFZCT01PTh4ZSEpOSk5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a933fc6ba8d09d9kunm317a7f35
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6P006SBw*SzIhQ1ELSzkPMyov
	GBgwCkxVSlVKTEhKQk9KQ0tCTU1PVTMWGhIXVREUFVUXEhU7CRQYEFYYExILCFUYFBZFWVdZEgtZ
	QVlOQ1VJSVVMVUpKT1lXWQgBWUFDQ083Bg++
DKIM-Signature: a=rsa-sha256;
	b=fhKzbRWaLMBVXGi5F1pcCy/LUI0n+JSbCyVA5a8UCaMGcee5HZb4Zw3KEK74/cUF6oOxDzAJB/Mo6VzGT9cTygrEXl87Deas3Xwkx9wSNw/7e1NFRQ/Xtnf5UsA+posFPdKhOsGodusVnV5SmP5C8KpDEs1ICFKYMi+tNV6vXCQ=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=orMLRxEgPaCVt+DUcYSRwYW0pCq8JjJqS0YZ0bC7OiQ=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_065704_142802_81DA00F1 
X-CRM114-Status: UNSURE (   9.00  )
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

Controller limitations.

Signed-off-by: Jon Lin <jon.lin@rock-chips.com>
---

 drivers/spi/spi-rockchip-sfc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-rockchip-sfc.c b/drivers/spi/spi-rockchip-sfc.c
index 316e3db88492..69d0f2175568 100644
--- a/drivers/spi/spi-rockchip-sfc.c
+++ b/drivers/spi/spi-rockchip-sfc.c
@@ -503,7 +503,7 @@ static int rockchip_sfc_exec_mem_op(struct spi_mem *mem, const struct spi_mem_op
 	rockchip_sfc_adjust_op_work((struct spi_mem_op *)op);
 	rockchip_sfc_xfer_setup(sfc, mem, op, len);
 	if (len) {
-		if (likely(sfc->use_dma) && len >= SFC_DMA_TRANS_THRETHOLD) {
+		if (likely(sfc->use_dma) && len >= SFC_DMA_TRANS_THRETHOLD && !(len & 0x3)) {
 			init_completion(&sfc->cp);
 			rockchip_sfc_irq_unmask(sfc, SFC_IMR_DMA);
 			ret = rockchip_sfc_xfer_data_dma(sfc, op, len);
-- 
2.34.1


