Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7027D3E2A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 19:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fPlAnibnmD1fnySJZSs640gnIf/nP26iEQ1zSenIATs=; b=xujmzZgcIenOKKwyl1A5Xm0xV2
	/xMw0EZmXaABPer3HtypWEx1vh1lh2z/5Wsz4ma/Zp/MCHcHAUPJT07reoU81sT2sqCCT7DUwvhxe
	60WvojUM9ZFVBqNJiDejj9on/HW3uNcXaCkZYqzbscpcEyYmmtxbmFWdgEu5mCIAeurQXCxSIiZGc
	13KgEiYJtah0/jc1dciq3cd/XTew6dLAjpkPlrMvdT5RGTZwqDBIn+1cI7ypcEVTBtiT8USabwkrC
	La7ZWOj1Lnw7ytoE6uaCCgx4eDw7OwvTNjDyjDBwUyPtebmli3C1Xv0PSwBLY6qSQ5J3BLZrWkydN
	rmE9Wnxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5UyU-0000000BvU2-2Nl7;
	Mon, 28 Oct 2024 19:00:22 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Tj7-0000000Bg6R-3xBU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 17:40:27 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-37d495d217bso4327423f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 10:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730137224; x=1730742024; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fPlAnibnmD1fnySJZSs640gnIf/nP26iEQ1zSenIATs=;
        b=I/1wRlA7/41lWb+RABK2IjOxFEjmv1jXzHt0rf0KS8KSWh3fnLiOSMrhMCDhSifbSE
         kt+voYyKjsGsyGvqgAcwwSltjHBbZRP9YcjnXbI9CNFrkAr4vNik++srg/U4ZJsNk4Oi
         uM0r2QrIIlymarxr+PjEfetpL7tcHjWUFMc378i9ZPyZPo3qqY8Z8tBPBmp8aiys1vtZ
         EU2SX1qRlOkqUGUMompDVk+kC2h5SKVlxmTA/9zZPQ91UQuq8hmkw4owLI7zXPPbTe4w
         tQ7g1N3s3nQvwuAA2sliMglb2agOzaV4U/m9XcV58xoS6qkH8CqVD/t1SZPcoX5ddkhL
         z22g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730137224; x=1730742024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fPlAnibnmD1fnySJZSs640gnIf/nP26iEQ1zSenIATs=;
        b=QcpcBEJKa05/k0+V4fix6PeCeZXrWhlUlJ4ISk7z35M4hzcaci9nir6EKNqu2+T2Md
         24f8CCzA3muDTUyxFIuQ++x49m1h1+Ryp3C4CMzyCBLx9F9VVUmCqB6nZJtwjn6eaM3t
         2zNvR10zbu6zjE6AqwfaMD9B1pI/7sEeidr/2ICCVONmhEloRu+d6Ai/17IBipC72GOz
         AIKOR9Z5RxqVv1M2M0BgaEgx2S8m38ZW+TGMQ7oSd2xCLYBrxuyOcxBlDkjPu5ETTP76
         6vgORDOyck8tZBjE739i905RrrRDCBU7JEggOtzNHcPvZN3DcN+1YR7wbLkZ0sbqwmXl
         bo9A==
X-Forwarded-Encrypted: i=1; AJvYcCVSXKnZMYVJG3cELoFTJ9cYaCZSess24S4td4xvpr/jU8ARnZpe8rgzjxizoijREM73oiCen702P/+n/GD3Pgfz@lists.infradead.org
X-Gm-Message-State: AOJu0YzISP0KohsWyrfqsJHYTdGmOsOn/JdxP1u2MOowiZI7JTrluk/9
	uTpNLSHTcWdOdQoBgR9utoaHL7lwybxLnQ84ul0NIEDdxBd2HgrjIsFBPgUcXYXiRzJxk5DbqZT
	h
X-Google-Smtp-Source: AGHT+IHK6xiZTRx/ZH4MVy2X0svjOnw4jE7voI4s3c0JLrRDquRo8a/+4WCEh7ljG+D+BHZxsVc0Hg==
X-Received: by 2002:a05:6000:1a44:b0:37d:53d1:84f2 with SMTP id ffacd0b85a97d-3806114091cmr8424440f8f.11.1730137224125;
        Mon, 28 Oct 2024 10:40:24 -0700 (PDT)
