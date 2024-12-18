Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A067AE77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 15:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OU+G1H8f52f2/x0TSjJIsIY+TxkbETn6gOAbnCRhzbM=; b=u6t9+WLKBHZ1emFyGR+LBFxCyt
	ES9dnfMrBHwgPvLlgN5Lj+zdHpLXHwuY5ryPeTaKO1L0ygKa5zbsBcd7hluwMnrkWXMhYrvnHzGgL
	x414LzwYsrRN48RXTVcjaaa2mjY+Xpp7U0U0WUPtZCWRHf9i2BYNBubjAtwxa0VUHgScXowRKLXqM
	wGHzWbftGauYn4q39WqSQq3cbV6jScIjowCwe3XCiBZE6TF4rY8oW8Y8xE1ebrisWVXFm43RPWqE9
	PEB613unOR51vhTysI9R8R+k/KuLw4wl3nu5Nf908KZJnccPPOEAF1FwVuvJ/Vx+i1K9KMBVJ/Css
	Gcs6gneg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNwLD-0000000H5Y1-2AxY;
	Wed, 18 Dec 2024 15:52:03 +0000
Received: from mail-m127221.xmail.ntesmail.com ([115.236.127.221])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNwHC-0000000H4kV-2bhD;
	Wed, 18 Dec 2024 15:47:57 +0000
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 62079658;
	Wed, 18 Dec 2024 23:47:43 +0800 (GMT+08:00)
From: Jon Lin <jon.lin@rock-chips.com>
To: broonie@kernel.org
Cc: linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	heiko@sntech.de,
	jon.lin@rock-chips.com,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org
Subject: [PATCH] spi: rockchip-sfc: Fix error in remove progress
Date: Wed, 18 Dec 2024 23:47:41 +0800
Message-Id: <20241218154741.901591-1-jon.lin@rock-chips.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUIZGVZMGB5JGUsaSxpIHU5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a93da741f7209d9kunm62079658
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OAw6Aww5NTITCBAQHyxJKzFN
	CQIaCxJVSlVKTEhPTkhNQ01PT09MVTMWGhIXVREUFVUXEhU7CRQYEFYYExILCFUYFBZFWVdZEgtZ
	QVlOQ1VJSVVMVUpKT1lXWQgBWUFKT09KNwY+
DKIM-Signature: a=rsa-sha256;
	b=XKpvBvIh0GfihsjPdKvwG9EvIk7S7fckssglKXt5f1EhMppvwFaMQ8p5v9LUY63ysK5KmZCkI92fdGSJ3p+MQ45FGI2DJakha8Rri7jTvZuCAewPG4bmzdJhSNXN7sA1F4QVKDXBpee6yL9C+bdxPcHfGcv9kjX9xzhrSQuWGkg=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=OU+G1H8f52f2/x0TSjJIsIY+TxkbETn6gOAbnCRhzbM=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_074755_189845_603CCCB9 
X-CRM114-Status: UNSURE (   9.66  )
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

Fix error in remove progress:
	[   43.026148] Call trace:
	[   43.026370]  klist_next+0x1c/0x1d4
	[   43.026671]  device_for_each_child+0x48/0xac
	[   43.027049]  spi_unregister_controller+0x30/0x130
	[   43.027469]  rockchip_sfc_remove+0x48/0x80 [spi_rockchip_sfc]

Signed-off-by: Jon Lin <jon.lin@rock-chips.com>
---

 drivers/spi/spi-rockchip-sfc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-rockchip-sfc.c b/drivers/spi/spi-rockchip-sfc.c
index 9146b56713b6..ca4f20283d23 100644
--- a/drivers/spi/spi-rockchip-sfc.c
+++ b/drivers/spi/spi-rockchip-sfc.c
@@ -184,6 +184,7 @@ struct rockchip_sfc {
 	bool use_dma;
 	u32 max_iosize;
 	u16 version;
+	struct spi_controller *host;
 };
 
 static int rockchip_sfc_reset(struct rockchip_sfc *sfc)
@@ -603,6 +604,7 @@ static int rockchip_sfc_probe(struct platform_device *pdev)
 
 	sfc = spi_controller_get_devdata(host);
 	sfc->dev = dev;
+	sfc->host = host;
 
 	sfc->regbase = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(sfc->regbase))
@@ -708,8 +710,8 @@ static int rockchip_sfc_probe(struct platform_device *pdev)
 
 static void rockchip_sfc_remove(struct platform_device *pdev)
 {
-	struct spi_controller *host = platform_get_drvdata(pdev);
 	struct rockchip_sfc *sfc = platform_get_drvdata(pdev);
+	struct spi_controller *host = sfc->host;
 
 	spi_unregister_controller(host);
 
-- 
2.34.1


