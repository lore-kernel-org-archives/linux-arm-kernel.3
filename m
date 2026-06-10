Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED2CCD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 10:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ccE2EB2fnzyeaAU6yY7eDAKmvbXrjVPbtb4CUqU9a2E=; b=QkWT8h1RoVycQr/GwA48+rydxt
	jXDa/3UvQ9c5AHqK6Y3FMIaCO/sGe8cKHPqFTtiJ0dx0uCSZmXtEnHdZCatj0r4jLa8wWKjufHcdV
	6lKuJ1wDFUfl7d5qdmeunUzbBbIGW8z0L25qq9pDni24YXWfkzPjddmCAp+vfu+n5I4HDAEGf06Rx
	SZnWCt4kEQ2/mZ61GfNtcJS6Hb/VK/ftPjg5PrCBIeqXMzUicr6mramWxtGOIRpcoknFs2Qx1HCE3
	7PzCEictRc4YFwFvpHbTHtYbiGEwq29groQ/+n5kOg2G7OaHw6oj7IwiitsWehXhYTTJZ0GFA4EPx
	REMhubxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXG3H-00000007MrM-1i4a;
	Wed, 10 Jun 2026 10:20:51 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXG3E-00000007Moj-169l
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 10:20:50 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2c168baac83so31070955ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 03:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781086847; x=1781691647; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ccE2EB2fnzyeaAU6yY7eDAKmvbXrjVPbtb4CUqU9a2E=;
        b=q/ARTPa8nsw94gy79M3OJDe/Z5bqM1F0vq3a2Bi0BZL4qHp2vZFxdKneZneHYRZFEW
         W8UDNHvnWVzmvlgl1WEITWSfZObHB+/Md85AuTd7g0DFD9PTuMY3wb4C3g6YZy70NKh1
         rnZR6Pnrucx/WDJ02g6cshpQ8uHTFrnNSVoGJGmV/I4v8ti6wEamboOyuF7XiZG9BjRv
         cUlVb9ZUs13k+lAz2vuRZAkjDVP44ho3hPlPxOmn5DX/47gTuN5JTt0yi/Bty4CmBB3N
         MJpeoX4D23k+9QFeH9IdEiVE0uxpGF6S37MWb7ajK93bKDewlncn+pngO0GOnxfv2TLG
         Voqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781086847; x=1781691647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ccE2EB2fnzyeaAU6yY7eDAKmvbXrjVPbtb4CUqU9a2E=;
        b=I/HZ0Ugs+xFVzAHp/ObHlrPTEld8Ma1sJZzppD/05KI52FxFhXbC00rV2Z4v6uFa8n
         PFUcOHXJkpmwskwhKn3I1ZRqzrPD2VmvIgjzvdHjNCEbR3TGf0yls8dHewFSnlfT1OQS
         a+8EABihH/D8CrXMgrZ0BV3qbwVk/AMFO5HYtZq1JnXzdUwB/uMD/rW1kl7DymjyaIRN
         yJIbyLbP94si90sYulOAq6pMpCi9BSlBnXG26eoOkuG4RqRnMGvX3vxTcG1kit8Wmgwr
         aMirUx3LB2BRdEmqFBZ7tD/ZGpUT69ml6pe+FlWXzT3cYKBhaNFh+fCDkUkBhIt5eTZX
         ExZw==
X-Forwarded-Encrypted: i=1; AFNElJ858ulC+xj64/WJnTbcrCg15ru+bmtgpQil67q9HjApCbF+B9qXQ/x7unTo7iWNx8iMnmKllnCCedQtsp9RWgFH@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4uplp2AVPnUDyQ7C0W8zrAvJf0VCHWfULJyya2dMNE9pHzWw2
	urV/37jRXRqF3UeW0PbBOiNioHgxU+CmspMv7hrnfD/e1A3zT1NIij+4
