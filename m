Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D22B7C43327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 20:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iN9dp/bG5DJas6NoicWJU7L+oAor9LkYogrRyxb7Td8=; b=Fkq+RNKhBUEoVeQkq5Ao1X9g6m
	kPV4TxrnBO0eesiSKAfhLSWRS9racQTseejO4RFcYecDT59ENPEs/32mnlfIwopBJQHdUabJByrec
	zX4hRYlzh1V5TCntJTMz7ghswEHKdpRmCBq7TBpqFfBeKpPCWQMWAMfy/2zCq/jPD/4iJiLnxqhnx
	d5ZuyCRF8sBxKG8dB8uyONVJ1ohwVJ9CgMhoiKHilHa5JbtF2l71z+2hkp6hyli3TAV1xD/hBBMmH
	fQO4pPhopYXkVnKCvyBOQzUdkQRWdnkxjYwda78T6Xz5LHkxndLpfX8LzMPByA3/wMhEggTMHGR1g
	CoI4MJdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdDal-0000000BqTC-3xn7;
	Fri, 26 Jun 2026 20:56:04 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdDZw-0000000BpcA-0dhx;
	Fri, 26 Jun 2026 20:55:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782507303;
	bh=DeCQiKYzYtL5y25Ox2QoMsSZqFA447KebiIBuIo73M0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UXwB3LAbvWmmXIpinH5B7r7YHUrV8XWDXWcONkisS21W4jQl4Wo5yxsi1bHnFTPcp
	 0mySUZwSB/ffm+p2s1lPaD3aBNGGzdcLocsAj04y+TZ7xx6u88hBM8XyT+xCC1vmd5
	 y34ZieCEAL2+D64vnQ9284/CGZn0RpDfHPmBB3ECSfMqot+UOYIpy9QSWHI2dffW7y
	 s+Gd7tbNFmdC+SaE+XmswDPqLebUoA05a4uY1EWMJhmbokFpHjlMKLl63Gp8/4zfR3
	 iYNFwfr1FQQUjoicBmMU+Fy7UXTUJ2mEHsg7TZJxb9zjv7NcP+OlsBZejCxBW8JXhF
	 Ym6lx72AgUczQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C178B17E14FA;
	Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 1862E48003A; Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 26 Jun 2026 22:55:02 +0200
Subject: [PATCH v8 09/29] phy: rockchip: usbdp: Amend SSC modulation
 deviation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-rockchip-usbdp-cleanup-v8-9-47f682987895@collabora.com>
References: <20260626-rockchip-usbdp-cleanup-v8-0-47f682987895@collabora.com>
In-Reply-To: <20260626-rockchip-usbdp-cleanup-v8-0-47f682987895@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1765;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=5zxSOrJgXfwqGBSQx4xCvebtlAiKiNSAtEIpVUkrxuA=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo+5yXg1gaD4SLd9TOhDPGuK9QiocSu13X62
 UuDG4ZzEydie4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPuclAAoJENju1/PI
 O/qaIzcQAJKawiMEQWGjwCJID6K7Fd/5mAfRX7c/651vSwl73b2130niAhxfq0FcYR3aPDw8mqn
 HLpANWew8fS4SQbKQ1TgZ/Fcqs5ZHULtZvzGqTyvmE5055wqiglaeQO7quu7JDm7LmSMchtXxoL
 FEIil7j0vpLejYmFpzE1ogRYWngxTEcumHCGrOivo7BWbPqxo2JqDIo4aR6JcFIEm3mdYnVuu2k
 Y++DcC2TW56c2I65AUZ2E/msff/JeTaswEOJbR4Rd1TGjHhIO1VvguYBzIGaZyP3/v4RvgbN8yt
 5b/H+u4Jy9hZ1hqsNPGJk6sF+ScK9kVA6lviohiMcCX40IglkgV42AZmsaX7pEBG7X2SkrkAIzT
 JDSgCloLVp5Dm60VCmxqsDUBLyzFe8NXorEU6tUOEiXYO1GVKgUUvBmDScPkmjO6CHt5zWNyo09
 YGFGm3tI6F0Jbomcr9kYziAgSXttNMIXIh3usE20i0jkqVXKlI5lIIKKJe4Xi2xIP7luma90Azo
 8xVg5Xer1UHB7CJvjnQPsku3oHk7hnf6QbpClHMAhIdm9S/wDH0uH/AsvHoDrbCy4NcxFndtT7r
 RoXV1WC7/mffcz9pYu+sKt8ZDQQhFYNsA5UfE34kFlEac08m7lTSChU5Yf/9Or9cG+zVv1xA9rW
 cUdtsrHDXVWWk3yYc+nQvAw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_135512_390034_95E087AD 
X-CRM114-Status: UNSURE (   9.82  )
X-CRM114-Notice: Please train this message.
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

From: Frank Wang <frank.wang@rock-chips.com>

Move SSC modulation deviation into private config of clock

 - 24M: 0x00d4[5:0] = 0x30
 - 26M: 0x00d4[5:0] = 0x33

Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
[Taken over from rockchip's kernel tree; register 0x00d4 is not
described in the TRM]
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 7fb7e4669f9d..2aa9ccabf80b 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -350,7 +350,8 @@ static const struct reg_sequence rk_udphy_24m_refclk_cfg[] = {
 	{0x0a64, 0xa8}, {0x1a3c, 0xd0},
 	{0x1a44, 0xd0}, {0x1a48, 0x01},
 	{0x1a4c, 0x0d}, {0x1a54, 0xe0},
-	{0x1a5c, 0xe0}, {0x1a64, 0xa8}
+	{0x1a5c, 0xe0}, {0x1a64, 0xa8},
+	{0x00d4, 0x30}
 };
 
 static const struct reg_sequence rk_udphy_26m_refclk_cfg[] = {
@@ -377,7 +378,7 @@ static const struct reg_sequence rk_udphy_26m_refclk_cfg[] = {
 	{0x0c30, 0x0e}, {0x0c48, 0x06},
 	{0x1c30, 0x0e}, {0x1c48, 0x06},
 	{0x028c, 0x18}, {0x0af0, 0x00},
-	{0x1af0, 0x00}
+	{0x1af0, 0x00}, {0x00d4, 0x33}
 };
 
 static const struct reg_sequence rk_udphy_init_sequence[] = {
@@ -412,8 +413,7 @@ static const struct reg_sequence rk_udphy_init_sequence[] = {
 	{0x0070, 0x7d}, {0x0074, 0x68},
 	{0x0af4, 0x1a}, {0x1af4, 0x1a},
 	{0x0440, 0x3f}, {0x10d4, 0x08},
-	{0x20d4, 0x08}, {0x00d4, 0x30},
-	{0x0024, 0x6e},
+	{0x20d4, 0x08}, {0x0024, 0x6e}
 };
 
 static inline int rk_udphy_grfreg_write(struct regmap *base,

-- 
2.53.0


