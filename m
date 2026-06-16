Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277D5CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 11:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OjucF5goefZfuxikv7tCuZJMVpoPtgqO36vnpR26lfo=; b=ChYp754/txWxK931D8h3BIR2Fl
	m3X5tfREodbQizWv2gQdVwmFUq3HwEfHaatPxtzax9/MzmpKGBX+cK+azhDGfN4Y8TbrqUySPM97R
	J6H947i4/OLToHd71aPKhzbVMjVMrHxCE4z7TKsUkQkCqNdIgOFhqxRLLvP5c+GQ6CsKwDCyXUZxZ
	/MGLgnWV9Tf7+NWmPL5pwzoPa3YWruwGxC2xfVSt+WhBlDpZ8EW6mDtWXJ3iGkuYgB9aM6C443Lh6
	5Fc6S6nsagaS1T/oHi66UDTodyJq4xFRf0PFqNaBJ1CVWYS9hWGO8HMlXGhAhwXpZHIFyDZl3jT2q
	b89cT2Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZRj4-0000000Ff50-022l;
	Tue, 16 Jun 2026 11:13:02 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZRix-0000000Fezp-2vih
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 11:12:57 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-842848fd613so3833382b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 04:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781608375; x=1782213175; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OjucF5goefZfuxikv7tCuZJMVpoPtgqO36vnpR26lfo=;
        b=KH7jIthjRXPaYezLuyvP3vunumeVab8z5EIxe7hlrt4gDudLRZNrsTAh8oYdjwGgSt
         WVWdAyoY03As0Wy6/W+t0ROJGKKBgcmU6p/r2QVM2KOULfmEoPpyOyCxupPpfWKjjaaN
         Tm4DinUXCswdZEACzABuciRmu/XICQkGYiMCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781608375; x=1782213175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OjucF5goefZfuxikv7tCuZJMVpoPtgqO36vnpR26lfo=;
        b=e6X5T6LGflKq73SzHpehGfteURcELWDSi7V5Yi9Hfu3315TqLptFPgTdQTGX7YN/dF
         pM2Wrn1gZlsX9I2/BOF0panmuRkpH10cP7h0ka6yTWp+MQPq+6RB69QZCUfi7VTTsCnq
         RczRyz0V9ojh/wX+YQhnWNwv0BS6o+5l0OxeGisWcwK8rzyGM3k7Ru6D+HLrbNVngaFX
         hkYVRFotGNRESyt3ubVvQwMRmpUugRfTgzMVSgXpvSu4JuX3FtsE2C1Yapt4BCLKrXiY
         ihr/WWL5UVU+Fwfl7pMamIl5JKLD80YbkAv9Tz/aBSyW+W2r3ySQ61HKzlN2IIg2xkrd
         gxVA==
X-Forwarded-Encrypted: i=1; AFNElJ+4lPVcX/U+wkUHXt7QF+mQCVW0GOz5AR/up/wL4HLih9kVfNXk5sVSn5ASd+DZkcD60ye+eQb/fZ7Tlb/3Se22@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/pZ2mKcOf1zzxPljps15n0hvdGxh+w+tH8ETD8eSPKe7vua/B
	tuhPDIpw1rBmpAtjQhFBNBWKDMvgpJiEyAj1ELYX62LYhThn1ESGZ3+DXK+g2j72/Q==
X-Gm-Gg: Acq92OFd2ejOXN5zTgSqwODys1sw2E/H6fzgXaNcV0nY/KXoWcmscItPJxumB6Qwx9m
	QWS+JBh3Nrfzhej25qqGpJfyoUTCeuSb7TGddcuNR05Uw2l7/KbxA+ISwpNblukplsZ8HqZLLzz
	tmay4lqi8DHCmyKaHVxrnXyCCcpXcxFr4s5OYUlsCEOmOcqexItS1984W9X7gy/IOqi39es6s7w
	xO3kQG4fhYfilxvxFUGKuM3K2sg2cT1AlMshUYwmVTx1TBI1+fi/hhjI92c0AAV0PRXnpaJrO9w
	5hmrDDPWZ/WlcD76VE0Ir7FDi3G4RMhR73gSrI3qRcni7xWO/CM3lnGE16mpqFEePESh2B7PHo8
	lJTAJ6MGUH3d6weT1HS+Sl/+2Po6qXJrvZWd8weuepy3iJ17PawfDXLzobtCzlPR2LPcTxdqBT2
	GuPRLkg/Lg84GwK8nYXnH1RoC4Q8gLUjXGDX/qbBFEE9XYVRmkjK8sBz+yx74UsUxnpWXEojwIc
	xIJ+ZQ1iHHA
