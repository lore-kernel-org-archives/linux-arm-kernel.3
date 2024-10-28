Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D1EFD339A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 17:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7uoSe/osPZM5KlWFY2p8NKc5PKZqtCcQla6SsIgyOw4=; b=4mz3p69gXqS9AZmcOCx31GfwPz
	8NAoOtP61exqd6OUMvDWgqBj7O46uZxXtb8dnMRd6E4Bs1GbRf1Cn8mISnYFnyloKQrHytRW9p2Xn
	WTth/SQ5QW1nvhSZX7wD8eLYx0ad2kcAHw6pR5ti5G0HmWtv85bFU3gHM/23TX1BYwMC1u7lnY6wJ
	rsnUTIF93xxIo0vTrvuASLtNHylZAqWNdD26mHCwCZhJTv4OoBpbq9BzLxKh+DyCS+RwoLV85AFrL
	jHB93Y4cihU3pykr37T9gRnVna6DmctJp3ByY98IJ1z47yKd/FC/sJctCJMxVkkAh83Qk4qA1HImI
	f6IpDR3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5TpO-0000000BhcK-1tnH;
	Mon, 28 Oct 2024 17:46:54 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Tj6-0000000Bg5j-2MEA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 17:40:25 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4314fa33a35so44529765e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 10:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730137223; x=1730742023; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7uoSe/osPZM5KlWFY2p8NKc5PKZqtCcQla6SsIgyOw4=;
        b=klpI53P7Byh5V0JWagSxUbAnJBqdjktBL+2RFYi4yoVzISJqiu8B/rYx2p5Za76U+x
         RZBPNtplVuuSxLKIKVO82OJEzQrtSkcik7qGC4i29WF3GYyVyGWuTk4yT91fnCH969iA
         S1uXCxzNg0m3jyLtdhrY8iYGf0vfTXsPSkqc3uo4SvfqKpofcQ0uGcDL2SNNIoTFNaK3
         nbN/xblMbu7/HUByEj1CdmFQqlxpKsfGq/7Ohw6Pg8H/Y5JqYhDJJ+wbX87qMwbLwHGq
         zmXOpMuY2lbtEerBls+rj6cwEsoEhhF1lCS9hV4QlJv6aezGdPZf5yUwQ0c4Rl8SfV5i
         3J9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730137223; x=1730742023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7uoSe/osPZM5KlWFY2p8NKc5PKZqtCcQla6SsIgyOw4=;
        b=r1HNb9UKotPtBm0HoQrHTPrwDE+w9hE1wgcrRGcYUIL0DhAOWh3Gu+WrAyaPyKipHl
         e29tya+u78oUNEhZvC3WIWanB2OdnLexCxRyNh7cDCLDSAVcliP05AtOvJLMlhwS3VWz
         UVpfm0ewCID59+3Y0QbIYuZ+xIbzoNE7ElrFSeS2NjNR9/EeLE8pBFqxKZDZk/xq+Upa
         cN871GJsF/mwuZn3AaqQOlqcbzHSn4hqxuT/xtfIXQ4Wdma4qE1T8bGPaL4lcApJUlg5
         T4RaKS3SsxaR9LQvuncvz5E1SvM18Rt7BGW5r2Beq16KlKvsAPEy6cZD78esK3cF8Nq/
         SjKA==
X-Forwarded-Encrypted: i=1; AJvYcCVAQRTGmaQAu3Rgh+t1r/Xj7dTsSKcwlNAdZ7dobfvPFG8EFGf5cVe46RFlYZidzH5AVl/SGGi1MiqLt9zWmBg7@lists.infradead.org
X-Gm-Message-State: AOJu0YzLDE9t0OFioWblPFu668uYxvkNZjcVsg/2O8lqSfm9id/wEaVy
	jZ0cgDBKda46T7qn7GdWTGJA9IATMNgMXXETuOeJ7SZI/nPPbgXLS8stdkySY+s=
X-Google-Smtp-Source: AGHT+IEFSR/zG77GxCKMdEA6ZBLL2jNoMnHHBu+9OH7sb56aIGjLWheqa9jEnSLBwlhUQRsnp7JZVQ==
X-Received: by 2002:adf:ea4a:0:b0:37c:d54b:a39a with SMTP id ffacd0b85a97d-38061145761mr6895987f8f.33.1730137222779;
        Mon, 28 Oct 2024 10:40:22 -0700 (PDT)
Received: from localhost ([2001:4091:a245:81f4:340d:1a9d:1fa6:531f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b0ed7bsm10150974f8f.19.2024.10.28.10.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 10:40:22 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Mon, 28 Oct 2024 18:38:09 +0100
Subject: [PATCH v5 3/9] can: m_can: Map WoL to device_set_wakeup_enable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-topic-mcan-wakeup-source-v6-12-v5-3-33edc0aba629@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2839; i=msp@baylibre.com;
 h=from:subject:message-id; bh=XYYmgD9hEGtxNIWY9snEM0dWMiWJG8YdzXkcAQHDIMQ=;
 b=owGbwMvMwCGm0rPl0RXRdfaMp9WSGNLlz0SxP7w5mbP/+MqNZt6FkftLkoVjHVI7CmTVr63bw
 F358euhjlIWBjEOBlkxRZa7Hxa+q5O7viBi3SNHmDmsTCBDGLg4BWAimycyMhyudZAq0F0tbzN5
 ofD37/u+a2eyLtPZOYVp0WuhHp1jv/Yw/JWLPjLtpkdU+0f5/PDXDRMS+KUe39zqZTBrXlCfSqq
 yIz8A
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_104024_638670_AD4AA7EB 
X-CRM114-Status: GOOD (  17.58  )
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
index a978b960f1f1e1e8273216ff330ab789d0fd6d51..b358b60a1dee0f39aba9e2ec89dcbd0d65cd7823 100644
--- a/drivers/net/can/m_can/m_can.c
+++ b/drivers/net/can/m_can/m_can.c
@@ -2185,6 +2185,36 @@ static int m_can_set_coalesce(struct net_device *dev,
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
@@ -2194,10 +2224,14 @@ static const struct ethtool_ops m_can_ethtool_ops_coalescing = {
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
@@ -2324,6 +2358,9 @@ struct m_can_classdev *m_can_class_allocate_dev(struct device *dev,
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


