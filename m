Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D7EAC44506
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 19:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AjjxI9FLTDh0hcZV/8jaLFol26sz2jvRRKSz+sxvK+c=; b=21XJiyF9+CujiTmV2SvEnD8tGm
	z/sQTIekMus0FkJotlQ1+FysQW5YaL8kIMzDoeYuDfd/1s56tSr/CfRUuL/05s9wVfncFCHN/Qbp/
	TJ58xNh4QDAoNFprGcdcK99G7t2J/DAZwExrNzu7Fa4GvE+ld2ssk7w3YMt+TxsPQbO9MrIIUDp4C
	72fp60KzSfTRMJqGjWd1Y9kpDLq7z2MEqxneu4jWG1+kSkNzxsn2P0lGPj69bYFJ41doNgJI8zzEn
	02dADtH8YJBsTuyEcL5os4KkTqNucGRNF6nXH290K9nW5BZK4ZvgRyGuQVQ+ukO+KWlXM896grn/+
	bR3lmVtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whu1N-00000003Lt7-1ALw;
	Thu, 09 Jul 2026 19:02:53 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whu18-00000003LJa-3JDF;
	Thu, 09 Jul 2026 19:02:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783623750;
	bh=MGpikBa/aaqvkv65oP/N23ryrQe5o83Pvtc6osrktIs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bfdXE/qMu06MEV3keqrnbIHc45LkcEkO+v0QUJSPixX3kl7LJ61GSyRJvfE6NGv2p
	 DQoClxt/DT9Nw+rJ3JaxbTZf5aSufZNQiKx7IUOoEV48xO6We/d7Q5UvR9IazjJH2e
	 aU1ObR/qmNXrSvSW4Pj59JvfbVyg8s07NY64IbM78JxJEAcC9RDD8Yfw9o/MiiyRgE
	 IWJuMGSSIVawYWyOtRMjqMULRJN4XZSEzV4WBOC1DPzrTbjeGD2/cq0XPsphfttTUw
	 +03w/NhhHOqgMTze4WhPt2pN9MiLV/TSZzH6Sp9zzrh8CeCB9T+yT0nyeEewHunRZQ
	 bRSvk2Hp4Q7KA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5C50F17E0F07;
	Thu, 09 Jul 2026 21:02:30 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id AEF4248003D; Thu, 09 Jul 2026 21:02:29 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 09 Jul 2026 21:02:32 +0200
Subject: [PATCH v11 09/36] phy: rockchip: usbdp: Fix LFPS detect threshold
 control
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-rockchip-usbdp-cleanup-v11-9-a149ac60f76c@collabora.com>
References: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
In-Reply-To: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 William Wu <william.wu@rock-chips.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1521;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=6XR1qE8oQQO8DmAkgt9+gIoazIh1eRLq97pcAr0j0tg=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpP8EQ6+m3m2zcJYFXdZZs8fSZUTdzI9BVel
 AbhX5+lHFtRyYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqT/BEAAoJENju1/PI
 O/qafhQQAJPGYHdwUANq63CnePHUSH5D9LKcIEPmB4RgyVoqltMwGyI0sNRXW1M7bt5ZLqbwuna
 GMI8Mi1HtYICVg/9Qa+WoN3TUdKpXRyGa5G6J5yWlCUkXGcpaIGpAbD/ZTGX3awQaRv/qbhLd53
 ao5+28cMCoJAdFqwWYoyiLsHGQ1BA1sBc5AnkO6dcZYwHrft350GFUrG1TzIizZoc77vmZr1oHD
 CyUAMudJRsjA2vpJBzOFV9l/NRUyQEFKYcy1IGJ4hS4r0Xpw6N+6LaOdWmhhU+xjEL0G3y+9hdc
 xr5EzufrfYOgTSXnBLvRUx+lG67K1xklsJRZ/B09Hqj15Y4TNGRnz7tbksj3Zszm9ohiROOsDaP
 ZVq42jmNZeFYNrw7mi58ecPlkVVXIlxf6lJDNcvXjq70mZA8URHS/McvGxOMloat3V7i9Dscqu7
 wdkbPp/EY5XlmsRrlP47m6arzs8rWXn7p29G5G18tSC6+aDvsRnCQPHM3E1cTFdkB//rHHRaCgX
 drdz0zNenWZC3PqMWCNNpqwF76Kf6yzlAHsrQrXPGnxQZGsGn7bBimRSCEA+NqbheRB8nLZuwMD
 JyVyGqkkMKSvNjFgziHUQtot/LfkVJkjwM5zYb3x/NH+Lc50yn+DKGZ+8fAnAjiqpvEd0T0NoF4
 40+qt223BzOWQJ6t2YU4zMQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_120239_021406_4251328E 
X-CRM114-Status: GOOD (  10.97  )
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
index cb6acadfbccf..982315535caf 100644
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