X-Gm-Gg: Acq92OFwS8gray6JAtmvtbM+oll7WoDGV7378mGLIuu2+m/96HZEioNd4fbthu9TFVH
	RbdMiD7kUWQQMr7xxjjb0ETC5+NKK/HBwLe+J2N0VR+uNNxg3CFEWsRQ9WYNzl00z+HaTQyrNed
	QiqgOhRfnLSkk45eEHQUmGBtsDPfVhBEQqvyLVNoItbaxJ8SGAKMmjwR8Hf0BpiFGjRswdfPbMc
	FcJX/te29ZoQGqclRde9Ef7re0PG8+WSBy2sJbt2xwTJMSwPxsVxfTH032estb8urHEHCQdHA4j
	IJQ95CdsHPaWkagq22izo5uCeD0ZXGrgBfbQFkWiRHRJsOwi+D8bR/S5KiIXKlQz50V295Ado+e
	hxo0pYDuPdGetCukflSHaZBwAiazAQDrO3ZoAqHgQdBlUWRmN8pzKYDj2bnGrRbjKt+fzRnTQy6
	oOqjysSuLdAwP7xwvo9KB9YxLEHScR6qrFL+IacgalDM+ohAQD3PShdOH0bTygYwj+SVRE
X-Received: by 2002:a17:903:b0b:b0:2b4:6080:d4d0 with SMTP id d9443c01a7336-2c1e80ec3b7mr273180005ad.22.1781086847357;
        Wed, 10 Jun 2026 03:20:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f96b3fsm250133875ad.29.2026.06.10.03.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 03:20:46 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 02/10] ASoC: mediatek: common: mtk-btcvsd: Use guard() for spin locks
Date: Wed, 10 Jun 2026 17:20:13 +0700
Message-ID: <20260610102021.83273-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610102021.83273-1-phucduc.bui@gmail.com>
References: <20260610102021.83273-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_032048_315552_09A9DC06 
X-CRM114-Status: GOOD (  16.66  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/common/mtk-btcvsd.c | 81 +++++++++++---------------
 1 file changed, 35 insertions(+), 46 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-btcvsd.c b/sound/soc/mediatek/common/mtk-btcvsd.c
index 5e7e85b4c98a..85cfc602dfd3 100644
--- a/sound/soc/mediatek/common/mtk-btcvsd.c
+++ b/sound/soc/mediatek/common/mtk-btcvsd.c
@@ -319,7 +319,6 @@ static int btcvsd_tx_clean_buffer(struct mtk_btcvsd_snd *bt)
 {
 	unsigned int i;
 	unsigned int num_valid_addr;
-	unsigned long flags;
 	enum BT_SCO_BAND band = bt->band;
 
 	/* prepare encoded mute data */
@@ -330,7 +329,7 @@ static int btcvsd_tx_clean_buffer(struct mtk_btcvsd_snd *bt)
 		       table_msbc_silence, SCO_PACKET_180);
 
 	/* write mute data to bt tx sram buffer */
-	spin_lock_irqsave(&bt->tx_lock, flags);
+	guard(spinlock_irqsave)(&bt->tx_lock);
 	num_valid_addr = bt->tx->buffer_info.num_valid_addr;
 
 	dev_info(bt->dev, "%s(), band %d, num_valid_addr %u\n",
@@ -349,7 +348,6 @@ static int btcvsd_tx_clean_buffer(struct mtk_btcvsd_snd *bt)
 					     bt->tx->buffer_info.packet_length,
 					     bt->tx->buffer_info.packet_num);
 	}
-	spin_unlock_irqrestore(&bt->tx_lock, flags);
 
 	return 0;
 }
@@ -365,7 +363,6 @@ static int mtk_btcvsd_read_from_bt(struct mtk_btcvsd_snd *bt,
 	int pv;
 	u8 *src;
 	unsigned int packet_buf_ofs;
-	unsigned long flags;
 	unsigned long connsys_addr_rx, ap_addr_rx;
 
 	connsys_addr_rx = *bt->bt_reg_pkt_r;
@@ -385,7 +382,7 @@ static int mtk_btcvsd_read_from_bt(struct mtk_btcvsd_snd *bt,
 				     bt->rx->temp_packet_buf, packet_length,
 				     packet_num);
 
-	spin_lock_irqsave(&bt->rx_lock, flags);
+	guard(spinlock_irqsave)(&bt->rx_lock);
 	for (i = 0; i < blk_size; i++) {
 		packet_buf_ofs = (bt->rx->packet_w & SCO_RX_PACKET_MASK) *
 				 bt->rx->packet_size;
@@ -403,7 +400,7 @@ static int mtk_btcvsd_read_from_bt(struct mtk_btcvsd_snd *bt,
 		       SCO_CVSD_PACKET_VALID_SIZE);
 		bt->rx->packet_w++;
 	}
-	spin_unlock_irqrestore(&bt->rx_lock, flags);
+
 	return 0;
 }
 
