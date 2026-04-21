Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D79F5A8DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 02:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x74P/xP7mH34XJ8aunPnT9EFJkhy0I0k3ymO2xJHrr0=; b=0W7SDzFKHwmbP8pgTGGcPhFTBL
	Q/+oJDCOqVpu1PJ4q75dnU48LY0272SJDQrRvJDc5bhyZoieTAnqBCiGLoFffbeQRLzVt76IrfmpD
	CLGhDsqMjSaHV0OaJ3bzRJDZJbX8Ab92Dg3bASvTJGtlQ4AKjWgeQ+vJNSvfV0EkQyg/WNjnIqqUa
	YYDG47zXZeUuTUahpdQHBTz6D0NCVAzD9S5AGChPTm+lMz00vkjQCEhacjRLN2Ut/GOb2RTS3Wxii
	JGkItaz/TTk/rFVz3EHiFnt4fs8KxhSm1kbLiWcLDRSFRwiZgmWJ/LdSkmKXLUV0/DRVrdKlvC8Fg
	nC3Rvy/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF16H-00000007xCR-0Isw;
	Tue, 21 Apr 2026 02:44:33 +0000
Received: from n169-112.mail.139.com ([120.232.169.112])
	by bombadil.infradead.org with smtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF16D-00000007x9q-1yrO;
	Tue, 21 Apr 2026 02:44:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=139.com; s=dkim; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=nv0pVy81nB8ijr8fH/wOse2fCi/ONoInZF85o3Fb1jlrQymUSl4NbDzKock5oHcGJqGHQm8DOy1Wd
	 VYxRttoC2UAM95932WAvYz2D+x8a5JUcB3Xxo7TcZNsl/M9o8lmRHBLfJu+gHZPfYogpgc8N1lb9Sa
	 9BSTmHVrH/WLE9AU=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM: 
X-RM-SPAM-FLAG: 00000000
Received: from NTT-kernel-dev (unknown[60.247.85.88])
	by rmsmtp-lg-appmail-20-12023 (RichMail) with SMTP id 2ef769e6e487384-013a1;
	Tue, 21 Apr 2026 10:44:26 +0800 (CST)
X-RM-TRANSID: 2ef769e6e487384-013a1
From: Li hongliang <1468888505@139.com>
To: gregkh@linuxfoundation.org,
	stable@vger.kernel.org,
	nbd@nbd.name
Cc: patches@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	toke@toke.dk,
	kvalo@kernel.org,
	johannes@sipsolutions.net,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	nbd@openwrt.org,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	johannes.berg@intel.com
Subject: [PATCH 5.10.y] wifi: mac80211: always free skb on ieee80211_tx_prepare_skb() failure
Date: Tue, 21 Apr 2026 10:44:25 +0800
Message-Id: <20260421024425.3133110-1-1468888505@139.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_194430_060841_A391E198 
X-CRM114-Status: GOOD (  12.47  )
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

[ Upstream commit d5ad6ab61cbd89afdb60881f6274f74328af3ee9 ]

ieee80211_tx_prepare_skb() has three error paths, but only two of them
free the skb. The first error path (ieee80211_tx_prepare() returning
TX_DROP) does not free it, while invoke_tx_handlers() failure and the
fragmentation check both do.

Add kfree_skb() to the first error path so all three are consistent,
and remove the now-redundant frees in callers (ath9k, mt76,
mac80211_hwsim) to avoid double-free.

Document the skb ownership guarantee in the function's kdoc.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
Link: https://patch.msgid.link/20260314065455.2462900-1-nbd@nbd.name
Fixes: 06be6b149f7e ("mac80211: add ieee80211_tx_prepare_skb() helper function")
Signed-off-by: Johannes Berg <johannes.berg@intel.com>
[ Exclude changes to drivers/net/wireless/mediatek/mt76/scan.c as this file is first
 introduced by commit 31083e38548f("wifi: mt76: add code for emulating hardware scanning")
 after linux-6.14.]
Signed-off-by: Li hongliang <1468888505@139.com>
---
 drivers/net/wireless/ath/ath9k/channel.c | 6 ++----
 drivers/net/wireless/mac80211_hwsim.c    | 1 -
 include/net/mac80211.h                   | 4 ++++
 net/mac80211/tx.c                        | 4 +++-
 4 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath9k/channel.c b/drivers/net/wireless/ath/ath9k/channel.c
index 6cf087522157..31b7921bf34f 100644
--- a/drivers/net/wireless/ath/ath9k/channel.c
+++ b/drivers/net/wireless/ath/ath9k/channel.c
@@ -1011,7 +1011,7 @@ static void ath_scan_send_probe(struct ath_softc *sc,
 	skb_set_queue_mapping(skb, IEEE80211_AC_VO);
 
 	if (!ieee80211_tx_prepare_skb(sc->hw, vif, skb, band, NULL))
-		goto error;
+		return;
 
 	txctl.txq = sc->tx.txq_map[IEEE80211_AC_VO];
 	if (ath_tx_start(sc->hw, skb, &txctl))
@@ -1124,10 +1124,8 @@ ath_chanctx_send_vif_ps_frame(struct ath_softc *sc, struct ath_vif *avp,
 
 		skb->priority = 7;
 		skb_set_queue_mapping(skb, IEEE80211_AC_VO);
-		if (!ieee80211_tx_prepare_skb(sc->hw, vif, skb, band, &sta)) {
-			dev_kfree_skb_any(skb);
+		if (!ieee80211_tx_prepare_skb(sc->hw, vif, skb, band, &sta))
 			return false;
-		}
 		break;
 	default:
 		return false;
diff --git a/drivers/net/wireless/mac80211_hwsim.c b/drivers/net/wireless/mac80211_hwsim.c
index 037358606a51..865bbe029343 100644
--- a/drivers/net/wireless/mac80211_hwsim.c
+++ b/drivers/net/wireless/mac80211_hwsim.c
@@ -2275,7 +2275,6 @@ static void hw_scan_work(struct work_struct *work)
 						      hwsim->tmp_chan->band,
 						      NULL)) {
 				rcu_read_unlock();
-				kfree_skb(probe);
 				continue;
 			}
 
diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 8f91609f928c..70ee982f08d9 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -6337,6 +6337,10 @@ void ieee80211_report_wowlan_wakeup(struct ieee80211_vif *vif,
  * @band: the band to transmit on
  * @sta: optional pointer to get the station to send the frame to
  *
+ * Return: %true if the skb was prepared, %false otherwise.
+ * On failure, the skb is freed by this function; callers must not
+ * free it again.
+ *
  * Note: must be called under RCU lock
  */
 bool ieee80211_tx_prepare_skb(struct ieee80211_hw *hw,
diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
index 30ad46cfcad8..b923cd755a68 100644
--- a/net/mac80211/tx.c
+++ b/net/mac80211/tx.c
@@ -1869,8 +1869,10 @@ bool ieee80211_tx_prepare_skb(struct ieee80211_hw *hw,
 	struct ieee80211_tx_data tx;
 	struct sk_buff *skb2;
 
-	if (ieee80211_tx_prepare(sdata, &tx, NULL, skb) == TX_DROP)
+	if (ieee80211_tx_prepare(sdata, &tx, NULL, skb) == TX_DROP) {
+		kfree_skb(skb);
 		return false;
+	}
 
 	info->band = band;
 	info->control.vif = vif;
-- 
2.34.1



