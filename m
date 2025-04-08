Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 296EBC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 11:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NRu5VEWAgUj7SCiDTK/gXnFvCKSyajFgcf/tgq1fgrU=; b=EgzztGZX3/tTYO6FEXBc5z4gwo
	DGFvW0PYhDlhBmkhLywX4Sga9NhF0yvAJZiL6DUC40dyk86B7ZbseQWfI7QleleLuQ7RJWIYL8pXe
	PaDMpnSHvWJyW79ni/5Fmr9QnwI1ub94cB0PpuwKk+tJs53plyMVcxSjL9sI1FUuj55mHpDMoSxNt
	GjHYjssNRpYGmZ7M8K2dxEv/SUhmqLueSFE8mMaDhoI/mzo9IKuQyg9dnz7jVyKN7k84IfDeCeJQS
	NRC3mYUm4rJ6/RjobIyBtaMYhC6c2tD29G+NHpDH673gjX7yv+oVWbLdfpiFkfdz9FZPi1zBew0/u
	lS06VWLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u27aQ-00000003uuD-04bA;
	Tue, 08 Apr 2025 11:57:50 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25nY-00000003Yxz-1fEc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 10:03:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744106596; x=1775642596;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NRu5VEWAgUj7SCiDTK/gXnFvCKSyajFgcf/tgq1fgrU=;
  b=Y5lgJREws9kZS2KvvVZb5zJtVE3x/5y6sRJavX8sTl4seiDFpxpEqbur
   oDiI/YPH5dY9O3H6rwFBwXz+E4n9iwttV25NM7kbqxLYq4jiIrcpf63LX
   CUT7qiealjpl3oTT8OL3/o/OqDqO5lqflY2m2v8fhm+ZQEd7MhUe0cF+m
   LyI1AM0Zv2ESFbtc/3EUttYSAvf7lozC8uuGUwaqrCILDa8oL9Yxx+d+X
   ejcSEABs/Luw7zdeVj2fE2OoBE5vApNKqrf+WsSlMBGr5Ws8tyVfwe9IT
   Y4B4gKRjnB0T+s9BflzprCDaglvCIs1p4wHzCgkn3lgfcKQKE3JSs5nq9
   A==;
X-CSE-ConnectionGUID: ro84a8UtRg+nnfyWNlRU3A==
X-CSE-MsgGUID: bDfvC6sCQ2Kpg3otsM4lRA==
X-IronPort-AV: E=Sophos;i="6.15,197,1739833200"; 
   d="scan'208";a="43398465"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 Apr 2025 12:03:13 +0200
X-CheckPoint: {67F4F461-4A-B1D34AC3-DEA5B19F}
X-MAIL-CPID: BE892603A1D2EC333F5B88991BFBD7E4_4
X-Control-Analysis: str=0001.0A006376.67F4F464.006A,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B32AA168E33;
	Tue,  8 Apr 2025 12:03:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744106589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NRu5VEWAgUj7SCiDTK/gXnFvCKSyajFgcf/tgq1fgrU=;
	b=k00Fyls/m3KgLE78hcX0bEq5oEHb8Gr95YN8sD62t2wdIHHvcWNow22U+tSsihSlt33/dw
	kHCHIOIOyPhnuGPnmH4pogzbiRM0upVGyySZqVQ9ni5FJjWECfLRb2/Rjm/ztbWzXMOc23
	s/yKOcEJoHkmrK1qZZmGkv/9qXZSjMVyE5kIKd85QeZ+135uUlhcTe7ou4BI2+o1fz2dcM
	gVg/Lg4ixlcothZ3vL8QGyXDkJswfzwWLC1m1VruUKt91Cf11Y/10V1Ox1IANPOCRpmn3a
	9lG6Tk+ZRpRGA+S6VNPk0NwzzB5Tf9UtDhqSpZC13+KvGO/9Mne3Fnd++4UCoQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2 1/1] i2c: imx: add some dev_err_probe calls
Date: Tue,  8 Apr 2025 12:02:59 +0200
Message-ID: <20250408100300.556703-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_030316_924393_5DCEE08B 
X-CRM114-Status: GOOD (  12.60  )
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

Add corresponding error messages if DMA channels are not available during
probe. Using dev_err_probe adds deferred probe messages as well.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v2:
* Improved commit message
* Collected Frank's R-b
* Put error message into a single line

 drivers/i2c/busses/i2c-imx.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 9e5d454d8318e..de01dfecb16e6 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1711,11 +1711,11 @@ static int i2c_imx_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
-		return irq;
+		return dev_err_probe(&pdev->dev, irq, "can't get IRQ\n");
 
 	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(base))
-		return PTR_ERR(base);
+		return dev_err_probe(&pdev->dev, PTR_ERR(base), "can't get IO memory\n");
 
 	phy_addr = (dma_addr_t)res->start;
 	i2c_imx = devm_kzalloc(&pdev->dev, sizeof(*i2c_imx), GFP_KERNEL);
@@ -1810,13 +1810,15 @@ static int i2c_imx_probe(struct platform_device *pdev)
 	 */
 	ret = i2c_imx_dma_request(i2c_imx, phy_addr);
 	if (ret) {
-		if (ret == -EPROBE_DEFER)
+		if (ret == -EPROBE_DEFER) {
+			dev_err_probe(&pdev->dev, ret, "can't get DMA channels\n");
 			goto clk_notifier_unregister;
-		else if (ret == -ENODEV)
+		} else if (ret == -ENODEV) {
 			dev_dbg(&pdev->dev, "Only use PIO mode\n");
-		else
+		} else {
 			dev_warn(&pdev->dev, "Failed to setup DMA (%pe), only use PIO mode\n",
 				 ERR_PTR(ret));
+		}
 	}
 
 	/* Add I2C adapter */
-- 
2.43.0


