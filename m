Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C662E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 20:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GjY9DIvP/j+a2vEDWbQw6B5IBSbTgKjYEYRIEWyupmM=; b=QOQi7qKGUWsvCcyV/5+9hOqkPO
	BU7lKSYTer4FjO7OLsQcoEFMQ5oCrA1qUwykG0sZuTWK/gHGLkM8/R2UOcdYQCH+oSQGxUCs6H6Jm
	2D+DgLz5vZ7aj7yOV2aKo1P2ANyy4it1i9aRuSylSf6dxzJJUBTm68jFOnplZ+DojqUe1+WLAyH3B
	w4wylwcly7mCTPUv3mcKzVeHxX5lEAO/fRxJnB8eqgpBq9HxHK/dNDgLbNWvGnyn2lyL3GHXc378c
	53jLmOObR8K15bMhgTk2Lva9Vnsak53QW/5UhlJYRm5uAQs9NwfyDEyZRj0/UBqf8N9ExE9sYSyTF
	RlEXwhSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMkY-00000002xdJ-2aRv;
	Thu, 19 Dec 2024 20:03:58 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMfs-00000002wKr-1YFp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 19:59:09 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-aa6a92f863cso238044266b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 11:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734638346; x=1735243146; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GjY9DIvP/j+a2vEDWbQw6B5IBSbTgKjYEYRIEWyupmM=;
        b=kmzOt5pHaYqTJBDZd0WySSOg3EBwFtRzUFRa+4ZkVTM7SOQx4OVfYXgTlHf5KY7OXl
         iP0jKNt2Du9Gam2zM7QYGKGJ/e5gtZUj87MnThXH2N9z8w0CvwaKLjXxIMtBOJUuvXfR
         oB3Y/G0na5tCDsFI7tiLdJ4m8ph0J2IXLrJcAyRWnzHa1+kmgNKuJm3ad1IjjN38lwNA
         QKtiw7qQF/ZJiTpGUWolPcS3D3fcoVevqE0LKIWkN/ANfcUQXynkBCm7FP3Mi2M8Y4VG
         NeU7BoVR+6BvPHg8zAS+nufOe/J36uXzPpilSaiF+9UIfRzQKzUhi8O17X5ydyrtLcoS
         HUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734638346; x=1735243146;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GjY9DIvP/j+a2vEDWbQw6B5IBSbTgKjYEYRIEWyupmM=;
        b=D/w4CR/ANKu6uUAieUUMQVMp349Jqsg93Os1utbYppKhDV1EzhTw+vYh6Dl2sqMsNg
         4NSumjbPdDlsUZDmM8zeNX7JLKKcEbMUtSD7moCzL73Kavp78grgnLcd+/wHVf7KopNq
         qRX7sG7wubQC5uRQ4/vUOb7kdw6HoCwdWN5aD6OobsZlnkqpBYSDDApw8xyxL5VzlNt6
         k+1knashY4AMuX4i1C1oEOruaWOp4NoRUnGPhZW3WF59ZSyxn1J7GYI9bPwezSp6BuaA
         ia+U0EFP+C52x2gSD5h+uTSeXvu2bXLXyiS2Paa0W2ZPoJ1FwlP64WKFRp8IPhs+/Ksz
         kSCA==
X-Forwarded-Encrypted: i=1; AJvYcCXLjY4dBMZztqQRBFKSvo2BmhTRLv5Wk0e7s89XHn2kkj9g88R+ciwATRtvBFML+HsAlzEiBewDb0E3Ik2Yppb2@lists.infradead.org
X-Gm-Message-State: AOJu0YyT+zoDedaAUkFhX+AvTiQ5/NWaRoOCcIuIJau/GYQY877q0eHn
	1aHUdzv+I4fHATxpNGwqcPHdggZ4YW+Q7OlpvEF+o+GSgVZH0JQSJus4HCpPvTQ=
