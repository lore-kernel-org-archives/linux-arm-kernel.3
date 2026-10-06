Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97FBCCA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 20:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TuMJ7m5Vcv+rXpqn/K7pApUYeSmPWZZlEhNlSrC3ot4=; b=b1kts75DxJeVSJ8EOQ3LUplwxL
	dNImdlGxyf1BMXER5USPYuhvkUM9BvyKEvP6FeBoHZVl21foQu770P/GV99olsKSNWGzVAZZHrr2w
	wy5XBG6WGHQwn1frJhqImAZ+HLYh56iQcTb+KoAFbC+w0Gg9cBz3QGdyDHrHYMPZWBMWnGRH8sIDZ
	PqC5NMN9AEv0ZgbxR1t82NSn8AtYbVjvpSFNzsFjILnezeuF6QfmCeDTq8uhdTZ+ehy3TLmDTOy36
	w4EBfuhWUGyEmi8bog6ZWm7fhUO5YI7/I2zV2dK83dpOHDLlAdo/QTtV03UMkY4BgCqmyZMuZXe8T
	XlAVdYsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEBjX-00000001MQi-1CTY;
	Tue, 06 Oct 2026 20:25:55 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEBjO-00000001MLt-38vl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 20:25:47 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-81c5aac8478so635007a34.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 13:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791318346; x=1791923146; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TuMJ7m5Vcv+rXpqn/K7pApUYeSmPWZZlEhNlSrC3ot4=;
        b=fNGpBJCm4odjtkQgmTEQDvZ+ZmYH52GVxWvG3HIZ+a6HUOjh/E5OI+mNPVHOXsbTlq
         v3E/6/HmPTf7sHSl7USmJfEujpingr0r6O33scC/ICDPoivr7tsIq3/Xw0OIIkyZr3xp
         yUOfPUdR46HKYXA1EcAERvniq5uTVEvWzRjGVlP8g5GWZZytgsp83nGDNB6a8lcqnNKA
         z3jcVhfEFT5L5ohYs/qa2vE0B4dTr7TGn7s9Y3zStWE9g7IDZGwbjy86hm26h9FSaasg
         wSjgmdGmcA5xSzbVOBi95ByFpxwrLc8ZmpRwIToSC8hTC8gDM0+iey+IgtFoGplEGs1g
         yhVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791318346; x=1791923146;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TuMJ7m5Vcv+rXpqn/K7pApUYeSmPWZZlEhNlSrC3ot4=;
        b=C/EOCl7DtrmBsMChk6kwLkg0MeijdglsdzKKOX1G0tnp322Sq9RZ8KX52ZLiKn0juc
         GnYlYAaDqA+F65VXoC+A0aCcYivt974CB9FMhJTOXbZI3E3HYz/aUpv4bhfXUk1/frTk
         s25m/R27Dz4ry2VJYY3WQPNp/TIYghShwPEUqPlsS6cSSBS0q59QbpR0rIDwU6NRRdBF
         WT/mNGSkWXo8lWOowP3cgezDvNLaAbHsR/+K7+to3M326oDkFWLKD5C2+8hezJ2y5oQG
         KG7ex5t1UHAvBX5jPKHU5KzO3/Dh0Fq6/2cR50CFD4moD9A6ruIVOXfKqjkLhOxFLpb0
         dCJA==
X-Forwarded-Encrypted: i=1; AKwUvBxEAf0cVK2rf75hWE0OzaIOTTgjhnVMYW+Ia/PdPDn/ZV+rUQ/jgn/rGYMyLiqOzRNHtAaT9QXpdU5n1XlDOdNV@lists.infradead.org
X-Gm-Message-State: AFuF++mQkjTlB3gxQ7ps703X1bEuxrlUZibNrmFGOvhf4f4cxw94FaLR
	qtWWmyXsH5NQdInJinI/zOcLq6zhtSfSzt5rE0OS6yDvDliogP2gmP3B8sE2hKdy3/k=
