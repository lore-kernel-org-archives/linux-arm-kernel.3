Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B05C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 13:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QXrAeiQjnvdFgw+myB/tvf5VZTfTJQPCvtevG/l+qHA=; b=LIiQmwOBySCI2QT02Prpw3tKJ0
	pNPq5gyt/mhexG4I/XVTOXh0hFMo7opDkOtcnbiiCTTw6MGy82uaDMGQZ4RTALkFQf+SwZz440Tpr
	N1z/wB5M5VfmiibLn3dV2baZAzIlfnjbS/j6e8xS0LxXeZStkQs2LJDnvO/SHBDR7dHa4ShXHW2xO
	ydELSVpJRRva7nxlw1fcqSEmgYpqh5gXC6LFwnSpQxKS++SsXI/lGF408WmioDlslw1q/FIUHyAHy
	PFBbDQu36brXCYU25r09qOwtDPaMsH18fw8euWa7zRO+DExqJxtcXJzCeqTmCOf62+kZHU+d/ymZx
	ghRMykpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6TYr-00000006oFS-0Dw9;
	Tue, 15 Sep 2026 13:51:01 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6TXx-00000006nUF-2iTY;
	Tue, 15 Sep 2026 13:50:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789480199;
	bh=y2m60hChrXXxlzuOZEOMDxiIQSiccue3k4MFtLqjIJ8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Z8sUcD8axMffnXza5m5u8L29FiwUe0p73a2BqFIZl1mvNDpIGs72NTc67esAjCB6z
	 P4a/HA+ut22P6mTehagDCeQvL+eV64yHXS8iVbFjEd62PV+riE4RFT7812UmtKEQg1
	 F3NFxFa8/Es6khndv8giNK//OteUMxiwsCF94Dxy/3eRRkwLNiRJEpQrN0tLO+wy/6
	 tFGx3kHN8iIeA0O1YNP/rys9jJk4Wv3i69eklwCfbr5HIWL4UTlgJeyH2XhtQGgQU0
	 UXE0FvVtjNs7t1lw1Z4gruCYH3ZZWov1/IWUYvMLyilBhQ8xcCHIBTsY7qkgptQGBo
	 J5KX5nijqez4Q==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DE96117E0E2F;
	Tue, 15 Sep 2026 15:49:58 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 37D47480047; Tue, 15 Sep 2026 15:49:58 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 15 Sep 2026 15:49:56 +0200
Subject: [PATCH v15 09/16] phy: rockchip: usbdp: Fix LFPS detect threshold
 control
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rockchip-usbdp-cleanup-v15-9-80e2c11d1ce8@collabora.com>
References: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
In-Reply-To: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 William Wu <william.wu@rock-chips.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1590;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=SCkj94xNP27ZtEskhfHly5BCRxHy0FGBwjRYBFgRqc4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqpTQVEaTORrx2FRjxM6V0U3K887nRldDGsg
 2S1dy29N7/HiYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqU0FAAoJENju1/PI
 O/qaRz0P/2CmHTGRTg3ZxAItLSOJhG2sOeHqYquZWocxImok+eq6bTqWB9CsUNFPefk5UdoFS5z
 jqXIcKv2Yly/YTddDKONQlnHDNY4GNhc17UODMUpNN+6vSxPHpoSNq69HMEXOGwumXU8Ek3uFvP
 uACHA7kRg1KyBpzZkwRvs+MMxltDBQunfQ8/R2tKaFyFMrd6pHSHwydvpYaT8WzhjFjMj8L0AOg
 aeosISXtmtNlgRKLsmjT36zhRIbjSOkhwLaV0NyzWTwN+ff0Z7emWtjsTRfzoHXWi6a38D+OJwE
 4ocAV2HzTeEwPQXfl4c2lkbu0M0JNolGn//xDMr+iW3TbyBhYxPbhYsjZxTuprPWrSXPz6Y0p2U
 KxFj7dMevzs2UlMgTKC44AawHGGiXAuHmrCwLmEjZ9YUjZ/NHvB7TG6lXE9fTM1N593oaQPX7Kk
 dHSCMjxpQC+Tkis7hzA6pps2utHuqZvZEFEnjdw4/lqEo2gK33CEswVYiXt4Gh9ZZbfzD/CsMbC
 YOsC+wevoxrdiBo0+QFpsJOXYoz/Ey6Erik6dvd2o3D8UBC573v8X3SyLSGE6yFlobNNnRBfPoE
 jmJAalFz/pJkxlFja8ZXBBOrmNFXkg9dbppgeX7RYjKCFIMdqQEZFU5lODZ9Dq2B+ssqakWivN+
 /BPdwELKa7q3ltxtlN+0mkw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_065006_535154_7817E31B 
X-CRM114-Status: GOOD (  11.24  )
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
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 586363f5ca20..665a4636d9dc 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -412,7 +412,8 @@ static const struct reg_sequence rk_udphy_init_sequence[] = {
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


