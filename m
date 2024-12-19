Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D917CE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 20:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2hLOILUzDo5sXZb8TaMc1HjYSIW50UI2D0EZn3eUUCc=; b=RHlIghpRuWYpfaZ7Dm+t9R4hML
	4IsXg7YT8dlgVL5H1ilOD8W8ciugALpUlgTuADLrRrP1wQoq2kreSzEoi4EWNc4AQciJq8KLdMfnI
	11bKVccs1MdSGPFWQ2qItBy/Oq8Q8CB6mTQZrtM8nVq7tGO5SoKZUefjNmMxZ5AbtCP/ioenluc4m
	wmCbl7gxPMoJqSY0KizaCyNJ5plS3vPdBdHLuyqceKwq8Ni1Rt3J+aig6bZfkdMBZiczS3aATPVuZ
	PQYXHukrChPaAM2xl9bGze80MZvxotTmiOMg/tDpOtaLDGJ5PMUl/CHlOvnkxSFqOcLdwwPUp9ITC
	XMILoQ5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMjR-00000002xJz-41D4;
	Thu, 19 Dec 2024 20:02:49 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMfr-00000002wJk-1JHU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 19:59:08 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5d7e3f1fdafso2266180a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 11:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734638345; x=1735243145; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2hLOILUzDo5sXZb8TaMc1HjYSIW50UI2D0EZn3eUUCc=;
        b=u1g3BQp04uB4hL/t4ACCyGeD+qFbIeexprQmF+Zv0Fpxc6Jy68MZjCv2Bqta3Nnta6
         ywfxAXozm43xhOt2x+vpGtMeF0QkCkF3pwzhu1gmv15ezuQJ7kXXRTgsSiOtxhVAkCGj
         XNdiN2ZKdYlNdlW7FgXhoLM8dUHz2aLBDp9ZfHFGCGerGPQslei776LtEyeZi7pQU28E
         zsz4QxXJMM3REcr9CXiVFPTCukbHWqYQ8rx0zdVvdcpuOgzTztjphID9RIWz/vOSfnx3
         ttE9AilvXc9vvT2VG1BLonNIl+BQXA9qsqhoy0MAlH+f0SyJowCicyVi9S/ou3bga3qC
         ViyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734638345; x=1735243145;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2hLOILUzDo5sXZb8TaMc1HjYSIW50UI2D0EZn3eUUCc=;
        b=o+enMWFmtcdk+F0X2LnW+rDD9c0PJDq6SeFylWzODa3woInf3ZdWLSs0HpxF/Bu1ts
         S/e48bGjpvmUbSLQ1U792nonuuaZbiSjJeM7OyESA1chtz9zsF8T5HcUfqLa4GUNDpYr
         SQYwsF7l3VgyiK0d9Lz1NCAY9SDBDwDB5bA2883qON3bzHCsOvgvcsITsLXBxUmV4yzM
         yKRCkmqvVu2dBQsUGgm5a28BlylyMK5ulQeZUGoIvkWIuzJxFNjK1sW/050wYBnih1KB
         22FGg1atx6mgTdTJW7rVFgf0VKPsvT5kIQHgN0YjugZeTLA1iVlESQWNb7h4GB0+Wg0h
         Akkw==
X-Forwarded-Encrypted: i=1; AJvYcCXuxbAsTZcTWRw2tMYctounabVHwyEFbc531fJ1RqM+Qzj3AwBundgTycGkW7/VOsd8OuvPe/+FjGwpKUCgp5aH@lists.infradead.org
X-Gm-Message-State: AOJu0YzCC4obuVmOZRrug8hMLCNFo19AwtKaWOAd9WT0OCqWES9z/n4b
	cMHOaAme/lo3+myjt+6LpTbY34eQtwqX0WQD2+qiBrIWrQC2fgORinA5/kyX9Qg=
X-Gm-Gg: ASbGnctu+RnVIu6aT5yCyZG6QbRh5WRjxu15E+7UGkJej6samgwamyRY8eH59Eb7VxF
	IhcOLbS9641zgwiZaVdiAFpqoFjeiA45SsPFqKKOEkMBuf7yOtV8PG9yVwxND6+uUmmL2RTazVl
	R7TeLp2i9KvKJ2T+KqnLbdUXNTCGiiMoIQs9LHC9DJek7sEH1SRKX5U/Z639o9g/mYKuITIlYvn
	+QWkGmkJJysa47PVMZp24kowGSgtAKY/imU9a5ETrg+JOSJJA==
X-Google-Smtp-Source: AGHT+IF0fmv4Wr8LY08jRHZsI4hjJsYafL7GiFI9dClEL14qKh8/PvfWAazPI1H0PfTeK1OuVNPC+Q==
X-Received: by 2002:a05:6402:401a:b0:5d0:e560:487f with SMTP id 4fb4d7f45d1cf-5d81dd9cda0mr166803a12.11.1734638345098;
        Thu, 19 Dec 2024 11:59:05 -0800 (PST)