X-Received: by 2002:a05:6a00:1d85:b0:841:de16:8a8f with SMTP id d2e1a72fcca58-8451530c1d1mr3127048b3a.7.1781608375147;
        Tue, 16 Jun 2026 04:12:55 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2a00:79e0:2031:6:a0b:fabb:5b62:b85b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b05921bsm12906321b3a.59.2026.06.16.04.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 04:12:54 -0700 (PDT)
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
Subject: [PATCH v2 3/3] Bluetooth: btmtksdio: call cancel_work_sync() outside of host lock scope
Date: Tue, 16 Jun 2026 20:12:08 +0900
Message-ID: <20260616111224.152140-4-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
In-Reply-To: <20260616111224.152140-1-senozhatsky@chromium.org>
References: <20260616111224.152140-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_041255_833171_A93DF6D9 
X-CRM114-Status: GOOD (  12.25  )
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

cancel_work_sync() should be called outside of host lock scope
in order to avoid circular locking scenario:

CPU0					CPU1
					close()/reset()
					sdio_claim_host()
txrx_work
  sdio_claim_host() // sleeps
					cancel_work_sync() // sleeps

In addition, when txrx_work() runs concurrently with close()/reset()
it better not to re-enable interrupts by testing for BTMTKSDIO_FUNC_ENABLED
and not BTMTKSDIO_HW_RESET_ACTIVE before C_INT_EN_SET write.  However,
btmtksdio_close() clears the BTMTKSDIO_FUNC_ENABLED too late (after
cancel_work_sync() call).  Move BTMTKSDIO_FUNC_ENABLED bit-clear earlier
so that txrx_work can see concurrent close().

Fixes: 26270bc189ea4 ("Bluetooth: btmtksdio: move interrupt service to work")
Cc: stable@vger.kernel.org
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/bluetooth/btmtksdio.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index d8c8d2857527..207d04cc2282 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -625,7 +625,9 @@ static void btmtksdio_txrx_work(struct work_struct *work)
 	} while (int_status && time_is_after_jiffies(txrx_timeout));
 
 	/* Enable interrupt */
-	if (bdev->func->irq_handler)
+	if (bdev->func->irq_handler &&
+	    test_bit(BTMTKSDIO_FUNC_ENABLED, &bdev->tx_state) &&
+	    !test_bit(BTMTKSDIO_HW_RESET_ACTIVE, &bdev->tx_state))
 		sdio_writel(bdev->func, C_INT_EN_SET, MTK_REG_CHLPCR, NULL);
 
 	sdio_release_host(bdev->func);
@@ -741,6 +743,8 @@ static int btmtksdio_close(struct hci_dev *hdev)
 	if (!test_bit(BTMTKSDIO_FUNC_ENABLED, &bdev->tx_state))
 		return 0;
 
+	clear_bit(BTMTKSDIO_FUNC_ENABLED, &bdev->tx_state);
+
 	sdio_claim_host(bdev->func);
 
 	/* Disable interrupt */
@@ -748,11 +752,12 @@ static int btmtksdio_close(struct hci_dev *hdev)
 
 	sdio_release_irq(bdev->func);
 
+	sdio_release_host(bdev->func);
 	cancel_work_sync(&bdev->txrx_work);
+	sdio_claim_host(bdev->func);
 
 	btmtksdio_fw_pmctrl(bdev);
 
-	clear_bit(BTMTKSDIO_FUNC_ENABLED, &bdev->tx_state);
 	sdio_disable_func(bdev->func);
 
 	sdio_release_host(bdev->func);
@@ -1295,7 +1300,10 @@ static void btmtksdio_reset(struct hci_dev *hdev)
 
 	sdio_writel(bdev->func, C_INT_EN_CLR, MTK_REG_CHLPCR, NULL);
 	skb_queue_purge(&bdev->txq);
+
+	sdio_release_host(bdev->func);
 	cancel_work_sync(&bdev->txrx_work);
+	sdio_claim_host(bdev->func);
 
 	gpiod_set_value_cansleep(bdev->reset, 1);
 	msleep(100);
-- 
2.54.0.1136.gdb2ca164c4-goog


