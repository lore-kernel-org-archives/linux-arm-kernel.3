Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B331CCA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 17:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fpv1SoLY/N77JkIb142ZPgXdcdlyIxxhftHl3vgHLBI=; b=PZhxwHVjGfkn6/FGBnzVblpqZh
	IitZKtQ6aLe7eXCckz32DRsAKnALu0sqe05gEmcdBcly17RJ5+whYetJ6CzApW6nUN+PNkX7MPkRm
	saGqLrAIt7hVsRid7cbXz1WmNWDrKHz9PADEj/i556MHgpBCOglSSFl//Ipabkpn7cdAre1sanFUq
	AGDnvpEjLBA1OWZz6j+vA5zRg94lvXAOixknaDMdSuacpypQCXWPDEgBsLSUiRGsSQ38PjuGtiS6a
	ElOxr8elM1oC2Fxp7Dsr6OeHQIbSJnLMrdePtqm0UylJ4VJde1m/YWhspVrXqwFiV5qNLMyN8LW2O
	Mhjf0hdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up8xK-0000000031s-34sQ;
	Thu, 21 Aug 2025 17:20:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up59e-0000000H1Cm-0ANO;
	Thu, 21 Aug 2025 13:16:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4B3F761154;
	Thu, 21 Aug 2025 13:16:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B6A8C4CEED;
	Thu, 21 Aug 2025 13:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755782193;
	bh=W6N68IbV0jiwtH3MAFqH+TY6TjH35pe5n2zoPQK40aQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=puWzSoEpl5txlQgwkEJ+M1z2g/8hLX3dy1x+tFqG+fnLrzJWbyYpACswAVVLECW1C
	 TwOgeF02ptbWNJgxQIiFA99AR3L6y3TX2AxTUmNS1yH8kjoprPdALFxWNngZA8giHh
	 3f4Lv4y2ifDG1ZKD1M4kJwTVC2bbRc0QER8FE5HJuAXXL3gryrF07HHQIO9kRMWz6x
	 a1o0tYlKUDpKIkp1hQqzF5Lg20laqcfpicPHj5zHYdMJCh+4i4I3r0Rf3EqypKiCUk
	 h5SQfDjPAaua5wBKkgO+Fmj/71E2cEjsm2c7jAUpoO+cQrpgmj0MSxRjtC1QYfseYf
	 uXFLjs27W1QCA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 21 Aug 2025 15:14:54 +0200
Subject: [PATCH mt76 02/14] wifi: mt76: Remove q->ndesc check in
 mt76_dma_rx_fill()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-mt7996-rro-rework-v1-2-6c8477ad969f@kernel.org>
References: <20250821-mt7996-rro-rework-v1-0-6c8477ad969f@kernel.org>
In-Reply-To: <20250821-mt7996-rro-rework-v1-0-6c8477ad969f@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sujuan Chen <sujuan.chen@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
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

Remove q->ndesc check in mt76_dma_rx_fill routine since this is already
done in mt76_dma_rx_fill_buf().

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/dma.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index 25c26ff8c8e24352f2bb31c6e185e628a56f609b..18c2a2de59897d038392a00ed5fb5a0de188ac95 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -671,9 +671,6 @@ int mt76_dma_rx_fill(struct mt76_dev *dev, struct mt76_queue *q,
 {
 	int frames;
 
-	if (!q->ndesc)
-		return 0;
-
 	spin_lock_bh(&q->lock);
 	frames = mt76_dma_rx_fill_buf(dev, q, allow_direct);
 	spin_unlock_bh(&q->lock);

-- 
2.50.1


