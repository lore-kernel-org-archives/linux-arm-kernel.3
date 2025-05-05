Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9139DC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 01:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aOWJohSsvEL3B7PVjm8qE2njCqOzKpufACynATwn+Oc=; b=qC2Cg+prs2/XXxiUwRlLHgfTYy
	ENAZTxQwGzf5tE+IxrLoFRWsxz3tReMnfRplUVTU91stkA4/8bj9sMSfuKX7vzYyCotQgQvOPVlI3
	NYAaoo9WHLjfrMZekw49CUqrIQgPO0QYezrN8oabCrtPa5mcQ1LqHAPWtZkNNGkcHFSHEff17pG8J
	MZEpRVI0jpkCJnxeYz78aqy6nSrc3HC0kciH6x/qxh0cU0vt+FhLgvM+VTbKEQ6xlXiClc7biSAcC
	EI/EwjrB5/FlkasjNeN5WL893dlqxT41gWp/6u24gQ9JYXTqBkO05ggzdyJiBostHvIIgBxSOnfyi
	S4oV5aXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC6fF-00000009Pgj-1Xa5;
	Tue, 06 May 2025 01:00:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4VD-00000008phx-1eZc;
	Mon, 05 May 2025 22:41:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AA9E75C5546;
	Mon,  5 May 2025 22:39:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 092FEC4CEE4;
	Mon,  5 May 2025 22:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484894;
	bh=MsfzYwsNlKmyBj46lG/HudGhcLZp4s/BlfAOyrpQhEM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SCdxXisJ7g9BOxvsZb9TevcHtyKxtxoA8xyhrZ/NIHN41sfE7gGGkW7aM1pZHkSz1
	 Ove8aHZRKhRwBt8kgxgNPQXm/Fc7zGkV4Yk5/w6m9jtCmSpdQzs1Ya0d47uFhymQ95
	 74WALpJp9NLSUuTBrUAgyBesQHANnat6mlJuCbau2pF8d0nZyi70ZdxTrMn4h4ZChI
	 8zoTJk1cOWJGt3fqoQzb3UcX3ZyyUnl2aLfRCUIE7ULCtaNjv7HwhUnXxmHqK6HSre
	 9PU5XA8hO2Mzpz3WsmvzLfAi8hSZf/qb+x4K5HDhkHpsQ/KMp/AC5f6CV7HSPb9tPn
	 9825V66p3Fhdw==
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
Subject: [PATCH AUTOSEL 6.12 064/486] wifi: mt76: mt7925: fix fails to enter low power mode in suspend state
Date: Mon,  5 May 2025 18:32:20 -0400
Message-Id: <20250505223922.2682012-64-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_154135_479903_5082AC8F 
X-CRM114-Status: GOOD (  10.55  )
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
index 5b14bf434df36..2396e1795fe17 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -3287,6 +3287,9 @@ int mt7925_mcu_fill_message(struct mt76_dev *mdev, struct sk_buff *skb,
 		else
 			uni_txd->option = MCU_CMD_UNI_EXT_ACK;
 
+		if (cmd == MCU_UNI_CMD(HIF_CTRL))
+			uni_txd->option &= ~MCU_CMD_ACK;
+
 		goto exit;
 	}
 
-- 
2.39.5


