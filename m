Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3BAEC4450C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 19:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AjjxI9FLTDh0hcZV/8jaLFol26sz2jvRRKSz+sxvK+c=; b=S58tMfyilpEHvxa3Ax9tBgkioZ
	y5e+5jNytbEzGH93ilsBx+r4Qz+NInePDWYNjsNm/HNV5KqBh9IWwRftsX6/iFngI2KhHcrwwU8uh
	ljPbXCfVByZVfqVGogLdBFIp00unBkI16YvxeFxa0HuQLEz980X+0w4GsheQyCGG2UqIQujuok2tI
	m9156NllSnxc1mopXK0a60TD5oGJ0z2OTk3OluhluZ9ktE52n6yxpPOU55BHN5WS+0EvgI95t03yG
	FvULIZddLZLQgSP8tynOoaZJqD+uneWDQ1SQTjyyBVaqN1vk9qjUbMOcgnDqc/GBxYGaHAl2Ch52r
	rI0sSOSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjimD-0000000D3Pf-0lxJ;
	Tue, 14 Jul 2026 19:26:45 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjilo-0000000D2pI-2C5C;
	Tue, 14 Jul 2026 19:26:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784057169;
	bh=MGpikBa/aaqvkv65oP/N23ryrQe5o83Pvtc6osrktIs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Xuju2WywpFtui/Z2oN2alMAQa34o5piASKxOQflLVuMm4btZz5hgo5LsXLN7hQPic
	 rGDebKq/3XHdlOMDj67RXV7o7QchCiWQ+o33xG0btMhtWt0oEhRHHdkpPjPlHOy2IE
	 GAD5ZcGby6L8byqJ9j8yQtS5sKm/HFCF9akapjS57YzG3pp1QPjy2yBBKyEckcU+WS
	 NeuryE90UpVEIoDMrFbw58fRrOQYqnGqJpZxKX3Xi4OmrVAwPpngG6sOPBR+Dx15RZ
	 F+Hqyh+enA7uOvVlnUEch3DRaH4mJ9yChIBCBOpMErrkQamlPYkBCbhn2X2FciHHzh
	 /Ad0wstgecMNw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8609617E0FC9;
	Tue, 14 Jul 2026 21:26:09 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id DA28348003D; Tue, 14 Jul 2026 21:26:08 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 14 Jul 2026 21:26:10 +0200
Subject: [PATCH v13 09/35] phy: rockchip: usbdp: Fix LFPS detect threshold
 control
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-rockchip-usbdp-cleanup-v13-9-6cb3e769d4c5@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 William Wu <william.wu@rock-chips.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1521;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=6XR1qE8oQQO8DmAkgt9+gIoazIh1eRLq97pcAr0j0tg=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpWjU9kvXXCFcWCsGLP/icPkll7F0LFFXimL
 aWpjzH3VER5wIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqVo1PAAoJENju1/PI
 O/qaSpAP/RB3hJESZ+hiCzmQA5DrQM0y68edl734dfmkOatL/AFakFFDU0pxs2sG8YyHte17fBC
 oWw75hbXztb+db7z53HsZQ4F87sfqviKmc0DhSG5ubVZRVI8CHQSr+BMWDAfRd+kgLfktxHxgo1
 ZkYrNDiZoX5Or6L1ehiuE5nBBDRsqz1T8cc7fgppH8TqLgrZgr/s5ZkOYNh3VH2Mi4lpqm+Qimo
 +JOONf4Dq23CYskYAQkLSbaT6EJvnzyzZHhzV7oe9tkW19bYQQuxwTcxnXi+2XZma4KW+9X+4oD
 8Cg9VZ+9zaffQfghI/86qMm3PzY1Kspmq/c4AvCsAEgcAkU8hWlNRNCsiIZptq53pY/4ZMZLXRE
 X7vjsw2j5GW1oYYZafdwySKowuAMiyn5IP5YK2cNu0k3Dhcx5LWENC6kOTUIh9dqpl0yml59SJg
 8kjO0bct7MIkVf9u4skfyz1mUlRDF0Iqg+KSAiPrkGuvHz6hxIhAGF/1Rtqzcb2mM/IxGrXMLue
 bcPVyBezyfNrgd+51MStCp4jGkPQmKaLVPAeCp5pXIkrO3oWuKi49LTvpgxfwQpP4eXbQ67dtLH
 oEx66AKQTcpP0atmzwEuKnXJt7XRpKENg06cnddnNLqx3DS7DqJhjqOXY6iXnKmfMoRDapum6YC
 FgjX0wEXCVtkSo0SF9oAtNw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_122620_741790_0747106E 
X-CRM114-Status: GOOD (  11.05  )
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


