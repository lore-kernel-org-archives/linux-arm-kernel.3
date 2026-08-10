Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E52C5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 10:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UaiKz12rre+TEb0L0zwF2Ar518hheHMHyzdiIuPJmqA=; b=2Y1Rfgtw2iwc3C6evSUh6mb/Bm
	Pb2CUJjAmAw2NIDhs5zcc2vWGtBS8fk25iStYBcV3FeBFaBGndVqJtwMMY85UQhm2fu/626C5pZ/j
	4sy9HZObg7PjRq5bETdyonZsHzPs7sVw/F1ngeTHW6SXQv74QQcrn5w8GZE5X01d3ZYuhoEN/NkXp
	2nKx1zgVhu7kfaFLwCXyiQcug7NgG8kwE6+zrdA0ilgVf8TVKcE4IrF3i/+e6baYd7oFUFTp9Mf9w
	0+iATfTdeAcPgQ/xFkB5X538yCqneIyQGD+kFN1kkmxZHQjWT5m06d0GfiZuRSewKP8ZQxTjO5zbR
	mBdj2elg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtNAW-0000000BUsV-0dKa;
	Mon, 10 Aug 2026 10:23:44 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtNAQ-0000000BUqi-2HDG;
	Mon, 10 Aug 2026 10:23:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1786357373;
	bh=UaiKz12rre+TEb0L0zwF2Ar518hheHMHyzdiIuPJmqA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=UTRaja9Fq7Z6GXoKunTgh2glOTKaW5WALQ8Qr27kWrQArwk4FVx9YnzpuNpwP7qHp
	 4EbTPKh16zSrgIYWuUK9W8Itq1GgVA/ijqxlQxqWI+VEne7nCDjz+Q5DhMtUaUjPy6
	 1Wqp7XGWFxVpV+27st0pgkOR7e10TsSBeSKDdH0A=
X-QQ-mid: esmtpsz19t1786357368t5ddead0c
X-QQ-Originating-IP: Ai5nYPNeALjmEVvXxU8/ax7XOt7XYVRi8rRRc3K6A4w=
Received: from PEN002676 ( [124.126.19.250])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 10 Aug 2026 18:22:40 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 17557001589291606295
EX-QQ-RecipientCnt: 9
From: ZhaoJinming <zhaojinming@uniontech.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-bluetooth@vger.kernel.org
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	ZhaoJinming <zhaojinming@uniontech.com>
Subject: [PATCH v2] Bluetooth: btmtksdio: fix deadlock in close and reset paths
Date: Mon, 10 Aug 2026 18:22:38 +0800
Message-ID: <81B94E6D2ACC0BFD+20260810-btmtksdio-deadlock-fix-v2-1-0eb31f9066d6@uniontech.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <CABBYNZK1VKSthhfEi_BRJSX90W_c3sAqCSdsFm3Z6wXYDcWaVA@mail.gmail.com>
References: <CABBYNZK1VKSthhfEi_BRJSX90W_c3sAqCSdsFm3Z6wXYDcWaVA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20260806-btmtksdio-deadlock-fix-f9421f1a7879
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: M4zpSD2yH9t0vRrXbfSFaR6ew+yVCD2QGLZ5y+G4m0OuDL/1u5FW43q0
	DgeKIksj4OQZCZNeVrCnGZJUviWUr1BrJl1Mss6V6DSJ2KmvNectLWiWNRHDfjoiC7iFEp9
	j3mpaR/2/RdghVJpCxwotGIGgdjGS1spKqaa4HvIlzZ7hQkmqBa0m2kvDw0a7DOBhaVFOKu
	jBTcuSz9+W446LYGoBwRAb5Y0h+1b8TDc9e616DBvld2CMnIOoKb4mrDeMZ14MurKXjE1x8
	PKwl1tEQHS/8yOLCbflZbSxMAIjoSofwUXCQuNy8EG0F4IiCNs3BB35tNiB/cQ/ORW2JrGh
	TjeCavYRJbYfZ1fWAHTm01/Ga09cE2RQ90WSzpTkNr3WsP2NSPEuIfkq+N/svhWLiM9fc0g
	KrH0VfqV3+R5Sja/Rmwduj1oP6dx8uI/JQVdUmEW3dwlm21FSNH8xHFcIHexgq03UGcDs3x
	r0sxGIeSmz/YhfyVbA/sMSrpn0xZ/f63aa5BVPUOa13Jkhxqv+tuxR+UAvNCNnPgTgJjzXa
	KAJuQfZGwT2W/JqMmtFuICRV+zH0u2742NjKmh4E6WTneTMEvN5p981eokniFtyAGwk0PIe
	CtRYDoT97fhbLM85tooLa07q5uAoLBgY7vZbQcxjQjBmQ2EAxhyJt/7kpoYWUEyIERK7ypI
	fPJg4HkoswhQExuecRmkTRwlp8zLWmDvHb2DzsBS6meKwla0gr9XhHu1ipwOwBD6H/UplN9
	nfLSdIf7ti4ZmnBy+8+TpS3V7RpXmXbyWQJqxe7JqErgYUCLsmrs/ltyYYH6yGUP54Jucuy
	/ygGjD45TjYa9NGnGXQNzbE8G+LqVEB5SaX4bD45Nsap+dCe+iQHb4z1XccePOwbmMS3FbH
	SiMdhdX0ft5bYVoxNidyx7jwRnN0xLhCK8QlhoTa5etsniJSJ5uwknefAFh5RRD4oGSta3y
	D89BdyC/+8FserlF6ZsS7ecKgmQCyx5YheQQihwmC27x2EZggHneSdJEYAKMnxJyO1UKaiG
	lOarOgaJGAT5+cUHxrTKiRtZto5fWtW1zmmPTi/Jj0IsXQ1Jw03qGMJI1/UBUH9KCnVc1fF
	KxlbTh+78cg3Axn4RJaZqA=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_032339_159301_5DB8537C 
