Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F77C55179
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 14:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6NEy/PUFP4IYziRxlFsuxGJ+UKXD+3O9hbIQf+7B02s=; b=CUuusFXlVphDhIIq6vTZrFjkIy
	XzIc5fHo8kryq1zfvMtsGM9nmyq33uYQ3E2kjyNcutNseUYm88u2nv74PJuC0+9wVa+N0cIErOPRM
	cFYPFsVJMu4krvlVMsM9km6cfa+ME8SYMXaKvmDEE5ZD8/WS+VaxoPF9z+Pu6BvPr1bOpBaXovlvP
	xHn42TWsMlYLzjgA7WxY3fOGudbuUYp8AuqaRj4OKm34fI85ddxXM679PMyWE0qn34wTpBmgg9EVR
	vF+gQLfiYzHByx3yFpGSF11MQj6r0OoxAm0HHEbvR6nncf+kV9XBLHAYGixVuOH/icVBK+KdvAis/
	0a8D/9Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtmD-0000000HP0Q-2aCg;
	Mon, 03 Aug 2026 14:36:25 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtmB-0000000HOzF-22a9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 14:36:24 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-47f6981d244so172894f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 07:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785767781; x=1786372581; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6NEy/PUFP4IYziRxlFsuxGJ+UKXD+3O9hbIQf+7B02s=;
        b=B5130qzJEeFNzEvUVJYNolexYepCcEl0ygk+LUq/EDe9v1qSHktG0psfLI65wbEzHE
         TBber54ICv8rcRLrHFCrpKj/owtu7uVng3u0WyVHWN0ExKR8JY9vTxjwi8XrZbuUtdAD
         6zQMMcfuUjZ2zRUVm6KlhkNcjIx0OiyG3eozCRVXtjuswq7J2C5a/AZSD1YG8hIC83KE
         eCHsAWvYa+RtyDauQdCs8IB5RjIkOmBwQxO68/2s7IF05A4e9nkhimjeAn2hVZ+m7n8G
         NUXEKqTTNu+iNPDn7bN4d3rDh0OvUBhPr/LMfBw1FOie3qwcaudu+dUNsU96uIGpUKb/
         /L6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785767781; x=1786372581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6NEy/PUFP4IYziRxlFsuxGJ+UKXD+3O9hbIQf+7B02s=;
        b=U3bPF5sEIJUNmkECtF/3lotqPPlbENl3hdVZxQAwm4DJdYEEdNkEjsJFwqiKiQh1ZS
         7TnwuUH3iY0GtAbhn9fihSlmyGMsNibpO712jBEH2xAh7w6Qq3FHTqQhZgqObv64WBQT
         d6PypBnmG9GM2Wio4J1lan8Sre09GUFvXROBIgxJxGFvwiAFOxAfxH1vkpn6VfjoGkSF
         mydyAAUBo3tDueyrhGyne4DOOQS3QSjRjmcIZzHfRhtVrEJf9A4GD8O4SBpgGq9rti3p
         7EmLkbeNoqJbdG7fSx0fDfmo1d+hhFJW6fUfrxyYmBF+WYoRRmG9JGy/Z+3RlIbvm6rl
         H0IQ==
X-Forwarded-Encrypted: i=1; AHgh+RpYWCI4S4gVfcnErQHqqrlFzT8Bra4iddSQZDRomX89J456bWK/rv5S65440esEC71DwH9vZvtYrUdXjwhUxtqQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yzc5gKi/gcOgH3eUXcSH6pwz6K2Q104fDLO/21LagjWbTBrrPrB
	PC4Fivc+O0XqdPcSHjMv7DaKxRBJ+q0e1SO75svUPqcycCFa3t6hRcdiLAOzpJdc
