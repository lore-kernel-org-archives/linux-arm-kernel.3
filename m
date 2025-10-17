Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC7A6CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 08:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QI7GMY/pzPa/QixYOk/uT5WajOcRrWraSnDxp2PPsdg=; b=x2vCAlyQGUxN8IVgyy5AWk79KY
	qOeshXyUCuXqustssUZAsmoPBS6v87Zc5oa9NXUme77Kqlqd8nsTgzudb0LTaIzU4jNR4mvTMdy5S
	VrfLHlzJl38okV7Ek2+aeZo66J6hlBc692BhupAUzUeNIYQ7mYcbJdwM9hrXt8M/gfTab+k7By5+U
	n3/0NT11G6pHUYnJS9IRlwgyr4+wt8QgROZOdndA1SLLRM/li/Wcuov2qst6nrKvQuMQSjUD+c/fN
	n1Vixp0wXJeF8crosCFeKicbqcKuRrBuoE8cuggmRNDVmVwKRpBWvsvl4lTXQtGcvF8gkkcvBTp6p
	EjFHIkMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9gAu-000000078sy-14sr;
	Fri, 17 Oct 2025 08:51:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9gAr-000000078pT-00FL;
	Fri, 17 Oct 2025 08:50:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A0B054382E;
	Fri, 17 Oct 2025 08:50:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B0BBC4CEF9;
	Fri, 17 Oct 2025 08:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760691056;
	bh=DQkSsVMaYGDVVkEmwMPKfQjlm454VZVR4XhcU5KYZws=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ampTKbWXfehp3hE+N6k+pgBN+Yx9wX0S4UbMCmQjhOYqmt6y0I17yBMkT/ygIqQ3/
	 +4Y+xVbYcLogjmdP97tFVbzLJwH7IeK1ptuyFkZ5y4jLQvQCRaWFoTrk1D9QXzcw7T
	 17KbYmEueM4aSjEAL9fmzjH+nmLuuC/PVOqqS6ttxyk0C93QiNQw4O0HmPeowU9TPY
	 fKpOPbosc7RR7JNUMb/axerIHY8Aph9/Bd3KBD2V6SeF7wSr0xy0n4HaxwCJXohjcZ
	 W4tv3hETiv4qHHVRTcWwe5O8Bl/5jBc/b9s+0H9jFMPneusyhkr6k1b7tOZSqDQ10+
	 naMyTFlRgLagQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 17 Oct 2025 10:50:30 +0200
Subject: [PATCH mt76 v2 2/5] wifi: mt76: Add mt76_dev pointer in mt76_queue
 struct.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-mt76-npu-devel-v2-2-ddaa90901723@kernel.org>
References: <20251017-mt76-npu-devel-v2-0-ddaa90901723@kernel.org>
In-Reply-To: <20251017-mt76-npu-devel-v2-0-ddaa90901723@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_015057_072524_C3D143A9 
X-CRM114-Status: UNSURE (   9.59  )
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

This is a preliminary patch to enable traffic forward offloading via the
Airoha NPU module available on the Airoha EN7581 SoC.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/dma.c  | 1 +
 drivers/net/wireless/mediatek/mt76/mt76.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index 2dd3bd990fbaf6b98f619be45ef4be0d5465293e..a4c1b6c66488386805c4bb21fbd11d7857f69e4d 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -794,6 +794,7 @@ mt76_dma_alloc_queue(struct mt76_dev *dev, struct mt76_queue *q,
 	q->ndesc = n_desc;
 	q->buf_size = bufsize;
 	q->hw_idx = idx;
+	q->dev = dev;
 
 	size = mt76_queue_is_wed_rro_ind(q) ? sizeof(struct mt76_wed_rro_desc)
 					    : sizeof(struct mt76_desc);
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index e7a00669fe017e39b11cd38b603d4026f74f95b0..b0ff65427088128a6a83557b195f0e98aa012b32 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -247,6 +247,7 @@ struct mt76_queue {
 	__le16 *emi_cpu_idx;
 
 	struct mtk_wed_device *wed;
+	struct mt76_dev *dev;
 	u32 wed_regs;
 
 	dma_addr_t desc_dma;

-- 
2.51.0


