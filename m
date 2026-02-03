Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E2BFE87854
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 16:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9HUCU65KAfTQlzgB4ItuNR9gjArUT34iUui9Gmox8w8=; b=RVWy6xgB87wdocaq1+GUjqktPj
	tXyn1SeNeO1LjLPLAxUgrcf5ig6XxOIfzguzjtmCpj5Mxq/EozqdPz1tbiui9IsfrLmUHNi5g79pK
	9Aq5mq2og/LQIe/hpZcLLApsewhy8FThzZoafqzuJJsnYYaZE87sBQ5qtV+t8FKqo6XDajOeUTnGi
	5KkIdGBynLazO7HV4naEbFy5lTwl8bF1E0bUX9UsOuLfldvPUCWLQJVneMrSIvBILeEVHI7rXargd
	8IJcxLwNmxoFUln/jkz5syQVW5WuJLp5WW4SSeDQBbhxBa8WRgQtGSxHieTF58Dn1omr+dqBWj17H
	kT4RFveg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJYB-00000006y93-3hKF;
	Tue, 03 Feb 2026 16:46:51 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJY2-00000006xu8-2ZbF;
	Tue, 03 Feb 2026 16:46:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770137195;
	bh=651DjgUT7OtElKAM6DhUOfu2PEBxukKfO/3KX0XDgEo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MFflleT8ajGdXL83egRe2hQ+74C//3tfK5E8IlzFZKbJFcdYbr1r5dBh5cO38YPWi
	 JvzTws7k4w1DbZTMyi7eNIEnn8MB7Twt7kIKeh6MWL9hWvSqEd5YQvQVqeQzlrfZP/
	 vTw6NBldcxnekTnoH58mM8Ilb2NaXRPq97CpOxYeCddnd6a8rKVUcEJqhAX2DY7Rak
	 GjfbiE7KHVlVHf4i8jDXrqx0FrfFkuLkvl7pTrzUljMqBQmqSWblEtvMvi7mZN2pD0
	 ELAPeCxMjERLX/+g8Q/mOhfoRX4QxSZIYSz2m7ALMPWib+P+a8AYAwiDITYeIYqYei
	 gCT5D0Gxsq2bQ==
Received: from jupiter.universe (dyndsl-091-248-189-143.ewe-ip-backbone.de [91.248.189.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E377217E35D9;
	Tue,  3 Feb 2026 17:46:34 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 1829C48002B; Tue, 03 Feb 2026 17:46:34 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 03 Feb 2026 17:46:28 +0100
Subject: [PATCH v2 06/10] ASoC: rockchip: spdif: Swap PCM and DAI component
 registration order
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-rockchip-spdif-cleanup-and-bsp-sync-v2-6-4412016cf577@collabora.com>
References: <20260203-rockchip-spdif-cleanup-and-bsp-sync-v2-0-4412016cf577@collabora.com>
In-Reply-To: <20260203-rockchip-spdif-cleanup-and-bsp-sync-v2-0-4412016cf577@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Alexey Charkov <alchark@gmail.com>, 
 Sjoerd Simons <sjoerd.simons@collabora.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sugar Zhang <sugar.zhang@rock-chips.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1197;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=odke1hDY5a4eAB6A6L1moDVakX/wjeSZrUFRtUZjIjk=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGmCJmmBL0deZQgaga5PhJ4UNNNbnfNJgsiK0
 ciM9yyZiL5W4IkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpgiZpAAoJENju1/PI
 O/qac+0QAKixPPhYunfCteZZoTxmKQtICZSEyrb+tQ5h+QtKulk4WVsW1duvvdVWRvrMRxir4UK
 i8gYvJayDoClHO1POC2ofOAplPhPsUt2E8C3LO2SglbJX2q0egcUSrJwbw5V+bdrpDsGhJYbjkB
 uBA7GLT9OqNaIEj0/yKMs25GYBZnP5FFzFCFhcIR/r1XymmRvPfKbfsrvdUr5clzerbaIEZVwCN
 W/axp68aT2WcACFtkJ7Y7PiahGrVoiKJNP4zTmEhnoazBsSHW28XOLKBgyQwJkScXQ6SZDeSaI0
 D8ma9wUpnKMsDbk711MKiLlBIpqOjoXnONetWdwtNTDbZJshw9BcSUJzswnDRPln1ucBYlrh2oh
 1sTbNU1vutIBDPNWJMh98ABqwuHOkpgegX5PSp9l+3P9iBMccq5lB55Sm35QaIOhwpf/ENa0aLa
 XS7BsRKIbu0Ji7xZ1NZ1RBEPQPwpUzJYxi+Jrt94YMwMl6koZ7jjfiSq2OFRmKx9YQMOq7oOn+o
 K0TWu2xD1jRsFHI4TgqivKTlsJikL+MO8RIMTSMz4CUZ0mtCW6793lBETO6mgGjef4/YhTUfJfL
 RuBj/HwVEKIaJzNAUjoPwB1f5LvttkGuT8baMrtDA5VzGAu9uPXflAwk3KX+nHisGqzZtf1uwaL
 LFRw78txTSxhuKIthMNArNg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_084643_355640_3B2150AF 
X-CRM114-Status: GOOD (  12.15  )
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

From: Sugar Zhang <sugar.zhang@rock-chips.com>

PCM should be registered before the DAI component, as the second one
triggers snd_soc_try_rebind_card.

Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 sound/soc/rockchip/rockchip_spdif.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_spdif.c b/sound/soc/rockchip/rockchip_spdif.c
index 55d64fd4c93b..c1221ff00ed7 100644
--- a/sound/soc/rockchip/rockchip_spdif.c
+++ b/sound/soc/rockchip/rockchip_spdif.c
@@ -325,16 +325,16 @@ static int rk_spdif_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Could not register PCM\n");
+
 	ret = devm_snd_soc_register_component(&pdev->dev,
 					      &rk_spdif_component,
 					      &rk_spdif_dai, 1);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "Could not register DAI\n");
 
-	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "Could not register PCM\n");
-
 	return 0;
 }
 

-- 
2.51.0


