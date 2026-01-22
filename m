Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22BF8C44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 11:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I/Dn0vsHTHCdxdOrBVltjyqem4g9MYlrJ05V6/yY8R8=; b=IHxPGuQu++3vPFlawSNIa+6tJp
	0oGZBR+9OR5jZ+ZoW5LfL8Vv0/BfX4pt8SG7IRUj9pZ780ipSgbXQl/MiOf0hnf6/nMM0VyE/hT41
	iMEmqBGvkljrvWlLiwOXt2JGy/34fwFx0PX8ClUY8wuevG+fMxQJhfEfkxt2DN60ASXComhYU3Fxr
	kG1jmhRRH2Rtio4xaXER/EThsjlabSHrSw6If5SyfTfIFTCOw+XzFtDSXJy663z86QfL2HcN+MbTs
	OiOyb6GBR9UE3CTyuiHNqFQv3dKx+CyRDwS5xJM+5mQrAqRRHYFTToH8CMCVyUoen4aTZo/eCTbqI
	AsPqRWSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vit9B-00000006zZ1-3pxb;
	Thu, 22 Jan 2026 11:46:45 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vit98-00000006zYS-3QOG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 11:46:44 +0000
Received: from LAPTOP-N070L597.localdomain (unknown [58.241.16.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 319955f8c;
	Thu, 22 Jan 2026 19:41:30 +0800 (GMT+08:00)
From: Zilin Guan <zilin@seu.edu.cn>
To: mkl@pengutronix.de
Cc: mailhol@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	linux-can@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zilin Guan <zilin@seu.edu.cn>
Subject: [PATCH net] can: at91_can: Fix memory leak in at91_can_probe()
Date: Thu, 22 Jan 2026 11:41:28 +0000
Message-Id: <20260122114128.643752-1-zilin@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9be582739403a1kunm22a3547a3b13e
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZQx5IVh5KSh1JTk5KGUJJQlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlOQ1VJT0pVSk1VSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhOQ0NVSktLVUtZBg
	++
DKIM-Signature: a=rsa-sha256;
	b=npJf/hemX1thzYxiOB+VAPlxddqldeS6d0ZTBnusab3La1dE18h4F0DDauNmD4aDa6D1NxymlHR0Fy7R9HwE877WiosCGvKZa9wrVTJ3LHzWsi/Y5oXkDqtcQLtf3D6TdYClrDJYNuazgWpAOg4Ksw0xqxD04XxvBzjPk2kZwbg=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=I/Dn0vsHTHCdxdOrBVltjyqem4g9MYlrJ05V6/yY8R8=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_034643_517153_47ACF4DF 
X-CRM114-Status: GOOD (  11.52  )
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

In at91_can_probe(), the dev structure is allocated via alloc_candev().
However, if the subsequent call to devm_phy_optional_get() fails, the
code jumps directly to exit_iounmap, missing the call to free_candev().
This results in a memory leak of the allocated net_device structure.

Fix this by jumping to the exit_free label instead, which ensures that
free_candev() is called to properly release the memory.

Compile tested only. Issue found using a prototype static analysis tool
and code review.

Fixes: 3ecc09856afb ("can: at91_can: add CAN transceiver support")
Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
---
 drivers/net/can/at91_can.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/can/at91_can.c b/drivers/net/can/at91_can.c
index c2a3a4eef5b2..58da323f14d7 100644
--- a/drivers/net/can/at91_can.c
+++ b/drivers/net/can/at91_can.c
@@ -1099,7 +1099,7 @@ static int at91_can_probe(struct platform_device *pdev)
 	if (IS_ERR(transceiver)) {
 		err = PTR_ERR(transceiver);
 		dev_err_probe(&pdev->dev, err, "failed to get phy\n");
-		goto exit_iounmap;
+		goto exit_free;
 	}
 
 	dev->netdev_ops	= &at91_netdev_ops;
-- 
2.34.1


