Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF72C5DF6A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 20:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uwuzVCUkaL5m7kYMpe1MmF0KmKqPz2AgauQcs9sSFeM=; b=bJPa5HUIAOVfgoTw9RDFJ+7G42
	XCs6o9IoFdJvAM46h7WUoQMECLoGefCKjUjPxGLA8wZdvH8/+vtiyjAqBSE+3K/+V47X94m/vgKx3
	TG2Sv+GKyROqH0I8XXXV6KLxIUjgZ7Vt6Ect6RLK14MJ4i9vv/jdq5jX+J17wgYMeuFe/nktn5Gdu
	Hk6He7uHf/Sl/Wxc+G8PSaTIMq6ksx1lnXDlIPnJXGA4N6gTY+Z1sHea1fWjrTIeqKp2cbeZI/Zq0
	bzpwUTkTmv6E4MW/m/dMDtEJZ0L/Ylgge4Vslf45LyA4WSJfg+djnrCzEC+z29VLSMF1jd9YZ/lTj
	u32Hjpww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wucPm-00000001Y2j-2nvO;
	Thu, 13 Aug 2026 20:52:38 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wucPA-00000001XEJ-0L5f;
	Thu, 13 Aug 2026 20:52:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786654310;
	bh=d+vGxQVXhNCJ8rbP5aExKtS99bfRBlYn/0PUloa4QH0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=X/hrHVl4thqdT8ZRio5q/XXTmLhT1WFe6OCYYUG9fO18eYay86bw26VsX/dbeanhj
	 4PENLUONKFqTUOhW55ry7ARMyk+eGVIo9mEaqQIVvElHlCbJqRTwwwCEivXqBpbqv5
	 UN3+jEnvmhq3BfX3ET0wv/m7BD4oBPtJuVwiS7ucWZ+BLrLM5I3HsI+5FvqZxuLwAY
	 8B6YSA8nkAFLI7V1X44wiv6UZWGBH/CylRxg+o5uk3CQASCX6hVKnNkR3/HMYh2ek5
	 ShPWs8lHnt7Cu49EtZGp2byWFQkGZGJ4PYUaMg2F2OPqQt1HX0s4KeQ7yvnxhMFpwg
	 GOz1iSdEmAElg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4183417E10BE;
	Thu, 13 Aug 2026 22:51:50 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id A195348003D; Thu, 13 Aug 2026 22:51:49 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 13 Aug 2026 22:51:52 +0200
Subject: [PATCH v14 09/38] phy: rockchip: usbdp: Fix LFPS detect threshold
 control
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-rockchip-usbdp-cleanup-v14-9-b5ad9c68fa11@collabora.com>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
In-Reply-To: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 William Wu <william.wu@rock-chips.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1590;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=jqk8lmE8/yQnrP3NdFs0iqp55s5naGRZj6PxeCD9eM8=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp+LmQm4F1raePEo8QwGFNO9cG97bYItivXS
 LaeWnivAEpSV4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqfi5kAAoJENju1/PI
 O/qaPpIP/1TBR81PN/x8AeIVjBEeAGS5G7jOc8nJRRYXHckW5ceHyp8zeE+hZjNz4N/tJ9lDqeM
 3FM3aVwylQTcDJXiN0fB5+Y7671cif0gvX9PZ3QcmoJpiwlN7/sdTiiiDSZ27AWHeUL8O09VDHe
 xCpyO6x3gagadiDyI6CymtijX5wAWAqihHTIZt2k/6PmumesKe4dtGyMJj5kH2pYl71vRUrvz++
 HM6cSKFJ0nD6avWcYXVxaYwuhhvKvebMA6U11rWpBqmR0kPyFaeZ20o56Ao4UAFSYd3tHcGunSE
 5QvrFAmHa0rYzZqt4CRNHiH4C4nzxV7VTaaTP9Wn07r8TICaZFLFUeVHi9d55OBUtHIoYeXNEQs
 fEXnix/wRaZBMzD0toKfutYzgcPGsYEacgqzevP7VoG+yx19nfo1qtynWjdzk092GE6HTvf7rHt
 I6QX/UmJgKfY8HtLz8UJRRwYqenU3H2C8vJNgi1Xkcq3tyCL4VHeoKkgfI4NHGiZGjV3i+PtPB5
 hNJ5EPn9qzDlgvYjEsS2XcME1P5A3dLHYcsYILB+zONveC23Vn+qUnHDrQ7hoqoD0ff0WzJPpR3
 vTD+BPfbOjw0MS9y8r/r5uZVRaGnmWhv0Qyaa9XlqWZohh/gdihrwI03LP3TCJNVYE0u9fyYzwo
 r65sMwSOfbSWB8Q7ialM3hQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_135200_485134_88A01650 
X-CRM114-Status: GOOD (  10.96  )
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


