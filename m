Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E57D711CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 23:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g6raz3KoWOzTxqAlX8pU8n+XtKoFRaOS+C4fQIA28d4=; b=MVIQrOhXjGo271+iNIFm9aJBj4
	r5wEAw8SKsUEuJ3gzwD+0XQtyQabRkWVrRX8Sbcx9GD2gaQ29BIXSN2K15mVZll2s/JpoTx9aO7+W
	p2pcbja7T+iLwRNpWbzftkRku4+TZpxSGngPWxbf7FXp4GaaQtrLJO8MsIY0BAZ1SFI+VZQZ+YQxE
	Y/v2KcmaDSxLvg/UqczI+vBwDpPSRve0ns7uQNW9wDqfYNLUfMtvLH9rcF3Y8gOWVgB6nRYXT16RS
	jzs/0h7ZGlL6eDKytpL7JSwE9J7nlKpeQU4j1XGGNofNB7GIqpeVt+ikKJK6M/I9MdG3tNVOZu9Aj
	EW1tbpPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWNQt-00000009KJA-1OnC;
	Thu, 18 Dec 2025 23:29:19 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWNQk-00000009K7E-44Wq;
	Thu, 18 Dec 2025 23:29:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1766100548;
	bh=xi16N8WVlbn1t4okpwwS5XkaC5CK7jACWFwAtCe61Pk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gjFku5dOb7AYDq68zr5faMaSvGdivlS44lZHDaCQjzEE1aX9clZMjvzbhavuRpRZK
	 TQlBnKawuwIMU0+iAXYRTzs9RyRbXLaf5EIPo3oYUUmKMki5obV6fGCEA9QEL0ZnZv
	 VvfqceGPsAAAJYfgTCW4BvdWVOaB4eDt7T/Szie4dxwTXHns+XE7+1K47iYeC6LoJL
	 W1t0SWKQlOuPCI0wtegxyfZQx4jtBgZLjrTMTIN6lcNmcHVvCnr3pqH5Qcttlvs8I6
	 31pXLFL08mv00YrV4BLBfR9HPseXO+89oOL++t00OXtq3WHu+aACx1JiVgnY1zpgkT
	 pomQIipOGGbpQ==
Received: from earth.mtl.collabora.ca (mtl.collabora.ca [66.171.169.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 722CF17E1546;
	Fri, 19 Dec 2025 00:29:06 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Yunke Cao <yunkec@google.com>,
	Hans de Goede <hansg@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Pavan Bobba <opensource206@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	James Cowgill <james.cowgill@blaize.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v7 13/17] media: rkvdec: Disable multicore support
Date: Thu, 18 Dec 2025 18:28:23 -0500
Message-ID: <20251218232829.337811-14-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251218232829.337811-1-detlev.casanova@collabora.com>
References: <20251218232829.337811-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_152911_249676_2F2A0F36 
X-CRM114-Status: GOOD (  17.87  )
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

Similarly to what is done in Hantro, avoid exposing equal video codecs to
userspace. Equal video codecs allow scheduling work between the cores.
For that kernel support is required, which does not yet exist.
Until that is implemented, avoid exposing each core separately to
userspace so that multicore can be added in the future without breaking
userspace ABI.

This currently applies only to RK3588 which has 2 equal VDPU381 decoders,
but will be applied for all SoC supported by rkvdec that has multiple DTS
nodes with the same compatible.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../media/platform/rockchip/rkvdec/rkvdec.c   | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index ce96a0470d4d9..af2eced900269 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1269,6 +1269,49 @@ static void rkvdec_watchdog_func(struct work_struct *work)
 	}
 }
 
+/*
+ * Some SoCs, like RK3588 have multiple identical VDPU cores, but the
+ * kernel is currently missing support for multi-core handling. Exposing
+ * separate devices for each core to userspace is bad, since that does
+ * not allow scheduling tasks properly (and creates ABI). With this workaround
+ * the driver will only probe for the first core and early exit for the other
+ * cores. Once the driver gains multi-core support, the same technique
+ * for detecting the first core can be used to cluster all cores together.
+ */
+static int rkvdec_disable_multicore(struct rkvdec_dev *rkvdec)
+{
+	struct device_node *node = NULL;
+	const char *compatible;
+	bool is_first_core;
+	int ret;
+
+	/* Intentionally ignores the fallback strings */
+	ret = of_property_read_string(rkvdec->dev->of_node, "compatible", &compatible);
+	if (ret)
+		return ret;
+
+	/* The first compatible and available node found is considered the main core */
+	do {
+		node = of_find_compatible_node(node, NULL, compatible);
+		if (of_device_is_available(node))
+			break;
+	} while (node);
+
+	if (!node)
+		return -EINVAL;
+
+	is_first_core = (rkvdec->dev->of_node == node);
+
+	of_node_put(node);
+
+	if (!is_first_core) {
+		dev_info(rkvdec->dev, "missing multi-core support, ignoring this instance\n");
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
 static const struct rkvdec_variant_ops rk3399_variant_ops = {
 	.irq_handler = rk3399_irq_handler,
 };
@@ -1332,6 +1375,10 @@ static int rkvdec_probe(struct platform_device *pdev)
 	mutex_init(&rkvdec->vdev_lock);
 	INIT_DELAYED_WORK(&rkvdec->watchdog_work, rkvdec_watchdog_func);
 
+	ret = rkvdec_disable_multicore(rkvdec);
+	if (ret)
+		return ret;
+
 	ret = devm_clk_bulk_get_all_enabled(&pdev->dev, &rkvdec->clocks);
 	if (ret < 0)
 		return ret;
-- 
2.52.0