X-Gm-Gg: ASbGncuT8B1Ht6w55KlwFW6USwkWieZPb591mE9ZSyUIKPhWCJ61H92n9crwStLBEUZ
	aqhp2482N6wbyNhXS0piVC0BtS4XNjXojZyl+nAjH/w+vcFX7bn6dbL7WVbbs5TzAq4R4lRkPI3
	y+rHABM1+XGlRFBfIM8sjWWizSNWcIQdA07BNQwhFMEWe5qAqNf4KNZf8ss6gcFsUFyYadTx6Rm
	hlYp6YS09xTWZrZt3l04R4DcSHqHl710ZPDPQ9rJEhDhakOpw==
X-Google-Smtp-Source: AGHT+IGasreMAbBLOSYmozk5zkbcfUr/mtndjRwbhEURyo571uEoHnYhBSDfIDFuCEtn8LDH45uGSg==
X-Received: by 2002:a17:907:1c14:b0:aa6:a228:afaf with SMTP id a640c23a62f3a-aac3378d0b4mr3761866b.52.1734638346219;
        Thu, 19 Dec 2024 11:59:06 -0800 (PST)
Received: from localhost ([2001:4090:a244:82f5:6854:cb:184:5d19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f015ab9sm97118666b.155.2024.12.19.11.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 11:59:05 -0800 (PST)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Thu, 19 Dec 2024 20:57:54 +0100
Subject: [PATCH v6 3/7] can: m_can: Return ERR_PTR on error in allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-topic-mcan-wakeup-source-v6-12-v6-3-1356c7f7cfda@baylibre.com>
References: <20241219-topic-mcan-wakeup-source-v6-12-v6-0-1356c7f7cfda@baylibre.com>
In-Reply-To: <20241219-topic-mcan-wakeup-source-v6-12-v6-0-1356c7f7cfda@baylibre.com>
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
 h=from:subject:message-id; bh=s9w+e101TyQrbO6pYnUr4GEGJbwIl5NBy74FHjUoVy0=;
 b=owGbwMvMwCGm0rPl0RXRdfaMp9WSGNJTqt5OXTaz78I15uRqe17jCXdW+7HzfjqqdSRmzZKm4
 GmT7ZWiO0pZGMQ4GGTFFFnuflj4rk7u+oKIdY8cYeawMoEMYeDiFICJ5Nxh+J/xa9EuV//kk0sb
 OFZXsahc7BOJ/zUp4GLGxRUOh5eprl3O8M/+568+9hP29lvy/oX3nFtvnHbRpb+iKrnu54Q57a1
 bTjABAA==
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_115908_418368_DD9FE6C7 
X-CRM114-Status: GOOD (  15.58  )
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
index 0dcdcde3449c7647e4bc9a92f918160a336f94c0..e69e9799710b3e4cb267324e8e9db40ca02328e2 100644
--- a/drivers/net/can/m_can/m_can.c
+++ b/drivers/net/can/m_can/m_can.c
@@ -2356,7 +2356,7 @@ struct m_can_classdev *m_can_class_allocate_dev(struct device *dev,
 					     sizeof(mram_config_vals) / 4);
 	if (ret) {
 		dev_err(dev, "Could not get Message RAM configuration.");
-		goto out;
+		return ERR_PTR(ret);
 	}
 
 	if (dev->of_node && of_property_read_bool(dev->of_node, "wakeup-source"))
@@ -2371,7 +2371,7 @@ struct m_can_classdev *m_can_class_allocate_dev(struct device *dev,
 	net_dev = alloc_candev(sizeof_priv, tx_fifo_size);
 	if (!net_dev) {
 		dev_err(dev, "Failed to allocate CAN device");
-		goto out;
+		return ERR_PTR(-ENOMEM);
 	}
 
 	class_dev = netdev_priv(net_dev);
@@ -2380,7 +2380,7 @@ struct m_can_classdev *m_can_class_allocate_dev(struct device *dev,
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


