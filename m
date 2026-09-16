Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E122C982C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 19:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GPA1DSANSZ2wx5ap9tiYRblcf1dOFfjW+WHihKGkeG4=; b=haxTSr5yus0KlPa+tso9d/ZTOC
	kFn0oPvt5cDALv3A9kVtkn6nvMsN6hMXVDzCo+WT+kJXFoIllw5y5DqUFBmTQaqRLFtQIsZtI2RQa
	Uu8wDntUg9hFVvELr6dpngnmQcBctdmvJWdyb4zvBY/8CBK9IXA2ISPV/7BPqKlanME/BK95t+10v
	zPFvjCWKv85weGBVJJK/Tnvp0vRzTa+U8dGFKhVDzADfX3icPvfcn6yONH49Pfrm80JFoyETmvKva
	62dzo4waFiYh1dARmR8HAb+yeHY3c8iDUmAoM4vbRz1oRdrOpJvqKYjgmAGEaSzgS/vlyVy3f1i47
	fAFTW6YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6vd6-0000000A3Iq-0LaQ;
	Wed, 16 Sep 2026 19:49:16 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6vd3-0000000A3I3-18K4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 19:49:14 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49b91369d18so1014125e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 12:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789588151; x=1790192951; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GPA1DSANSZ2wx5ap9tiYRblcf1dOFfjW+WHihKGkeG4=;
        b=X/jPUI0wPs847WXS9+f0r+6Z/cax/7KlTc7QcIqVPLfKxAfD3LdEVyuu3OAf8ywk/8
         cDdA0+H6+UhRvyOvoNAgLCN3whjVVkhwxG//U0BFlX3iSPLAPXhoyEYORDs/YNWvS0eY
         EchFAY2bURxZs25UHpTn3qJ1mAgVZ/8Fq/HXeE1hgW4ozrbTUZXpjYEtoDd9O/EScJfU
         3aDFt+D7ajBiuVet/UEiRnJurRumwyS6denlljwWHORAu/MpjJU522oPhBU75Uw78LLR
         kfsW+0o07l26sjM+MNp219V8Yjo74Q+ZL99ueO0WJZ/4EgPOEx1hLzJfXH5mCqTgBPvK
         IbUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789588151; x=1790192951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GPA1DSANSZ2wx5ap9tiYRblcf1dOFfjW+WHihKGkeG4=;
        b=iOfx9xR/egflmklslOR/OTHDpQN6XZXVcUhLH/rESaOGBgy6RAU+azeeKpPeL5ZP7G
         Ssh+9BUEPijoSxwnVQ0Bfvv7OdbbRfYxFXjipxLQiMr4dKBxHtlyPPgpVk1gtQOp2CB3
         ijpHu51HZEY0ih6Wa74XQx8I/rgW4jC8Dzv4cVBk9EK0OpVUjKXoWvmSV6okKPOS7Hi+
         PPXHVRHkLNvO83WKXO9ACVTf5iaXDik5F5TQbPbKrf7T9PS7ohKsM3eoQ2EarYq3xWN2
         84J4EfcBAb/Mi79OhtKTd0U7iHaIdu597pTzFtSlPGEaNhMKTudoTOeo8CJidoSqVTtg
         ksuw==
X-Forwarded-Encrypted: i=1; AKwUvByg/Z6hWOfaRkJi2/y+bRIjxZYwKby3pQVABp82I1jALN/GKMDR4HdAH8tXpxgPtSVtRPI3VmBZ1VTKGFZJWRO5@lists.infradead.org
X-Gm-Message-State: AFuF++lXqA6C82w9gI+Xpwerx+wV8iueW5o1sCCdJNb3FfNEUhncvvdO
	SXHU4ZHQWeuCvi10YDiHZNNJkn+HG2NaWs2X8LjfnF8oE0QBGJq6MpM=
X-Gm-Gg: AYBFou2Nnfp7k3ZJ91CoZUkC0PQnpeLC3VRNge9J0OzwzNgk12YG8sMQl6qGbGQSKR4
	4ifCxSLYiFJdBkfv18fM7oLFo5JOt3RtJc+4sJBdCYPFiAv8mCglt1j4PEPSwj2rR1kAPJKdu1d
	8BnaIoBqQLDdpuVhf6EYhWlByxVMV+0NzgZG6rvt90Y9ywig+HHX3Mvk4Cd5Qj2VtI/5J0k1+Ey
	1x54I1Eem+N0MZ2KeNNfaoqhRvyXo/x8CddA2pmQI7U8SCTUjNGD6sffheeMzVqOpiTAeIRcLi6
	oXOfqrLelQY4EzyfunJoyD+HLjvlfp8BATz2KhOJsn9nRXXM7nkd1aJ4BUppymHNh2+P7yZ9nBk
	Z4DIY7o+Y7hKHtbQje+yY2Ze0oCvFVTCZxSKBSWACjdIz3DSB43N3new1FGpzSPpw0gdTbUqwKe
	mOn39ADesS83iQEsLnonUaAYdriKcfbQRqcK9NnmqtqRsxnVQiJp+Snk/3o8UI1JsqBPoWGbONd
	BHk9RMQm5JD9xlnSpvqCd/wXs+wA4uwBAOngT1NM/xXf56r7sVmlr3/4cnQDQ==
