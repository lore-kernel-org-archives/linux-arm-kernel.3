Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28299CE7B0B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 13:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2MRqPcy1XkjREQqlHjDZ1XCh4T6WODnFOoMZHdGcGmU=; b=f31u3TpnkRET9b
	KgohjQD7e3bBc49FMnGKfEOmckLoGh82OHKfuYpp7R8rCOsNpmNIAj4zs3upIxb154T02sztT+gPc
	r42aNdogXjpcJlS6X1XTAII4dZr1jXSIFoFblI/R+oV/n6JOzXYfox0cUCuI8ro3/pEmkTmwI7GYJ
	VN985QIPg/NI4vqPurrLHj0iQAEznDvDJVWG62GtcBetQEGambhVnhq/eDviVL+VoNy/4kidpuC6k
	ceQ7jyWCVgq9GegzIZvVsLMxcC8Y0ChnDtEKBG/cv/KoF393GR6zI73NzQ1RN348nYvPM3w92F9nx
	IwxgTT0y1kL1ljt/srUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJtfJ-0000000CEsS-2Czt;
	Fri, 14 Nov 2025 13:16:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJtfH-0000000CErm-1JCq;
	Fri, 14 Nov 2025 13:16:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1C85243BA9;
	Fri, 14 Nov 2025 13:16:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7399FC4CEF1;
	Fri, 14 Nov 2025 13:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763126194;
	bh=CLK/yWeDsqVN1DIRZoE5Vml27ZShImehp87AK62LvAo=;
	h=From:Subject:Date:To:Cc:From;
	b=Mk+qqsFI9O3sBP3KGHUO4j9NrPbSTc3NX9haka5+3IZZkz2KW3H4pqAG7wDBE6Mjt
	 jSjHON3J6fP4ovFPq6dOtPznXSxGZ6XwT98r7EwRedCts8WmPb34SM0xvAqpWLe7Zm
	 j/U7RK5x576dQiypPFTtMf6k/eBn6C1SeFPG9/lkZOI5o5AP4h2SbeLBHEaviM7bw0
	 2xsB4q/8l9Te+E1ggCwu3u05ch9lYxsz4tM/ZdxQ7t6z3jF6lawNpi9a7B9GcBw9aX
	 mEEYKHQeIWiXinE1JGegR3piXLd6TgO61/ZYK63A6BXrOQ9HC+DEqR+zsQCrRoTuIx
	 XWFdq0HtOKcQg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH mt76 0/4] wifi: mt76: mt7996: Fix some locking issues for
 MLO
Date: Fri, 14 Nov 2025 14:16:20 +0100
Message-Id: <20251114-mt76-fix-missing-mtx-v1-0-259ebf11f654@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKQrF2kC/x2MQQqAMAwEvyI5GzCiFfyKeNCaag5WaUQK4t8NH
 meZnQeUk7BCXzyQ+BaVIxpQWYDfprgyymIMdVW3RNTgfnUOg2TcRVXiakPGZXauCcF7pgnseiY
 25c8O4/t+BZlV4GYAAAA=
X-Change-ID: 20251114-mt76-fix-missing-mtx-db664ffcce1a
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bo Jiao <Bo.Jiao@mediatek.com>, Peter Chiu <chui-hao.chiu@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_051635_378271_CA68702B 
X-CRM114-Status: UNSURE (   5.47  )
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


---
Lorenzo Bianconi (4):
      wifi: mt76: mt7996: grab mt76 mutex in mt7996_mac_sta_event()
      wifi: mt76: mt7996: Move mt7996_update_beacons inside mt76 mutex critical section
      wifi: mt76: Move mt76_abort_scan out of mt76_reset_device()
      wifi: mt76: mt7996: skip deflink accounting for offchannel links

 drivers/net/wireless/mediatek/mt76/mac80211.c    |  2 --
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c  |  2 ++
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c  |  5 +++--
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 21 ++++++++++++++-------
 4 files changed, 19 insertions(+), 11 deletions(-)
---
base-commit: c99ebb6132595b4b288a413981197eb076547c5a
change-id: 20251114-mt76-fix-missing-mtx-db664ffcce1a

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


