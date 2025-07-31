Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40DB5C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 10:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=89mgyzC0NNmSXHRiTaLzRWS+SiW+HSZnv04sAhF4T+8=; b=mtMlgYGuuLJoAqYHDxSgPyqXXs
	8CtAspJFt08Ql7YYbQ/Y2Wlau7YkrYQKUet885JEmd+gQDsgiUEn+92PnxwqufuuDnAqdLFTW0HF2
	4fwc2QxaQTb6yDx0wQT6C6nIDxhMKz8Zdt0TLk0vF9xdg8sKpdL5MRnHZat7DfO7zmdO672qHL59B
	vmdtC+clwh4ar4IAfFSZCVDj9sBvRKgfs9jIGiTjU32RrLU29ut3f3uOYyZMHi0qAuFZ7AOtVJhDS
	JGf0l54K54xYFiY6jtZrH1J1Z2Gm0aBW4w3j8OUS8Z2rD+YuLWutc5NbEXTEjEuCNez9ihGQbIXGY
	mehWUbzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhQpv-00000003PFq-02vD;
	Thu, 31 Jul 2025 10:48:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhQjM-00000003Obp-0l2g;
	Thu, 31 Jul 2025 10:41:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E805144A5D;
	Thu, 31 Jul 2025 10:41:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73DF0C4CEEF;
	Thu, 31 Jul 2025 10:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753958507;
	bh=HFn2Sm81XBekacLQ3GbYvA+Glq8BpVBTyLYcvCAYhrc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bdr8R5tEKDmuFNmF6HYOGgw4+yuzT2Uu2fBTlw1YsCnoUUCotoTsI01Y9ECpM4DSI
	 cGatC76GXqbhAWU6HKVl61iK8Z59W2pNV3vzkPBw4uyxTbcYU7fCei1Q78cYacYvDn
	 x+22CVd7ufVkpk0MFy2MjbPSw3DevJPB7n1F4CbWYIwjAzesH8RXSxXsB9HFpM8DUU
	 0zW1yWqdurzED9Mj4WjdL+ZOmdLNi5Ck1QAaG5LTYMR4U6WcVzgRRnO7UkUAEm55Un
	 kFvAOlvaVBND6kt/2q8iQMVsST1vnpAVBIXRFBqe86tTs4vOu1yJxTIEIkJIsfUqIn
	 BUBAtzsqBB4zA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 31 Jul 2025 12:41:23 +0200
Subject: [PATCH mt76 1/2] wifi: mt76: mt7996: Set def_wcid pointer in
 mt7996_mac_sta_init_link()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250731-mt7996-mlo-devel-v1-1-7ff4094285d0@kernel.org>
References: <20250731-mt7996-mlo-devel-v1-0-7ff4094285d0@kernel.org>
In-Reply-To: <20250731-mt7996-mlo-devel-v1-0-7ff4094285d0@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_034148_247064_C74BC924 
X-CRM114-Status: UNSURE (   7.69  )
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

In order to get the ieee80211_sta pointer from wcid struct for a MLO
client, set def_wcid pointer in mt7996_mac_sta_init_link routine.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index ed82197d8ffb74ed272b295351708b249cc543cd..662ce4bb5178a4b8765b2b337ea6baea649d3ef2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -962,6 +962,7 @@ mt7996_mac_sta_init_link(struct mt7996_dev *dev,
 	msta_link->wcid.sta = 1;
 	msta_link->wcid.idx = idx;
 	msta_link->wcid.link_id = link_id;
+	msta_link->wcid.def_wcid = &msta->deflink.wcid;
 
 	ewma_avg_signal_init(&msta_link->avg_ack_signal);
 	ewma_signal_init(&msta_link->wcid.rssi);

-- 
2.50.1


