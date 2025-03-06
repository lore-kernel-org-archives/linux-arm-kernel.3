Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F61C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 11:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nKABIWtcV5iN1s5ZB+QKBynZqHqAumHFyPcKwtZx728=; b=XukI716Oq2CLN3FCzBoKmgr/a/
	Hf/m1agtWTqChm46eCY/wmixLH+S+p+i5Ropn1k+DPzqSccKscdyFiTgyPVayt1UlXkVM5wXBrjlW
	ewMTRNSx9SR/9GaD2Lswvho2avhTJxPk9MaCRaoz5c4nDmQJVqCGlBfFR7vvYBBp7i7ew8uKqroJa
	eZPAQW3X+sEljh0XmigJdAiQJtFrAMCBWrt/EPDqgLWmLYhwgkQyJmVeGjBublwhDm/EfEFFiJmzN
	Jc5pS24IHncurQh9WhbHvLPE3jDj6p7ZnIWm9z/KeRoa/zQHUNGZV8xCJUoXO02Ajk6fuWfbI9j7V
	wTJi+84A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9VG-0000000Anhu-0Ddb;
	Thu, 06 Mar 2025 11:35:02 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9Ct-0000000Akct-3Inq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 11:16:04 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ac2400d1c01so48328166b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 03:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1741259762; x=1741864562; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nKABIWtcV5iN1s5ZB+QKBynZqHqAumHFyPcKwtZx728=;
        b=U3hCzYhgKIYbKNHMsSV3OrLRqGNLMajCMnHq9Kr7TB1rS6uA2ivQZInXDBm8Q90F5R
         aeILF7ChmraCltzZp4HCbuSl99cCILlOIWCAhkCb5F+AS1nEFcb4fcok3aou+iKfAgFu
         MRnM7Lx3noyAAyQFd0ShS3O26ux37W1Ozj2w31WD8NPpe/WLbipOa0UzuyItp4rblops
         /Vu0gDaqDwjemuZ27Ziykx4QF7AhAF9EDOjUjy7GgJfnv5kgZqOckH1aV3F4Lci85g+D
         V3xLA+jNvrgHXe8qIZfDJqYcRUi/N/JKcP3smTj7PmxmsfNNRURvzv94LV4/C7L1uoWF
         8ZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741259762; x=1741864562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nKABIWtcV5iN1s5ZB+QKBynZqHqAumHFyPcKwtZx728=;
        b=VGKsZTCQt4EwHMobM4bwOd5qppXmfxoMZRsaZOP1S/HA2beDFrnilvoQF8kMNDW9J0
         SFXJ0g9gKwVdriyGtEWnQdoDB1eaV6LQDMI1cn6OAfxzv29o0173xI0glHfMFbRZuB+q
         6KdfgCBD3xR/pv3oSYqdsH7lRWad88s/QinFN19H4QZxyuOYYCpDgLOWuHkSgpOYRQQd
         pYUWzBa8LITuzQyreBMzDQwHO3uF3gynDnk4ojmSx4+vSTIsLSNi+IM1kAjo/3eljHRB
         +43eT486J+1aSxLEa7XSpzIyYd+a3p9u/c+A6IIVvfwWywAr8DXVMoFLYKdxgGyAuZxs
         Lq6g==
X-Gm-Message-State: AOJu0Yz6eQoxPYiCe6OVOwpFGYiL3QqWBFljCEkZM/qiGtqk++KvxWMs
	SZdN9sAyhJbWq/88F54Kgc/D0imDSUrTUKxFlm0LN3VESOpJcDR7xtcJyZhD5wHwe29zjhNUxK+
	l
X-Gm-Gg: ASbGnctnY35Pxtd1cuLh20+5XstByAV8HAEtSuLDnmXi0g2d1InT495R+/bU+Cu+Xo5
	szJZGO3LZ7h2hCSEr0T1fH+6X1vk2BCx6e/x3RNoLC57yc4jg8usRlZXjyGw8lhy4oLrooVJfRR
	T7tdXP6861b57QBuHNhYF/ndbFLF0YggEreVxhVC9k6rhpR+SIQ0kQcJXpMbOTw2CauSrAdHINw
	MNQ0Ze8XrC+wwsOY1F1IJxo1M/nwV0KjuAdTs1zuwhxJ/D6VCcCnGomWvSGroMQNAO0mrnyTx44
	Kz22HyiBvxiNb3XvgjiXXnQDlvPcunos6ft3dmtbZQ==
