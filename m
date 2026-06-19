Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B8FCCD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 15:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jdR7eOzaUhjDoKQIkvBzD+tUN0O+OlIziBkAVygALV8=; b=Ne/AUQRi43fB+0oGLaIB72sBRF
	eKCS/FTg8Akcm5rHMiMUUIKNA7Xbxq4m3zfiZtB9SIgl+wcABqw8urRKfQanvk1uuH4JH94pmQ0jU
	xjavU8yYPWA2P1Nq627YfV7N89u4UpDX3TaJS6tqt1HMNIm9QRvdGgLeBMidbEGfP86UUnlr8GO5X
	PPgKHZ61CIHsbNXxNzK5uKn287DJPUz0xcL/M8yyn2U+qL433mS/RDPSL72/fh+G08p96/qxO5VwS
	QtuJpMSXder/Y5mCmLEYBRj3BShwuDzAvgx9mAHr4HV4WR/a1ybZlIQtab7m5czkys+y00cn2B2ub
	TLxFf09g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wabAN-00000002esr-0N6x;
	Fri, 19 Jun 2026 15:29:59 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wab9b-00000002ddB-0I61;
	Fri, 19 Jun 2026 15:29:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781882939;
	bh=fGB8zX6Zfp+M6Zw2pNizcuxxMV1dwDdIVya+UcR/UWs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cqqKC5u4L7yn/VNNiidGhgTp8AuupLzSGNc3cv7+RYkaDlXlLg0k0ID0nOwbYC3cZ
	 m4SEPXy7j/haBEclBlI0z6jzyusE/uYHqucaVud4GpJNVOqQzZ9C6GPpDKEZMMm7bm
	 JNGa0fu8+w6edua1/LiV06/PZP6PtmCgkeWazfxfOReXEohd0hqc8VqvOH4O0AX/1v
	 X0sNoyVG/61YgEeS3XC9np8DFyPaalISpUXlOl4SYZNcbvpbTVentF0JPhStsm8RCe
	 8fmkpOZmHvbqZgv+K3Ew38vC/XNJj433Ek6tm/jA69TCacrO/i0im/XmKt0xt59jrd
	 JcLNpz3tORqYA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B9C3217E15D0;
	Fri, 19 Jun 2026 17:28:58 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id AA50D480068; Fri, 19 Jun 2026 17:28:57 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 19 Jun 2026 17:29:14 +0200
Subject: [PATCH v6 23/23] phy: rockchip: usbdp: Add some extra debug
 messages
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-rockchip-usbdp-cleanup-v6-23-3bb1f54b3f35@collabora.com>
References: <20260619-rockchip-usbdp-cleanup-v6-0-3bb1f54b3f35@collabora.com>
In-Reply-To: <20260619-rockchip-usbdp-cleanup-v6-0-3bb1f54b3f35@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2060;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=fGB8zX6Zfp+M6Zw2pNizcuxxMV1dwDdIVya+UcR/UWs=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo1YDlwHmGpzQsaGGZ+39APMlgb4ew9c/ad8
 P8oCEIriDj5UIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqNWA5AAoJENju1/PI
 O/qaEykP/0Jz31zIyMfVKaYYsJVsYofuD95kkwNxLBsk/gGuycjiV3oXe35UC3cTPFbibHncxxj
 NeSk8HrkLUvh4DjBPIIPMKeRdwQY6ASQqqNfVXBmjuVdTqzw+AOW/1IRrBgLrB+XP9+rbfb7ES4
 cjmOI9axtyvi8eEIM5Q2gfTPHxOcRPLgvYQb/hyS9T07dSGs1HAj66jlo4QpG2Cvyh69xXluf90
 3wRx63i01sdp9wjKCuy9etnS7xpscSQwclVamql3/sYu2tjks6HxileC8xu/G8v172BLz+lQ9w3
 jas/OgFI2CJHMp6963wfx/NzW0Vsv+yKnWc1usAFhnoS1aVZh984VdYHhN6qdQLD29FSMXYRXRr
 Ey9q2x9WBMoQV5s+IJ3E3EIPUl14OQWL9wqGoTrQaYeKg/p47hlPonr6M+/RbdM+MccN0clFyQb
 4u05kZfGrQgT6FNI2p3d56QV3zZV9Hl6hHk3ov7eDVTXfrbDX6I4wL0N22LoO5SFHOrqynB1Uyh
 1/yguZ6GaUhQcLWVNyLyC0qFbUSBvGdxnP1RRk92iXp1+6TGYM/lGq2+xEj6+5ArExgtncioHnR
 oWVjcKQ4MOkxryD2Xm8lZdnBeJxsFhgIXObkeriOOhMnc71gZEPYAD/iLMmiFE/Qj0rQdluWATE
 jpr4VDqEACgUq62tGmIQnsg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_082911_304189_8C4D6B70 
X-CRM114-Status: GOOD (  10.17  )
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

It's useful to log PHY reinit to ease debugging issues around
USB-C hotplugging.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 8c59c50f207e..6e80dfeee0e5 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -24,6 +24,7 @@
 #include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
+#include <linux/string_choices.h>
 #include <linux/usb/ch9.h>
 #include <linux/usb/typec_dp.h>
 #include <linux/usb/typec_mux.h>
@@ -491,6 +492,8 @@ static void rk_udphy_u3_port_disable(struct rk_udphy *udphy, u8 disable)
 	const struct rk_udphy_cfg *cfg = udphy->cfgs;
 	const struct rk_udphy_grf_reg *preg;
 
+	dev_dbg(udphy->dev, "USB3 port %s\n", str_on_off(!disable));
+
 	preg = udphy->id ? &cfg->grfcfg.usb3otg1_cfg : &cfg->grfcfg.usb3otg0_cfg;
 	rk_udphy_grfreg_write(udphy->usbgrf, preg, disable);
 }
@@ -784,6 +787,10 @@ static int rk_udphy_init(struct rk_udphy *udphy)
 	const struct rk_udphy_cfg *cfg = udphy->cfgs;
 	int ret;
 
+	dev_dbg(udphy->dev, "(re-)init PHY with USB=%s and DP=%s\n",
+		str_enabled_disabled(udphy->mode & UDPHY_MODE_USB),
+		str_enabled_disabled(udphy->mode & UDPHY_MODE_DP));
+
 	rk_udphy_reset_assert_all(udphy);
 	usleep_range(10000, 11000);
 
@@ -854,6 +861,8 @@ static int rk_udphy_setup(struct rk_udphy *udphy)
 {
 	int ret;
 
+	dev_dbg(udphy->dev, "enable PHY\n");
+
 	ret = clk_bulk_prepare_enable(udphy->num_clks, udphy->clks);
 	if (ret) {
 		dev_err(udphy->dev, "failed to enable clk\n");
@@ -872,6 +881,7 @@ static int rk_udphy_setup(struct rk_udphy *udphy)
 
 static void rk_udphy_disable(struct rk_udphy *udphy)
 {
+	dev_dbg(udphy->dev, "disable PHY\n");
 	clk_bulk_disable_unprepare(udphy->num_clks, udphy->clks);
 	rk_udphy_reset_assert_all(udphy);
 }

-- 
2.53.0


