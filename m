Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94863E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 02:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g8lGf6dZKqJaQHnT3yAoIGUTuPlTm3uQR9PRHE/yafU=; b=knoTaBjY03o+wcK901mnEJPlUx
	14+vWCdp7oXIfzmjVRpAa43GmLO9tjA0ETruj9AVQqRI1f9E0H6X7MrRyTDOgX+bsp2gP2YGzttZy
	PZMZ4w7lr7R2hY24JoAsAuX4MD/JDK+6nZEWZ+Ge15OVkn2qDVYwrxNbFg8MrIg3UOyhlaANalxkJ
	arf1a/3fbIk1cSoL2nrHR9bTls0aTqXs6N3bYNCPrRgkgDsftayYUJTn1mAX+ZmFKXIrImNWVNwnC
	SFWjtUagEfO5SdsEqddEysH4uffHIVz7rE8i67flH1cL94/Yt1A0xgu2S7VII8d6PmeR1Hkdk9c5O
	ad5CEudw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUz1c-00000003AxE-424m;
	Tue, 07 Jan 2025 02:08:56 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUz0O-00000003Aro-1Lp1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 02:07:42 +0000
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
	by APP-01 (Coremail) with SMTP id qwCowAB3__hTjHxngyTgBQ--.22637S2;
	Tue, 07 Jan 2025 10:07:23 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: linux@armlinux.org.uk,
	elder@kernel.org,
	sumit.garg@linaro.org,
	gregkh@linuxfoundation.org,
	make24@iscas.ac.cn
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3] [ARM] fix reference leak in locomo_init_one_child()
Date: Tue,  7 Jan 2025 10:07:14 +0800
Message-Id: <20250107020714.662708-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAB3__hTjHxngyTgBQ--.22637S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WryrKw13Ar48KrWUCrykXwb_yoW8Xw4fp3
	ZrCas8trWUWr1vgFWvvFnrZa4UGayjkw1rWrW8Cw18Kr90grWSqa40ga4Sk34UJrWkJF1F
	vrWxJ3ykG3WDCaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
	4UJVWxJr1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG
	64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r
	1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAq
	YI8I648v4I1lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
	nIWIevJa73UjIFyTuYvjfUY3kuUUUUU
X-Originating-IP: [183.174.60.14]
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_180740_734323_8A6E5644 
X-CRM114-Status: GOOD (  12.99  )
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

Once device_register() failed, we should call put_device() to
decrement reference count for cleanup. Or it could cause memory leak.

device_register() includes device_add(). As comment of device_add()
says, 'if device_add() succeeds, you should call device_del() when you
want to get rid of it. If device_add() has not succeeded, use only
put_device() to drop the reference count'.

Found by code review.

Cc: stable@vger.kernel.org
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Ma Ke <make24@iscas.ac.cn>
---
Changes in v3:
- modified the patch as suggestions;
Changes in v2:
- modified the patch as suggestions.
---
 arch/arm/common/locomo.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/arch/arm/common/locomo.c b/arch/arm/common/locomo.c
index cb6ef449b987..9e275b2105c2 100644
--- a/arch/arm/common/locomo.c
+++ b/arch/arm/common/locomo.c
@@ -220,13 +220,11 @@ static int
 locomo_init_one_child(struct locomo *lchip, struct locomo_dev_info *info)
 {
 	struct locomo_dev *dev;
-	int ret;
+	int ret = 0;
 
 	dev = kzalloc(sizeof(struct locomo_dev), GFP_KERNEL);
-	if (!dev) {
-		ret = -ENOMEM;
-		goto out;
-	}
+	if (!dev)
+		return -ENOMEM;
 
 	/*
 	 * If the parent device has a DMA mask associated with it,
@@ -254,10 +252,9 @@ locomo_init_one_child(struct locomo *lchip, struct locomo_dev_info *info)
 			NO_IRQ : lchip->irq_base + info->irq[0];
 
 	ret = device_register(&dev->dev);
-	if (ret) {
- out:
-		kfree(dev);
-	}
+	if (ret)
+		put_device(&dev->dev);
+
 	return ret;
 }
 
-- 
2.25.1