X-Google-Smtp-Source: AGHT+IFzQjVI6La/fumbYhe/tIf2DHPmT0/Tg7rUjpYZXnegofxlVrDrXprOyMSVtKs+Ncydte7CDQ==
X-Received: by 2002:a17:906:c142:b0:abf:7a26:c473 with SMTP id a640c23a62f3a-ac22cba0296mr292630166b.13.1741259762247;
        Thu, 06 Mar 2025 03:16:02 -0800 (PST)
Received: from localhost ([2001:4091:a245:8327:80ad:8144:3b07:4679])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac239482096sm80348766b.54.2025.03.06.03.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 03:16:01 -0800 (PST)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Thu, 06 Mar 2025 12:14:43 +0100
Subject: [PATCH v5 05/13] can: m_can: Return ERR_PTR on error in allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-topic-am62-partialio-v6-12-b4-v5-5-f9323d3744a2@baylibre.com>
References: <20250306-topic-am62-partialio-v6-12-b4-v5-0-f9323d3744a2@baylibre.com>
In-Reply-To: <20250306-topic-am62-partialio-v6-12-b4-v5-0-f9323d3744a2@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Anand Gadiyar <gadiyar@ti.com>, 
 Chandrasekar Ramakrishnan <rcsekar@samsung.com>, 
 Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Vishal Mahaveer <vishalm@ti.com>, 
 Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, Kendall Willis <k-willis@ti.com>, 
 linux-can@vger.kernel.org, Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3520; i=msp@baylibre.com;
 h=from:subject:message-id; bh=fPymUYl9ngaWf3SHgyvMGysC90ZPypUMCZh825GprU8=;
 b=owGbwMvMwCGm0rPl0RXRdfaMp9WSGNJPNh94ufOPjv+RD2e8Djx/5537bMpvzlkf2iSfHpr5+
 anYpxtWcR2lLAxiHAyyYoosdz8sfFcnd31BxLpHjjBzWJlAhjBwcQrARParMzJ8iI+2fDgjeiN3
 1El57vOn5t7QYzO+uUujujv+rcOUcG1tRoYpU+48DnrfuCtm4V2B4sxvocHHjyxNYks+1xJ18c6
 tX94cAA==
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_031603_884065_99405CCE 
X-CRM114-Status: GOOD (  14.62  )
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
index 20f7533ad9e7735013ff000e6f3b11d016f8a09f..20fbef50db20ab5cea5afe4c44fda8b03e5c8c85 100644
--- a/drivers/net/can/m_can/m_can.c
+++ b/drivers/net/can/m_can/m_can.c
@@ -2392,7 +2392,7 @@ struct m_can_classdev *m_can_class_allocate_dev(struct device *dev,
 					     sizeof(mram_config_vals) / 4);
 	if (ret) {
 		dev_err(dev, "Could not get Message RAM configuration.");
-		goto out;
+		return ERR_PTR(ret);
 	}
 
 	if (dev->of_node && of_property_read_bool(dev->of_node, "wakeup-source"))
@@ -2407,7 +2407,7 @@ struct m_can_classdev *m_can_class_allocate_dev(struct device *dev,
 	net_dev = alloc_candev(sizeof_priv, tx_fifo_size);
 	if (!net_dev) {
 		dev_err(dev, "Failed to allocate CAN device");
-		goto out;
+		return ERR_PTR(-ENOMEM);
 	}
 
 	class_dev = netdev_priv(net_dev);
@@ -2416,7 +2416,7 @@ struct m_can_classdev *m_can_class_allocate_dev(struct device *dev,
 	SET_NETDEV_DEV(net_dev, dev);
 
 	m_can_of_parse_mram(class_dev, mram_config_vals);
-out:
+
 	return class_dev;
 }
 EXPORT_SYMBOL_GPL(m_can_class_allocate_dev);
diff --git a/drivers/net/can/m_can/m_can_pci.c b/drivers/net/can/m_can/m_can_pci.c
index 9ad7419f88f83016e93667f4847fe536eca39ad1..eb31ed1f964491ab41c7811be317706a09951390 100644
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
index e5c162f8c589b2c75c51cd8a994fc93ab507b9dc..5523ad8c9175cacd330a330b0f45d2c6515d11fa 100644
--- a/drivers/net/can/m_can/tcan4x5x-core.c
+++ b/drivers/net/can/m_can/tcan4x5x-core.c
@@ -401,8 +401,8 @@ static int tcan4x5x_can_probe(struct spi_device *spi)
 
 	mcan_class = m_can_class_allocate_dev(&spi->dev,
 					      sizeof(struct tcan4x5x_priv));
-	if (!mcan_class)
-		return -ENOMEM;
+	if (IS_ERR(mcan_class))
+		return PTR_ERR(mcan_class);
 
 	ret = m_can_check_mram_cfg(mcan_class, TCAN4X5X_MRAM_SIZE);
 	if (ret)

-- 
2.47.2


