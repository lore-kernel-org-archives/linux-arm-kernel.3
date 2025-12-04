Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 046ABD1D884
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 08:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KdukO+jCVeO7MfOhiI5I7M3XN5ls0yi92bE5VsY2lBI=; b=xpw6y0OBqicKtBZbcIrFU6qflI
	V9+R1CW+LVk5bMzP7Yjo3bpaAN7ADtemI62oJp/FdhFscGe4W9ukLKSeQyf96OFzxkJ1t9tVTy4LY
	5Eoqz6lcA7z7qj2MgCtm76Jy/1AjdNRp+80yfAxQYmGwWNdqDWsVQBrA5I6PuK8Gb/fiLnMy9boVP
	eZrxmmmEJT9NeQvmmpMz0m5W8gDpCb0Mky1uFd9b2KDT79C0axa0TWwdNfGSxYCcSpFO9tGlljKjm
	0wyLzViwfXLc2vSTrcoegB7zsx42Ip8mKkkb8aMHZ3HKfNBinH0pbwoBc8aJ0vYVtM/HMSpDX4CAB
	9YWS4AdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR4R1-00000007ebb-0r4S;
	Thu, 04 Dec 2025 08:11:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR4Qz-00000007eaM-43eD;
	Thu, 04 Dec 2025 08:11:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6652D60197;
	Thu,  4 Dec 2025 08:11:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA859C4CEFB;
	Thu,  4 Dec 2025 08:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764835889;
	bh=RIU6GkpCLhhyvpG/pii7imXnivFO6h+OFuTntfyksk8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GHlnlNK+/AjvnPai1eCAvyd7kjq5CyI7lV/hMgNTpWgx46Ip+iAZASjqaWf3eBnAL
	 yUNUVEXBvvH+XBLGFdB7bkrbrvC7iYXlb2H1oppbHDbrrGthsDU4iriGWazGZMO81L
	 5mjdRRbg6lxBSdpFHw9+yW0W5cRMNOjM3Tr6XVj7K2L0HrKJswgdPffoX2D0z9kJMT
	 q/srkHsuCjDX/To4JMKpUhidy85K0PdOAv/wbM7He6ivNGfDh0aijKGEYS5YhnUH1s
	 sU1mTTiIgLvq3xXSfyEUmMpV8/u5EB3G1qpUwh4vsi4B1PgNSeocj0h7/nfszJWfu2
	 9YjN2uG3ezZqg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 04 Dec 2025 09:10:44 +0100
Subject: [PATCH mt76 02/11] wifi: mt76: npu: Add missing rx_token_size
 initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-mt76-npu-eagle-offload-v1-2-7819c52c0893@kernel.org>
References: <20251204-mt76-npu-eagle-offload-v1-0-7819c52c0893@kernel.org>
In-Reply-To: <20251204-mt76-npu-eagle-offload-v1-0-7819c52c0893@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Hui Ma <hui.ma@airoha.com>
X-Mailer: b4 0.14.2
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

Add missing rx_token_size initialization for NPU offloading.

Tested-by: Hui Ma <hui.ma@airoha.com>
Fixes: 7fb554b1b623 ("wifi: mt76: Introduce the NPU generic layer")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/npu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/npu.c b/drivers/net/wireless/mediatek/mt76/npu.c
index ec36975f6dc946f5dbc5ab6029b0574fbc602615..9679237f739842bd44497e0b1022a868cb3a0d6c 100644
--- a/drivers/net/wireless/mediatek/mt76/npu.c
+++ b/drivers/net/wireless/mediatek/mt76/npu.c
@@ -457,6 +457,7 @@ int mt76_npu_init(struct mt76_dev *dev, phys_addr_t phy_addr, int type)
 	dev->mmio.npu_type = type;
 	/* NPU offloading requires HW-RRO for RX packet reordering. */
 	dev->hwrro_mode = MT76_HWRRO_V3_1;
+	dev->rx_token_size = 32768;
 
 	rcu_assign_pointer(dev->mmio.npu, npu);
 	rcu_assign_pointer(dev->mmio.ppe_dev, ppe_dev);

-- 
2.52.0