X-Gm-Gg: AR+sD13dJ/2r5/U6CjRHimopE3dU2pR2jo7+Nzld9h1DD8sQ267ixBB4w8k9JeOrnfo
	hq+T9wOsiNUf+ZkYWXgK6ieY3JgEItf4bU/IrlQRRUU2rb2aWbKCMtYHpMT5fgPm2/XnIDMMLG7
	SLrTPVqlz+462cQWZ690BgCtH3gWrEi4j35ETBeiADXDvNvjhwdxGx9uI/JyAm4+enBf/VkLRWs
	DR0SZejZ1npNc5hDqRa9hCGaPbI4AWTWtZGfbSSl6mJKL/tdu+hJTjmPfn2eeVfuGRLvUh4VXPP
	qULDruOpN98ORhtEiE7e+q9rYitcdGitP2xgx//cm+m5rMzYrSP798OJKNB9uU4rtVsMOOdxuFB
	lL4XwdC8IPsKYXtExFamcph5F/zH1SZPQTe4H6HsvjuEed85ih7rHfMzUZwpcEWQsgph2SEgWvA
	I61H0WeDAgNT+pfG37qfO6HoKBTqcqQ0HrXr1Z5rejCpM4F2RUqHXTr5W+SbTx899o6x3XkYL37
	O8SnaCa8W7utw==
X-Received: by 2002:a05:6000:382:b0:47f:946b:d3fc with SMTP id ffacd0b85a97d-47fd72e31eemr14371381f8f.2.1785767780705;
        Mon, 03 Aug 2026 07:36:20 -0700 (PDT)
Received: from thomas-precision3591.. ([2a04:cec0:101e:c128:c461:1b2d:86b8:e437])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47fd41cfdc6sm32663260f8f.8.2026.08.03.07.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:36:19 -0700 (PDT)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org (open list:MEDIATEK MT76 WIRELESS LAN DRIVER),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH net] wifi: mt76: sdio: Fix possible data race when dequeuing skb
Date: Mon,  3 Aug 2026 16:35:08 +0200
Message-ID: <20260803143510.49558-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_073623_544302_29A0DCA1 
X-CRM114-Status: GOOD (  14.56  )
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

The next entry of the queue is saved as a refenrence and immediately
removed from the list, before processing the skb. It can thus be
overwritten by the queuing function at the same time as .rx_skb() is
called.

Split mt76s_get_next_rx_entry() to get the tail, and once it is
processed, pop the element.

This patch was compile-tested only.

This patch depends on commit 16254fc51f7d ("mt76: sdio: fix use of q->head and q->tail").

Fixes: d39b52e31aa6 ("mt76: introduce mt76_sdio module")
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/sdio.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/sdio.c b/drivers/net/wireless/mediatek/mt76/sdio.c
index 8bae77c761be..12ee781a62f4 100644
--- a/drivers/net/wireless/mediatek/mt76/sdio.c
+++ b/drivers/net/wireless/mediatek/mt76/sdio.c
@@ -371,14 +371,21 @@ mt76s_get_next_rx_entry(struct mt76_queue *q)
 	spin_lock_bh(&q->lock);
 	if (q->queued > 0) {
 		e = &q->entry[q->tail];
-		q->tail = (q->tail + 1) % q->ndesc;
-		q->queued--;
 	}
 	spin_unlock_bh(&q->lock);
 
 	return e;
 }
 
+static void
+mt76s_clear_next_rx_entry(struct mt76_queue *q)
+{
+	spin_lock_bh(&q->lock);
+	q->tail = (q->tail + 1) % q->ndesc;
+	q->queued--;
+	spin_unlock_bh(&q->lock);
+}
+
 static int
 mt76s_process_rx_queue(struct mt76_dev *dev, struct mt76_queue *q)
 {
@@ -397,6 +404,9 @@ mt76s_process_rx_queue(struct mt76_dev *dev, struct mt76_queue *q)
 
 		dev->drv->rx_skb(dev, MT_RXQ_MAIN, e->skb, NULL);
 		e->skb = NULL;
+
+		mt76s_clear_next_rx_entry(q);
+
 		nframes++;
 	}
 	if (qid == MT_RXQ_MAIN)
-- 
2.43.0


