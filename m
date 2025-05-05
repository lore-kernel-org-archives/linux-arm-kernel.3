Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 219EFC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 22:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oJbbJMJfNxvcBYgXphU1JALxHYZfKY3jLo/jdotBSMc=; b=yl5WiW+CtrV4KgSpC8TAIyryp2
	LXS542uTOPZuGCVjP37ub3Ixn5BdF16oet2lXK4OE0mMWeqee8IXEpatsWD4FN98GmVQtnWUxIvuT
	rggyNzG3cKbwhWPmMshJeqd+LNydwLPSrKUARpUcehHZ+cEnNfJKd0iqyT5ERQ/+iTW/Zfr+xV4a1
	aAQyW3JgdVaVaPqcFEJ0EB+nafa6cZuSyCjzn2W0X65CsH7qRCzBAR7H8YRi/CTsLzfltoAS3q5/S
	jrjskPi9Ub9AVa4E4S+iHHreX4oTO4xCC4bGBFTCu6dMXEcR8mzJhcPKVsea2L0H6BRye85+v99KL
	mThLMENQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4DO-00000008jpe-1zGs;
	Mon, 05 May 2025 22:23:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC46A-00000008hoV-2Jk6;
	Mon, 05 May 2025 22:15:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0880E629C0;
	Mon,  5 May 2025 22:15:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B574C4CEE4;
	Mon,  5 May 2025 22:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483341;
	bh=46rfAidHetS8cBL29WXOKNNYtOLFJa/GrAJQc/Fxh7E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G0i+0pGloDIEGN49GFcOTBHbIJoYk8lTCwO4fH0iXZ0+lp7RXpJrEWc3kcmqhYfpD
	 h/XI9BtStxjvLHmTWcXZy25b8FIDqhMxQImQVBTa8r/Wzpq0i5wbK8dlwBBwXOur3b
	 soLOdA9M0tqHr+9lSrWe9pXXqceo9mEvHHscWxoMY8jzwcPTKhlNJEKUW0ZlGceRXt
	 LGB/eGGftNIxassEbdc8rmRoyMLur87gRzJpwxOcF3MVvidFogxFH5oOeFgBF/IAaj
	 iubY81ha5Oo9CceUBbxTJX68mkL2XGsZmtqqrkYrVmWZrWZBQGCO5rbSQPZlRIkTcx
	 Z11OqKMaC2fyQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Sean Wang <sean.wang@mediatek.com>,
	Pedro Tsai <pedro.tsai@mediatek.com>,
	Felix Freimann <felix.freimann@mediatek.com>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	Sasha Levin <sashal@kernel.org>,
	marcel@holtmann.org,
	luiz.dentz@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-bluetooth@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 043/642] Bluetooth: btmtksdio: Prevent enabling interrupts after IRQ handler removal
Date: Mon,  5 May 2025 18:04:19 -0400
Message-Id: <20250505221419.2672473-43-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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

From: Sean Wang <sean.wang@mediatek.com>

[ Upstream commit 6ac4233afb9a389a7629b7f812395d1d1eca5a83 ]

Ensure interrupts are not re-enabled when the IRQ handler has already been
removed. This prevents unexpected IRQ handler execution due to stale or
unhandled interrupts.

Modify btmtksdio_txrx_work to check if bdev->func->irq_handler exists
before calling sdio_writel to enable interrupts.

Co-developed-by: Pedro Tsai <pedro.tsai@mediatek.com>
Signed-off-by: Pedro Tsai <pedro.tsai@mediatek.com>
Co-developed-by: Felix Freimann <felix.freimann@mediatek.com>
Signed-off-by: Felix Freimann <felix.freimann@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/bluetooth/btmtksdio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index bd5464bde174f..edd5eead1e93b 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -610,7 +610,8 @@ static void btmtksdio_txrx_work(struct work_struct *work)
 	} while (int_status || time_is_before_jiffies(txrx_timeout));
 
 	/* Enable interrupt */
-	sdio_writel(bdev->func, C_INT_EN_SET, MTK_REG_CHLPCR, NULL);
+	if (bdev->func->irq_handler)
+		sdio_writel(bdev->func, C_INT_EN_SET, MTK_REG_CHLPCR, NULL);
 
 	sdio_release_host(bdev->func);
 
-- 
2.39.5


