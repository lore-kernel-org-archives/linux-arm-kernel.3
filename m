Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D90C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 00:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=86zaZCBgQQ8SmKwWPe0kHOooYRbDlWS4BsXTbbi4WG0=; b=v5PxdJ+mjGys3pj2Gol93qMjbr
	0rd5AYqMSfbzQjRvF7j0lAkysYOI6dL0ix3baxSLSqWRkeKMyt6HfXwKw1h3RKXFVgrjbKdoeL7Cd
	VXi1LxBcNo1KaIYnj4C+AKFDo49QdIPbscpEkSoT0rnCDfSmJOm2TLNIsZouOzrsJhqe4cjG4AqZ9
	+pDhdBtjalv7IlsI3AtjlhGCVXouyGV6hNf3zCJ6JbWOzhkQYJ0lGLfl43ikZdIlJkZIPDalTvl0O
	/mpYBjYFRdCMdxkhlXMGPUPvclyAl5JHeWj2Jl8WT8eAriNgCFxgVFFTK/5OgYWcULl7S9uKME4kz
	GE6YMI5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubTHb-00000003buS-3FRx;
	Tue, 15 Jul 2025 00:12:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubSGk-00000003Um0-2T5Q;
	Mon, 14 Jul 2025 23:07:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 586C944C9B;
	Mon, 14 Jul 2025 23:07:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2DADC4CEF4;
	Mon, 14 Jul 2025 23:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752534454;
	bh=yVFlXPDCgvTi/g7cKT+0xKWJ/Se/ufuBEBi8X15GVyI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V12mS15MjiFXfn6UfxhfnFteczSuXiA/xv69+oyogoGttLWt4+XRR9i5jgZxF6Uyh
	 Zo9vxVwlzhx4sOKNyqs4YgY0d9i0dhqA0hhmaKWuAepTnhZhfUbNIthXGXIqwdz0xs
	 X3e6WjnKDj7y/xRe/xJoxKdiuP1qY7abmPxMMyzZaDoejthcpiKAjpbMudmm1w3mQl
	 7ZIJR2okJ50/L+99ckYxu1WXVheWxwjx+nth00d4H7YEudb/1fDGXasULOv6k99dOC
	 jWxE3uegJy0UBpzOgpj7gKzPpPc3rYCadS45hJkRTLSSV1eJbQqiRx02jLLQHNuAFg
	 JnhQHr9NrtBzQ==
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
Subject: [PATCH AUTOSEL 6.12 09/12] wifi: mt76: fix queue assignment for deauth packets
Date: Mon, 14 Jul 2025 19:07:12 -0400
Message-Id: <20250714230715.3710039-9-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250714230715.3710039-1-sashal@kernel.org>
References: <20250714230715.3710039-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.38
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_160734_669270_E8F4A8B2 
X-CRM114-Status: GOOD (  16.12  )
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
index 065a1e4537457..da31bf3c18db8 100644
--- a/drivers/net/wireless/mediatek/mt76/tx.c
+++ b/drivers/net/wireless/mediatek/mt76/tx.c
@@ -615,7 +615,8 @@ mt76_txq_schedule_pending_wcid(struct mt76_phy *phy, struct mt76_wcid *wcid,
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


