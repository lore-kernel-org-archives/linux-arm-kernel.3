Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C0E0CD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 12:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=md0oLfExsjhQ5s9zgCStyVmZOOcuKHtb2pCgbVaO+NY=; b=r7yaVG0kTp0eKmdfkO4TrDkFs5
	tp8+tImWYXuH51M96GgB4cE9arfW6/Ug5IMn/P2VZANg2uYtC7yba2DKhvlZ5FNEAFYH8Z5Mgx6+h
	nZuA3dqRticJy2LysJF3S20QfmLT6JA9ZE+TFq6fzbLY/f0dCdGhHx9dW1z/8KH2zx1L8WYjB6h4e
	O8Qlc9wvbMQjlFG5u7UlQ35ghj2SYRO/fgZMNG3HMQFMo3ZhGgn0FrDwy81onO5f7ZtE2vrRRJe6a
	kYzsn/YgAtSEX6JGbJ5TXNDDz30F30AXoZybw4K7vIWNRQRBLvdCIMusOi9D908/TKNgGjBuhM7zt
	nKRlR48A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWvL5-00000005VF0-2CD5;
	Tue, 09 Jun 2026 12:13:51 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWvL3-00000005VEA-0ZHN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 12:13:51 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-36dac5d5d05so2877135a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 05:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781007227; x=1781612027; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=md0oLfExsjhQ5s9zgCStyVmZOOcuKHtb2pCgbVaO+NY=;
        b=aXBuRPlWfP5qqTqi9w2+i/+HnIy84dGugLEa6sYEXCseEFij5rbMt26tOYnmk87CU+
         z0YQSfdsWmm+URtI4OOAAV4bxaOJx/8kki3ZczNQKze2ad2EOkNGjfRylA5RYg9OowTP
         HLU2MnNclqJfWHMWEOkl/RFQrbW+htrMPZUE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781007227; x=1781612027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=md0oLfExsjhQ5s9zgCStyVmZOOcuKHtb2pCgbVaO+NY=;
        b=qZQItw1hRLf4kxt4DaQ3XMtCq6E62C6wq+wFjvyXTP0rJixKTRxPUMcs2KwS0mjtw9
         jWApxdrIE/qry7mqfOw+h94jxghjnfa2iHiF7CrQWzzUfU9vEEklRk8P+s1IpBTCARrw
         zkpdYr26P54n4vMDVQSkz7CqyVH8wwuTlePp5/szTZCkJBqiFCn32eCvlnwFxQK6yy8K
         ppR1xWqnu9St5h3P4WC8UmqpglCZaSRnbolHzDYS1X9rIgg16Bceduk7Cevj8zR0yLQH
         4rakIFhkS2mkI82kwUg2XTSn/QjCkuCgJQjNNIwx+bFoptxIiwakG6bNC0YBlF/H265m
         T9xA==
X-Forwarded-Encrypted: i=1; AFNElJ9lzTvbmMYdOQEAq+vIm6kRS/JItwFLx6qRsnLwL8E2TbrxkygN+g3ipk/oQt3w5EaVAjyNvYrRDuTKUCHNee4P@lists.infradead.org
X-Gm-Message-State: AOJu0YxXb/aq7KRESLKvI8x101T+88ZUQGqvbHUzyIWn9L0lcVfy/nnt
	DUQq+Rrn9OnGuTyT07r5UMcHztbXCOEZPjUhAXA+jrhQtnZS4JeXh1sp5cHwCHuk+IaCGaz4nfy
	yZYA=
X-Gm-Gg: Acq92OE/cA9a0Ut1axgvuUtq5i+NQNUKgh14NDh4hvLMVclnKYhyZsdbx/dlec38fux
	vHSLpbZsYrpQED2A6KPCwongtwjzn2AnTxaQNXBH6LTyVq9JC/n+B91C2AE2gIxL3sbxgo08erB
	HqTWRb2DDT0C0UKKuDUq1uq5R2z/hR0dnndufWttK66u+ng8QjrOKWRn9oceV0VILic5J8q9/fp
	VsMELJefPSyo15Gz4ctBxiPcchVm7CFENSiXSujOXO5mjOvcaELVkDK2rxrMaHnL73/wlFVVk2T
	Ldj0aLqKTSsh28ymUe9iqF0kNUyE8qOTjeLNBdficpJ7S3e9v0HFbE98tlu5XqZU8GQygTEolNB
	Te8HnKeZZEJDCFF9MHkc3dR+vLrsTRzNqQyiy8Y0VpFsPFd8/vECmr83iOkCCpNd8GKF7f5HE+u
	f+xtQEiPQFhzkC92NA4JxUgg5Ruk5no84ob/bPHwMQpQKOQcpWlyu95VuEAvH1BHjik5ONQGaYr
	amctXKL3V5RkOFE0MjaFAm/
X-Received: by 2002:a17:903:fad:b0:2b2:ebed:7af5 with SMTP id d9443c01a7336-2c1e7b13addmr221626095ad.13.1781007227564;
        Tue, 09 Jun 2026 05:13:47 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2a00:79e0:2031:6:62ce:f303:81a5:1cce])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d37esm279998175ad.9.2026.06.09.05.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 05:13:45 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Mark-yw Chen <mark-yw.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Cc: Tomasz Figa <tfiga@chromium.org>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	stable@vger.kernel.org
Subject: [PATCH] Bluetooth: btmtksdio: fix infinite loop in btmtksdio_txrx_work()
Date: Tue,  9 Jun 2026 21:10:06 +0900
Message-ID: <20260609121329.1262170-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.54.0.1064.gd145956f57-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_051349_449106_CBB3A2D1 
X-CRM114-Status: GOOD (  14.33  )
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

Every once in a while we see a hung btmtksdio_flush() task:

 INFO: task kworker/u17:0:189 blocked for more than 122 seconds.
 __cancel_work_timer+0x3f4/0x460
 cancel_work_sync+0x1c/0x2c
 btmtksdio_flush+0x2c/0x40
 hci_dev_open_sync+0x10c4/0x2190
 [..]

It all boils down to incorrect time_is_before_jiffies() usage in
btmtksdio_txrx_work().  The btmtksdio_txrx_work() loop is expected
to be terminated if running for longer than 5*HZ.  However the
timeout check is twisted:  time_is_before_jiffies(old_jiffies + 5*HZ)
evaluates to true when old_jiffies + 5*HZ is in the past i.e. when a
timeout has occurred.  Using OR with time_is_before_jiffies(txrx_timeout)
means that:
- before the 5-second timeout: the condition is `int_status || false`,
  so it loops as long as there are pending interrupts.
- after the 5-second timeout: the condition becomes `int_status || true`,
  which is always true.

When the loop becomes infinite btmtksdio_txrx_work() loop never
terminates and never releases the SDIO host.

Fix loop termination condition to actually enforce a 5*HZ timeout.

Fixes: 26270bc189ea4 ("Bluetooth: btmtksdio: move interrupt service to work")
Cc: stable@vger.kernel.org
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/bluetooth/btmtksdio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index 5b0fab7b89b5..c6f80c419e90 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -620,7 +620,7 @@ static void btmtksdio_txrx_work(struct work_struct *work)
 			if (btmtksdio_rx_packet(bdev, rx_size) < 0)
 				bdev->hdev->stat.err_rx++;
 		}
-	} while (int_status || time_is_before_jiffies(txrx_timeout));
+	} while (int_status && time_is_after_jiffies(txrx_timeout));
 
 	/* Enable interrupt */
 	if (bdev->func->irq_handler)
-- 
2.54.0.1064.gd145956f57-goog


