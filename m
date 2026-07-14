Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37500C4450D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 19:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LDLbxpmL6xcV3aXdGANc7e2i3ALWkoxyw8RIHU2l5JE=; b=xpyYKLLQBohPw4VeFVuqNbV7B3
	oAE+/pJlNmeGQ6YTTcLiREZF8rdZOd/jvQinvkmE7zaZeBTLI+ZbWTaehJzBlpeKEJICg78hmBHM9
	/kMQrsoqLy+bw4nqsaWl+2tICrJtj7awvyKVytl/Xa3fvmBv+HGaZVBP6nYwtjXDzoHyTJ2eZWms/
	7iXds1fOCazS8R1adqYPhXcs2YrvznqOdKB/yKxV4FSITUO3ZfLeofnfEECTGZwAmjRhTjgG6uFVP
	3EIyFiH40Ntz7rEHVfWS86epROHRCkjSCE901hKZM9fw5PT0ogwxRnwSLhc7e8opQYtj9V3PqAt1P
	0FgK/0Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjimC-0000000D3NF-1afj;
	Tue, 14 Jul 2026 19:26:44 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjilo-0000000D2op-0Lor;
	Tue, 14 Jul 2026 19:26:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784057169;
	bh=Cc0K4Dr4eJL0SNbtq8hAs+EI1LLSLgYhEuv3ZarCDYw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TCMVnBFfvF9dgEV0Zk8R9ceHdtGRwiEEKljPYMo5gEHhCQBzGd2Aa2/os+lgOdLXj
	 5szueHCnvtE8Ipk7d8igsYL3MOv5uSGhml//XtWbw4HVk+hSzR+IbPT0NVjr8+8ayi
	 MCnJdGZUlWEy5ao6Us4S5za36108xZKK8GWywMutRbqXRd+QSfEU/dPmLvHC/XjsHV
	 VMJz3yhCtAe9UXg5NEh349IJ3cY0SZviFNqVpuVohDYEYg98x6/NcGpxoIKLwRyP8I
	 l5GH7mDedCK0IVV6GYINn1HB5sc6e71lsBXphA1Tbbqo85qhz+/osPnDFfc6IUCQqn
	 YbVHReUvx49Hw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7E1C417E0F76;
	Tue, 14 Jul 2026 21:26:09 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id D88CC48003A; Tue, 14 Jul 2026 21:26:08 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 14 Jul 2026 21:26:09 +0200
Subject: [PATCH v13 08/35] phy: rockchip: usbdp: Amend SSC modulation
 deviation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-rockchip-usbdp-cleanup-v13-8-6cb3e769d4c5@collabora.com>
References: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
In-Reply-To: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
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
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpWjU++ipQRjOseY59s9pGTP4qbq/L//IGKf
 vSifZcJJ2fUmYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqVo1PAAoJENju1/PI
 O/qavnQP/3IDc0Q76QtEeC9YkxDq7WdmLRnbUbRZxJgzk4FHIFpL0brortfzFzXJd9iiXKllVwL
 T2tZ83ddURxyGT1Cc4c9kzzeo05JvLFJWIMD8fPrrR50XqUGo8COeHTc5s3wan2k3khEMCHDEri
 4GdEa+7bGxMxcDETiA+/mXqIPvJi7i0EkdbHFR3LdwWsSFYeOCTBbflbEeCkUcFDJxAA2siqlYF
 L9aaKvHAMBTyuB8UtlOlc28wnVDYNMK2T/tb7sS0WEowDzKFYS/QRaHxQ8grmK7MSsqosIIgt/t
 pOodD8Xzy/HzrsPxE+clulHATk8qlutl57eVjLuj+Xxi1bmEjAFs8+a+SWds1yPyzC49zfKMP06
 2yQKt6p73xUrrcNcVKzghpareKA3O2pypZBNaPYW/4Bj2TrxIjXlAoLuGVKx4JvUG2Oj9hmqJgv
 MdvsBYjN47EswZ59qfqdjgpG+6exOzxg34s47C87HLF/owVaYwN6BZG/Lklj1NHBT5pf49BIDHC
 gg0mV6I92sAUgZTKxDFEnfq6tl2rAVX7/cbLPXiEaNMHREyvCSd7a4HhfYrMfaoXk4InljMVt/7
 A5zTyuTMBNPVeu0BcoRcBZlkHKOM+mtlgNu/Xm4zoWaTrRtbwYnQ/41FDf/qnsgq2oG/vvWNcoM
 yWO7dHOUCTomFy33+d4o2gA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_122620_297403_14638BE4 
X-CRM114-Status: GOOD (  10.24  )
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