Received: from localhost ([2001:4091:a245:81f4:340d:1a9d:1fa6:531f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b4e56csm10119427f8f.65.2024.10.28.10.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 10:40:23 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Mon, 28 Oct 2024 18:38:10 +0100
Subject: [PATCH v5 4/9] can: m_can: Return ERR_PTR on error in allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-topic-mcan-wakeup-source-v6-12-v5-4-33edc0aba629@baylibre.com>
References: <20241028-topic-mcan-wakeup-source-v6-12-v5-0-33edc0aba629@baylibre.com>
In-Reply-To: <20241028-topic-mcan-wakeup-source-v6-12-v5-0-33edc0aba629@baylibre.com>
To: Chandrasekar Ramakrishnan <rcsekar@samsung.com>, 
 Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
Cc: linux-can@vger.kernel.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
 Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Simon Horman <horms@kernel.org>, 
 Vincent MAILHOL <mailhol.vincent@wanadoo.fr>, 
 Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3520; i=msp@baylibre.com;
 h=from:subject:message-id; bh=4LejsatiaRcX2zgFBZl/CQNpfL8Zgty2MrObjJLOJXU=;
 b=owGbwMvMwCGm0rPl0RXRdfaMp9WSGNLlz8RXnd/0e1lXZ4945vpslqasUylSMo9X/TryWObo3
 +sJd99c6yhlYRDjYJAVU2S5+2Hhuzq56wsi1j1yhJnDygQyhIGLUwAmwrOdkeFT+WlNu3fmJ6f1
 /U8NkrnPql+fc0/7dYX4mnuywvMeSr1n+Gdx6s/7C34bXVd+0z1q3vjk3tUetZh3E29yJnHvX/v
 z5R5GAA==
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_104026_027843_FF6A0337 
X-CRM114-Status: GOOD (  15.31  )
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

We have more detailed error values available, return them in the core
driver and the calling drivers to return proper errors to callers.

Reviewed-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 drivers/net/can/m_can/m_can.c          | 6 +++---
 drivers/net/can/m_can/m_can_pci.c      | 4 ++--
 drivers/net/can/m_can/m_can_platform.c | 4 ++--
 drivers/net/can/m_can/tcan4x5x-core.c  | 4 ++--
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/net/can/m_can/m_can.c b/drivers/net/can/m_can/m_can.c
index b358b60a1dee0f39aba9e2ec89dcbd0d65cd7823..b7e350ff64cb9cc706b7d53321dffaa079f3a8c0 100644
--- a/drivers/net/can/m_can/m_can.c
+++ b/drivers/net/can/m_can/m_can.c
@@ -2355,7 +2355,7 @@ struct m_can_classdev *m_can_class_allocate_dev(struct device *dev,
 					     sizeof(mram_config_vals) / 4);
 	if (ret) {
 		dev_err(dev, "Could not get Message RAM configuration.");
-		goto out;
+		return ERR_PTR(ret);
 	}
 
 	if (dev->of_node && of_property_read_bool(dev->of_node, "wakeup-source"))
@@ -2370,7 +2370,7 @@ struct m_can_classdev *m_can_class_allocate_dev(struct device *dev,
 	net_dev = alloc_candev(sizeof_priv, tx_fifo_size);
 	if (!net_dev) {
 		dev_err(dev, "Failed to allocate CAN device");
-		goto out;
+		return ERR_PTR(-ENOMEM);
 	}
 
 	class_dev = netdev_priv(net_dev);
@@ -2379,7 +2379,7 @@ struct m_can_classdev *m_can_class_allocate_dev(struct device *dev,
 	SET_NETDEV_DEV(net_dev, dev);
 
 	m_can_of_parse_mram(class_dev, mram_config_vals);
-out:
+
 	return class_dev;
 }
 EXPORT_SYMBOL_GPL(m_can_class_allocate_dev);
diff --git a/drivers/net/can/m_can/m_can_pci.c b/drivers/net/can/m_can/m_can_pci.c
index d72fe771dfc7aa768c728f817e67a87b49fd9974..05a01dfdbfbf18b74f796d2efc75e2be5cbb75ed 100644
--- a/drivers/net/can/m_can/m_can_pci.c
+++ b/drivers/net/can/m_can/m_can_pci.c
@@ -111,8 +111,8 @@ static int m_can_pci_probe(struct pci_dev *pci, const struct pci_device_id *id)
 
 	mcan_class = m_can_class_allocate_dev(&pci->dev,
 					      sizeof(struct m_can_pci_priv));
-	if (!mcan_class)
-		return -ENOMEM;
+	if (IS_ERR(mcan_class))
+		return PTR_ERR(mcan_class);
 
 	priv = cdev_to_priv(mcan_class);
 
diff --git a/drivers/net/can/m_can/m_can_platform.c b/drivers/net/can/m_can/m_can_platform.c
index b832566efda042929486578fad1879c7ad4a0cff..40bd10f71f0e2fab847c40c5bd5f7d85d3d46712 100644
--- a/drivers/net/can/m_can/m_can_platform.c
+++ b/drivers/net/can/m_can/m_can_platform.c
@@ -87,8 +87,8 @@ static int m_can_plat_probe(struct platform_device *pdev)
 
 	mcan_class = m_can_class_allocate_dev(&pdev->dev,
 					      sizeof(struct m_can_plat_priv));
-	if (!mcan_class)
-		return -ENOMEM;
+	if (IS_ERR(mcan_class))
+		return PTR_ERR(mcan_class);
 
 	priv = cdev_to_priv(mcan_class);
 
diff --git a/drivers/net/can/m_can/tcan4x5x-core.c b/drivers/net/can/m_can/tcan4x5x-core.c
index 2f73bf3abad889c222f15c39a3d43de1a1cf5fbb..4c40b444727585b30df33a897c398e35e7592fb2 100644
--- a/drivers/net/can/m_can/tcan4x5x-core.c
+++ b/drivers/net/can/m_can/tcan4x5x-core.c
@@ -375,8 +375,8 @@ static int tcan4x5x_can_probe(struct spi_device *spi)
 
 	mcan_class = m_can_class_allocate_dev(&spi->dev,
 					      sizeof(struct tcan4x5x_priv));
-	if (!mcan_class)
-		return -ENOMEM;
+	if (IS_ERR(mcan_class))
+		return PTR_ERR(mcan_class);
 
 	ret = m_can_check_mram_cfg(mcan_class, TCAN4X5X_MRAM_SIZE);
 	if (ret)

-- 
2.45.2


