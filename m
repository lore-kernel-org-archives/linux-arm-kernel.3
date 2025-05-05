Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD744C3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 22:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DocqIlg2wfH9mf8TBCSklKGxzyigmIXWWl6M1HKzwwg=; b=nZgShXg6/K74HdRKC5/QV1Ohm1
	1ulvViEvbAwGc/3oRWtNmrKbOX3aRLLW65PR4RQDpdo2CdROlfObzo/uuOGEL+HkpSnC4lkyFd5cO
	5fXFiULqY+ibm9VWZmf1fSmMP6Pb3yaianp+dMnovA3pt8m+AhQvnjSTJ29uvvxRsJeRldgT5ep3r
	iFT7Rp8+BpXKOzY+lT4BZSnNYODagBatofsRSf34MDSvX4b+/xZFcy95TMOPCUB8y2qOSGYiHUcJW
	BatRBr/A90qEMOZYlIz9I/+Y9w0JVqBwj5zBhXftrYH9JcxtZhI0PFJ/6JOEqPEhzMw/I24QArB64
	sm7CmaSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4fF-00000008sxk-1xQX;
	Mon, 05 May 2025 22:51:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC47p-00000008iJp-0pmn;
	Mon, 05 May 2025 22:17:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CB68C629C2;
	Mon,  5 May 2025 22:16:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF3B7C4CEF9;
	Mon,  5 May 2025 22:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483444;
	bh=MzX9AmNrEMzOaOZaVzfQFEUOLYHVPhdROtRvsA3H9+k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CvH/6fF5SgBsBjf0T/4CZx+Fco7uL9bHWUimJHlM586/J50+4lalJb74PD9SZJ7bN
	 8AA6TpylJ+RgKiRPfcJRocHwqgTUjW/1T+ayp3uJ7TrNaaa4MZkJaLmZJpJeexjbE2
	 WNp4vyQOiffaeRyR921TRD7obHTvTAC4pGp2Eq1zXcwT6SR7IgWFE2VNGL3kFXQzU3
	 hKqHerAWcxfktosKdALfl6IWIjaWIa5iiXv7WSA0TW1bZ+qzCFdJvHYtccfEgO6AZO
	 1TAE1TxC+OxYNwxA5RpsdirnMXNyJdCdCEfFxD1YsztKDyxMdTnuEzXIVdRaFrILNK
	 TsjLsvKyUd58w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Quan Zhou <quan.zhou@mediatek.com>,
	Felix Fietkau <nbd@nbd.name>,
	Sasha Levin <sashal@kernel.org>,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sean.wang@mediatek.com,
	mingyen.hsieh@mediatek.com,
	deren.wu@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 082/642] wifi: mt76: mt7925: fix fails to enter low power mode in suspend state
Date: Mon,  5 May 2025 18:04:58 -0400
Message-Id: <20250505221419.2672473-82-sashal@kernel.org>
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

From: Quan Zhou <quan.zhou@mediatek.com>

[ Upstream commit 2d5630b0c9466ac6549495828aa7dce7424a272a ]

The mt7925 sometimes fails to enter low power mode during suspend.
This is caused by the chip firmware sending an additional ACK event
to the host after processing the suspend command. Due to timing issues,
this event may not reach the host, causing the chip to get stuck.
To resolve this, the ACK flag in the suspend command is removed,
as it is not needed in the MT7925 architecture. This prevents the
firmware from sending the additional ACK event, ensuring the device
can reliably enter low power mode during suspend.

Signed-off-by: Quan Zhou <quan.zhou@mediatek.com>
Link: https://patch.msgid.link/d056938144a3a0336c3a4e3cec6f271899f32bf7.1736775666.git.quan.zhou@mediatek.com
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index e6d053c0cdbd2..8dc5dc0af1b1b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -3294,6 +3294,9 @@ int mt7925_mcu_fill_message(struct mt76_dev *mdev, struct sk_buff *skb,
 		else
 			uni_txd->option = MCU_CMD_UNI_EXT_ACK;
 
+		if (cmd == MCU_UNI_CMD(HIF_CTRL))
+			uni_txd->option &= ~MCU_CMD_ACK;
+
 		goto exit;
 	}
 
-- 
2.39.5


