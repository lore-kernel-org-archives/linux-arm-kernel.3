Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD958C44501
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 18:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LDLbxpmL6xcV3aXdGANc7e2i3ALWkoxyw8RIHU2l5JE=; b=OlQ/FSZOVCQTFhCNmOz1xUoYUd
	ZK0VRWMR9+SaCFoSs2GByzQJxB9J9B2fTOAXCEVAeUKTwm1X/TGG95au/GBpzcyOGVhlgHWZpVeIA
	e/HKKOdpRNnr0eLc44Akh3eDVjqXTr6KZBxmuvHWxvXMVFEllip8+/f0oO1a1K6PZDfyrlYFPQNz/
	N2gx5FdRMVlUysq65wNyfcf+QM9bSDwOUouyjgG3yVwTAwjaw6etUVhaSkEE9VyoGj+d3qjod5Wud
	h3Ls1Q9FDJaUTv1Zh+Y99DqB+WQxvZRTxH1IiDaH3JOCNwrKtURYQMPrgwW1cOBfBg9yelhg0oWgD
	UMDTAWxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfiOa-00000007e21-3DPp;
	Fri, 03 Jul 2026 18:13:48 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfiOS-00000007dhN-0YbW;
	Fri, 03 Jul 2026 18:13:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783102413;
	bh=Cc0K4Dr4eJL0SNbtq8hAs+EI1LLSLgYhEuv3ZarCDYw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=E2i19wjlq2rsoIHEcnaueaJ/K4dtyshIlXrw+t3C6oboXazurasIunErt+g92oqa2
	 a1tw5z5qncspPhAc2Q1U01vVj0J2JDXNoz0rOBc+0uC3qyIah2+1o2dfLoWDb2HHsP
	 EJy+Sd14zNRBysk12vV2z1/oEV6ncB3KRKJzsL7O3JE+3Pot9Qk5uv6VzcCguQwK8N
	 j+qiwsQuT8oVgFSFtECtYyEwDz7jHgZiDc9354a0EaKOMnFMQpM1W72OnG570b5azF
	 KOm5l6leJ+mioe61/GG1M5UQ4CKA1x8WqR1Hu9bV28fg6QzcbC8coVBzCOsD+HNpZQ
	 Yq6OM9sHU09tA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2EAFE17E128F;
	Fri,  3 Jul 2026 20:13:33 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 84D8C48003A; Fri, 03 Jul 2026 20:13:32 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 03 Jul 2026 20:13:24 +0200
Subject: [PATCH v10 08/36] phy: rockchip: usbdp: Amend SSC modulation
 deviation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-rockchip-usbdp-cleanup-v10-8-a392711ca8a9@collabora.com>
References: <20260703-rockchip-usbdp-cleanup-v10-0-a392711ca8a9@collabora.com>
In-Reply-To: <20260703-rockchip-usbdp-cleanup-v10-0-a392711ca8a9@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1765;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=lqHOLnlRChaCaNvIuz6SialOxFJNoEYQ3ZMsuUuJrVw=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpH+8s80/lf8jG4Uams+DOnBXJ9ATr3wING5
 plqkQ9ECJGJ4YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqR/vLAAoJENju1/PI
 O/qay+0P/3/QN6PVkC3GO+3GojamuYzFiLSjHu4KnD2KF7tC47ZVUFetM5TyvS7lD0a3t5KlbP4
 lIKNDLrU3T9bdRUtc9a9ajhj2XeSMfTjr0AK0LzQDvnNzxyNVXxd/OqkwrVBvnixkVmBHlSljzt
 0Nu0zp7buY9P5GqeurdjWgeEpW9B/KsUIySPLA8EEAf1kPckgaLDAKqjFwEjIfZo3Rbx5gmDk8s
 PwRkycTuDVFn9hg988E3enhYs88hw2vrlvGu3Q9HTVCsmUoOQwswLu9gr+RmXjWCe153ZMpKoOc
 S97LxFIi/eKyK4Em7OSxu/y4Esh5p6NPBojwQZhVvqnZePUW8wVoDC+z6b3Oll+08aY13thWDF0
 +wOQrlZrjJPudq3DeGAkflVVvyHgBeJK96s2506yx6hQ5JiXgv5xtInhObRl8No6bp7oWwkDr+m
 9kfUiydlvYOx5SA0wGOpy0a6YAqz3lG+9mwF4FWDpVM65vyHtgHukz87C7aTryxtQz9VEIlR5ea
 NW+TFzDLP8gQV790MuyxVeDvlfD5c6Q9ALVkdJf7i409BvH+YKQlY73Vy3/LvKvUXHcPZMmoSer
 Y/9vBC3/otNwUy8lbKr/UvaS/6YII3zYmvRrS5eqc1sxq4MM1L+PAg6/L4+Im5aezKi6ZvWZaQs
 j7bEfnqY+zTnYCHq4b4g0xw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_111340_349927_713DC576 
X-CRM114-Status: GOOD (  10.30  )
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
index e3f5a26c876a..cb6acadfbccf 100644
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


