Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60CEBC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 11:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pdijOc5dVyPkLnBD7Iga0l5uZDGm1/4dYkDZG2K3euU=; b=rELWSaLa3K/88ydkYEUgpNwP+v
	Hr9uFz20NAu8KpSwdbL4hLd07OHisdIptRW1S5+jtBixx0T2rSliISFvVQrPUshENtRBCZvyePBVN
	bbismwYHQIYhMyETQd+KFSxUw1myLLGag9z4M9+WTSSWFZBsu4u69ff2RLFYdvI1XDCmaNNzrtvSc
	CLmp4loR7dUw1deo7SizoPqUy4epg8wJ/C79gMiNommS8B2T02s3qaEFDf7f0BZVnAQHjLzLdnlf7
	zcKssXhSMdI3QAAkHzaJ47ZGdY6zfZPatbK7efs3NzWdmv0bW+yjNBsV/ZJo6ih/wElQhwglT3M+C
	LYFmjbiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9Tg-0000000AnC7-11JH;
	Thu, 06 Mar 2025 11:33:24 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9Cs-0000000AkcQ-32LN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 11:16:03 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5e04cb346eeso800590a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 03:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1741259761; x=1741864561; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pdijOc5dVyPkLnBD7Iga0l5uZDGm1/4dYkDZG2K3euU=;
        b=bSPDvxIKhx2tPjnh5dWHR44TlRpRVAhqu7uOaNnZ2QXHTxw0zoHLNm/QgpoZrMpKWs
         fkzrle/HTOZH5M0p7SFH09cAzM9rGkaghjgsWj49sLAbgV6t8NJzlMpKtsX7XIHgpPsY
         6pBER+3YBIp/HP/Nh90vN5MdYRYgIh1wWhbd6bmU8hGQ/utcl03xrAg34BPyKF7mZWnv
         VeOqsHjyeIX6L0+w8nUmOAl5oh9sHXZDuZCljiAxb10UTc2zF8zpLenr1DT/NRBrjxYe
         +aFSIJeTm+JXTtdeqqfQueJBJcM78mJVnBR46qeCB+Aczbgj4lF0tOkuT6x4/5OunVBZ
         g6nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741259761; x=1741864561;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pdijOc5dVyPkLnBD7Iga0l5uZDGm1/4dYkDZG2K3euU=;
        b=AqpHeKsfb+5FEuP8p8WN/8rhAUI8COITjGOy9YbODFyTEtXXdSfbQmv5sRGw3w0QqK
         1STYMwSbsFmCF2I4NCC0wdDcAmqHteB3ql6msT2BOvKI6pgFkGad01owWmygs6PamvEv
         +lV2NvRX2IXXdlGR9JyMoV3VkT5N4ORr25yVa4xAJhCtwEAToT23CZOjCi9gsRuEfxIU
         rX/7h3Flm3H1rCPiywOtQYGDAW1QWlaVPXkpaBFIfKK+S+a3SdNqtj79Rc4EjtSMUP8+
         mk2+tLr7nndfZqkwH78ywmSppI6hcd5ET2K+cz2LQU9mkltu6o4a1+Vl06Ba+sjpD3HR
         xVhw==
X-Gm-Message-State: AOJu0YzMIj/y2XwmbIj9242ZbP68309XK3W3kaLRGvQhEhG3AGX+ZE39
	b37H6pYrouq/v1QgZwuYaZco0Q8gayXmHKhXn6P6E3yAwafw8IA2EJiU7ibY6FcuDD1BwWtf51M
	+
X-Gm-Gg: ASbGncuRFXRLjWejtb8VMuDvhB/cDcw0z25EHIzIXmnetWmFbTA/dWlc9sehtpjcsTV
	EadhhYGJlDg0bVus8hP4fqVWxBLEuBWedkBb+jpw2FUdaB8/HcjFH9df/zwoAZ0pVMidKwz6EX/
	XL2lHWxg7a99OCCPLi6JPQdT6YxX0+XbuNDHPMl6U/3JKHN34r3GrlpoqFUX0/avdTDJscBEYXA
	wzQzuvUPQIu3P4d2AnJTjcLVJ+J6KnQ47/cQzJM88SPWJWCGr+SsUV8DfEDJ60PuAM85f2GnZOw
	w+zkmyIeCQ9oqt3LQtU9/3NGB4MTW7ZRNr0c+pYBWw==
X-Google-Smtp-Source: AGHT+IGT909TTpj4sMO2JU0Dy2HjA8tPPk0SlL6fRutxRSMRwZg7sd5DwRusv2QlmHcpjyVexkMgSg==
X-Received: by 2002:a17:907:8b97:b0:abf:7a26:c478 with SMTP id a640c23a62f3a-ac20e1db237mr697110766b.47.1741259760981;
        Thu, 06 Mar 2025 03:16:00 -0800 (PST)
Received: from localhost ([2001:4091:a245:8327:80ad:8144:3b07:4679])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac239485558sm79821566b.60.2025.03.06.03.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 03:16:00 -0800 (PST)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Thu, 06 Mar 2025 12:14:42 +0100
Subject: [PATCH v5 04/13] can: m_can: Map WoL to device_set_wakeup_enable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-topic-am62-partialio-v6-12-b4-v5-4-f9323d3744a2@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2839; i=msp@baylibre.com;
 h=from:subject:message-id; bh=J4VG8tXwefIVHGZH1+PCdV86BOTtS1uR46bTjNwL+bw=;
 b=owGbwMvMwCGm0rPl0RXRdfaMp9WSGNJPNu9es/H//VpZJaPYRWYtm6pvLfN5U8DyZPfjnamJi
 kwXfdVdO0pZGMQ4GGTFFFnuflj4rk7u+oKIdY8cYeawMoEMYeDiFICJnDnCyPDv/MklPmWTlJpC
 /kmkOvke767d7HFGblvMdNnQjNc1YQqMDLfnsSu2abnr9t7jt/MxEJv0a8XSqHuHuw1Pzvr7z7Z
 qNRsA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_031602_782247_EDE7196E 
X-CRM114-Status: GOOD (  16.97  )
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
index 884a6352c42b7bc372c55a6be19ca9fcb15d3d63..20f7533ad9e7735013ff000e6f3b11d016f8a09f 100644
--- a/drivers/net/can/m_can/m_can.c
+++ b/drivers/net/can/m_can/m_can.c
@@ -2222,6 +2222,36 @@ static int m_can_set_coalesce(struct net_device *dev,
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
@@ -2231,10 +2261,14 @@ static const struct ethtool_ops m_can_ethtool_ops_coalescing = {
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
@@ -2361,6 +2395,9 @@ struct m_can_classdev *m_can_class_allocate_dev(struct device *dev,
 		goto out;
 	}
 
+	if (dev->of_node && of_property_read_bool(dev->of_node, "wakeup-source"))
+		device_set_wakeup_capable(dev, true);
+
 	/* Get TX FIFO size
 	 * Defines the total amount of echo buffers for loopback
 	 */

-- 
2.47.2


