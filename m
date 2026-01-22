Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34155C44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 10:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OWQXRb+wrUqKsVLyZ1b9DiVN3Tbgp1d30g/l8Fo8atM=; b=wTVc6ZEtZFkKdt6bV7IQi0UBA2
	4VkWmrfzXExtQq7CLb/XAMhpH9NhxfIOyxdD1YmCol8aeB5wiO7pIokxe7x1FW7TFRS6PVW+yVyre
	FepRVLeSz5+gCPYgWFCvBd3JlVi58ab8GQwhEoWhXzrQNAEr2rXOefcFm35Q4J0TPn2aEKUJrR6J2
	Ajfo4L+pMYopnM99giC02XnhW5EwYORX1iyVdo4PNFMhpOeNpRl0ztm0WrkkL3ZsVIhRj5zTBuQeY
	+1mtvMAeu9QvbJtLUsxpDtO27b8ex7wr+p7tPgTwWPw/lZnl6nJCt6xTYuYFMMMgcjkv19/ixUi2D
	oAA2nqYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis6w-00000006rWE-2anV;
	Thu, 22 Jan 2026 10:40:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis6r-00000006rRe-33dU;
	Thu, 22 Jan 2026 10:40:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=OWQXRb+wrUqKsVLyZ1b9DiVN3Tbgp1d30g/l8Fo8atM=; b=Jg1AdmbUsg2yhEqmALrAEhV1zY
	jXEmZmBoSJ0lSJlMSFJNrWFgdRS+r1ZtIQZFIrIMREza3ssUZakicCRNPlPWBGmeUbf4mQwK7xJz4
	CQKtyXshLU/FcwFDEZbr/iBPz0L3WFsgKmOgGmp9OUhST1Z3zl0TgbRXA/jewOQpeIPlBabI9vMZX
	ZcwUEGDLin/xPq+5XC7/C4k77sczeOzlaKINJhl+dH7jV8R04f8v1/zHf6TBVpVJWerQ7ZglJYfRY
	i2RcoEeleZ205C7A8Ic2jCCm7tVi2YPRmpCOcwv/LyII8tgWyAqRnQJJqEWPNN5/9ihFKxfaPyIjt
	wvWAHhFQ==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis6o-00000000AIi-33NN;
	Thu, 22 Jan 2026 10:40:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3B04E40A81;
	Thu, 22 Jan 2026 10:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 914C2C19424;
	Thu, 22 Jan 2026 10:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769078411;
	bh=LGlHfWU1mnmzGexsrx0OLfKC9d+s8LQ2kvnlG0BfKX0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RdQPLFdzgTfEPEcBLzZ+SJKzH3s5nUPysANWagPi79h8i9NAGzdi9Tczp90v65db/
	 fkfk0t0EWGN3IaZCdhWP4q7e4tRANYHUUMBXS61fUuZnllBQ/CzFzDt1OtkFXh60eG
	 D/GzJx1vUaF+tpRFGHr1vvRmuWh1t1wp2HDZ7OBIc6Aq++n6YaTygziPx8WYH5ASg4
	 zj/xnfzLEzhNNc9Bqt2F9k1pOQn4dcXVdWBUHsEi9TG4DYhsnuPSI9ZfFrSU6m94LX
	 X+LDFHQeoelAPCaMi0YzD44P6PZ4B9LlNcxc7zrAXkHhg1gl2bWNDxuZVBVtUlqxSk
	 of3frYbsvWMUQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 22 Jan 2026 11:39:46 +0100
Subject: [PATCH mt76 v2 02/17] wifi: mt76: npu: Add missing rx_token_size
 initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-mt76-npu-eagle-offload-v2-2-2374614c0de6@kernel.org>
References: <20260122-mt76-npu-eagle-offload-v2-0-2374614c0de6@kernel.org>
In-Reply-To: <20260122-mt76-npu-eagle-offload-v2-0-2374614c0de6@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Kang Yang <kang.yang@airoha.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_104015_118439_1967572C 
X-CRM114-Status: UNSURE (   7.63  )
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

Add missing rx_token_size initialization for NPU offloading.

Fixes: 7fb554b1b623 ("wifi: mt76: Introduce the NPU generic layer")
Tested-by: Kang Yang <kang.yang@airoha.com>
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