Received: from localhost ([2001:4090:a244:82f5:6854:cb:184:5d19])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80701c822sm944816a12.77.2024.12.19.11.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 11:59:04 -0800 (PST)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Thu, 19 Dec 2024 20:57:53 +0100
Subject: [PATCH v6 2/7] can: m_can: Map WoL to device_set_wakeup_enable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-topic-mcan-wakeup-source-v6-12-v6-2-1356c7f7cfda@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2839; i=msp@baylibre.com;
 h=from:subject:message-id; bh=JFdVPVem4046BqyFJNrVT8yrmK5qAD0B08AcK/8jouc=;
 b=owGbwMvMwCGm0rPl0RXRdfaMp9WSGNJTql42hv/19nSYusP1CavLp22BNzZ/n7ouRXbt/D8C6
 h7r+A5c6ChlYRDjYJAVU2S5+2Hhuzq56wsi1j1yhJnDygQyhIGLUwAmov+J4b9TXO2Cm37sN//f
 a8hrCUk+uTZxt8CZi5NOl7adu+ObLfaMkeFTQNfl8oeFMqtrDm/I4c1fUBR8zveqgEjR8R0uXD8
 MLzMBAA==
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_115907_364985_8ED6063E 
X-CRM114-Status: GOOD (  17.93  )
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

In some devices the pins of the m_can module can act as a wakeup source.
This patch helps do that by connecting the PHY_WAKE WoL option to
device_set_wakeup_enable. By marking this device as being wakeup
enabled, this setting can be used by platform code to decide which
sleep or poweroff mode to use.

Also this prepares the driver for the next patch in which the pinctrl
settings are changed depending on the desired wakeup source.

Reviewed-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 drivers/net/can/m_can/m_can.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/net/can/m_can/m_can.c b/drivers/net/can/m_can/m_can.c
index 16e9e7d7527d9762d73a7ec47940c73c0976e05d..0dcdcde3449c7647e4bc9a92f918160a336f94c0 100644
--- a/drivers/net/can/m_can/m_can.c
+++ b/drivers/net/can/m_can/m_can.c
@@ -2186,6 +2186,36 @@ static int m_can_set_coalesce(struct net_device *dev,
 	return 0;
 }
 
+static void m_can_get_wol(struct net_device *dev, struct ethtool_wolinfo *wol)
+{
+	struct m_can_classdev *cdev = netdev_priv(dev);
+
+	wol->supported = device_can_wakeup(cdev->dev) ? WAKE_PHY : 0;
+	wol->wolopts = device_may_wakeup(cdev->dev) ? WAKE_PHY : 0;
+}
+
+static int m_can_set_wol(struct net_device *dev, struct ethtool_wolinfo *wol)
+{
+	struct m_can_classdev *cdev = netdev_priv(dev);
+	bool wol_enable = !!(wol->wolopts & WAKE_PHY);
+	int ret;
+
+	if (wol->wolopts & ~WAKE_PHY)
+		return -EINVAL;
+
+	if (wol_enable == device_may_wakeup(cdev->dev))
+		return 0;
+
+	ret = device_set_wakeup_enable(cdev->dev, wol_enable);
+	if (ret) {
+		netdev_err(cdev->net, "Failed to set wakeup enable %pE\n",
+			   ERR_PTR(ret));
+		return ret;
+	}
+
+	return 0;
+}
+
 static const struct ethtool_ops m_can_ethtool_ops_coalescing = {
 	.supported_coalesce_params = ETHTOOL_COALESCE_RX_USECS_IRQ |
 		ETHTOOL_COALESCE_RX_MAX_FRAMES_IRQ |
@@ -2195,10 +2225,14 @@ static const struct ethtool_ops m_can_ethtool_ops_coalescing = {
 	.get_ts_info = ethtool_op_get_ts_info,
 	.get_coalesce = m_can_get_coalesce,
 	.set_coalesce = m_can_set_coalesce,
+	.get_wol = m_can_get_wol,
+	.set_wol = m_can_set_wol,
 };
 
 static const struct ethtool_ops m_can_ethtool_ops = {
 	.get_ts_info = ethtool_op_get_ts_info,
+	.get_wol = m_can_get_wol,
+	.set_wol = m_can_set_wol,
 };
 
 static int register_m_can_dev(struct m_can_classdev *cdev)
@@ -2325,6 +2359,9 @@ struct m_can_classdev *m_can_class_allocate_dev(struct device *dev,
 		goto out;
 	}
 
+	if (dev->of_node && of_property_read_bool(dev->of_node, "wakeup-source"))
+		device_set_wakeup_capable(dev, true);
+
 	/* Get TX FIFO size
 	 * Defines the total amount of echo buffers for loopback
 	 */

-- 
2.45.2


