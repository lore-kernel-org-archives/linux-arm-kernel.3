Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347ACCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 08:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iCvxgq9zYPyMV5RPPEtwvCqno8HSagbXhXnbN1FGzJY=; b=3L9uF1a9iZq4RC4oH1eQ4GixL3
	LCKcpC/UEfdcfdWedUqGtklvWWvqJTDkpcZsy2zrSFn1UgIP8y0v+FUtP/oBxabe4R/tAsvQ2sW+j
	t6XxNhPp7dl0IKEmqrBXkgu0ZObcenOVNUaUgWdb1DrHztKEjZkG20lnimBByPmTaJj9a6ThpRWR0
	hWZTNi+oZcnyHdxQOChHVIBU/PXRr2TMYCiwfYofKxhxAAFh03lzgZeZfCazE9NBBNGxbsW009YHD
	CrLQiSy0vS1iihBFkbNokdj2W9qmGaNcgenJ270mCLmjyfofImx4EkFd0hjgzQoF9HSuy9dwLXnor
	EhGJ8Evg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHdz-0000000GqvT-25sX;
	Fri, 07 Nov 2025 08:16:27 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHdw-0000000GqsC-1Pl3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 08:16:25 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-429cbab5d36so64694f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 00:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762503383; x=1763108183; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iCvxgq9zYPyMV5RPPEtwvCqno8HSagbXhXnbN1FGzJY=;
        b=LOrVWyDk1fq/bXNA1i3n6csv2jHXBewsJtioWLjk9sE5YIApkb+22ee9HEzXBdWOkq
         OTEn/HLAx5uVXs6pJpb9TTHnLRU/wMwqsyJgiXrl4st5jIR6AJchM6hBRO7o6EEppdO+
         vLIDFbqOCMrqO5mYgBIx5fDrnBEMeSrvbTXmGtu53VyEe6DdZ1X5ldug4LqgrvphVONv
         AbavmeSLXquklfGM9Zd+fKUVLjRinyOXTlLpp0+X01kkRxAqM4PCpro6lNLsxAULE3Gf
         +VX1sovhFalI+dz4Nf2/4Oari2XSkCHBLoCxLiaM5yPb5RamLzDA+NSSIEvucrDBqiHS
         EP8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762503383; x=1763108183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iCvxgq9zYPyMV5RPPEtwvCqno8HSagbXhXnbN1FGzJY=;
        b=egxki+LiFcgO0tFe/yN/Cg9UXJ7RAT645nWB5gLtYqMEMJUCrMt51BqV4U9pDyTUci
         rQne+01HWbWjK4m8jX6AO4oLY+nQF5zxkPHo28zOnFTYAK2c//zM/eONlM28mXGmsdnn
         RWYfdFPKcoDpfISPpKNlnBoEvsT57kr5QPkqb06xwh2u0rrqc6VDMdzrHLcU9tPercEE
         n0PmwlfuxL9UNs4mHiQjvHJuuFZxrtuhknHaGVNxtAvicelJwmSxdCLEMPiKAUXDAio7
         NTqhJRCHym7aQcqUPsjTiKyxvWHX/jZc6qUfy6xREqhp1hqEfZLckeb+SnMXB3XOBdf/
         l2tQ==
X-Forwarded-Encrypted: i=1; AJvYcCUR0Q81aGDykykAIpnuxHMFA4qtJE0R8O/2+E5O73x5VYODiy+bgDHpUPqVuZSeLjQyw2W8iJ8K9gBsUsXseZBU@lists.infradead.org
X-Gm-Message-State: AOJu0YwQrEefIJKoSMet6jomHb4K083Hr5/1cVs1bHbZwITNuTT+ix30
	Y0Dbj/BHMgFXZ2u6QXIE4TnOTNT6zOqH7dR8PZ1jVympXC9kCc5Rbdx2VoZvawpEK3U=
X-Gm-Gg: ASbGncs//Je+uvksCIwlfWsvWjyvxR2RWY2bBCCXwJjIWzGhj1JRbPe+xBhxI1ZIA5M
	hENzwXqnOHxIGcq6esCB1wcCh2v/Cv+25M2ZmuMEGKmAoFp85gJFMsdgIxy3WuHSl+ALS2eJQTQ
	lSFIt8WGDszcguAP37Mf+zUZI8GJt2U8Ge3lqJsoi5PI8elF8nPPCteaueJDh2x/XrHytHrjj6y
	l6srCKewXduyo6rmHt5fWyrIibFKj81A5poiUVlO9fnBZ92VFbSeiC5k7k9XHuC6nXewvKQZjiP
	j/9MRhN+lrk87RtYjQoOo6arjy1tZumlL9MIXt0Z+XEzB2wB8O48RlCgJlA79MNuJSHzNsl+mac
	xKZ8XlK8u9b4cs9Fg6Lyjub35c4ahREREcTHr+UQ8Id9b391+RHvi/mK2FALdYrxzymTQn5mW1A
	tNLcH23jpJoDGLPouJIK0ZX/vSlVY=
