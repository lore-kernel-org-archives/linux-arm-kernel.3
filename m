Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A4D0C3ABB9
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 22:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LHmDQtb4EmlCpRjsQ+lAL/uRZS8vA480/z1fklcjfm4=; b=O1QUQIeE8MH1lABmlcgiKA1ugP
	LWFZviTwykle1D2RqMDEgUW60bCl/E2R9+2WW+6YEbwBY0jIU4iGGzqJ/sBhRiU/HSYCSs8nFiT1J
	RQF6zGWd6fXRNISJreOQg46nNyI+pRxhB69g5d3EypKu5u4Obxg3qbeLqJshjr8zNNKWln/D3bXrs
	WqFSmdyw9zx+NaHTCGiprOZpPY5swx334Hc52D5spK9Hr+7gBiuU5u2HSt91lQlDtf+wOqAIyppmU
	26A90sarlNXg0qI0ypfqjA2Nc9MFrhwswFwxBMd24UWB2wZHD08HiszE0hdXdkaZMjQ66zljfOjce
	NPMuda9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4PI-00000008npQ-40hA;
	Mon, 05 May 2025 22:35:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC47J-00000008i55-1M8P;
	Mon, 05 May 2025 22:16:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 62E1D44E60;
	Mon,  5 May 2025 22:16:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0032C4CEF1;
	Mon,  5 May 2025 22:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483413;
	bh=vhBSOQqn4WDnjy878rsFzTsVTFtg8A4FUAsaohGjjtE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MFita2pJ8EItYQ/AmlzcZa5EdUpGPBGl7weskS7WAqgG/08CDSFlURcM6qwiWCyBx
	 7VCh58gS8+rMkIFiFYan0wJNVEN8k0PMQZAFiz1ducBrw6ISIgujzd7WaD+MQiATqz
	 QwjFxWxFvwM2dBt5ZxPzfWD/Yqszm/o2QtA1HpY3fcNPj+ZarTVplkjzmL37zmHe3H
	 2FbDsmKYjJL/dBoMf/exa5urLTIJmBaOa6YoHTErFViYkbu7UxhPPuAeTeXwzhkDS6
	 avdjdYfweXPN3uIrrDv+CchNV5ICNw43VqjYooqGrm85niq9QF1VjpjZyp+FG3zi6j
	 UMXAbep+H0UgQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Sasha Levin <sashal@kernel.org>,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 073/642] wifi: mt76: scan: fix setting tx_info fields
Date: Mon,  5 May 2025 18:04:49 -0400
Message-Id: <20250505221419.2672473-73-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_151653_902331_A38BEB07 
X-CRM114-Status: UNSURE (   9.37  )
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

From: Felix Fietkau <nbd@nbd.name>

[ Upstream commit 5b5f1ca9ce73ab6c35e5cd3348f8432ba190d7f4 ]

ieee80211_tx_prepare_skb initializes the skb cb, so fields need to be set
afterwards.

Link: https://patch.msgid.link/20250311103646.43346-8-nbd@nbd.name
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/scan.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/scan.c b/drivers/net/wireless/mediatek/mt76/scan.c
index 1c4f9deaaada5..9b20ccbeb8cf1 100644
--- a/drivers/net/wireless/mediatek/mt76/scan.c
+++ b/drivers/net/wireless/mediatek/mt76/scan.c
@@ -52,11 +52,6 @@ mt76_scan_send_probe(struct mt76_dev *dev, struct cfg80211_ssid *ssid)
 		ether_addr_copy(hdr->addr3, req->bssid);
 	}
 
-	info = IEEE80211_SKB_CB(skb);
-	if (req->no_cck)
-		info->flags |= IEEE80211_TX_CTL_NO_CCK_RATE;
-	info->control.flags |= IEEE80211_TX_CTRL_DONT_USE_RATE_MASK;
-
 	if (req->ie_len)
 		skb_put_data(skb, req->ie, req->ie_len);
 
@@ -64,10 +59,20 @@ mt76_scan_send_probe(struct mt76_dev *dev, struct cfg80211_ssid *ssid)
 	skb_set_queue_mapping(skb, IEEE80211_AC_VO);
 
 	rcu_read_lock();
-	if (ieee80211_tx_prepare_skb(phy->hw, vif, skb, band, NULL))
-		mt76_tx(phy, NULL, mvif->wcid, skb);
-	else
+
+	if (!ieee80211_tx_prepare_skb(phy->hw, vif, skb, band, NULL)) {
 		ieee80211_free_txskb(phy->hw, skb);
+		goto out;
+	}
+
+	info = IEEE80211_SKB_CB(skb);
+	if (req->no_cck)
+		info->flags |= IEEE80211_TX_CTL_NO_CCK_RATE;
+	info->control.flags |= IEEE80211_TX_CTRL_DONT_USE_RATE_MASK;
+
+	mt76_tx(phy, NULL, mvif->wcid, skb);
+
+out:
 	rcu_read_unlock();
 }
 
-- 
2.39.5


