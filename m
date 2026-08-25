Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2929C61DB6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 08:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sgjngM2YY8QYFIO3DGUdz0BGYzZgLDfC5zwZT59AEn4=; b=NdCimCYhqVW/gVN/4Z8PyvhPp4
	7YOtTiAmHYxQjXMhyoHSZ+NEVy07oLv+2H6BMVKMyTPfCh25dCHFpbqJM8C27n12aGAUtwba06vOA
	dJ8L7n5LEaDMahJKH6eDWCY23eNqB1v5R1PrEUURC9CiHWP1BIgnMndrp9ee+vCuJgn/5KbDqfnEx
	2Rvm3Au9LSZbrVGPQnmTGIUH42ipN0PL+0bF96G3AHPcpotqeNAJsdBntaAnah376tJ7snh03/vFI
	55QYxo5yu8P+utEOSG2iK8kX3zaHulX6V8VeHlgD6VixPOxF1RlwgBU71/utTsN/zl5gAtDJrdKbd
	iFYgNvuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyml4-00000000PiF-4ALz;
	Tue, 25 Aug 2026 08:43:51 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyml2-00000000Ph6-1AC9;
	Tue, 25 Aug 2026 08:43:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=sg
	jngM2YY8QYFIO3DGUdz0BGYzZgLDfC5zwZT59AEn4=; b=a3soZNMFB21v2pFuAs
	J+EQ8h0rA77oiJm9pWBy3GTtT1zdx8Y4f60/FqIqv0Rn0T/5JEy+USGbUBMC9vwu
	BcLhtb8MpVmFMx2q8/VCYQ5hMdT1eC+mdlGeuxQP7DE7KGcF+cliBsXYSvi0sdQk
	Wzc7xWppNA25LwgslHMLhz+0w=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgDHvR2wVY1qjXFCOA--.63912S2;
	Tue, 25 Aug 2026 16:43:29 +0800 (CST)
From: Gongwei Li <13875017792@163.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mark Chen <mark-yw.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Gongwei Li <ligongwei@kylinos.cn>
Subject: [PATCH] Bluetooth: btmtksdio: Do not fail probe on wakeup init failure
Date: Tue, 25 Aug 2026 16:43:21 +0800
Message-Id: <20260825084321.3544900-1-13875017792@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: QCgvCgDHvR2wVY1qjXFCOA--.63912S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WF43GrW3uryDGr45Ar4ktFb_yoW8Aw4xpa
	98GF90kFWDurWUKw4kXFWfJFyY9w1FgayjkryYyryY9rZ5JrWFyF1ftryYqwn7CrWkt3WY
	vF4Fqrn5WF1xGaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jbAwsUUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: rprtmlyvqrllizs6il2tof0z/xtbC4hF-OmqNVbELtAAA3K
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_014348_697264_5651FB38 
X-CRM114-Status: GOOD (  13.90  )
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

From: Gongwei Li <ligongwei@kylinos.cn>

devm_device_init_wakeup() merely marks the device as wakeup-capable;
it is only consulted later through device_may_wakeup() in the ->wakeup
callback to decide whether wake-on-bluetooth can be used.  When it
fails, the controller itself still works normally and only the ability
to wake up the system is lost.  Therefore the failure is not fatal for
probe(), which is why the existing code only logs the error instead of
bailing out.

However, the negative error code returned by devm_device_init_wakeup()
is never cleared, so if the subsequent devm_gpiod_get_optional()
succeeds, probe() ends up returning the stale error even though
probing actually succeeded and the HCI device has already been
registered.  The SDIO core then wrongly treats the function as broken
and unbinds the driver.

Make the non-fatal semantics explicit: clear the error after logging
it and keep probing.

Fixes: ce64b3e94919 ("Bluetooth: mt7921s: Support wake on bluetooth")
Signed-off-by: Gongwei Li <ligongwei@kylinos.cn>
---
 drivers/bluetooth/btmtksdio.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index 63d81341bd94..c918202f6c3a 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -1454,8 +1454,11 @@ static int btmtksdio_probe(struct sdio_func *func,
 	pm_runtime_put_noidle(bdev->dev);
 
 	err = devm_device_init_wakeup(bdev->dev);
-	if (err)
+	if (err) {
+		/* failure is not fatal, keep probing */
 		bt_dev_err(hdev, "failed to initialize device wakeup");
+		err = 0;
+	}
 
 	restore_node = false;
 	if (!of_device_is_compatible(bdev->dev->of_node, "mediatek,mt7921s-bluetooth")) {
-- 
2.25.1


