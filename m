Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63730C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 00:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8/P6+zS0xIS8EdlHFuSEZF43b9EYvFj71vURJ04waek=; b=ORlJZigYbP/Q/HZwMABwFrxinX
	HR56XsYnRMOgqlfPJeLGc2QgZJIYuGHNpkXHTgmO18F/MQrQfGTQdN/8pmV5UrJm8EC+elU6yEuSr
	wsLQZ0OGixxuQxCdlE/VkttqNBcCkmffJlXwo+Z+CWqybUAHc9qvPfOEBHyXu8pEciOUYpoeUcRWb
	Z2xzx4dV0sY9N8AJ+4RAXJB8yuqB/KJ89qBgzLktU0yECXxismOpOeWlkjWGDLNZ1fNooA8xanA/u
	6A6rOP7wKojFBIBvhLKrqbfzXVrO/1WghnKkpdsbMxn0Ike0mJsvvqtdpZ9d6jHzFcG83eQSw8BiV
	/kvfEDMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubTAK-00000003b88-49hL;
	Tue, 15 Jul 2025 00:05:01 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubSFq-00000003UYh-1qRg;
	Mon, 14 Jul 2025 23:06:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6BF07A521D2;
	Mon, 14 Jul 2025 23:06:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A512C4CEED;
	Mon, 14 Jul 2025 23:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752534397;
	bh=QDYUHljB4vslgSRUKKsJCMfZnsTcRrcAgVAUWM9zEAk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EggKEawDQ+TtJcVDb10kwG2PUAui5BzvMOp7VHz/vmxncc1XxTnDp0shpkgvQKBw9
	 ORejZFsp98ArsIed93i1On5GSON0D4ny446JbQmiyuGYyG5kPUWTFEDWw3uUHjhShb
	 gwyWeZ7dcD9bMOMwlYwX94BaXNCnEONMEiu5iyCxhnubiTMk43MjN92K8Tox8D4yNn
	 7a+MgPecPIiKQFP7J6KxDogDUydYzdc2owitVej0zSqJWinvCSI5+ww0zs1SaZLGdH
	 X8Jb0eKYNkgDdJhY2NJNPlNjz/HUh4GL1SjiOlQJSF3hOOZx71wGVJibXYvhshra7I
	 fre2aB9LYmGWQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Chad Monroe <chad.monroe@adtran.com>,
	Sasha Levin <sashal@kernel.org>,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.15 10/15] wifi: mt76: fix queue assignment for deauth packets
Date: Mon, 14 Jul 2025 19:06:11 -0400
Message-Id: <20250714230616.3709521-10-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250714230616.3709521-1-sashal@kernel.org>
References: <20250714230616.3709521-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.15.6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_160638_614317_E2036828 
X-CRM114-Status: GOOD (  16.10  )
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

[ Upstream commit dedf2ec30fe417d181490896adf89cd6b9885b23 ]

When running in AP mode and deauthenticating a client that's in powersave
mode, the disassoc/deauth packet can get stuck in a tx queue along with
other buffered frames. This can fill up hardware queues with frames
that are only released after the WTBL slot is reused for another client.

Fix this by moving deauth packets to the ALTX queue.

Reported-by: Chad Monroe <chad.monroe@adtran.com>
Link: https://patch.msgid.link/20250707154702.1726-2-nbd@nbd.name
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now I understand the issue and the fix better. Let me analyze this
commit:

**YES**

This commit should be backported to stable kernel trees for the
following reasons:

1. **It fixes a real bug affecting users**: The commit addresses a
   specific issue where deauthentication packets sent to clients in
   powersave mode can get stuck in hardware TX queues. This causes queue
   exhaustion and prevents the WTBL (Wireless Table) slot from being
   properly reused for new clients. This is a significant functional bug
   that impacts AP mode operation.

2. **The fix is small and contained**: The change is minimal - it only
   adds a single condition (`||
   ieee80211_is_deauth(hdr->frame_control)`) to the existing queue
   assignment logic. This is a low-risk change that doesn't introduce
   new functionality or architectural changes.

3. **Clear problem and solution**: The commit message clearly describes
   the issue (deauth packets getting stuck with other buffered frames)
   and the solution (moving deauth packets to the ALTX/PSD queue). The
   fix is logical because:
   - According to `ieee80211_is_bufferable_mmpdu()` (line 4517), deauth
     frames ARE considered bufferable MMPDUs
   - However, when a client is being deauthenticated, we don't want
     these frames to be buffered with regular data - they need immediate
     transmission
   - The PSD (Power Save Delivery) queue is more appropriate for
     management frames that need immediate handling

4. **Similar to previous backported fixes**: Looking at the similar
   commits, commit #1 (fca9615f1a43) which fixed queue handling for
   loopback packets was backported. This current fix addresses a similar
   class of queue assignment issues.

5. **No architectural changes**: The fix uses existing infrastructure
   (MT_TXQ_PSD queue) and existing helper functions
   (ieee80211_is_deauth). It doesn't introduce new features or change
   any APIs.

6. **Prevents resource exhaustion**: The bug can lead to hardware queue
   exhaustion which is a serious issue in production AP deployments.
   This makes it an important fix for stable kernels.

The code change shows that previously, only non-bufferable MMPDUs were
assigned to the PSD queue, but deauth frames (which are technically
bufferable) were getting stuck in regular data queues when sent to
powersave clients. This fix ensures deauth frames bypass the normal
buffering mechanism and get transmitted promptly via the PSD queue.

 drivers/net/wireless/mediatek/mt76/tx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/tx.c b/drivers/net/wireless/mediatek/mt76/tx.c
index 513916469ca2f..dc9bf2fff51bb 100644
--- a/drivers/net/wireless/mediatek/mt76/tx.c
+++ b/drivers/net/wireless/mediatek/mt76/tx.c
@@ -617,7 +617,8 @@ mt76_txq_schedule_pending_wcid(struct mt76_phy *phy, struct mt76_wcid *wcid,
 		if ((dev->drv->drv_flags & MT_DRV_HW_MGMT_TXQ) &&
 		    !(info->flags & IEEE80211_TX_CTL_HW_80211_ENCAP) &&
 		    !ieee80211_is_data(hdr->frame_control) &&
-		    !ieee80211_is_bufferable_mmpdu(skb))
+		    (!ieee80211_is_bufferable_mmpdu(skb) ||
+		     ieee80211_is_deauth(hdr->frame_control)))
 			qid = MT_TXQ_PSD;
 
 		q = phy->q_tx[qid];
-- 
2.39.5