X-Gm-Gg: AYBFou2hpjcjUCIX043B7OGI39Y6tuHk/D6jSUuC7nkI11pKh3Nw5gb66rGfiuI5vDu
	qeauoCXYJhcZs43iaV+iWO3E6lTm4wHpEc3jmGXe7viR+aw9zk4N9Eqrw3KWFLlgpVnLgESDRND
	WJIqHM7ngors1PK5Iu4+d1k+nKDFEencN83QMRyMb2My03lQYKUBcuGzgw0KYrUyICqw8zfcOEO
	/ZNRAav+7W3y/q7H3ftA+k52VQcK8t6wwnggIpUHhJnHa9J40VgTWXCUvwCvPg/MhtwyDFjqv+k
	CpUB/4YXGT6Z8xWOVd7ZygZEhX3uHm8bH5MRP5UcDb1VWA0P8jH8nEjsUpSMJqNlhIGoPp/c4Zv
	TXs9Tt8hiPPg2VJwrg+jO2zFUopcdkoK4z1JZmINh3BP92TO/u7Gj37/t7YmLA+aX0wwIFO/hEN
	xaGA8m5xjqJpKL+HZbuv/3CbzrpzyojeFJiTSrMN53PZ6fPPsoFILkhIga14jfBJKmQssg7fOHn
	A==
X-Received: by 2002:a05:6820:1996:b0:6df:961a:af2f with SMTP id 006d021491bc7-6e7ac5151d7mr253655eaf.85.1791318345779;
        Tue, 06 Oct 2026 13:25:45 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:372:3180:ce34:1fe7])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6e793f68bf6sm463442eaf.8.2026.10.06.13.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 13:25:45 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 06 Oct 2026 15:25:02 -0500
Subject: [PATCH 2/4] drm/panel: himax-hx8279: add the VDDP supply
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-panel-himax-hx8279-vddp-v1-2-50d884b42aae@baylibre.com>
References: <20261006-panel-himax-hx8279-vddp-v1-0-50d884b42aae@baylibre.com>
In-Reply-To: <20261006-panel-himax-hx8279-vddp-v1-0-50d884b42aae@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1424; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=NyTgz/hgDxQKSuA5Ck4SyFt9fR3sfL/MexR3R/H3dxg=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqxVksNR5t/ywYjewlDcdi0ghHLOdJJIGqzYu4S
 0FRGFjsMxSJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCasVZLAAKCRDCzCAB/wGP
 wCSBB/4nAAPLD1Yv3Td1SgrZyG8pm0J+BxnvcD4ztUnuid/60B8XkFmMjr6FQkqLK1d/baXFatE
 cbGI8eGxXtN9EELfUFzkaiI6pbFo9vOfFbKfurBWmbBbZqfRPcn2p1P/KwOT8e9ERwN3pJBgDtw
 IJnA7ofvPQwKGq+hg/++URBXqdhW+mxUBDmxQ5lrxAKGaRxYsDnjzMf9aLhuEGGceSHp46P1zX7
 guK6fHdEksNWYX+mLcopg1bP6zp2KmcaUalp9b1hlPC3s2Xtoq75Qas1m+fWyast2NbbU+XFCNI
 OcROe3ts3gEeZSCMkm8yhiT4SXC0JamLJMaY4PxVT7cnbLG/
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_132546_803270_D5250674 
X-CRM114-Status: GOOD (  13.78  )
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

Get and enable the vddp-supply along with VDD and IOVCC.

The Startek KD070FHFID078 panel has a VDDP power input, which the
MediaTek Genio 520 and 720 EVKs switch with a regulator of its own, so
the driver has to enable it for the panel to be powered on those boards.

On boards that do not describe vddp-supply, the regulator core provides
a dummy regulator, so they only see a "using dummy regulator" message.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/gpu/drm/panel/panel-himax-hx8279.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx8279.c b/drivers/gpu/drm/panel/panel-himax-hx8279.c
index 9e443c719843..fe665cd3a3d2 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx8279.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx8279.c
@@ -112,7 +112,7 @@
 struct hx8279 {
 	struct drm_panel panel;
 	struct mipi_dsi_device *dsi[2];
-	struct regulator_bulk_data vregs[2];
+	struct regulator_bulk_data vregs[3];
 	struct gpio_desc *enable_gpio;
 	struct gpio_desc *reset_gpio;
 	const struct hx8279_panel_desc *desc;
@@ -769,6 +769,7 @@ static int hx8279_init_vregs(struct hx8279 *hx, struct device *dev)
 
 	hx->vregs[0].supply = "vdd";
 	hx->vregs[1].supply = "iovcc";
+	hx->vregs[2].supply = "vddp";
 	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(hx->vregs),
 				      hx->vregs);
 	if (ret < 0)

-- 
2.53.0


