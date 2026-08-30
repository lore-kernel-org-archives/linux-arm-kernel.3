Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39125C61DE1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 15:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rFpzjXZ5IYHG22KLLH2bPfUNBwlnja8+59AgiXh79UA=; b=tfGCh0Fhml76ti79+edqnXNcLK
	CdUwmAZ/DXyXXdccNNkqOQK23Wmyy8E8DJ1Tfp3WtZfv8YE06sb43Jrc+UYDYL9o/CvUMglromp5e
	k0SUnTO2by/wm9RiN62/paP5XwEMv4D/96G6pehfoKdanqTC27g2REK8OfFtfbt6LVTG80jz1ZWMa
	IT8bczG/zo5leXWK5RLwfzt5RwWrXQJArUDWXQVB5UKJihc2jbLUQUSytYbCZmXjQ9PeMtQeF74aA
	uZdWPE/2wUmLZUcyXheB0sIvewoAI5U2O12j8D8YKhO3ZKNMonjn78+04wbtB7feKNKCiUv9c0gbX
	oUAOrB6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0h1q-00000007pFW-3ZIF;
	Sun, 30 Aug 2026 15:01:02 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0h1m-00000007pER-3YvA;
	Sun, 30 Aug 2026 15:01:00 +0000
Received: from PC-202605011814.localdomain (unknown [58.241.16.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4bd75fa35;
	Sun, 30 Aug 2026 23:00:52 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: jacopo.mondi@ideasonboard.com
Cc: kernel-list@raspberrypi.com,
	mchehab@kernel.org,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	runyu.xiao@seu.edu.cn,
	jianhao.xu@seu.edu.cn,
	stable@vger.kernel.org
Subject: [PATCH] media: pisp_be: Initialize lock before requesting IRQ
Date: Sun, 30 Aug 2026 23:00:45 +0800
Message-Id: <20260830150045.2704062-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa053300a6e03a1kunm4d1b7491104863
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZGBhIVh4ZQx8eGh5KHUsfGVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlOQ1VJT0pVSk1VSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=I42t/z3ywPRiOvfmCV2BJ84ZiUZQyXk3UmJAhvfAwrvsvGOT/4Bv6KD1kWi9NFDAM5dPGw2xYi+1J+fKtqucpwg/9ImYriMGACPLTLY8VPZlN4uWQUHVwwz1KF2vJWxYQRbPZK8I0ovJ+kuRUo23xNcyxz3WV0E+exRIpx95YLc=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=rFpzjXZ5IYHG22KLLH2bPfUNBwlnja8+59AgiXh79UA=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_080059_112088_DDFD00EC 
X-CRM114-Status: UNSURE (   8.43  )
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

The PiSP BE interrupt handler can schedule work that takes hw_lock. The
lock must be initialized before devm_request_irq() makes the handler
runnable.

Fixes: 12187bd5d4f8 ("media: raspberrypi: Add support for PiSP BE")
Cc: stable@vger.kernel.org
Assisted-by: Codex:GPT-5
Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
---
 drivers/media/platform/raspberrypi/pisp_be/pisp_be.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
index d60d92d2f..43fca54be 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
@@ -1695,6 +1695,7 @@ static int pispbe_probe(struct platform_device *pdev)
 	dev_set_drvdata(&pdev->dev, pispbe);
 	pispbe->dev = &pdev->dev;
 	platform_set_drvdata(pdev, pispbe);
+	spin_lock_init(&pispbe->hw_lock);
 
 	pispbe->be_reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pispbe->be_reg_base)) {
@@ -1732,7 +1733,6 @@ static int pispbe_probe(struct platform_device *pdev)
 		goto pm_runtime_disable_err;
 
 	pispbe->hw_busy = false;
-	spin_lock_init(&pispbe->hw_lock);
 	ret = pispbe_hw_init(pispbe);
 	if (ret)
 		goto pm_runtime_suspend_err;
-- 
2.34.1