@@ -414,7 +411,6 @@ static int mtk_btcvsd_write_to_bt(struct mtk_btcvsd_snd *bt,
 				  unsigned int blk_size)
 {
 	unsigned int i;
-	unsigned long flags;
 	u8 *dst;
 	unsigned long connsys_addr_tx, ap_addr_tx;
 	bool new_ap_addr_tx = true;
@@ -430,17 +426,17 @@ static int mtk_btcvsd_write_to_bt(struct mtk_btcvsd_snd *bt,
 		return -EIO;
 	}
 
-	spin_lock_irqsave(&bt->tx_lock, flags);
-	for (i = 0; i < blk_size; i++) {
-		memcpy(bt->tx->temp_packet_buf + (bt->tx->packet_size * i),
-		       (bt->tx_packet_buf +
-			(bt->tx->packet_r % SCO_TX_PACKER_BUF_NUM) *
-			bt->tx->packet_size),
-		       bt->tx->packet_size);
+	scoped_guard(spinlock_irqsave, &bt->tx_lock) {
+		for (i = 0; i < blk_size; i++) {
+			memcpy(bt->tx->temp_packet_buf + (bt->tx->packet_size * i),
+			       (bt->tx_packet_buf +
+				(bt->tx->packet_r % SCO_TX_PACKER_BUF_NUM) *
+				bt->tx->packet_size),
+			       bt->tx->packet_size);
 
-		bt->tx->packet_r++;
+			bt->tx->packet_r++;
+		}
 	}
-	spin_unlock_irqrestore(&bt->tx_lock, flags);
 
 	dst = (u8 *)ap_addr_tx;
 
@@ -462,11 +458,11 @@ static int mtk_btcvsd_write_to_bt(struct mtk_btcvsd_snd *bt,
 	if (new_ap_addr_tx) {
 		unsigned int next_idx;
 
-		spin_lock_irqsave(&bt->tx_lock, flags);
-		bt->tx->buffer_info.num_valid_addr++;
-		next_idx = bt->tx->buffer_info.num_valid_addr - 1;
-		bt->tx->buffer_info.bt_sram_addr[next_idx] = ap_addr_tx;
-		spin_unlock_irqrestore(&bt->tx_lock, flags);
+		scoped_guard(spinlock_irqsave, &bt->tx_lock) {
+			bt->tx->buffer_info.num_valid_addr++;
+			next_idx = bt->tx->buffer_info.num_valid_addr - 1;
+			bt->tx->buffer_info.bt_sram_addr[next_idx] = ap_addr_tx;
+		}
 		dev_info(bt->dev, "%s(), new ap_addr_tx = 0x%lx, num_valid_addr %d\n",
 			 __func__, ap_addr_tx,
 			 bt->tx->buffer_info.num_valid_addr);
@@ -701,17 +697,16 @@ static ssize_t mtk_btcvsd_snd_read(struct mtk_btcvsd_snd *bt,
 {
 	ssize_t read_size = 0, read_count = 0, cur_read_idx, cont;
 	unsigned long avail;
-	unsigned long flags;
 	unsigned int packet_size = bt->rx->packet_size;
 
 	while (count) {
-		spin_lock_irqsave(&bt->rx_lock, flags);
-		/* available data in RX packet buffer */
-		avail = (bt->rx->packet_w - bt->rx->packet_r) * packet_size;
+		scoped_guard(spinlock_irqsave, &bt->rx_lock) {
+			/* available data in RX packet buffer */
+			avail = (bt->rx->packet_w - bt->rx->packet_r) * packet_size;
 
-		cur_read_idx = (bt->rx->packet_r & SCO_RX_PACKET_MASK) *
-			       packet_size;
-		spin_unlock_irqrestore(&bt->rx_lock, flags);
+			cur_read_idx = (bt->rx->packet_r & SCO_RX_PACKET_MASK) *
+				       packet_size;
+		}
 
 		if (!avail) {
 			int ret = wait_for_bt_irq(bt, bt->rx);
@@ -749,9 +744,8 @@ static ssize_t mtk_btcvsd_snd_read(struct mtk_btcvsd_snd *bt,
 			return -EFAULT;
 		}
 
-		spin_lock_irqsave(&bt->rx_lock, flags);
-		bt->rx->packet_r += read_size / packet_size;
-		spin_unlock_irqrestore(&bt->rx_lock, flags);
+		scoped_guard(spinlock_irqsave, &bt->rx_lock)
+			bt->rx->packet_r += read_size / packet_size;
 
 		read_count += read_size;
 		count -= read_size;
@@ -778,7 +772,6 @@ static ssize_t mtk_btcvsd_snd_write(struct mtk_btcvsd_snd *bt,
 				    size_t count)
 {
 	int written_size = count, avail, cur_write_idx, write_size, cont;
-	unsigned long flags;
 	unsigned int packet_size = bt->tx->packet_size;
 
 	/*
@@ -794,14 +787,14 @@ static ssize_t mtk_btcvsd_snd_write(struct mtk_btcvsd_snd *bt,
 	bt->tx->buf_data_equivalent_time *= 1000;
 
 	while (count) {
-		spin_lock_irqsave(&bt->tx_lock, flags);
-		/* free space of TX packet buffer */
-		avail = bt->tx->buf_size -
-			(bt->tx->packet_w - bt->tx->packet_r) * packet_size;
+		scoped_guard(spinlock_irqsave, &bt->tx_lock) {
+			/* free space of TX packet buffer */
+			avail = bt->tx->buf_size -
+				(bt->tx->packet_w - bt->tx->packet_r) * packet_size;
 
-		cur_write_idx = (bt->tx->packet_w % SCO_TX_PACKER_BUF_NUM) *
-				packet_size;
-		spin_unlock_irqrestore(&bt->tx_lock, flags);
+			cur_write_idx = (bt->tx->packet_w % SCO_TX_PACKER_BUF_NUM) *
+					packet_size;
+		}
 
 		if (!avail) {
 			int ret = wait_for_bt_irq(bt, bt->tx);
@@ -838,9 +831,8 @@ static ssize_t mtk_btcvsd_snd_write(struct mtk_btcvsd_snd *bt,
 			return -EFAULT;
 		}
 
-		spin_lock_irqsave(&bt->tx_lock, flags);
-		bt->tx->packet_w += write_size / packet_size;
-		spin_unlock_irqrestore(&bt->tx_lock, flags);
+		scoped_guard(spinlock_irqsave, &bt->tx_lock)
+			bt->tx->packet_w += write_size / packet_size;
 		count -= write_size;
 	}
 
@@ -985,7 +977,6 @@ static snd_pcm_uframes_t mtk_pcm_btcvsd_pointer(
 	int hw_packet_ptr;
 	int packet_diff;
 	spinlock_t *lock;	/* spinlock for bt stream control */
-	unsigned long flags;
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		lock = &bt->tx_lock;
@@ -995,7 +986,7 @@ static snd_pcm_uframes_t mtk_pcm_btcvsd_pointer(
 		bt_stream = bt->rx;
 	}
 
-	spin_lock_irqsave(lock, flags);
+	guard(spinlock_irqsave)(lock);
 	hw_packet_ptr = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ?
 			bt->tx->packet_r : bt->rx->packet_w;
 
@@ -1018,8 +1009,6 @@ static snd_pcm_uframes_t mtk_pcm_btcvsd_pointer(
 
 	bt_stream->prev_frame = frame;
 
-	spin_unlock_irqrestore(lock, flags);
-
 	return frame;
 }
 
-- 
2.43.0


