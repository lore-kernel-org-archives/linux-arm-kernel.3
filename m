Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BBA1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 16:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oUEICyFd9hJYgIsWkM2wHAP6nZzNUjjiPvGzBgziImE=; b=RFObNGIw8YgNw/EgyBvwr3O6ku
	pekTtEbFaKIDiC3VyePQGgKtHrAun/hRO2qaF643s2Qlxolbx5hbQh1Yz3LAntSeCQM457LToBQnu
	e8SFbywbxlOo0lrEPMBQYAYl/sSTz9jZogiWftw2q/66M9DXQugHtIXzfEpheD448/tO190u+r55Z
	9n1mK8m9n1hTbBw2uXcDz1/G7CJifQjgD0c838KwcOCHIWlFJr+e8qKd/8diCoX518iRQwPPyPXpj
	O4jYAMZreeYK7RNvxiOxk5eGeSBYDbABoZqAz4uHd/wMQgv3azVhP+VPA+3F9iflvXl3RaPlGJUL3
	p1iPTiew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiEO9-00000005Ljr-2ZsY;
	Fri, 10 Jul 2026 16:47:45 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiEMz-00000005JKd-10Cn;
	Fri, 10 Jul 2026 16:46:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783701979;
	bh=aRNyF5ZgT3ELVnwnJ04Ch6r5ROTXt3cZMDpGpyjmEhI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lPP5WUUsrDHi7Klpe2908Nyd+VJXf0RbF+KlpqU8zkXvdY9evMHaiWxL8B4yqd7dF
	 oLfzMfdKTJ65udiGiiWi/WGAL4rH/NRz6ykLgTVI3EVuHJp3bZ13DEWWftiIoRNukx
	 gFKqY6zLbE7h5IaEbHFLCLGDrxIKVLIzP/RjHBBUG0qJhASG++2suRhl3DFtWnS06H
	 /z/ycoGUc72uhfbzVy7Kpi1ocViqEPS31Ulrke7xmg+mYL6EWbGuz34AP8I/7h/ViB
	 u+VvTSevsthlQHo0wTcCNt4n8j4wH9MwAcskJ+hHIc7Uho4amPnePWS8mCQmLvX6wD
	 eC0wkWDAZp5aA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 605FC17E14FF;
	Fri, 10 Jul 2026 18:46:19 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 1CDD848007A; Fri, 10 Jul 2026 18:46:18 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 10 Jul 2026 18:45:13 +0200
Subject: [PATCH v12 35/36] phy: rockchip: usbdp: Re-init PHY on mux change
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-rockchip-usbdp-cleanup-v12-35-8b41a9a9bef0@collabora.com>
References: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
In-Reply-To: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1050;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=aRNyF5ZgT3ELVnwnJ04Ch6r5ROTXt3cZMDpGpyjmEhI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpRIdm/jOxfigNEXufnrbggr0FCIoTbmPCTU
 vEbjNG5z7TXxIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqUSHZAAoJENju1/PI
 O/qayBIP/RUCLauo0/EL3CXXSla3CKn3WpH9RfXns1tcCIyfmUYM64m1a0dZWLDl3L6j5i6K6oj
 PAfi2bk5jWaCfCnlN3A03Lwwdy1Nq1VdOpV/htck3jM75IpOWpz6mLYbRjMzFSCJQpVepYKPy/b
 Zvq01Smrv2z8ZUnUrwH5LNmxFeHPjwkc/8W4PC0Y/fdg2bnaU8jmLv2FmY1xOwHIHPHZjviX89w
 PsfFAVYzoKjX1VYdmxeJzVmYK3nNNwlrnby6DG/ncHrhnQkKcaa53LGx1SP/sGmw7xmrv7jg0oE
 2eQS80BFU5STVVjBXP19kqdnaizyFjVXYe/DnrUm6l0H3mWBe4T7ndNqRsgVqCzF1PnLTqWHh4D
 F067ZaB3Fz2XgkYmrFmlCD15JY/HmHoozwsWAblZfCVXv1fbm1DXXxW2E71BCZAURGRkmVpH1xp
 +r0KMyQToZ0JXc1Uhnq/nQufGyNWPJOHioNU9k+737UAv8h8QUReoIBwpY3LrOiAN249A7wqEYh
 iA8O8f8IM42QDeVuGIduxb2vNsbbs70Q1tptx/9UKie7edWF6dRsN92hBuZ+tY0FXQZ21IsjZ8r
 tpLwBaa1Jg2F+dpAJVxOSloa2HfuINdjPSLykUNBHIAiIhRjVnQOt6k+R9+yWvlSMt5bOkdMACj
 WerrZe8bLqrq3cpeU8QI7Cw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_094633_487267_F8CAA489 
X-CRM114-Status: GOOD (  12.92  )
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

Ensure that the right part of the PHY are powered up when the
mode changes. This ensures the PHY is re-initialized in the
following two scenarios, which are currently broken:

 - cable orientation changes without DP being involved
 - switching from DP-only into a mode with USB support

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index c5ad300620a6..ecf0ed0139f6 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1383,7 +1383,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 
 	rk_udphy_set_typec_state(udphy, state->mode);
 
-	return 0;
+	return rk_udphy_update_power_state(udphy);
 }
 
 static void rk_udphy_typec_mux_unregister(void *data)

-- 
2.53.0