X-Google-Smtp-Source: AGHT+IG1WfPwzcneuCdATSCE09C1Y773iKrUOLTnPDkh/cXKuCKQ3K5m15q+fwccDXPfnzCmzpQ3Jw==
X-Received: by 2002:a05:600c:a06:b0:471:ab1:18f5 with SMTP id 5b1f17b1804b1-4776bcc5334mr10868915e9.7.1762503382674;
        Fri, 07 Nov 2025 00:16:22 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac679d544sm4058381f8f.46.2025.11.07.00.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 00:16:22 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 07 Nov 2025 09:15:49 +0100
Subject: [PATCH v2 2/6] hwrng: bcm2835 - Simplify with
 of_device_get_match_data()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-crypto-of-match-v2-2-a0ea93e24d2a@linaro.org>
References: <20251107-crypto-of-match-v2-0-a0ea93e24d2a@linaro.org>
In-Reply-To: <20251107-crypto-of-match-v2-0-a0ea93e24d2a@linaro.org>
To: Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, 
 Lars Persson <lars.persson@axis.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Tom Lendacky <thomas.lendacky@amd.com>, John Allen <john.allen@amd.com>, 
 Srujana Challa <schalla@marvell.com>, 
 Bharat Bhushan <bbhushan2@marvell.com>
Cc: linux-crypto@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@axis.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1474;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=KzWXn+yRUUjpBHJaXgRwSAXb1HJyVmNmYBGEb7asavE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDarNNAJtIDGyF0BhraA4Wnr5mnztF9FLWAyE4
 QqQdRi0AUaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQ2qzQAKCRDBN2bmhouD
 15E5D/9wMVJ2fBEQHcIitgPv5MZFIyz/UJUAVG5KpW34AGSs13BNXX9GX9JhxLopOlp4kbCw7LD
 LM83IxKwW3aPefI/ObmGin+Z8QuT7c4+iBH3BF8oZLMY816wuEvhUUOBK25+MN92Et1e2GK2x47
 D+7l2c/Ckz5y/KZKuUaQVx4yqIVYHsDgQMmpYdQo4jAHOZ+vZ4UE5NPul6Di0O4xtNSHbdN9ppU
 ojKI++kkK2+aHUG5bbdZzh0HlXyYzYnZL2Mwd6d8eH77j5+rcOlmM25j3q2Rm3GHHyQlX72/WqI
 XyHZLur3iHCfwdLU5i+TnSydF02ZTC2RgmlW8g7JsRaIxaDnv8pG5c9Lv62kuI4uFyc7wpRN1eg
 D7FH7I5nO86WJUf9XsgTqqyBZ3xHsr372Xlmmcwql4bGQ0W/mtk9x6oINveXqB07jplrUK6jgaT
 ica/DQIrHkSwtGAYP1d3klEQJl9elCyP2rbqbMAcwCK4ugqTH9sKrItpB7nolG/fooCvwZhscaI
 tCvarQKE/ugM1/VKq2is7VECZJX9RdjtbVR3JDUqqt32PkTM5xPeCBbusX4Ze9O+FNPhtc9OqYa
 tJI8rzapmJEkLvPLX93C4eW27wIra8myCvPx1F5zyQh3z8LFN2cgajSoT+1h4eCE9kN+S/Y5yX3
 ED+hsjI9pJQgvqw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_001624_411506_974DE42C 
X-CRM114-Status: GOOD (  13.40  )
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

Driver's probe function matches against driver's of_device_id table,
where each entry has non-NULL match data, so of_match_node() can be
simplified with of_device_get_match_data().

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/char/hw_random/bcm2835-rng.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/char/hw_random/bcm2835-rng.c b/drivers/char/hw_random/bcm2835-rng.c
index 0b67cfd15b11..6d6ac409efcf 100644
--- a/drivers/char/hw_random/bcm2835-rng.c
+++ b/drivers/char/hw_random/bcm2835-rng.c
@@ -142,9 +142,7 @@ MODULE_DEVICE_TABLE(of, bcm2835_rng_of_match);
 
 static int bcm2835_rng_probe(struct platform_device *pdev)
 {
-	const struct bcm2835_rng_of_data *of_data;
 	struct device *dev = &pdev->dev;
-	const struct of_device_id *rng_id;
 	struct bcm2835_rng_priv *priv;
 	int err;
 
@@ -172,12 +170,10 @@ static int bcm2835_rng_probe(struct platform_device *pdev)
 	priv->rng.cleanup = bcm2835_rng_cleanup;
 
 	if (dev_of_node(dev)) {
-		rng_id = of_match_node(bcm2835_rng_of_match, dev->of_node);
-		if (!rng_id)
-			return -EINVAL;
+		const struct bcm2835_rng_of_data *of_data;
 
 		/* Check for rng init function, execute it */
-		of_data = rng_id->data;
+		of_data = of_device_get_match_data(dev);
 		if (of_data)
 			priv->mask_interrupts = of_data->mask_interrupts;
 	}

-- 
2.48.1


