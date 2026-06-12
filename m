Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73433CD98DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 16:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jpu4YmjWKBO3beytgsDM8/p01vPev4PeFgjjReZQ/pU=; b=BaD80kIWc6UQxoLAKmkmmulK2d
	w3YHQQghQ0d1sImtbhz2xMeq87IOY4FuWcS9R+1xrCKqI4Tc5jLDatGcQh33PuyKmkaTQr3lJHqct
	hj7Ha6/B0kbkDWh1TJwWVFfi+ATfbFf+XSkYPZH5YRI2aU3LIrdxRZ8biBqGqVrmchxIJFFUeXZGy
	p55pTzGmchImdxBEXDqyxsSusgDWFuOzhqgVazY5G+TMxar45X/NhvbAt4kyc6NYO+V030Xx39RAe
	j7XWbZ+Dr25P8HRgN08rIfI8fxZem0uJOQfGnuDL2wA+H1Za0FYuaU7PhZvO2udNXEToDtzJ2cQz3
	Bo4obD4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4dz-0000000BEHl-0fAu;
	Fri, 12 Jun 2026 16:22:07 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4ds-0000000BE46-35yK;
	Fri, 12 Jun 2026 16:22:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781281314;
	bh=V/529AadGwD70lqWgfn8mxzfTOio4otD4zISV3Ilp7c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fnb/YTyBFtoSuEw8z0NjXJyZx2QfyudWBKQu00sASaP8Dxl5ub2Q17x9LHLlRn+N3
	 JHgZdyeT+cLhl+9R8k924qGh/8ZKfBfvRkLKOAIo8H/vwE4pY98ARXmSfDprgI0IJw
	 LSr4Y/aCEu9kjPHzf77dQXl4pIdYGOroqxAf9c6vWqRvsLuI/Jwvb3oPVbGIRN3dgQ
	 MqOWo8dFVXdZUIy9EePkLmrd6iKouRrJCcYeT1+p/KoAURQ/5c8Ot3+GxboRDXfcDr
	 G4EYjoljq/VLsF/0s5rF4qY8xX61pWpPT6bwx/oe4QgIzXD58zw96FlnxoBdizki9O
	 Frha7jSr11/6Q==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 71DCC17E0DE1;
	Fri, 12 Jun 2026 18:21:54 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id CB4FD480030; Fri, 12 Jun 2026 18:21:53 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 12 Jun 2026 18:21:43 +0200
Subject: [PATCH v5 05/18] phy: rockchip: usbdp: Fix LFPS detect threshold
 control
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-rockchip-usbdp-cleanup-v5-5-efc83069869f@collabora.com>
References: <20260612-rockchip-usbdp-cleanup-v5-0-efc83069869f@collabora.com>
In-Reply-To: <20260612-rockchip-usbdp-cleanup-v5-0-efc83069869f@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 William Wu <william.wu@rock-chips.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1521;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=Led/QOkLk4w3MB/VmlIc1bBbJFPYOjp803NShAil2Pk=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGosMiEVbdQEOmh+s0g9cTOXjnO2Imv+Ax6sl
 pAF6ZFPpPMRx4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqLDIhAAoJENju1/PI
 O/qa42UP+gMViwOZ9fF3gyraPytg+28dj1fMVIEBNTqVmvDEkCTGyMwi4wqg7OlqCWo5n2GegVl
 Nzns2jrwU+wgE98248rp10t4RaVeXgMeNq2dhB401vzwQbOwt6O9Q/cfZiT9jvIeXK1tMlgdCJ3
 8Dua4LWb2HAjilGNeJq5TGzgY5eetmq7U6AWNOBjBS2q76VcaHkfTKQfC83I5BwVdSaaG+/HMda
 p8LTmRmbZZlSkqSDaLJr8W2fpCPZ0aVOuW47z5FEBm4y+eaWaVo7Z2xcw2Z5zcqCB5o8E6mxD3B
 257Fm22uul8ya5crgJLQB5MZkqYuXt8ZqtoFsHhXcwEecULa5isFvju7p7Y+YfQ9H4up5RvtEq2
 oGu8yzu54cJwBgpBicH7zuSIYBZpqdcZ552yMnnZ4Z0L6sflEpZv9MF4KwwpAQf3Af3h9mqhegk
 WWke3OI20wfyhyNwUzw/j/WQ/h8txa6v3VKl1HImy5FDdcI6d4nYt0ylYvGlVpLKv6GsqM77x10
 XOIuj5hWB8eNbHjnn2VAB0oYA4KXnyLZWG2lIknvoDvifxuJN5rzX+ZQXvYnlGAyHrtz8XjO8yB
 x5IGt/QzlxcBSnRHpPTqX3zR4q3RRJsEWwaliFr7EENMAqhsADBno8SnABtsiniqnXe3VafZIzC
 yZzTENiyzTnrPL6E1/xsnkw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_092200_991259_F2EB5B89 
X-CRM114-Status: GOOD (  10.86  )
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

From: William Wu <william.wu@rock-chips.com>

According to the LFPS Tx Low Power/LFPS Rx Detect Threshold [1],
the device under test(DUT) must not respond if LFPS below the
minimum LFPS Rx Detect Threshold 100mV. Test fail on Rockchip
platforms, because the default LFPS detect threshold is set to
65mV.

The USBDP PHY LFPS detect threshold voltage could be set to
30mV ~ 140mV, and since there could be 10-20% PVT variation,
we set LFPS detect threshold voltage to 110mV.

[1] https://compliance.usb.org/resources/LFPS_Rx_Tx_Low_Power_Compliance_Update_Rev5.pdf

Signed-off-by: William Wu <william.wu@rock-chips.com>
[Taken over from rockchip's kernel tree; the registers are not described
in the TRM]
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 1f686844c337..97e53b933225 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -413,7 +413,8 @@ static const struct reg_sequence rk_udphy_init_sequence[] = {
 	{0x0070, 0x7d}, {0x0074, 0x68},
 	{0x0af4, 0x1a}, {0x1af4, 0x1a},
 	{0x0440, 0x3f}, {0x10d4, 0x08},
-	{0x20d4, 0x08}, {0x0024, 0x6e}
+	{0x20d4, 0x08}, {0x0024, 0x6e},
+	{0x09c0, 0x0a}, {0x19c0, 0x0a}
 };
 
 static inline int rk_udphy_grfreg_write(struct regmap *base,

-- 
2.53.0


