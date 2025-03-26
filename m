Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 672F3C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 08:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZP0l56nxJaRM6ya5wloLaFklD8MUTQmVk56fPxgwkqI=; b=Nc+EY1iTOzrXzr+02whaIqPpi/
	4m7FM6zrJ6H7KYTlWOtFdP1rJFbUhgM1R+p/u2hZ52fFIIQW0NzFTcK2LwEo8EXgMCZz68PDV/3/d
	Rbxu75Unrr7N6BTO932o78RknrsBc+YbBcDSoEIU/vk7Yees1qvt+iTS+6KuQlB27p4phdItiyzgK
	g6MazJQmY9f2l32SRxsPKwl8rP5KVZQ3iYDs5kehJZT7I60xRco1iIQecbA10jt8FT50gWYRK8VD2
	LXSGknXzfXavI23GNNam9tLwJVOeSK3elGlZfx1HsHeX1l0XBxaUtMGD6F6riV3oPKjxzyz2j2XDO
	fIcg9kJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txMUb-00000007y2t-0iNZ;
	Wed, 26 Mar 2025 08:52:09 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txMSr-00000007xpP-0dUw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 08:50:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1742979021; x=1774515021;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZP0l56nxJaRM6ya5wloLaFklD8MUTQmVk56fPxgwkqI=;
  b=DMdO/KoQaWeD8rCP4sN7r2ex8/2N4f1a0iI6yNauTOdlOSthAlx54gPv
   azed6dxCg+vXGD/RuH8e84cf2JGv7pesJFJg3G5cMcexZiwq8Rq7iru7c
   BCZ069aCUXjIa3Z3VsLxPcuwkx/H5nBASHuR8ioMLaQLcSk9rl+EHpEyc
   QZfKOr+GN3i3chQCaOWsyCA+ZT96MzhkGWELYnYVPjG3Cq1lMuR3MjkkO
   Fnxn4JckNRr8oJS+M1eHpsZ/TKltuwfeItGFNBAPYBnMJCXcu2toAi8TE
   yJ/ZClfMrxrB3+KeSlVslU149mOWGqHDLM4Goh4J/WFh2Pt3n5pNCusts
   Q==;
X-CSE-ConnectionGUID: MfDwbYMlScqJ+JJEsYNc2Q==
X-CSE-MsgGUID: QpMB02+nQjmsFCzLs9HGZA==
X-IronPort-AV: E=Sophos;i="6.14,277,1736809200"; 
   d="scan'208";a="43164243"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 26 Mar 2025 09:50:15 +0100
X-CheckPoint: {67E3BFC7-37-903EAEAC-E04C76C8}
X-MAIL-CPID: F04AAAF7416FCDBA5B861161D3D6F77C_5
X-Control-Analysis: str=0001.0A006368.67E3BFCE.0036,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 95F75166EFA;
	Wed, 26 Mar 2025 09:50:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1742979011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZP0l56nxJaRM6ya5wloLaFklD8MUTQmVk56fPxgwkqI=;
	b=em4EobGmpORctKzGb651E+9YPDv0naO9NFFUwMSq7jZ9NonsqAQMfMPyCACKdSXs8EsPNC
	5/3FYn0z+iyPvaoayosYcCwpUhYzVgUGZoxC83kijimQdRdmWSiyYN3ZJ0hbr5gpH9UlNT
	kMw3gIs0lIvqbswdrIMXItqebsaOmmva2IMPdUZ6u3F83JGxBK5QU3UNTe0/mP2fD1eT+2
	+E5YGY6y3FZqWzUegymx+CzAaoRcFq6l7iysU23V+MHx6VdtTlOnmjdpOVqVYoYkzL5O3m
	/cNTer68kHH7+HGNffpgKuNMo/FBqvLUCfD1KDiAcZOTfc59mbVlYpROxflPDw==
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
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] i2c: imx: add some dev_err_probe calls
Date: Wed, 26 Mar 2025 09:49:36 +0100
Message-ID: <20250326084937.3932383-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_015021_692481_0713AF66 
X-CRM114-Status: GOOD (  12.67  )
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

Especially DMA channels might not be available. Add some deferred probe
messages accordingly.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/i2c/busses/i2c-imx.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 9e5d454d8318e..e6e09d5a2bbd4 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1711,11 +1711,13 @@ static int i2c_imx_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
-		return irq;
+		return dev_err_probe(&pdev->dev, irq,
+				     "can't get IRQ\n");
 
 	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(base))
-		return PTR_ERR(base);
+		return dev_err_probe(&pdev->dev, PTR_ERR(base),
+				     "can't get IO memory\n");
 
 	phy_addr = (dma_addr_t)res->start;
 	i2c_imx = devm_kzalloc(&pdev->dev, sizeof(*i2c_imx), GFP_KERNEL);
@@ -1810,13 +1812,15 @@ static int i2c_imx_probe(struct platform_device *pdev)
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


