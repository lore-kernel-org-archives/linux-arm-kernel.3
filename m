Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE93D340B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 16:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xv+cJEtgCUMS8wjpPlH7sXaXaKpjfWJGMtGap6NbOoU=; b=Dd7b0K0BSnRHEmLjUCv22p3IeM
	sQuSNRcAokkvyw4jfeiOZk1L92cppNNKyfgPSXToWDDefem9XpflBSONsvDUqGBQ2rPetzWFQzmj6
	BCB1pwgQIJMKUvBbPvcxIJC4Jyw2AM5SARcb89hQOrH+E3GGPr+wpJ/QHw9zlYNaYJQBMaOJLzZNd
	jRPJNy4k+zYHHI5tCZgDfLRwXAr4GPEXGEY9MEoKbkCzMOzYGfD6RHi1Md862osnJBYrIdTciJmSx
	rpHNsFEgIZht2yNcH1UOvDnnMHpGWTn7if42pMJCSjBA7ZlBTIYDWwAPC0v0UGShXue+KP3hjgb7Z
	Df1yCJEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vklcr-0000000EcDP-14xi;
	Tue, 27 Jan 2026 16:09:09 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vklce-0000000Ec1F-3JNF;
	Tue, 27 Jan 2026 16:08:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769530134;
	bh=a7chRUmXSxGtQoJKcymf1nEhKZUkHOKYGlejPfcNTMw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=o+fNHbA0OlmPbae2D8RGX96cJ/8F62ii+jNgUp2+A5YIL3AdADiUgFcYE7i5jlCEc
	 tFJq5uUIVP77SKNCZw5sLFJF1tcqFztPK8pZf4B7+DpeA/m7Tp1TsgCyko7UBITRyP
	 Zh5//tAb6AN2xSh7YmGMhsRKRvXS2ZHf1722yJRRW02aJPX/tzEiIFI1etuBegDYhK
	 xXU/7kW8ZMtCcWABxdCUJjvAa8M0OSbGxDfeWjgdHwE0JD49WLPUKkh2X4n+N3MXNj
	 cFs27STzHpgFPoNsqx9oqlt6rOhA26IvloTUqmE7Jzk5hiYlxactl8RVsbHvzwOvZu
	 X+gdEOcaWGkjQ==
Received: from jupiter.universe (dyndsl-091-248-210-071.ewe-ip-backbone.de [91.248.210.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 78D6017E368F;
	Tue, 27 Jan 2026 17:08:54 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 37734480055; Tue, 27 Jan 2026 17:08:49 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 27 Jan 2026 17:08:24 +0100
Subject: [PATCH 04/10] ASoC: rockchip: spdif: Use dev_err_probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-4-a7c547072bbb@collabora.com>
References: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-0-a7c547072bbb@collabora.com>
In-Reply-To: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-0-a7c547072bbb@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Alexey Charkov <alchark@gmail.com>, 
 Sjoerd Simons <sjoerd.simons@collabora.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1602;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=a7chRUmXSxGtQoJKcymf1nEhKZUkHOKYGlejPfcNTMw=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGl44xDifjfW9AsZhzCw+KRI3+ll6d8qvIFis
 2pf4FH4CJNCk4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpeOMQAAoJENju1/PI
 O/qalc8P/A/cDBmcLWTLa4wHVXwxS4u9xSrRwkNSkW0PRESSEBOUv+At0WVQq+UhyeoOZ6i93Ib
 ZbmG3cdAjosMhtTqx7TXhrqKzAL1KOeyRTTle0tQ683bfWsLk+j2nx0E4rYK/F7kNkbSQXBFNvU
 oj3LPkIn7JMiTtLHjXvgwR/8otKXM4by7An9dDDp7qNzeQI3XQfXTlFn5Osv//3n4nBMfp7wOj+
 zX5gXMgP9PJWiRqQU9vh7lZGHu2QHH8z9Tod2b30ZkEyo/o5Fk2+dlmph+2S5vIXEU3n5Aom+vx
 AsWojqYqvMfAvS0BhAJf7v6Un0ZI1C3yBdeBexmrTPnCGeA4ZsOfz3CHqlS9b7x3BGtLxLGlT93
 /fGkfl2xFu6P+YvUHhXLVjYtDndN83nCsc8p66nmjsWo+jpcJ7uIlnjgyjYgQ9HL6fsIu21FtLZ
 sFwuJAaFDt5UkCaJ22A1aklx1wD4bY0bl9JpREH4eYMWobws2WZDryz9LPEEIfjfx2nT+L/Y+0b
 s8vZoXlZGajenTMvhrhJlYy6AkkkBhh21hwnPQaeK32hJNGIy6qe3lATVnKVJuYrriF4GKKmCVf
 N6Tny3ubuJpSnt9WaZTAob69MW9sv9jqNQ/YLIVXx01gt2qRB4FHkAS++QBYT2xeEN5Lpv6E8Vn
 q9ChSqjRcxpSo72z/p+s47w==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_080857_059178_0ACDEBA1 
X-CRM114-Status: GOOD (  12.84  )
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

Cleanup the probe routine a little bit by using dev_err_probe
instead of dev_err.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 sound/soc/rockchip/rockchip_spdif.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_spdif.c b/sound/soc/rockchip/rockchip_spdif.c
index 841ef499ed7f..20ed64c1fa42 100644
--- a/sound/soc/rockchip/rockchip_spdif.c
+++ b/sound/soc/rockchip/rockchip_spdif.c
@@ -279,11 +279,9 @@ static int rk_spdif_probe(struct platform_device *pdev)
 		struct regmap *grf;
 
 		grf = syscon_regmap_lookup_by_phandle(np, "rockchip,grf");
-		if (IS_ERR(grf)) {
-			dev_err(&pdev->dev,
+		if (IS_ERR(grf))
+			return dev_err_probe(&pdev->dev, PTR_ERR(grf),
 				"rockchip_spdif missing 'rockchip,grf'\n");
-			return PTR_ERR(grf);
-		}
 
 		/* Select the 8 channel SPDIF solution on RK3288 as
 		 * the 2 channel one does not appear to work
@@ -334,16 +332,12 @@ static int rk_spdif_probe(struct platform_device *pdev)
 	ret = devm_snd_soc_register_component(&pdev->dev,
 					      &rk_spdif_component,
 					      &rk_spdif_dai, 1);
-	if (ret) {
-		dev_err(&pdev->dev, "Could not register DAI\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Could not register DAI\n");
 
 	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
-	if (ret) {
-		dev_err(&pdev->dev, "Could not register PCM\n");
-		return ret;
-	}
+	if (ret)
+		dev_err_probe(&pdev->dev, ret, "Could not register PCM\n");
 
 	return 0;
 }

-- 
2.51.0


