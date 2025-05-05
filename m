Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D438C3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 22:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RDv0Cu7/xfaByTe6voF+CThO/bC21Fzo+2LO+ML52Wk=; b=JPnes1PG1+FaF3OPo9DPir5lcp
	rxS2MXdik2TNLrB22sBphyyY4GXbzkNagACoroenp5i0I0xDjipNua6ZCdJnuibCmzRMQeHqeHgwE
	9Mz8BoxpzUxMEh0Y9dL0JRCIvF1hWc0j0NFxosU/QyASEGu/4AKpnS6e5i7hJ6qUGjO9RLHrwvMxI
	2vk1PzEA698nPxa0C37CYpZKW3eGB15TPMCwdbQ2ucscuXmM8sEO+oAHXLou4Fcio2fdlXI/cdLhy
	mGzWM6JjuddzAsUXImukgbZTGJItoSN2lBIl2pfg4pLDSfzt8RnfMVIMdwLBBeZIZHdANDAiCrA1H
	zTlIG5Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4dF-00000008sGb-1n0x;
	Mon, 05 May 2025 22:49:53 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC47m-00000008iIT-3Y56;
	Mon, 05 May 2025 22:17:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 24A5AA4CC6E;
	Mon,  5 May 2025 22:11:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB7B5C4CEE4;
	Mon,  5 May 2025 22:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483441;
	bh=8/CPWEEQk1DitVDeq0Z4n2Umc68X/nb607AcPQgPx9o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Hr2Lmw5Vq5w5jI+oEruAoy08NZ7MnfHILl75THT68ioxweck1DVBWYwfF5t1jXCCb
	 ctn8yJz8YpqPOkvhZPZ8C4zWnOvYM2DB63lR36NjWgjWbaT+dd2gNYJSBFpcBw2G37
	 sc7kaiI4w22QKdNpxo/xfro/rlpsVB9/a96y1WlsAhfRymGbAocG+QFaFvtKlxbm0s
	 6NpSTxQmP8W3mj6s+LYmz/KuhiUZi2vk9P1Ss0X9onAM22z0BwIH5OgiDcBiKufJD2
	 hp8wBXAXwjY69f1R/dkjP6mzHjvB9qlf9MySC7FWpi5NlqzO6LMW/UUC22LNvSvpP5
	 5jaipAPdSu1XQ==
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
Subject: [PATCH AUTOSEL 6.14 081/642] wifi: mt76: mt7925: Simplify HIF suspend handling to avoid suspend fail
Date: Mon,  5 May 2025 18:04:57 -0400
Message-Id: <20250505221419.2672473-81-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_151722_949055_89D1C961 
X-CRM114-Status: GOOD (  11.08  )
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

[ Upstream commit bf39813599b0375a3eebbbc6837f728554b3883a ]

System suspend failures may occur due to inappropriate
handling of traffic not idle event by the WiFi driver.
The WiFi firmware's traffic not idle indication does
not need to be tied to suspend. Fix the flow to ensuring
the system can suspend properly.

Signed-off-by: Quan Zhou <quan.zhou@mediatek.com>
Link: https://patch.msgid.link/34208c7280325f57a651363d339399eb1744d3b7.1740400998.git.quan.zhou@mediatek.com
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index a1d6fd5888f54..e6d053c0cdbd2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -348,14 +348,10 @@ mt7925_mcu_handle_hif_ctrl_basic(struct mt792x_dev *dev, struct tlv *tlv)
 	basic = (struct mt7925_mcu_hif_ctrl_basic_tlv *)tlv;
 
 	if (basic->hifsuspend) {
-		if (basic->hif_tx_traffic_status == HIF_TRAFFIC_IDLE &&
-		    basic->hif_rx_traffic_status == HIF_TRAFFIC_IDLE)
-			/* success */
-			dev->hif_idle = true;
-		else
-			/* busy */
-			/* invalid */
-			dev->hif_idle = false;
+		dev->hif_idle = true;
+		if (!(basic->hif_tx_traffic_status == HIF_TRAFFIC_IDLE &&
+		      basic->hif_rx_traffic_status == HIF_TRAFFIC_IDLE))
+			dev_info(dev->mt76.dev, "Hif traffic not idle.\n");
 	} else {
 		dev->hif_resumed = true;
 	}
-- 
2.39.5