X-Received: by 2002:a05:600c:621a:b0:49d:1d6a:4cfb with SMTP id 5b1f17b1804b1-49eac463a00mr43701435e9.1.1789588150982;
        Wed, 16 Sep 2026 12:49:10 -0700 (PDT)
Received: from localhost.localdomain ([193.160.247.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbda7c461sm1682895e9.4.2026.09.16.12.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 12:49:10 -0700 (PDT)
From: Andrea Pesaresi <andreapesaresi82@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Andrea Pesaresi <andreapesaresi82@gmail.com>,
	nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH wireless] wifi: mt76: initialize tx_info band for 802.3 offload
Date: Wed, 16 Sep 2026 21:44:12 +0200
Message-ID: <20260916194647.1421848-1-andreapesaresi82@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_124913_326247_1F5B7398 
X-CRM114-Status: GOOD (  13.11  )
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

The failure was first observed in normal use on a GL.iNet GL-MT6000
(MT7986). An iPhone using FT roamed between the 2.4 and 5 GHz BSSes
while generating traffic, then lost connectivity and the router
rebooted. The ramoops record from that reboot shows:

  Unable to handle kernel read from unreadable memory at virtual
  address 0000000000000010
  CPU: 1 PID: 1419 Comm: mt76-tx phy0
  Hardware name: GL.iNet GL-MT6000 (DT)
  pc : rcname_read+0x1ec/0x340 [mac80211]
  lr : ieee80211_get_tx_rates+0x140/0x4cc [mac80211]
  Call trace:
   rcname_read+0x1ec/0x340 [mac80211]
   ieee80211_get_tx_rates+0x140/0x4cc [mac80211]
   __mt76_tx_complete_skb+0x6bc/0x9a8 [mt76]
   mt76_tx_worker+0xb8/0x1f0 [mt76]
  Kernel panic - not syncing: Oops: Fatal exception in interrupt

ieee80211_8023_xmit() clears tx_info before queueing a frame for
hardware encapsulation and does not initialize info->band. This is
normally harmless because mt7915 uses the firmware rate stored in
wcid->tx_info.

During AP-side FT roaming, the WCID rate information can be unset
while an 802.3 skb remains queued. mt76 then falls back to
ieee80211_get_tx_rates() with band 0. On the 5 GHz PHY,
wiphy->bands[NL80211_BAND_2GHZ] is NULL, leading to a NULL pointer
dereference in rate control and a kernel panic.

Set info->band from the resolved PHY while dequeuing hardware-
encapsulated frames. The dequeue caller has already selected the PHY
using wcid->phy_idx.

Temporary diagnostic instrumentation and a same-MAC dual-radio FT
stress test with continuous traffic reproduced the invalid state twice
in 300 cycles on MT7981. Both cases had info->band=0, PHY band 1,
tx_info=0 and HW 802.11 encapsulation enabled.

With this fix applied, three independent 300-cycle runs completed on
MT7981 and MT7986 (900 cycles in total) without a router disconnect,
kernel warning or crash. Continued testing with the original iPhone
also exercised repeated FT roaming without recurrence.

Fixes: 55f7c9b02790 ("mt76: mt7915: add 802.11 encap offload support")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Andrea Pesaresi <andreapesaresi82@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/tx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/tx.c b/drivers/net/wireless/mediatek/mt76/tx.c
index 3707ee19e4..a168851959 100644
--- a/drivers/net/wireless/mediatek/mt76/tx.c
+++ b/drivers/net/wireless/mediatek/mt76/tx.c
@@ -406,6 +406,8 @@ mt76_txq_dequeue(struct mt76_phy *phy, struct mt76_txq *mtxq)
 
 	info = IEEE80211_SKB_CB(skb);
 	info->hw_queue |= FIELD_PREP(MT_TX_HW_QUEUE_PHY, phy->band_idx);
+	if (info->flags & IEEE80211_TX_CTL_HW_80211_ENCAP)
+		info->band = phy->chandef.chan->band;
 
 	return skb;
 }

base-commit: 1eeca1d5e0920fbdad6449768fd2d4364e714180
-- 
2.43.0