X-CRM114-Status: GOOD (  14.12  )
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

btmtksdio_close() and btmtksdio_reset() call cancel_work_sync() on
bdev->txrx_work while holding the sdio host lock, which is also acquired
by btmtksdio_txrx_work().  If txrx_work is queued when close/reset runs,
a worker thread may start it after the host lock is taken and block in
sdio_claim_host(), while cancel_work_sync() waits for the work to
finish.  The host lock is only released after cancel_work_sync()
returns, so both sides wait forever, deadlocking close/reset.

Fix this by releasing the sdio host lock before calling
cancel_work_sync(), then re-acquiring it afterwards.

In btmtksdio_close() the interrupt is already disabled by
sdio_release_irq(), which also unregisters the IRQ handler, so no new
work can be scheduled and cancel_work_sync() fully quiesces txrx_work.

btmtksdio_reset() must additionally unregister the IRQ handler before
dropping the host lock: btmtksdio_txrx_work() unconditionally re-enables
the device interrupt (C_INT_EN_SET) when the handler is still registered,
so an in-flight worker would re-enable interrupts and be rescheduled
while the device is being reset, defeating the cancellation.  The IRQ is
re-claimed by btmtksdio_open() when the HCI device is re-opened after
the reset.

This mirrors the pattern already used by btmtksdio_flush(), which
cancels the work without holding the host lock.

Signed-off-by: ZhaoJinming <zhaojinming@uniontech.com>
---
Changes in v2:
- Unregister the IRQ handler in btmtksdio_reset() before dropping the
  host lock, so a concurrent txrx_work cannot re-enable the device
  interrupt (C_INT_EN_SET) and be rescheduled during reset.
---
 drivers/bluetooth/btmtksdio.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index c6f80c419e901e71b21e550449250a5a6755d100..23650df4fb06114ab7be1f0b30eb61a15322b288 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -746,8 +746,16 @@ static int btmtksdio_close(struct hci_dev *hdev)
 
 	sdio_release_irq(bdev->func);
 
+	/* No new work can be scheduled after sdio_release_irq(), so cancel the
+	 * work outside the sdio host lock. btmtksdio_txrx_work() also claims
+	 * the host, so canceling it while holding the lock would deadlock.
+	 */
+	sdio_release_host(bdev->func);
+
 	cancel_work_sync(&bdev->txrx_work);
 
+	sdio_claim_host(bdev->func);
+
 	btmtksdio_fw_pmctrl(bdev);
 
 	clear_bit(BTMTKSDIO_FUNC_ENABLED, &bdev->tx_state);
@@ -1293,8 +1301,22 @@ static void btmtksdio_reset(struct hci_dev *hdev)
 
 	sdio_writel(bdev->func, C_INT_EN_CLR, MTK_REG_CHLPCR, NULL);
 	skb_queue_purge(&bdev->txq);
+
+	/* Unregister the IRQ before releasing the host lock so that a
+	 * concurrently running btmtksdio_txrx_work() cannot re-enable the
+	 * device interrupt (C_INT_EN_SET) and be rescheduled while the device
+	 * is being reset. btmtksdio_txrx_work() also claims the host, so the
+	 * work must be cancelled outside the sdio host lock to avoid a
+	 * deadlock. The IRQ is re-claimed by btmtksdio_open() when the HCI
+	 * device is re-opened after the reset.
+	 */
+	sdio_release_irq(bdev->func);
+	sdio_release_host(bdev->func);
+
 	cancel_work_sync(&bdev->txrx_work);
 
+	sdio_claim_host(bdev->func);
+
 	gpiod_set_value_cansleep(bdev->reset, 1);
 	msleep(100);
 	gpiod_set_value_cansleep(bdev->reset, 0);

---
base-commit: 0d839570765118029aa8bf4a95444c6a11aacf85
change-id: 20260806-btmtksdio-deadlock-fix-f9421f1a7879

Best regards,
-- 
ZhaoJinming <zhaojinming@uniontech.com>

